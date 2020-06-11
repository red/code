Red [
	Title:   "Lexer-based longest/biggest values analyzing tool"
	Author:  "Nenad Rakocevic"
	File: 	 %longest.red
	Date:    22/04/2020
	License: "MIT"
	Notes: 	 {
		Analyze the content of a given Red/Rebol source code file and report
		some stats about longest/biggest values.
	}
]

context [
	template: [
		integer: 	0
		float:		0.0
		word:		""
		string:		""
		issue:		0
		file:		0
		deepest:	0
	]
	descriptions: [
		"biggest integer value"
		"biggest float value"
		"longest word"
		"longest string"
		"longest issue"
		"longest filename"
		"deepest nesting level"
	]
	depth: 0
	list:  none
	
	lex: function [
		event	[word!]									;-- event name
		input	[string! binary!]						;-- input series at current loading position
		type	[datatype! word! none!]					;-- type of token or value currently processed.
		line	[integer!]								;-- current input line number
		token											;-- current token as an input slice (pair!) or a loaded value.
		return: [logic!]								;-- YES: continue to next lexing stage, NO: cancel current token lexing
		/extern list depth
	][
		[scan load open close]
		switch event [
			scan [
				either any [str?: type = string! attempt [find any-word! type]][
					entry: pick [string word] str?
					if token/2 - token/1 > length? list/:entry [
						list/:entry: to-string copy/part head input token
					]
					no
				][yes]
			]
			load [
				switch to-word type [
					integer! [if token > list/integer [list/integer: token]]
					float!	 [if token > list/float	  [list/float: token]]
				]
				no
			]
			open [
				either find any-path! type [yes][
					depth: depth + 1
					if depth > list/deepest [list/deepest: depth]
					no
				]
			]
			close [
				either find any-path! type [yes][depth: depth - 1 no]
			]
		]
	]

	set 'show-biggest func [
		"Displays a list of longest or biggest values from a source file"
		src [file! string! binary!] "Source file to process"
		/local n v
	][
		if file? src [src: read/binary src]
		list: copy template
		transcode/trace src :lex
		desc: descriptions
		foreach [n v] list [print rejoin ["- " desc/1 ": " all [v <> 0 mold v]] desc: next desc]
		()												;-- no extra output in console
	]
]

;-- Usage example
show-biggest %count-types.red