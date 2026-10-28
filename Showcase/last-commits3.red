Red [
	Title:   "Last commits on red/red"
	Author:  "Dave Andersen, Nenad Rakocevic"
	File: 	 %last-commits3.red
	Needs:	 'View
	Purpose:  {
		Retrieves last commits on red/red repo from Github and displays their log
		messages in a scrollable list. (Takes almost as much text to describe
		it, as code to implement it. ;-))
		
		This is an extended version of %last-commit2.red script. It also retrieves
		the web URL for the commit, stores it in the text-list (encoding them as
		issue! values to not be displayed). On double-clicking one of the commit
		log, the corresponding webpage on Github will get opened.
		
		`first split ... newline` is there to extract the first line only from
		the commit log.
	}
]

view [
	text-list data collect [
		foreach event load https://api.github.com/repos/red/red/commits [
			keep first split event/commit/message newline
			keep to-issue event/html_url
		]
	] on-dbl-click [browse to-url face/data/(event/picked * 2)]
]