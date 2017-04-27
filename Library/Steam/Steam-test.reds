Red/System [
	Title:   "Red/System Steam API binding test"
	Author:  "Oldes"
	File: 	 %Steam-test.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

#include %Steam.reds

init
info

data: declare binary-ref!

print-line ["exists hell.txt?  " file-exists? "hell.txt"]
print-line ["exists hello.txt? " file-exists? "hello.txt"]

bytes: file-read "hell.txt" data
print-line ["read: " bytes " bytes at: " data/value]

bytes: file-read "hello.txt" data
print-line ["read: " bytes " bytes at: " data/value]

SteamAPI_Shutdown

