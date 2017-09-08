Red/System [
	Title:   "Red/System Red binding"
	Author:  "Oldes"
	File: 	 %red.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#switch OS [
	Windows   [
		#define RED_LIBRARY "libRed.dll"
		#define RED_CALLING cdecl
	]
	macOS     [ ;@@ not tested!
		#define RED_LIBRARY "libRed.dylib"
		#define RED_CALLING cdecl
	] 
	#default  [ ;@@ not tested!
		#define RED_LIBRARY "libRed.so"
		#define RED_CALLING cdecl
	] 
]

#define red_value!	 	int-ptr!
#define red_unset!	 	red_value!
#define red_datatype!	red_value!
#define red_none!	 	red_value!
#define red_logic!	 	red_value!
#define red_integer!	red_value!
#define red_float!	 	red_value!
#define red_pair!	 	red_value!
#define red_tuple!	 	red_value!
#define red_binary!	 	red_value!
#define red_image!	 	red_value!
#define red_string!	 	red_value!
#define red_word!	 	red_value!
#define red_block!	 	red_value!
#define red_path!	 	red_value!
#define red_series!	 	red_value!
#define red_error!	 	red_value!

;-- Image buffer formats --
#enum RedImageFormat! [
	RED_IMAGE_FORMAT_RGB
	RED_IMAGE_FORMAT_ARGB
]

;-- Red Types --
#enum RedType! [
	RED_TYPE_VALUE
	RED_TYPE_DATATYPE
	RED_TYPE_UNSET
	RED_TYPE_NONE
	RED_TYPE_LOGIC
	RED_TYPE_BLOCK
	RED_TYPE_PAREN
	RED_TYPE_STRING
	RED_TYPE_FILE
	RED_TYPE_URL
	RED_TYPE_CHAR
	RED_TYPE_INTEGER
	RED_TYPE_FLOAT
	RED_TYPE_SYMBOL
	RED_TYPE_CONTEXT
	RED_TYPE_WORD
	RED_TYPE_SET_WORD
	RED_TYPE_LIT_WORD
	RED_TYPE_GET_WORD
	RED_TYPE_REFINEMENT
	RED_TYPE_ISSUE
	RED_TYPE_NATIVE
	RED_TYPE_ACTION
	RED_TYPE_OP
	RED_TYPE_FUNCTION
	RED_TYPE_PATH
	RED_TYPE_LIT_PATH
	RED_TYPE_SET_PATH
	RED_TYPE_GET_PATH
	RED_TYPE_ROUTINE
	RED_TYPE_BITSET
	RED_TYPE_POINT
	RED_TYPE_OBJECT
	RED_TYPE_TYPESET
	RED_TYPE_ERROR
	RED_TYPE_VECTOR
	RED_TYPE_HASH
	RED_TYPE_PAIR
	RED_TYPE_PERCENT
	RED_TYPE_TUPLE
	RED_TYPE_MAP
	RED_TYPE_BINARY
	RED_TYPE_SERIES
	RED_TYPE_TIME
	RED_TYPE_TAG
	RED_TYPE_EMAIL
	RED_TYPE_IMAGE
	RED_TYPE_EVENT
	RED_TYPE_DATE
	;RED_TYPE_CLOSURE
	;RED_TYPE_PORT
]

#import [ RED_LIBRARY RED_CALLING [


;-------------------------------------------
;--  Setup and terminate 
;-------------------------------------------

	redOpen:   "redOpen" []
	redClose:  "redClose" []


;-------------------------------------------
;--  Run Red code 
;-------------------------------------------

	redDo:     "redDo" [
		source  [c-string!]
		return: [red_value!]
	]
	redDoFile: "redDoFile" [
		file    [c-string!]
		return: [red_value!]
	]
	redDoBlock: "redDoBlock" [
		code    [red_block!]
		return: [red_value!]
	]
	redCall:   "redCall" [[variadic] return: [red_value!]]


;-------------------------------------------
;--  Expose a C callback in Red 
;-------------------------------------------

	redRoutine: "redRoutine" [
		name     [red_word!]
		spec     [c-string!]
		func_ptr [integer!]
		return:  [red_value!]
	]


