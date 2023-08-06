Red [
	Title:   "Draw Image Resizing Test"
	Author:  "Nenad Rakocevic"
	History: [REBOL version "Carl Sassenrath" Orginal Red port "Gregg Irwin"]
	File:	 %resize-image2.red
	Needs:   View
	Notes:	 {
		Improves the %resize-image.red script in several ways:
		- bounds the handles movements when dragging to the visible area.
		- allows the image to be moved by dragging it with the mouse, limiting it to the
		  visible area.
	}
]

url: https://pbs.twimg.com/profile_images/501701094032941056/R-a4YJ5K.png
radius: 5x5												;-- grab-size

view compose/deep [
	title "Draw Image Resizing Test"
	backdrop water
	text bold water white  "Red resize image test"
	text bold water yellow "Drag the grab handles"
	return
	panel 960x720 black [
		style nub: base (radius * 2) transparent loose draw [fill-pen yellow circle (radius) (radius/x)]
		
		img: image url 100x100 loose on-drag [
			no-react [
				left/offset:  img/offset - radius
				right/offset: img/offset + img/size - radius
				show [left right]
			]
		] react [
			face/offset: left/offset  + radius
			face/size:   right/offset - left/offset
		]
		at img/offset 				left:  nub on-drag-start [object [min: negate radius  max: right/offset]]
		at img/offset + img/size	right: nub on-drag-start [object [min: left/offset  max: face/parent/size - right/size + radius]]
	]
]