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
writeString "ending?"
writeUI8 10


print-line "end writing^/"

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

;print-line [readString " " readString readUI8] ;this does not work as expected!
print-line readString ;= Hello Red
print-line readString ;= ending?
print-line readUI8 ;=10


print-line "end reading"