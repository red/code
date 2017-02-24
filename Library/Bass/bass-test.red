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
	sound:   load  %jaguar.wav         ;sound can be loaded from file
	music:   music %feroness_-_sun.mod ;loads MOD file... could be possibly done in load later
	channel: play music                ;channel can be stored for later use (note that in this case channel equals music)
	play sound                         ;or not if not needed
]
wait 3
bass/do [pause channel play sound]
wait 1
bass/do [resume channel]
wait 3
bass/do [pause music play sound]
wait 1
bass/do [resume music]
wait 3

bass/free  ;Frees all resources used by the output device, including all its samples, streams and MOD musics.

print "end of test"
wait 1