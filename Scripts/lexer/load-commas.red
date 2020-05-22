Red [
	Title:   "Simple example of Red syntax extension"
	Author:  "Nenad Rakocevic"
	File: 	 %load-commas.red
	Date:    18/05/2020
	License: "MIT"
	Notes: 	 {
		This script allows you to load list of values separated by commas as blocks
		without any error. Note that commas are disabled from float literals (by overloading
		the `scan` event for float literals).
	}
]

context [
	lex: func [
		event	[word!]									;-- event name
		input	[string! binary!]						;-- input series at current loading position
		type	[datatype! word! none!]					;-- type of token or value currently processed.
		line	[integer!]								;-- current input line number
		token											;-- current token as an input slice (pair!) or a loaded value.
		return: [logic!]								;-- YES: continue to next lexing stage, NO: cancel current token lexing
		/local inp pos
	][
		[scan error]									;-- only error events
		
		inp: head input
		switch event [
			scan [
				if type = float! [						;-- catch the float literals with commas
					if pos: find/part at inp token/1 #"," at inp token/2 [
						pos/1: #" "						;-- replace the comma in float literal by a whitespace
						input: at inp token/1			;-- reposition input to try loading the token again
						return no						;-- cancel loading and rescan the token
					]
				]
				yes										;-- let it go through loading stage 
			]
			error [
				pos: at inp token/2						;-- comma is at end of current token
				either pos/1 = #"," [
					pos/1: #" "							;-- replace the comma in input by a whitespace
					input: at inp token/1				;-- reposition input to try loading the token again
					no									;-- continue without reporting any error
				][yes]									;-- let other syntax errors pop up
			]
		]
	]

	set 'load-commas func [
		"Loads a Red file or buffer, ignoring eventual commas between values"
		src [file! string! binary!] "Source file or in-memory buffer to load"
	][
		if file? src [src: read/binary src]
		unless binary? src [src: to-binary src]
		transcode/trace src :lex
	]
]

;-- Usage example
probe load-commas "1,2,a,b,c,d,3,4,hello,world"