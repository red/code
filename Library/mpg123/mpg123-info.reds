Red/System [
	Title:   "Red/System MPG123 binding simple test - lib info output"
	Author:  "Oldes"
	File: 	 %mpg123-info.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on libmpg123 source of version: 1.25.6}
]

#include %mpg123.reds

if MPG123_OK <> mpg123_init [
    print-line "Unable to init libmpg123!"
    quit -1
]

show-mpg132-info: func[
    /local
        err mh decoders
        rates count rate encodings p encoding
][
    err: 0
    mh: mpg123_new null :err 

    either mh = null [
        print-line ["Unable to create mpg123 handle! Error: " err]
    ][
        print-line "Supported mpg123 features:"
        print-line ["^-ABI_UTF8OPEN:      " 1 = mpg123_feature MPG123_FEATURE_ABI_UTF8OPEN]
        print-line ["^-OUTPUT_8BIT:       " 1 = mpg123_feature MPG123_FEATURE_OUTPUT_8BIT]
        print-line ["^-OUTPUT_16BIT:      " 1 = mpg123_feature MPG123_FEATURE_OUTPUT_16BIT]
        print-line ["^-OUTPUT_32BIT:      " 1 = mpg123_feature MPG123_FEATURE_OUTPUT_32BIT]
        print-line ["^-INDEX:             " 1 = mpg123_feature MPG123_FEATURE_INDEX]
        print-line ["^-PARSE_ID3V2:       " 1 = mpg123_feature MPG123_FEATURE_PARSE_ID3V2]
        print-line ["^-DECODE_LAYER1:     " 1 = mpg123_feature MPG123_FEATURE_DECODE_LAYER1 ]
        print-line ["^-DECODE_LAYER2:     " 1 = mpg123_feature MPG123_FEATURE_DECODE_LAYER2 ]
        print-line ["^-DECODE_LAYER3:     " 1 = mpg123_feature MPG123_FEATURE_DECODE_LAYER3 ]
        print-line ["^-DECODE_ACCURATE:   " 1 = mpg123_feature MPG123_FEATURE_DECODE_ACCURATE]
        print-line ["^-DECODE_DOWNSAMPLE: " 1 = mpg123_feature MPG123_FEATURE_DECODE_DOWNSAMPLE]
        print-line ["^-DECODE_NTOM:       " 1 = mpg123_feature MPG123_FEATURE_DECODE_NTOM]
        print-line ["^-PARSE_ICY:         " 1 = mpg123_feature MPG123_FEATURE_PARSE_ICY]
        print-line ["^-TIMEOUT_READ:      " 1 = mpg123_feature MPG123_FEATURE_TIMEOUT_READ]
        print-line ["^-EQUALIZER:         " 1 = mpg123_feature MPG123_FEATURE_EQUALIZER]

        print-line "Available decoders:"
        decoders: mpg123_decoders
        
        while [null <> as c-string! decoders/1][
            print-line [#"^-" as c-string! decoders/1]
            decoders: decoders + 1
        ]

        print-line "Supported decoders:"
        decoders: mpg123_supported_decoders
        
        while [null <> as c-string! decoders/1][
            print-line [#"^-" as c-string! decoders/1]
            decoders: decoders + 1
        ]

        print-line ["Current decoder: " mpg123_current_decoder mh lf]

        rates: 0
        count: 0
        mpg123_rates :rates :count
        print-line "Supported sample rates:"
        p: as int-ptr! rates
        while [count > 0][
            print-line [#"^-" p/1 and FFFFh]
            p: p + 1
            count: count - 1
        ] 

        encodings: 0
        mpg123_encodings :encodings :count
        print-line "Supported encodings:"
        p: as int-ptr! encodings
        while [count > 0][
            encoding: p/1
            print-line [#"^-" as int-ptr! encoding #" " get-encoding-name encoding " (" mpg123_encsize encoding " bytes)"]
            p: p + 1
            count: count - 1
        ] 
    ]
]

show-mpg132-info
mpg123_exit
