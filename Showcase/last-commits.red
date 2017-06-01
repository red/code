Red [
	Title:   "Last commits on red/red"
	Author:  "Nenad Rakocevic"
	File: 	 %last-commits.red
	Needs:	 'View
	Purpose:  {
		Retrieves last commits on red/red from Github and displays their log
		messages in a scrollable list. (Takes almost as much text to describe
		it, as code to implement it. ;-))
	}
]

view [
	text-list data parse
		read https://api.github.com/repos/red/red/events
		[collect [any [thru "message" 3 skip keep to ["\n" | {"}]]]]
]