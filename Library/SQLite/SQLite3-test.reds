Red/System [
	Title:   "Red/System SQLite3 binding - test file"
	Author:  "Oldes"
	File: 	 %SQLite3-test.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %SQLite3.reds

db:     declare sqlite3!
db-ref: declare sqlite3-ref!
errmsg: declare string-ref!
data:   declare int-ptr!
str:    declare c-string!

status: 0
n:  0
bignum: declare int64!

ptr: declare int-ptr!

#define TEST_ERROR(db sql) [
	if SQLITE_OK <> status [
		print-line ["^/***ERROR: " sqlite3_errmsg db]
		print-line ["In query: " sql] 
	]
]

#define DO_SQL(db sql) [
	data/value: 0
	status: sqlite3_exec db sql :on-row data errmsg
	TEST_ERROR(db sql)
]

on-row: function [[cdecl]
	"Process a result row."
	data		[int-ptr!]
	columns		[integer!]
	values		[string-ref!]
	names		[string-ref!]
	return:		[integer!]
][
	data/value: data/value + 1
	print ["ROW[" data/value "]: "]

	; Print all name/value pairs of the columns that have values

	while [columns > 0] [
		if as-logic values/value [
			print [names/value ": " values/value #"^-"]
		]
		columns: columns - 1
		names: names + 1
		values: values + 1
	]
	print newline

	SQLITE_OK  ; Keep processing
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

print-line ["sqlite3_libversion: " sqlite3_libversion]
print-line ["sqlite3_sourceid: " sqlite3_sourceid]
print-line ["sqlite3_libversion_number: " sqlite3_libversion_number]

status: sqlite3_initialize
either SQLITE_OK <> status [
	print-line ["SQLite init failed with status: " status]
][
	n: 0
	while [
		str: sqlite3_compileoption_get n
		0 < as integer! str 
	][
		print-line [str "^-" sqlite3_compileoption_used str]
		n: n + 1
	]

	status: sqlite3_open "test.db" db-ref
	if SQLITE_OK = status [
		db: db-ref/value
		print-line ["DB: " db]

		sqlite3_trace_v2  db (SQLITE_TRACE_STMT or SQLITE_TRACE_PROFILE) :on-trace null

		DO_SQL(db {
BEGIN TRANSACTION;
DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars(Id INTEGER PRIMARY KEY, Name TEXT, Price INTEGER);
INSERT INTO "Cars" VALUES(1,'Audi',52642);
INSERT INTO "Cars" VALUES(2,'Mercedes',57127);
INSERT INTO "Cars" VALUES(3,'Skoda',9000);
})
		DO_SQL(db {
INSERT INTO "Cars" VALUES(4,'Volvo',29000);
INSERT INTO "Cars" VALUES(5,'Bentley',350000);
INSERT INTO "Cars" VALUES(6,'Citroen',21000);
INSERT INTO "Cars" VALUES(7,'Hummer',41400);
COMMIT;
})
		DO_SQL(db {INSERT INTO "Cars" VALUES(null,'Hummer',41400);})

		print-line ["=== " data/value]

		bignum: sqlite3_last_insert_rowid db
		print-line ["Last insert rowid: " as int-ptr! bignum/hi as int-ptr! bignum/lo " (" bignum/lo #")" ]

		print-line "Setting last insert row id to 42..."
		bignum/lo: 42
		bignum/hi: 0
		sqlite3_set_last_insert_rowid db bignum
		DO_SQL(db "SELECT last_insert_rowid();")

		DO_SQL(db {INSERT INTO "Cars" VALUES(43,'zHummer','100');})
		DO_SQL(db {INSERT INTO "Cars" VALUES(null,'zHummer',0);})
		print-line ["=== " data/value]

		DO_SQL(db "SELECT last_insert_rowid();")

		DO_SQL(db "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name")
		print-line ["=== " data/value]
		DO_SQL(db "SELECT * FROM Cars ORDER BY name")
		print-line ["=== " data/value]

		;test error:
		DO_SQL(db "SELECT * FROM Foo ORDER BY name")
		DO_SQL(db "CREATE TABLE Cars();")

		print-line "^/Formating SQL:"
		str: sqlite3_mprintf ["INSERT INTO table VALUES(%Q, %d)" "Fo'o" 42]
		print-line str

		bignum: sqlite3_memory_used
		print-line ["sqlite3_memory_used: " as int-ptr! bignum/hi as int-ptr! bignum/lo " (" bignum/lo #")" ]

		sqlite3_free as int-ptr! str

		print-line "^/Random test:"
		DO_SQL(db "SELECT random();")
		DO_SQL(db "SELECT hex(randomblob(8));")


		sqlite3_close db
	]

	sqlite3_shutdown
]
