Red [
	Title:  "ImageMagick high-level interface"
	Author: "Oldes"
	File:   %ImageMagick.red
	Tabs:   4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]
#system [
	#include %ImageMagick.reds
	MagickWandGenesis

	
	#define MAX_MAGIC_WANDS 16
	#define TRACE(value) [
		;print value ;only for debugging purposes
	]


	ImageMagick: context [

		BitmapData!: alias struct! [
			width		[integer!]
			height		[integer!]
			stride		[integer!]
			pixelFormat	[integer!]
			scan0		[byte-ptr!]
			reserved	[integer!]
		]

		MagickWands-table: as int-ptr! allocate MAX_MAGIC_WANDS * size? MagickWand!
		zerofill MagickWands-table MagickWands-table + MAX_MAGIC_WANDS

		*wand: NewMagickWand ;-- this holds the default MagickWand object
		*wand-index: 0
		MagickWands-table/*wand-index: as integer! *wand


		throw-magick-error: func [
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

		throw-magick-exception: func [
			cmds   [red-block!]
			cmd    [red-value!]
			catch? [logic!]
			/local
				base   [red-value!]
		][
			base: block/rs-head cmds
			cmds: as red-block! stack/push as red-value! cmds
			cmds/head: (as-integer cmd - base) >> 4
			
			fire [TO_ERROR(script bad-bad) cmd cmds]
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

		get-string: func[
			str [red-string!]
			return: [c-string!]
			/local
				len [integer!]
		][
			len: -1
			unicode/to-utf8 str :len
		]

		get-boolean: func[
			val [red-logic!]
			return: [integer!]
		][
			as integer! val/value
		]

		byte-to-float: func[
			value [byte!]
			return: [float!]
			/local
				i [integer!]
		][
			i: as integer! value
			(as float! i) / 255.0
		]


		_Use:               symbol/make "use"
		_Clear:             symbol/make "clear"
		_Clone:             symbol/make "clone"
		_Destroy:           symbol/make "destroy"
		_New:               symbol/make "new"
		;_To:               symbol/make "to"
		_Read:			    symbol/make "read"
		_Write:			    symbol/make "write"
		_Write-Images:	    symbol/make "write-images"
		_Preview:           symbol/make "preview"
		_Restart:           symbol/make "restart"
		_Index:             symbol/make "index"
		_Head:              symbol/make "head"
		_Tail:              symbol/make "tail"
		_Get-Index:         symbol/make "get-index"
		_Get-Size:          symbol/make "get-size"
		_Get-Image:         symbol/make "get-image"
		_Get-Binary:        symbol/make "get-binary"
		_Get-Info:          symbol/make "get-info"
		_Set-Alpha:         symbol/make "set-alpha"

		_combine:                   symbol/make "combine"
		_ordered-posterize:         symbol/make "ordered-posterize"
		_adaptive-blur:             symbol/make "adaptive-blur"
		_adaptive-resize:           symbol/make "adaptive-resize"
		_adaptive-sharpen:          symbol/make "adaptive-sharpen"
		_adaptive-threshold:        symbol/make "adaptive-threshold"
		_add:                       symbol/make "add"
		_add-noise:                 symbol/make "add-noise"
		_affine-transform:          symbol/make "affine-transform"
		_annotate:                  symbol/make "annotate"
		_auto-gamma:                symbol/make "auto-gamma"
		_auto-level:                symbol/make "auto-level"
		_black-threshold:           symbol/make "black-threshold"
		_blue-shift:                symbol/make "blue-shift"
		_blur:                      symbol/make "blur"
		_border:                    symbol/make "border"
		_brightness-contrast:       symbol/make "brightness-contrast"
		_charcoal:                  symbol/make "charcoal"
		_chop:                      symbol/make "chop"
		_clamp:                     symbol/make "clamp"
		_clip:                      symbol/make "clip"
		_clut:                      symbol/make "clut"
		_color-decision-list:       symbol/make "color-decision-list"
		_colorize:                  symbol/make "colorize"
		_color-matrix:              symbol/make "color-matrix"
		_comment:                   symbol/make "comment"
		_composite:                 symbol/make "composite"
		_contrast:                  symbol/make "contrast"
		_contrast-stretch:          symbol/make "contrast-stretch"
		_crop:                      symbol/make "crop"
		_cycle-colormap:            symbol/make "cycle-colormap"
		_decipher:                  symbol/make "decipher"
		_deskew:                    symbol/make "deskew"
		_despeckle:                 symbol/make "despeckle"
		_display:                   symbol/make "display"
		_draw:                      symbol/make "draw"
		_edge:                      symbol/make "edge"
		_emboss:                    symbol/make "emboss"
		_encipher:                  symbol/make "encipher"
		_enhance:                   symbol/make "enhance"
		_equalize:                  symbol/make "equalize"
		_evaluate:                  symbol/make "evaluate"
		_extent:                    symbol/make "extent"
		_filter:                    symbol/make "filter"
		_flip:                      symbol/make "flip"
		_floodfill-paint:           symbol/make "floodfill-paint"
		_flop:                      symbol/make "flop"
		_forward-fourier-transform: symbol/make "forward-fourier-transform"
		_frame:                     symbol/make "frame"
		_gamma:                     symbol/make "gamma"
		_gaussian-blur:             symbol/make "gaussian-blur"
		_hald-clut:                 symbol/make "hald-clut"
		_has-next:                  symbol/make "has-next"
		_has-previous:              symbol/make "has-previous"
		_implode:                   symbol/make "implode"
		_label:                     symbol/make "label"
		_level:                     symbol/make "level"
		_linear-stretch:            symbol/make "linear-stretch"
		_liquid-rescale:            symbol/make "liquid-rescale"
		_magnify:                   symbol/make "magnify"
		_minify:                    symbol/make "minify"
		_modulate:                  symbol/make "modulate"
		_morphology:                symbol/make "morphology"
		_motion-blur:               symbol/make "motion-blur"
		_negate:                    symbol/make "negate"
		_new:                       symbol/make "new"
		_next:                      symbol/make "next"
		_normalize:                 symbol/make "normalize"
		_oil-paint:                 symbol/make "oil-paint"
		_opaque-paint:              symbol/make "opaque-paint"
		_ping:                      symbol/make "ping"
		_polaroid:                  symbol/make "polaroid"
		_posterize:                 symbol/make "posterize"
		_previous:                  symbol/make "previous"
		_quantize:                  symbol/make "quantize"
		_radial-blur:               symbol/make "radial-blur"
		_raise:                     symbol/make "raise"
		_random-threshold:          symbol/make "random-threshold"
		_read:                      symbol/make "read"
		_remap:                     symbol/make "remap"
		_remove:                    symbol/make "remove"
		_resample:                  symbol/make "resample"
		_resize:                    symbol/make "resize"
		_roll:                      symbol/make "roll"
		_rotate:                    symbol/make "rotate"
		_sample:                    symbol/make "sample"
		_scale:                     symbol/make "scale"
		_segment:                   symbol/make "segment"
		_selective-blur:            symbol/make "selective-blur"
		_sepia-tone:                symbol/make "sepia-tone"
		_set:                       symbol/make "set"
		_shade:                     symbol/make "shade"
		_shadow:                    symbol/make "shadow"
		_sharpen:                   symbol/make "sharpen"
		_shave:                     symbol/make "shave"
		_shear:                     symbol/make "shear"
		_sigmoidal-contrast:        symbol/make "sigmoidal-contrast"
		_sketch:                    symbol/make "sketch"
		_solarize:                  symbol/make "solarize"
		_splice:                    symbol/make "splice"
		_spread:                    symbol/make "spread"
		_statistic:                 symbol/make "statistic"
		_strip:                     symbol/make "strip"
		_swirl:                     symbol/make "swirl"
		_threshold:                 symbol/make "threshold"
		_thumbnail:                 symbol/make "thumbnail"
		_tint:                      symbol/make "tint"
		_transparent-paint:         symbol/make "transparent-paint"
		_transpose:                 symbol/make "transpose"
		_transverse:                symbol/make "transverse"
		_trim:                      symbol/make "trim"
		_unsharp-mask:              symbol/make "unsharp-mask"
		_vignette:                  symbol/make "vignette"
		_wave:                      symbol/make "wave"
		_white-threshold:           symbol/make "white-threshold"
		_write:                     symbol/make "write"
		_rotate:                    symbol/make "rotate"
		_shear:                     symbol/make "shear"
		_roll:                      symbol/make "roll"
		_hue:                       symbol/make "hue"
		_saturation:                symbol/make "saturation"
		_brightness:                symbol/make "brightness"
		_gamma:                     symbol/make "gamma"
		_spiff:                     symbol/make "spiff"
		_dull:                      symbol/make "dull"
		_grayscale:                 symbol/make "grayscale"
		_quantize:                  symbol/make "quantize"
		_despeckle:                 symbol/make "despeckle"
		_reduce-noise:              symbol/make "reduce-noise"
		_add:                       symbol/make "add"
		_sharpen:                   symbol/make "sharpen"
		_blur:                      symbol/make "blur"
		_threshold:                 symbol/make "threshold"
		_edge-detect:               symbol/make "edge-detect"
		_spread:                    symbol/make "spread"
		_solarize:                  symbol/make "solarize"
		_shade:                     symbol/make "shade"
		_raise:                     symbol/make "raise"
		_segment:                   symbol/make "segment"
		_swirl:                     symbol/make "swirl"
		_implode:                   symbol/make "implode"
		_wave:                      symbol/make "wave"
		_oil-paint:                 symbol/make "oil-paint"
		_charcoal:                  symbol/make "charcoal"
		_jpeg:                      symbol/make "jpeg"
		_uniform:                   symbol/make "uniform"
		_gaussian:                  symbol/make "gaussian"
		_multiplicative-gaussian:   symbol/make "multiplicative-gaussian"
		_impulse:                   symbol/make "impulse"
		_laplacian:                 symbol/make "laplacian"
		_poisson:                   symbol/make "poisson"
		_random:                    symbol/make "random"
		_alpha:                     symbol/make "alpha"
		_atop:                      symbol/make "atop"
		_blend:                     symbol/make "blend"
		_bumpmap:                   symbol/make "bumpmap"
		_change-mask:               symbol/make "change-mask"
		_clear:                     symbol/make "clear"
		_color-burn:                symbol/make "color-burn"
		_color-dodge:               symbol/make "color-dodge"
		_colorize:                  symbol/make "colorize"
		_copy-black:                symbol/make "copy-black"
		_copy-blue:                 symbol/make "copy-blue"
		_copy:                      symbol/make "copy"
		_copy-cyan:                 symbol/make "copy-cyan"
		_copy-green:                symbol/make "copy-green"
		_copy-magenta:              symbol/make "copy-magenta"
		_copy-alpha:                symbol/make "copy-alpha"
		_copy-red:                  symbol/make "copy-red"
		_copy-yellow:               symbol/make "copy-yellow"
		_darken:                    symbol/make "darken"
		_darken-intensity:          symbol/make "darken-intensity"
		_difference:                symbol/make "difference"
		_displace:                  symbol/make "displace"
		_dissolve:                  symbol/make "dissolve"
		_distort:                   symbol/make "distort"
		_divide-dst:                symbol/make "divide-dst"
		_divide-src:                symbol/make "divide-src"
		_dst-atop:                  symbol/make "dst-atop"
		_dst:                       symbol/make "dst"
		_dst-in:                    symbol/make "dst-in"
		_dst-out:                   symbol/make "dst-out"
		_dst-over:                  symbol/make "dst-over"
		_exclusion:                 symbol/make "exclusion"
		_hard-light:                symbol/make "hard-light"
		_hard-mix:                  symbol/make "hard-mix"
		_in:                        symbol/make "in"
		_intensity:                 symbol/make "intensity"
		_lighten:                   symbol/make "lighten"
		_lighten-intensity:         symbol/make "lighten-intensity"
		_linear-burn:               symbol/make "linear-burn"
		_linear-dodge:              symbol/make "linear-dodge"
		_linear-light:              symbol/make "linear-light"
		_luminize:                  symbol/make "luminize"
		_mathematics:               symbol/make "mathematics"
		_minus-dst:                 symbol/make "minus-dst"
		_minus-src:                 symbol/make "minus-src"
		_modulate:                  symbol/make "modulate"
		_modulus-add:               symbol/make "modulus-add"
		_modulus-subtract:          symbol/make "modulus-subtract"
		_multiply:                  symbol/make "multiply"
		_no:                        symbol/make "no"
		_out:                       symbol/make "out"
		_over:                      symbol/make "over"
		_overlay:                   symbol/make "overlay"
		_pegtop-light:              symbol/make "pegtop-light"
		_pin-light:                 symbol/make "pin-light"
		_plus:                      symbol/make "plus"
		_replace:                   symbol/make "replace"
		_saturate:                  symbol/make "saturate"
		_screen:                    symbol/make "screen"
		_soft-light:                symbol/make "soft-light"
		_src-atop:                  symbol/make "src-atop"
		_src:                       symbol/make "src"
		_src-in:                    symbol/make "src-in"
		_src-out:                   symbol/make "src-out"
		_src-over:                  symbol/make "src-over"
		_vivid-light:               symbol/make "vivid-light"
		_xor:                       symbol/make "xor"
		_abs:                       symbol/make "abs"
		_add-modulus:               symbol/make "add-modulus"
		_and:                       symbol/make "and"
		_cosine:                    symbol/make "cosine"
		_divide:                    symbol/make "divide"
		_exponential:               symbol/make "exponential"
		_gaussian-noise:            symbol/make "gaussian-noise"
		_impulse-noise:             symbol/make "impulse-noise"
		_laplacian-noise:           symbol/make "laplacian-noise"
		_left-shift:                symbol/make "left-shift"
		_log:                       symbol/make "log"
		_max:                       symbol/make "max"
		_mean:                      symbol/make "mean"
		_median:                    symbol/make "median"
		_min:                       symbol/make "min"
		_multiplicative-noise:      symbol/make "multiplicative-noise"
		_or:                        symbol/make "or"
		_poisson-noise:             symbol/make "poisson-noise"
		_pow:                       symbol/make "pow"
		_right-shift:               symbol/make "right-shift"
		_root-mean-square:          symbol/make "root-mean-square"
		_set:                       symbol/make "set"
		_sine:                      symbol/make "sine"
		_subtract:                  symbol/make "subtract"
		_sum:                       symbol/make "sum"
		_threshold-black:           symbol/make "threshold-black"
		_threshold-white:           symbol/make "threshold-white"
		_uniform-noise:             symbol/make "uniform-noise"
		_point:                     symbol/make "point"
		_box:                       symbol/make "box"
		_triangle:                  symbol/make "triangle"
		_hermite:                   symbol/make "hermite"
		_hann:                      symbol/make "hann"
		_hamming:                   symbol/make "hamming"
		_blackman:                  symbol/make "blackman"
		_quadratic:                 symbol/make "quadratic"
		_cubic:                     symbol/make "cubic"
		_catrom:                    symbol/make "catrom"
		_mitchell:                  symbol/make "mitchell"
		_jinc:                      symbol/make "jinc"
		_sinc:                      symbol/make "sinc"
		_sinc-fast:                 symbol/make "sinc-fast"
		_kaiser:                    symbol/make "kaiser"
		_welch:                     symbol/make "welch"
		_parzen:                    symbol/make "parzen"
		_bohman:                    symbol/make "bohman"
		_bartlett:                  symbol/make "bartlett"
		_lagrange:                  symbol/make "lagrange"
		_lanczos:                   symbol/make "lanczos"
		_lanczos-sharp:             symbol/make "lanczos-sharp"
		_lanczos-2:                 symbol/make "lanczos-2"
		_lanczos-2-sharp:           symbol/make "lanczos-2-sharp"
		_robidoux:                  symbol/make "robidoux"
		_robidoux-sharp:            symbol/make "robidoux-sharp"
		_spline:                    symbol/make "spline"
		_lanczos-radius:            symbol/make "lanczos-radius"
		_activate:                  symbol/make "activate"
		_associate:                 symbol/make "associate"
		_background:                symbol/make "background"
		_deactivate:                symbol/make "deactivate"
		_discrete:                  symbol/make "discrete"
		_disassociate:              symbol/make "disassociate"
		_extract:                   symbol/make "extract"
		_off:                       symbol/make "off"
		_on:                        symbol/make "on"
		_opaque:                    symbol/make "opaque"
		_remove:                    symbol/make "remove"
		_shape:                     symbol/make "shape"
		_transparent:               symbol/make "transparent"
		_riemersma:                 symbol/make "riemersma"
		_floyd-steinberg:           symbol/make "floyd-steinberg"

		#define ASSERT_MAGICK_WAND(index) [
			if any [index < 0 index >= MAX_MAGIC_WANDS] [
				throw-magick-error cmds cmd false
			]
		]

		#define MAGICK_FETCH_FILE(name) [
			cmd: cmd + 1
			if any [cmd >= tail all [TYPE_OF(cmd) <> TYPE_STRING TYPE_OF(cmd) <> TYPE_FILE]][
				throw-magick-error cmds cmd false
			]
			len: -1
			name: unicode/to-utf8 as red-string! cmd :len
		]
		
		#define MAGICK_FETCH_MWAND_INDEX(index) [
			cmd: cmd + 1
			if any [cmd >= tail TYPE_OF(cmd) <> TYPE_INTEGER][
				throw-magick-error cmds cmd false
			]
			int: as red-integer! cmd
			index: int/value - 1
			ASSERT_MAGICK_WAND(index)
		]

		#define MAGICK_FETCH_PREVIEW_TYPE(type) [
			cmd: cmd + 1
			if any [cmd >= tail all [
				TYPE_OF(cmd) <> TYPE_INTEGER
				TYPE_OF(cmd) <> TYPE_WORD
				TYPE_OF(cmd) <> TYPE_LIT_WORD
			]][
				throw-magick-error cmds cmd false
			]
			either TYPE_OF(cmd) = TYPE_INTEGER [
				int: as red-integer! cmd
				type: int/value
			][
				word: as red-word! cmd
				sym: symbol/resolve word/symbol
				case [
					sym = _rotate       [type: 1]
					sym = _shear        [type: 2]
					sym = _roll         [type: 3]
					sym = _hue          [type: 4]
					sym = _saturation   [type: 5]
					sym = _brightness   [type: 6]
					sym = _gamma        [type: 7]
					sym = _spiff        [type: 8]
					sym = _dull         [type: 9]
					sym = _grayscale    [type: 10]
					sym = _quantize     [type: 11]
					sym = _despeckle    [type: 12]
					sym = _reduce-noise [type: 13]
					sym = _add-noise    [type: 14]
					sym = _sharpen      [type: 15]
					sym = _blur         [type: 16]
					sym = _threshold    [type: 17]
					sym = _edge-detect  [type: 18]
					sym = _spread       [type: 19]
					sym = _solarize     [type: 20]
					sym = _shade        [type: 21]
					sym = _raise        [type: 22]
					sym = _segment      [type: 23]
					sym = _swirl        [type: 24]
					sym = _implode      [type: 25]
					sym = _wave         [type: 26]
					sym = _oil-paint    [type: 27]
					sym = _charcoal     [type: 28]
					sym = _jpeg         [type: 29]
					true [
						throw-magick-error cmds cmd false
					]
				]
			]
		]

		#define MAGICK_FETCH_NOISE_TYPE(type) [
			cmd: cmd + 1
			if any [cmd >= tail all [
				TYPE_OF(cmd) <> TYPE_INTEGER
				TYPE_OF(cmd) <> TYPE_WORD
				TYPE_OF(cmd) <> TYPE_LIT_WORD
			]][
				throw-magick-error cmds cmd false
			]
			either TYPE_OF(cmd) = TYPE_INTEGER [
				int: as red-integer! cmd
				type: int/value
			][
				word: as red-word! cmd
				sym: symbol/resolve word/symbol
				case [
					sym = _uniform      [type: 1]
					sym = _gaussian     [type: 2]
					sym = _multiplicative-gaussian [type: 3]
					sym = _impulse      [type: 4]
					sym = _laplacian    [type: 5]
					sym = _poisson      [type: 6]
					sym = _random       [type: 7]
					true [
						throw-magick-error cmds cmd false
					]
				]
			]
		]

		#define MAGICK_FETCH_COMPOSITE(type) [
			cmd: cmd + 1
			if any [cmd >= tail all [
				TYPE_OF(cmd) <> TYPE_INTEGER
				TYPE_OF(cmd) <> TYPE_WORD
				TYPE_OF(cmd) <> TYPE_LIT_WORD
			]][
				throw-magick-error cmds cmd false
			]
			either TYPE_OF(cmd) = TYPE_INTEGER [
				int: as red-integer! cmd
				type: int/value
			][
				word: as red-word! cmd
				sym: symbol/resolve word/symbol
				case [
					sym = _alpha             [type: 1]
					sym = _atop              [type: 2]
					sym = _blend             [type: 3]
					sym = _blur              [type: 4]
					sym = _bumpmap           [type: 5]
					sym = _change-mask       [type: 6]
					sym = _clear             [type: 7]
					sym = _color-burn        [type: 8]
					sym = _color-dodge       [type: 9]
					sym = _colorize          [type: 10]
					sym = _copy-black        [type: 11]
					sym = _copy-blue         [type: 12]
					sym = _copy              [type: 13]
					sym = _copy-cyan         [type: 14]
					sym = _copy-green        [type: 15]
					sym = _copy-magenta      [type: 16]
					sym = _copy-alpha        [type: 17]
					sym = _copy-red          [type: 18]
					sym = _copy-yellow       [type: 19]
					sym = _darken            [type: 20]
					sym = _darken-intensity  [type: 21]
					sym = _difference        [type: 22]
					sym = _displace          [type: 23]
					sym = _dissolve          [type: 24]
					sym = _distort           [type: 25]
					sym = _divide-dst        [type: 26]
					sym = _divide-src        [type: 27]
					sym = _dst-atop          [type: 28]
					sym = _dst               [type: 29]
					sym = _dst-in            [type: 30]
					sym = _dst-out           [type: 31]
					sym = _dst-over          [type: 32]
					sym = _exclusion         [type: 33]
					sym = _hard-light        [type: 34]
					sym = _hard-mix          [type: 35]
					sym = _hue               [type: 36]
					sym = _in                [type: 37]
					sym = _intensity         [type: 38]
					sym = _lighten           [type: 39]
					sym = _lighten-intensity [type: 40]
					sym = _linear-burn       [type: 41]
					sym = _linear-dodge      [type: 42]
					sym = _linear-light      [type: 43]
					sym = _luminize          [type: 44]
					sym = _mathematics       [type: 45]
					sym = _minus-dst         [type: 46]
					sym = _minus-src         [type: 47]
					sym = _modulate          [type: 48]
					sym = _modulus-add       [type: 49]
					sym = _modulus-subtract  [type: 50]
					sym = _multiply          [type: 51]
					sym = _no                [type: 52]
					sym = _out               [type: 53]
					sym = _over              [type: 54]
					sym = _overlay           [type: 55]
					sym = _pegtop-light      [type: 56]
					sym = _pin-light         [type: 57]
					sym = _plus              [type: 58]
					sym = _replace           [type: 59]
					sym = _saturate          [type: 60]
					sym = _screen            [type: 61]
					sym = _soft-light        [type: 62]
					sym = _src-atop          [type: 63]
					sym = _src               [type: 64]
					sym = _src-in            [type: 65]
					sym = _src-out           [type: 66]
					sym = _src-over          [type: 67]
					sym = _threshold         [type: 68]
					sym = _vivid-light       [type: 69]
					sym = _xor               [type: 70]
					true [
						throw-magick-error cmds cmd false
					]
				]
			]
		]

		#define MAGICK_FETCH_EVALUATE_OPERATOR(type) [
			cmd: cmd + 1
			if any [cmd >= tail all [
				TYPE_OF(cmd) <> TYPE_INTEGER
				TYPE_OF(cmd) <> TYPE_WORD
				TYPE_OF(cmd) <> TYPE_LIT_WORD
			]][
				throw-magick-error cmds cmd false
			]
			either TYPE_OF(cmd) = TYPE_INTEGER [
				int: as red-integer! cmd
				type: int/value
			][
				word: as red-word! cmd
				sym: symbol/resolve word/symbol
				case [
					sym = _abs                  [type: 1]
					sym = _add                  [type: 2]
					sym = _add-modulus          [type: 3]
					sym = _and                  [type: 4]
					sym = _cosine               [type: 5]
					sym = _divide               [type: 6]
					sym = _exponential          [type: 7]
					sym = _gaussian-noise       [type: 8]
					sym = _impulse-noise        [type: 9]
					sym = _laplacian-noise      [type: 10]
					sym = _left-shift           [type: 11]
					sym = _log                  [type: 12]
					sym = _max                  [type: 13]
					sym = _mean                 [type: 14]
					sym = _median               [type: 15]
					sym = _min                  [type: 16]
					sym = _multiplicative-noise [type: 17]
					sym = _multiply             [type: 18]
					sym = _or                   [type: 19]
					sym = _poisson-noise        [type: 20]
					sym = _pow                  [type: 21]
					sym = _right-shift          [type: 22]
					sym = _root-mean-square     [type: 23]
					sym = _set                  [type: 24]
					sym = _sine                 [type: 25]
					sym = _subtract             [type: 26]
					sym = _sum                  [type: 27]
					sym = _threshold-black      [type: 28]
					sym = _threshold            [type: 29]
					sym = _threshold-white      [type: 30]
					sym = _uniform-noise        [type: 31]
					sym = _xor                  [type: 32]
					true [
						throw-magick-error cmds cmd false
					]
				]
			]
		]

		#define MAGICK_FETCH_FILTER(type) [
			cmd: cmd + 1
			if any [cmd >= tail all [
				TYPE_OF(cmd) <> TYPE_INTEGER
				TYPE_OF(cmd) <> TYPE_WORD
				TYPE_OF(cmd) <> TYPE_LIT_WORD
			]][
				throw-magick-error cmds cmd false
			]
			either TYPE_OF(cmd) = TYPE_INTEGER [
				int: as red-integer! cmd
				type: int/value
			][
				word: as red-word! cmd
				sym: symbol/resolve word/symbol
				case [
					sym = _point           [type: 1]
					sym = _box             [type: 2]
					sym = _triangle        [type: 3]
					sym = _hermite         [type: 4]
					sym = _hann            [type: 5]
					sym = _hamming         [type: 6]
					sym = _blackman        [type: 7]
					sym = _gaussian        [type: 8]
					sym = _quadratic       [type: 9]
					sym = _cubic           [type: 10]
					sym = _catrom          [type: 11]
					sym = _mitchell        [type: 12]
					sym = _jinc            [type: 13]
					sym = _sinc            [type: 14]
					sym = _sinc-fast       [type: 15]
					sym = _kaiser          [type: 16]
					sym = _welch           [type: 17]
					sym = _parzen          [type: 18]
					sym = _bohman          [type: 19]
					sym = _bartlett        [type: 20]
					sym = _lagrange        [type: 21]
					sym = _lanczos         [type: 22]
					sym = _lanczos-sharp   [type: 23]
					sym = _lanczos-2       [type: 24]
					sym = _lanczos-2-sharp [type: 25]
					sym = _robidoux        [type: 26]
					sym = _robidoux-sharp  [type: 27]
					sym = _cosine          [type: 28]
					sym = _spline          [type: 29]
					sym = _lanczos-radius  [type: 30]
					true [
						throw-magick-error cmds cmd false
					]
				]
			]
		]

		#define MAGICK_FETCH_ALPHA_CHANNEL_TYPE(type) [
			cmd: cmd + 1
			if any [cmd >= tail all [
				TYPE_OF(cmd) <> TYPE_INTEGER
				TYPE_OF(cmd) <> TYPE_WORD
				TYPE_OF(cmd) <> TYPE_LIT_WORD
			]][
				throw-magick-error cmds cmd false
			]
			either TYPE_OF(cmd) = TYPE_INTEGER [
				int: as red-integer! cmd
				type: int/value
			][
				word: as red-word! cmd
				sym: symbol/resolve word/symbol
				case [
					sym = _activate     [type: 1]
					sym = _associate    [type: 2]
					sym = _background   [type: 3]
					sym = _copy         [type: 4]
					sym = _deactivate   [type: 5]
					sym = _discrete     [type: 6]
					sym = _disassociate [type: 7]
					sym = _extract      [type: 8]
					sym = _off          [type: 9]
					sym = _on           [type: 10]
					sym = _opaque       [type: 11]
					sym = _remove       [type: 12]
					sym = _set          [type: 13]
					sym = _shape        [type: 14]
					sym = _transparent  [type: 15]
					true [
						throw-magick-error cmds cmd false
					]
				]
			]
		]

		#define MAGICK_FETCH_DITHER_METHOD(type) [
			cmd: cmd + 1
			if any [cmd >= tail all [
				TYPE_OF(cmd) <> TYPE_INTEGER
				TYPE_OF(cmd) <> TYPE_WORD
				TYPE_OF(cmd) <> TYPE_LIT_WORD
			]][
				throw-magick-error cmds cmd false
			]
			either TYPE_OF(cmd) = TYPE_INTEGER [
				int: as red-integer! cmd
				type: int/value
			][
				word: as red-word! cmd
				sym: symbol/resolve word/symbol
				case [
					sym = _no              [type: 1]
					sym = _riemersma       [type: 2]
					sym = _floyd-steinberg [type: 3]
					true [
						throw-magick-error cmds cmd false
					]
				]
			]
		]

		#define MAGICK_FETCH_PIXELWAND(pw) [
			cmd: cmd + 1
			if any [cmd >= tail TYPE_OF(cmd) <> TYPE_TUPLE][
				throw-magick-error cmds cmd false
			]
			pw: NewPixelWand
			color: as red-tuple! cmd
			len: TUPLE_SIZE?(color)
			bytes: (as byte-ptr! color) + 4
			PixelSetRed   pw byte-to-float bytes/1
			PixelSetGreen pw byte-to-float bytes/2
			PixelSetBlue  pw byte-to-float bytes/3
			if len >= 4 [PixelSetAlpha pw byte-to-float bytes/4]
		]
		#define MAGICK_FETCH_OPT_PIXELWAND(pw) [
			pos: cmd + 1
			pw: NewPixelWand
			either all [pos < tail TYPE_OF(pos) = TYPE_TUPLE][
				cmd: pos
				color: as red-tuple! cmd
				len: TUPLE_SIZE?(color)
				bytes: (as byte-ptr! color) + 4
				PixelSetRed   pw byte-to-float bytes/1
				PixelSetGreen pw byte-to-float bytes/2
				PixelSetBlue  pw byte-to-float bytes/3
				if len >= 4 [PixelSetAlpha pw byte-to-float bytes/4]
			][
				PixelSetColor pw "transparent"
			]
		]
		
		#define MAGICK_FETCH_VALUE(type) [
			cmd: cmd + 1
			if any [cmd >= tail TYPE_OF(cmd) <> type][
				throw-magick-error cmds cmd false
			]
		]
		
		#define MAGICK_FETCH_VALUE_2(type1 type2) [
			cmd: cmd + 1
			if any [cmd >= tail all [TYPE_OF(cmd) <> type1 TYPE_OF(cmd) <> type2]][
				throw-magick-error cmds cmd false
			]
		]
		
		#define MAGICK_FETCH_OPT_VALUE(type) [
			pos: cmd + 1
			if all [pos < tail TYPE_OF(pos) = type][cmd: pos]
		]
		
		#define MAGICK_FETCH_NAMED_VALUE(type) [
			cmd: cmd + 1
			if cmd >= tail [throw-magick-error cmds cmd false]
			value: either TYPE_OF(cmd) = TYPE_WORD [_context/get as red-word! cmd][cmd]
			if TYPE_OF(value) <> type [throw-magick-error cmds cmd false]
		]

		#define AS_FLOAT(value index) [
			get-float as red-integer! value + index
		]

		#define AS_INT(value index) [
			get-int as red-integer! value + index
		]

		#define AS_STRING(value index) [
			get-string as red-string! value + index
		]

		#define AS_BOOLEAN(value) [
			get-boolean as red-logic! value
		]

		destroy-wands: func[
			/local
				wands  [int-ptr!]
				tail   [int-ptr!]
				wand   [MagickWand!]
		][
			wands: MagickWands-table
			tail: wands + MAX_MAGIC_WANDS
			while [wands < tail][
				wand: as MagickWand! wands/0
				if 0 <> as integer! wand [
					ClearMagickWand wand
					DestroyMagickWand wand
					wands/0: 0
					TRACE(["<-- Destroed wand: " wand lf])
				]
				wands: wands + 1
			]
		]

		do: func[
			cmds [red-block!]
			return: [red-value!]
			/local
				cmd       [red-value!]
				tail      [red-value!]
				start     [red-value!]
				pos		  [red-value!]
				value	  [red-value!]
				word      [red-word!]
				sym       [integer!]
				symb      [red-symbol!]
				str       [red-string!]
				len       [integer!]
				name      [c-string!]
				result    [MagickBooleanType!]
				bool      [red-logic!]
				float1    [float!]
				float2    [float!]
				*wand2    [MagickWand!]
				int       [red-integer!]
				index     [integer!]
				size      [red-pair!]
				position  [red-pair!]
				img       [red-image!]
				type      [integer!]
				exception [ExceptionType!]
				width     [integer!]
				height    [integer!]
				bytes     [byte-ptr!]
				pixels    [int-ptr!]
				bitmap    [integer!]
				bitmapData [BitmapData!]
				bin       [red-binary!]
				s         [series!]
				pw        [PixelWand!]
				color     [red-tuple!]
				i         [integer!]
				f         [float!]
		][
			cmd:  block/rs-head cmds
			tail: block/rs-tail cmds
			len: -1

			;Always using wand from index 0 at commands start
			*wand-index: 0
			*wand: as MagickWand! MagickWands-table/*wand-index

			if MagickTrue <> IsMagickWand *wand [
				*wand: NewMagickWand
				MagickWands-table/*wand-index: as integer! *wand
			]

			while [cmd < tail][
				case [
					any [ TYPE_OF(cmd) = TYPE_WORD TYPE_OF(cmd) = TYPE_LIT_WORD ][
						start: cmd + 1
						word: as red-word! cmd
						sym: symbol/resolve word/symbol
						symb: symbol/get sym
						TRACE(["--> " *wand " " *wand-index " " symb/cache lf])
						case [
							sym = _Use [
							;== Picks working MagickWand from the specified index (creates a new one if not exists yet)
								MAGICK_FETCH_MWAND_INDEX(index)
								*wand: as MagickWand! MagickWands-table/index
								*wand-index: index
								if MagickTrue <> IsMagickWand *wand [
									*wand: NewMagickWand
									;print ["new wand: " *wand-index " " *wand lf]
									MagickWands-table/index: as integer! *wand
								]
								TRACE(["<-- Use wand: " index " " *wand lf])
								result: MagickTrue
							]
							sym = _Clear [
							;== Clears resources associated with current wand
								ClearMagickWand *wand
								result: MagickTrue
							]
							sym = _Destroy [
							;== Deallocates memory associated with an MagickWand
								MAGICK_FETCH_OPT_VALUE(TYPE_INTEGER) ;-- optional index of the wand to destroy
								index: either pos = cmd [int: as red-integer! cmd int/value - 1][*wand-index]
								ASSERT_MAGICK_WAND(index)
								*wand2: as MagickWand! MagickWands-table/index
								if MagickTrue <> IsMagickWand *wand [
									DestroyMagickWand *wand2
									TRACE(["<-- Destroyed wand: " index " " *wand2 lf])
								]
								MagickWands-table/index: either *wand-index = index [
									;recreate a new wand if current was destroyed!
									*wand: NewMagickWand
									as integer! *wand
								][	0 ]
								result: MagickTrue
							]
							sym = _Clone [
							;== Makes an exact copy of current wand to specified index
								MAGICK_FETCH_MWAND_INDEX(index)
								; if there is already a wand on index, deallocate its memory
								*wand2: as MagickWand! MagickWands-table/index
								if MagickTrue = IsMagickWand *wand2 [
									DestroyMagickWand *wand2
								]
								; and clone a new wand at the index
								MagickWands-table/index: as integer! CloneMagickWand *wand
								TRACE(["<-- Cloned wand: " index " " as MagickWand! MagickWands-table/index lf])
								result: MagickTrue
							]
							sym = _New [
							;== Adds a blank image canvas of the specified size and background color to the wand
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- width and height of the local neighborhood.
								size: as red-pair! start
								MAGICK_FETCH_OPT_PIXELWAND(pw)
								result: MagickNewImage *wand size/x size/y pw
								if all [result = MagickTrue len >= 4] [
									result: MagickSetImageOpacity *wand 1.0 - byte-to-float bytes/4
								]
								DestroyPixelWand pw
							]
							sym = _Read [
								MAGICK_FETCH_OPT_VALUE(TYPE_INTEGER) ;-- optional index of the target wand
								*wand2: either pos = cmd [
									int: as red-integer! cmd
									index: int/value - 1
									ASSERT_MAGICK_WAND(index)
									if 0 = MagickWands-table/index [
										MagickWands-table/index: as integer! NewMagickWand
										TRACE(["<-- NEW WAND " index lf])
									]
									as MagickWand! MagickWands-table/index
								][ *wand ]
								MAGICK_FETCH_FILE(name)
								TRACE(["<-- READ " name " to " *wand2 lf])
								result: MagickReadImage *wand2 name
							]
							sym = _Write [
								MAGICK_FETCH_OPT_VALUE(TYPE_INTEGER) ;-- optional index of the source wand
								*wand2: either pos = cmd [
									int: as red-integer! cmd
									index: int/value - 1
									ASSERT_MAGICK_WAND(index)
									as MagickWand! MagickWands-table/index
								][ *wand ]
								MAGICK_FETCH_FILE(name)
								TRACE(["<-- WRITE " name " to " *wand2 lf])
								result: MagickWriteImage *wand2 name
							]
							sym = _Write-Images [
								MAGICK_FETCH_OPT_VALUE(TYPE_INTEGER) ;-- optional index of the source wand
								*wand2: either pos = cmd [
									int: as red-integer! cmd
									index: int/value - 1
									ASSERT_MAGICK_WAND(index)
									as MagickWand! MagickWands-table/index
								][ *wand ]
								MAGICK_FETCH_FILE(name)
								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- if true, join images into a single multi-image file.
								TRACE(["<-- WRITE-IMAGES " name " to " *wand2 " join: " AS_BOOLEAN(value) lf])
								result: MagickWriteImages *wand2 name AS_BOOLEAN(value)
							]

							sym = _Preview [
							;== Tiles 9 thumbnails of the specified image with an image processing operation applied at varying strengths
								MAGICK_FETCH_PREVIEW_TYPE(type) ;-- the preview type.
								MAGICK_FETCH_MWAND_INDEX(index) ;-- index in magic wand table, where will be stored result 
								MagickWands-table/index: as integer! MagickPreviewImages *wand type
								result: MagickTrue
							]

							sym = _Restart [
							;== Releases all used wands and restarts the MagickWand environment
								destroy-wands
								MagickWandTerminus
								MagickWandGenesis
								*wand-index: 0
								*wand: NewMagickWand
								MagickWands-table/*wand-index: as integer! *wand
								result: MagickTrue
							]
							sym = _Index [
								MAGICK_FETCH_VALUE(TYPE_INTEGER)
								int: as red-integer! cmd
								index: int/value
								result: MagickSetIteratorIndex *wand index
								result: MagickTrue
							]
							sym = _Head [
								MagickSetFirstIterator *wand
								result: MagickTrue
							]
							sym = _Tail [
								MagickSetLastIterator *wand
								result: MagickTrue
							]
							sym = _Get-Index [
								int: as red-integer! stack/arguments
								int/header: TYPE_INTEGER
								int/value: MagickGetIteratorIndex *wand
								return as red-value! int
							]
							sym = _Get-Size [
								size: as red-pair! stack/arguments
								size/header: TYPE_PAIR
								size/x: MagickGetImageWidth *wand
								size/y: MagickGetImageHeight *wand
								return as red-value! size
							]
							sym = _Get-Image [
								width: MagickGetImageWidth *wand
								height: MagickGetImageHeight *wand
								img: as red-image! stack/arguments
								img/header: TYPE_IMAGE
								img/size: height << 16 or width
								
								bitmap: 0
								if 0 <> OS-image/GdipCreateBitmapFromScan0 width height 0 PixelFormat32bppARGB null :bitmap [
									throw-magick-error cmds cmd false 
								]
								bitmapData: as BitmapData! OS-image/lock-bitmap-fmt bitmap PixelFormat32bppARGB yes
								bytes: bitmapData/scan0
								result: MagickExportImagePixels *wand 0 0 width height "BGRA" CharPixel bytes
								pixels: as int-ptr! bytes
								OS-image/unlock-bitmap-fmt bitmap as-integer bitmapData
								img/node: as node! bitmap
								return as red-value! img
							]
							sym = _Get-Binary [
								MAGICK_FETCH_OPT_VALUE(TYPE_STRING) ;-- This string reflects the expected ordering of the pixel array.
																    ;-- It can be any combination or order of R = red, G = green, B = blue, A = alpha (0 is transparent),
																    ;-- O = opacity (0 is opaque), C = cyan, Y = yellow, M = magenta, K = black,
																    ;-- I = intensity (for grayscale), P = pad.
								name: either pos = cmd [AS_STRING(start 0)][ "BGRA" ]   ;-- default pixel array map type is BGRA
								width: MagickGetImageWidth *wand
								height: MagickGetImageHeight *wand
								len: width * height * length? name
								bin: binary/make-at stack/arguments len
								s: GET_BUFFER(bin)
								bytes: as byte-ptr! s/offset
								result: MagickExportImagePixels *wand 0 0 width height name CharPixel bytes
								s/tail: as cell! (as byte-ptr! s/tail) + len 
								return as red-value! bin
							]
							sym = _Get-Info [
							;== Identifies an image by printing its attributes to the file
								name: MagickIdentifyImage *wand
								str: as red-string! stack/arguments
								str/header:	TYPE_STRING							;-- implicit reset of all header flags
								str/head:	0
								str/cache:	null
								str/node: unicode/load-utf8 name length? name
								MagickRelinquishMemory name
								return as red-value! str
							]

							sym = _alpha [
							;== Activates deactivates resets or sets the alpha channel
								MAGICK_FETCH_ALPHA_CHANNEL_TYPE(type) ;-- the alpha channel type
								result: MagickSetImageAlphaChannel *wand type
							]



							sym = _adaptive-blur [
							;== Adaptively blurs the image by blurring less intensely near image edges and more intensely far from edges
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the Gaussian, in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the Gaussian, in pixels.
								result: MagickAdaptiveBlurImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _adaptive-resize [
							;== Adaptively resize image with data dependent triangulation
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- size of the scaled image.
								size: as red-pair! start
								result: MagickAdaptiveResizeImage *wand size/x size/y
							]
							sym = _adaptive-sharpen [
							;== Adaptively sharpens the image by sharpening more intensely near image edges and less intensely far from edges
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the Gaussian, in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the Gaussian, in pixels.
								result: MagickAdaptiveSharpenImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _adaptive-threshold [
							;== Selects an individual threshold for each pixel based on the range of intensity values in its local neighborhood
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- width and height of the local neighborhood.
								size: as red-pair! start
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the mean offset.
								result: MagickAdaptiveThresholdImage *wand size/x size/y AS_INT(start 1)
							]
							sym = _add [
							;== Adds the specified images at the current image location
								MAGICK_FETCH_MWAND_INDEX(index) ;-- A wand that contains images to add at the current image location.
								result: MagickAddImage *wand as MagickWand! MagickWands-table/index
							]
							sym = _add-noise [
							;== Adds random noise to the image
								MAGICK_FETCH_NOISE_TYPE(type) ;-- The type of noise: Uniform, Gaussian, Multiplicative, Impulse, Laplacian, or Poisson.
								result: MagickAddNoiseImage *wand type
							]
;							sym = _affine-transform [
;							;== Transforms an image as dictated by the affine matrix of the drawing wand
;								MAGICK_FETCH_DRAWINGWAND!() ;-- the draw wand.
;								result: MagickAffineTransformImage *wand AS_DRAWINGWAND!(start 0)
;							]
;							sym = _annotate [
;							;== Annotates an image with text
;								MAGICK_FETCH_DRAWINGWAND!() ;-- the draw wand.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- x ordinate to left of text
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- y ordinate to text baseline
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- rotate text relative to this angle.
;								MAGICK_FETCH_C-STRING!() ;-- text to draw
;								result: MagickAnnotateImage *wand AS_DRAWINGWAND!(start 0) ARG_TO_FLOAT(start 1) ARG_TO_FLOAT(start 2) ARG_TO_FLOAT(start 3) AS_C-STRING!(start 4)
;							]
							sym = _auto-gamma [
							;== Extracts the 'mean' from the image and adjust the image to try make set its gamma appropriatally
								result: MagickAutoGammaImage *wand
							]
							sym = _auto-level [
							;== Adjusts the levels of a particular image channel by scaling the minimum and maximum values to the full quantum range
								result: MagickAutoLevelImage *wand
							]
							sym = _black-threshold [
							;== Is like MagickThresholdImage() but  forces all pixels below the threshold into black while leaving all pixels above the threshold unchanged
								MAGICK_FETCH_PIXELWAND(pw)                    ;-- threshold
								result: MagickWhiteThresholdImage *wand pw
								DestroyPixelWand pw
							]
							sym = _blue-shift [
							;== Mutes the colors of the image to simulate a scene at nighttime in the moonlight
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the blue shift factor (default 1.5)
								result: MagickBlueShiftImage *wand AS_FLOAT(start 0)
							]
							sym = _blur [
							;== Blurs an image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the , in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the , in pixels.
								result: MagickBlurImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
;							sym = _border [
;							;== Surrounds the image with a border of the color defined by the bordercolor pixel wand
;								MAGICK_FETCH_PIXELWAND!() ;-- the border color pixel wand.
;								MAGICK_FETCH_SIZE_T!() ;-- the border width.
;								MAGICK_FETCH_SIZE_T!() ;-- the border height.
;								result: MagickBorderImage *wand AS_PIXELWAND!(start 0) AS_INT(start 1) AS_INT(start 2)
;							]
							sym = _brightness-contrast [
							;== To change the brightness and/or contrast of an image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the brightness percent (-100 .. 100).
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the contrast percent (-100 .. 100).
								result: MagickBrightnessContrastImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _charcoal [
							;== Simulates a charcoal drawing
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the Gaussian, in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the Gaussian, in pixels.
								result: MagickCharcoalImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _chop [ ;@@ use pairs instead?
							;== Removes a region of an image and collapses the image to occupy the removed portion
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region width.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region height.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region x offset.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region y offset.
								result: MagickChopImage *wand AS_INT(start 0) AS_INT(start 1) AS_INT(start 2) AS_INT(start 3)
							]
							sym = _clamp [
							;== Restricts the color range from 0 to the quantum depth
								result: MagickClampImage *wand
							]
							sym = _clip [
							;== Clips along the first path from the 8BIM profile, if present
								result: MagickClipImage *wand
							]
							sym = _clut [
							;== Replaces colors in the image from a color lookup table
								MAGICK_FETCH_MWAND_INDEX(index) ;-- clut_wand
								result: MagickClutImage *wand as MagickWand! MagickWands-table/index
							]
							sym = _color-decision-list [
							;== Accepts a lightweight Color Correction Collection (CCC) file which solely contains one or more color corrections and applies the color correction to the image
								MAGICK_FETCH_VALUE(TYPE_STRING) ;-- the color correction collection in XML.
								result: MagickColorDecisionListImage *wand AS_STRING(start 0)
							]
;							sym = _colorize [
;							;== Blends the fill color with each pixel in the image
;								MAGICK_FETCH_PIXELWAND!() ;-- the colorize pixel wand.
;								MAGICK_FETCH_PIXELWAND!() ;-- the opacity pixel wand.
;								result: MagickColorizeImage *wand AS_PIXELWAND!(start 0) AS_PIXELWAND!(start 1)
;							]
;							sym = _color-matrix [
;							;== Apply color transformation to an image
;								MAGICK_FETCH_KERNELINFO!() ;-- the color matrix.
;								result: MagickColorMatrixImage *wand AS_KERNELINFO!(start 0)
;							]
							sym = _combine [
							;== Combines one or more images into a single image
								MAGICK_FETCH_OPT_VALUE(TYPE_INTEGER) ;-- optional index of the destination wand
								index: either pos = cmd [
									int: as red-integer! cmd
									int/value - 1
								][ *wand-index ] ;by default it will rewrite the current wand
								*wand2: MagickCombineImages *wand 47 ;@@ TODO: add possibility to choose channel type, 295 is default value!
								either 0 = as integer! *wand2 [
									print ["iMagick: 'combine' failed!" lf] ;@@ throw real error instead?
								][
									; if there was already a wand on index, deallocate its memory
									*wand: as MagickWand! MagickWands-table/index
									if all [
										0 <> as integer! *wand
										MagickTrue = IsMagickWand *wand
									] [ DestroyMagickWand *wand ]
									MagickWands-table/index: as integer! *wand2 ; and store new wand there
									*wand: *wand2
								]
								result: MagickTrue
							]
							sym = _comment [
							;== Adds a comment to your image
								MAGICK_FETCH_VALUE(TYPE_STRING) ;-- the image comment.
								result: MagickCommentImage *wand AS_STRING(start 0)
							]
							sym = _composite [
							;== Composite one image onto another at the specified offset
								MAGICK_FETCH_MWAND_INDEX(index) ;-- composite_wand
								MAGICK_FETCH_COMPOSITE(type)    ;-- This operator affects how the composite is applied to the image.  The default is Over.
								MAGICK_FETCH_VALUE(TYPE_PAIR)   ;-- the offset of the composited image.
								position: as red-pair! cmd
								result: MagickCompositeImage *wand as MagickWand! MagickWands-table/index type MagickTrue position/x position/y
							]
							sym = _contrast [
							;== Enhances the intensity differences between the lighter and darker elements of the image
								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- Increase or decrease image contrast.
								result: MagickContrastImage *wand AS_BOOLEAN(value)
							]
							sym = _contrast-stretch [
							;== Enhances the contrast of a color image by adjusting the pixels color to span the entire range of colors available
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the black point.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the white point.
								result: MagickContrastStretchImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _crop [ ;@@ use pairs instead?
							;== Extracts a region of the image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region width.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region height.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region x-offset.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region y-offset.
								result: MagickCropImage *wand AS_INT(start 0) AS_INT(start 1) AS_INT(start 2) AS_INT(start 3)
							]
							sym = _cycle-colormap [
							;== Displaces an image's colormap by a given number of positions
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- displace
								result: MagickCycleColormapImage *wand AS_INT(start 0)
							]
							sym = _decipher [
							;== Converts cipher pixels to plain pixels
								MAGICK_FETCH_VALUE(TYPE_STRING) ;-- the passphrase.
								result: MagickDecipherImage *wand AS_STRING(start 0)
							]
							sym = _deskew [
							;== Removes skew from the image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- separate background from foreground.
								result: MagickDeskewImage *wand AS_FLOAT(start 0)
							]
							sym = _despeckle [
							;== Reduces the speckle noise in an image while perserving the edges of the original image
								result: MagickDespeckleImage *wand
							]
							sym = _display [
							;== Displays an image
								MAGICK_FETCH_VALUE(TYPE_STRING) ;-- the X server name.
								result: MagickDisplayImage *wand AS_STRING(start 0)
							]
;							sym = _draw [
;							;== Renders the drawing wand on the current image
;								MAGICK_FETCH_DRAWINGWAND!() ;-- the draw wand.
;								result: MagickDrawImage *wand AS_DRAWINGWAND!(start 0)
;							]
							sym = _edge [
							;== Enhance edges within the image with a convolution filter of the given radius
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the pixel neighborhood.
								result: MagickEdgeImage *wand AS_FLOAT(start 0)
							]
							sym = _emboss [
							;== Returns a grayscale image with a three-dimensional effect
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the Gaussian, in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the Gaussian, in pixels.
								result: MagickEmbossImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _encipher [
							;== Converts plaint pixels to cipher pixels
								MAGICK_FETCH_VALUE(TYPE_STRING) ;-- the passphrase.
								result: MagickEncipherImage *wand AS_STRING(start 0)
							]
							sym = _enhance [
							;== Applies a digital filter that improves the quality of a noisy image
								result: MagickEnhanceImage *wand
							]
							sym = _equalize [
							;== Equalizes the image histogram
								result: MagickEqualizeImage *wand
							]
							sym = _evaluate [
							;== Applys an arithmetic, relational, or logical expression to an image
								MAGICK_FETCH_EVALUATE_OPERATOR(type) ;-- operator
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- A value value.
								result: MagickEvaluateImage *wand type AS_FLOAT(start 1)
							]
							sym = _extent [ ;@@ use pairs instead?
							;== Extends the image as defined by the geometry, gravity, and wand background color
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region width.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region height.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region x offset.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region y offset.
								result: MagickExtentImage *wand AS_INT(start 0) AS_INT(start 1) AS_INT(start 2) AS_INT(start 3)
							]
;							sym = _filter [
;							;== Applies a custom convolution kernel to the image
;								MAGICK_FETCH_KERNELINFO!() ;-- An array of doubles representing the convolution kernel.
;								result: MagickFilterImage *wand AS_KERNELINFO!(start 0)
;							]
							sym = _flip [
							;== Creates a vertical mirror image by reflecting the pixels around the central x-axis
								result: MagickFlipImage *wand
							]
;							sym = _floodfill-paint [
;							;== Changes the color value of any pixel that matches target and is an immediate neighbor
;								MAGICK_FETCH_CHANNELTYPE!() ;-- the channel(s).
;								MAGICK_FETCH_PIXELWAND!() ;-- the floodfill color pixel wand.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- By default target must match a particular pixel color exactly.  However, in many cases two colors may differ by a small amount. The fuzz member of image defines how much tolerance is acceptable to consider two colors as the same.  For example, set fuzz to 10 and the color red at intensities of 100 and 102 respectively are now interpreted as the same color for the purposes of the floodfill.
;								MAGICK_FETCH_PIXELWAND!() ;-- the border color pixel wand.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the starting location of the operation.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- y
;								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- paint any pixel that does not match the target color.
;								result: MagickFloodfillPaintImage *wand AS_CHANNELTYPE!(start 0) AS_PIXELWAND!(start 1) AS_FLOAT(start 2) AS_PIXELWAND!(start 3) AS_INT(start 4) AS_INT(start 5) AS_MAGICKBOOLEANTYPE!(start 6)
;							]
							sym = _flop [
							;== Creates a horizontal mirror image by reflecting the pixels around the central y-axis
								result: MagickFlopImage *wand
							]
							sym = _forward-fourier-transform [
							;== Implements the discrete Fourier transform (DFT) of the image either as a magnitude / phase or real / imaginary image pair
								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- if true, return as magnitude / phase pair otherwise a real / imaginary image pair.
								result: MagickForwardFourierTransformImage *wand AS_BOOLEAN(value)
							]
;							sym = _frame [
;							;== Adds a simulated three-dimensional border around the image
;								MAGICK_FETCH_PIXELWAND!() ;-- the frame color pixel wand.
;								MAGICK_FETCH_SIZE_T!() ;-- the border width.
;								MAGICK_FETCH_SIZE_T!() ;-- the border height.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the inner bevel width.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the outer bevel width.
;								result: MagickFrameImage *wand AS_PIXELWAND!(start 0) AS_INT(start 1) AS_INT(start 2) AS_INT(start 3) AS_INT(start 4)
;							]
							sym = _gamma [
							;== Gamma-corrects an image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- gamma
								result: MagickGammaImage *wand AS_FLOAT(start 0)
							]
							sym = _gaussian-blur [
							;== Blurs an image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the Gaussian, in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the Gaussian, in pixels.
								result: MagickGaussianBlurImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _hald-clut [
							;== Replaces colors in the image from a Hald color lookup table
								MAGICK_FETCH_MWAND_INDEX(index) ;-- hald_wand
								result: MagickHaldClutImage *wand as MagickWand! MagickWands-table/index
							]
							sym = _has-next [
							;== Returns MagickTrue if the wand has more images when traversing the list in the forward direction
								bool: as red-logic! stack/arguments
								bool/header: TYPE_LOGIC
								bool/value: as logic! MagickHasNextImage *wand
								return as red-value! bool
							]
							sym = _has-previous [
							;== Returns MagickTrue if the wand has more images when traversing the list in the reverse direction
								bool: as red-logic! stack/arguments
								bool/header: TYPE_LOGIC
								bool/value: as logic! MagickHasPreviousImage *wand
								return as red-value! bool
							]
							sym = _implode [
							;== Creates a new image that is a copy of an existing one with the image pixels 'implode' by the specified percentage
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- radius
								result: MagickImplodeImage *wand AS_FLOAT(start 0)
							]
							sym = _label [
							;== Adds a label to your image
								MAGICK_FETCH_VALUE(TYPE_STRING) ;-- the image label.
								result: MagickLabelImage *wand AS_STRING(start 0)
							]
							sym = _level [
							;== Adjusts the levels of an image by scaling the colors falling between specified white and black points to the full available quantum range
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the black point.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the gamma.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the white point.
								result: MagickLevelImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1) AS_FLOAT(start 2)
							]
							sym = _linear-stretch [
							;== Stretches with saturation the image intensity
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the black point.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the white point.
								result: MagickLinearStretchImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _liquid-rescale [
							;== Rescales image with seam carving
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- the number of columns and rows in the scaled image.
								size: as red-pair! start
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- maximum seam transversal step (0 means straight seams).
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- introduce a bias for non-straight seams (typically 0).
								result: MagickLiquidRescaleImage *wand size/x size/y AS_FLOAT(start 1) AS_FLOAT(start 2)
							]
							sym = _magnify [
							;== Is a convenience method that scales an image proportionally to twice its original size
								result: MagickMagnifyImage *wand
							]
							sym = _minify [
							;== Is a convenience method that scales an image proportionally to one-half its original size
								result: MagickMinifyImage *wand
							]
							sym = _modulate [
							;== Lets you control the brightness, saturation, and hue of an image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the percent change in brighness.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the percent change in saturation.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the percent change in hue.
								result: MagickModulateImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1) AS_FLOAT(start 2)
							]
;							sym = _morphology [
;							;== Applies a user supplied kernel to the image according to the given mophology method
;								MAGICK_FETCH_MORPHOLOGYMETHOD!() ;-- the morphology method to be applied.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- apply the operation this many times (or no change). A value of -1 means loop until no change found.  How this is applied may depend on the morphology method.  Typically this is a value of 1.
;								MAGICK_FETCH_KERNELINFO!() ;-- An array of doubles representing the morphology kernel.
;								result: MagickMorphologyImage *wand AS_MORPHOLOGYMETHOD!(start 0) AS_INT(start 1) AS_KERNELINFO!(start 2)
;							]
							sym = _motion-blur [
							;== Simulates motion blur
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the Gaussian, in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the Gaussian, in pixels.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Apply the effect along this angle.
								result: MagickMotionBlurImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1) AS_FLOAT(start 2)
							]
							sym = _negate [;@@ the logic arg could be optional
							;== Negates the colors in the reference image
								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- If MagickTrue, only negate grayscale pixels within the image.
								result: MagickNegateImage *wand AS_BOOLEAN(value)
							]
							sym = _next [
							;== Associates the next image in the image list with a magick wand
								result: MagickNextImage *wand
								if result <> MagickTrue [ print ["iMagick: no 'next' image in the list!" lf]]
								result: MagickTrue
							]
							sym = _normalize [
							;== Enhances the contrast of a color image by adjusting the pixels color to span the entire range of colors available
								result: MagickNormalizeImage *wand
							]
							sym = _oil-paint [
							;== Applies a special effect filter that simulates an oil painting
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the circular neighborhood.
								result: MagickOilPaintImage *wand AS_FLOAT(start 0)
							]
;							sym = _opaque-paint [
;							;== Changes any pixel that matches color with the color defined by fill
;								MAGICK_FETCH_PIXELWAND!() ;-- Change this target color to the fill color within the image.
;								MAGICK_FETCH_PIXELWAND!() ;-- the fill pixel wand.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- By default target must match a particular pixel color exactly.  However, in many cases two colors may differ by a small amount. The fuzz member of image defines how much tolerance is acceptable to consider two colors as the same.  For example, set fuzz to 10 and the color red at intensities of 100 and 102 respectively are now interpreted as the same color for the purposes of the floodfill.
;								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- paint any pixel that does not match the target color.
;								result: MagickOpaquePaintImage *wand AS_PIXELWAND!(start 0) AS_PIXELWAND!(start 1) AS_FLOAT(start 2) AS_MAGICKBOOLEANTYPE!(start 3)
;							]
							sym = _ordered-posterize [
							;== Performs an ordered dither based on a number of pre-defined dithering threshold maps, but over multiple intensity levels, which can be different for different channels, according to the input arguments
								MAGICK_FETCH_VALUE(TYPE_STRING) ;-- A string containing the name of the threshold dither map to use, followed by zero or more numbers representing the number of color levels tho dither between.
								result: MagickOrderedPosterizeImage *wand AS_STRING(start 0)
							]
							sym = _ping [
							;== Is like MagickReadImage() except the only valid information returned is the image width, height, size, and format
								MAGICK_FETCH_FILE(name) ;-- the image filename.
								result: MagickPingImage *wand name
							]
;							sym = _polaroid [
;							;== Simulates a Polaroid picture
;								MAGICK_FETCH_DRAWINGWAND!() ;-- the draw wand.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Apply the effect along this angle.
;								result: MagickPolaroidImage *wand AS_DRAWINGWAND!(start 0) AS_FLOAT(start 1)
;							]
							sym = _posterize [
							;== Reduces the image to a limited number of color level
								MAGICK_FETCH_VALUE(TYPE_INTEGER) ;-- Number of color levels allowed in each channel.  Very low values (2, 3, or 4) have the most visible effect.
								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- Set this integer value to something other than zero to dither the mapped image.
								result: MagickPosterizeImage *wand AS_INT(start 0) AS_BOOLEAN(value)
							]
							sym = _previous [
							;== Assocates the previous image in an image list with the magick wand
								result: MagickPreviousImage *wand
								if result <> MagickTrue [ print ["iMagick: no 'previous' image in the list!" lf]]
								result: MagickTrue
							]
;							sym = _quantize [
;							;== Analyzes the colors within a reference image and chooses a fixed number of colors to represent the image
;								MAGICK_FETCH_SIZE_T!() ;-- the number of colors.
;								MAGICK_FETCH_COLORSPACETYPE!() ;-- Perform color reduction in this colorspace, typically RGBColorspace.
;								MAGICK_FETCH_SIZE_T!() ;-- Normally, this integer value is zero or one.  A zero or one tells Quantize to choose a optimal tree depth of Log4(number_colors).      A tree of this depth generally allows the best representation of the reference image with the least amount of memory and the fastest computational speed.  In some cases, such as an image with low color dispersion (a few number of colors), a value other than Log4(number_colors) is required.  To expand the color tree completely, use a value of 8.
;								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- A value other than zero distributes the difference between an original image and the corresponding color reduced image to neighboring pixels along a Hilbert curve.
;								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- A value other than zero measures the difference between the original and quantized images.  This difference is the total quantization error.  The error is computed by summing over all pixels in an image the distance squared in RGB space between each reference pixel value and its quantized value.
;								result: MagickQuantizeImage *wand AS_INT(start 0) AS_COLORSPACETYPE!(start 1) AS_INT(start 2) AS_MAGICKBOOLEANTYPE!(start 3) AS_MAGICKBOOLEANTYPE!(start 4)
;							]
							sym = _radial-blur [
							;== Radial blurs an image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the angle of the blur in degrees.
								result: MagickRadialBlurImage *wand AS_FLOAT(start 0)
							]
							sym = _raise [
							;== Creates a simulated three-dimensional button-like effect by lightening and darkening the edges of the image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Define the dimensions of the area to raise.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- height
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- x
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- y
								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- A value other than zero creates a 3-D raise effect, otherwise it has a lowered effect.
								result: MagickRaiseImage *wand AS_INT(start 0) AS_INT(start 1) AS_INT(start 2) AS_INT(start 3) AS_BOOLEAN(value)
							]
							sym = _random-threshold [
							;== Changes the value of individual pixels based on the intensity of each pixel compared to threshold
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Specify the high and low thresholds.  These values range from 0 to QuantumRange.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- high
								result: MagickRandomThresholdImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _remap [
							;== Replaces the colors of an image with the closest color from a reference image
								MAGICK_FETCH_MWAND_INDEX(index) ;-- remap_wand
								MAGICK_FETCH_DITHER_METHOD(type) ;-- choose from these dither methods: NoDitherMethod, RiemersmaDitherMethod, or FloydSteinbergDitherMethod.
								result: MagickRemapImage *wand as MagickWand! MagickWands-table/index type
							]
							sym = _remove [
							;== Removes an image from the image list
								result: MagickRemoveImage *wand
							]
							sym = _resample [
							;== Resample image to desired resolution
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- the new image resolution.
								size: as red-pair! start
								MAGICK_FETCH_FILTER(type) ;-- Image filter to use.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the blur factor where > 1 is blurry, < 1 is sharp.
								result: MagickResampleImage *wand as float! size/x as float! size/y type AS_FLOAT(start 3)
							]
							sym = _resize [
							;== Scales an image to the desired dimensions with one of these filters:
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- the number of columns and rows in the scaled image.
								size: as red-pair! start
								MAGICK_FETCH_FILTER(type) ;-- Image filter to use.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the blur factor where > 1 is blurry, < 1 is sharp.
								result: MagickResizeImage *wand size/x size/y type AS_FLOAT(start 2)
							]
							sym = _roll [
							;== Offsets an image as defined by x and y
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- the offset.
								size: as red-pair! start
								result: MagickRollImage *wand size/x size/y
							]
							sym = _rotate [
							;== Rotates an image the specified number of degrees
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the number of degrees to rotate the image.
								MAGICK_FETCH_OPT_PIXELWAND(pw) ;-- the background pixel wand.
								result: MagickRotateImage *wand pw AS_FLOAT(start 0)
								DestroyPixelWand pw
							]
							sym = _sample [
							;== Scales an image to the desired dimensions with pixel sampling
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- the number of columns and rows in the scaled image.
								size: as red-pair! start
								result: MagickSampleImage *wand size/x size/y
							]
							sym = _scale [
							;== Scales the size of an image to the given dimensions
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- the number of columns and rows in the scaled image.
								size: as red-pair! start
								result: MagickScaleImage *wand size/x size/y
							]
;							sym = _segment [
;							;== Segments an image by analyzing the histograms of the color components and identifying units that are homogeneous with the fuzzy C-means technique
;								MAGICK_FETCH_COLORSPACETYPE!() ;-- the image colorspace.
;								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- Set to MagickTrue to print detailed information about the identified classes.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- This represents the minimum number of pixels contained in a hexahedra before it can be considered valid (expressed as a percentage).
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the smoothing threshold eliminates noise in the second derivative of the histogram.  As the value is increased, you can expect a smoother second derivative.
;								result: MagickSegmentImage *wand AS_COLORSPACETYPE!(start 0) AS_MAGICKBOOLEANTYPE!(start 1) AS_FLOAT(start 2) AS_FLOAT(start 3)
;							]
							sym = _selective-blur [
							;== Selectively blur an image within a contrast threshold
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the gaussian, in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the gaussian, in pixels.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- only pixels within this contrast threshold are included in the blur operation.
								result: MagickSelectiveBlurImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1) AS_FLOAT(start 2)
							]
							sym = _sepia-tone [
							;== Applies a special effect to the image, similar to the effect achieved in a photo darkroom by sepia toning
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Define the extent of the sepia toning.
								result: MagickSepiaToneImage *wand AS_FLOAT(start 0)
							]
;							sym = _set [
;							;== Replaces the last image returned by MagickSetImageIndex(), MagickNextImage(), MagickPreviousImage() with the images from the specified wand
;								MAGICK_FETCH_MAGICKWAND!() ;-- the set_wand wand.
;								result: MagickSetImage *wand AS_MAGICKWAND!(start 0)
;							]
							sym = _shade [
							;== Shines a distant light on an image to create a three-dimensional effect
								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- A value other than zero shades the intensity of each pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Define the light source direction.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- elevation
								result: MagickShadeImage *wand AS_BOOLEAN(value) AS_FLOAT(start 1) AS_FLOAT(start 2)
							]
							sym = _shadow [
							;== Simulates an image shadow
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- percentage transparency.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the Gaussian, in pixels.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the shadow x-offset.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the shadow y-offset.
								result: MagickShadowImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1) AS_INT(start 2) AS_INT(start 3)
							]
							sym = _sharpen [
							;== Sharpens an image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the Gaussian, in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the Gaussian, in pixels.
								result: MagickSharpenImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _shave [
							;== Shaves pixels from the image edges
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- the number of columns and rows in the scaled image.
								size: as red-pair! start
								result: MagickShaveImage *wand size/x size/y
							]
;							sym = _shear [
;							;== Slides one edge of an image along the X or Y axis, creating a parallelogram
;								MAGICK_FETCH_PIXELWAND!() ;-- the background pixel wand.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the number of degrees to shear the image.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- y_shear
;								result: MagickShearImage *wand AS_PIXELWAND!(start 0) AS_FLOAT(start 1) AS_FLOAT(start 2)
;							]
							sym = _sigmoidal-contrast [
							;== Adjusts the contrast of an image with a non-linear sigmoidal contrast algorithm
								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- Increase or decrease image contrast.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- strength of the contrast, the larger the number the more 'threshold-like' it becomes.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- midpoint of the function as a color value 0 to QuantumRange.
								result: MagickSigmoidalContrastImage *wand AS_BOOLEAN(value) AS_FLOAT(start 1) AS_FLOAT(start 2)
							]
							sym = _sketch [
							;== Simulates a pencil sketch
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the Gaussian, in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the Gaussian, in pixels.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Apply the effect along this angle.
								result: MagickSketchImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1) AS_FLOAT(start 2)
							]
							sym = _solarize [
							;== Applies a special effect to the image, similar to the effect achieved in a photo darkroom by selectively exposing areas of photo sensitive paper to light
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Define the extent of the solarization.
								result: MagickSolarizeImage *wand AS_FLOAT(start 0)
							]
							sym = _splice [;@@ use pairs instead?
							;== Splices a solid color into the image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region width.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region height.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region x offset.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the region y offset.
								result: MagickSpliceImage *wand AS_INT(start 0) AS_INT(start 1) AS_INT(start 2) AS_INT(start 3)
							]
							sym = _spread [
							;== Is a special effects method that randomly displaces each pixel in a block defined by the radius parameter
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Choose a random pixel in a neighborhood of this extent.
								result: MagickSpreadImage *wand AS_FLOAT(start 0)
							]
;							sym = _statistic [
;							;== Replace each pixel with corresponding statistic from the neighborhood of the specified width and height
;								MAGICK_FETCH_STATISTICTYPE!() ;-- the statistic type (e.g. median, mode, etc.).
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the width of the pixel neighborhood.
;								MAGICK_FETCH_SIZE_T!() ;-- the height of the pixel neighborhood.
;								result: MagickStatisticImage *wand AS_STATISTICTYPE!(start 0) AS_FLOAT(start 1) AS_INT(start 2)
;							]
							sym = _strip [
							;== Strips an image of all profiles and comments
								result: MagickStripImage *wand
							]
							sym = _swirl [
							;== Swirls the pixels about the center of the image, where degrees indicates the sweep of the arc through which each pixel is moved
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Define the tightness of the swirling effect.
								result: MagickSwirlImage *wand AS_FLOAT(start 0)
							]
							sym = _threshold [
							;== Changes the value of individual pixels based on the intensity of each pixel compared to threshold
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Define the threshold value.
								result: MagickThresholdImage *wand AS_FLOAT(start 0)
							]
							sym = _thumbnail [
							;== Changes the size of an image to the given dimensions and removes any associated profiles
								MAGICK_FETCH_VALUE(TYPE_PAIR) ;-- the number of columns and rows in the scaled image.
								size: as red-pair! start
								result: MagickThumbnailImage *wand size/x size/y
							]
;							sym = _tint [
;							;== Applies a color vector to each pixel in the image
;								MAGICK_FETCH_PIXELWAND!() ;-- the tint pixel wand.
;								MAGICK_FETCH_PIXELWAND!() ;-- the opacity pixel wand.
;								result: MagickTintImage *wand AS_PIXELWAND!(start 0) AS_PIXELWAND!(start 1)
;							]
;							sym = _transparent-paint [
;							;== Changes any pixel that matches color with the color defined by fill
;								MAGICK_FETCH_PIXELWAND!() ;-- Change this target color to specified opacity value within the image.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the level of transparency: 1.0 is fully opaque and 0.0 is fully transparent.
;								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- By default target must match a particular pixel color exactly.  However, in many cases two colors may differ by a small amount. The fuzz member of image defines how much tolerance is acceptable to consider two colors as the same.  For example, set fuzz to 10 and the color red at intensities of 100 and 102 respectively are now interpreted as the same color for the purposes of the floodfill.
;								MAGICK_FETCH_NAMED_VALUE(TYPE_LOGIC) ;-- paint any pixel that does not match the target color.
;								result: MagickTransparentPaintImage *wand AS_PIXELWAND!(start 0) AS_FLOAT(start 1) AS_FLOAT(start 2) AS_MAGICKBOOLEANTYPE!(start 3)
;							]
							sym = _transpose [
							;== Creates a vertical mirror image by reflecting the pixels around the central x-axis while rotating them 90-degrees
								result: MagickTransposeImage *wand
							]
							sym = _transverse [
							;== Creates a horizontal mirror image by reflecting the pixels around the central y-axis while rotating them 270-degrees
								result: MagickTransverseImage *wand
							]
							sym = _trim [
							;== Remove edges that are the background color from the image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- By default target must match a particular pixel color exactly.  However, in many cases two colors may differ by a small amount. The fuzz member of image defines how much tolerance is acceptable to consider two colors as the same.  For example, set fuzz to 10 and the color red at intensities of 100 and 102 respectively are now interpreted as the same color for the purposes of the floodfill.
								result: MagickTrimImage *wand AS_FLOAT(start 0)
							]
							sym = _unsharp-mask [
							;== Sharpens an image
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the radius of the Gaussian, in pixels, not counting the center pixel.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the standard deviation of the Gaussian, in pixels.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the percentage of the difference between the original and the blur image that is added back into the original.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the threshold in pixels needed to apply the diffence amount.
								result: MagickUnsharpMaskImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1) AS_FLOAT(start 2) AS_FLOAT(start 3)
							]
							sym = _vignette [
							;== Softens the edges of the image in vignette style
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the black point.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- the white point.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Define the x and y ellipse offset.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- y
								result: MagickVignetteImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1) AS_INT(start 2) AS_INT(start 3)
							]
							sym = _wave [
							;== Creates a 'ripple' effect in the image by shifting the pixels vertically along a sine wave whose amplitude and wavelength is specified by the given parameters
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- Define the amplitude and wave length of the sine wave.
								MAGICK_FETCH_VALUE_2(TYPE_FLOAT TYPE_INTEGER) ;-- wave_length
								result: MagickWaveImage *wand AS_FLOAT(start 0) AS_FLOAT(start 1)
							]
							sym = _white-threshold [
							;== Is like ThresholdImage() but  force all pixels above the threshold into white while leaving all pixels below the threshold unchanged
								MAGICK_FETCH_PIXELWAND(pw)                    ;-- threshold
								result: MagickWhiteThresholdImage *wand pw
								DestroyPixelWand pw
							]


							true [ throw-magick-error cmds cmd false ]
						]
					]
					true [
						MAGICK_FETCH_FILE(name)
						print ["<-- READ " name " to " *wand lf]
						result: MagickReadImage *wand name
						cmd: cmd - 1
					]
				]
				
				if result <> MagickTrue [
					exception: declare ExceptionType! 0
					name: MagickGetException *wand exception
					print ["ImageMagick EXCEPTION: " exception/value lf]
					print ["ImageMagick: " name lf]
					MagickRelinquishMemory name ;this must be called to free resource (once not needed) in the ImageMagick context!
					throw-magick-exception cmds start - 1 false
					;@@ TODO: better error reporting
				]
				cmd: cmd + 1
			]
			bool: as red-logic! stack/arguments
			bool/header: TYPE_LOGIC
			bool/value: true
			as red-value! bool
		]
	]
]

ImageMagick: context [
	set 'iMagick routine [
		"Evaluate ImageMagick dialect commands"
		commands [block!]
	][
		ImageMagick/do commands
	]
]


