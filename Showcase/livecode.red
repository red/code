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
	output-panel: panel 600x800
	source-area: area 600x800 wrap font-name "Consolas" on-key-up [
		attempt [output-panel/pane: layout/only load source-area/text]
	]
]
