Red/System [
	Title:   "Red/System - Read URL example"
	Purpose: {Decodes input argument as URL and tries to read it using HTTP request}
	Author:  "Oldes"
	File:    %read-url.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %../../os/datatypes/url.reds ;includes Sockets

main: func [
	/local bytes arg url result data tmp
][
	either system/args-count = 2 [
		arg:   system/args-list + 1
		bytes: 0
		url: declare url!

		print-line ["Input url: " arg/item]

		decode-url arg/item url
		probe-url url
		result: read-url url :bytes
		print-line ["^/Read finished, received bytes: " bytes]

		print "---------------------------------------------------^/"

		if result = null [ exit ]

		data: strstr as c-string! result "^M^/^M^/" ;finds HTTP header end
		if data = null [
			print-line ["*** Result does not contain valid HTTP response!"]
			exit
		]
		data/1: #"^@" data: data + 4   ;marks header tail and moves data at proper start position
		print-line as c-string! result ;prints header

		print "---------------------------------------------------^/"

		;just a naive test if result is a text.
		tmp: strstr as c-string! result "^M^/Content-Type: text/"
		either tmp = null [
			print-line "Result seems not to be in text format."
		][
			either bytes > (1024 * 20) [
				print-line "Result quite large to print."
			][	print-line data ]
		]
	][
		print-line "Usage: read-url <URL>"
	]
]

main

sockets/dispose