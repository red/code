Red/System [
	Title:   "Red runtime independent definitions"
	Author:  "Oldes"
	File: 	 %definitions.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]

;use this code only when Red runtime is not embedded 
#if red-pass? = no [
	;place code which is part of the Red runtime here
	#define handle!	[pointer! [integer!]]
]

;this code is not part of the Red runtime, but is common in multiple libraries

;integer64! type is not supported by Red yet, so these are just temp workaround!
int64!: alias struct! [lo [integer!] hi [integer!]]
#define uint64!     int64!

#define int64-value!  [int64! value]
#define uint64-value! [int64! value]
#define int64-ptr!    int64!
#define uint64-ptr!   uint64!



;@@ !!! it is not possible to use int16! as compiler refuses it.
integer16!:  alias struct! [lo [byte!] hi [byte!]]       ;@@ must be changed once we will get real integer16! type
#define uint16! integer16! ;@@ this is probably not safe! Check Steam binding where it was originaly used!

#define int16-value!  [integer16! value]
#define uint16-value! [integer16! value]
#define int16-ptr!     integer16!
#define uint16-ptr!    integer16!

binary-ptr!:      alias struct! [value [pointer! [byte!]]]
string-ptr!:      alias struct! [value [c-string!]]
string-ptr-ptr!:  alias struct! [value [string-ptr!]]
handle-ptr!:      alias struct! [value [pointer! [integer!]]]
logic-ptr!:       alias struct! [value [logic!]]
int64-ptr!:       alias struct! [value [int64-value!]]

#if OS = 'Windows  [
	#define HDC!                      handle!
	#define HGLRC!                    handle!
	#define HGPUNV!                   handle!
	#define HPBUFFERARB!              handle!
	#define HPBUFFEREXT!              handle!
	#define HPVIDEODEV!               handle!
	#define HVIDEOINPUTDEVICENV!      handle!
	#define HVIDEOOUTPUTDEVICENV!     handle!
	#define PGPU_DEVICE!              handle!

	#define HGPUNV-ptr!               handle-ptr!
	#define HPVIDEODEV-ptr!           handle-ptr!
	#define HVIDEOINPUTDEVICENV-ptr!  handle-ptr!
	#define HVIDEOOUTPUTDEVICENV-ptr! handle-ptr!
]