;-------------------------------------------
;--  C -> Red 
;-------------------------------------------

	redSymbol: "redSymbol" [
		word    [c-string!]
		return: [integer!]
	]
	redUnset:  "redUnset" [return: [red_unset!] ]
	redNone:   "redNone" [return: [red_none!] ]
	redLogic:  "redLogic" [
		logic   [integer!]
		return: [red_logic!]
	]
	redDatatype: "redDatatype" [
		type    [integer!]
		return: [red_datatype!]
	]
	redInteger: "redInteger" [
		number  [integer!]
		return: [red_integer!]
	]
	redFloat:  "redFloat" [
		number  [float!]
		return: [red_float!]
	]
	redPair:   "redPair" [
		x       [integer!]
		y       [integer!]
		return: [red_pair!]
	]
	redTuple:  "redTuple" [
		r       [integer!]
		g       [integer!]
		b       [integer!]
		return: [red_tuple!]
	]
	redTuple4: "redTuple4" [
		r       [integer!]
		g       [integer!]
		b       [integer!]
		a       [integer!]
		return: [red_tuple!]
	]
	redBinary: "redBinary" [
		buffer  [c-string!]
		bytes   [integer!]
		return: [red_binary!]
	]
	redImage:  "redImage" [
		width   [integer!]
		height  [integer!]
		buffer  [pointer! [integer!]]
		format  [integer!]
		return: [red_image!]
	]
	redString: "redString" [
		string  [c-string!]
		return: [red_string!]
	]
	redWord:   "redWord" [
		word    [c-string!]
		return: [red_word!]
	]
	redBlock:  "redBlock" [[variadic] return: [red_block!]]
	redPath:   "redPath" [[variadic] return: [red_path!]]
	redLoadPath: "redLoadPath" [
		path    [c-string!]
		return: [red_path!]
	]
	redMakeSeries: "redMakeSeries" [
		type    [integer!]
		slots   [integer!]
		return: [red_value!]
	]


;-------------------------------------------
;--  Red -> C 
;-------------------------------------------

	redCInt32: "redCInt32" [
		number  [red_integer!]
		return: [integer!]
	]
	redCDouble: "redCDouble" [
		number  [red_float!]
		return: [float!]
	]
	redTypeOf: "redTypeOf" [
		value   [red_value!]
		return: [integer!]
	]


;-------------------------------------------
;--  Red actions 
;-------------------------------------------

	redAppend: "redAppend" [
		series  [red_series!]
		value   [red_value!]
		return: [red_value!]
	]
	redChange: "redChange" [
		series  [red_series!]
		value   [red_value!]
		return: [red_value!]
	]
	redClear:  "redClear" [
		series  [red_series!]
		return: [red_value!]
	]
	redCopy:   "redCopy" [
		value   [red_value!]
		return: [red_value!]
	]
	redFind:   "redFind" [
		series  [red_series!]
		value   [red_value!]
		return: [red_value!]
	]
	redIndex:  "redIndex" [
		series  [red_series!]
		return: [red_value!]
	]
	redLength: "redLength" [
		series  [red_series!]
		return: [red_value!]
	]
	redMake:   "redMake" [
		proto   [red_value!]
		spec    [red_value!]
		return: [red_value!]
	]
	redMold:   "redMold" [
		value   [red_value!]
		return: [red_value!]
	]
	redPick:   "redPick" [
		series  [red_series!]
		value   [red_value!]
		return: [red_value!]
	]
	redPoke:   "redPoke" [
		series  [red_series!]
		index   [red_value!]
		value   [red_value!]
		return: [red_value!]
	]
	redPut:    "redPut" [
		series  [red_series!]
		index   [red_value!]
		value   [red_value!]
		return: [red_value!]
	]
	redRemove: "redRemove" [
		series  [red_series!]
		return: [red_value!]
	]
	redSelect: "redSelect" [
		series  [red_series!]
		value   [red_value!]
		return: [red_value!]
	]
	redSkip:   "redSkip" [
		series  [red_series!]
		offset  [red_integer!]
		return: [red_value!]
	]
	redTo:     "redTo" [
		proto   [red_value!]
		spec    [red_value!]
		return: [red_value!]
	]


;-------------------------------------------
;--  Access to a Red global word 
;-------------------------------------------

	redSet:    "redSet" [
		id      [integer!]
		value   [red_value!]
		return: [red_value!]
	]
	redGet:    "redGet" [
		id      [integer!]
		return: [red_value!]
	]


;-------------------------------------------
;--  Access to a Red path 
;-------------------------------------------

	redSetPath: "redSetPath" [
		path    [red_path!]
		value   [red_value!]
		return: [red_value!]
	]
	redGetPath: "redGetPath" [
		path    [red_path!]
		return: [red_value!]
	]


;-------------------------------------------
;--  Access to a Red object/map/struct field 
;-------------------------------------------

	redSetField: "redSetField" [
		obj     [red_value!]
		field   [integer!]
		value   [red_value!]
		return: [red_value!]
	]
	redGetField: "redGetField" [
		obj     [red_value!]
		field   [integer!]
		return: [red_value!]
	]


;-------------------------------------------
;--  Debugging 
;-------------------------------------------

	redPrint:  "redPrint" [value [red_value!] ]
	redProbe:  "redProbe" [
		value   [red_value!]
		return: [red_value!]
	]
	redHasError: "redHasError" [return: [red_value!] ]
	redOpenLogWindow: "redOpenLogWindow" [return: [integer!] ]
	redCloseLogWindow: "redCloseLogWindow" [return: [integer!] ]
	redOpenLogFile: "redOpenLogFile" [name [c-string!] ]
	redCloseLogFile: "redCloseLogFile" []
]]
