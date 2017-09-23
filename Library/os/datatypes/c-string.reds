Red/System [
	Title:   "C-string utils"
	Purpose: "C-string related functions"
	Exports: [
		copy-c-string  [function! [src [c-string!] size [integer!] return: [c-string!]]]
	]
	Author:  "Oldes"
	File: 	 %c-string.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#import [
	LIBC-file cdecl [
		strnchr: "memchr" [ ;using memchr but with c-string! types
			ptr   [c-string!]
			value [byte!]
			num   [integer!]
			return: [c-string!]
		]
		strncmp: "strncmp" [
			str1 [c-string!]
			str2 [c-string!]
			num  [integer!]
			return: [integer!]
		]
		strstr: "strstr" [
			str1 [c-string!]
			str2 [c-string!]
			return: [c-string!]
		]
		strncpy: "strncpy" [
			str1 [c-string!]
			str2 [c-string!]
			num  [integer!]
			return: [c-string!]
		]
	]
]

copy-c-string: func[
	"Creates copy of given string or its part"
	src     [c-string!]
	size    [integer!]  ;if size < 0 function will copy full source string
	return: [c-string!] ;call `free` on returned string once not needed! 
	/local sz result
][
	sz: size? src
	if all [size > 0 size <= sz][ sz: size ]
	result: as c-string! allocate (sz + 1)
	strncpy result src sz
	sz: sz + 1 result/sz: #"^@" ;mark tail of c-string
	result
]