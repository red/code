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
	sound:   load %jaguar.wav          ;sound can be loaded from file
	drum:    load %drumloop.wav [loop fx volume: 0.6]
	music:   load %feroness_-_sun.mod  ;loads MOD file
	channel: play music                ;channel can be stored for later use
	play sound [volume: 0.4 pan: -1]   ;or not if not needed
	loop: play drum
]
wait 3
bass/do [pause :channel play :sound [pan: 1]]  ;handles can be passed also as get-words
wait 1
bass/do [resume channel]
bass/do [stop loop]
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
]
wait 3


bass/free  ;Frees all resources used by the output device, including all its samples, streams and MOD musics.

print "end of test"
wait 1