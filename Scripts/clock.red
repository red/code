Red [
	Title:   "Analog Clock demo"
	Author:  "Nenad Rakocevic"
	File: 	 %clock.red
	Needs:	 'View
	Date:    "22/06/2016"
	License: "MIT"
	Notes: 	{
		This demo simulates the vintage AmigaOS analog clock.
		If launched from the console, the clock will run in the background, so
		you can continue using the console.
		
		The source code required is currently pretty big and complex as
		many features are still missing in Red runtime library, like 
		auto-resizing system, and facilities to apply matrix transformations
		to Draw shapes. Once all these features will be implemented, the
		resulting code should be shorter and much more elegant.
		Anyway, this is a good test for current Red	capabilities.
		Feel free to hack it!
	}
]

system/view/auto-sync?: no

context [
	clock: big-handle: small-handle: sec-handle: none

	line: [line _ _]
	thin: [line-width 1 pen 240.128.0 line _ _]
	poly: [line-width 2 fill-pen black polygon _ _ _ _ fill-pen off]

	draw-handle: function [
		coords [block!] center [pair!] r-mid [number!] r-max [number!] angle [integer!] offset 
		/square r-min [integer!]
	][
		coords/1: either square [center + as-pair (r-min  * cosine angle) (r-min * sine angle)][center]
		coords/3: center + as-pair (r-max * cosine angle) (r-max * sine angle)
		coords/2: center + as-pair (r-mid * cosine (angle - offset)) (r-mid * sine (angle - offset))
		coords/4: center + as-pair (r-mid * cosine (angle + offset)) (r-mid * sine (angle + offset))	
	]

	draw-clock: function [
		face [object!]
		/resize
		/extern big-handle small-handle sec-handle
	][
		time: now/time
		center: face/size / 2
		radius-in:  to integer! center/x - (10% * center/x)
		radius-out: to integer! center/x - (5% * center/x)
		radius-mid: (radius-out - radius-in) / 2 + radius-in
		big: 	 radius-in * 95%
		big-mid: radius-in * 80%
		sml:	 radius-in * 65%
		sml-mid: radius-in * 45%

		either all [not resize block? face/draw][
			canvas: face/draw
		][
			face/draw: clear any [face/draw make block! 1000]
			canvas: face/draw

			prolog: [
				anti-alias on pen black 
				fill-pen white circle -center- -radius- fill-pen off
				line-width 2 line-join bevel
			]
			prolog/8: center
			prolog/9: center/x
			append canvas prolog
			angle: 0 
			until [
				either zero? angle // 30 [
					append canvas poly
					draw-handle/square skip tail canvas -6 center radius-mid radius-out angle 1.5 radius-in
				][
					line/2: center + as-pair (radius-in * cosine angle) (radius-in * sine angle)
					line/3: center + as-pair (radius-out * cosine angle) (radius-out * sine angle)
					append canvas line
				]
				360 = angle: angle + 6
			]

			append canvas poly
			big-handle: skip tail canvas -6
			append canvas poly
			small-handle: skip tail canvas -6
			sec-handle: tail canvas
			append canvas thin

		]
		angle: to integer! time/hour + (time/minute / 60.0) * 30 - 90
		draw-handle small-handle center sml-mid sml angle 7

		angle: time/minute * 6 - 90
		draw-handle big-handle center big-mid big angle 4

		angle: time/second * 6 - 90
		sec-handle/6: center
		sec-handle/7: center + as-pair (big * cosine angle) (big * sine angle)

		show clock
	]

	size-handler: insert-event-func [
		if all [event/window = win event/type = 'resizing clock/state][
			clock/size: face/size
			draw-clock/resize clock
		]
		none
	]

	amiga-blue: 0.82.176

	win: layout/tight [
		title "Amiga Clock"
		clock: base 400x400 amiga-blue rate 0:0:1 on-time [draw-clock clock]
	]
	
	view/options/flags/no-wait win [
		actors: context [on-close: func [f e][remove-event-func :size-handler]]
	][resize]
]

system/view/auto-sync?: yes