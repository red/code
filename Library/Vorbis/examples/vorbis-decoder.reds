Red/System [
	Title:   "Red/System libvorbis binding - decoder example"
	Author:  "Oldes"
	File: 	 %vorbis-decoder.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
    Note:    "This is extended `ogg-decode.reds` example from ogg library"
]

#if red-pass? = no [
    ;No Red runtime embedded, so import stand alone dependencies
    #include %../../Stream-IO/simple-io-minimal.reds
]

#include %../../ogg/ogg.reds
#include %../vorbis.reds

#define OGG_BLOCK_SIZE 4096

vorbis-decoder: context [
    convbuffer: allocate 2 * OGG_BLOCK_SIZE ;ogg_int16_t convbuffer[4096];

    oy: as ogg_sync_state!   allocate size? ogg_sync_state!
    og: as ogg_page!         allocate size? ogg_page!
    os: as ogg_stream_state! allocate 1024 ;@@ don't have full struct spec, so cannot use `size?`
    op: as ogg_packet!       allocate size? ogg_packet!

    vi: as vorbis_info!      allocate size? vorbis_info!
    vc: as vorbis_comment!   allocate size? vorbis_comment!

    vd: as vorbis_dsp_state! allocate size? vorbis_dsp_state!
    vb: as vorbis_block!     allocate size? vorbis_block!

    decode: func[
        filename [c-string!]
        /local
            file [integer!] ;opened file handle
            serialno i result
            buffer size bytes processed
            convsize eos pcm samples
            j clip? clips bout p mono channel val
    ][
        convsize: OGG_BLOCK_SIZE
        file: simple-io/open-file filename simple-io/RIO_READ no
        if file = 0 [
            print-line ["Cannot open file: " filename]
            quit -1
        ]
        print-line ["filename: " filename " size: " simple-io/file-size? file]

        ogg_sync_init oy
     
        vorbis_info_init vi
        vorbis_comment_init vc

        serialno: 0
        clips: 0
        processed: 0

        forever [
            eos: false
            buffer: ogg_sync_buffer oy OGG_BLOCK_SIZE
            bytes: simple-io/read-data file buffer OGG_BLOCK_SIZE
            ogg_sync_wrote oy bytes
        
            if 1 <> ogg_sync_pageout oy og [
                ;print-line ["^/bytes left: " bytes]
                if bytes < OGG_BLOCK_SIZE [ break ] ;out of data

                print-line ["Not an Ogg stream!"]
                simple-io/close-file file
                quit 1
            ]

            serialno: ogg_page_serialno og
            print-line ["ogg_stream_init: " 0 = ogg_stream_init os serialno " serial: " serialno]        

            if 0 > ogg_stream_pagein os og [
                print-line "Error reading first page of Ogg bitstream data."
                break
            ]

            if 1 <> ogg_stream_packetout os op [
                print-line "Error reading initial header packet."
                break
            ]

            if 0 > vorbis_synthesis_headerin vi vc op [
                print-line "This Ogg bitstream does not contain Vorbis audio data."
                break
            ]

            ; At this point, we're sure we're Vorbis. We've set up the logical
            ;(Ogg) bitstream decoder. Get the comment and codebook headers and
            ;set up the Vorbis decoder
     
            ;The next two packets in order are the comment and codebook headers.
            ;They're likely large and may span multiple pages. Thus we read
            ;and submit data until we get our two packets, watching that no
            ;pages are missing. If a page is missing, error out; losing a
            ;header page is the only place where missing data is fatal.
     
            i: 0
            while [i < 2][
                while [i < 2][
                    result: ogg_sync_pageout oy og
                    if result = 0 [ break ] ;Need more data

                    ;Don't complain about missing or corrupt data yet. We'll
                    ;catch it at the packet output phase

                    if result = 1 [
                        ogg_stream_pagein os og ;we can ignore any errors here
                                                ;as they'll also become apparent
                                                ;at packetout
                        while [i < 2][
                            result: ogg_stream_packetout os op
                            if result = 0 [ break ]
                            print-line ["packet bytes: " op/bytes " " ]
                            if result < 0 [
                                ;Uh oh; data at some point was corrupted or missing!
                                ;We can't tolerate that in a header.  Die
                                print-line "Corrupt secondary header (no ogg packet).  Exiting."
                                quit 1
                            ]
                            result: vorbis_synthesis_headerin vi vc op
                            print-line ["vorbis_synthesis_headerin: " result]
                            if result < 0 [
                                print-line "Corrupt secondary header.  Exiting."
                                quit 1
                            ]
                            i: i + 1
                        ]
                    ]
                ]

                buffer: ogg_sync_buffer oy OGG_BLOCK_SIZE
                bytes: simple-io/read-data file buffer OGG_BLOCK_SIZE
                ;print-line ["AAA " bytes]
                if all [i < 2 bytes < OGG_BLOCK_SIZE] [
                    print-line "End of file before finding all Vorbis headers!"
                    break
                ]
                ogg_sync_wrote oy bytes
            ]
            
            if vc/comments > 0 [
                p:  vc/user_comments
                while [p/value <> 0][
                    print-line ["Comment: " as c-string! p/value]
                    p: p + 1
                ]
            ]
            print-line ["Bitstream is " vi/channels " channels, " vi/rate "Hz."]
            print-line ["Encoded by: " vc/vendor]

            print-line ["vorbis_info_blocksize short: " vorbis_info_blocksize vi 0]
            print-line ["vorbis_info_blocksize long:  " vorbis_info_blocksize vi 1]

            convsize: OGG_BLOCK_SIZE / vi/channels

            ;OK, got and parsed all three headers. Initialize the Vorbis packet->PCM decoder.

            result: vorbis_synthesis_init vd vi
            print-line ["init: " result]
            either 0 = result [ ;central decode state
                vorbis_block_init vd vb     ;local state for most of the decode
                                            ;so multiple block decodes can
                                            ;proceed in parallel. We could init
                                            ;multiple vorbis_block structures
                                            ;for vd here

                ;The rest is just a straight decode loop until end of stream
                
                print-line "decoding..."
                
                while [not eos] [
                    while [not eos] [
                        result: ogg_sync_pageout oy og

                        ;print-line ["????? " result]
                        if result = 0 [break] ;need data
                        either result < 0 [
                            ;missing or corrupt data at this page position
                            print-line "Corrupt or missing data in bitstream; continuing..."
                        ][
                            ogg_stream_pagein os og ;can safely ignore errors at this point
                            forever [
                                result: ogg_stream_packetout os op
                                if result = 0 [break] ;need data
                                if result > 0 [
                                    ;we have a packet.  Decode it
                                    result: vorbis_synthesis vb op
                                    ;print-line ["packet " result]
                                    if 0 = result [ ;test for success!
                                        vorbis_synthesis_blockin vd vb

                                        pcm: 0
                                        while [ 
                                            samples: vorbis_synthesis_pcmout vd :pcm
                                            samples > 0
                                        ][
                                            clip?: false
                                            bout: either samples < convsize [samples][convsize]
                                            channel: as int-ptr! pcm

                                            print-line ["frame: " vd/sequence/hi " samples: " samples]

                                            i: 0
                                            while [i < vi/channels][
                                                i: i + 1
                                                ;do something with samples here
                                                mono: as float32-ptr! channel/value
                                                j: 0
                                                while [j < bout][
                                                    j: j + 1
                                                    ;convert floats to 16 bit signed ints (host order) and interleave
                                                    val: as integer! ((mono/j * as float32! 32767.0) + as float32! 0.5)
                                                    
                                                    ;might as well guard against clipping
                                                    if val >  32767 [ clip?: true val:  32767 ]
                                                    if val < -32768 [ clip?: true val: -32768 ]
                                                ]
                                                channel: channel + 1
                                            ]

                                            if clip? [
                                                print-line ["Clipping in frame " vd/sequence/hi]
                                                clips: clips + 1
                                            ]

                                            processed: processed + bout

                                            vorbis_synthesis_read vd bout ;tell libvorbis how many samples we actually consumed
                                        ]
                                    ]
                                ]
                            ]
                            if 1 = ogg_page_eos og [eos: true]
                        ]
                    ]
                    if not eos [
                        buffer: ogg_sync_buffer oy OGG_BLOCK_SIZE
                        bytes: simple-io/read-data file buffer OGG_BLOCK_SIZE
                        ogg_sync_wrote oy bytes
                        if bytes = 0 [ eos: true ]
                    ]
                ]

                ;ogg_page and ogg_packet structs always point to storage in libvorbis.
                ;They're never freed or manipulated directly

                vorbis_block_clear vb
                vorbis_dsp_clear vd
            ][
                print-line "Error: Corrupt header during playback initialization."
            ]

            print-line ["^/Processed " processed " samples."]
            either clips > 0 [
                print-line ["Clipping found in " clips " frames."]
            ][  print-line "Found no clipping."]

            ;clean up this logical bitstream; before exit we see if we're followed by another [chained] 

            ogg_stream_clear os
            vorbis_comment_clear vc
            vorbis_info_clear    vi
        ]

        ;OK, clean up the framer

        ogg_sync_clear   oy

        simple-io/close-file file
        ;print-line "end"
    ]
]


print-line ["vorbis_version_string: " vorbis_version_string]

vorbis-decoder/decode "test-record.ogg"
vorbis-decoder/decode "stereo.ogg"