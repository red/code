Red [
	Title:  "Gradient Lab"
	Author: "Gregg Irwin"
	File: 	%gradient-lab.red
	Needs:	View
	Notes: {
		Found Carl's old R2 version after starting this from %fill-pen-lab.red,
		so took some ideas from that too.
	}
]

to-color: function [r g b][
	color: 0.0.0
	if r [color/1: to integer! 256 * r]
	if g [color/2: to integer! 256 * g]
	if b [color/3: to integer! 256 * b]
	color
]

to-percent: func [color [integer!]][to percent! (to float! color) / 256]

set-sliders: func [color [tuple!]][
	R/data: to-percent color/1
	G/data: to-percent color/2
	B/data: to-percent color/3
]

to-text: function [val][form to integer! 0.5 + 255 * any [val 0]]

update-field: does [fld-draw-blk/text: mold draw-blk]

xy-to-degree: function [xy [pair!]][
	delta: xy - d-circle/:IDX_C_CENTER	
	radians: atan2 delta/y delta/x
	radians * (180 / pi)
]


d-fill: none

draw-blk: [
	d-fill: fill-pen radial 0x0 0 500 0 1.0 1.0 red green blue
	box 0x0 500x500
]

;IDX_P_COLOR:  2		; pen
;IDX_B_TL:     2		; box top-left
;IDX_B_BR:     3		; box bottom-right
IDX_F_STYLE:  2			; fill
IDX_F_OFFSET: 3
IDX_F_START:  4
IDX_F_END:    5
IDX_F_ANGLE:  6			; angle has no effect for radial gradients
IDX_F_SCALEX: 7
IDX_F_SCALEY: 8
IDX_F_COLOR1: 9
IDX_F_COLOR2: 10
IDX_F_COLOR3: 11
;IDX_F_IMAGE: xxx


cur-color-face: none
update-cur-color: does [
	cur-color-face/color: to-color R/data G/data B/data
]
set-fill-param: func [idx "Field index" value][
	d-fill/:idx: switch idx reduce [
		IDX_F_OFFSET [as-pair canvas/size/x * value canvas/size/y * value] ; value = slider face/data
		IDX_F_START  [to integer! canvas/size/x * value]    ; value = slider face/data
		IDX_F_END    [to integer! canvas/size/x * value]    ; value = slider face/data
		IDX_F_ANGLE  [to integer! 360 * value]              ; value = slider face/data
		IDX_F_SCALEX [5 * value]                            ; value = slider face/data
		IDX_F_SCALEY [5 * value]                            ; value = slider face/data
	]
]

view [
	title "Gradient Lab"
	style txt: text 40
	style color-box: base 50x50 128.128.128
		; only buttons get on-click
		on-down [cur-color-face: face   set-sliders face/color][cur-color-face]
		;react [face/color: to-color R/data G/data B/data]
	style color-sld: slider 256 0% [update-cur-color]
	style param-sld: slider 256 0%
	
	canvas: base 500x500  draw draw-blk  all-over  react [
		if d-fill [
			d-fill/:IDX_F_STYLE:  to word! pick style-lst/data style-lst/selected
			d-fill/:IDX_F_COLOR1: C1/color
			d-fill/:IDX_F_COLOR2: C2/color
			d-fill/:IDX_F_COLOR3: C3/color
		]
		;face/color: to-color R/data G/data B/data
		;print mold draw-blk
		; Can't react to the field changing if we are also triggering changes
		; from on-down it seems.
		;face/draw: load fld-draw-blk/text
	]
	
	return
	
	at 550x25
	panel [
		txt "Fill Style:" style-lst: drop-list data ["Radial" "Linear" "Diamond"] select 1
		return
		text 120x50 "Click a color box to set the gradient color" 
		c1: color-box red  c2: color-box green  c3: color-box blue  return
		txt "Red:"   R: color-sld 100% return
		txt "Green:" G: color-sld return
		txt "Blue:"  B: color-sld return
		pad 0x25
		txt "Offset:"  	sld-offset:  param-sld   0% [set-fill-param IDX_F_OFFSET face/data] return
		txt "Start:"  	sld-start:   param-sld   0% [set-fill-param IDX_F_START  face/data] return
		txt "End"  		sld-end:     param-sld 100% [set-fill-param IDX_F_END    face/data] return
		txt "Angle:"  	sld-angle:   param-sld   0% [set-fill-param IDX_F_ANGLE  face/data] return
		txt "Scale-X:"  sld-scale-x: param-sld  20% [set-fill-param IDX_F_SCALEX face/data] return
		txt "Scale-Y:"  sld-scale-y: param-sld  20% [set-fill-param IDX_F_SCALEY face/data] return
		
		text "Draw block: (you can't edit to change values here)" return
		fld-draw-blk: area 400x100 "" react [
			style-lst/selected
			sld-offset/data sld-start/data sld-end/data sld-angle/data 
			sld-scale-x/data sld-scale-y/data 
			
			update-field
		]
;		on-key [
;			draw-blk load face/text
;			show canvas
;		]
	]
	
	do [
		cur-color-face: c1
		update-field
	]
	
]