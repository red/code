Red [
	Title:   "Lexer-based words stats tool"
	Author:  "Nenad Rakocevic"
	File: 	 %unique-words.red
	Date:    15/05/2020
	License: "MIT"
	Notes: 	 {Counts unique words occurences in a given Red source file.}
]

context [
	list: none
	
	lex: func [
		event	[word!]									;-- event name
		input	[string! binary!]						;-- input series at current loading position
		type	[datatype! word! none!]					;-- type of token or value currently processed.
		line	[integer!]								;-- current input line number
		token											;-- current token as an input slice (pair!) or a loaded value.
		return: [logic!]								;-- YES: continue to next lexing stage, NO: cancel current token lexing
	][
		[scan]											;-- only scan events
		if all [datatype? type find any-word! type][
			token: copy/part head input token
			token: trim/with to-string token "':"
			list/:token: 1 + any [list/:token 0]
		]
		no												;-- do not load values
	]

	set 'count-unique func [
		"Return a list of words and their respective occurences count"
		src [file! string! binary!] "Source file or in-memory buffer to load"
	][
		if file? src [src: read/binary src]
		list: make map! 1000
		transcode/trace src :lex
		new-line/skip (sort/skip/compare/all body-of list 2 func [a b][a/2 > b/2]) yes 2
	]
]

;-- Usage example
probe count-unique %unique-words.red