Red/System [
	Title:   "Red/System Red binding"
	Author:  "Oldes"
	File: 	 %red.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %red.reds

print-line "libred test started"

my-add: func[a [integer!] b [integer!] return: [integer!]][ a + b ]

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

value: redDo "$%$"
if RED_TYPE_ERROR = redTypeOf value [ redProbe value ]

;@@ This does not work :-( -> Compilation Error: type casting from function! to pointer! is not allowed 
; redRoutine redWord "c-add" "[a [integer!] b [integer!]]" as int-ptr! :my-add
; err: redHasError
; either null <> err [
; 	redPrint err
; ][ redDo "probe my-add 2 3 probe :my-add" ]


rb: redBinary "hello" 5
redProbe rb
redSet b rb
redDo {probe to-string b}

;more fancy code:
redDo {view layout [button "hello" [print now] button "quit" [unview]]}

redClose

print-line "done"