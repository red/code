Red [
	Title:   "Last commits on red/red"
	Author:  "Nenad Rakocevic"
	File: 	 %last-commits.red
	Needs:	 'View
	Purpose:  {
		Retrieves last commits on red/red repo from Github and displays their log
		messages in a scrollable list. (Takes almost as much text to describe
		it, as code to implement it. ;-))
		
		This example does not need any "variable", nor does define any function.
		It combines two declarative DSLs (VID and Parse) to achieve optimal
		expressiveness.
	}
]

view [
	text-list data parse
		read https://api.github.com/repos/red/red/commits
		[collect [any [thru {"message":"} keep to [{"} | "\n"]]]]
]