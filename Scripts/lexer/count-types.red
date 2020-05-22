Red [
	Title:   "Lexer-based datatypes counter"
	Author:  "Nenad Rakocevic"
	File: 	 %count-types.red
	Date:    22/04/2020
	License: "MIT"
	Notes: 	 {
		This script allows analyzing one or more Red/Rebol source code in text formats
		by counting the number of values present per-datatype. This analysis is conducted
		using a customized lexer that counts recognized tokens without loading them.
	}
]

context [
	list: none
	
	lex: function [
		event	[word!]									;-- event name
		input	[string! binary!]						;-- input series at current loading position
		type	[datatype! word! none!]					;-- type of token or value currently processed.
		line	[integer!]								;-- current input line number
		token											;-- current token as an input slice (pair!) or a loaded value.
		return: [logic!]								;-- YES: continue to next lexing stage, NO: cancel current token lexing
	][
		[scan load error open close]					;-- exclude 'prescan event for faster processing
		switch event [
			scan open [									;-- only counts scanned tokens and any-block! series
				unless pos: find/only list type [repend pos: tail list [type 0]]		
				pos/2: pos/2 + 1
				event = 'open							;-- return TRUE for OPEN event, so that nested containers
			]											;-- can be counted properly.
			close load [no]								;-- do not load values, do not store any-block containers.
			error 	   [input: next input no]			;-- skip over syntax errors silently
		]
	]

	set 'count-types function [
		"Return the count of all values per-datatype in the input file, or in-memory source code"
		src [file! string! binary!] "Source file or in-memory buffer to analyze"
		/cumul						"Cumulate the stats with previous calls"
		/extern list
	][
		if file? src [src: read/binary src]
		unless cumul [list: make block! 100]
		transcode/trace src :lex
		list: new-line/skip (sort/skip/compare/all list 2 func [a b][a/2 > b/2]) yes 2
	]
]

;-- Usage example
probe count-types %count-types.red