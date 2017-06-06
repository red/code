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

#import [
	LIBC-file cdecl [
		reallocate: "realloc" [
			"Resize and return allocated memory."
			memory			[byte-ptr!]
			size			[integer!]
			return:			[byte-ptr!]
		]
		memchr: "memchr" [					
			"Search for byte in memory range."
			memory			[byte-ptr!]
			byte			[byte!]
			size			[integer!]
			return:			[byte-ptr!]
		]
	]
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
realloc-buffer: func[
	buffer [sio-buffer!]
	size   [integer!]
	return: [sio-buffer!]
	/local
		old-size new-size head new-head ofs-pos ofs-tail ofs-end
][
	head: buffer/head
	old-size: as integer! (buffer/end - head)
	print-line ["REALLOCK " old-size " -> " size] 
	
	ofs-pos: as integer! (buffer/pos - head)
	ofs-tail: as integer! (buffer/tail - head)

	if any [size < ofs-pos size < ofs-tail] [
		print-line "WARNING: trying to reallocate buffer to smaller size than currently used!"
		return buffer
	]

	either size > old-size [
		new-size: either old-size < 16 [16][old-size]
		until [
			new-size: as integer! (1.5 * as float! new-size)
			size <= new-size
		]
	][
		new-size: size
	]

	new-head: reallocate head new-size
	if new-head = NULL [
		print-line ["STREAM-IO: Unable to reallocate buffer to size: " size]
		return buffer ;will probably crash later
	]
	buffer/head: new-head
	;print-line ["REALLOCK " head " -> " buffer/head " size: " new-size]
	buffer/pos: buffer/head + ofs-pos
	buffer/tail: buffer/pos + ofs-tail
	buffer/end:  buffer/head + new-size
	buffer
]

free-buffer: func[
	buffer [sio-buffer!]
][
	free buffer/head
	buffer/head: NULL
	buffer/pos:  NULL
	buffer/tail: NULL
	buffer/end:  NULL
	buffer/bit-buffer: 0
	buffer/bit-mask:   0
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
