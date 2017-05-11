Red [
	Title:   "Draw Image Resizing Test"
	Author:  [REBOL version "Carl Sassenrath" Red port "Gregg Irwin"]
	Version: 0.0.1
	File:	 %resize-image.red
	Needs:   View
]

distance: func [pos [pair!]][square-root add pos/x ** 2 pos/y ** 2]

grab-size: 5

hit?: func [dist] [dist <= grab-size]

hit: none

mouse-down: func [face event][
	mouse-state: 'down
	hit: none
	down-pos: event/offset
	if hit? distance (down-pos - d-img/:IDX_I_TL) [hit: IDX_I_TL]
	if hit? distance (down-pos - d-img/:IDX_I_BR) [hit: IDX_I_BR]
]
mouse-up: func [face event][
	mouse-state: 'up
	down-pos: none
]
mouse-down?: does [mouse-state = 'down]

mouse-move: func [face event][
	either mouse-down? [
		if hit [
			d-img/:hit: event/offset
			switch hit reduce [
				IDX_I_TL [d-grab-tl/:IDX_G_POS: event/offset]
				IDX_I_BR [d-grab-br/:IDX_G_POS: event/offset]
			]
		]
	][
		; Here you could do something like change the color of the 
		; grab handle you're over.
	]
]

;img-url: https://upload.wikimedia.org/wikipedia/en/2/24/Lenna.png
img-url: https://pbs.twimg.com/profile_images/501701094032941056/R-a4YJ5K.png
img: load/as read/binary img-url 'png


draw-blk: compose [
	d-img: image img 100x100 (50x50 + img/size)
	fill-pen yellow
	d-grab-tl: circle 100x100 (grab-size)
	d-grab-br: circle (50x50 + img/size) (grab-size)
]

IDX_I_IMG: 2    ; image in canvas draw block
IDX_I_TL:  3    ; top-left
IDX_I_BR:  4    ; bottom-right
IDX_G_POS: 2	; Grab handle center

view [
	title "Draw Image Resizing Test"
	backdrop water
	text     water bold font-color white "Red resize image test"
	text 200 water bold font-color yellow "Drag the grab handles"
	return
	canvas: base 960x720 black all-over draw draw-blk
		on-down :mouse-down
		on-up   :mouse-up
		on-over :mouse-move
	do [
		mouse-state: 'up
	]
]