Red [
	Title:	"SWF-tool"
	Purpose: "Simple gui tool for investigating SWF files"
	Author: "Oldes"
	File: 	%swf-tool.red
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
	Needs: View
]

#include %swf-io.red

fixed-font: make font! [
	name: pick ["Fixedsys" "Consolas"] make logic! find [5.1.0 5.0.0] system/view/platform/version
	size: 10
	anti-alias?: no
]

swf-tool: func[
	/local tag-line offset list detail
][
	swf/open %mlok.swf
	tags: swf/query/tags/verbose 2
	tags: split tags #"^/"

	view main: layout [
		list: text-list 450x600 data :tags font fixed-font [
			swf/set-verbose 4
			swf/set-actions FFFFFFFFh
			offset: load/part pick tags face/selected 9
			clear detail/text
			swf/parse-tag offset detail/text
			detail/text: detail/text ;forcing update
		]
		detail: area 650x600 "" font fixed-font
	]
]

swf-tool
