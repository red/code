Red/System [
	Title:   "Red/System 3D-math - vector related code (float32! version)"
	Author:  "Oldes"
	File:    %vector-float32.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]
#define TO_RADIANS(value) [pi * value / 180.0]

#define FLOAT32_NEGATE    [(as float32! 0.0) -]
#define FLOAT32_ZERO?     [(as float32! 0.0) =]

vec3f!: alias struct! [x [float32!] y [float32!] z [float32!]]
vec4f!: alias struct! [x [float32!] y [float32!] z [float32!] w [float32!]]

vec3f: context [
	make: func[
		x [float!]
		y [float!]
		z [float!]
		return: [vec3f!]
		/local v
	][
		v: as vec3f! allocate size? vec3f!
		v/x: as float32! x
		v/y: as float32! y
		v/z: as float32! z
		v
	]

	assign: func[
		out     [vec3f!]
		in      [vec3f!]
		return: [vec3f!]
	][
		out/x: in/x out/y: in/y out/z: in/z
		out
	]

	length: func[
		in      [vec3f!]
		return: [float32!]
	][
		as float32! sqrt as float! ((in/x * in/x) + (in/y * in/y) + (in/z * in/z))
	]

	add: func[
		out     [vec3f!]
		v1      [vec3f!]
		v2      [vec3f!]
		return: [vec3f!]
	][
		out/x: v1/x + v2/x
		out/y: v1/y + v2/y
		out/z: v1/z + v2/z
		out
	]

	subtract: func[
		out     [vec3f!]
		v1      [vec3f!]
		v2      [vec3f!]
		return: [vec3f!]
	][
		out/x: v1/x - v2/x
		out/y: v1/y - v2/y
		out/z: v1/z - v2/z
		out
	]

	normalize: func[
		out     [vec3f!]
		in      [vec3f!]
		return: [vec3f!]
		/local len tmp
	][
		len: length in
		print-line ["len: " len " " in/x in/y in/z]
		either len < as float32! 0.00001 [
			assign out in
		][
			;len: as float32! 1.0 / len
			out/x: in/x / len
			out/y: in/y / len
			out/z: in/z / len
		]
		out
	]

	cross: func[
		out     [vec3f!]
		v1      [vec3f!]
		v2      [vec3f!]
		return: [vec3f!] 
		/local tmp
	][
		tmp: declare vec3f! ;used because `out` may be same lake one of the input vectors
		tmp/x: (v1/y * v2/z) - (v1/z * v2/y)
		tmp/y: (v1/z * v2/x) - (v1/x * v2/z)
		tmp/z: (v1/x * v2/y) - (v1/y * v2/x)
		copy-memory (as byte-ptr! out) (as byte-ptr! tmp) size? vec3f!
		out
	]

	dot: func[
		v1      [vec3f!]
		v2      [vec3f!]
		return: [float32!] 
	][
		(v1/x * v2/x) + (v1/y * v2/y) + (v1/z * v2/z)
	]

	trace: func[
		v [vec3f!]
	][
		;printf needs C decimal values, so we must cast float32! to float!
		printf ["%.3f^-%.3f^-%.3f^/" as float! v/x as float! v/y as float! v/z]
	]
]