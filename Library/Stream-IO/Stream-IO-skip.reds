Red/System [
	Title:	"Stream IO - raw data reader/writer"
	Author: "Oldes"
	File: 	%Stream-IO-skip.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

skipBytes: func[
	bytes [integer!]
	return: [integer!]
][
	SIO_ASSERT_IN_SPACE(bytes)
	in/pos: in/pos + bytes
	bytes
]

;@@ TODO if needed