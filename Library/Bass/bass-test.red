Red []

#include %bass.red

;-- here are media files used in the test
media: [%jaguar.wav %drumloop.wav]
;-- download them if not exists...
foreach file media [
	unless exists? file [
		url: rejoin [https://github.com/Oldes/media/blob/master/ file]
		print ["Downloading file:" mold file "from:" url]
		write/binary file read/binary rejoin [url %?raw=true]
	]
]
;-- downloading MOD file if not exists..
unless exists? file: %feroness_-_sun.mod [
	url: https://api.modarchive.org/downloads.php?moduleid=179764#feroness_-_sun.mod
	print ["Downloading file:" mold file "from:" url]
	write/binary file read/binary url
]



bass/init ;Initializes a sound output device using default values

bass/do [
	sound:   load %jaguar.wav            ;sound can be loaded from file
	drum:    load %drumloop.wav [loop fx volume: 0] ;optional default settings can be specified
	music:   load %feroness_-_sun.mod   ;loads MOD file
	channel: play music [volume: 0]     ;channel can be stored for later use, optional block with settings can be used 
	fade channel [volume: 0.3] 0:0:20   ;it is possible to fade some values in time
	play sound   [volume: 0.4 pan: -1]  ;or not if not needed
	loop: play drum [volume: 1] 0:0:10  ;fade is possible to set even during 'play' command
]
wait 10
bass/do [
	;handles can be passed also as get-words
	play :sound [pan: 1]
	fade :loop [pan: -1] 2000     ;fade time can be specified also using integer! (number of ms) or float! (number of seconds)
	fade channel [volume: 0] 0.5
	
]  
wait 3
bass/do [
	pause channel
	fade :loop [pan: 1] 2000
]
wait 3
bass/do [
	fade :loop [pan: 0 volume: 0 freq: 6000] 0:0:6
]
wait 6
bass/do [
	resume channel [volume: 1 bpm: 90] 0:0:5
]
wait 4

effects: [
	chorus
	compressor
	distortion
	echo
	flanger
	gargle
	parameq
	reverb
	reverb-3D
]

foreach effect effects [
	print ["Enabling effect:" effect]
	bass/do compose [
		fx: (effect) channel
	]
	wait 6
	print ["Disabling effect:" effect]
	bass/do [stop fx]
	wait 4
]

bass/do [
	play sound
	fade channel [volume: 0 bpm: 125] 3000
]
wait 3


bass/free  ;Frees all resources used by the output device, including all its samples, streams and MOD musics.

print "end of test"
wait 1