Red [
	Title:   "Spline demo"
	Author:  "Xie Qingtian, Nenad Rakocevic"
	File: 	 %spline.red
	Needs:	 'View
	Date:    "22/06/2016"
	License: "MIT"
	Notes: 	{
		This is a simple spline tool allowing you to move the control points position
		manually and see the spline's shape change accordingly.
		
		Note: there is a minor bug with circles drawing, which should be fixed soon, so
		no need to report it.
	}
]

system/view/auto-sync?: yes

light-blue: 102.148.179.36

view/tight [
	title "Spline demo"
	style nub: base glass 10x10 loose draw [pen light-blue fill-pen light-blue circle 5x5 5]
	
	canvas: base white 600x600 react [
		face/draw: reduce [
			'line-width 2
			'pen black
			'spline
			p1/offset + 5
			p2/offset + 5
			p3/offset + 5
			p4/offset + 5
			p5/offset + 5
			p6/offset + 5
		]
	]
	
	at 240x400 p1: nub
	at 240x320 p2: nub
	at 120x100 p3: nub
	at 500x100 p4: nub
	at 460x500 p5: nub
	at 100x500 p6: nub
]