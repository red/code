Red [
	Title:   "Puppy Finder"
	Author:  @9214
	Date:    26-Apr-2020
	File:    %puppy-finder.red
	Needs:   View
	Purpose: {
		This demo is a port of Matthew Carter's "Puny GUI Puppy Finder",
		showcasing the conjoint use of View, VID, and JSON/JPEG codecs.
		
		Original: https://ahungry.com/blog/2020-04-24-Puny-GUI-Puppy-Finder.html
	}
]

view [
	title "Puppy Finder"
	below center
	button "Find a new dog" [
		puppy/image: load to-url select
			load https://dog.ceo/api/breeds/image/random
			'message
	]
	text "Click the button to see a new dog.^/Click the dog to close the app." 
	puppy: image 300x300 [unview]
]
