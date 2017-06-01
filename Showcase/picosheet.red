Red [
	Title:   "Picosheet demo"
	Author:  "Nenad Rakocevic"
	Date:	 "07/07/2016"
	File: 	 %picosheet.red
	Needs:	 'View
	Purpose: {
		Shows how to implement a native reactive spreadsheet in a single page
		of code.
		
		For more information about this demo see the related article:
		http://www.red-lang.org/2016/07/native-reactive-spreadsheet-in-17-loc.html
		
		This version is "unrolled", so it is more easily readable and contains some
		demo values for the sheet.
	}
]

L: charset "ABCDEFGHI"
N: charset "123456789"
D: union N charset "0"
p: []

repeat y 9 [
	repeat x 9 [
		col: either x = 1 [#"^(202F)"][#"A" + (x - 2)]
		ref: to word! append form col y - 1
		header?: (y = 1) or (x = 1)
		
		append p set ref make face! [
			size: 90x24
			type: pick [text field] header?
			
			offset: -20x10 + as-pair
				((x - 1) * size/x + 2)
				((y - 1) * size/y + 1)
			
			text: form case [
				y = 1 [col]
				x = 1 [y - 1]
				'else [copy ""]
			]
			para: make para! [
				align: pick [center right] header?
			]
			extra: object [
				name: form ref
				formula: old: none
			]
			actors: context [
				on-create: on-unfocus: function [f e][
					f/color: none
					if rel: f/extra/old [react/unlink rel 'all]
					
					text: copy f/text
					f/extra/formula: copy text
					
					if #"=" = f/extra/formula/1 [
						if rel: f/extra/old [react/unlink rel 'all]
						parse remove text [
							any [
								p: L N not ["/" skip not N] insert p " " insert "/data "
								| L skip
								| p: some D opt [dot some D] insert p " " insert " "
								| skip
							]
						]
						f/text: rejoin [f/extra/name "/data: any [math/safe [" text {] "#UND"]}]
						if f/data [any [react f/extra/old: f/data do f/data]]
					]
				]
				on-focus: function [f e][
					f/text: any [f/extra/formula f/text]
					f/color: yello
				]
			]
		]
	]
]

demo-sheet: [
	A1: "Designation"
	B1: "Quantity"
	C1: "Price $"
	D1: "Total $"
	E1: "Tax rate:"
	F1: "12%"
	A2: "PC"
	B2: "1"
	C2: "500"
	D2: "=B2*C2"
	E2: "Average price:"
	F2: "=(C2+C3+C4)/3"
	A3: "Monitor"
	B3: "2"
	C3: "250"
	D3: "=B3*C3"
	E3: "Nb of items :"
	F3: "=B2+B3+B4"
	A4: "Desk"
	B4: "1"
	C4: "120"
	D4: "=B4*C4"
	E4: "Avg price / items:"
	F4: "=F2/F3"
	C5: "TOTAL $"
	D5: "=D2+D3+D4"
	C6: "VAT"
	D6: "=D5*F1"
]

;-- Set the formulas to face objects /text property
foreach [name value] demo-sheet [
	set in (get to word! form name) 'text value
]

;-- Open a window and fill its /pane list with all the created widgets
view make face! [type: 'window text: "PicoSheets demo" size: 840x250 pane: p]

