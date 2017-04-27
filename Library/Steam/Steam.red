Red [
	Title:   "Red Steam API binding"
	Author:  "Oldes"
	File: 	 %Steam.red
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]
#system [
	binary-ref!:  alias struct! [value [byte-ptr!]]

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

	file-write: routine [
		"Writes data on Steam Cloud"
		file [file!]
		data [binary!]
		/local
			c-file [c-string!]
			len    [integer!]
	][
		len: -1
		c-file:	unicode/to-utf8 file :len
		len: binary/rs-length? data
		Steam/file-write c-file binary/rs-head data len
	]
	file-exists?: routine [
		"Determines if a file exists on Steam Cloud"
		file [file!]
		/local
			c-file [c-string!]
			len    [integer!]
	][
		len: -1
		c-file: unicode/to-utf8 file :len
		logic/box Steam/file-exists? c-file
	]
	file-read: routine [
		"Reads data from Steam Cloud"
		file [file!]
		;return: [binary!]
		/local
			c-file [c-string!]
			len    [integer!]
			bytes  [integer!]
			data   [binary-ref!]
			bin    [red-binary!]
	][
		len: -1
		data: declare binary-ref!
		c-file:	unicode/to-utf8 file :len
		
		bytes: Steam/file-read c-file data
		;print-line ["file-read " bytes " bytes"]
		if bytes < 0 [fire [TO_ERROR(access cannot-open) file]]
		bin: binary/load data/value bytes
		free data/value
		SET_RETURN(bin)
	]
]

