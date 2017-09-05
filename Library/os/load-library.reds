Red/System [
	Title:   "Load library"
	Purpose: "Red/System function for dynamic loading library functions"
	Author:  "Oldes"
	File: 	 %load-library.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
	Usage: [
		my-lib: load-library "Kernel32.dll"
		FreeLibraryProc!: alias function! [hmod [pointer! [integer!]] return: [integer!]] 
		my-free-library: as FreeLibraryProc! load-procedure my-lib "FreeLibrary"
		print-line my-free-library my-lib
	]
]

#either OS = 'Windows [
	#import [
		"Kernel32.dll" stdcall [
			LoadLibraryA: "LoadLibraryA" [
				file-name [c-string!]
				return: [pointer! [integer!]]
			]
			GetProcAddress: "GetProcAddress" [
				hmod      [pointer! [integer!]]
				procname  [c-string!]
				return:   [pointer! [integer!]]
			]
			free-library: "FreeLibrary" [
				hmod      [pointer! [integer!]]
				return:   [integer!]
			]
		]
	]
][
	;@@ not tested!
	#define RTLD_LAZY     0001h
	#define RTLD_NOW      0002h
	#define RTLD_GLOBAL   0100h
	#define RTLD_LOCAL    0000h
	#define RTLD_NOSHARE  1000h
	#define RTLD_EXE      2000h
	#define RTLD_SCRIPT   4000h

	#import [
		#either OS = 'macOS ["libdl.dylib"]["libdl.so"]
		cdecl [
			dlopen: "dlopen" [
				file-name [c-string!]
				flag      [integer!]
				return:   [pointer! [integer!]]
			]
			free-library: "dlclose" [
				hmod      [pointer! [integer!]]
				return:   [integer!]
			]
			dlsym: "dlsym" [
				hmod      [pointer! [integer!]]
				procname  [c-string!]
				return:   [pointer! [integer!]]
			]
			dlerror: "dlerror" [
				return:   [c-string!]
			]
		]
	] 
]

load-library: func[
	file-name [c-string!]
	return: [pointer! [integer!]]
][
	#either OS = 'Windows [
		LoadLibraryA file-name
	][	dlopen file-name RTLD_LAZY ]
]

load-procedure: func[
	hmod      [pointer! [integer!]]
	procname  [c-string!]
	return: [pointer! [integer!]]
][
	if null = hmod [
		print-line "ERROR: Attempt to load procedure from NULL library."
		return null
	]
	#either OS = 'Windows [
		GetProcAddress hmod procname
	][	dlsym hmod procname ]
]
