Red [
	Title:  "Procedural perlin noise clouds"
	Author: "Steeve Antoine"
	File:	%perlin.red
	Needs:  'View
	Tabs:	4
	Notes:  {
		This script requires compilation to work. From OS command-line:
			$ red -c perlin.red
		
		Feel free to post enhancements.
		Especially to optimize the routines (Red/system) since they are a first try.  
		By modifying the apply-texture function it's possible to construct various effects:
		Plasma, water, fire effects are possible.
		Search for perlin noise applications on the net to analyze samples.
		Although I used a monochrome image in this demo, the apply-texture function only modifies 
			the alpha channel on an input image,
		so it's possible to apply a texture to any type of image.
	}
]

rnd: [
	151 160 137 91 90 15 
	131 13 201 95 96 53 194 233 7 225 140 36 103 30 69 142 8 99 37 240 21 10 23 
	190  6 148 247 120 234 75 0 26 197 62 94 252 219 203 117 35 11 32 57 177 33 
	88 237 149 56 87 174 20 125 136 171 168  68 175 74 165 71 134 139 48 27 166 
	77 146 158 231 83 111 229 122 60 211 133 230 220 105 92 41 55 46 245 40 244 
	102 143 54  65 25 63 161  1 216 80 73 209 76 132 187 208  89 18 169 200 196 
	135 130 116 188 159 86 164 100 109 198 173 186  3 64 52 217 226 250 124 123 
	5 202 38 147 118 126 255 82 85 212 207 206 59 227 47 16 58 17 182 189 28 42 
	223 183 170 213 119 248 152  2 44 154 163  70 221 153 101 155 167  43 172 9 
	129 22 39 253  19 98 108 110 79 113 224 232 178 185  112 104 218 246 97 228 
	251 34 242 193 238 210 144 12 191 179 162 241  81 51 145 235 249 14 239 107 
	49 192 214  31 181 199 106 157 184  84 204 176 115 121 50 45 127  4 150 254 
	138 236 205 93 222 114 67 29 24 72 243 141 128 195 78 66 215 61 156 180
]

;noise: func [rnd xy /local idx][ 
;	;-- same pair seed xy gives same result
;	idx: xy/x and 255 + 1
;	idx: rnd/:idx + xy/y and 255 + 1
;	to float! rnd/:idx - 128
;]

noise: routine [rnd [block!] x [integer!] y [integer!] return: [float!] /local idx][ 
	;-- same pair seed xy gives same result
	idx: as red-integer! block/rs-abs-at rnd x and 255
	idx: as red-integer! block/rs-abs-at rnd idx/value + y and 255
	as-float idx/value - 128
]

;-- linear interpolation
interpolate: routine [a [float!] b [float!] frac [float!] return: [float!]][
	b - a * frac + a
]

;-- smouth cosine curve
smouth: func [frac [float!]][
	(1.0 - cosine frac * 180.0) / 2.0
]

;-- precalculated table for smouthing curve
curve-table: make block! 256
repeat i 256 [
	append curve-table smouth (to float! i - 1) / 255.0 
]

