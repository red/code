Red/System [
	Title:   "Red/System (runtime independent) wait function"
	Author:  "Oldes"
	File: 	 %wait.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]

;use this code only when Red runtime is not embedded 
#if red-pass? = no [
	#switch OS [
		Windows   [
			#import [
				"kernel32.dll" stdcall [
					sleep: "Sleep" [
						dwMilliseconds	[integer!]
					]
				]
			]
			wait: func [ms [integer!]][sleep ms]
		]
		#default  [
			#import [
				LIBC-file cdecl [
					usleep: "usleep" [
						microseconds [integer!]
						return: 	 [integer!]
					]
				]
			]
			wait: func [ms [integer!]][usleep 1000 * ms]
		]
	]
]

