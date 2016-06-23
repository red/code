Red [
	Title:   "Bubbles"
	Author:  [REBOL version "Gabriele Santilli" Red port "Gregg Irwin"]
	File: 	 %bubbles.red
	Tabs:	 4
	Needs:	 View
]

system/view/auto-sync?: no

bubbles: make block! 1500
d: [
	pen 80.80.255.175
	fill-pen linear 0x0 0 400 90 1 1 10.10.255 0.0.100
	box 0x0 400x400
]

t: now/time/precise
random/seed to integer! t/second

rand: func [v] [random v]
rnd-pair: does [as-pair rand 400 rand 400]

move-bubble: func [bubble] [
	bubble/1/x: bubble/1/x - 3 + rand 5
	bubble/1/y: bubble/1/y - 2 - rand 6
	if bubble/1/y < 24 [bubble/1/y: 428]
	bubble/-10: bubble/1 - (bubble/2 / 3)
]

loop 100 [
	insert insert bbl: insert tail d [
		fill-pen radial 150x150 30 450 0 1 1 128.128.255.105 90.90.255.165 80.80.255.175 
		circle
	] rnd-pair 4 + rand 20

	; Take these adjustments out for flat, cartoonish bubbles
	bbl/-8: bbl/2 * 2					; gradient end = circle radius
										;!! R2 version does not use * 2 here
	bbl/-9: to integer! bbl/2 * 0.2		; gradient start = 20% of radius ; decimal! chokes draw right now
	bbl/-10: (bbl/1 - (bbl/2 / 3))		; gradient offset = offset - 1/3 radius

	append/only bubbles bbl
]

view [
	size 400x400
	origin 0x0
	canvas: base 400x400 10.10.255 draw d rate 60
	on-time [
		foreach bubble bubbles [move-bubble bubble]
		show canvas
	]

]

system/view/auto-sync?: yes