;--There is probably some cleaning and optimizations (faster) to do. 
gen-texture: routine [
	octaves [integer!]		"number of octaves. Increase the noise ( 1 --> n)" 
	persistence [float!]	"value near 1.0 sharpens the noise (0 - 1.0)" 
	detail [float!]			"value near 1.0 generates less complex textures (0 - 1.0)"
	data [block!]	
	size [pair!]
	rnd [block!]
	curve-table [block!]
	return: [block!]
	/local val tmp p x y -x -y size-x size-y i _xy frequence coeff amplitude yy dy xx dx A B C D bilinear
][
	size-x: size/x - 1
	size-y: size/y - 1
	i: 1
	until [
		_xy: -100
		x: 0
		y: 0
		frequence: 1 << (i - 1) ;2 ** (i - 1)
		coeff: 256.0 * detail * as-float frequence 
		
		amplitude: pow persistence as-float (i - 1)

		yy: 0.0
		p: 0
		-y: 0
		while [-y < size-y] [
			-y: -y + 1
			yy: yy + coeff
			if 255.0 < yy [
				yy: yy % 255.0
				y: y + 1
			]

			;dy: pick curve-table to integer! yy + 1.5
			tmp: as red-float! block/rs-abs-at curve-table as-integer yy + 0.5
			dy: tmp/value

			xx: 0.0
			x: 0
			p: p + 1
			-x: 0
			while [-x < size-x][
				-x: -x + 1
				xx: xx + coeff
				if 255.0 < xx [
					xx: xx % 255.0
					x: x + 1
				]

				;dx: pick curve-table to integer! xx + 1.5
				tmp: as red-float! block/rs-abs-at curve-table as-integer xx + 0.5
				dx: tmp/value
				
				if (y << 16 + x) <> _xy [
					A: noise rnd x y
					B: noise rnd x + 1  y
					C: noise rnd x y + 1
					D: noise rnd x + 1 y + 1
					_xy:  y << 16 + x
				]

				;-- bilinear interpolation
				bilinear: interpolate 
					B - A * dx + A ;-- interpolate A B dx 
					D - C * dx + C ;-- interpolate C D dx 
					dy	

				;-- tmp: pick data x
				tmp: as red-float! block/rs-abs-at data (p - 1)
				
				;-- poke data x amplitude * bilinear + tmp/value 
				tmp/value: amplitude * bilinear + tmp/value
				p: p + 1
			]
		]
		i: i + 1
		i > octaves
	]
	data
]

;-- apply texture on alpha channel
apply-texture: routine [
	src  [image!]
	texture [block!]
	luma [integer!]
	/local
	    pix [int-ptr!]
		s [series!]
		val [red-float!]
	    handle h w x y r g b a int
][
	handle: 0
	pix: image/acquire-buffer src :handle
	s: GET_BUFFER(texture)
	val: as red-float! s/offset

	w: IMAGE_WIDTH(src/size)
	h: IMAGE_HEIGHT(src/size)
	x: 0
	y: 0
	while [y < h] [
	   while [x < w][
	   	int: luma + as-integer val/value
		if int < 0 [int: 0 - int]
		if int > 255 [int: 255]

	    pix/value: pix/value and 00FFFFFFh OR (int << 24 )
	    x: x + 1
	    pix: pix + 1
		val: val + 1
	   ]
	   x: 0
	   y: y + 1
	]
	image/release-buffer src handle yes
]

octaves: 4			;** increase the noise
persistence: 40%	;** values near 1, sharpen the noise (0% - 100%) 
detail: 1.25%		;** values near 1, generate less complex textures (0% - 100%)
luma: 64			;** 0 - 255

;** Go..
size: 400x400
img: make image! reduce [size sky]

rebuild: has [saved parms new][
	saved: []
	parms: [octaves persistence detail luma]
	either saved = new: reduce parms [
		return false
	] [
		append clear saved new
	]

	texture: append/dup clear [] 0.0 size/x * size/y
	gen-texture octaves (0.0 + persistence) (0.0 + detail) texture size rnd curve-table
	apply-texture img texture luma
	true
]

view compose/deep [
	title "Perlin noise demo"
	text "Procedural cloud texture using Perlin noise" return
	across
	image black img 
	panel [
		text "octaves:" os: slider 256 40% ot: text 50
		return text "sharpen:" ps: slider 256 persistence pt: text 50
		return text "detail:" ds: slider 256 (detail ** 0.25) dt: text 70
		return text "luma:" ss: slider 256 (to percent! 0.0 + luma / 255.0) st: text 50
	
		react [
			os/data: max 10% round/to os/data 10%
			octaves: to integer! 10 * os/data
			ot/text: form octaves 

			persistence: 0.0 + ps/data
			pt/text: form round/to ps/data 1%

			detail: 0.0 + ds/data ** 4.0
			dt/text: form round/to to percent! detail 0.001%

			luma: to integer! 0.0 + ss/data * 255
			st/text: form luma

			rebuild 
		]
	]
] 
