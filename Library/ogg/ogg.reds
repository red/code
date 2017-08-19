Red/System [
	Title:   "Red/System libOGG binding"
	Author:  "Oldes"
	File: 	 %ogg.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on libOGG source of version: 1.3.2 from www.xiph.org/ogg/}
]

#switch OS [
	Windows   [	#define OGG_LIBRARY "libogg.dll" ]
	macOS     [ #define OGG_LIBRARY "libogg.dylib" ] ;@@ not tested!
	#default  [ #define OGG_LIBRARY "libogg.so" ] ;@@ not tested!
]

ogg_int64_t!: alias struct! [lo [integer!] hi [integer!]]

ogg_iovec_t!: alias struct! [
    iov_base [byte-ptr!]
    iov_len  [integer!]
]

oggpack_buffer!: alias struct! [
    endbyte [integer!]
    endbit  [integer!]

    buffer  [byte-ptr!]
    ptr     [byte-ptr!]
    storage [integer!]
]

ogg_page!: alias struct! [
    ;- Used to encapsulate the data in one Ogg bitstream page
    ;  Ogg pages are the fundamental unit of framing and interleave in an ogg bitstream. 
    ;  They are made up of packet segments of 255 bytes each. There can be as many as 255 packet segments per page, 
    ;  for a maximum page size of a little under 64 kB. This is not a practical limitation as the segments can be 
    ;  joined across page boundaries allowing packets of arbitrary size. In practice many applications will not 
    ;  completely fill all pages because they flush the accumulated packets periodically order to bound latency more tightly.

    header     [byte-ptr!] ;Pointer to the page header for this page. The exact contents of this header are defined in the framing spec document.
    header_len [integer!]  ;Length of the page header in bytes.
    body       [byte-ptr!] ;Pointer to the data for this page.
    body_len   [integer!]  ;Length of the body data in bytes.
]

ogg_stream_state!: alias struct! [
    ;- Contains the current encode/decode state of a logical Ogg bitstream
    body_data     [byte-ptr!] ; bytes from packet bodies
    body_storage  [integer!]  ; storage elements allocated
    body_fill     [integer!]  ; elements stored; fill mark
    body_returned [integer!]  ; elements of fill returned


    lacing_vals   [int-ptr!]  ; The values that will go to the segment table
    granule_vals  [ogg_int64_t! value] ; granulepos values for headers. Not compact
                                 ; this way, but it is simple coupled to the
                                 ; lacing fifo
    lacing_storage  [integer!]
    lacing_fill     [integer!]
    lacing_packet   [integer!]
    lacing_returned [integer!]

    ;@@ TODO... support the rest of values:
    ;  unsigned char    header[282];      /* working space for header encode
    ;  int              header_fill;
    ;
    ;  int     e_o_s;          /* set when we have buffered the last packet in the
    ;                             logical bitstream
    ;  int     b_o_s;          /* set after we've written the initial page
    ;                             of a logical bitstream
    ;  long    serialno;
    ;  long    pageno;
    ;  ogg_int64_t  packetno;  /* sequence number for decode; the framing
    ;                             knows where there's a hole in the data,
    ;                             but we need coupling so that the codec
    ;                             (which is in a separate abstraction
    ;                             layer) also knows about the gap
    ;  ogg_int64_t   granulepos;
]

ogg_packet!: alias struct! [
    ;- Encapsulates the data for a single raw packet of data and is used to transfer data between the ogg framing layer and the handling codec.
    packet [byte-ptr!] ; Pointer to the packet's data. This is treated as an opaque type by the ogg layer.
    bytes  [integer!]  ; Indicates the size of the packet data in bytes. Packets can be of arbitrary size.
    b_o_s  [integer!]  ; Flag indicating whether this packet begins a logical bitstream. 1 indicates this is the first packet, 0 indicates any other position in the stream.
    e_o_s  [integer!]  ; Flag indicating whether this packet ends a bitstream. 1 indicates the last packet, 0 indicates any other position in the stream.

    granulepos [ogg_int64_t! value] ; A number indicating the position of this packet in the decoded data. This is the last sample, 
                              ; frame or other unit of information ('granule') that can be completely decoded from this packet.
    packetno   [ogg_int64_t! value] ; sequence number for decode; the framing
                              ; knows where there's a hole in the data,
                              ; but we need coupling so that the codec
                              ; (which is in a separate abstraction
                              ; layer) also knows about the gap
]

ogg_sync_state!: alias struct! [
    ;- Tracks the synchronization of the current page.
    data        [byte-ptr!] ; Pointer to buffered stream data.
    storage     [integer!]  ; Current allocated size of the stream buffer held in `data`.
    fill        [integer!]  ; The number of valid bytes currently held in `data`; functions as the buffer head pointer.
    returned    [integer!]  ; The number of bytes at the head of `data` that have already been returned as pages; functions as the buffer tail pointer.

    unsynced    [integer!]  ; Synchronization state flag; nonzero if sync has not yet been attained or has been lost.
    headerbytes [integer!]  ; If synced, the number of bytes used by the synced page's header.
    bodybytes   [integer!]  ; If synced, the number of bytes used by the synced page's body.
]



#import [
	OGG_LIBRARY cdecl [
        ;-- Ogg BITSTREAM PRIMITIVES: general --

        ;Functions which are generally useful when using Ogg streaming, whether encoding or decoding.
        ;These functions can be used to manipulate some of the basic elements of Ogg - streams and pages. 
        ;Streams and pages are important during both the encode and decode process. 

        ogg_stream_init: "ogg_stream_init" [
            ;Initializes an Ogg bitstream.
            os [ogg_stream_state!] ;Pointer to the ogg_stream_state struct that we will be initializing.
            serialno [integer!]    ;Serial number that we will attach to this stream.
            return: [integer!]     ;0 if successful
        ]
        ogg_stream_clear: "ogg_stream_clear" [
            ;Clears the storage within the Ogg stream, but does not free the stream itself.
            os [ogg_stream_state!]
            return: [integer!]
        ]
        ogg_stream_reset: "ogg_stream_reset" [
            ;Resets the stream status to its initial position.
            os [ogg_stream_state!]
            return: [integer!]
        ]
        ogg_stream_reset_serialno: "ogg_stream_reset_serialno" [
            os [ogg_stream_state!]
            serialno [integer!]
            return: [integer!]
        ]
        ogg_stream_destroy: "ogg_stream_destroy" [
            ;Frees the entire Ogg stream.
            ;Note: It calls `free` on its argument, so if the ogg_stream_state is not malloc'd or will otherwise 
            ;be freed by your own code, use ogg_stream_clear instead.
            os [ogg_stream_state!]
            return: [integer!]
        ]
        ogg_stream_check: "ogg_stream_check" [
            ;Check for asyncronous errors.
            os [ogg_stream_state!]
            return: [integer!]
        ]
        ogg_stream_eos: "ogg_stream_eos" [
            ;Indicates whether we are at the end of the stream.
            os [ogg_stream_state!]
            return: [integer!]
        ]
        ogg_page_checksum_set: "ogg_page_checksum_set" [
            ;Checksums an ogg_page.
            og [ogg_page!]
        ]
        ogg_page_version: "ogg_page_version" [
            ;Returns the version of ogg_page that this stream/page uses
            og  [ogg_page!]
            return: [integer!]
        ]
        ogg_page_continued: "ogg_page_continued" [
            ;Indicates if the current page contains a continued packet from the last page.
            og  [ogg_page!]
            return: [integer!]
        ]
        ogg_page_bos: "ogg_page_bos" [
            ;Indicates if the current page is the beginning of the stream.
            og  [ogg_page!]
            return: [integer!]
        ]
        ogg_page_eos: "ogg_page_eos" [
            ;Indicates if the current page is the end of the stream.
            og  [ogg_page!]
            return: [integer!]
        ]
        ogg_page_granulepos: "ogg_page_granulepos" [
            ;Returns the precise playback location of this page.
            og  [ogg_page!]
            return: [ogg_int64_t! value]
        ]
        ogg_page_serialno: "ogg_page_serialno" [
            ;Returns the unique serial number of the logical bitstream associated with this page.
            og  [ogg_page!]
            return: [integer!]
        ]
        ogg_page_pageno: "ogg_page_pageno" [
            ;Returns the sequential page number for this page.
            og  [ogg_page!]
            return: [integer!]
        ]
        ogg_page_packets: "ogg_page_packets" [
            ;Indicates the number of packets contained in a page.
            og  [ogg_page!]
            return: [integer!]
        ]
        ogg_packet_clear: "ogg_packet_clear" [
            ;Clears the ogg_packet structure.
            op [ogg_packet!]
        ]

        ;-- Ogg BITSTREAM PRIMITIVES: encoding --

        ;When encoding, the encoding engine will output raw packets which must be placed into an Ogg bitstream.

        ;Raw packets are inserted into the stream, and an ogg_page is output when enough packets have been 
        ;written to create a full page. The pages output are pointers to buffered packet segments, and can 
        ;then be written out and saved as an ogg stream.

        ogg_stream_packetin: "ogg_stream_packetin" [
            ;This function submits a packet to the bitstream for page encapsulation. After this is called, 
            ;more packets can be submitted, or pages can be written out.

            ;In a typical encoding situation, this should be used after filling a packet with data. 
            ;The data in the packet is copied into the internal storage managed by the ogg_stream_state, 
            ;so the caller is free to alter the contents of op after this call has returned. 
            os  [ogg_stream_state!]
            op  [ogg_packet!]
            return: [integer!] ;0 if successful
        ]
        ogg_stream_iovecin: "ogg_stream_iovecin" [
            ;This function submits packet data (in the form of an array of ogg_iovec_t, rather than using 
            ;an ogg_packet structure) to the bitstream for page encapsulation. After this is called, more packets 
            ;can be submitted, or pages can be written out.

            ;In a typical encoding situation, this should be used after filling a packet with data. 
            ;The data in the packet is copied into the internal storage managed by the ogg_stream_state, 
            ;so the caller is free to alter the contents of os after this call has returned. 
            os  [ogg_stream_state!]
            iov [ogg_iovec_t!] ;Length-encoded buffers held in an array of ogg_iovec_t.
            count [integer!]   ;Length of the iov array.
            e_o_s [integer!]   ;End of stream flag, analagous to the e_o_s field in an ogg_packet.
            granulepos [ogg_int64_t! value] ;Granule position value, analagous to the granpos field in an ogg_packet.
            return: [integer!] ;0 if successful
        ]
        ogg_stream_pageout: "ogg_stream_pageout" [
            ;This function forms packets into pages.

            ;In a typical encoding situation, this would be called after using `ogg_stream_packetin` to submit 
            ;data packets to the bitstream. Internally, this function assembles the accumulated packet bodies 
            ;into an Ogg page suitable for writing to a stream. The function is typically called in a loop until 
            ;there are no more pages ready for output.

            ;This function will only return a page when a "reasonable" amount of packet data is available. 
            ;Normally this is appropriate since it limits the overhead of the Ogg page headers in the bitstream, 
            ;and so calling `ogg_stream_pageout` after `ogg_stream_packetin` should be the common case. 
            ;Call `ogg_stream_flush` if immediate page generation is desired. This may be occasionally necessary, 
            ;for example, to limit the temporal latency of a variable bitrate stream.

            os  [ogg_stream_state!]
            og  [ogg_page!]
            return: [integer!]
            ;Zero means that insufficient data has accumulated to fill a page, or an internal error occurred. In this case og is not modified.
            ;Non-zero means that a page has been completed and returned.
        ]
        ogg_stream_pageout_fill: "ogg_stream_pageout_fill" [
            ;This function forms packets into pages, similar to `ogg_stream_pageout`, but allows applications to explicitly request a specific page spill size.
            os  [ogg_stream_state!]
            og  [ogg_page!]
            nfill [integer!] ;Packet data watermark in bytes.
            return: [integer!]
        ]
        ogg_stream_flush: "ogg_stream_flush" [
            ;Forces any remaining packets in the stream to be returned as a page of any size.
            os  [ogg_stream_state!]
            og  [ogg_page!]
            return: [integer!]
        ]
        ogg_stream_flush_fill: "ogg_stream_flush_fill" [
            ;Similar to `ogg_stream_flush`, but specifies a page spill threshold in bytes.
            os  [ogg_stream_state!]
            og  [ogg_page!]
            nfill [integer!]
            return: [integer!]
        ]

        ;-- Ogg BITSTREAM PRIMITIVES: decoding --

        ogg_sync_init: "ogg_sync_init" [
            ;This function is used to initialize an ogg_sync_state struct to a known initial value in preparation for manipulation of an Ogg bitstream.

            ;The ogg_sync struct is important when decoding, as it synchronizes retrieval and return of data. 
            oy [ogg_sync_state!] ;Pointer to a previously declared ogg_sync_state struct. After this function call, this struct has been initialized.
            return: [integer!]   ;0 is always returned.
        ]
        ogg_sync_clear: "ogg_sync_clear" [
            ;Clears the status information from the synchronization struct.

            ;This function is used to free the internal storage of an ogg_sync_state struct and resets the struct to the initial state. To free the entire struct, ogg_sync_destroy should be used instead. In situations where the struct needs to be reset but the internal storage does not need to be freed, ogg_sync_reset should be used. 
            oy [ogg_sync_state!]
            return: [integer!] ;0 is always returned.
        ]
        ogg_sync_reset: "ogg_sync_reset" [
            ;Resets the synchronization status to initial values.
            oy [ogg_sync_state!]
            return: [integer!] ;0 is always returned.
        ]
        ogg_sync_destroy: "ogg_sync_destroy" [
            ;Frees the synchronization struct.
            ;Note this calls free() on its argument so you should only use this function if you've allocated the ogg_sync_state on the heap. If it is allocated on the stack, or it will otherwise be freed by your own code, use ogg_sync_clear instead to release just the internal memory.
            oy [ogg_sync_state!]
            return: [integer!] ;0 is always returned.
        ]
        ogg_sync_check: "ogg_sync_check" [
            ;Check for asynchronous errors.
            oy [ogg_sync_state!]
            return: [integer!]
                ;0 is returned if the ogg_sync_state structure is initialized and ready.
                ;nonzero is returned if the structure was never initialized, or if an unrecoverable internal error occurred 
                ;in a previous call using the passed in ogg_sync_state struct.
        ]
        ogg_sync_buffer: "ogg_sync_buffer" [
            ;Exposes a buffer from the synchronization layer in order to read data.

            ;Buffer space which has already been returned is cleared, and the buffer is extended as necessary by the size plus some additional bytes. Within the current implementation, an extra 4096 bytes are allocated, but applications should not rely on this additional buffer space.
            ;The buffer exposed by this function is empty internal storage from the ogg_sync_state struct, beginning at the fill mark within the struct.
            ;A pointer to this buffer is returned to be used by the calling application. 
            oy [ogg_sync_state!]
            size [integer!]
            return: [byte-ptr!] ;Returns a pointer to the newly allocated buffer or NULL on error
        ]
        ogg_sync_wrote: "ogg_sync_wrote" [
            ;Tells the synchronization layer how many bytes were written into the buffer.

            ;The general proceedure is to request a pointer into an internal ogg_sync_state buffer by calling `ogg_sync_buffer`. The buffer is then filled up to the requested size with new input, and `ogg_sync_wrote` is called to advance the fill pointer by however much data was actually available.
            oy [ogg_sync_state!]
            bytes [integer!]
            return: [integer!]
                ; -1 if the number of bytes written overflows the internal storage of the ogg_sync_state struct or an internal error occurred.
                ;  0 in all other cases.
        ]
        ogg_sync_pageseek: "ogg_sync_pageseek" [
            ;Finds the borders of pages and resynchronizes the stream.

            ;This is useful when seeking within a bitstream. ogg_sync_pageseek will synchronize to the next page in the bitstream and return information about how many bytes we advanced or skipped in order to do so. 
            oy [ogg_sync_state!]
            og [ogg_page!]
            return: [integer!]
                ; -n means that we skipped n bytes within the bitstream.
                ; 0 means that the page isn't ready and we need more data, or than an internal error occurred. No bytes have been skipped.
                ; n means that the page was synced at the current location, with a page length of n bytes.
        ]
        ogg_sync_pageout: "ogg_sync_pageout" [
            ;Outputs a page from the synchronization layer.

            ;In an actual decoding loop, this function should be called first to ensure that the buffer is cleared. The example code below illustrates a clean reading loop which will fill and output pages.

            ;Caution:This function should be called before reading into the buffer to ensure that data does not remain in the ogg_sync_state struct. Failing to do so may result in a memory leak. See the example code below for details. 
            oy [ogg_sync_state!]
            og [ogg_page!]
            return: [integer!]
                ; -1 returned if stream has not yet captured sync (bytes were skipped).
                ; 0 returned if more data needed or an internal error occurred.
                ; 1 indicated a page was synced and returned.

            ;example:
            ;   if 1 <> ogg_sync_pageout oy og [
            ;       buffer: ogg_sync_buffer oy 8192
            ;       bytes: fread buffer 1 8192 stdin
            ;       ogg_sync_wrote oy bytes
            ;   ]
        ]
        ogg_stream_pagein: "ogg_stream_pagein" [
            ;Submits a complete page to the stream layer.

            ;In a typical decoding situation, this function would be called after using `ogg_sync_pageout` to create a valid `ogg_page!` struct.
            ;Internally, this function breaks the page into packet segments in preparation for outputting a valid packet to the codec decoding layer. 
            os [ogg_stream_state!]
            og [ogg_page!]
            return: [integer!]
                ; -1 indicates failure. This means that the serial number of the page did not match the serial number of the bitstream, the page version was incorrect, or an internal error accurred.
                ; 0 means that the page was successfully submitted to the bitstream.
        ]
        ogg_stream_packetout: "ogg_stream_packetout" [
            ;Outputs a packet to the codec-specific decoding engine.

            ;This function assembles a data packet for output to the codec decoding engine. The data has already been submitted to the ogg_stream_state and broken into segments. Each successive call returns the next complete packet built from those segments.

            ;In a typical decoding situation, this should be used after calling ogg_stream_pagein() to submit a page of data to the bitstream. If the function returns 0, more data is needed and another page should be submitted. A non-zero return value indicates successful return of a packet.

            ;The op is filled in with pointers to memory managed by the stream state and is only valid until the next call. The client must copy the packet data if a longer lifetime is required.
            os [ogg_stream_state!]
            op [ogg_packet!]
            return: [integer!]
                ; -1 if we are out of sync and there is a gap in the data. This is usually a recoverable error and subsequent calls to ogg_stream_packetout are likely to succeed. op has not been updated.
                ; 0 if there is insufficient data available to complete a packet, or on unrecoverable internal error occurred. op has not been updated.
                ; 1 if a packet was assembled normally. op contains the next packet from the stream.
        ]
        ogg_stream_packetpeek: "ogg_stream_packetpeek" [
            ;Provides access to the next packet in the bitstream without advancing decoding.

            ;In a typical situation, this would be called speculatively after `ogg_stream_pagein` to check the packet contents before handing it off to a codec for decompression. To advance page decoding and remove the packet from the sync structure, call `ogg_stream_packetout`.
            os [ogg_stream_state!]
            op [ogg_packet!] ;Pointer to the next packet available in the bitstream, if any. A NULL value may be passed in the case of a simple "is there a packet?" check.
            return: [integer!]
        ]

        ;-- Ogg BITSTREAM PRIMITIVES: bitstream --

        oggpack_writeinit: "oggpack_writeinit" [
            ;Initializes a buffer for writing using this bitpacking functions.
            b [oggpack_buffer!] ;Buffer to be used for writing. This is an ordinary data buffer
                                ;with some extra markers to ease bit navigation and manipulation.
        ]
        oggpack_writecheck: "oggpack_writecheck" [
            ;Asynchronously checks error status of bitpacker write buffer.
            b [oggpack_buffer!]
            return: [integer!] ;0 = ready, else error
        ]
        oggpack_writetrunc: "oggpack_writetrunc" [
            b    [oggpack_buffer!]
            bits [integer!]
        ]
        oggpack_writealign: "oggpack_writealign" [
            b    [oggpack_buffer!]
        ]
        oggpack_writecopy: "oggpack_writecopy" [
            b    [oggpack_buffer!]
            source [byte-ptr!]
            bits   [integer!]
        ]
        oggpack_reset: "oggpack_reset" [
            ;Clears and resets the buffer to the initial position but does not free the memory used. 
            b [oggpack_buffer!]
        ]
        oggpack_writeclear: "oggpack_writeclear" [
            ;This function clears the buffer after writing and frees the memory used by the oggpack_buffer.
            b [oggpack_buffer!]
        ]
        oggpack_readinit: "oggpack_readinit" [
            ;Initializes a buffer for reading using this bitpacking library.
            b     [oggpack_buffer!]
            buf   [byte-ptr!]
            bytes [integer!]
        ]
        oggpack_write: "oggpack_write" [
            ;Writes bytes to the specified location within the buffer.
            b     [oggpack_buffer!]
            value [integer!]
            bits  [integer!]
        ]
        oggpack_look: "oggpack_look" [
            ;Look at a specified number of bits, <=32, without advancing the location pointer.
            b [oggpack_buffer!]
            bits  [integer!]
            return: [integer!]
        ]
        oggpack_look1: "oggpack_look1" [
            ;Looks at one bit without advancing the location pointer.
            b [oggpack_buffer!]
            return: [integer!]
        ]
        oggpack_adv: "oggpack_adv" [
            ;Advances the location pointer by a specified number of bits.
            b [oggpack_buffer!]
            bits  [integer!]
        ]
        oggpack_adv1: "oggpack_adv1" [
            ;Advances the location pointer by one bit.
            b [oggpack_buffer!]
        ]
        oggpack_read: "oggpack_read" [
            ;Reads a specified number of bits from the buffer.
            b [oggpack_buffer!]
            bits  [integer!]
            return: [integer!]
        ]
        oggpack_read1: "oggpack_read1" [
            ;Reads one bit from the buffer.
            b [oggpack_buffer!]
            return: [integer!]
        ]
        oggpack_bytes: "oggpack_bytes" [
            ;Returns the total number of bytes contained within the buffer.
            b [oggpack_buffer!]
            return: [integer!]
        ]
        oggpack_bits: "oggpack_bits" [
            ;Returns the total number of bits contained within the buffer.
            b [oggpack_buffer!]
            return: [integer!]
        ]
        oggpack_get_buffer: "oggpack_get_buffer" [
            ;Returns a pointer to the buffer encapsulated within the oggpack_buffer struct.
            b [oggpack_buffer!]
            return: [byte-ptr!]
        ]
    ]
]
