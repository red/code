Red [
	Title:   "Red libjulia binding - test"
	Author: "Oldes"
	File: 	%Julia-test.red
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
	Comment: {
		This script needs external library, which can be downloaded from this site:
		https://julialang.org/downloads/
	}
]

#include %Julia.red

julia/init "c:\dev\Julia-0.5.2\bin\" ;change this line and compile!

;NOTE: print from Julia is not visible in Red's GUI-console
result: julia/do {
	println("Hello Red, I'm Julia");
	a = 6;	b = 7;
	println("I can count: $(a) * $(b) = $(a * b)");
	a * b;
}

print result
print "Test end."