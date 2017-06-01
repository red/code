Red/System [
	Title:   "Time elapsed"
	Purpose: "Red/System (runtime independent) function for measuring time between each call in seconds"
	Author:  "Oldes"
	File: 	 %time-elapsed.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
	Usage: [
		time-elapsed ;initial call if you don't want to count since app start
		;do some code here, where you want to count how long it takes
		print-line ["time elapsed: " time-elapsed " seconds"]
	]
]

ctx-timing: context [
	time: 0.0
	#switch OS [
		Windows   [
			#import [
				"kernel32.dll" stdcall [
					GetTickCount: "GetTickCount" [
						return:	[integer!]
					]
				]
			]
		]
		#default  [
			timespec!: alias struct! [
				seconds     [integer!] ;time_t
				nanoseconds [integer!] ;long
			]
			#define CLOCK_MONOTONIC 1
			#import [
				LIBC-file cdecl [
					clock_gettime: "clock_gettime" [
						clk_id [integer!]
						time   [timespec!]
						return:	[integer!]
					]
				]
			]
			ts: declare timespec!
		]
	]
	update: func[][
		#either OS = 'Windows [
			time: 1E-3 * as float! GetTickCount
		][
			clock_gettime CLOCK_MONOTONIC ts
			time: as float! ts/seconds + (1E-9 * as float! ts/nanoseconds)
		]
	]
	update ;does the initial update (application starts)
]

#either red-pass? = no [time-elapsed:][_time-elapsed:] func [
	"Returns number of seconds since last call (or application start for the first call)"
	return: [float!]
	/local time
][
	time: ctx-timing/time
	ctx-timing/update
	ctx-timing/time - time
]
