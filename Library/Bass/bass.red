Red [
	Title:  "Bass audio library high-level interface"
	Author: "Oldes"
	File: 	 %Bass.red
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]
#system [
	#include %bass.reds

	#define TRACE(value) [
		print-line value ;only for debugging purposes
	]

	bass: context [

		_set-word: declare red-word! 0
		_set-word/index: -1
		_initialized: false
		_last-handle: declare red-handle! [0 0 0 0]
		_info-sample: declare BASS_SAMPLE!

		set-handle: func [
			type    [integer!]
			value   [integer!]
			parent  [integer!]
			/local
				val [red-value!]
				hnd [red-handle!]
		][
			if _set-word/index >= 0 [
				val: _context/get _set-word
				hnd: as red-handle! val
				hnd/header: TYPE_HANDLE
				hnd/value: value
				hnd/_pad: type      ;-- storing handle type in unused slot value
				hnd/padding: parent ;-- storing special parent pointer in unused slot
			]
			;-- _last-handle is used to simplify dialect so user don't have to pass the handle value repeatadly
			_last-handle/value: value
			_last-handle/_pad: type 
			_last-handle/padding: parent
		]
		

		throw-error: func [
			cmds   [red-block!]
			cmd    [red-value!]
			catch? [logic!]
			/local
				base   [red-value!]
		][
			base: block/rs-head cmds
			cmds: as red-block! stack/push as red-value! cmds
			cmds/head: (as-integer cmd - base) >> 4
			
			fire [TO_ERROR(script invalid-data) cmds]
		]

		get-error-str: func[
			code    [integer!]
			return: [c-string!]
			/local
				msg [c-string!]
		][
			switch code [
				BASS_ERROR_MEM		[msg: "memory error"]
				BASS_ERROR_FILEOPEN	[msg: "can't open the file"]
				BASS_ERROR_DRIVER	[msg: "can't find a free/valid driver"]
				BASS_ERROR_BUFLOST	[msg: "the sample buffer was lost"]
				BASS_ERROR_HANDLE	[msg: "invalid handle"]
				BASS_ERROR_FORMAT	[msg: "unsupported sample format"]
				BASS_ERROR_POSITION	[msg: "invalid position"]
				BASS_ERROR_INIT		[msg: "BASS_Init has not been successfully called"]
				BASS_ERROR_START	[msg: "BASS_Start has not been successfully called"]
				BASS_ERROR_SSL		[msg: "SSL/HTTPS support isn't available"]
				BASS_ERROR_ALREADY	[msg: "already initialized/paused/whatever"]
				BASS_ERROR_NOCHAN	[msg: "can't get a free channel"]
				BASS_ERROR_ILLTYPE	[msg: "an illegal type was specified"]
				BASS_ERROR_ILLPARAM	[msg: "an illegal parameter was specified"]
				BASS_ERROR_NO3D		[msg: "no 3D support"]
				BASS_ERROR_NOEAX	[msg: "no EAX support"]
				BASS_ERROR_DEVICE	[msg: "illegal device number"]
				BASS_ERROR_NOPLAY	[msg: "not playing"]
				BASS_ERROR_FREQ		[msg: "illegal sample rate"]
				BASS_ERROR_NOTFILE	[msg: "the stream is not a file stream"]
				BASS_ERROR_NOHW		[msg: "no hardware voices available"]
				BASS_ERROR_EMPTY	[msg: "the MOD music has no sequence data"]
				BASS_ERROR_NONET	[msg: "no internet connection could be opened"]
				BASS_ERROR_CREATE	[msg: "couldn't create the file"]
				BASS_ERROR_NOFX		[msg: "effects are not available"]
				BASS_ERROR_NOTAVAIL	[msg: "requested data is not available"]
				BASS_ERROR_DECODE	[msg: {the channel is/isn't a "decoding channel}]
				BASS_ERROR_DX		[msg: "a sufficient DirectX version is not installed"]
				BASS_ERROR_TIMEOUT	[msg: "connection timedout"]
				BASS_ERROR_FILEFORM	[msg: "unsupported file format"]
				BASS_ERROR_SPEAKER	[msg: "unavailable speaker"]
				BASS_ERROR_VERSION	[msg: "invalid BASS version (used by add-ons)"]
				BASS_ERROR_CODEC	[msg: "codec is not available/supported"]
				BASS_ERROR_ENDED	[msg: "the channel/file has ended"]
				BASS_ERROR_BUSY		[msg: "the device is busy"]
				default             [msg: "some other mystery problem"]
			]
			msg
		]


		get-float: func [
			int		[red-integer!]
			return: [float!]
			/local
				f	[red-float!]
				v	[float!]
		][
			either TYPE_OF(int) = TYPE_INTEGER [
				v: as-float int/value
			][
				f: as red-float! int
				v: f/value
			]
			v
		]
		get-int: func [
			int		[red-integer!]
			return: [integer!]
			/local
				f	[red-float!]
				v	[integer!]
		][
			either TYPE_OF(int) = TYPE_FLOAT [
				f: as red-float! int
				v: as integer! f/value
			][
				v: int/value
			]
			v
		]

		#define BASS_FETCH_VALUE(type) [
			cmd: cmd + 1
			if any [cmd >= tail TYPE_OF(cmd) <> type][
				throw-error cmds cmd false
			]
		]
		#define BASS_FETCH_VALUE_2(type1 type2) [
			cmd: cmd + 1
			if any [cmd >= tail all [TYPE_OF(cmd) <> type1 TYPE_OF(cmd) <> type2]][
				throw-error cmds cmd false
			]
		]
		#define BASS_FETCH_OPT_VALUE(type) [
			pos: cmd + 1
			if all [pos < tail TYPE_OF(pos) = type][cmd: pos]
		]
		#define BASS_FETCH_FILE(name) [
			cmd: cmd + 1
			if any [cmd >= tail all [TYPE_OF(cmd) <> TYPE_STRING TYPE_OF(cmd) <> TYPE_FILE]][
				throw-error cmds cmd false
			]
			len: -1
			name: unicode/to-utf8 as red-string! cmd :len
		]
		#define BASS_FETCH_NAMED_VALUE(type) [
			cmd: cmd + 1
			if cmd >= tail [throw-error cmds cmd false]
			value: either TYPE_OF(cmd) = TYPE_WORD [_context/get as red-word! cmd][cmd]
			if TYPE_OF(value) <> type [throw-error cmds cmd false]
		]
		#define BASS_FETCH_OPT_NAMED_VALUE(type) [
			pos: cmd + 1
			if pos < tail [
				value: either TYPE_OF(pos) = TYPE_WORD [_context/get as red-word! pos][pos]
				if TYPE_OF(value) = type [cmd: pos]
			]
		]
		#define BASS_FETCH_OPT_NAMED_VALUE_2(type1 type2) [
			pos: cmd + 1
			if pos < tail [
				value: either TYPE_OF(pos) = TYPE_WORD [_context/get as red-word! pos][pos]
				if any [TYPE_OF(value) = type1 TYPE_OF(value) = type2][cmd: pos]
			]
		]
		#define BASS_FETCH_HANDLE(hnd) [
			cmd: cmd + 1
			if cmd >= tail [throw-error cmds cmd false]
			value: either any [
				TYPE_OF(cmd) = TYPE_WORD
				TYPE_OF(cmd) = TYPE_GET_WORD
			][ _context/get as red-word! cmd ][cmd]
			hnd: either TYPE_OF(value) <> TYPE_HANDLE [
				;throw-error cmds cmd false
				_last-handle
			][
				as red-handle! value
			] 
			type: hnd/_pad
		]
		#define BASS_FETCH_TIME(ms) [
			cmd: cmd + 1
			if cmd >= tail [throw-error cmds cmd false]
			value: either TYPE_OF(cmd) = TYPE_WORD [_context/get as red-word! cmd][cmd]
			switch TYPE_OF(value) [
				TYPE_INTEGER [
					ms: get-int as red-integer! cmd
				]
				TYPE_FLOAT [
					fl: as red-float! cmd
					ms: as integer! (1000.0 * fl/value)
				]
				TYPE_TIME [
					tm: as red-time! cmd
					ms: as-integer (tm/time / 1E6)
				]
				default [
					throw-error cmds cmd false
				]
			]
		]
		#define BASS_FETCH_OPT_TIME(ms) [
			pos: cmd + 1
			if pos < tail [
				value: either TYPE_OF(pos) = TYPE_WORD [_context/get as red-word! pos][pos]
				switch TYPE_OF(value) [
					TYPE_INTEGER [
						ms: get-int as red-integer! pos
						cmd: pos
					]
					TYPE_FLOAT [
						fl: as red-float! pos
						ms: as integer! (1000.0 * fl/value)
						cmd: pos
					]
					TYPE_TIME [
						tm: as red-time! pos
						ms: as-integer (tm/time / 1E6)
						cmd: pos
					]
					default [ms: 0]
				]
			]
		]
		#define BASS_FETCH_OPT_SETTINGS(blk ms) [
			blk: null
			BASS_FETCH_OPT_NAMED_VALUE(TYPE_BLOCK) 
			if pos = cmd [
				blk: as red-block! value
				BASS_FETCH_OPT_TIME(ms)
			]
		]
		#define ASSERT_SET(_set-word) [
			if _set-word/index < 0 [
				throw-error cmds cmd false
			]
		]
		#define AS_FLOAT(value index) [
			get-float as red-integer! value + index
		]
		#define AS_INT(value index) [
			get-int as red-integer! value + index
		]
		#define RESET_HANDLE(hnd) [
			hnd/padding: 0
			hnd/value: 0
			hnd/_pad: 0
		]


		_Init:           symbol/make "init"
		_End:            symbol/make "end"
		_Load:           symbol/make "load"
		_Play:           symbol/make "play"
		_Pause:          symbol/make "pause"
		_Resume:         symbol/make "resume"
		_Stop:           symbol/make "stop"
		_Free:           symbol/make "free"
		_Music:          symbol/make "music"
		_Fade:           symbol/make "fade"
		_Set:            symbol/make "set"

		_CHORUS:         symbol/make "chorus"
		_COMPRESSOR:     symbol/make "compressor"
		_DISTORTION:     symbol/make "distortion"
		_ECHO:           symbol/make "echo"
		_FLANGER:        symbol/make "flanger"
		_GARGLE:         symbol/make "gargle"
		_I3DL2REVERB:    symbol/make "reverb-3D"
		_PARAMEQ:        symbol/make "parameq"
		_REVERB:         symbol/make "reverb"

		_freq:           symbol/make "freq"
    	_volume:         symbol/make "volume"
    	_pan:            symbol/make "pan"
    	_flags:          symbol/make "flags"
    	_length:         symbol/make "length"
    	_max:            symbol/make "max"
    	_origres:        symbol/make "origres"
    	_chans:          symbol/make "chans"
    	_mingap:         symbol/make "mingap"
    	_mode3d:         symbol/make "mode3d"
    	_mindist:        symbol/make "mindist"
    	_maxdist:        symbol/make "maxdist"
    	_iangle:         symbol/make "iangle"
    	_oangle:         symbol/make "oangle"
    	_outvol:         symbol/make "outvol"
    	_quality:        symbol/make "quality"
    	_vam:            symbol/make "vam"
    	_priority:       symbol/make "priority"
    	_no-ramp:        symbol/make "no-ramp"
    	_no-buffer:      symbol/make "no-buffer"
    	_eax:            symbol/make "eax"
    	_bpm:            symbol/make "bpm"
    	_amplify:        symbol/make "amplify"
    	_pan-separation: symbol/make "pan-separation"
    	_position-scaler: symbol/make "position-scaler"
    	_speed:          symbol/make "speed"


		_8BITS:          symbol/make "8bits"
		_FLOAT:          symbol/make "float"
		_MONO:           symbol/make "mono"
		_LOOP:           symbol/make "loop"
		_MODE-3D:        symbol/make "mode-3D"
		_SOFTWARE:       symbol/make "sofware"
		_MUTEMAX:        symbol/make "mute-max"
		_VAM:            symbol/make "vam"
		_FX:             symbol/make "fx"
		_OVER_VOL:       symbol/make "over-vol"
		_OVER_POS:       symbol/make "over-pos"
		_OVER_DIST:      symbol/make "over-dist"

		_Sound!:         symbol/make "sound!"
		_Channel!:       symbol/make "channel!"
		_Music!:         symbol/make "music!"
		_FX!:            symbol/make "fx!"

		do: func[
			cmds [red-block!]
			return: [red-value!]
			/local
				cmd       [red-value!]
				tail      [red-value!]
				start     [red-value!]
				pos		  [red-value!]
				value	  [red-value!]
				blk       [red-block!]
				word      [red-word!]
				sym       [integer!]
				type      [integer!]
				symb      [red-symbol!]
				str       [red-string!]
				len       [integer!]
				name      [c-string!]
				result    [logic!]
				hnd       [red-handle!]
				sound     [integer!]
				channel   [integer!]
				music     [integer!]
				i         [integer!]
				fx        [integer!]
				tm        [red-time!]
				ms        [integer!]
				fl        [red-float!]
		][
			cmd:  block/rs-head cmds
			tail: block/rs-tail cmds
			len: -1
			
			while [cmd < tail][
				case [
					TYPE_OF(cmd) = TYPE_SET_WORD [
						_set-word:  as red-word! cmd
					]
					any [ TYPE_OF(cmd) = TYPE_WORD TYPE_OF(cmd) = TYPE_LIT_WORD ][
						start: cmd + 1
						word:  as red-word! cmd
						sym:   symbol/resolve word/symbol
						symb:  symbol/get sym
						TRACE(["--> " symb/cache])
						case [
							sym = _Load [
								ASSERT_SET(_set-word)   ;loading sound without setting it would lead just to memory leak
								BASS_FETCH_FILE(name)
								sound: BASS_SampleLoad no name 0.0 0 3 0
								either sound <> 0 [
									BASS_FETCH_OPT_NAMED_VALUE(TYPE_BLOCK) ;optional settings
									if pos = cmd [
										;TRACE(["has sound settings " cmd])
										process-sample-info sound as red-block! cmd
									]
									set-handle _Sound! sound 0
									TRACE(["sound: " as byte-ptr! sound])
								][
									if BASS_ERROR_FILEFORM = BASS_ErrorGetCode [
										music: BASS_MusicLoad no name 0.0 0 0 0
										if music <> 0 [
											set-handle _Music! music 0
											TRACE(["music: " as byte-ptr! music])
										]
									]
								]
							]
							sym = _Music [ ;@@ should I keep it? Load is now loading music too
								ASSERT_SET(_set-word)   ;loading sound without setting it would lead just to memory leak
								BASS_FETCH_FILE(name)
								music: BASS_MusicLoad no name 0.0 0 0 0
								set-handle _Music! music 0
								TRACE(["music: " as byte-ptr! music])
							]
							sym = _Play [
								BASS_FETCH_HANDLE(hnd)
								channel: 0
								case [
									type = _Sound! [
										channel: BASS_SampleGetChannel hnd/value no
									]
									any [type = _Channel! type = _Music!][
										channel: hnd/value
									]
									true [
										print-line "BASS play expect valid sound, music or channel handle!"
									]
								]
								BASS_FETCH_OPT_SETTINGS(blk ms)
								if channel <> 0 [
									if blk <> null [process-channel-attributes channel blk ms]
									BASS_ChannelPlay channel yes
								]
								set-handle _Channel! channel hnd/value
							]
							sym = _Pause [
								BASS_FETCH_HANDLE(hnd)
								case [
									any [type = _Channel! type = _Music!] [
										BASS_ChannelPause hnd/value
									]
									true [
										print-line "BASS pause expect valid channel handle!"
									]
								]
								set-handle _Channel! hnd/value hnd/padding
							]
							sym = _Resume [
								BASS_FETCH_HANDLE(hnd)
								channel: hnd/value
								BASS_FETCH_OPT_SETTINGS(blk ms)
								case [
									any [type = _Channel! type = _Music!] [
										BASS_ChannelPlay channel no ;--play without restarting
										if blk <> null [process-channel-attributes hnd/value blk ms]
									]
									true [
										print-line "BASS resume expect valid channel or music handle!"
									]
								]
								set-handle _Channel! channel hnd/padding
							]
							sym = _Stop [
								BASS_FETCH_HANDLE(hnd)
								case [
									type = _Sound! [
										BASS_SampleStop hnd/value
									]
									any [type = _Channel! type = _Music!][
										BASS_ChannelStop hnd/value
									]
									type = _FX! [
										;the FX handle is storing channel pointer as hnd/padding
										BASS_ChannelRemoveFX hnd/padding hnd/value
										RESET_HANDLE(hnd)
									]
									true [
										print-line "BASS stop expect valid sound, music, channel or fx handle!"
									]
								]
								set-handle _Channel! hnd/value hnd/padding
							]
							any [sym = _Fade sym = _Set] [
								BASS_FETCH_HANDLE(hnd)
								BASS_FETCH_NAMED_VALUE(TYPE_BLOCK)
								blk: as red-block! value
								either sym = _Fade [
									BASS_FETCH_TIME(ms)
								][
									ms: 0
								]
								case [
									any [type = _Channel! type = _Music!][
										process-channel-attributes hnd/value blk ms
									]
									true [
										print-line "BASS fade expect valid music or channel handle!"
									]
								]
							]

							sym = _CHORUS [
								BASS_FETCH_HANDLE(hnd) ;--channel
								fx: BASS_ChannelSetFX hnd/value BASS_FX_DX8_CHORUS 0
								set-handle _FX! fx hnd/value
							]
							sym = _COMPRESSOR [
								BASS_FETCH_HANDLE(hnd) ;--channel
								fx: BASS_ChannelSetFX hnd/value BASS_FX_DX8_COMPRESSOR 0
								set-handle _FX! fx hnd/value
							]
							sym = _DISTORTION [
								BASS_FETCH_HANDLE(hnd) ;--channel
								fx: BASS_ChannelSetFX hnd/value BASS_FX_DX8_DISTORTION 0
								set-handle _FX! fx hnd/value
							]
							sym = _ECHO [
								BASS_FETCH_HANDLE(hnd) ;--channel
								fx: BASS_ChannelSetFX hnd/value BASS_FX_DX8_ECHO 0
								set-handle _FX! fx hnd/value
							]
							sym = _FLANGER [
								BASS_FETCH_HANDLE(hnd) ;--channel
								fx: BASS_ChannelSetFX hnd/value BASS_FX_DX8_FLANGER 0
								set-handle _FX! fx hnd/value
							]
							sym = _GARGLE [
								BASS_FETCH_HANDLE(hnd) ;--channel
								fx: BASS_ChannelSetFX hnd/value BASS_FX_DX8_GARGLE 0
								set-handle _FX! fx hnd/value
							]
							sym = _I3DL2REVERB [
								BASS_FETCH_HANDLE(hnd) ;--channel
								fx: BASS_ChannelSetFX hnd/value BASS_FX_DX8_I3DL2REVERB 0
								set-handle _FX! fx hnd/value
							]
							sym = _PARAMEQ [
								BASS_FETCH_HANDLE(hnd) ;--channel
								fx: BASS_ChannelSetFX hnd/value BASS_FX_DX8_PARAMEQ 0
								set-handle _FX! fx hnd/value
							]
							sym = _REVERB [
								BASS_FETCH_HANDLE(hnd) ;--channel
								fx: BASS_ChannelSetFX hnd/value BASS_FX_DX8_REVERB 0
								set-handle _FX! fx hnd/value
							]

							sym = _Free [
								BASS_FETCH_HANDLE(hnd)
								case [
									type = _Sound!   [ BASS_SampleFree  hnd/value ]
									type = _Music!   [ BASS_MusicFree   hnd/value ]
									type = _FX! [
										;the FX handle is storing channel pointer as hnd/padding
										BASS_ChannelRemoveFX hnd/padding hnd/value 
									]
									;@@ should I also free a sound if I get channel handle?
									true [
										print-line "BASS free expect valid sound, music or fx handle!"
									]
								]
								RESET_HANDLE(hnd)
								RESET_HANDLE(_last-handle)
							]
							sym = _Init [
								BASS_FETCH_VALUE(TYPE_INTEGER)
								BASS_FETCH_VALUE(TYPE_INTEGER)
								BASS_FETCH_VALUE(TYPE_INTEGER)
								if _initialized [BASS_Free]
								_initialized: BASS_Init AS_INT(start 0) AS_INT(start 1) AS_INT(start 2) 0 null
							]
							sym = _End [
								_initialized: not BASS_Free
								RESET_HANDLE(_last-handle)
							]


							true [ throw-error cmds cmd false ]
						]
						_set-word/index: -1
						if BASS_ErrorGetCode > 0 [
							i: BASS_ErrorGetCode
							print-line ["BASS Error [" i "]: " get-error-str i]
						]
					]
					true [ throw-error cmds cmd false ]
				]
				cmd: cmd + 1
			]
			as red-value! logic/box true
		]

		process-sample-info: func[
			sample  [HSAMPLE!]
			cmds    [red-block!]
			/local
				cmd       [red-value!]
				tail      [red-value!]
				start     [red-value!]
				pos		  [red-value!]
				value	  [red-value!]
				word      [red-word!]
				sym       [integer!]
				symb      [red-symbol!]
				len       [integer!]
				name      [c-string!]
				flags     [integer!]
		][
			cmd:  block/rs-head cmds
			tail: block/rs-tail cmds
			len: -1
			BASS_SampleGetInfo sample _info-sample
			flags: _info-sample/flags
			TRACE(["old flags: " flags])
			while [cmd < tail][
				case [
					any [TYPE_OF(cmd) = TYPE_WORD TYPE_OF(cmd) = TYPE_SET_WORD] [
						start: cmd + 1
						word:  as red-word! cmd
						sym:   symbol/resolve word/symbol
						symb:  symbol/get sym
						TRACE(["--> " symb/cache])
						either TYPE_OF(cmd) = TYPE_SET_WORD [
							case [
								sym = _volume [
									BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
									TRACE(["old volume: " _info-sample/volume])
									_info-sample/volume: as float32! AS_FLOAT(start 0)
									TRACE(["new volume: " _info-sample/volume])
								]
								sym = _pan [
									BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
									TRACE(["old pan: " _info-sample/pan])
									_info-sample/pan: as float32! AS_FLOAT(start 0)
									TRACE(["new pan: " _info-sample/pan])
								]
									;_freq:           symbol/make "freq"
							    	;_flags:          symbol/make "flags"
							    	;_length:         symbol/make "length"
							    	;_max:            symbol/make "max"
							    	;_origres:        symbol/make "origres"
							    	;_chans:          symbol/make "chans"
							    	;_mingap:         symbol/make "mingap"
							    	;_mode3d:         symbol/make "mode3d"
							    	;_mindist:        symbol/make "mindist"
							    	;_maxdist:        symbol/make "maxdist"
							    	;_iangle:         symbol/make "iangle"
							    	;_oangle:         symbol/make "oangle"
							    	;_outvol:         symbol/make "outvol"
							    	;_vam:            symbol/make "vam"
							    	;_priority:       symbol/make "priority"
							    true [ print-line ["wrong sound info arg: " start] ]
							]
						][
							case [
								sym = _LOOP      [flags: flags or BASS_SAMPLE_LOOP]
								sym = _8BITS     [flags: flags or BASS_SAMPLE_8BITS]
								sym = _FLOAT     [flags: flags or BASS_SAMPLE_FLOAT]
								sym = _MONO      [flags: flags or BASS_SAMPLE_MONO]
								sym = _MODE-3D   [flags: flags or BASS_SAMPLE_3D]
								sym = _SOFTWARE  [flags: flags or BASS_SAMPLE_SOFTWARE]
								sym = _MUTEMAX   [flags: flags or BASS_SAMPLE_MUTEMAX]
								sym = _VAM       [flags: flags or BASS_SAMPLE_VAM]
								sym = _FX        [flags: flags or BASS_SAMPLE_FX]
								sym = _OVER_VOL  [flags: flags or BASS_SAMPLE_OVER_VOL]
								sym = _OVER_POS  [flags: flags or BASS_SAMPLE_OVER_POS]
								sym = _OVER_DIST [flags: flags or BASS_SAMPLE_OVER_DIST]
								true [ print-line ["wrong sound info arg: " start] ]
							]
						]
					]
					true [ print-line ["wrong sound info value: " start] ]
				]
				cmd:  cmd + 1
			]
			TRACE(["new flags: " flags])
			_info-sample/flags: flags
			BASS_SampleSetInfo sample _info-sample
		]

		process-channel-attributes: func[
			handle  [integer!]
			cmds    [red-block!]
			time    [integer!]
			/local
				cmd       [red-value!]
				tail      [red-value!]
				start     [red-value!]
				pos		  [red-value!]
				value	  [red-value!]
				word      [red-word!]
				sym       [integer!]
				symb      [red-symbol!]
				len       [integer!]
				name      [c-string!]
				flags     [integer!]
		][
			cmd:  block/rs-head cmds
			tail: block/rs-tail cmds
			len: -1

			TRACE(["process-channel-attributes time: " time])
			while [cmd < tail][
				case [
					any [TYPE_OF(cmd) = TYPE_SET_WORD] [
						start: cmd + 1
						word:  as red-word! cmd
						sym:   symbol/resolve word/symbol
						symb:  symbol/get sym
						TRACE(["--> " symb/cache])
						case [
							sym = _volume [
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								either time > 0 [
									BASS_ChannelSlideAttribute handle BASS_ATTRIB_VOL as float32! AS_FLOAT(start 0) time
								][	BASS_ChannelSetAttribute handle BASS_ATTRIB_VOL as float32! AS_FLOAT(start 0) ]
							]
							sym = _pan [
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								either time > 0 [
									BASS_ChannelSlideAttribute handle BASS_ATTRIB_PAN as float32! AS_FLOAT(start 0) time
								][	BASS_ChannelSetAttribute handle BASS_ATTRIB_PAN as float32! AS_FLOAT(start 0) ]
							]
							sym = _quality [
								;The sample rate conversion quality...
								; 0 = linear interpolation,
								; 1 = 8 point sinc interpolation,
								; 2 = 16 point sinc interpolation,
								; 3 = 32 point sinc interpolation.
								; Other values are also accepted but will be interpreted as 0 or 3, depending on whether they are lower or higher. 
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								BASS_ChannelSetAttribute handle BASS_ATTRIB_SRC as float32! AS_FLOAT(start 0)
							]
							sym = _freq [
								;The sample rate... 0 = original rate (when the channel was created). 
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								either time > 0 [
									BASS_ChannelSlideAttribute handle BASS_ATTRIB_FREQ as float32! AS_FLOAT(start 0) time
								][	BASS_ChannelSetAttribute handle BASS_ATTRIB_FREQ as float32! AS_FLOAT(start 0) ]
							]
							sym = _no-ramp [
								;Disable playback ramping... 0 = no, else yes. 
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								BASS_ChannelSetAttribute handle BASS_ATTRIB_NORAMP as float32! AS_FLOAT(start 0)
							]
							sym = _no-buffer [
								;Disable playback buffering... 0 = no, else yes.  
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								BASS_ChannelSetAttribute handle BASS_ATTRIB_NOBUFFER as float32! AS_FLOAT(start 0)
							]
							sym = _eax [
								;The wet (reverb) / dry (no reverb) mix ratio of a channel.
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								either time > 0 [
									BASS_ChannelSlideAttribute handle BASS_ATTRIB_EAXMIX as float32! AS_FLOAT(start 0) time
								][	BASS_ChannelSetAttribute handle BASS_ATTRIB_EAXMIX as float32! AS_FLOAT(start 0) ]
							]
							sym = _bpm [
								;The BPM of a MOD music. 
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								either time > 0 [
									BASS_ChannelSlideAttribute handle BASS_ATTRIB_MUSIC_BPM as float32! AS_FLOAT(start 0) time
								][	BASS_ChannelSetAttribute handle BASS_ATTRIB_MUSIC_BPM as float32! AS_FLOAT(start 0) ]
							]
							sym = _pan-separation [
								;The pan separation level of a MOD music. 
								;0 (min) to 100 (max), 50 = linear. This will be rounded down to a whole number. 
								;By default BASS uses a linear panning "curve". If you want to use the panning of FT2, use a pan separation setting of around 35.
								;To use the Amiga panning (ie. full left and right) set it to 100. 
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								either time > 0 [
									BASS_ChannelSlideAttribute handle BASS_ATTRIB_MUSIC_PANSEP as float32! AS_FLOAT(start 0) time
								][	BASS_ChannelSetAttribute handle BASS_ATTRIB_MUSIC_PANSEP as float32! AS_FLOAT(start 0) ]
							]
							sym = _position-scaler [
								;The position scaler of a MOD music. 
								;1 (min) to 256 (max). This will be rounded down to a whole number. 
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								either time > 0 [
									BASS_ChannelSlideAttribute handle BASS_ATTRIB_MUSIC_PSCALER as float32! AS_FLOAT(start 0) time
								][	BASS_ChannelSetAttribute handle BASS_ATTRIB_MUSIC_PSCALER as float32! AS_FLOAT(start 0) ]
							]
							sym = _speed [
								;The speed of a MOD music. 
								;0 (min) to 255 (max). This will be rounded down to a whole number. 
								BASS_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER)
								either time > 0 [
									BASS_ChannelSlideAttribute handle BASS_ATTRIB_MUSIC_SPEED as float32! AS_FLOAT(start 0) time
								][	BASS_ChannelSetAttribute handle BASS_ATTRIB_MUSIC_SPEED	 as float32! AS_FLOAT(start 0) ]
							]
						    true [ print-line ["wrong channel attribute: " start] ]
						]
					]
					true [ print-line ["wrong channel attribute value: " start] ]
				]
				cmd:  cmd + 1
			]
		]
	]
]

Bass: context [
	init: func [
		"Initializes an output device."
		/device	arg1 [integer!] "The device to use... -1 = default device, 0 = no sound, 1 = first real output device."
		/freq   arg2 [integer!] "Output sample rate."
		/flags  arg3 [integer!]
	][
		bass/do reduce [
			'init
			any [arg1 -1]
			any [arg2 44100]
			any [arg3 0]
		]
	]
	free: func [
		"Frees all resources used by the output device, including all its samples, streams and MOD musics."
	][
		bass/do [end]
	]

	do: routine [
		"Evaluate Bass audio library dialect commands"
		commands [block!]
	][
		bass/do commands
	]
]
