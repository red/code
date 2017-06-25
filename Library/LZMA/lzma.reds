Red/System [
	Title:   "Red/System libLZMA binding"
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

#enum lzma_action! [
	LZMA_RUN:          0 ;-- Continue coding
	 ;* Encoder: Encode as much input as possible. Some internal
	 ;* buffering will probably be done (depends on the filter
	 ;* chain in use), which causes latency: the input used won't
	 ;* usually be decodeable from the output of the same
	 ;* lzma_code() call.
	 ;*
	 ;* Decoder: Decode as much input as possible and produce as
	 ;* much output as possible.
	LZMA_SYNC_FLUSH:   1 ;-- Make all the input available at output
	 ;* Normally the encoder introduces some latency.
	 ;* LZMA_SYNC_FLUSH forces all the buffered data to be
	 ;* available at output without resetting the internal
	 ;* state of the encoder. This way it is possible to use
	 ;* compressed stream for example for communication over
	 ;* network.
	 ;*
	 ;* Only some filters support LZMA_SYNC_FLUSH. Trying to use
	 ;* LZMA_SYNC_FLUSH with filters that don't support it will
	 ;* make lzma_code() return LZMA_OPTIONS_ERROR. For example,
	 ;* LZMA1 doesn't support LZMA_SYNC_FLUSH but LZMA2 does.
	 ;*
	 ;* Using LZMA_SYNC_FLUSH very often can dramatically reduce
	 ;* the compression ratio. With some filters (for example,
	 ;* LZMA2), fine-tuning the compression options may help
	 ;* mitigate this problem significantly (for example,
	 ;* match finder with LZMA2).
	 ;*
	 ;* Decoders don't support LZMA_SYNC_FLUSH.
	LZMA_FULL_FLUSH:   2 ;-- Finish encoding of the current Block
	 ;* All the input data going to the current Block must have
	 ;* been given to the encoder (the last bytes can still be
	 ;* pending in *next_in). Call lzma_code() with LZMA_FULL_FLUSH
	 ;* until it returns LZMA_STREAM_END. Then continue normally
	 ;* with LZMA_RUN or finish the Stream with LZMA_FINISH.
	 ;*
	 ;* This action is currently supported only by Stream encoder
	 ;* and easy encoder (which uses Stream encoder). If there is
	 ;* no unfinished Block, no empty Block is created.
	LZMA_FULL_BARRIER: 4 ;-- Finish encoding of the current Block
	 ;* This is like LZMA_FULL_FLUSH except that this doesn't
	 ;* necessarily wait until all the input has been made
	 ;* available via the output buffer. That is, lzma_code()
	 ;* might return LZMA_STREAM_END as soon as all the input
	 ;* has been consumed (avail_in == 0).
	 ;*
	 ;* LZMA_FULL_BARRIER is useful with a threaded encoder if
	 ;* one wants to split the .xz Stream into Blocks at specific
	 ;* offsets but doesn't care if the output isn't flushed
	 ;* immediately. Using LZMA_FULL_BARRIER allows keeping
	 ;* the threads busy while LZMA_FULL_FLUSH would make
	 ;* lzma_code() wait until all the threads have finished
	 ;* until more data could be passed to the encoder.
	 ;*
	 ;* With a lzma_stream initialized with the single-threaded
	 ;* lzma_stream_encoder() or lzma_easy_encoder(),
	 ;* LZMA_FULL_BARRIER is an alias for LZMA_FULL_FLUSH.
	LZMA_FINISH:       3 ;-- Finish the coding operation
	 ;* All the input data must have been given to the encoder
	 ;* (the last bytes can still be pending in next_in).
	 ;* Call lzma_code() with LZMA_FINISH until it returns
	 ;* LZMA_STREAM_END. Once LZMA_FINISH has been used,
	 ;* the amount of input must no longer be changed by
	 ;* the application.
	 ;*
	 ;* When decoding, using LZMA_FINISH is optional unless the
	 ;* LZMA_CONCATENATED flag was used when the decoder was
	 ;* initialized. When LZMA_CONCATENATED was not used, the only
	 ;* effect of LZMA_FINISH is that the amount of input must not
	 ;* be changed just like in the encoder.
]


