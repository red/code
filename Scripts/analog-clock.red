Red [
	Title:  "Red O'clock"
	Author: "Gregg Irwin"
	Needs:	View
	File:	%analog-clock.red
	Tabs:	4
]

degree-to-xy: func [rad "radius" deg "degrees"] [
	as-pair (rad * sine deg) (rad * negate cosine deg)
]

sex-to-degree: func ["Sexagesimal to degrees" n] [n * 6]

; Positioning the hour hand isn't as easy as using the hour value
; directly, because it's not sexagesimal and we only have 12 hours
; on the clock for a 24 hour period. It's also nice if it doesn't
; just jump from one hour mark (= 5 ticks) to the next, but moves
; gradually between them based on the number of minutes.
hour-to-tick: func [
	t [time!]] [5 * ((t/hour // 12) + ((to float! t/minute) / 60))
]


outer-wd: 4										; thickness of outer ring
size: 200x200									; overall clock size
radius: first size / 2
center: size / 2

hand-len: reduce ['hour radius * .65  'min radius * .85  'sec radius * .8]

; Start with the outer circle
draw-blk: compose [
	pen red line-cap round
	line-width (outer-wd) fill-pen white circle (center) (radius - outer-wd)
	line-width 2								; tick mark width
]

; Add tick marks
repeat i 60 [
	tick-len: switch/default i [				; Could do modulos here of course
		15 30 45 60 [25]
		5 10 20 25 35 40 50 55 [15]
	][7]
	p1: center + (degree-to-xy (radius - outer-wd) (sex-to-degree i))
	p2: center + (degree-to-xy (radius - tick-len - outer-wd) (sex-to-degree i))
	repend draw-blk ['line p1 p2]
]

; This is how we'll draw the hands. We just update line commands for them
; in the draw block each time.
update-hand: function [
	hand [word!] "Maps to position in draw block"
	tick [number!] "0-60"
][
	; Position in draw block
	pos: get select [hour hour-idx min min-idx sec sec-idx] hand
	change pos reduce [
		'line center (center + (degree-to-xy hand-len/:hand (sex-to-degree tick)))
	]
]

t: now/time
hour-idx: min-idx: sec-idx: none

; This is a little funky. We add the setup for each hand to the draw
; block, mark that position, and then update the hand, which will add
; the line command for the hands the first time it is run. After that
; update-hand will modify the draw block rather than adding to it.
hour-idx: tail append draw-blk [pen crimson line-cap round line-width 4]
update-hand 'hour hour-to-tick t
min-idx: tail append draw-blk [line-width 3]
update-hand 'min  t/minute
sec-idx: tail append draw-blk compose [line-width 1 pen brick fill-pen brick circle (center) 3]
update-hand 'sec  t/second

view compose/only [
	title "Clock"
	size (size)
	origin 0x0
	clock: base (size) draw (draw-blk) rate 1 on-time [
		t: now/time
		update-hand 'hour hour-to-tick t
		update-hand 'min  t/minute + ((to float! t/second) / 60)
		update-hand 'sec  t/second
	]
	do [
		clock/color: none
	]
]