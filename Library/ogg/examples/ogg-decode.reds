Red/System [
	Title:   "Red/System libogg binding - decode example"
	Author:  "Oldes"
	File: 	 %ogg-decode.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on libogg source of version: 1.3.2 from www.xiph.org/ogg/}
]

#if red-pass? = no [
    ;No Red runtime embedded, so import stand alone dependencies
    #include %../../Stream-IO/simple-io-minimal.reds
]

#include %../ogg.reds

#define OGG_BLOCK_SIZE 4096

ogg-decode: func[
    filename [c-string!]
    /local
        file [integer!] ;opened file handle
        oy [ogg_sync_state!]
        og [ogg_page!]
        os [ogg_stream_state!]
        op [ogg_packet!]
        serialno 
        buffer size bytes processed
][
    file: simple-io/open-file filename simple-io/RIO_READ no
    if file = 0 [
        print-line ["Cannot open file: " filename]
        quit -1
    ]
    print-line ["filename: " filename " size: " simple-io/file-size? file]

    oy: as ogg_sync_state!   allocate size? ogg_sync_state!
    og: as ogg_page!         allocate size? ogg_page!
    os: as ogg_stream_state! allocate 1024 ;@@ don't have full struct spec, so cannot use `size?`
    op: as ogg_packet!       allocate size? ogg_packet!

    ogg_sync_init oy

    serialno: 0
    processed: 0

    forever [
        buffer: ogg_sync_buffer oy OGG_BLOCK_SIZE
        bytes: simple-io/read-data file buffer OGG_BLOCK_SIZE
        ogg_sync_wrote oy bytes
    
        if 1 <> ogg_sync_pageout oy og [
            print-line ["^/bytes left: " bytes]

            if bytes < OGG_BLOCK_SIZE [ break ] ;out of data

            print-line ["Not an Ogg stream!"]
            break
        ]

        if serialno = 0 [
            serialno: ogg_page_serialno og
            print-line ["ogg_stream_init: " 0 = ogg_stream_init os serialno " serial: " serialno]
        ]
        

        ogg_stream_pagein os og 
        print-line ["^/next packet valid: " 1 = ogg_stream_packetpeek os null]
        while [1 = ogg_stream_packetout os op] [
            processed: processed + op/bytes
            print-line ["packet bytes: " op/bytes " total: " processed]
        ]
    ]

    ogg_stream_clear os
    ogg_sync_clear oy
    free as byte-ptr! os
    free as byte-ptr! oy
    free as byte-ptr! op
    free as byte-ptr! og

    simple-io/close-file file
]

ogg-decode "stereo.ogg"