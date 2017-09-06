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

;integer64! type is not supported by Red yet, so this is just temp workaround!
int64!: alias struct! [lo [integer!] hi [integer!]]
#define uint64!     int64!
#define uint64-ref! uint64!

int16!:  alias struct! [lo [byte!] hi [byte!]]       ;@@ must be changed once we will get real integer16! type
#define uint16! int16! ;@@ this is probably not safe! Check Steam binding where it was originaly used!

binary-ref!:      alias struct! [value [pointer! [byte!]]]
string-ref!:      alias struct! [value [c-string!]]
string-ref-ref!:  alias struct! [value [string-ref!]]
handle-ref!:      alias struct! [value [pointer! [integer!]]]
logic-ref!:       alias struct! [value [logic!]]
int64-ref!:       alias struct! [value [int64! value]]