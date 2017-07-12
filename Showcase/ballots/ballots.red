Red [
	Title:  "Interactive voting systems demo"
	Author: "Nenad Rakocevic"
	Date:   "17-Dec-2016"
	Needs:  View
	File:	%ballots.red
	Tabs:   4
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
	Notes:  {
		Original work and images from Nicky Case:
		https://github.com/ncase/ballot
	}
]

shapes: [
	axis: [
		line-width 2
		pen silver box 0x0 258x258
		line 10x130  250x130
		line 130x10	 130x250
		line 20x120  10x130  20x140
		line 240x120 250x130 240x140
		line 120x20  130x10  140x20
		line 120x240 130x250 140x240
	]
	voter: [
		pen off fill-pen #557DFF circle 10x10 10
		pens: pen gray fill-pen gray
		circle 4x11 1 circle 16x11 1
		line 7x14 13x14
	]
	pie-voter: [
		pen off
		fill-pen gray circle 10x10 10
		s-arc: fill-pen red arc 10x10 10x10 -90  180 closed
		t-arc: fill-pen red arc 10x10 10x10  90  120 closed
		h-arc: fill-pen red arc 10x10 10x10  210 60  closed
		pen #3B56AF fill-pen #3B56AF
		circle 4x11 1 circle 16x11 1
		line 7x14 13x14
	]
	square: [
		line-width 2 pen #3B56AF fill-pen #557DFF
		box 1x1 37x37
		circle 11x28 1 circle 29x28 1
		line 13x32 27x32
	]
	triangle: [
		line-width 3 pen #AA9438 fill-pen #FFDD55
		triangle 20x1 39x39 1x39
		line-width 2 circle 11x30 1 circle 29x30 1
		line 13x34 27x34
	]
	hexagon: [
		line-width 2 pen #892727 fill-pen #D33F3F
		polygon 1x20 11x3 29x3 39x20 29x36 11x36
		line-width 2 circle 11x25 1 circle 29x25 1
		line 13x29 27x29
	]
	circle: [
		at 0x0 person draw [
			(shapes/axis) pen gray fill-pen off
			line-width 4 disk: circle -1x-1 100
		] 260x260
	]
	circles: [
		at 0x0 person draw [
			(shapes/axis) pen gray fill-pen off disks:
			line-width 1 circle -1x-1 120
			line-width 2 circle -1x-1 90
			line-width 3 circle -1x-1 60
			line-width 4 circle -1x-1 30
		] 260x260
	]
	winners: [
		s-win: image ballot-box 30x102 80x152 crop 0x0   100x100
		t-win: image ballot-box 30x147 80x197 crop 0x100 100x100
		h-win: image ballot-box 30x192 80x242 crop 0x100 100x100
	]
	layout-3: [
		at 25x35   square:   person draw [(shapes/square)]
		at 150x80  triangle: person draw [(shapes/triangle)]
		at 75x75   voter:    person draw [(shapes/:kind)] 22x22
	]
	layout-4: [
		at 210x210 hexagon:  person draw [(compose/deep shapes/hexagon)]
		(compose/deep shapes/layout-3)
	]
]

ballot-box:  load %images/ballot_box.png
ballot-rate: load %images/ballot_rate.png

