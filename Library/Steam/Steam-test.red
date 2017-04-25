Red [
	Title:   "Red Steam API binding test"
	Author:  "Oldes"
	File: 	 %Steam-test.red
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

#include %Steam.red

if not exists? %steam_appid.txt [
	write %steam_appid.txt 480 ;using Valve's sample application ID
]

Steam/init
Steam/info
Steam/shutdown
