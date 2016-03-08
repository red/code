Red [
	Title:   "Simple GUI livecoding demo"
	Author:  "Nenad Rakocevic"
	File: 	 %livecode.red
	Needs:	 'View
	Usage:  {
		Type VID code in the right area, you will see the resulting GUI components
		rendered live on the left side and fully functional (events/actors/reactors working live).
	}
]

view [
	title "Red Livecoding"
	output: panel 400x600
	source: area 500x600 wrap font-name "Fixedsys" on-key-up [
		attempt [output/pane: layout/only load source/text]
	]
]
