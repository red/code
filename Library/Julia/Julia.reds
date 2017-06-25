Red/System [
	Title:   "Red/System libjulia binding"
	Author: "Oldes"
	File: 	%Julia.reds
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

#enum jl-image-search! [
	JL_IMAGE_CWD
	JL_IMAGE_JULIA_HOME
	;JL_IMAGE_LIBJULIA
]

#define jl-value! int-ptr!
jl-tagged-value!: alias struct! [
	header [int-ptr!]
	next   [int-ptr!]
	type   [int-ptr!]
	whatever [int-ptr!]
]	
	

julia: context [

	#switch OS [
		Windows   [ #define libjulia "libjulia.dll" ]
		macOS     [ #define libjulia "libjulia.dylib" ] ;@@ FIXME: use real file name
		#default  [ #define libjulia "libjulia.so" ]    ;@@ FIXME: use real file name
	]


	#import [
		libjulia cdecl [
			julia_init: "julia_init" [
				ret [jl-image-search!]
			]
			jl_init: "jl_init" [
				julia_home_dir [c-string!]
			]
			jl_init_with_image: "jl_init_with_image" [
				julia_home_dir [c-string!]
				image_relative_path [c-string!]
			]
			jl_is_initialized: "jl_is_initialized" [
				return: [integer!]
			]
			jl_atexit_hook: "jl_atexit_hook" [
				status [integer!]
			]
			jl_eval_string: "jl_eval_string" [
				str [c-string!]
				return: [jl-value!]
			]
	
			jl_unbox_int32: "jl_unbox_int32" [
				v [jl-value!]
				return: [integer!]
			]
			jl_unbox_voidpointer: "jl_unbox_voidpointer" [
				v [jl-value!]
				return: [byte-ptr!]
			]
			jl_unbox_float64: "jl_unbox_float64" [
				v [jl-value!]
				return: [float!]
			]
			;@@TODO: add more import functions

			jl_any_type: "jl_any_type" [integer!]
			jl_slotnumber_type: "jl_slotnumber_type" [integer!]
			jl_string_type: "jl_string_type" [integer!]
			jl_int32_type: "jl_int32_type" [integer!]
			jl_uint32_type: "jl_uint32_type" [integer!]
			jl_float64_type: "jl_float64_type" [integer!]
			jl_char_type: "jl_char_type" [integer!]
			;@@TODO: add more types

		]; libjulia
	]; #import 


	probe-jl-value: func[
		jval [jl-value!]
	][
		print-line [
			"VAL " jval " has: "
			     as int-ptr! jval/0 " " as int-ptr! jval/1 " " as int-ptr! jval/2 " " as int-ptr! jval/3
			 " " as int-ptr! jval/4 " " as int-ptr! jval/5 " " as int-ptr! jval/6 " " as int-ptr! jval/7
			 " " as int-ptr! jval/8
		]
	]
] ; context julia
