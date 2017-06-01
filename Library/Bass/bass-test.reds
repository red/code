Red/System [
	Title:   "Red/System BASS binding"
	Author:  "Oldes"
	File: 	 %bass.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

#include %../os/wait.reds
#include %../os/key-hit.reds

BASS: context [

	#include %bass.reds

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
	music:  BASS_MusicLoad  no "feroness_-_sun.mod"   0.0 0 0 0
	print ["sound1: " as byte-ptr! sound1 lf]
	print ["sound2: " as byte-ptr! sound2 lf]
	print ["music: "  as byte-ptr! music lf]

	channel1: BASS_SampleGetChannel sound1 no
	print ["channel1: " as byte-ptr! channel1 lf]

	BASS_ChannelPlay channel1  yes
	
	
	print "^/Press ENTER to quit^/"
	print "Press '1' to toggle sound 1^/"
	print "Press '2' to play sound 2^/"
	print "Press '3' to toggle MOD music^/"
	print "Press 'e' to toggle MOD music echo^/^/"

	key: 0
	channel2: 0
	fx_echo: 0
	err: 0

	forever [ ;Main loop
		if key-hit [
			key: key-hit-char
			switch key [
				13 [ break ] ;pressed ENTER
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
				#"3" [
					either BASS_ACTIVE_PLAYING = BASS_ChannelIsActive music [
						BASS_ChannelPause music
					][
						BASS_ChannelPlay music no
					]
					print ["music playing: " (BASS_ACTIVE_PLAYING = BASS_ChannelIsActive music) lf]
				]
				#"e" [
					either 0 = fx_echo [
						fx_echo: BASS_ChannelSetFX music BASS_FX_DX8_ECHO 0
						print ["music FX: " as byte-ptr! fx_echo lf]
					][
						BASS_ChannelRemoveFX music fx_echo
						fx_echo: 0
						print-line "music FX removed"
					]
				]
				default [true]
			]
			err: BASS_ErrorGetCode
			if err > 0 [ print-line ["BASS Error [" err "]"] ]
		]
		wait 10
	]
	BASS_Stop
	BASS_SampleFree sound1
	BASS_SampleFree sound2
	BASS_Free
]
