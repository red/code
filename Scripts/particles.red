Red [
	Title:  "Particles demo"
	Author: "Qingtian Xie"
	File:   %particles.red
	Tabs:	4
	Note:   "Ported from http://www.rebol.com/view/demos/particles.r"
	Needs:  View
]

system/view/auto-sync?: no

context [
	screen-size: 600x500
	particles-count: 100
	slots: 7
	particles: make block! 100 * slots
	fps: rot: bx: 0

	to-text: func [val][
		particles-count: to integer! val * 200
		append copy "number of particles: " particles-count
	]

	view/no-wait [
		title "Particles demo"
		txt: text "number of particles: 100"
		text "FPS: 0" rate 1 on-time [
			append clear skip face/text 5 fps
			show face
			fps: 0
		]
		slider 50% [
			txt/text: to-text face/data
			show txt
		]
		return
		bx: base black screen-size
	]
	bx/draw: make block! particles-count * 14

	while [bx/state][
		particles: head particles
		loop 10 [
			if (length? particles) / slots < particles-count [
				rot: (rot + 2) // 360
				center: screen-size / 2
				reduce/into [
					color: random 255.255.255.0
					color + 0.0.0.255
					(center/x + (center/x / 3.0 * sine rot))
					(center/y + (center/y / 3.0 * cosine rot))
					(random 25) + 10
					(random 200) / 10.0 - 10
					(random 200) / 10.0 - 10
				] tail particles
			]
		]

		clear fx: bx/draw
		insert fx [pen off]

		while [not tail? particles] [
			p: particles
			p/3: p/3 + p/6
			p/4: p/4 + p/7
			pos: as-pair p/3 p/4
			either not within? pos 0x0 - p/5 screen-size + p/5 [
				remove/part particles slots
			][
				reduce/into [
					'fill-pen 'radial pos 0 p/5 p/2 p/2 p/1 * 2
						p/2 - 0.0.0.128 p/2 - 0.0.0.64 p/2 'circle pos p/5
				] tail fx
				particles: skip particles slots
			]
		]
		show bx
		fps: fps + 1
		loop 5 [do-events/no-wait]
	]
]

system/view/auto-sync?: yes