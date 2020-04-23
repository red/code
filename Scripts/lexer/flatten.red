Red [
	Title:   "Lexer-based data-structures flattening loader"
	Author:  "Nenad Rakocevic"
	File: 	 %flatten.red
	Date:    22/04/2020
	License: "MIT"
	Notes: 	 {
		This script provides a customized Red values loader that will flatten all nested
		container structures (expect for paths) and return a one-dimensional list of all
		the loaded values.
	}
]

context [
	lex: function [
		event	[word!]
		input	[string! binary!]
		type	[datatype! word! none!]
		line	[integer!]
		token
		return: [logic!]
	][
		[open close]									;-- only intercept containers construction events
		find any-path! type								;-- return YES for paths, else drop the container
	]

	set 'load-flat function [
		"Return a flattened list of all values from an input file, or in-memory source code"
		src [file! string! binary!] "Source file or in-memory buffer to load"
	][
		if file? src [src: read/binary src]
		transcode/trace src :lex
	]
]

;-- Usage example
probe load-flat {[
	[1 2 3]
	[4 5 6]
	[7 8 9]
]}