Red [
	Title:   "Calculator demo"
	Author:  "Nick Antonaccio"
	File: 	 %calculator.red
	License: "Public domain"
	Needs:	 'View
	Notes:   "Very simple calculator app. More from Nick at http://redprogramming.com"
]

view [
	title "Calculator"
	style b: button 60x60 bold font-size 18 [append f/text face/text]
	b "C" 60x50 [clear f/text]
	f: text 200x50 right white font-size 18 "" return
	b "1"  b "2"  b "3"  b " + "  return
	b "4"  b "5"  b "6"  b " - "  return
	b "7"  b "8"  b "9"  b " * "  return
	b "0"  b "."  b " / "  b "=" [attempt [f/data: math load f/text]]
]