select-color: func [name [word!]][
	hex-to-rgb select [square #7575F0 triangle #F0D175 hexagon #F07575] name
]
select-fill-color: func [name [word!]][
	hex-to-rgb select [square #3B56AF triangle #AA9438 hexagon #892727] name
]
link-voter: func [obj][
	voter/selected: obj
	voter/draw/4: select-color obj
	pens/2: pens/4: select-fill-color obj
	obj: get obj
	joint/2: voter/offset + 10x10
	joint/3: obj/offset + divide obj/size 2
]
reset-arcs: does [
	s-arc/2: select-color 'square
	t-arc/2: select-color 'triangle
	h-arc/2: select-color 'hexagon
]

clear-reactions

view compose/deep [
	title "The candidates and the voter"
	backdrop white
	style person: base 40x40 loose transparent
	style big-text: base 155x35 transparent font [name: "Arial" size: 17 style: 'bold]

	panel 260x260 white draw [
		(shapes/axis)
		line-width 4 pen gray
		joint: line -1x-1 -1x-1
	][
		(kind: 'voter compose/deep shapes/layout-3)
	] react [
		[square/offset triangle/offset voter/offset]
				
		d: distance? voter get obj: 'square
		if d > new: distance? voter triangle [obj: 'triangle d: new]
		link-voter obj
	] return
	
	pad -25x0 big-text right "VOTES FOR" 
	pad -10x0 big-text 125 left font [] react [
		face/text: uppercase form voter/selected
		face/font/color: voter/draw/4
	]
]

clear-reactions

view compose/deep [
	title "First Past The Post"
	backdrop white
	style person: base 40x40 loose transparent
	origin 1x1
	
	panel 260x260 white draw [
		(shapes/axis)
		line-width 4 pen gray
		joint: line -1x-1 -1x-1
	][
		(kind: 'voter compose/deep shapes/layout-4)
	] react [
		[square/offset triangle/offset hexagon/offset voter/offset]
				
		d: distance? voter get obj: 'square
		if d > new: distance? voter triangle [obj: 'triangle d: new]
		if d > new: distance? voter hexagon  [obj: 'hexagon  d: new]
		link-voter obj
		
		foreach [img obj][s-win square t-win triangle h-win hexagon][
			img: get img
			img/6/y: pick [100 0] voter/selected = obj
		]
	]
	image 380x260 %images/ballot_fptp.png silver draw [(shapes/winners)]
]

clear-reactions

view compose/deep [
	title "Ranked Voting"
	backdrop white
	style person: base 40x40 loose transparent
	origin 1x1
	
	panel 260x260 white draw [
		(shapes/axis) pen gray
		s-joint: line-width 4 line -1x-1 -1x-1
		t-joint: line-width 4 line -1x-1 -1x-1
		h-joint: line-width 4 line -1x-1 -1x-1
	][
		(kind: 'pie-voter compose/deep shapes/layout-4)
	] react [
		[square/offset triangle/offset hexagon/offset]
		
		foreach [obj cnt] ranks: [square 0 triangle 0 hexagon 0][
			put ranks obj distance? voter get obj
		]
		sort/skip/compare ranks 2 2

		arcs: [s-arc t-arc h-arc]
		repeat i 3 [
			arc: get pick arcs i
			arc/2: select-color pick ranks i * 2 - 1
		]
		foreach [joint img obj][
			s-joint s-win square
			t-joint t-win triangle
			h-joint h-win hexagon
		][
			rank: index? find ranks obj 2
			obj: get obj
			joint: get joint
			joint/2: 6 - rank
			joint/4: voter/offset + 10x10
			joint/5: obj/offset + divide obj/size 2
			img: get img
			img/6/y: rank + 1 / 2 * 100 + 100
		]
	]
	image 380x260 %images/ballot_ranked.png silver draw [(shapes/winners)]
]

clear-reactions

view compose/deep [
	title "Approval Voting"
	backdrop white
	style person: base 40x40 loose transparent
	origin 1x1
	
	panel 260x260 white [
		(kind: 'pie-voter compose/deep append shapes/circle shapes/layout-4)
		do [reset-arcs]
	] react [
		[square/offset triangle/offset hexagon/offset]
		in-range: clear []
		
		disk/2: voter/offset + 10x10
		
		foreach obj [square triangle hexagon][
			if 100 > distance? voter get obj [append in-range obj]
		]
		start: -90
		len: length? in-range
		
		foreach [arc win obj][
			s-arc s-win square
			t-arc t-win triangle
			h-arc h-win hexagon
		][
			found?: to-logic find in-range obj
			arc: get arc
			arc/6: start
			arc/7: either any [zero? len not found?][0][360 / len]
			start: start + arc/7
			win: get win
			win/6/y: pick [100 0] found?
		]
	]
	image 380x260 %images/ballot_approval.png silver draw [(shapes/winners)]
]

clear-reactions

view compose/deep [
	title "Score Voting"
	backdrop white
	style person: base 40x40 loose transparent
	origin 1x1
	
	panel 260x260 white [
		(kind: 'pie-voter compose/deep append shapes/circles shapes/layout-4)
		do [reset-arcs]
	] react [
		[square/offset triangle/offset hexagon/offset]

		repeat i 4 [disks/(i * 5 - 1): voter/offset + 10x10]
		
		foreach [obj cnt] ranges: [square 0 triangle 0 hexagon 0][
			put ranges obj distance? voter get obj
		]
		start: -90
		
		foreach [arc win obj][
			s-arc s-win square
			t-arc t-win triangle
			h-arc h-win hexagon
		][
			d: to-integer ranges/:obj / 30
			arc: get arc
			arc/6: start	
			arc/7: 120 - min 120 30 * d
			start: start + arc/7
			win: get win
			win/6/y: 100 * do [4 - min 4 d]
		]
	]
	image 380x260 %images/ballot_range.png silver draw [
		s-win: image ballot-rate 135x102 390x152 crop 0x0   500x100
		t-win: image ballot-rate 135x147 390x197 crop 0x100 500x100
		h-win: image ballot-rate 135x192 390x242 crop 0x100 500x100
	]
]