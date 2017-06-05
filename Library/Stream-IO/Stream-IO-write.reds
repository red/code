Red/System [
	Title:	"Stream IO - raw data reader/writer"
	Author: "Oldes"
	File: 	%Stream-IO-write.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#define SIO_ASSERT_OUT_SPACE(bytes) [
	if out/end < (out/pos + bytes) [
		realloc-buffer out as integer! (out/pos + bytes - out/head)
	]
]

out: declare sio-buffer!

alloc-buffer out 255


writeUI8: func[i [integer!] return: [integer!]][
	SIO_ASSERT_OUT_SPACE(1)
	out/pos/1: as byte! i and FFh
	out/pos: out/pos + 1
	1
]
writeUI16: func[i [integer!] return: [integer!]][
	SIO_ASSERT_OUT_SPACE(2)
	out/pos/1: as byte! i and FFh
	out/pos/2: as byte! i >> 8 and FFh
	out/pos: out/pos + 2
	2
]
writeUI32: func[i [integer!] return: [integer!] /local p [int-ptr!]][
	SIO_ASSERT_OUT_SPACE(4)
	p: as int-ptr! out/pos
	p/value:  i
	out/pos: out/pos + 4
	4
]
writeUI30: func[i [integer!] return: [integer!] /local n [integer!]][
	SIO_ASSERT_OUT_SPACE(5)
	case [
		i < 80h [
			out/pos/1: as byte! i
			n: 1
		]
		i < 4000h [
			i: i or 8000h
			out/pos/1: as byte! (i >> 8) and FFh
			out/pos/2: as byte! i and FFh
			n: 2
		]
		i < 00200000h [
			i: i or 00C00000h
			out/pos/1: as byte! (i >> 16) and FFh
			out/pos/2: as byte! (i >> 8) and FFh
			out/pos/3: as byte! i and FFh
			n: 3
		]
		i < 10000000h [
			i: i or E0000000h
			out/pos/1: as byte! (i >> 24) and FFh
			out/pos/2: as byte! (i >> 16) and FFh
			out/pos/3: as byte! (i >> 8) and FFh
			out/pos/4: as byte! i and FFh
			n: 4
		]
		true [
			out/pos/1: as byte! F0h
			out/pos/2: as byte! (i >> 24) and FFh
			out/pos/3: as byte! (i >> 16) and FFh
			out/pos/4: as byte! (i >> 8) and FFh
			out/pos/5: as byte! i and FFh
			n: 5
		]
	]
	out/pos: out/pos + n
	n
]

writeBytes: func[bytes [byte-ptr!] size [integer!] return: [integer!]][
	SIO_ASSERT_OUT_SPACE(size)
	copy-memory out/pos bytes size
	out/pos: out/pos + size
	size
]

writeFloat32: func[f [float32!] return: [integer!] /local p [pointer! [float32!]]][
	SIO_ASSERT_OUT_SPACE(4)
	p: as pointer! [float32!] out/pos
	p/value: f
	out/pos: out/pos + 4
	4
]
writeFloat64: func[f [float!] return: [integer!] /local p [pointer! [float!]]][
	SIO_ASSERT_OUT_SPACE(8)
	p: as pointer! [float!] out/pos
	p/value: f
	out/pos: out/pos + 8
	8
]
writeBit: func[bit [logic!]][
	;print-line ["writeBit " bit " " out/bit-mask " " out/bit-buffer]
	if 0 = out/bit-mask [
		out/bit-buffer: 0
		out/bit-mask: 80h
	]
	if bit = true [
		out/bit-buffer: out/bit-buffer or out/bit-mask
	]
	
	out/bit-mask: out/bit-mask >> 1
	if out/bit-mask = 0 [
		;print-line ["store1: " out/bit-mask " " out/bit-buffer]
		out/pos/1: as byte! out/bit-buffer
		out/pos: out/pos + 1
	]
]
writeBitAlign: func[][
	;print-line ["writeBitAlign: " out/bit-mask " " out/bit-buffer]
	if 0 <> out/bit-mask [
		;print-line ["store2: " out/bit-mask " " out/bit-buffer]
		out/pos/1: as byte! out/bit-buffer
		out/pos: out/pos + 1
		out/bit-mask: 0
	]
]
writeSB: func[
	value [integer!]
	nBits [integer!]
	/local
		bitsNeeded [integer!]
][
	;print-line ["writeSB: " value " " nbits]
	bitsNeeded: getSBitsLength value
	;print-line ["bitsNeeded: " bitsNeeded]
	if nBits < bitsNeeded [
		print-line ["IO: At least "  bitsNeeded " bits needed for representation of " value " (writeSB)"]
		exit
	]
	writeUB value nBits
]
writeUB: func [
	value [integer!]
	nBits [integer!]
	/local m [integer!]
][
	;print-line ["writeInteger " value]
	m: 1 << nbits
	while [m > 1][
		m: m >> 1
		writeBit (value and m) = m
	]
]
writeFB: func[
	value [float!]
	nBits [integer!]
][
	writeSB as integer! (value * 65536.0) nBits
]
writeCount: func[
	value [integer!]
][
	either value < 255 [
		writeUI8 value
	][
		writeUI8 FFh
		writeUI16 value
	]
]
writeString: func[
	value [c-string!]
	/local bytes
][
	writeBitAlign
	bytes: 1 + length? value
	SIO_ASSERT_OUT_SPACE(bytes)
	copy-memory out/pos as byte-ptr! value bytes
	out/pos: out/pos + bytes
]