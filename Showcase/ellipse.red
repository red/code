Red [
	Author: "Toomas Vooglaid"
	Date: 2018-03-26
	Purpose: "Study of ellipse"
	Based-on: https://en.wikipedia.org/wiki/Ellipse
]

tick: 0
view/tight [
	title "Ellipse"
	box 300x300 rate 90 draw [
		translate 150x150
		circle 0x0 100
		pen blue line 0x-100 0x100 circle 0x-100 2 circle 0x100 2
		pen green line -100x0 100x0 circle -100x0 2 circle 100x0 2
		circ: transform 0x0 0 1 1 0x0 [
			rot: rotate 0 50x0 [
				pen black circle 50x0 50
				line-cap round 
				pen gray line-width 8 line 0x0 100x0
				pen blue line-width 1 circle 0x0 1
				pen green circle 100x0 1
				pen red	circle 66x0 1
				pen cyan circle 88x0 1
			]
		]
		pen cyan ellipse -88x-12 176x24
		pen red ellipse -66x-34 132x68
	]
	on-time [
		tick: tick + 1
		circ/3: negate tick
		rot/2: 2 * tick
	]
]