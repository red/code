Red [
	Title:  "Starfield"
	Author: "Nenad Rakocevic"
	File: 	%starfield.red
	Needs:	'View
	Notes: {
		This is a Red port of a Starfield coding challenge for Processing language:
		https://github.com/CodingTrain/Coding-Challenges/tree/main/001_StarField/Processing/CC_001_StarField
		
		The Red port is about the same number of lines of code, despite not having
		all the implicit framework for animations that Processing has. Also, the
		`in-range` and `rescale` functions are built-in in Processing while we need
		to define them in Red.
	}
]

num:	800												;-- number of stars
speed:	12												;-- initial speed
size:	900x900											;-- canvas size
stars:	make block! num									;-- star objects list

pts:	as-point2D 0 size/y
hsx:	as-point2D 0 size/x / 2
hsy:	as-point2D 0 size/y / 2

in-range: function [low [number!] high [number!]][r: high - low  (random r) - (r / 2)]

rescale: func [value [float!] low [point2D!] high [point2D!] return: [float!]][
	(value - low/x) / (low/y - low/x) * (high/y - high/x) + high/x
]

get-new-location: func [/init return: [point3D!]][
	as-point3D
		in-range negate size/x / 2  size/x / 2			;-- -sx/2 < center/x < sx/2
		in-range negate size/y / 2  size/y / 2			;-- -sy/2 < center/y < sy/2
		either init [random size/x / 2][size/x / 2]		;-- radius
]

make-stars: func [/local list return: [block!]][
	list: make block! num * 10
	loop num [
		append stars object [
			pos: get-new-location/init
			pz: pos/z
			circle: tail list							;-- store reference to 'circle command
		]
		;-- indexes: 1      2     3                 7      8
		append list [circle (0,0) 0 pen white line (0, 0) (0, 0) pen off]
	]
	list
]

move-stars: function [face event][
	foreach star stars [
		star/pos/z: star/pos/z - speed
		if star/pos/z < 1 [								;-- when star exits
			star/pos: get-new-location
			star/pz: star/pos/z
		]
		s: star/pos		
		canvas: star/circle
		canvas/2/x: rescale s/x / s/z (0, 1) hsx		;-- center/x
		canvas/2/y: rescale s/y / s/z (0, 1) hsy		;-- center/y
		canvas/3:   rescale s/z hsx (6, 0)				;-- radius
		canvas/7:   as-point2D
			rescale s/x / star/pz (0, 1) hsx			;-- line begin/x
			rescale s/y / star/pz (0, 1) hsy			;-- line begin/y
		canvas/8:   to-point2D canvas/2					;-- line end (center)
		star/pz:    star/pos/z							;-- save center
	]
	show face											;-- update whole canvas on screen
]

view/no-sync compose/deep/only [
	title "Starfield"
	base size black rate 60 all-over
		draw    [pen off fill-pen white translate (size / 2) (make-stars)]
		on-over [speed: rescale event/offset/x pts (0, 50)]
		on-time :move-stars 
]