Red/System [
	Title:	"SWF parser"
	Purpose: "Just a simple test. So far it displays some info about given SWF file"
	Author: "Oldes"
	File: 	%swf-parse.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %../../ZLib/zlib.reds
#include %../Stream-IO-core.reds
#include %../Stream-IO-read.reds


RECT!: alias struct! [
	Xmin [integer!]
	Xmax [integer!]
	Ymin [integer!]
	Ymax [integer!]
]

readRECT: func[
	into    [RECT!]
	return: [RECT!]
	/local
		rect  [RECT!]
		nbits [integer!]
][
	in/bit-mask: 0
	nbits: readUB 5
	print-line ["nbits: " nbits]
	if 0 = as integer! into [
		into: as RECT! allocate 128
	]
	into/Xmin: readSB nbits
	into/Xmax: readSB nbits
	into/Ymin: readSB nbits
	into/Ymax: readSB nbits
	in/bit-mask: 0
	into
]



get-tag-name: func[
	id [integer!]
	return: [c-string!]
][
	switch id [
		0       ["End"]
		1       ["ShowFrame"]
		2       ["DefineShape"]
		3       ["FreeCharacter"]
		4       ["PlaceObject"]
		5       ["RemoveObject"]
		6       ["DefineBits-JPEG"]
		7       ["DefineButton"]
		8       ["JPEGTables"]
		9       ["SetBackgroundColor"]
		10      ["DefineFont"]
		11      ["DefineText"]
		12      ["DoActionTag"]
		13      ["DefineFontInfo"]
		14      ["DefineSound"]
		15      ["StartSound"]
		18      ["SoundStreamHead"]
		17      ["DefineButtonSound"]
		19      ["SoundStreamBlock"]
		20      ["DefineBitsLossless"]
		21      ["DefineBitsJPEG2"]
		22      ["DefineShape2"]
		23      ["DefineButtonCxform"]
		24      ["Protect"]
		26      ["PlaceObject2"]
		28      ["RemoveObject2"]
		31      ["GeneratorCommand_?"]
		32      ["DefineShape3"]
		33      ["DefineText2"]
		34      ["DefineButton2"]
		35      ["DefineBitsJPEG3"]
		36      ["DefineBitsLossless2"]
		37      ["DefineEditText"]
		38      ["DefineVideo"]
		39      ["DefineSprite"]
		40      ["SWT-CharacterName"]
		41      ["SerialNumber"]
		42      ["DefineTextFormat"]
		43      ["FrameLabel"]
		45      ["SoundStreamHead2"]
		46      ["DefineMorphShape"]
		48      ["DefineFont2"]
		49      ["GenCommand_?"]
		50      ["DefineCommandObj_?"]
		51      ["Characterset_?"]
		52      ["FontRef_?"]
		56      ["ExportAssets"]
		57      ["ImportAssets"]
		58      ["EnableDebugger"]
		59      ["DoInitAction"]
		60      ["DefineVideoStream"]
		61      ["VideoFrame"]
		62      ["DefineFontInfo2"]
		63      ["DebugID"]
		64      ["ProtectDebug2"]
		65      ["ScriptLimits"]
		66      ["SetTabIndex"]
		67      ["DefineShape4"]
		69      ["FileAttributes"]
		70      ["PlaceObject3"]
		71      ["Import2"]
		73      ["DefineAlignZones"]
		74      ["CSMTextSettings"]
		75      ["DefineFont3"]
		77      ["MetaData"]
		78      ["DefineScalingGrid"]
		72      ["DoAction3"]
		76      ["DoAction3StartupClass"]
		82      ["DoAction3"]
		83      ["DefineShape5"]
		84      ["DefineMorphShape2"]
		86      ["DefineSceneAndFrameLabelData"]
		87      ["DefineBinaryData"]
		88      ["DefineFontName"]
		89      ["StartSound2"]
		90      ["DefineBitsJPEG4"]
		91      ["DefineFont4"]
		93      ["Telemetry"]
		1023    ["DefineBitsPtr"]
		default ["UNKNOWN"]
	]
]


swf: context [
	file-handle: 0

	Version:    0
	Signature: #"^@"
	FileLength: 0
	FrameSize:  declare RECT! 0
	FrameRate:  0.0
	FrameCount: 0

	tagId:     0
	tagLength: 0


	parse: func[
		name [c-string!]
		/local
			i     [integer!]
			bytes [byte-ptr!]
	][
		file-handle: simple-io/open-file name simple-io/RIO_READ false
		if 0 >= file-handle [
			print-line ["Unable to open file: " name]
			exit
		]
		if 1 = init-in-from-file file-handle [
			signature: in/pos/1
			if not all [
				#"W" = in/pos/2
				#"S" = in/pos/3
				any [Signature = #"C" Signature = #"F" Signature = #"Z"]
			][
				print-line "Not supported SWF file."
				exit
			]
			Version: as integer! in/pos/4
			in/pos: in/pos + 4

			FileLength: readUI32
			print-line ["Version: " Version " FileLength (uncompressed): " FileLength]

			switch signature [
				#"C" [
					print-line "ZLIB Compressed SWF"
					bytes: allocate FileLength
					i: zlib/z-uncompress bytes :FileLength in/pos as integer! (in/tail - in/pos)
					if 0 <> i [
						print-line ["Decompression failed with code: " i]
						exit
					]
					free in/head ;release previous compressed buffer
					in/head: bytes
					in/pos:  bytes
					in/tail: bytes + FileLength
					in/end:  in/tail
				]
				#"Z" [
					print-line "LZMA Compressed SWF - not supported yet!"
					exit
				]
				#"F" [
					print-line "Uncompressed SWF"
				]
			]
			readRECT FrameSize
			FrameRate:  readSShortFixed
			FrameCount: readUI16
			print-line ["FrameSize: " FrameSize/Xmin " " FrameSize/Ymin " " FrameSize/Xmax / 20 " " FrameSize/Ymax / 20]
			print-line ["FrameRate: " FrameRate]
			print-line ["FrameCount: " FrameCount]

			while [in/pos < in/tail][
				i: readUI16 ;tagAndLength
				tagId:     (65472 and i) >> 6
				tagLength: i and 63
				if tagLength = 63 [tagLength: readUI32]
				print-line ["Tag: " tagId " size: " tagLength tab get-tag-name tagId]
				in/pos: in/pos + tagLength
			]
		]
	]
	close: func[][
		if file-handle > 0 [simple-io/close-file file-handle]
		file-handle: 0
	]
]

do-input: func [
	/local
		argument  [str-array!]
		file-name [c-string!]
][
	either 2 = system/args-count [
		argument: system/args-list + 1
		file-name: argument/item
		swf/parse file-name
		swf/close
	][
		print-line ["Provide file name as a first argument. For example: swf-parse test.swf"]
	]
]

do-input