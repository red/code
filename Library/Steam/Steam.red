Red [
	Title:   "Red Steam API binding"
	Author:  "Oldes"
	File: 	 %Steam-test.red
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]
#system [
	Steam: context [
		#include %Steam.reds
	]
]

Steam: context [
	init: routine [
		"Initialize Steam API. Must be called before using any other API functions."
		return: [logic!]
	][
		Steam/init
	]
	info: routine ["Prints some SteamAPI related info"][
		Steam/info
	]
	shutdown: routine ["Should be called during process shutdown if possible"][
		Steam/SteamAPI_Shutdown
	]
]

