Red/System [
	Title:   "Red/System BASS binding"
	Author:  "Oldes"
	File: 	 %bass.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

BASS: context [

	#include %bass.reds

	#import [
		"kernel32.dll" stdcall [
			Sleep: "Sleep" [
				dwMilliseconds	[integer!]
			]
		]
		LIBC-file cdecl [
			_kbhit: "_kbhit" [ return: [integer!] ]
			_getch: "_getch" [ return: [integer!] ]
		]
	]

	if false = BASS_Init -1 44100 BASS_DEVICE_3D 0 null [
		print ["BASS Error [" BASS_ErrorGetCode "]: Can't initialize device!" lf]
		quit 1
	]

	info: declare BASS_INFO!

	result: BASS_GetInfo info 
	print [
		"BASS_GetInfo: " result lf
		" flags: " as byte-ptr! info/flags lf
		" hwsize: " info/hwsize lf
		" hwfree: " info/hwfree lf
		" freesam: " info/freesam lf
		" minbuf: "  info/minbuf lf
		" minrate: " info/minrate lf
		" maxrate: " info/maxrate lf
		" eax: " info/eax lf
	]

	print lf

	buflen: BASS_GetConfig BASS_CONFIG_BUFFER
	print ["BASS_CONFIG_BUFFER: " buflen lf]

	print ["BASS_GetDevice: " BASS_GetDevice lf]

	i: 0 n: 0

	di: declare BASS_DEVICEINFO!

	while [BASS_GetDeviceInfo n di][
		print ["Device " n lf]
		print ["  name__: " di/name lf]
		if n > 0 [
			print ["  driver: " di/driver lf]
			print ["  flags_: " as byte-ptr! di/flags lf]
		]
		n: n + 1
	]

	version: BASS_GetVersion
	print ["BASS version: " as byte-ptr! version lf]

	sound1: BASS_SampleLoad no "drumloop.wav" 0.0 0 3 BASS_SAMPLE_OVER_POS or BASS_SAMPLE_LOOP
	sound2: BASS_SampleLoad no "jaguar.wav"   0.0 0 3 BASS_SAMPLE_OVER_POS
	print ["sound1: " as byte-ptr! sound1 lf]
	print ["sound2: " as byte-ptr! sound2 lf]

	channel1: BASS_SampleGetChannel sound1 no
	print ["channel1: " as byte-ptr! channel1 lf]

	BASS_ChannelPlay channel1  yes
	
	print "^/Press ENTER to quit^/"
	print "Press '1' to toggle sound 1^/"
	print "Press '2' to play sound 2^/^/"

	quit?: false
	key: 0
	channel2: 0

	until [ ;Main loop
		if 0 <> _kbhit [
			key: _getch
			switch key [
				13 [ quit?: true ] ;pressed ENTER
				#"1" [
					either BASS_ACTIVE_PLAYING = BASS_ChannelIsActive channel1 [
						BASS_ChannelPause channel1
					][
						BASS_ChannelPlay channel1 no
					]
				]
				#"2" [
					channel2: BASS_SampleGetChannel sound2 no
					BASS_ChannelPlay channel2  yes
				]
			]
		]
		Sleep 10
		quit?
	]
	BASS_Stop
	BASS_SampleFree sound1
	BASS_SampleFree sound2
	BASS_Free
]
