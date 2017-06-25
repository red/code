Red/System [
	Title:	"Stream IO - raw data reader/writer"
	Author: "Oldes"
	File: 	%Stream-IO-read.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#define SIO_ASSERT_IN_SPACE(bytes) [
	if in/tail < (in/pos + bytes) [
		if not realloc-buffer in as integer! (in/pos + bytes - in/head) [
			print-line "FAILED TO REALLOCATE INPUT BUFFER"
			quit 1
		]
	]
]

in:  declare sio-buffer!

init-in-from-file: func[
	file [integer!]
	return: [integer!]
	/local 
		size [integer!]
][
	if file = 0 [print-line "invalid file" return -2]
	size: simple-io/file-size? file
	if size > as integer! (in/end - in/head) [
		alloc-buffer in size 
	]
	in/pos: in/head
	in/tail: in/head + size
	simple-io/read-data file in/pos size
]

readBitAlign: func[][ in/bit-mask: 0 ]

readUI8: func[return: [integer!] /local i [integer!]][
	SIO_ASSERT_IN_SPACE(1)
	i: as integer! in/pos/1
	in/pos: in/pos + 1
	i
]
readUI16: func[return: [integer!] /local i [integer!]][
	SIO_ASSERT_IN_SPACE(2)
	i: (as integer! in/pos/1) + ((as integer! in/pos/2) << 8)
	in/pos: in/pos + 2
	i
]
readUI16be: func[return: [integer!] /local i [integer!]][
	SIO_ASSERT_IN_SPACE(2)
	i: (as integer! in/pos/2) + ((as integer! in/pos/1) << 8)
	in/pos: in/pos + 2
	i
]
readUI32: func[return: [integer!] /local p [int-ptr!]][
	SIO_ASSERT_IN_SPACE(4)
	p: as int-ptr! in/pos
	in/pos: in/pos + 4
	p/value
]
readSI8: func[return: [integer!] /local i [integer!]][
	SIO_ASSERT_IN_SPACE(1)
	i: as integer! in/pos/1
	in/pos: in/pos + 1
	if i > 127 [ i: (i and 127) - 128 ]
	i
]
readSI16: func[return: [integer!] /local i [integer!]][
	SIO_ASSERT_IN_SPACE(2)
	i: (as integer! in/pos/1) + ((as integer! in/pos/2) << 8)
	in/pos: in/pos + 2
	if i > 32767 [ i: (i and 32767) - 32768 ]
	i
]
readSI24: func[return: [integer!] /local i [integer!]][
	SIO_ASSERT_IN_SPACE(3)
	i: (as integer! in/pos/1) + ((as integer! in/pos/2) << 8) + ((as integer! in/pos/3) << 16)
	in/pos: in/pos + 3
	if i > 8388607 [ i: (i and 8388607) - 8388608 ]
	i
]
readUI30: func[return: [integer!] /local i [integer!] r [integer!] s [integer!]][
	i: as integer! in/pos/1
	in/pos: in/pos + 1
	if i < 128 [return i]
	r: i and 127
	s: 7
	while [in/pos < in/tail][
		i: as integer! in/pos/1
		in/pos: in/pos + 1
		r: r + (i << 7)
		if 128 > i [return r]
		s: s + 1
	]
	r
]
readU32: func[return: [integer!] /local i [integer!] r [integer!] s [integer!]][
	i: as integer! in/pos/1  in/pos: in/pos + 1
	if i < 128   [return i]
	r: i

	i: as integer! in/pos/1  in/pos: in/pos + 1
	r: (r and 127) or ( i << 7 )
	if r < 16384 [return r]
	
	i: as integer! in/pos/1  in/pos: in/pos + 1
	r: (r and 16383) or ( i << 14 )
	if r < 2097152 [return r]
	
	i: as integer! in/pos/1  in/pos: in/pos + 1
	r: (r and 2097151) or ( i << 21 )
	if r < 268435456 [return r]

	i: as integer! in/pos/1  in/pos: in/pos + 1
	r: (r and 268435455) or ( i << 28 )
	r
]
readS32: func[return: [integer!] /local r [integer!] b [integer!]][
	r: as integer! in/pos/1  in/pos: in/pos + 1
	if r < 128   [return r]
	
	b: as integer! in/pos/1  in/pos: in/pos + 1
	r: (r and 127) or ( b << 7 )
	if r < 16384 [return 2 * r]
	
	b: as integer! in/pos/1  in/pos: in/pos + 1
	r: (r and 16383) or ( b << 14 )
	if r < 2097152 [return 2 * r]
	
	b: as integer! in/pos/1  in/pos: in/pos + 1
	r: (r and 2097151) or ( b << 21 )
	if r < 268435456 [return 2 * r]

	b: as integer! in/pos/1  in/pos: in/pos + 1
	r: (r and 268435455) or ( b << 28 )
	2 * r
]

