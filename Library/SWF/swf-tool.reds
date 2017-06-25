Red/System [
	Title:	"SWF tool - Red/System version"
	Purpose: "Just a simple test. So far it displays some info about given SWF file"
	Author: "Oldes"
	File: 	%swf-tool.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %../os/time-elapsed.reds
#include %swf-io.reds

string-ref!:  alias struct! [value [c-string!]]

#import [
	LIBC-file cdecl [
		strtol: "strtol" [
			;converts the initial part of the string to integer
			string	[c-string!]
			endptr  [string-ref!]
			base    [integer!]
			return:	[integer!]
		]
		strcmp: "strcmp" [
			;Return string comparison.
			string-1		[c-string!]
			string-2		[c-string!]
			return:			[integer!]
		]
	]
]

#define IS_ARG?(arg) [0 = strcmp value arg]

help-text: {
Usage: swf-tool [OPTIONS] file [file]...
Extracts information and/or data from given Flash (SWF) file.

  -h, --help         Prints this info
  -v, --verbose NUM  Level of output verbosity (0-2) default: 2

Extract action displays:
  --header           SWF file header info
  --tags             List of tags [tagID offset bytes]
  --exports          List of exported names [id name]
  --bitmaps          Bitmaps related tags info (TODO)
  --sounds           Sounds related tags info (TODO)

}

do-input: func [
	/local
		argument  [str-array!]
		value     [c-string!]
		file-name [c-string!]
		result [c-string!]
		i      [integer!]
		str* actions n
][
	n: 1
	str*: declare string-ref!
	actions: 0
	file-name: null

	while [n < system/args-count][
		argument: system/args-list + n
		value: argument/item
		case [
			any [
				IS_ARG?("-h")
				IS_ARG?("--help")
			][
				print-line help-text
				quit 0
			]
			any [
				IS_ARG?("-v")
				IS_ARG?("--verbose")
			][
				n: n + 1
				argument: system/args-list + n
				swf/verbose: strtol argument/item str* 10
				if 0 < length? str*/value [
					print-line ["Invalid verbose level: " argument/item]
					quit 1
				]
			]
			IS_ARG?("--header")  [ actions: actions or swf/EXTRACT_HEADER   ]
			IS_ARG?("--tags")    [ actions: actions or swf/EXTRACT_TAGS     ]
			IS_ARG?("--exports") [ actions: actions or swf/EXTRACT_EXPORTS  ]
			IS_ARG?("--bitmaps") [ actions: actions or swf/EXTRACT_BITMAPS  ]
			IS_ARG?("--sounds")  [ actions: actions or swf/EXTRACT_SOUNDS   ]
			true [
				break ;continue processing file names
			]
		]
		n: n + 1
	]

	swf/tag-actions: either actions > 0 [actions][FFFFFFFFh]
	i: 0
	while [n < system/args-count][
		argument: system/args-list + n
		value: argument/item
		print-line [";##### Input file: " value lf]
		if 1 = swf/open value [
			result: swf/parse 
			print-line result
			swf/close
			i: i + 1
		]
		n: n + 1
	]

	print ["Processed " i ]
	either i = 1 [print " file"][print " files"]
	print [" in time: " time-elapsed " seconds" lf]
]

do-input
