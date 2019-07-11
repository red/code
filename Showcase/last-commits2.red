Red [
	Title:   "Last commits on red/red"
	Author:  "Dave Andersen"
	File: 	 %last-commits2.red
	Needs:	 'View
	Purpose:  {
		Retrieves last commits on red/red repo from Github and displays their log
		messages in a scrollable list. (Takes almost as much text to describe
		it, as code to implement it. ;-))
		
		This is a variant of %last-commit.red script. It relies on the powerful
		LOAD function which can recognize different data formats and apply the right
		decoder automatically (JSON codec in this case). The output is a Red tree
		that can then be easily navigated through using path accessors.
	}
]

view [
	text-list data collect [
		foreach event load https://api.github.com/repos/red/red/commits [
			keep event/commit/message
		]
	]
]