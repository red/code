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
     style b: button 50x50 bold font-size 18 [append f/text face/text]
	 b "C" 50x40 [clear f/text]
     f: base 170x40 right white font-size 18 "" return 
     b "1"  b "2"  b "3"  b " + "  return 
     b "4"  b "5"  b "6"  b " - "  return 
     b "7"  b "8"  b "9"  b " * "  return 
     b "0"  b "."  b " / "  b "=" [
     	attempt [
             calculation: form math load f/text 
             append clear f/text calculation
     	]
     ] 
]