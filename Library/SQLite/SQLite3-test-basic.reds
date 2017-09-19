Red/System [
	Title:   "Red/System SQLite3 binding - test file - with minimal"
	Purpose: "This test does not use any calls which are in recent SQLite versions"
	Author:  "Oldes"
	File: 	 %SQLite3-test-basic.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %SQLite3.reds

db:     declare sqlite3!
db-ptr: declare sqlite3-ptr!
errmsg: declare string-ptr!
data:   declare int-ptr!
str:    declare c-string!

status: 0

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
	values		[string-ptr!]
	names		[string-ptr!]
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
	data		[int-ptr!]
	name        [c-string!]
][
	print-line ["TRACE[" name "]"]
]


print-line ["sqlite3_libversion: " sqlite3_libversion]
print-line ["sqlite3_sourceid: " sqlite3_sourceid]
print-line ["sqlite3_libversion_number: " sqlite3_libversion_number]

status: sqlite3_initialize
either SQLITE_OK <> status [
	print-line ["SQLite init failed with status: " status]
][
	status: sqlite3_open "test.db" db-ptr
	if SQLITE_OK = status [
		db: db-ptr/value
		print-line ["DB: " db]

		sqlite3_trace  db :on-trace null

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

		DO_SQL(db {INSERT INTO "Cars" VALUES(43,'zHummer','100');})
		DO_SQL(db {INSERT INTO "Cars" VALUES(null,'zHummer',0);})
		print-line ["=== " data/value]

		DO_SQL(db "SELECT last_insert_rowid();")

		DO_SQL(db "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name")
		print-line ["=== " data/value]
		DO_SQL(db "SELECT * FROM Cars ORDER BY name")
		print-line ["=== " data/value]

		print-line "^/Testing errors:"
		DO_SQL(db "SELECT * FROM Foo ORDER BY name")
		DO_SQL(db "CREATE TABLE Cars();")

		print-line "^/^/Formating SQL:"
		str: sqlite3_mprintf ["INSERT INTO table VALUES(%Q, %d)" "Fo'o" 42]
		print-line str

		sqlite3_close db
	]

	sqlite3_shutdown
]
