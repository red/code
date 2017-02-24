Red [
	Title:  "Bass audio library high-level interface"
	Author: "Oldes"
	File: 	 %Bass.red
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]
#system [
	#include %bass.reds

	#define TRACE(value) [
		;print-line value ;only for debugging purposes
	]

	bass: context [

		_set-word: declare red-word! 0
		_set-word/index: -1
		_initialized: false

		set-handle: func [
			type    [integer!]
			value   [integer!]
			return: [red-integer!]
			/local
				val [red-value!]
				int [red-integer!]
		][
			val: _context/get _set-word
			int: as red-integer! val
			int/header: TYPE_INTEGER
			int/value: value
			int/_pad: type ;-- storing handle type in unused integer! slot value
			int
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

		get-error-str: func[
			code    [integer!]
			return: [c-string!]
			/local
				msg [c-string!]
		][
			switch code [
				BASS_ERROR_MEM		[msg: "memory error"]
				BASS_ERROR_FILEOPEN	[msg: "can't open the file"]
				BASS_ERROR_DRIVER	[msg: "can't find a free/valid driver"]
				BASS_ERROR_BUFLOST	[msg: "the sample buffer was lost"]
				BASS_ERROR_HANDLE	[msg: "invalid handle"]
				BASS_ERROR_FORMAT	[msg: "unsupported sample format"]
				BASS_ERROR_POSITION	[msg: "invalid position"]
				BASS_ERROR_INIT		[msg: "BASS_Init has not been successfully called"]
				BASS_ERROR_START	[msg: "BASS_Start has not been successfully called"]
				BASS_ERROR_SSL		[msg: "SSL/HTTPS support isn't available"]
				BASS_ERROR_ALREADY	[msg: "already initialized/paused/whatever"]
				BASS_ERROR_NOCHAN	[msg: "can't get a free channel"]
				BASS_ERROR_ILLTYPE	[msg: "an illegal type was specified"]
				BASS_ERROR_ILLPARAM	[msg: "an illegal parameter was specified"]
				BASS_ERROR_NO3D		[msg: "no 3D support"]
				BASS_ERROR_NOEAX	[msg: "no EAX support"]
				BASS_ERROR_DEVICE	[msg: "illegal device number"]
				BASS_ERROR_NOPLAY	[msg: "not playing"]
				BASS_ERROR_FREQ		[msg: "illegal sample rate"]
				BASS_ERROR_NOTFILE	[msg: "the stream is not a file stream"]
				BASS_ERROR_NOHW		[msg: "no hardware voices available"]
				BASS_ERROR_EMPTY	[msg: "the MOD music has no sequence data"]
				BASS_ERROR_NONET	[msg: "no internet connection could be opened"]
				BASS_ERROR_CREATE	[msg: "couldn't create the file"]
				BASS_ERROR_NOFX		[msg: "effects are not available"]
				BASS_ERROR_NOTAVAIL	[msg: "requested data is not available"]
				BASS_ERROR_DECODE	[msg: {the channel is/isn't a "decoding channel}]
				BASS_ERROR_DX		[msg: "a sufficient DirectX version is not installed"]
				BASS_ERROR_TIMEOUT	[msg: "connection timedout"]
				BASS_ERROR_FILEFORM	[msg: "unsupported file format"]
				BASS_ERROR_SPEAKER	[msg: "unavailable speaker"]
				BASS_ERROR_VERSION	[msg: "invalid BASS version (used by add-ons)"]
				BASS_ERROR_CODEC	[msg: "codec is not available/supported"]
				BASS_ERROR_ENDED	[msg: "the channel/file has ended"]
				BASS_ERROR_BUSY		[msg: "the device is busy"]
				default             [msg: "some other mystery problem"]
			]
			msg
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

		#define BASS_FETCH_VALUE(type) [
			cmd: cmd + 1
			if any [cmd >= tail TYPE_OF(cmd) <> type][
				throw-error cmds cmd false
			]
		]
		#define BASS_FETCH_VALUE_2(type1 type2) [
			cmd: cmd + 1
			if any [cmd >= tail all [TYPE_OF(cmd) <> type1 TYPE_OF(cmd) <> type2]][
				throw-error cmds cmd false
			]
		]
		#define BASS_FETCH_OPT_VALUE(type) [
			pos: cmd + 1
			if all [pos < tail TYPE_OF(pos) = type][cmd: pos]
		]
		#define BASS_FETCH_FILE(name) [
			cmd: cmd + 1
			if any [cmd >= tail all [TYPE_OF(cmd) <> TYPE_STRING TYPE_OF(cmd) <> TYPE_FILE]][
				throw-error cmds cmd false
			]
			len: -1
			name: unicode/to-utf8 as red-string! cmd :len
		]
		#define BASS_FETCH_NAMED_VALUE(type) [
			cmd: cmd + 1
			if cmd >= tail [throw-error cmds cmd false]
			value: either TYPE_OF(cmd) = TYPE_WORD [_context/get as red-word! cmd][cmd]
			if TYPE_OF(value) <> type [throw-error cmds cmd false]
		]

		#define AS_INT(value index) [
			get-int as red-integer! value + index
		]


		_Init:           symbol/make "init"
		_End:            symbol/make "end"
		_Load:           symbol/make "load"
		_Play:           symbol/make "play"
		_Pause:          symbol/make "pause"
		_Stop:           symbol/make "stop"
		_Free:           symbol/make "free"
		_Music:          symbol/make "music"

		_Sound!:         symbol/make "sound!"
		_Channel!:       symbol/make "channel!"
		_Music!:         symbol/make "music!"

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
				int       [red-integer!]
				sound     [integer!]
				channel   [integer!]
				music     [integer!]
				i         [integer!]
		][
			cmd:  block/rs-head cmds
			tail: block/rs-tail cmds
			len: -1
			
			while [cmd < tail][
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
							sym = _Load [
								BASS_FETCH_FILE(name)
								if _set-word/index >= 0 [
									sound: BASS_SampleLoad no name 0.0 0 3 BASS_SAMPLE_OVER_POS ;or BASS_SAMPLE_LOOP
									set-handle _Sound! sound     ;@@ use red-handle! instead once available in Red!
								]
								TRACE(["sound: " as byte-ptr! sound])
							]
							sym = _Music [
								BASS_FETCH_FILE(name)
								if _set-word/index >= 0 [
									music: BASS_MusicLoad no name 0.0 0 0 0
									set-handle _Music! music     ;@@ use red-handle! instead once available in Red!
								]
								TRACE(["music: " as byte-ptr! music " " as byte-ptr! int " "int/_pad])
							]
							sym = _Play [
								BASS_FETCH_NAMED_VALUE(TYPE_INTEGER)  ;@@ use TYPE_HANDLE later
								int: as red-integer! value
								sym: int/_pad
								case [
									sym = _Sound! [
										channel: BASS_SampleGetChannel int/value no
										if channel <> 0 [
											BASS_ChannelPlay channel no
											if _set-word/index >= 0 [
												set-handle _Channel! channel     ;@@ use red-handle! instead once available in Red!
											]
											TRACE(["playing channel: " as byte-ptr! channel lf])
										]
									]
									any [sym = _Channel! sym = _Music!][
										BASS_ChannelPlay int/value yes
									]
									true [
										print-line "BASS play expect valid sound, music or channel handle!"
									]
								]
							]
							sym = _Pause [
								BASS_FETCH_NAMED_VALUE(TYPE_INTEGER)  ;@@ use TYPE_HANDLE later
								int: as red-integer! value
								sym: int/_pad
								case [
									any [sym = _Channel! sym = _Music!] [
										BASS_ChannelPause int/value
									]
									true [
										print-line "BASS pause expect valid channel handle!"
									]
								]
							]
							sym = _Stop [
								BASS_FETCH_NAMED_VALUE(TYPE_INTEGER)  ;@@ use TYPE_HANDLE later
								int: as red-integer! value
								sym: int/_pad
								case [
									sym = _Sound! [
										BASS_SampleStop int/value
									]
									any [sym = _Channel! sym = _Music!][
										BASS_ChannelStop int/value
									]
									true [
										print-line "BASS stop expect valid sound or channel handle!"
									]
								]
							]
							sym = _Free [
								BASS_FETCH_NAMED_VALUE(TYPE_INTEGER)  ;@@ use TYPE_HANDLE later
								int: as red-integer! value
								sym: int/_pad
								case [
									sym = _Sound!   [ BASS_SampleFree  int/value  int/value: 0 int/_pad: 0]
									sym = _Music!   [ BASS_MusicFree   int/value  int/value: 0 int/_pad: 0]
									true [
										print-line "BASS play expect valid sound or music handle!"
									]
								]
							]
							sym = _Init [
								BASS_FETCH_VALUE(TYPE_INTEGER)
								BASS_FETCH_VALUE(TYPE_INTEGER)
								BASS_FETCH_VALUE(TYPE_INTEGER)
								if _initialized [BASS_Free]
								_initialized: BASS_Init AS_INT(start 0) AS_INT(start 1) AS_INT(start 2) 0 null
							]
							sym = _End [
								_initialized: not BASS_Free
							]


							true [ throw-error cmds cmd false ]
						]
						_set-word/index: -1
					]
					true [ throw-error cmds cmd false ]
				]
				if BASS_ErrorGetCode > 0 [
					i: BASS_ErrorGetCode
					print-line ["BASS Error [" i "]: " get-error-str i]
				]
				
				cmd: cmd + 1
			]
			as red-value! logic/box true
		]
	]
]

Bass: context [
	init: func [
		"Initializes an output device."
		/device	arg1 [integer!] "The device to use... -1 = default device, 0 = no sound, 1 = first real output device."
		/freq   arg2 [integer!] "Output sample rate."
		/flags  arg3 [integer!]
	][
		bass/do reduce [
			'init
			any [arg1 -1]
			any [arg2 44100]
			any [arg3 0]
		]
	]
	free: func [
		"Frees all resources used by the output device, including all its samples, streams and MOD musics."
	][
		bass/do [end]
	]

	do: routine [
		"Evaluate Bass audio library dialect commands"
		commands [block!]
	][
		bass/do commands
	]
]