lzma: context [
	uint64!: alias struct! [lo [integer!] hi [integer!]] ;@@ temporary solution!

	memlimit: declare uint64!
	memlimit/lo: 1FFFFFFFh ;536MB default max memory usage

	#switch OS [
		Windows   [ #define liblzma "liblzma.dll" ]
		macOS     [ #define liblzma "liblzma.1.dylib" ] ;@@ FIXME: use real file name
		#default  [ #define liblzma "liblzma.so.1" ]    ;@@ FIXME: use real file name
	]

	#define LZMA_PRESET_DEFAULT     6         ;Default compression preset
	#define LZMA_PRESET_EXTREME     80000000h ;Extreme compression preset

	#define LZMA_TELL_NO_CHECK              01h
	#define LZMA_TELL_UNSUPPORTED_CHECK     02h
	#define LZMA_TELL_ANY_CHECK             04h
	#define LZMA_IGNORE_CHECK               10h
	#define LZMA_CONCATENATED               08h


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

	lzma_stream!: alias struct! [
		next_in   [byte-ptr!]     ;Pointer to the next input byte
		avail_in  [integer!]      ;Number of available input bytes in next_in.
		total_in  [uint64! value] ;Total number of bytes read by liblzma.
		next_out  [byte-ptr!]     ;Pointer to the next input byte
		avail_out [integer!]      ;Number of available input bytes in next_in.
		total_out [uint64! value] ;Total number of bytes read by liblzma.
		allocator [lzma_allocator!]
		internal  [int-ptr!]      ;Internal state is not visible to applications

		;Reserved space to allow possible future extensions:
		reserved_ptr1  [int-ptr!]
		reserved_ptr2  [int-ptr!]
		reserved_ptr3  [int-ptr!]
		reserved_ptr4  [int-ptr!]
		reserved_int1  [uint64! value]
		reserved_int2  [uint64! value]
		reserved_int3  [integer!]
		reserved_int4  [integer!]
		reserved_enum1 [integer!]
		reserved_enum2 [integer!]
	]

	#import [liblzma cdecl [
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
		end: "lzma_end" [
			"Free memory allocated for the coder data structures"
			 ;After lzma_end(strm), strm->internal is guaranteed to be NULL. No other
 			 ;members of the lzma_stream structure are touched.
			strm  [lzma_stream!]
		]
		get_progress: "lzma_get_progress" [
			"Get progress information"
			strm         [lzma_stream!]
			progress_in  [uint64!]
			progress_out [uint64!]
		]
		easy_encoder: "lzma_easy_encoder" [
			"Initialize .xz Stream encoder using a preset number"
			strm      [lzma_stream!]
			preset    [integer!]     "Compression preset to use."
			check     [lzma_check!]
			return: [lzma_ret!]
		]
		stream_decoder: "lzma_stream_decoder"[
			strm      [lzma_stream!]
			memlimit  [uint64!]    ;Pointer to how much memory the decoder is allowed to allocate
			flags     [integer!]
			return: [lzma_ret!]
		]
		auto_decoder: "lzma_auto_decoder"[
			strm      [lzma_stream!]
			memlimit  [uint64!]    ;Pointer to how much memory the decoder is allowed to allocate
			flags     [integer!]
			return: [lzma_ret!]
		]
		code: "lzma_code" [
			"Encode or decode data"
			strm      [lzma_stream!]
			action    [lzma_action!]
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
		ret: easy_buffer_encode level LZMA_CHECK_CRC64 NULL in-buf in-size out-buf out-pos out-size/value
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
		if out-size/value = 0 [         ;-- in case initial output size is not specified
			out-size/value: 2 * in-size ;-- allocate twice the size of original buffer
		]	
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

	create-stream: func[return: [lzma_stream!] /local strm][
		strm: allocate size? lzma_stream!
		set-memory strm #"^@" size? lzma_stream!
		as lzma_stream! strm
	]
] ; context lzma
