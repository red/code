Red [
	Title:	"Red window & screen capture VID demo"
	Author:	"Qingtian Xie"
	File:	%face-to-image-vid.red
	Tabs:	4
	Needs:	'View
	Rights:	"Copyright (C) 2016 Qingtian Xie. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

view [
	title "Simple Capturing demo"
	style btn: button 100x40
	pad 30x0
	btn "Capture Self" [
		img: to-image face
		canvas/draw: reduce ['image img canvas/size - img/size / 2]
	]
	btn "Capture Window" [
		canvas/draw: reduce ['image to-image face/parent 0x0 canvas/size]
	]
	btn "Capture Screen" [
		canvas/draw: reduce [
			'image to-image system/view/screens/1
			0x0 canvas/size
		]
	]
	return
	canvas: image 400x330
]
