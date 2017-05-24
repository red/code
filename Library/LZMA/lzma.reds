Red/System [
	Title:   "Basic Red/System libLZMA binding"
	Author: "Oldes"
	File: 	%lzma.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
	Comment: {
		This script needs external library, which can be downloaded from this site:
		https://tukaani.org/xz/
		(tested with xz-5.2.3-windows\[bin_i686|bin_i686-sse2]\liblzma.dll)
	}
]

lzma: context [
	uint64!: alias struct! [lo [integer!] hi [integer!]] ;@@ temporary solution!

	memlimit: declare uint64!
	memlimit/lo: 1FFFFFFFh ;536MB default max memory usage

	#switch OS [
		Windows   [ #define liblzma "liblzma.dll" ]
		MacOSX    [ #define liblzma "liblzma.1.dylib" ] ;@@ FIXME: use real file name
		#default  [ #define liblzma "liblzma.so.1" ]    ;@@ FIXME: use real file name
	]

	#define LZMA_PRESET_DEFAULT     6         ;Default compression preset
	#define LZMA_PRESET_EXTREME     80000000h ;Extreme compression preset

	#define LZMA_TELL_NO_CHECK              01h
	#define LZMA_TELL_UNSUPPORTED_CHECK     02h
	#define LZMA_TELL_ANY_CHECK             04h
	#define LZMA_IGNORE_CHECK               10h
	#define LZMA_CONCATENATED               08h


	#enum lzma_check! [
		LZMA_CHECK_NONE:   0  ;Size of the Check field: 0 bytes
		LZMA_CHECK_CRC32:  1  ;Size of the Check field: 4 bytes
		LZMA_CHECK_CRC64:  4  ;Size of the Check field: 8 bytes
		LZMA_CHECK_SHA256: 10 ;Size of the Check field: 32 bytes
	]

	#enum lzma_ret! [
		LZMA_OK
		LZMA_STREAM_END
		LZMA_NO_CHECK
		LZMA_UNSUPPORTED_CHECK
		LZMA_GET_CHECK
		LZMA_MEM_ERROR
		LZMA_MEMLIMIT_ERROR
		LZMA_FORMAT_ERROR
		LZMA_OPTIONS_ERROR
		LZMA_DATA_ERROR
		LZMA_BUF_ERROR
		LZMA_PROG_ERROR
	]

	form-error-msg: func[id [integer!] return: [c-string!]][
		switch id [
			LZMA_STREAM_END     	["End of stream was reached"]
			LZMA_NO_CHECK	        ["Input stream has no integrity check"]
			LZMA_UNSUPPORTED_CHECK	["Cannot calculate the integrity check"]
			LZMA_GET_CHECK	        ["Integrity check type is now available"]
			LZMA_MEM_ERROR	        ["Cannot allocate memory"]
			LZMA_MEMLIMIT_ERROR	    ["Memory usage limit was reached"]
			LZMA_FORMAT_ERROR	    ["File format not recognized"]
			LZMA_OPTIONS_ERROR	    ["Invalid or unsupported options"]
			LZMA_DATA_ERROR	        ["Data is corrupt"]
			LZMA_BUF_ERROR	        ["No progress is possible"]
			LZMA_PROG_ERROR	        ["Programming error"]
			default                 ["Unknown error"]
		]
	]

	lzma_allocator!: alias struct! [
		alloc  [function! [opaque [int-ptr!] nmemb [integer!] size [integer!]] ]
		free   [function! [opaque [int-ptr!] ptr [byte-ptr!]] ]
		opaque [int-ptr!] ;Pointer passed to .alloc() and .free()
	]

	#import [liblzma stdcall [
		version_number: "lzma_version_number" [
			"Run-time version number as an integer"
			return:   [integer!]
		]
		version_string: "lzma_version_string" [
			"Run-time version as a string"
			return: [c-string!]
		]
		easy_buffer_encode: "lzma_easy_buffer_encode" [
			"Single-call .xz Stream encoding using a preset number"
			preset    [integer!]  "Compression preset to use."
			check     [lzma_check!]
			allocator [lzma_allocator!]
			in        [byte-ptr!]
			in-size   [integer!]
			out       [byte-ptr!]
			out-pos   [int-ptr!]
			out-size  [integer!]
			return: [lzma_ret!]
		]
		stream_buffer_bound: "lzma_stream_buffer_bound" [
			"Calculate output buffer size for single-call Stream encoder"
			uncompressed_size [integer!]
			return: [integer!]
		]
		stream_buffer_decode: "lzma_stream_buffer_decode" [
			memlimit  [uint64!]    ;Pointer to how much memory the decoder is allowed to allocate
			flags     [integer!]
			allocator [lzma_allocator!]  ;lzma_allocator for custom allocator functions
			in        [byte-ptr!]        ;Beginning of the input buffer
			in-pos    [int-ptr!]         ;The next byte will be read from
			in-size   [integer!]         ;Size of the input buffer
			out       [byte-ptr!]        ;Beginning of the output buffer
			out-pos   [int-ptr!]         ;The next byte will be written to
			out-size  [integer!]         ;Size of the out buffer
			return: [lzma_ret!]
		]
	]; #import [liblzma

	LIBC-file cdecl [
		realloc: "realloc" [
			"Resize and return allocated memory."
			memory			[byte-ptr!]
			size			[integer!]
			return:			[byte-ptr!]
		]
	]; LIBC-file
	] 

	;-- Higher level interface ---------------------------- ---------------------------------------

	compress: func [ "Compress a byte array using LZMA compression"
		in-buf       [byte-ptr!] "Pointer to source data"
		in-size      [integer!]  "Source data size (bytes)"
		out-pos      [int-ptr!]  "The next byte will be written to out"
		out-size     [int-ptr!]  "Size of the out buffer"
		level        [integer!]  "Compression level"
		return:      [byte-ptr!] "Returns a pointer to compressed data"
		/local ret out-buf tmp
	][
		out-size/value: stream_buffer_bound in-size
		out-pos/value: 0
		out-buf: allocate out-size/value
		if out-buf = NULL [
			print-line "LZMA Compress Error : Output buffer allocation error."
			return NULL
		]
		ret: easy_buffer_encode level 0 NULL as byte-ptr! test in-size out-buf out-pos out-size/value
		if ret <> LZMA_OK [
			print-line ["LZMA Compress Error : " ret " = " form-error-msg ret]
			free out-buf
			return NULL
		]
		out-buf
	] ; compress

	decompress: func [ "Decompress a byte array using LZMA compression"
		in-buf       [byte-ptr!] "Pointer to source data"
		in-size      [integer!]  "Source data size (bytes)"
		out-pos      [int-ptr!]  "The next byte will be written to out"
		out-size     [int-ptr!]  "Size of the out buffer"
		return:      [byte-ptr!] "Return a pointer to decompressed data"
		/local ret out-buf tmp in-pos i
	][
		out-size/value: 2 * in-size						;-- allocate twice the size of original buffer
		out-buf: allocate out-size/value
		if out-buf = NULL [
			print-line "LZMA Decompress Error : Output buffer allocation error."
			return NULL
		]
		in-pos: 0
		out-pos/value: 0

		until [
			ret: stream_buffer_decode memlimit 0 NULL
					 in-buf  :in-pos in-size
					 out-buf out-pos out-size/value

			if ret = LZMA_BUF_ERROR [				;-- need to expand output buffer
				out-size/value: 2 * out-size/value	;-- double buffer size
				tmp: realloc out-buf out-size/value	;-- Resize output buffer to new size
				either tmp = NULL [					;-- reallocation failed, uses current output buffer
					print-line "LZMA Decompress Error : Impossible to reallocate output buffer."
					ret: LZMA_MEM_ERROR
				][
					out-buf: tmp					;-- reallocation succeeded, uses reallocated buffer
				]
			]
			ret <> LZMA_BUF_ERROR
		]
		if ret <> LZMA_OK [
			print-line ["LZMA Decompress Error : " ret " = " form-error-msg ret]
			free out-buf
			return NULL
		]
		if out-pos/value < out-size/value [
			set-memory (out-buf + out-pos/value) #"^@" (out-size/value - out-pos/value)
		]
		out-buf
	]
] ; context lzma
