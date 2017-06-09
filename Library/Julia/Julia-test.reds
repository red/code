Red/System [
	Title:   "Red/System libjulia binding test"
	Author: "Oldes"
	File: 	%Julia-test.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
	Comment: {
		This script needs external library, which can be downloaded from this site:
		https://julialang.org/downloads/
	}
]

#include %Julia.reds

main: func [
	/local
		argument  [str-array!]
		home-dir  [c-string!]
		ret       [jl-value!]
][
	switch system/args-count [
		1 [ home-dir: "c:\dev\Julia-0.5.2\bin\"]
		2 [
			argument: system/args-list + 1
			home-dir: argument/item
		]
		default [
			print-line "Invalid number of arguments!"
			quit 0
		]
	]

	print-line ["Julia home dir: " home-dir]

	with julia [
		print-line "Starting Julia..."
		jl_init home-dir ;julia's home dir (bin folder)
		if 1 <> jl_is_initialized [
			print-line "Initialization failed!"
			quit 0
		]
		;jl_eval_string "versioninfo()"

		;this is print from Julia:
		ret: jl_eval_string {println(string("sqrt(2.0) = ",sqrt(2.0)))}
		;ret will be something like `unset` julia type in this case
		
		;this will create string in Julia:
		ret: jl_eval_string {"sqrt(2.0) = $(sqrt(2.0))"}
		if ret/0 = jl_string_type [
			print-line ["returned string:  "  as c-string! jl_unbox_voidpointer as int-ptr! ret/1]
		]
		
		ret: jl_eval_string {a = 2;b = 3; c = a * b}
		if ret/0 = jl_int32_type [
			print-line ["returned integer:  "  jl_unbox_int32 ret]
		]
		
		ret: jl_eval_string {c}
		print-line ["c is:  "  jl_unbox_int32 ret]


		jl_atexit_hook 0
	]
]

main
