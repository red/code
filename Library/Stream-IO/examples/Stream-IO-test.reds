Red/System [
	Title:	"Stream IO - raw data reader/writer - test"
	Author: "Oldes"
	File: 	%Stream-IO-test.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
	Note: {
		Don't use code like:
			print-line [readString readUI8]
		as "Arguments are pushed in reverse order in the C calling convention for IA-32"
		so the result would not be in correct order.
		Instead use:
			print readString print readUI8
		or something like that!
	}
]

#include %../Stream-IO-core.reds
#include %../Stream-IO-read.reds
#include %../Stream-IO-write.reds

name: #u16 "test-io.bin"
file: simple-io/open-file name 0 true
print-line ["file handle: " as int-ptr! file]

writeBit false
writeBit true
writeBitAlign
writeUI8 1
writeUI16 2
writeUI32 3
writeFloat32 4.5
writeFloat64 6.7
writeUI8 127
writeUI8 129
writeUI8 255
writeSB 42 7
writeSB 43 7
writeBitAlign

writeBit true
writeBit false
writeBit false
writeBit false
writeBit false
writeBit false
writeBit false
writeBit false
writeBitAlign
writeUB FFh 8

writeSB -1 8
writeUB -1 8
writeFB 1.2 18
writeBitAlign
writeString "Hello Red"
writeUI8 10


writeFormated ["Integer: " 42 " float: " 3.14] ;NOTE: writeFormated does not add ending NULL char..
writeFormated [" pos: " (out/pos - out/head) " logic: " true] ;so multiple calls to it will be treated like one c-string!
writeUI8 0 ;closes above formated string as a c-string!

writeString "ending?"

print-line "^/-- end writing --^/"

simple-io/write-data file out/head as integer! (out/pos - out/head)

simple-io/close-file file

in/head: out/head
in/tail: out/end
in/end:  out/end
in/pos: in/head

print-line readUI8
print-line readUI8
print-line readUI16
print-line readUI32
print-line readFloat32
print-line readFloat64
print-line readSI8 ;should be  127
print-line readSI8 ;should be -127
print-line readSI8 ;should be -1
print-line readSB 7
print-line readSB 7
readBitAlign

print-line readUI8
print-line readUB 8

print-line readSB 8
print-line readUB 8
print-line readFB 18

print-line readString ;= Hello Red
print-line readUI8 ;=10

print-line readString ;= Integer: 42 float: 3.14 pos: 00000042h logic: true

print-line readString ;= ending?

print-line "^/-- end reading --^/"