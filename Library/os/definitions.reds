Red/System [
	Title:   "Red runtime independent definitions"
	Purpose: "These definitions are defined in Red runtime, but may be useful when writing R/S only code"
	Author:  "Oldes"
	File: 	 %definitions.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]

;use this code only when Red runtime is not embedded 
#if red-pass? = no [
	#define handle!	[pointer! [integer!]]
]