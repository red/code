Red [
	Title:   "Lexer-based longest values analyzing tool"
	Author:  "Nenad Rakocevic"
	File: 	 %longest.red
	Date:    22/04/2020
	License: "MIT"
	Notes: 	 {
		
	}
]

context [
	template: [
		integer 	0
		float		0.0
		word		0
		string		0
		issue		0
		file		0
		deepest		0
	]
	depth: 0
	list:  none
	
	lex: func [
		event	[word!]
		input	[string! binary!]
		type	[datatype! word! none!]
		line	[integer!]
		token
		return: [logic!]
	][
		[load open close]								;-- only intercept containers construction events
		switch event [
			load [
				case [
					type = integer! [if token > list/integer [list/integer: token]]
					type = float!	[if token > list/float	 [list/float: token]]
					;type = word!
				]
				no
			]
			open [
				depth: depth + 1
				if depth > list/deepest [list/deepest: depth]
				find any-path! type
			]
			close [
				depth: depth - 1
				find any-path! type
			]
		]
	]

	set 'show-longests func [
		"Displays a list of longest or biggest values from a source file"
		src [file! string! binary!] "Source file to process"
	][
		if file? src [src: read/binary src]
		list: copy template
		transcode/trace src :lex
		new-line/skip list yes 2
	]
]

;-- Usage example
probe show-longests %count-types.red