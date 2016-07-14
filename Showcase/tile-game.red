Red [
	Title: 		"Tile game"
	Purpose:	{An implementation in Red of the 4x4 sliding tile puzzle} 
	Author:		"Rudolf W. MEIJER (meijeru)"
	File:		%tile-game.red
	Needs:		'View
	Usage:		{
				 Click on any tile that is adjacent to the empty space
				 and it will shift to that space.
				 Try to obtain a given configuration, e.g. 1 to 15 in order.
				}
	Note:		{
				 See also http://www.tilepuzzles.com.
				 Original R2 code (with helpful comments) found in 
				 http://re-bol.com/rebol.html#section-6.3
				 (thanks Nick Antonaccio!).
				 This minimal version starts in the ordered configuration,
				 so preferably have someone else "mess it up" for you first.
				 A version which allows to randomize the order of the tiles
				 is available at https://gist.github.com/meijeru/00c1693a00418481b90b
				}
]

view/tight [
	title "Tile game"
	style piece: button 60x60 font-size 12 bold [
		unless find [0x60 60x0 0x-60 -60x0] face/offset - empty/offset [exit]
		pos: face/offset face/offset: empty/offset empty/offset: pos
	]
	piece "1"  piece  "2" piece  "3" piece  "4" return
	piece "5"  piece  "6" piece  "7" piece  "8" return
	piece "9"  piece "10" piece "11" piece "12" return
	piece "13" piece "14" piece "15" empty: piece "" return
	button 240x60 "Shuffle" [
		numbers: random [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]
		forall numbers [
			;get the Nth button and set its text
			set in pick system/view/screens/1/pane/1/pane index? numbers 'text form first numbers
		]
	]
]