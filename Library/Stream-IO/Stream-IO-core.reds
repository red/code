Red/System [
	Title:	"Stream IO - raw data reader/writer"
	Author: "Oldes"
	File: 	%Stream-IO-core.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#if red-pass? = no [
	;No Red runtime embedded, so import stand alone dependencies
	#include %simple-io-minimal.reds
]

sio-decimal-pair!: alias struct! [
	x [float!]
	y [float!]
]

sio-buffer!: alias struct! [
	pos   [byte-ptr!]
	head  [byte-ptr!]
	tail  [byte-ptr!]
	end   [byte-ptr!]
	bit-buffer [integer!]
	bit-mask   [integer!]
]

alloc-buffer: func[
	buffer [sio-buffer!]
	size   [integer!]
	return: [sio-buffer!]
][
	free buffer/head
	buffer/pos: allocate size
	buffer/head: buffer/pos
	buffer/tail: buffer/pos
	buffer/end: buffer/pos + size
	buffer/bit-buffer: 0
	buffer/bit-mask:   0
	buffer
]

getSBitsLength: func[
	"Returns number of bits needed to store signed integer value"
	value [integer!] ;"Signed integer"
	return: [integer!]
][
	if value = 0 [return 0]
	if value < 0 [value: 0 - value]
	2 + as integer! (log-2 as float! value) / 0.6931471805599453
]
getUBitsLength: func[
	"Returns number of bits needed to store unsigned integer value"
	value [integer!] "unsigned integer"
	return: [integer!]
][
	if value = 0 [return 0]
	if value < 0 [value: 0 - value]
	1 + as integer! (log-2 as float! value) / 0.6931471805599453
]