readFloat32: func[return: [float32!] /local p [pointer! [float32!]]][
	SIO_ASSERT_IN_SPACE(4)
	p: as pointer! [float32!] in/pos
	in/pos: in/pos + 4
	p/value
]
readFloat64: func[return: [float!] /local p [pointer! [float!]]][
	SIO_ASSERT_IN_SPACE(8)
	p: as pointer! [float!] in/pos
	in/pos: in/pos + 8
	p/value
]

readBit: func[return: [logic!] /local b [logic!]][
	if 0 = in/bit-mask [
		in/bit-buffer: as integer! in/pos/1
		in/bit-mask: 80h
		in/pos: in/pos + 1
	]
	b: ((in/bit-buffer and in/bit-mask) = in/bit-mask)
	;print-line ["readBit: " in/bit-buffer " " in/bit-mask " " b]
	in/bit-mask: in/bit-mask >> 1
	b
]

readSB: func[nbits [integer!] return: [integer!] /local i [integer!] m [integer!]][
	if nbits = 0 [return 0]
	m: 1 << (nbits - 1)
	either true = readBit [
		i: FFFFFFFFh
		while [m > 1][
			;print-line ["readSB " m " " i]
			m:  m >> 1
			if false = readBit [i: i xor m]
		]
	][
		i: 0
		while [m > 1][
			;print-line ["readSB " m " " i]
			m:  m >> 1
			if true = readBit [i: i or m]
		]
	]
	i
]
readUB: func[nbits [integer!] return: [integer!] /local i [integer!] m [integer!]][
	if nbits = 0 [return 0]
	i: 0
	m: 1 << nbits
	while [m > 1][
		m:  m >> 1
		if true = readBit [i: i or m]
		;m:  m >> 1
	]
	i
]
readFB: func[nbits [integer!] return: [float!]][
	(as float! readSB 18) / 65536.0
]
readULongFixed: func[return: [float!] /local f [float!]][
	f: as float! readUI16
	while [f > 1.0][f: f * 0.1]
	f + as float! readUI16
]
readSLongFixed: func[return: [float!] /local f [float!] g [float!]][
	f: as float! readUI16
	while [f > 1.0][f: f * 0.1]
	g: as float! readSI16
	either g < 0.0 [g - f][g + f]
]
readSShortFixed: func[return: [float!] /local f [float!] g [float!]][
	f: as float! readUI8
	while [f > 1.0][f: f * 0.1]
	g: as float! readSI8
	either g < 0.0 [g - f][g + f]
]

readPair: func[
	return: [sio-decimal-pair!]
	/local 
		nbits [integer!]
		p     [sio-decimal-pair!]
][
	nbits: readUB 5
	p: declare sio-decimal-pair!
	p/x:  readFB nbits
	p/y:  readFB nbits
	p
]

readMatrix: func[
	return: [sio-decimal-matrix!]
	/local 
		m   [sio-decimal-matrix!]
][
	m: declare sio-decimal-matrix!
	readMatrixTo m
	m
]
readMatrixTo: func[
	m [sio-decimal-matrix!]
	return: [sio-decimal-matrix!]
	/local 
		nbits [integer!]
][
	in/bit-mask: 0 ;byte align
	either readBit [ ;HasScale
		nbits: readUB 5
		m/ScaleX: readFB nbits
		m/ScaleY: readFB nbits
	][
		m/ScaleX: 1.0
		m/ScaleY: 1.0
	]
	either readBit [ ;HasRotate
		nbits: readUB 5
		m/RotateSkew0: readFB nbits
		m/RotateSkew1: readFB nbits
	][
		m/RotateSkew0: 0.0
		m/RotateSkew1: 0.0
	]
	nbits: readUB 5
	m/TranslateX: readFB nbits
	m/TranslateY: readFB nbits
	m
]

readCXFORM: func[
	return: [sio-cxform!]
	/local 
		c     [sio-cxform!]
][
	c: declare sio-cxform!
	readCXFORMTo c
	c
]

readCXFORMTo: func[
	c [sio-cxform!]
	return: [sio-cxform!]
	/local HasAddTerms? HasMultTerms? nbits
][
	HasAddTerms?:  readBit
	HasMultTerms?: readBit
	nbits: readUB 4
	either HasMultTerms? [
		c/RMult: readSB nbits
		c/GMult: readSB nbits
		c/BMult: readSB nbits
	][
		c/RMult: 256
		c/GMult: 256
		c/BMult: 256
	]
	either HasAddTerms? [
		c/RAdd: readSB nbits
		c/GAdd: readSB nbits
		c/BAdd: readSB nbits
	][
		c/RAdd: 0
		c/GAdd: 0
		c/BAdd: 0
	]
	in/bit-mask: 0 ;byte align
	c
]

readCount: func[
	return: [integer!]
	/local i [integer!]
][
	i: readUI8
	either 255 = i [readUI16][i]
]

readString: func[
	return: [c-string!]
	/local str [c-string!]
][
	str: as c-string! in/pos
	in/pos: (memchr in/pos #"^@" as-integer (in/end - in/pos)) + 1
	str
]