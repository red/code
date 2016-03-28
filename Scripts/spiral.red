Red [
	Title:	 "Spiral tides"
	Author:  "Cyphre"
	Needs:	 'View
	Date:    "25/03/2016"
	License: "MIT license"
	Notes:	 {
		Move the mouse around to animate the spirals. Once we get timers support,
		we wil be able to automate it. ;-)
		
		Ported from Rebol to Red by Pekr, optimized by Nenad Rakocevic.
	}
]

system/view/auto-sync?: no

size: 700x700
ff: 0
mod: 1

make-spiral: func [wd angle buffer /local offset][
	ff: ff + 20
	offset: as-pair 
		to integer! size/x / 2 + (10 * sine ff)
		to integer! size/y / 2 + (10 * cosine ff)
		
	repeat i 360 [
		append buffer as-pair
			offset/x + (i * sine angle + (wd * i))
			offset/y + (i * cosine angle + (wd * I))
	]
]

tv: angle: 0
color: random 255.255.255
d: '-
xx: random 20.20.20

view [
	canvas: base size all-over white on-over [
		if color < 30.30.30 [d: '+ xx: random 20.20.20]
		if color > 200.200.200 [d: '- xx: random 20.20.20]
		color: either d = '+ [color + xx][color - xx]
		tv: tv - 0.2
		angle: angle - 1
		
		buffer: clear any [canvas/draw canvas/draw: make block! 400]
		compose/into [line-width 2 pen (color) line] buffer
		
		make-spiral tv angle buffer
		show canvas
	]
]