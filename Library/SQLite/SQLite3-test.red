Red [
	Title:   "Red SQLite3 binding test"
	Author:  "Oldes"
	File: 	 %SQLite3-test.red
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %SQLite3.red

result: make block! 32 ;preallocating block for results

SQLite/do [
	db1: open %test.db
	trace 3 ;0 = nothing, 0Fh = trace everything, 3 = SQLITE_TRACE_STMT or SQLITE_TRACE_PROFILE
	db2: open %test2.db	trace 0Fh ;opening second db just for test purposes
	use   :db1 ;this is just a test if the "current db" is not corrupted...
	close :db2 ;... by closing another db
	exec {
BEGIN TRANSACTION;
DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars(Id INTEGER PRIMARY KEY, Name TEXT, Price INTEGER);
INSERT INTO "Cars" VALUES(1,'Audi',52642);
INSERT INTO "Cars" VALUES(2,'Mercedes',57127);
INSERT INTO "Cars" VALUES(3,'Skoda',9000);
INSERT INTO "Cars" VALUES(4,'Volvo',29000);
INSERT INTO "Cars" VALUES(5,'Bentley',350000);
INSERT INTO "Cars" VALUES(6,'Citroen',21000);
INSERT INTO "Cars" VALUES(7,'Hummer',41400);
COMMIT;
}
	exec {INSERT INTO "Cars" VALUES(null,'Hummer',null);}
	exec "SELECT last_insert_rowid();"
	exec "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"
	result: exec "SELECT * FROM Cars ORDER BY name"
]

print ["^/Raw data result:" mold result lf]


print "  ID | NAME     | PRICE"
print " ########################"
foreach [row id name price] result [
	print [
		#" "
		pad id   2 #"|"
		pad name 8 #"|"
		price
	]
]

;`exec` command appends data into given block, so we clear old data now:
clear result 

;just a test to show that multiple execs appends data into result:
SQLite/do [
	result: exec "SELECT random();"
	result: exec "SELECT hex(randomblob(16));"
]

print ["^/Raw data result:" mold result lf]
print rejoin ["Random number: " result/2 " blob: #{" result/4 #"}"]

;it is also possible to use just:
print ["^/Tables:" mold SQLite/query "SELECT name FROM sqlite_master WHERE type='table' ORDER BY name"]

SQLite/free ;closes all opened DBs and frees SQLite resources

