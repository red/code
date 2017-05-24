Red/System [
	Title:  "Basic Red/System libLZMA binding test"
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
