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
		if not realloc-buffer out as integer! (out/pos + bytes - out/head) [
			print-line "FAILED TO REALLOCATE OUTPUT BUFFER"
			quit 1
		]
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

writeFormated: func[
	[typed]	count [integer!] list [typed-value!]
	/local 
		fp		 [typed-float!]
		fp32	 [typed-float32!]
		s		 [c-string!]
		i        [integer!]
		f        [float!]
		e?
][
	until [
		switch list/type [
			type-logic!	   [
				writeString either as-logic list/value ["true"]["false"]
				out/pos: out/pos - 1 ;not including NULL char from the c-string
				i: 0
			]
			type-integer!  [
				SIO_ASSERT_OUT_SPACE(16) ;should be large enough for 32bit int
				i: sprintf [out/pos "%i" list/value]
			]
			type-float!    [
				SIO_ASSERT_OUT_SPACE(24)
				fp: as typed-float! list
				f: as float! fp/value
				either f - (floor f) = 0.0 [
					i: sprintf [out/pos "%g.0" f]
					if i > 0 [
						e?: no
						while [out/pos/1 <> null-byte][
							if out/pos/1 = #"e" [e?: yes]
							out/pos: out/pos + 1
						]
						if e? [out/pos: out/pos - 2 out/pos/1: null-byte]
					]
					i: 0
				][
					i: sprintf [out/pos "%.16g" f]
				]
			]
			type-float32!  [
				SIO_ASSERT_OUT_SPACE(24)
				fp32: as typed-float32! list
				f: as float! fp32/value
				either f - (floor f) = 0.0 [
					i: sprintf [out/pos "%g.0" f]
				][
					i: sprintf [out/pos "%.7g" f]
				]
			]
			type-byte!     [
				SIO_ASSERT_OUT_SPACE(1)
				out/pos/1: as-byte list/value
				i: 1
			]
			type-c-string! [
				s: as-c-string list/value
				i: length? s
				SIO_ASSERT_OUT_SPACE(i)
				copy-memory out/pos as byte-ptr! s i
			]
			default 	   [
				SIO_ASSERT_OUT_SPACE(9)
				i: sprintf [out/pos "%08Xh" list/value]
			]
		]
		if i > 0 [out/pos: out/pos + i]
		count: count - 1
		list: list + 1
		zero? count
	]
]

writePaddingTo: func[
	"Writes provided char from current position upto absolute position from the line start"
	char   [byte!]
	column [integer!]
	/local p c i
][
	;search for current column position
	p: out/pos
	i: -1
	while [p > out/head][
		c: p/0
		if any [c = #"^/" c = #"^M"][
			i: as integer! (out/pos - p)
			break
		]
		p: p - 1
	]
	if i < 0 [i: as integer! (out/pos - p)] ;<- no line break was found
	i: either i >= column [
		1 ;<- current position is over required column, still adding at least one char
	][
		column - i ;<-gets number of chars we must write
	] 
	SIO_ASSERT_OUT_SPACE(i)
	set-memory out/pos char i
	out/pos: out/pos + i
]

writeFormatedBinary: func[
	"Writes a byte array as an hex string."
	;-- inspired by Bruno Anselme's bin-to-str function
	address [byte-ptr!] "Memory address where the conversion starts"
	limit   [integer!]  "Number of bytes to convert"
	/local i end byte major minor sp1 sp2
][
	i: (1 + (2 * limit) + (limit // 4))
	SIO_ASSERT_OUT_SPACE(i)
	end: address + limit
	sp1: 0
	sp2: 0
	while [address < end][
		byte: as integer! address/value
		minor: byte // 16
		if minor > 9 [minor: minor + 7]			;-- 7 = (#"A" - 1) - #"9"
		byte: byte >>> 4
		major: byte // 16
		if major > 9 [major: major + 7]			;-- 7 = (#"A" - 1) - #"9"

		out/pos/1: #"0" + major
		out/pos/2: #"0" + minor
		out/pos: out/pos + 2

		sp1: sp1 + 1
		if sp1 = 4 [
			sp1: 0
			sp2: sp2 + 1
			either sp2 = 4 [
				sp2: 0
				out/pos/1: #"^/"
			][	out/pos/1: #" " ]
			out/pos: out/pos + 1
		]

		address: address + 1
	]
]