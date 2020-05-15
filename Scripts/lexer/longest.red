Red [
	Title:   "Lexer-based biggest values analyzing tool"
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
		event	[word!]
		input	[string! binary!]
		type	[datatype! word! none!]
		line	[integer!]
		token
		return: [logic!]
		/extern list depth
	][
		[scan load open close]
		switch event [
			scan [
				either any [str?: type = 'string! attempt [find any-word! get type]][
					entry: pick [string word] str?				
					if token/2 - token/1 > length? list/:entry [
						list/:entry: to-string copy/part
							at head input token/1
							at head input token/2
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
		foreach [n v] list [print rejoin ["- " desc/1 ": " v] desc: next desc]
		()												;-- no extra output in console
	]
]

;-- Usage example
show-biggest %count-types.red