Red [
	Title:  "Mandelbrot"
	Author: "Fullstack Technologies team" 
	Needs:  'View
	Tabs:	4
	Notes:  {
		Ported from http://rebol2.blogspot.com/2013/03/mandelbrot.html
		
		This version is in pure Red, see the mandelbrot-fast.red script
		for a Red + Red/System fast version.
	}
]

mandelIter: function [cx cy maxIter][
	x: y: xx: yy: xy: 0.0
	i: maxIter
	while [all [i > 0 xx + yy <= 4]] [
		i: i - 1
		xy: x * y
		xx: x * x
		yy: y * y
		x:  xx - yy + cx
		y:  xy + xy + cy
	] i: i - 1
	maxIter - i
]

mandelbrot: function [img xmin xmax ymin ymax iterations][
	width:  img/image/size/x
	height: img/image/size/y
	pix:	img/image/rgb
	
	img/image/rgb: white
	
	iy: 0
	while [iy < height] [
		ix: 0
		while [ix < width] [
			x: xmin + ((xmax - xmin) * ix / (width - 1))
			y: ymin + ((ymax - ymin) * iy / (height - 1))
			i: mandelIter x y iterations
			
			change pix either i > iterations [as-color 0 0 0][
				c: 3 * (log-e i) / log-e (iterations - 1.0)
				case [
					c < 1 [as-color to integer! 255 * c 0 0]
					c < 2 [as-color 255 to integer! 255 * (c - 1) 0]
					true  [as-color 255 255 to integer! 255 * (c - 2)]
				]
			]
			pix: skip pix 3
			ix: ix + 1
		]
		unless img/state [exit]
		img/image/rgb: head pix
 		show img
 		do-events/no-wait								;-- allow GUI msgs to be processed
		iy: iy + 1
	]
]

view [
	title "Red Mandelbrot"
	below
	style txt: text 60 right font-size 10
	
	group-box 2 [
		style fld: field 60
		txt "x-min" xmin: fld "-2.0"
		txt "x-max" xmax: fld  "1.0"
		txt "y-min" ymin: fld "-1.0"
		txt "y-max" ymax: fld  "1.0"
		txt "iterations" iterations: fld "100"
	]
	button "Draw" 150x40 [
		t0: now/time/precise
		mandelbrot img xmin/data xmax/data ymin/data ymax/data iterations/data
		dt/data: round now/time/precise - t0
	]
	across txt "time (s):" dt: txt
	below return
	img: image 900x600
]