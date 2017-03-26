Red [
	Title:  "Mandelbrot (fast)"
	Author: "Fullstack Technologies team"
	Needs:  'View
	Tabs:	4
	Notes:  {
		Ported from http://rebol2.blogspot.com/2013/03/mandelbrot.html
		
		/// This script requires compilation, it cannot run from the console ///
		
		This version is using Red/System DSL for doing the calculations and
		poking colors in the bitmap. It is still sub-optimal, and will be
		way faster once the integer/float conversions will be properly supported
		in Red/System. Also, the current RGB buffer imposes a byte-level access,
		this will be replaced with a RGBA buffer with direct 32-bit accesses.
	}
]

mandelbrot-iter: routine [
	cx [float!] cy [float!] max-iter [integer!] return: [integer!]
	/local x y xx yy xy i
][
	x: 0.0 y: 0.0 xx: 0.0 yy: 0.0 xy: 0.0 
	i:  max-iter
	
	while [all [i > 0 xx + yy <= 4.0]][
		i: i - 1
		xy: x * y
		xx: x * x
		yy: y * y
		x:  xx - yy + cx
		y:  xy + xy + cy
	]
	i: i - 1
	max-iter - i
]

fast-mandelbrot: routine [
	img  [image!] iterations [integer!] width [float!] height [float!]
	xmin [float!] xmax [float!] ymin [float!] ymax [float!]
	/local
		i [integer!] c [float!] pix [int-ptr!] ix iy x y handle b p
][
	iy:	0.0
	handle: 0
	pix: image/acquire-buffer img :handle
	
	while [iy < height][
		ix: 0.0
		while [ix < width][
			x: xmin + ((xmax - xmin) * ix / (width - 1.0))
			y: ymin + ((ymax - ymin) * iy / (height - 1.0))
			
			i: mandelbrot-iter x y iterations
			
			pix/value: either i > iterations [FF000000h][
				c: 3.0 * (log-2 as-float i) / log-2 as-float (iterations - 1)
				case [
					c < 1.0 [FF000000h or (FFh and (as-integer 255.0 * c) << 16)]
					c < 2.0 [FFFF0000h or (FFh and (as-integer 255.0 * (c - 1.0)) << 8)]
					true	[FFFFFF00h or (FFh and (as-integer 255.0 * (c - 2.0)))]
				]
			]
			pix: pix + 1
			ix: ix + 1.0
		]
		iy: iy + 1.0
	]
	image/release-buffer img handle yes
]

mandelbrot: function [image xmin xmax ymin ymax iterations][
	width:  to float! image/size/x
	height: to float! image/size/y
	
	image/rgb: white
	fast-mandelbrot image iterations width height xmin xmax ymin ymax
]

view [
	title "Red Mandelbrot (fast)"
	style txt: text 60 right font-size 10
	below
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
		mandelbrot canvas/image xmin/data xmax/data ymin/data ymax/data iterations/data
		dt/data: third now/time/precise - t0
	]
	panel [origin 0x0 across txt "time(s):" dt: txt left 100]
	return
	canvas: image 900x600
]