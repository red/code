Red/System [
	Title:   "Red/System BASS binding - recording test"
	Author:  "Oldes"
	File: 	 %bass-record-test.reds
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

	i: 0 n: 0

	di: declare BASS_DEVICEINFO!

	print-line "^/BASS_RecordGetDeviceInfo:"
	while [BASS_RecordGetDeviceInfo n di][
		print ["Device " n lf]
		print ["  name__: " di/name lf]
		print ["  driver: " di/driver lf]
		print ["  flags_: " as byte-ptr! di/flags lf]
		print ["     enabled? "    as logic! (di/flags and BASS_DEVICE_ENABLED) lf]
		print ["     microphone? " ((di/flags and BASS_DEVICE_TYPE_MASK) = BASS_DEVICE_TYPE_MICROPHONE) lf]
		n: n + 1
	]

	print lf


	MyRecordProc: function [[stdcall]
		handle [HRECORD!]
		buffer [byte-ptr!]
		length [integer!]
		user   [int-ptr!]
		return: [BOOL!]
	][
		print-line ["recording data " length]
		;do something with data here
		true ;continue recording
	]

	record: declare HRECORD!
	is-recording?: no

	if BASS_RecordInit -1 [ ; -1 = default device
		print-line ["Recording possible... devices: " n]

		;Start recording at 44100 Hz stereo 16-bit.
		record: BASS_RecordStart 44100 2 0 :MyRecordProc null
		if 0 <> record [
			print "recording started"
			is-recording?: yes
		]
	]
	
	print "^/Press ENTER to quit^/"
	print "Press '1' to toggle recording^/"

	print lf

	key: 0
	err: 0

	forever [ ;Main loop
		if key-hit [
			key: key-hit-char
			switch key [
				13 [ break ] ;pressed ENTER
				#"1" [
					either is-recording? [
						BASS_ChannelPause record
						print-line "Recording paused..."
					][
						BASS_ChannelPlay record yes
						print-line "Recording resumed..."
					]
					is-recording?: not is-recording?
				]
				default [true]
			]
			err: BASS_ErrorGetCode
			if err > 0 [ print-line ["BASS Error [" err "]"] ]
		]
		wait 10
	]
	BASS_Stop
	BASS_RecordFree
	BASS_Free
]
