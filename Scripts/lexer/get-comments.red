Red [
	Title:   "Lexer-based "
	Author:  "Nenad Rakocevic"
	File: 	 %get-comments.red
	Date:    18/05/2020
	License: "MIT"
	Notes: 	 {
		Extracts all the line comments from a Red file. Could be used to process some special
		type of comments (like "@@" "FIXME" "TBD"...), or save comments with their line number
		to be eventually saved back with the original code if needed.
	}
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
		if type = 'comment [
			repend list [line trim/tail to-string copy/part head input token]
		]
		no												;-- do not load values
	]

	set 'get-comments func [
		"Return a list of words and their respective occurences count"
		src [file! string! binary!] "Source file or in-memory buffer to load"
	][
		if file? src [src: read/binary src]
		list: make block! 50
		transcode/trace src :lex
		new-line/skip list on 2
	]
]

;-- Usage example
probe get-comments %unique-words.red