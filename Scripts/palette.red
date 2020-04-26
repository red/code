Red [
	Title:   "Palette"
	Author:  @9214
	Date:    27-Dec-2017
	File:    %palette.red
	Needs:   View
	Purpose: {
		Shows a 4x11 palette of all built-in colors.
		Features an inscrutable one-liner that fetches all the color names
		and programmatic generation of VID code.
	}
]

colors: exclude sort extract load help-string tuple! 2 [transparent glass]

view/tight collect [
	keep [title "Palette"]
	until [
		foreach color take/part colors 4 [
			keep reduce [
				'base 70x40
					lowercase form color
					get color
					pick [white black] gray > get color
			]
		]
		keep 'return
		empty? colors
	]
]
