Red/System [
	Title:	"SWF related function"
	Purpose: "Provides SWF related reading/writing functions"
	Author: "Oldes"
	File: 	%swf-io.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %../ZLib/zlib.reds
#include %../Stream-IO/Stream-IO-core.reds
#include %../Stream-IO/Stream-IO-read.reds
#include %../Stream-IO/Stream-IO-write.reds

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
	;print-line ["nbits: " nbits]
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
		6       ["DefineBitsJPEG"]
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
		86      ["SceneAndFrameLabelData"]
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
	verbose: 1

	Version:    0
	Signature: #"^@"
	FileLength: 0
	FrameSize:  declare RECT! 0
	FrameRate:  0.0
	FrameCount: 0
	Content: as byte-ptr! 0

	tagId:     0
	tagLength: 0
	tagPos: as byte-ptr! 0

	tmpMatrix: declare sio-decimal-matrix!
	tmpCXFORM: declare sio-cxform!

	#enum swf-tag-action! [
		EXTRACT_HEADER:   01h
		EXTRACT_TAGS:     02h
		EXTRACT_EXPORTS:  04h
		EXTRACT_BITMAPS:  08h
		EXTRACT_SOUNDS:   10h
		EXTRACT_INFO:     20h  
	]
	tag-actions: EXTRACT_TAGS ;or EXTRACT_EXPORTS or EXTRACT_BITMAPS

	#define SWF_TAG_ACTION(id) [id = (tag-actions and id)]
	#define PRINT_TAG_INFO [
		case [
			SWF_TAG_ACTION(EXTRACT_INFO) [
				writeFormated [get-tag-name tagId lf]
				writeFormated ["At: " (tagPos - in/head) " tagId: " tagId " bytes: " tagLength lf lf]
			] 
			verbose > 2 [
				writeFormated ["At: " (tagPos - in/head) " Tag: " tagId "^-size: " tagLength "^-;" get-tag-name tagId lf]
			]
			verbose = 2 [
				writeFormated [(tagPos - in/head) #" " tagId]
				writePaddingTo #" " 14
				writeFormated [get-tag-name tagId lf]
			]
			verbose = 1 [
				writeFormated [(tagPos - in/head) #" " tagId lf]
			]
			true [0] ;else print nothing
		]
	]

	close: func[][
		if file-handle > 0 [simple-io/close-file file-handle]
		file-handle: 0
		Content: null
	]

	open: func[
		name [c-string!]
		return: [integer!]
		/local
			i     [integer!]
			bytes [byte-ptr!]
	][
		if file-handle <> 0 [ close file-handle ]
		file-handle: simple-io/open-file name simple-io/RIO_READ false
		if 0 >= file-handle [
			print-line {ERROR: Unable to open file.}
			return 2
		]
		if 1 = init-in-from-file file-handle [
			Signature: in/pos/1
			if not all [
				#"W" = in/pos/2
				#"S" = in/pos/3
				any [Signature = #"C" Signature = #"F" Signature = #"Z"]
			][
				print-line {ERROR: Not supported SWF file.}
				close
				return 3
			]
			Version: as integer! in/pos/4
			in/pos: in/pos + 4

			FileLength: readUI32
			
			switch Signature [
				#"C" [
					bytes: allocate FileLength
					i: zlib/z-uncompress bytes :FileLength in/pos as integer! (in/tail - in/pos)
					if 0 <> i [
						print-line [{ERROR: Decompression failed with code: } i]
						close
						return 4
					]
					free in/head ;release previous compressed buffer
					in/head: bytes
					in/pos:  bytes
					in/tail: bytes + FileLength
					in/end:  in/tail
				]
				#"Z" [
					print-line {ERROR: LZMA compression is not supported yet!}
					close
					return 5
				]
				default [0] ;do nothing
			]
			readRECT FrameSize
			FrameRate:  readSShortFixed
			FrameCount: readUI16
			Content: in/pos
		]
		1 ;
	]

	parse: func[
		return: [c-string!]
		/local
			i     [integer!]
			bytes [byte-ptr!]
			id    [integer!]
			format pos
	][
		out: alloc-buffer out 32768

		if not all [Content >= in/head Content <= in/end][
			return {ERROR: "no data"}
		]

		if SWF_TAG_ACTION(EXTRACT_HEADER) [ 
			writeFormated ["SWF-Version: " Version    lf]
			writeFormated ["SWF-Bytes:   " FileLength lf]
			writeFormated  "Compression: "
			writeFormated [switch Signature [
				#"C" ["ZLIB"] #"Z" ["LZMA"] default ["none"]
			] lf]
			writeFormated ["FrameSize: [" FrameSize/Xmin " " FrameSize/Ymin " " FrameSize/Xmax / 20 " " FrameSize/Ymax / 20 "]" lf]
			writeFormated ["FrameRate:  " FrameRate lf]
			writeFormated ["FrameCount: " FrameCount lf]
		]

		in/pos: Content
		while [in/pos < in/tail][
			tagPos: in/pos
			process-tag
		]

		writeUI8 0 ;closing c-string
		as c-string! out/head
	]
	
	parse-tag: func[
		tag-offset   [integer!]
		return: [c-string!]
	][
		if not all [Content >= in/head Content <= in/end][ return {ERROR: "no data"} ]
		tagPos: in/head + tag-offset
		if any [tagPos > in/end tagPos < in/head][ return {ERROR: "index out of range"}]
		in/pos: tagPos

		out: alloc-buffer out 32768

		process-tag

		writeUI8 0 ;closing c-string
		as c-string! out/head
	]

	process-tag: func[
		/local i format pos offset tagEnd R G B is? col
	][
		i: readUI16 ;tagAndLength
		tagId:     (65472 and i) >> 6
		tagLength: i and 63
		if tagLength = 63 [tagLength: readUI32]
		tagEnd: in/pos + tagLength

		case [
			;-- Display list tags
			all [
				tagId = 4 ;PlaceObject
				SWF_TAG_ACTION(EXTRACT_INFO)
			][
				PRINT_TAG_INFO
				i: readUI16 ;ID
				writeFormated ["CharacterID: " i lf]
				writeFormated ["Depth:       " readUI16 lf]
				readMatrixTo tmpMatrix
				writeFormated ["Matrix: ["
					"^/^-" tmpMatrix/scaleX 
					"^/^-" tmpMatrix/scaleY
					"^/^-" tmpMatrix/RotateSkew0
					"^/^-" tmpMatrix/RotateSkew1
					"^/^-" tmpMatrix/TranslateX
					"^/^-" tmpMatrix/TranslateY
					"^/]^/"
				]
				if in/pos < tagEnd [
					readCXFORMTo tmpCXFORM
					writeFormated ["CXFORM: ["
						"^/^-" tmpCXFORM/RMult 
						"^/^-" tmpCXFORM/GMult
						"^/^-" tmpCXFORM/BMult
						"^/^-" tmpCXFORM/RAdd
						"^/^-" tmpCXFORM/GAdd
						"^/^-" tmpCXFORM/BAdd
						"^/]^/"
					]
				]
			]

			all [
				tagId = 39 ;DefineSprite
				SWF_TAG_ACTION(EXTRACT_INFO)
			][
				PRINT_TAG_INFO
				i: readUI16 ;ID
				writeFormated ["SpriteID: " i lf]
				writeFormated ["FrameCount: " readUI16 lf]
				writeFormated "ControlTags: [^/"
				i: 0
				while [in/pos < tagEnd][
					tagPos: in/pos
					i: i + 1
					;writeFormated ["^/;#### tag number: " i lf]
					process-sprite-tag
				]
			]

			;-- Control Tags
			all [
				tagId = 9 ;SetBackgroundColor
				SWF_TAG_ACTION(EXTRACT_INFO)
			][
				PRINT_TAG_INFO
				R: readUI8
				G: readUI8
				B: readUI8
				writeFormated ["BackgroundColor: " R #"." G #"." B lf]
			]
			all [
				tagId = 43 ;FrameLabel
				SWF_TAG_ACTION(EXTRACT_INFO)
			][
				writeFormated ["FrameLabel: " readString lf]
				is?: all [
					in/pos < tagEnd
					readUI8 > 0
				]
				writeFormated ["IsAnchor:   " is? lf]
			]


			all [
				any [tagId = 56 tagId = 76]
				any [SWF_TAG_ACTION(EXTRACT_INFO) SWF_TAG_ACTION(EXTRACT_EXPORTS)]
			][
				PRINT_TAG_INFO
				writeFormated ["Exports: [" lf]
				i: readUI16 ;Number of assets to export
				while [i > 0][
					writeFormated ["^-"  readUI16     ] ;ID
					writeFormated ["^-%" readString lf] ;Identifier
					i: i - 1
				]
				writeFormated ["]" lf]
			]
			all [
				tagId = 21
				any [SWF_TAG_ACTION(EXTRACT_INFO) SWF_TAG_ACTION(EXTRACT_BITMAPS)]
			][
				PRINT_TAG_INFO
				i: readUI16 ;ID
				writeFormated ["BitmapID: " i lf]
				writeFormated ["BitmapData: " in/pos " " (tagLength - 2) " bytes" lf]
				in/pos: in/pos + tagLength - 2
			]
			all [
				any [tagId = 36 tagId = 20]
				any [SWF_TAG_ACTION(EXTRACT_INFO) SWF_TAG_ACTION(EXTRACT_BITMAPS)]
			][
				PRINT_TAG_INFO
				pos: in/pos + tagLength
				i:      readUI16 ;ID
				format: readUI8
				writeFormated ["BitmapID: " i lf]
				writeFormated ["BitmapFormat: " format   lf]
				writeFormated ["BitmapWidth:  " readUI16 lf]
				writeFormated ["BitmapHeight: " readUI16 lf]
				if format = 3 [
					writeFormated ["BitmapColorTableSize: " readUI8 lf]
				]
				writeFormated ["ZlibBitmapData: " in/pos " " as integer! (pos - in/pos) " bytes" lf]
				in/pos: pos
			]

			all [
				tagId = 35
				any [SWF_TAG_ACTION(EXTRACT_INFO) SWF_TAG_ACTION(EXTRACT_BITMAPS)]
			][
				PRINT_TAG_INFO
				pos: in/pos + tagLength
				i:      readUI16 ;ID
				writeFormated ["BitmapID: " i]
				offset: readUI32
				writeFormated ["BmpImageData: " in/pos " bytes: " offset lf]
				in/pos: in/pos + offset
				writeFormated ["BmpAlphaData: " in/pos " bytes: " (pos - in/pos) lf]
				in/pos: pos
			]
			all [
				tagId = 14 ;DefineSound
				SWF_TAG_ACTION(EXTRACT_SOUNDS)
			][
				;@@ TODO
				PRINT_TAG_INFO
			]
			true [
				if SWF_TAG_ACTION(EXTRACT_TAGS) [ PRINT_TAG_INFO ]
				if SWF_TAG_ACTION(EXTRACT_INFO) [
					writeFormated "Raw: #{^/"
					writeFormatedBinary in/pos as integer! (tagEnd - in/pos)
					if any [out/pos/0 = #"^/" out/pos/0 = #" "][out/pos: out/pos - 1]
					writeFormated "}^/"
				]
			]
		]
		in/pos: tagEnd ;to make sure that we are really at the end of tag after parsing it
	]

	process-sprite-tag: func[
		/local i format pos offset tagEnd R G B is? col
	][
		i: readUI16 ;tagAndLength
		tagId:     (65472 and i) >> 6
		tagLength: i and 63
		if tagLength = 63 [tagLength: readUI32]
		tagEnd: in/pos + tagLength

		case [
			true [
				 writeFormated ["^-" get-tag-name tagId lf]
			]
		]
		in/pos: tagEnd ;to make sure that we are really at the end of tag after parsing it
	]
]


