Red/System [
	Title:  "Red/System libLZMA binding test"
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

#include %lzma.reds

print-line ["libLZMA version: " lzma/version_number " - " lzma/version_string]

;--- simple test with buffer.

test: {
	Hello Red world, Hello Red world, Hello Red world, Hello Red world,
	Hello Red world, Hello Red world, Hello Red world, Hello Red world,
	Hello Red world, Hello Red world, Hello Red world, Hello Red world,
	Hello Red world, Hello Red world, Hello Red world, Hello Red world,
	Hello Red world, Hello Red world, Hello Red world, Hello Red world,
	Hello Red world, Hello Red world, Hello Red world, Hello Red world,
	Hello Red world, Hello Red world, Hello Red world, Hello Red world,
	Hello Red world, Hello Red world, Hello Red world, Hello Red world,
	Hello Red world, Hello Red world, Hello Red world, Hello Red world,
	Hello Red world, Hello Red world, Hello Red world, Hello Red world.}

print-line ["Input:^/" test ]

in-size: length? test

out-pos: 0
out-size: 0

result-compressed: lzma/compress as byte-ptr! test in-size :out-pos :out-size 9
print-line ["in: " in-size " out: " out-pos "/" out-size]

result-decompressed: lzma/decompress result-compressed out-pos :out-pos :out-size
print-line ["decompressed out: " out-pos "/" out-size]
print-line ["Result:^/" as c-string! result-decompressed ]

free result-compressed
free result-decompressed


;--- more low level test with streaming.

strm-enc: lzma/create-stream
print-line lzma/easy_encoder strm-enc LZMA_PRESET_DEFAULT LZMA_CHECK_CRC64
strm-enc/next_in:  as byte-ptr! test
strm-enc/avail_in: in-size

result-compressed: allocate 1024
strm-enc/next_out: result-compressed
strm-enc/avail_out: 1024

print-line ["[run] " lzma/code strm-enc LZMA_RUN]
print-line ["total_in:  " strm-enc/total_in/lo]
print-line ["total_out: " strm-enc/total_out/lo]

;adding the output again to simulate streeming..
strm-enc/next_in:  as byte-ptr! test
strm-enc/avail_in: in-size
print-line ["[run] " lzma/code strm-enc LZMA_RUN]

print-line ["[finish] " lzma/code strm-enc LZMA_FINISH]
;print-line ["[flush] " lzma/code strm-enc LZMA_SYNC_FLUSH]
print-line ["total_in: " strm-enc/total_in/lo]
print-line ["total_out: " strm-enc/total_out/lo]

print-line ["out bytes: " as integer! (strm-enc/next_out - result-compressed)]

print-line "^/decompression:"

strm-dec: lzma/create-stream
print-line lzma/auto_decoder strm-dec lzma/memlimit LZMA_TELL_ANY_CHECK

strm-dec/next_in:  result-compressed
strm-dec/avail_in: strm-enc/total_out/lo

result-decompressed: allocate 2048
strm-dec/next_out: result-decompressed
strm-dec/avail_out: 2048

;print-line ["[run] " lzma/code strm-dec LZMA_RUN]
print-line ["[finish] " lzma/code strm-dec LZMA_FINISH]
print-line ["avail_in: " strm-dec/avail_in] ; in case output would not have enough space, this value will be > 0
print-line ["avail_out: " strm-dec/avail_out]
print-line ["total_in: " strm-dec/total_in/lo]
print-line ["total_out: " strm-dec/total_out/lo]

strm-dec/next_out/1: #"^@"
print-line as c-string! result-decompressed

free result-compressed
free result-decompressed

lzma/end strm-enc
lzma/end strm-dec
