Red [
	Title:   "Lexer-based "
	Author:  "Nenad Rakocevic"
	File: 	 %unique-words.red
	Date:    15/05/2020
	License: "MIT"
	Notes: 	 {
		
	}
]

context [
	list: none
	
	lex: func [
		event	[word!]
		input	[string! binary!]
		type	[datatype! word! none!]
		line	[integer!]
		token
		return: [logic!]
	][
		[scan]											;-- only intercept containers construction events
		if find [word! set-word! lit-word! get-word!] type [
			token: copy/part head input token
			token: trim/with to-string token "':"
			unless find list token [append list token]
		]
		no
	]

	set 'count-unique func [
		"Return a ..."
		src [file! string! binary!] "Source file or in-memory buffer to load"
	][
		if file? src [src: read/binary src]
		list: make hash! 1000
		transcode/trace src :lex
		new-line/all list on
		list
	]
]

;-- Usage example
probe count-unique %unique-words.red