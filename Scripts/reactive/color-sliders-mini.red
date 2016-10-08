Red [
	Title:   "RGB sliders mini demo"
	Author:  "Nenad Rakocevic"
	File: 	 %color-sliders-mini.red
	Needs:	 'View
	Notes:	 {
		Demo of chained reactive programming, moving the sliders changes the box's color.
		This demo is reduced to the bare minimum.
	}
]

to-int: function [value [percent!]][to integer! 255 * value]

view [
	below
	R: slider
	G: slider
	B: slider
	base react [
		face/color: as-color to-int R/data to-int G/data to-int B/data
	]
]