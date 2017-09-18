Red/System [
	Title:   "Red/System 3D-math - matrix related code (float32! version)"
	Author:  "Oldes"
	File:    %matrix-float32.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %vector-float32.reds

mat4f!: alias struct! [
	m00 [float32!] m01 [float32!] m02 [float32!] m03 [float32!]
	m10 [float32!] m11 [float32!] m12 [float32!] m13 [float32!]
	m20 [float32!] m21 [float32!] m22 [float32!] m23 [float32!]
	m30 [float32!] m31 [float32!] m32 [float32!] m33 [float32!]
]

mat4f: context [
	;-- matrix4x4 (float32!) functions
	make: func[
		return: [mat4f!]
		/local m
	][
		m: allocate size? mat4f!
		set-memory m #"^@" size? mat4f!
		as mat4f! m
	]

	identity: func[
		out     [mat4f!]
		return: [mat4f!]
	][
		set-memory as byte-ptr! out #"^@" size? mat4f!
		out/m00: as float32! 1.0
		out/m11: as float32! 1.0
		out/m22: as float32! 1.0
		out/m33: as float32! 1.0
		out
	]

	inverse: func[
		out     [mat4f!]
		in      [mat4f!]
		return: [mat4f!]
		/local
		tmp_0 tmp_1 tmp_2 tmp_3 tmp_4 tmp_5 tmp_6 tmp_7 tmp_8 tmp_9
		tmp_10 tmp_11 tmp_12 tmp_13 tmp_14 tmp_15 tmp_16 tmp_17 tmp_18 tmp_19
		tmp_20 tmp_21 tmp_22 tmp_23 t0 t1 t2 t3 d
	][
		tmp_0:   in/m22 * in/m33
		tmp_1:   in/m32 * in/m23
		tmp_2:   in/m12 * in/m33
		tmp_3:   in/m32 * in/m13
		tmp_4:   in/m12 * in/m23
		tmp_5:   in/m22 * in/m13
		tmp_6:   in/m02 * in/m33
		tmp_7:   in/m32 * in/m03
		tmp_8:   in/m02 * in/m23
		tmp_9:   in/m22 * in/m03
		tmp_10:  in/m02 * in/m13
		tmp_11:  in/m12 * in/m03
		tmp_12:  in/m20 * in/m31
		tmp_13:  in/m30 * in/m21
		tmp_14:  in/m10 * in/m31
		tmp_15:  in/m30 * in/m11
		tmp_16:  in/m10 * in/m21
		tmp_17:  in/m20 * in/m11
		tmp_18:  in/m00 * in/m31
		tmp_19:  in/m30 * in/m01
		tmp_20:  in/m00 * in/m21
		tmp_21:  in/m20 * in/m01
		tmp_22:  in/m00 * in/m11
		tmp_23:  in/m10 * in/m01

		t0: ((tmp_0 * in/m11) + (tmp_3 * in/m21) + (tmp_4  * in/m31)) -
			((tmp_1 * in/m11) + (tmp_2 * in/m21) + (tmp_5  * in/m31))
		t1: ((tmp_1 * in/m01) + (tmp_6 * in/m21) + (tmp_9  * in/m31)) -
			((tmp_0 * in/m01) + (tmp_7 * in/m21) + (tmp_8  * in/m31))
		t2: ((tmp_2 * in/m01) + (tmp_7 * in/m11) + (tmp_10 * in/m31)) -
			((tmp_3 * in/m01) + (tmp_6 * in/m11) + (tmp_11 * in/m31))
		t3: ((tmp_5 * in/m01) + (tmp_8 * in/m11) + (tmp_11 * in/m21)) -
			((tmp_4 * in/m01) + (tmp_9 * in/m11) + (tmp_10 * in/m21))

		d: 1.0 / ((in/m00 * t0) + (in/m10 * t1) + (in/m20 * t2) + (in/m30 * t3))

		out/m00: as float32! d * t0
		out/m01: as float32! d * t1
		out/m02: as float32! d * t2
		out/m03: as float32! d * t3
		out/m10: as float32! d * (((tmp_1  * in/m10) + (tmp_2  * in/m20) + (tmp_5  * in/m30)) -
								  ((tmp_0  * in/m10) + (tmp_3  * in/m20) + (tmp_4  * in/m30)))
		out/m11: as float32! d * (((tmp_0  * in/m00) + (tmp_7  * in/m20) + (tmp_8  * in/m30)) -
								  ((tmp_1  * in/m00) + (tmp_6  * in/m20) + (tmp_9  * in/m30)))
		out/m12: as float32! d * (((tmp_3  * in/m00) + (tmp_6  * in/m10) + (tmp_11 * in/m30)) -
								  ((tmp_2  * in/m00) + (tmp_7  * in/m10) + (tmp_10 * in/m30)))
		out/m13: as float32! d * (((tmp_4  * in/m00) + (tmp_9  * in/m10) + (tmp_10 * in/m20)) -
								  ((tmp_5  * in/m00) + (tmp_8  * in/m10) + (tmp_11 * in/m20)))
		out/m20: as float32! d * (((tmp_12 * in/m13) + (tmp_15 * in/m23) + (tmp_16 * in/m33)) -
								  ((tmp_13 * in/m13) + (tmp_14 * in/m23) + (tmp_17 * in/m33)))
		out/m21: as float32! d * (((tmp_13 * in/m03) + (tmp_18 * in/m23) + (tmp_21 * in/m33)) -
								  ((tmp_12 * in/m03) + (tmp_19 * in/m23) + (tmp_20 * in/m33)))
		out/m22: as float32! d * (((tmp_14 * in/m03) + (tmp_19 * in/m13) + (tmp_22 * in/m33)) -
								  ((tmp_15 * in/m03) + (tmp_18 * in/m13) + (tmp_23 * in/m33)))
		out/m23: as float32! d * (((tmp_17 * in/m03) + (tmp_20 * in/m13) + (tmp_23 * in/m23)) -
								  ((tmp_16 * in/m03) + (tmp_21 * in/m13) + (tmp_22 * in/m23)))
		out/m30: as float32! d * (((tmp_14 * in/m22) + (tmp_17 * in/m32) + (tmp_13 * in/m12)) -
								  ((tmp_16 * in/m32) + (tmp_12 * in/m12) + (tmp_15 * in/m22)))
		out/m31: as float32! d * (((tmp_20 * in/m32) + (tmp_12 * in/m02) + (tmp_19 * in/m22)) -
								  ((tmp_18 * in/m22) + (tmp_21 * in/m32) + (tmp_13 * in/m02)))
		out/m32: as float32! d * (((tmp_18 * in/m12) + (tmp_23 * in/m32) + (tmp_15 * in/m02)) -
								  ((tmp_22 * in/m32) + (tmp_14 * in/m02) + (tmp_19 * in/m12)))
		out/m33: as float32! d * (((tmp_22 * in/m22) + (tmp_16 * in/m02) + (tmp_21 * in/m12)) -
								  ((tmp_20 * in/m12) + (tmp_23 * in/m22) + (tmp_17 * in/m02)))
		out
	]

	assign: func[
		out     [mat4f!]
		in      [mat4f!]
		return: [mat4f!]
	][
		if out = in [return out]
		copy-memory (as byte-ptr! out) (as byte-ptr! in) size? mat4f!
		out
	]

	multiply: func[
		out     [mat4f!]
		m1      [mat4f!]
		m2      [mat4f!]
		return: [mat4f!]
		/local p1 p2 tmp
	][
		p1: (as pointer! [float32!] m1) + 1 ;+1 because Red is 1 based and bellow is zero based indexing
		p2: (as pointer! [float32!] m2) + 1

		tmp: declare mat4f! ;used because `out` may be same lake one of the input matrixes

		tmp/m00: (p1/0 * p2/0 ) + (p1/4 * p2/1 ) + (p1/8  * p2/2 ) + (p1/12 * p2/3 )
		tmp/m01: (p1/1 * p2/0 ) + (p1/5 * p2/1 ) + (p1/9  * p2/2 ) + (p1/13 * p2/3 )
		tmp/m02: (p1/2 * p2/0 ) + (p1/6 * p2/1 ) + (p1/10 * p2/2 ) + (p1/14 * p2/3 )
		tmp/m03: (p1/3 * p2/0 ) + (p1/7 * p2/1 ) + (p1/11 * p2/2 ) + (p1/15 * p2/3 )

		tmp/m10: (p1/0 * p2/4 ) + (p1/4 * p2/5 ) + (p1/8  * p2/6 ) + (p1/12 * p2/7 )
		tmp/m11: (p1/1 * p2/4 ) + (p1/5 * p2/5 ) + (p1/9  * p2/6 ) + (p1/13 * p2/7 )
		tmp/m12: (p1/2 * p2/4 ) + (p1/6 * p2/5 ) + (p1/10 * p2/6 ) + (p1/14 * p2/7 )
		tmp/m13: (p1/3 * p2/4 ) + (p1/7 * p2/5 ) + (p1/11 * p2/6 ) + (p1/15 * p2/7 )
		
		tmp/m20: (p1/0 * p2/8 ) + (p1/4 * p2/9 ) + (p1/8  * p2/10) + (p1/12 * p2/11)
		tmp/m21: (p1/1 * p2/8 ) + (p1/5 * p2/9 ) + (p1/9  * p2/10) + (p1/13 * p2/11)
		tmp/m22: (p1/2 * p2/8 ) + (p1/6 * p2/9 ) + (p1/10 * p2/10) + (p1/14 * p2/11)
		tmp/m23: (p1/3 * p2/8 ) + (p1/7 * p2/9 ) + (p1/11 * p2/10) + (p1/15 * p2/11)
		
		tmp/m30: (p1/0 * p2/12) + (p1/4 * p2/13) + (p1/8  * p2/14) + (p1/12 * p2/15)
		tmp/m31: (p1/1 * p2/12) + (p1/5 * p2/13) + (p1/9  * p2/14) + (p1/13 * p2/15)
		tmp/m32: (p1/2 * p2/12) + (p1/6 * p2/13) + (p1/10 * p2/14) + (p1/14 * p2/15)
		tmp/m33: (p1/3 * p2/12) + (p1/7 * p2/13) + (p1/11 * p2/14) + (p1/15 * p2/15)

		copy-memory (as byte-ptr! out) (as byte-ptr! tmp) size? mat4f!
		out
	]

	perspective: func[
		out     [mat4f!] ;resulted projection matrix
		fovY    [float!]
		aspect  [float!]
		zNear   [float!]
		zFar    [float!]
		return: [mat4f!]
		/local f deltaZ deltaZInv
	][
		set-memory as byte-ptr! out #"^@" size? mat4f!
		deltaZ: zNear - zFar
		if any [deltaZ = 0.0 aspect = 0.0][ return NULL ]

		f: tan ((pi * 0.5) - (0.5 * fovY))
		deltaZInv: 1.0 / deltaZ

		out/m00: as float32! f / aspect
		out/m11: as float32! f
		out/m22: as float32! (zNear + zFar) * deltaZInv
		out/m23: as float32! -1
		out/m32: as float32! zNear * zFar * deltaZInv * 2.0
		out
	]

	orthographic: func[
		out     [mat4f!] ;resulted projection matrix
		left    [float!]
		right   [float!]
		bottom  [float!]
		top     [float!]
		nearVal [float!]
		farVal  [float!]
		return: [mat4f!]
		/local tx ty tz
	][
		tx: 0.0 - ((right + left) / (right - left))
		ty: 0.0 - ((top + bottom) / (top - bottom))
		tz: 0.0 - ((farVal + nearVal) / (farVal - nearVal))

		identity out
		out/m00: as float32!  2.0 / (right  - left)
		out/m11: as float32!  2.0 / (top    - bottom)
		out/m22: as float32! -2.0 / (farVal - nearVal)
		out/m30: as float32! tx
		out/m31: as float32! ty
		out/m32: as float32! tz
		out
	]

	look-at: func[
		out     [mat4f!] ;resulted camera view matrix
		camera  [vec3f!]
		target  [vec3f!]
		up      [vec3f!]
		return: [mat4f!]
		/local xAxis yAxis zAxis
	][
		zAxis: declare vec3f!
		xAxis: declare vec3f!
		yAxis: declare vec3f!

		vec3f/subtract  zAxis camera target
		vec3f/normalize zAxis zAxis 

		vec3f/cross     xAxis up zAxis 
		vec3f/normalize xAxis xAxis

		vec3f/cross     yAxis zAxis xAxis
		vec3f/normalize yAxis yAxis

		out/m00:  xAxis/x  out/m01:  xAxis/y  out/m02:  xAxis/z  out/m03: as float32! 0.0
		out/m10:  yAxis/x  out/m11:  yAxis/y  out/m12:  yAxis/z  out/m13: as float32! 0.0
		out/m20:  zAxis/x  out/m21:  zAxis/y  out/m22:  zAxis/z  out/m23: as float32! 0.0
		out/m30: camera/x  out/m31: camera/y  out/m32: camera/z  out/m33: as float32! 1.0
		out
	]

	frustum: func[
		out     [mat4f!]
		left    [float!]
		right   [float!]
		bottom  [float!]
		top     [float!]
		near    [float!]
		far     [float!]
		return: [mat4f!]
		/local near2 dx dy dz
	][
		near2: 2.0 * near
		dx: right - left
		dy: top - bottom
		dz: far - near

		set-memory as byte-ptr! out #"^@" size? mat4f! ;zero all values
		out/m00: as float32! near2 / dx
		out/m11: as float32! near2 / dy
		out/m20: as float32! (right + left) / dx
		out/m21: as float32! (top + bottom) / dy
		out/m22: as float32! -1.0
		out/m32: as float32! (0.0 - near2 * far) / dz
		out
	]

	rotation-x: func[
		out     [mat4f!]
		angle   [float!] ;amount of rotation in radians
		return: [mat4f!]
		/local c s
	][
		c: cos angle
		s: sin angle
		set-memory as byte-ptr! out #"^@" size? mat4f! ;zero all values
		out/m00: as float32! 1.0
		out/m11: as float32! c
		out/m12: as float32! s
		out/m21: as float32! 0.0 - s
		out/m22: as float32! c
		out/m33: as float32! 1
		out
	]

	rotate-x: func[
		in      [mat4f!]
		angle   [float!] ;amount to rotate in radians
		return: [mat4f!]
		/local c s m10 m11 m12 m13 m20 m21 m22 m23
	][
		m10:  in/m10
		m11:  in/m11
		m12:  in/m12
		m13:  in/m13
		m20:  in/m20
		m21:  in/m21
		m22:  in/m22
		m23:  in/m23

		c: as float32! cos angle
		s: as float32! sin angle

		in/m10: (c * m10) + (s * m20)
		in/m11: (c * m11) + (s * m21)
		in/m12: (c * m12) + (s * m22)
		in/m13: (c * m13) + (s * m23)
		in/m20: (c * m20) - (s * m10)
		in/m21: (c * m21) - (s * m11)
		in/m22: (c * m22) - (s * m12)
		in/m23: (c * m23) - (s * m13)

		in
	]

	rotate-x-into: func[
		out     [mat4f!]
		in      [mat4f!]
		angle   [float!] ;amount to rotate in radians
		return: [mat4f!]
		/local c s m10 m11 m12 m13 m20 m21 m22 m23
	][
		m10:  in/m10
		m11:  in/m11
		m12:  in/m12
		m13:  in/m13
		m20:  in/m20
		m21:  in/m21
		m22:  in/m22
		m23:  in/m23

		c: as float32! cos angle
		s: as float32! sin angle

		out/m10: (c * m10) + (s * m20)
		out/m11: (c * m11) + (s * m21)
		out/m12: (c * m12) + (s * m22)
		out/m13: (c * m13) + (s * m23)
		out/m20: (c * m20) - (s * m10)
		out/m21: (c * m21) - (s * m11)
		out/m22: (c * m22) - (s * m12)
		out/m23: (c * m23) - (s * m13)

		if out <> in [
			out/m00: in/m00
			out/m01: in/m01
			out/m02: in/m02
			out/m03: in/m03
			out/m30: in/m30
			out/m31: in/m31
			out/m32: in/m32
			out/m33: in/m33
		]
		out
	]

	rotation-y: func[
		out     [mat4f!]
		angle   [float!] ;amount of rotation in radians
		return: [mat4f!]
		/local c s
	][
		c: cos angle
		s: sin angle
		set-memory as byte-ptr! out #"^@" size? mat4f! ;zero all values
		out/m00: as float32! c
		out/m02: as float32! 0.0 - s
		out/m11: as float32! 1.0
		out/m20: as float32! s
		out/m22: as float32! c
		out/m33: as float32! 1
		out
	]

	rotate-y: func[
		in      [mat4f!]
		angle   [float!] ;amount to rotate in radians
		return: [mat4f!]
		/local c s m00 m01 m02 m03 m20 m21 m22 m23
	][
		m00:  in/m00
		m01:  in/m01
		m02:  in/m02
		m03:  in/m03
		m20:  in/m20
		m21:  in/m21
		m22:  in/m22
		m23:  in/m23

		c: as float32! cos angle
		s: as float32! sin angle

		in/m00: (c * m00) - (s * m20)
		in/m01: (c * m01) - (s * m21)
		in/m02: (c * m02) - (s * m22)
		in/m03: (c * m03) - (s * m23)
		in/m20: (c * m20) + (s * m00)
		in/m21: (c * m21) + (s * m01)
		in/m22: (c * m22) + (s * m02)
		in/m23: (c * m23) + (s * m03)

		in
	]

	rotate-y-into: func[
		out     [mat4f!]
		in      [mat4f!]
		angle   [float!] ;amount to rotate in radians
		return: [mat4f!]
		/local c s m00 m01 m02 m03 m20 m21 m22 m23
	][
		m00:  in/m00
		m01:  in/m01
		m02:  in/m02
		m03:  in/m03
		m20:  in/m20
		m21:  in/m21
		m22:  in/m22
		m23:  in/m23

		c: as float32! cos angle
		s: as float32! sin angle

		out/m00: (c * m00) - (s * m20)
		out/m01: (c * m01) - (s * m21)
		out/m02: (c * m02) - (s * m22)
		out/m03: (c * m03) - (s * m23)
		out/m20: (c * m20) + (s * m00)
		out/m21: (c * m21) + (s * m01)
		out/m22: (c * m22) + (s * m02)
		out/m23: (c * m23) + (s * m03)

		if out <> in [
			out/m10: in/m10
			out/m11: in/m11
			out/m12: in/m12
			out/m13: in/m13
			out/m30: in/m30
			out/m31: in/m31
			out/m32: in/m32
			out/m33: in/m33
		]
		out
	]

	rotation-z: func[
		out     [mat4f!]
		angle   [float!] ;amount of rotation in radians
		return: [mat4f!]
		/local c s
	][
		c: cos angle
		s: sin angle
		set-memory as byte-ptr! out #"^@" size? mat4f! ;zero all values
		out/m00: as float32! c
		out/m02: as float32! s
		out/m11: as float32! 0.0 - s
		out/m12: as float32! c
		out/m22: as float32! 1
		out/m33: as float32! 1
		out
	]

	rotate-z: func[
		in      [mat4f!]
		angle   [float!] ;amount to rotate in radians
		return: [mat4f!]
		/local c s m00 m01 m02 m03 m10 m11 m12 m13
	][
		m00:  in/m00
		m01:  in/m01
		m02:  in/m02
		m03:  in/m03
		m10:  in/m10
		m11:  in/m11
		m12:  in/m12
		m13:  in/m13

		c: as float32! cos angle
		s: as float32! sin angle

		in/m00: (c * m00) + (s * m10)
		in/m01: (c * m01) + (s * m11)
		in/m02: (c * m02) + (s * m12)
		in/m03: (c * m03) + (s * m13)
		in/m10: (c * m10) - (s * m00)
		in/m11: (c * m11) - (s * m01)
		in/m12: (c * m12) - (s * m02)
		in/m13: (c * m13) - (s * m03)

		in
	]

	rotate-z-into: func[
		out     [mat4f!]
		in      [mat4f!]
		angle   [float!] ;amount to rotate in radians
		return: [mat4f!]
		/local c s m00 m01 m02 m03 m10 m11 m12 m13
	][
		m00:  in/m00
		m01:  in/m01
		m02:  in/m02
		m03:  in/m03
		m10:  in/m10
		m11:  in/m11
		m12:  in/m12
		m13:  in/m13

		c: as float32! cos angle
		s: as float32! sin angle

		out/m00: (c * m00) + (s * m10)
		out/m01: (c * m01) + (s * m11)
		out/m02: (c * m02) + (s * m12)
		out/m03: (c * m03) + (s * m13)
		out/m10: (c * m10) - (s * m00)
		out/m11: (c * m11) - (s * m01)
		out/m12: (c * m12) - (s * m02)
		out/m13: (c * m13) - (s * m03)

		if out <> in [
			out/m20: in/m20
			out/m21: in/m21
			out/m22: in/m22
			out/m23: in/m23
			out/m30: in/m30
			out/m31: in/m31
			out/m32: in/m32
			out/m33: in/m33
		]
		out
	]

	scaling-3d: func[
		out     [mat4f!]
		scx     [float!]
		scy     [float!]
		scz     [float!]
		return: [mat4f!] 
	][
		set-memory as byte-ptr! out #"^@" size? mat4f!
		out/m00: as float32! scx
		out/m11: as float32! scy
		out/m22: as float32! scz
		out/m33: as float32! 1.0
		out
	]

	scale-3d: func[
		out     [mat4f!]
		in      [mat4f!]
		scx     [float!]
		scy     [float!]
		scz     [float!]
		return: [mat4f!]
	][
		out/m00: in/m00 * scx  out/m01: in/m01 * scx out/m02: in/m02 * scx out/m03: in/m03 * scx
		out/m10: in/m10 * scy  out/m11: in/m11 * scy out/m12: in/m12 * scy out/m13: in/m13 * scy
		out/m20: in/m20 * scz  out/m21: in/m21 * scz out/m22: in/m22 * scz out/m23: in/m23 * scz

		if out <> in [
			out/m30: in/m30 out/m31: in/m31 out/m32: in/m32 out/m33: in/m33
		]
		out
	]

	scaling: func[
		out     [mat4f!]
		sc      [float!]
		return: [mat4f!] 
	][
		set-memory as byte-ptr! out #"^@" size? mat4f!
		out/m00: as float32! sc
		out/m11: as float32! sc
		out/m22: as float32! sc
		out/m33: as float32! 1.0
		out
	]

	scale: func[
		;uniform scale - all directions are same
		v       [mat4f!]
		sc      [float!]
		return: [mat4f!]
	][
		v/m00: v/m00 * sc  v/m01: v/m01 * sc v/m02: v/m02 * sc v/m03: v/m03 * sc
		v/m10: v/m10 * sc  v/m11: v/m11 * sc v/m12: v/m12 * sc v/m13: v/m13 * sc
		v/m20: v/m20 * sc  v/m21: v/m21 * sc v/m22: v/m22 * sc v/m23: v/m23 * sc
		v
	]

	scale-into: func[
		;uniform scale - all directions are same
		out     [mat4f!]
		in      [mat4f!]
		sc      [float!]
		return: [mat4f!]
	][
		out/m00: in/m00 * sc  out/m01: in/m01 * sc out/m02: in/m02 * sc out/m03: in/m03 * sc
		out/m10: in/m10 * sc  out/m11: in/m11 * sc out/m12: in/m12 * sc out/m13: in/m13 * sc
		out/m20: in/m20 * sc  out/m21: in/m21 * sc out/m22: in/m22 * sc out/m23: in/m23 * sc

		if out <> in [
			out/m30: in/m30 out/m31: in/m31 out/m32: in/m32 out/m33: in/m33
		]
		out
	]

	trace: func[
		v [mat4f!]
	][
		printf ["%.3f^-%.3f^-%.3f^-%.3f^/" as float! v/m00 as float! v/m01 as float! v/m02 as float! v/m03]
		printf ["%.3f^-%.3f^-%.3f^-%.3f^/" as float! v/m10 as float! v/m11 as float! v/m12 as float! v/m13]
		printf ["%.3f^-%.3f^-%.3f^-%.3f^/" as float! v/m20 as float! v/m21 as float! v/m22 as float! v/m23]
		printf ["%.3f^-%.3f^-%.3f^-%.3f^/" as float! v/m30 as float! v/m31 as float! v/m32 as float! v/m33]
	]
]