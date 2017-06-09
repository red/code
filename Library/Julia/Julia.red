Red [
	Title:   "Red libjulia binding"
	Author: "Oldes"
	File: 	%Julia.red
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

#system [
	#include %Julia.reds
]

julia: context [
	init: routine [
		"Init Julia"
		home-dir [string!]
		return: [logic!]
		/local dir
	][
		either 1 = julia/jl_is_initialized [
			return true
		][
			dir: as c-string! string/rs-head home-dir
			print-line ["dir: " dir]
			julia/jl_init dir
		]
		1 = julia/jl_is_initialized
	]
	do: routine [
		"Evaluate Julia's code"
		code [string!]
		/local
			jl-value
			cstr    [c-string!]
			str     [red-string!]
			result  [red-value!]
			hnd     [red-handle!]
			int     [red-integer!]
			fl      [red-float!]
			type    [integer!]
	][
		with julia [
			jl-value: jl_eval_string as c-string! string/rs-head code
			type: jl-value/0 and FFFFFFF0h
			case [
				type = jl_string_type [
					cstr: as c-string! jl_unbox_voidpointer as int-ptr! jl-value/1
					str: string/load cstr length? cstr UTF-8
					SET_RETURN(str)
				]
				type = jl_int32_type [
					int: integer/box jl_unbox_int32 jl-value
					SET_RETURN(int)
				]
				type = jl_float64_type [
					fl: float/box jl_unbox_float64 jl-value
					SET_RETURN(fl)
				]
				true [
					hnd: handle/box as integer! jl-value
					SET_RETURN(hnd)
				]
			]
		]
	]
	end: routine [
		"Notify Julia that the program is about to terminate."
		exit-code [integer!]
	][
		julia/jl_atexit_hook exit-code
	]
]
