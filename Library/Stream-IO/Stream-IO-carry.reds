Red/System [
	Title:	"Stream IO - raw data reader/writer"
	Author: "Oldes"
	File: 	%Stream-IO-carry.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

carryCount: func[return: [integer!] /local i [integer!]][
	i: readUI8
	either 255 > i [
		writeUI8 i
	][
		writeUI8 FFh
		i: readUI16
		writeUI16 i
	]
	i
]
;carryBytes: func[num][writeBytes readBytes num]
;carryBitLogic: has[b][writeBit b: readBitLogic b]
;carrySBPair: carryPair: has[nBits][
;	nBits: readUB 5
;	writeUB nBits 5
;	loop (2 * nBits) [
;		writeBit readBitLogic
;	]
;]
;
;carryBits: func[num][ loop num [ writeBit readBitLogic ] ]
;carryUI8: has[v][writeUI8 v: readUI8 v]
;carryUI16: has[v][writeUI16 v: readUI16 v]
;carryUB: func[nBits /local v][writeUB v: readUB nBits nBits v]
;carrySB: func[nBits /local v][writeSB v: readSB nBits nBits v]  
;
;carryString: does [writeString readString]
