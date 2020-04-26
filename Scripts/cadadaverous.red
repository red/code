Red [
	Title:  "My other car is CDR"
	Author: @9214
	Date:   24-Aug-2017
	File:   %cadadaverous.red
	Purpose: {
		A variation on Lisp's compositions of CAR and CDR primitives
		implemented as a "reader macro".
		Demonstrates the use of Parse and lexer's pre-loading.
	}
]

system/lexer/pre-load: function [source][
	chain: make block! 16
	composition: [
		"c"
		some [
			  "a" (append chain 'first)
			| "d" (append chain 'next)
		] 
		"r"
	]

	parse source [
		any [
			change composition (form chain) (clear chain)
			| skip
		]
	]
]

example: reduce load {
	"SICP, exercise 2.25"

	cadaddr [1 3 [5 7] 9]
	caar [[7]]
	cadadadadadadr [1 [2 [3 [4 [5 [6 7]]]]]]
}
