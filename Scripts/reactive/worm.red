Red [
	Author: ["Didier Cadieu" "Nenad Rakocevic"]
	File:	%worm.red
	Needs:  'View
	Notes:  {
		Drag the red ball using left mouse button, all the other balls
		will follow it. This demonstrates the "dynamic" reactions usage
		from Red's reactive framework.
	
		See more about reactive programming in Red here:
		http://www.red-lang.org/2016/06/061-reactive-programming.html
	}
]

system/reactivity/eat-events?: no						;-- make it as smooth as possible

win: layout [
	size 400x500
	across
	style ball: base 30x30 transparent draw [fill-pen blue circle 15x15 14]
	ball ball ball ball ball ball ball ball return
	ball ball ball ball ball ball ball ball return
	ball ball ball ball ball ball ball ball return
	b: ball loose
	do [b/draw/2: red]
]

follow: func [left right /local old][
	all [pair? old: left/extra left/offset: left/offset + old / 2]
	left/extra: right/offset
]

faces: win/pane
while [not tail? next faces][
	react/link/later :follow [faces/1 faces/2]
	faces: next faces
]
view win