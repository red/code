Red [
	Title:   "Red SQLite3 binding"
	Author:  "Oldes"
	File: 	 %SQLite3.red
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]
#system [
	#include %SQLite3.reds

	#define TRACE(value) [
		print-line value ;only for debugging purposes
	]

	#define SQLITE_MAX_DBS 16


	sqlite: context [
		db-current: declare sqlite3!
		db-ref: declare sqlite3-ref!
		errmsg: declare string-ref!
		data:   declare int-ptr!
		str:    declare c-string!

		_set-word: declare red-word! 0
		_set-word-value: declare red-value! 0
		_set-word/index: -1
		_initialized: false
		_last-handle: declare red-handle! [0 0 0 0]

		dbs-head: as int-ptr! allocate (SQLITE_MAX_DBS * 4)
		dbs-tail: dbs-head + SQLITE_MAX_DBS
		zerofill dbs-head dbs-tail

		close-dbs: func[
			/local
				p [int-ptr!]
		][
			p: dbs-head
			while [p < dbs-tail][
				if p/value <> 0 [
					TRACE(["closing db: " as sqlite3! p/value])
					sqlite3_close as sqlite3! p/value
					p/value: 0
				]
				p: p + 1
			]
		]
		get-db-ptr: func[
			return: [int-ptr!]
			/local
				p [int-ptr!]
		][
			p: dbs-head
			while [p < dbs-tail][
				if p/value = 0 [return p]
				p: p + 1
			]
			null
		]

		on-trace: function [[cdecl]
			"Trace callback"
			type     [integer!]
			context  [int-ptr!] 
			statement[int-ptr!] 
			arg4     [int-ptr!] 
			return: [integer!]
			/local
				bignum [int64!]
				f      [float!]
		][
			print ["TRACE[" type "] "]
			switch type [
				SQLITE_TRACE_STMT [
					print-line ["STMT: " as c-string! arg4]
				]
				SQLITE_TRACE_PROFILE [
					;@@ TODO: change when we will get real integer64! support in Red
					bignum: as int64! arg4
					either bignum/hi = 0 [
						f: (as float! bignum/lo) * 1E-6
						print-line ["PROFILE: " f "ms"]
					][
						print-line ["PROFILE: " as int-ptr! bignum/hi as int-ptr! bignum/lo]
					]
					
				]
				SQLITE_TRACE_ROW [
					print-line "ROW"
				]
				SQLITE_TRACE_CLOSE [
					print-line "CLOSE"
				]
				default [
					print-line "unknown"
				]
			]
			SQLITE_OK
		]

		on-row: function [[cdecl]
			"Process a result row."
			data		[int-ptr!]
			columns		[integer!]
			values		[string-ref!]
			names		[string-ref!]
			return:		[integer!]
		][
			
			print ["ROW[" data/value "]: "]

			; Print all name/value pairs of the columns that have values
			while [columns > 0] [
				either as-logic values/value [
					print [names/value ": " values/value #"^-"]
				][	print [names/value ": NULL^-"]]
				columns: columns - 1
				names: names + 1
				values: values + 1
			]
			print newline

			SQLITE_OK  ; Keep processing
		]
		on-row-collect: function [[cdecl]
			"Process a result row."
			data		[int-ptr!]
			columns		[integer!]
			values		[string-ref!]
			names		[string-ref!]
			return:		[integer!]
			/local
				blk     [red-block!]
				val     [red-value!]
				s       [series!]
		][
			data/value: data/value + 1
			blk: as red-block! _set-word-value
			val: as red-value! integer/make-in blk data/value
			val/header: val/header or flag-new-line

			while [as-logic columns] [
				either as-logic values/value [
					string/load-in 
						values/value
						length? values/value
						blk
						UTF-8
				][	
					none/make-in blk UTF-8
				]
				columns: columns - 1
				names: names + 1
				values: values + 1
			]

			SQLITE_OK  ; Keep processing
		]

		set-handle: func [
			type    [integer!]
			value   [integer!]
			parent  [integer!]
			/local
				val [red-value!]
				hnd [red-handle!]
		][
			if _set-word/index >= 0 [
				val: _context/get _set-word
				hnd: as red-handle! val
				hnd/header: TYPE_HANDLE
				hnd/value: value
				hnd/_pad: type      ;-- storing handle type in unused slot value
				hnd/padding: parent ;-- storing special parent pointer in unused slot
			]
			;-- _last-handle is used to simplify dialect so user don't have to pass the handle value repeatadly
			_last-handle/value: value
			_last-handle/_pad: type 
			_last-handle/padding: parent
		]
		

		throw-error: func [
			cmds   [red-block!]
			cmd    [red-value!]
			catch? [logic!]
			/local
				base   [red-value!]
		][
			base: block/rs-head cmds
			cmds: as red-block! stack/push as red-value! cmds
			cmds/head: (as-integer cmd - base) >> 4
			
			fire [TO_ERROR(script invalid-data) cmds]
		]

		get-int: func [
			int		[red-integer!]
			return: [integer!]
			/local
				f	[red-float!]
				v	[integer!]
		][
			either TYPE_OF(int) = TYPE_FLOAT [
				f: as red-float! int
				v: as integer! f/value
			][
				v: int/value
			]
			v
		]
		to-string: func [
			value [red-value!]
			return: [c-string!]
			/local
				len [integer!]
		] [
			len: -1
			unicode/to-utf8 as red-string! (value) :len
		]

		#define SQLITE_FETCH_VALUE(type) [
			cmd: cmd + 1
			if any [cmd >= tail TYPE_OF(cmd) <> type][
				throw-error cmds cmd false
			]
		]
		#define SQLITE_FETCH_VALUE_2(type1 type2) [
			cmd: cmd + 1
			if any [cmd >= tail all [TYPE_OF(cmd) <> type1 TYPE_OF(cmd) <> type2]][
				throw-error cmds cmd false
			]
		]
		#define SQLITE_FETCH_OPT_VALUE(type) [
			pos: cmd + 1
			if all [pos < tail TYPE_OF(pos) = type][cmd: pos]
		]
		#define SQLITE_FETCH_FILE(name) [
			cmd: cmd + 1
			if any [cmd >= tail all [TYPE_OF(cmd) <> TYPE_STRING TYPE_OF(cmd) <> TYPE_FILE]][
				throw-error cmds cmd false
			]
			len: -1
			name: unicode/to-utf8 as red-string! cmd :len
		]
		#define SQLITE_FETCH_NAMED_VALUE(type) [
			cmd: cmd + 1
			if cmd >= tail [throw-error cmds cmd false]
			value: either TYPE_OF(cmd) = TYPE_WORD [_context/get as red-word! cmd][cmd]
			if TYPE_OF(value) <> type [throw-error cmds cmd false]
		]
		#define SQLITE_FETCH_HANDLE(hnd) [
			cmd: cmd + 1
			if cmd >= tail [throw-error cmds cmd false]
			value: either any [
				TYPE_OF(cmd) = TYPE_WORD
				TYPE_OF(cmd) = TYPE_GET_WORD
			][ _context/get as red-word! cmd ][cmd]
			hnd: either TYPE_OF(value) <> TYPE_HANDLE [
				;throw-error cmds cmd false
				_last-handle
			][
				as red-handle! value
			] 
			type: hnd/_pad
		]
		#define SQLITE_FETCH_DB(db) [
			SQLITE_FETCH_HANDLE(hnd)
			db-ptr: dbs-head + hnd/value
			db: as sqlite3! db-ptr/value
			TRACE(["DB: " hnd/value " " db])
		]
		#define ASSERT_SET(_set-word) [
			if _set-word/index < 0 [
				throw-error cmds cmd false
			]
		]
		
		#define AS_INT(value index) [
			get-int as red-integer! value + index
		]
		
		#define RESET_HANDLE(hnd) [
			hnd/padding: 0
			hnd/value: 0
			hnd/_pad: 0
		]


		_Init:           symbol/make "init"
		_End:            symbol/make "end"
		_Open:           symbol/make "open"
		_Close:          symbol/make "close"
		_Exec:           symbol/make "exec"
		_Use:            symbol/make "use"
		_Trace:          symbol/make "trace"

		_SQLite3-DB!:    symbol/make "SQLite3-DB!"

		do: func[
			cmds [red-block!]
			return: [red-value!]
			/local
				cmd       [red-value!]
				tail      [red-value!]
				start     [red-value!]
				pos		  [red-value!]
				value	  [red-value!]
				word      [red-word!]
				sym       [integer!]
				symb      [red-symbol!]
				str       [red-string!]
				len       [integer!]
				name      [c-string!]
				result    [logic!]
				hnd       [red-handle!]
				i         [integer!]
				status    [integer!]
				db-ptr    [int-ptr!]
				db        [sqlite3!]
				type      [integer!]
				sql       [c-string!]
		][
			cmd:  block/rs-head cmds
			tail: block/rs-tail cmds
			len: -1
			
			while [cmd < tail][
				status: SQLITE_OK
				case [
					TYPE_OF(cmd) = TYPE_SET_WORD [
						_set-word:  as red-word! cmd
					]
					any [ TYPE_OF(cmd) = TYPE_WORD TYPE_OF(cmd) = TYPE_LIT_WORD ][
						start: cmd + 1
						word:  as red-word! cmd
						sym:   symbol/resolve word/symbol
						symb:  symbol/get sym
						TRACE(["--> " symb/cache])
						case [
							sym = _Exec [
								SQLITE_FETCH_NAMED_VALUE(TYPE_STRING)
								sql: to-string value

								data/value: 0
								either _set-word/index < 0 [
									status: sqlite3_exec db-current sql :on-row data errmsg
								][
									_set-word-value: _context/get _set-word
									if TYPE_OF(_set-word-value) <> TYPE_BLOCK [
										block/make-at as red-block! _set-word-value 8
									]
									status: sqlite3_exec db-current sql :on-row-collect data errmsg
								]
							]
							sym = _Open [
								if not _initialized [
									status: sqlite3_initialize
									_initialized: status = SQLITE_OK
								]
								if _initialized [
									db-ptr: get-db-ptr
									i: (as integer! db-ptr - dbs-head) / 4
									either all [i >= 0 i < SQLITE_MAX_DBS][
										ASSERT_SET(_set-word)   ;loading DB without setting it would lead just to memory leak
										SQLITE_FETCH_FILE(name)
										status: sqlite3_open name db-ref
										if status = SQLITE_OK [
											db-current: db-ref/value
											set-handle _SQLite3-DB! i 0
											db-ptr/value: as integer! db-ref/value
											TRACE(["DB: " i " " db-ref/value])
										]
										
									][
										print-line "SQLite Error: Too many opened DBs"
									]
								]	
							]
							sym = _Use [
								SQLITE_FETCH_DB(db)
								db-current: db
							]
							sym = _Close [
								SQLITE_FETCH_DB(db)
								db-ptr/value: 0
								status: sqlite3_close db
							]
							sym = _Init [
								if _initialized [sqlite3_shutdown]
								status: sqlite3_initialize
								_initialized: status = SQLITE_OK
							]
							sym = _End [
								status:  sqlite3_shutdown
								_initialized: false
								close-dbs
								RESET_HANDLE(_last-handle)
							]
							sym = _Trace [
								SQLITE_FETCH_VALUE_2(TYPE_INTEGER TYPE_LOGIC)
								i: AS_INT(start 0)
								print-line i
								sqlite3_trace_v2 db-current AS_INT(start 0) :on-trace null
							]

							true [ throw-error cmds cmd false ]
						]
						_set-word/index: -1
					]
					true [ throw-error cmds cmd false ]
				]
				if status <> SQLITE_OK [
					print-line ["SQLite Error: " sqlite3_errmsg db]
					throw-error cmds cmd false
				]
				
				cmd: cmd + 1
			]
			as red-value! logic/box true
		]
	]
]

SQLite: context [
	output: make block! 16 ;use for temporary outputs
	;NOTE: output is replaced by each query call, so if you need the data later, use `copy`

	init: func [
		"Initializes SQLite"
	][
		sqlite/do [init]
	]
	free: func [
		"Shutdowns SQLite"
	][
		sqlite/do [end]
	]

	do: routine [
		"Evaluate SQLite dialect commands"
		commands [block!]
	][
		sqlite/do commands
	]
	query: func[
		"Executes SQL query"
		sql [string!]
		/into result [block!]
	][
		unless into [result: clear head output]
		do compose [result: exec (sql)]
		result
	]
]
