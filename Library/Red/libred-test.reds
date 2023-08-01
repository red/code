Red/System [
	Title:   "Red/System Red binding"
	Author:  "Oldes"
	File: 	 %red.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %red.reds

print-line "libred test started"

my-add: func[
	[cdecl]
	"Test libRed routine"
	a [red_integer!]
	b [red_integer!]
	return: [red_integer!]
	/local ca cb
][
	ca: redCInt32 a
	cb: redCInt32 b
	redPrint redString "my-add called"
	redPrint a ;@@ prints: integer   ?!
	redPrint b ;@@ prints: false     ?!
	printf ["add called! %ld %ld^/" ca cb] ;@@ this is not visible either:/
	return redInteger (ca + cb)
]

redOpen

print-line "redOpen done" ;@@ this is not visible, why?

;some cryptic code from libred's test.c file
a:	    redSymbol "a"
o_b_2:	redSymbol "o_b_2"
o_b:	redSymbol "o_b"
b:	    redSymbol "b"
	
redSet o_b redLoadPath "o/b"
redDo "?? o_b"
redSet o_b_2 redPath redWord "o" redWord "b" redInteger 2 0

redSet a redBlock [redInteger 42 redString "hello" 0]
redDo "?? a foreach v a [probe v]"
redPrint redGet a

redProbe redCall [redWord "what-dir" 0]
redCall [redWord "print" redDo "system/version" 0]

redPrint redString "This is test of error in redDo:"
value: redDo "$%$"
if RED_TYPE_ERROR = redTypeOf value [ redProbe value ]

redRoutine redWord "my-add" "[a [integer!] b [integer!]]" as integer! :my-add
err: redHasError
either null <> err [
	redPrint err
][
	redDo "probe my-add 2 3 probe :my-add"
]


rb: redBinary "hello" 5
redProbe rb
redSet b rb
redDo {probe to-string b}

;more fancy code:
redDo {view layout [button "hello" [print now] button "quit" [unview]]}

redClose

print-line "done"