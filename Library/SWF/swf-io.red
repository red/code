Red [
	Title:	"SWF-io - Red version"
	Purpose: "Provides SWF related reading/writing functions"
	Author: "Oldes"
	File: 	%swf-io.red
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

swf: context [
	#system [
		#include %swf-io.reds
	]

	open: routine [
		"Open SWF file"
		file [file!]
		return: [logic!]
		/local len name result
	][
		len: -1
		name: unicode/to-utf8 as red-string! file :len
		result: swf/open name

		1 = result
	]
	close: routine [
		"Closes SWF file"
	][
		swf/close
	]
	parse: routine [
		"Extracts information and/or data from opened SWF"
		result [string!] "Optional string, where result will be stored"
		return: [string!]
		/local
			cstr [c-string!]
	][
		cstr: swf/parse
		either TYPE_OF(result) = TYPE_STRING [
			string/concatenate-literal result cstr
		][
			string/load-at cstr length? cstr as red-value! result UTF-8 
		]
		result
	]
	parse-tag: routine [
		"Extracts data from single tag from opened SWF."
		offset [integer!] "tag position received from previous parse query"
		result [string!] "Optional string, where result will be stored"
		return: [string!]
		/local
			cstr [c-string!]
	][
		cstr: swf/parse-tag offset
		either TYPE_OF(result) = TYPE_STRING [
			string/concatenate-literal result cstr
		][
			string/load-at cstr length? cstr as red-value! result UTF-8 
		]
		stack/set-last as red-value! result
		result
	]
	set-actions: routine [
		actions [integer!]
	][
		swf/tag-actions: actions
	]
	set-verbose: routine [
		level [integer!]
	][
		swf/verbose: level
	]

	result-buffer: make string! 1024

	query: func[
		/verbose level [integer!]
		/header      "SWF file header info"
		/tags        "List of tags [tagID offset bytes]"
		/exports     "List of exported names [id name]"
		/bitmaps     "Bitmaps related tags info (TODO)"
		/sounds      "Sounds related tags info (TODO)"
		/into  result [string! none!]
		/local actions [integer!]
	][
		actions: 0
		case/all [
			header  [ actions: actions or 01h]
			tags    [ actions: actions or 02h]
			exports [ actions: actions or 04h]
		]
		set-actions either actions > 0 [actions][FFFFFFFFh]
		if verbose [set-verbose level]
		parse either into [result][clear head result-buffer]
	]

	tag-names: #(
		0    "End"
		1    "ShowFrame"
		2    "DefineShape"
		3    "FreeCharacter"
		4    "PlaceObject"
		5    "RemoveObject"
		6    "DefineBitsJPEG"
		7    "DefineButton"
		8    "JPEGTables"
		9    "SetBackgroundColor"
		10   "DefineFont"
		11   "DefineText"
		12   "DoActionTag"
		13   "DefineFontInfo"
		14   "DefineSound"
		15   "StartSound"
		18   "SoundStreamHead"
		17   "DefineButtonSound"
		19   "SoundStreamBlock"
		20   "DefineBitsLossless"
		21   "DefineBitsJPEG2"
		22   "DefineShape2"
		23   "DefineButtonCxform"
		24   "Protect"
		26   "PlaceObject2"
		28   "RemoveObject2"
		31   "GeneratorCommand_?"
		32   "DefineShape3"
		33   "DefineText2"
		34   "DefineButton2"
		35   "DefineBitsJPEG3"
		36   "DefineBitsLossless2"
		37   "DefineEditText"
		38   "DefineVideo"
		39   "DefineSprite"
		40   "SWT-CharacterName"
		41   "SerialNumber"
		42   "DefineTextFormat"
		43   "FrameLabel"
		45   "SoundStreamHead2"
		46   "DefineMorphShape"
		48   "DefineFont2"
		49   "GenCommand_?"
		50   "DefineCommandObj_?"
		51   "Characterset_?"
		52   "FontRef_?"
		56   "ExportAssets"
		57   "ImportAssets"
		58   "EnableDebugger"
		59   "DoInitAction"
		60   "DefineVideoStream"
		61   "VideoFrame"
		62   "DefineFontInfo2"
		63   "DebugID"
		64   "ProtectDebug2"
		65   "ScriptLimits"
		66   "SetTabIndex"
		67   "DefineShape4"
		69   "FileAttributes"
		70   "PlaceObject3"
		71   "Import2"
		73   "DefineAlignZones"
		74   "CSMTextSettings"
		75   "DefineFont3"
		77   "MetaData"
		78   "DefineScalingGrid"
		72   "DoAction3"
		76   "DoAction3StartupClass"
		82   "DoAction3"
		83   "DefineShape5"
		84   "DefineMorphShape2"
		86   "SceneAndFrameLabelData"
		87   "DefineBinaryData"
		88   "DefineFontName"
		89   "StartSound2"
		90   "DefineBitsJPEG4"
		91   "DefineFont4"
		93   "Telemetry"
		1023 "DefineBitsPtr"
	)
]

;swf-test: func[][
;	print swf/open %Test_anims.swf
;	print swf/parse none
;	swf/close
;]
