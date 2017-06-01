Red [
	Title:   "Time elapsed"
	Purpose: "Function for measuring time between each call in seconds"
	Author:  "Oldes"
	File: 	 %time-elapsed.red
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
	Usage: [
		time-elapsed ;initial call if you don't want to count since app start
		;do some code here, where you want to count how long it takes
		print ["time elapsed:" time-elapsed "seconds"]
	]
]

#system [#include %time-elapsed.reds]

time-elapsed: routine [
	"Returns number of seconds since last call (or application start for the first call)"
	return: [float!]
][
	_time-elapsed
]
