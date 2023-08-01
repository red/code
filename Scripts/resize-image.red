Red [
	Title:   "Draw Image Resizing Test"
	Author:  "Nenad Rakocevic"
	History: [REBOL version "Carl Sassenrath" Orginal Red port "Gregg Irwin"]
	File:	 %resize-image.red
	Needs:   View
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
		
		img: image url 100x100 react [
			face/offset: left/offset  + radius
			face/size:   right/offset - left/offset
		]
		at img/offset 			  left: nub
		at img/offset + img/size  right: nub
	]
]