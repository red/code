Red/System [
	Title:   "Red/System MPG123 binding"
	Author:  "Oldes"
	File: 	 %mpg123.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on libmpg123 source of version: 1.25.6 from www.mpg123.de}
]

#switch OS [
	Windows   [	#define MPG123_LIBRARY "libmpg123.dll" ]
	macOS     [ #define MPG123_LIBRARY "libmpg123.dylib" ] ;@@ not tested!
	#default  [ #define MPG123_LIBRARY "libmpg123.so" ] ;@@ not tested!
]

#include %../os/definitions.reds ;common aliases and defines

#define mpg123! int-ptr!

#enum mpg123-errors! [
    ;- Enumeration of the message and error codes and returned by libmpg123 functions.
    MPG123_DONE: -12        ; Message: Track ended. Stop decoding.
    MPG123_NEW_FORMAT: -11  ; Message: Output format will be different on next call. Note that some libmpg123 versions between 1.4.3 and 1.8.0 insist on you calling mpg123_getformat() after getting this message code. Newer verisons behave like advertised: You have the chance to call mpg123_getformat(), but you can also just continue decoding and get your data.
    MPG123_NEED_MORE: -10   ; Message: For feed reader: "Feed me more!" (call mpg123_feed() or mpg123_decode() with some new input data).
    MPG123_ERR: -1          ; Generic Error
    MPG123_OK: 0            ; Success
    MPG123_BAD_OUTFORMAT    ; Unable to set up output format!
    MPG123_BAD_CHANNEL      ; Invalid channel number specified.
    MPG123_BAD_RATE         ; Invalid sample rate specified. 
    MPG123_ERR_16TO8TABLE   ; Unable to allocate memory for 16 to 8 converter table!
    MPG123_BAD_PARAM        ; Bad parameter id!
    MPG123_BAD_BUFFER       ; Bad buffer given -- invalid pointer or too small size.
    MPG123_OUT_OF_MEM       ; Out of memory -- some malloc() failed.
    MPG123_NOT_INITIALIZED  ; You didn't initialize the library!
    MPG123_BAD_DECODER      ; Invalid decoder choice.
    MPG123_BAD_HANDLE       ; Invalid mpg123 handle.
    MPG123_NO_BUFFERS       ; Unable to initialize frame buffers (out of memory?).
    MPG123_BAD_RVA          ; Invalid RVA mode.
    MPG123_NO_GAPLESS       ; This build doesn't support gapless decoding.
    MPG123_NO_SPACE         ; Not enough buffer space.
    MPG123_BAD_TYPES        ; Incompatible numeric data types.
    MPG123_BAD_BAND         ; Bad equalizer band.
    MPG123_ERR_NULL         ; Null pointer given where valid storage address needed.
    MPG123_ERR_READER       ; Error reading the stream.
    MPG123_NO_SEEK_FROM_END ; Cannot seek from end (end is not known).
    MPG123_BAD_WHENCE       ; Invalid 'whence' for seek function.
    MPG123_NO_TIMEOUT       ; Build does not support stream timeouts.
    MPG123_BAD_FILE         ; File access error.
    MPG123_NO_SEEK          ; Seek not supported by stream.
    MPG123_NO_READER        ; No stream opened.
    MPG123_BAD_PARS         ; Bad parameter handle.
    MPG123_BAD_INDEX_PAR    ; Bad parameters to mpg123_index() and mpg123_set_index()
    MPG123_OUT_OF_SYNC      ; Lost track in bytestream and did not try to resync.
    MPG123_RESYNC_FAIL      ; Resync failed to find valid MPEG data.
    MPG123_NO_8BIT          ; No 8bit encoding possible.
    MPG123_BAD_ALIGN        ; Stack aligmnent error
    MPG123_NULL_BUFFER      ; NULL input buffer with non-zero size...
    MPG123_NO_RELSEEK       ; Relative seek not possible (screwed up file offset)
    MPG123_NULL_POINTER     ; You gave a null pointer somewhere where you shouldn't have.
    MPG123_BAD_KEY          ; Bad key value given.
    MPG123_NO_INDEX         ; No frame index in this build.
    MPG123_INDEX_FAIL       ; Something with frame index went wrong.
    MPG123_BAD_DECODER_SETUP; Something prevents a proper decoder setup
    MPG123_MISSING_FEATURE  ; This feature has not been built into libmpg123.
    MPG123_BAD_VALUE        ; A bad value has been given somewhere.
    MPG123_LSEEK_FAILED     ; Low-level seek failed.
    MPG123_BAD_CUSTOM_IO    ; Custom I/O not prepared.
    MPG123_LFS_OVERFLOW     ; Offset value overflow during translation of large file API calls -- your client program cannot handle that large file.
    MPG123_INT_OVERFLOW     ; Some integer overflow.
]

#enum mpg123_parms! [
    ;- Enumeration of the parameters types that it is possible to set/get.
    MPG123_VERBOSE: 0     ; set verbosity value for enabling messages to stderr, >= 0 makes sense (integer)
    MPG123_FLAGS          ; set all flags, p.ex val = MPG123_GAPLESS|MPG123_MONO_MIX (integer)
    MPG123_ADD_FLAGS      ; add some flags (integer)
    MPG123_FORCE_RATE     ; when value > 0, force output rate to that value (integer)
    MPG123_DOWN_SAMPLE    ; 0=native rate, 1=half rate, 2=quarter rate (integer)
    MPG123_RVA            ; one of the RVA choices above (integer)
    MPG123_DOWNSPEED      ; play a frame N times (integer)
    MPG123_UPSPEED        ; play every Nth frame (integer)
    MPG123_START_FRAME    ; start with this frame (skip frames before that, integer) 
    MPG123_DECODE_FRAMES  ; decode only this number of frames (integer)
    MPG123_ICY_INTERVAL   ; stream contains ICY metadata with this interval (integer)
    MPG123_OUTSCALE       ; the scale for output samples (amplitude - integer or float according to mpg123 output format, normally integer)
    MPG123_TIMEOUT        ; timeout for reading from a stream (not supported on win32, integer)
    MPG123_REMOVE_FLAGS   ; remove some flags (inverse of MPG123_ADD_FLAGS, integer)
    MPG123_RESYNC_LIMIT   ; Try resync on frame parsing for that many bytes or until end of stream (<0 ... integer). This can enlarge the limit for skipping junk on beginning, too (but not reduce it). 
    MPG123_INDEX_SIZE     ; Set the frame index size (if supported). Values <0 mean that the index is allowed to grow dynamically in these steps (in positive direction, of course) -- Use this when you really want a full index with every individual frame.
    MPG123_PREFRAMES      ; Decode/ignore that many frames in advance for layer 3. This is needed to fill bit reservoir after seeking, for example (but also at least one frame in advance is needed to have all "normal" data for layer 3). Give a positive integer value, please.
    MPG123_FEEDPOOL       ; For feeder mode, keep that many buffers in a pool to avoid frequent malloc/free. The pool is allocated on mpg123_open_feed(). If you change this parameter afterwards, you can trigger growth and shrinkage during decoding. The default value could change any time. If you care about this, then set it. (integer)
    MPG123_FEEDBUFFER     ; Minimal size of one internal feeder buffer, again, the default value is subject to change. (integer)
]

#enum mpg123_param_flags! [
    ;- Flag bits for MPG123_FLAGS, use the usual binary or to combine.
     MPG123_FORCE_MONO:     07h ; 0111 Force some mono mode: This is a test bitmask for seeing if any mono forcing is active.
    MPG123_MONO_LEFT:       01h ; 0001 Force playback of left channel only. 
    MPG123_MONO_RIGHT:      02h ; 0010 Force playback of right channel only.
    MPG123_MONO_MIX:        04h ; 0100 Force playback of mixed mono.        
    MPG123_FORCE_STEREO:    08h ; 1000 Force stereo output.                 
    MPG123_FORCE_8BIT:      10h ; 00010000 Force 8bit formats.                  
    MPG123_QUIET:           20h ; 00100000 Suppress any printouts (overrules verbose).                   
    MPG123_GAPLESS:         40h ; 01000000 Enable gapless decoding (default on if libmpg123 has support).
    MPG123_NO_RESYNC:       80h ; 10000000 Disable resync stream after error.                            
    MPG123_SEEKBUFFER:          0100h ; 000100000000 Enable small buffer on non-seekable streams to allow some peek-ahead (for better MPEG sync).
    MPG123_FUZZY:               0200h ; 001000000000 Enable fuzzy seeks (guessing byte offsets or using approximate seek points from Xing TOC)
    MPG123_FORCE_FLOAT:         0400h ; 010000000000 Force floating point output (32 or 64 bits depends on mpg123 internal precision).
    MPG123_PLAIN_ID3TEXT:       0800h ; 100000000000 Do not translate ID3 text data to UTF-8. ID3 strings will contain the raw text data, with the first byte containing the ID3 encoding code.
    MPG123_IGNORE_STREAMLENGTH: 1000h ; 1000000000000 Ignore any stream length information contained in the stream, which can be contained in a 'TLEN' frame of an ID3v2 tag or a Xing tag
    MPG123_SKIP_ID3V2:          2000h ; 10 0000 0000 0000 Do not parse ID3v2 tags, just skip them.
    MPG123_IGNORE_INFOFRAME:    4000h ; 100 0000 0000 0000 Do not parse the LAME/Xing info frame, treat it as normal MPEG data.
    MPG123_AUTO_RESAMPLE:       8000h ; 1000 0000 0000 0000 Allow automatic internal resampling of any kind (default on if supported). Especially when going lowlevel with replacing output buffer, you might want to unset this flag. Setting MPG123_DOWNSAMPLE or MPG123_FORCE_RATE will override this.
    MPG123_PICTURE:         00010000h ; 17th bit: Enable storage of pictures from tags (ID3v2 APIC).
    MPG123_NO_PEEK_END:     00020000h ; 18th bit: Do not seek to the end of
     ; the stream in order to probe
     ; the stream length and search for the id3v1 field. This also means
     ; the file size is unknown unless set using mpg123_set_filesize() and
     ; the stream is assumed as non-seekable unless overridden.
    MPG123_FORCE_SEEKABLE:  00040000h ; 19th bit: Force the stream to be seekable.
]

#enum mpg123_param_rva! [
    ;- choices for MPG123_RVA
    MPG123_RVA_OFF:   0 ; RVA disabled (default).  
    MPG123_RVA_MIX:   1 ; Use mix/track/radio gain.
    MPG123_RVA_ALBUM: 2 ; Use album/audiophile gain
    MPG123_RVA_MAX:   2 ; The maximum RVA code, may increase in future.
]

#enum mpg123_feature_set! [
    ;- Feature set available for query with mpg123_feature.
    MPG123_FEATURE_ABI_UTF8OPEN: 0   ; mpg123 expects path names to be given in UTF-8 encoding instead of plain native.
    MPG123_FEATURE_OUTPUT_8BIT       ; 8bit output  
    MPG123_FEATURE_OUTPUT_16BIT      ; 16bit output 
    MPG123_FEATURE_OUTPUT_32BIT      ; 32bit output 
    MPG123_FEATURE_INDEX             ; support for building a frame index for accurate seeking
    MPG123_FEATURE_PARSE_ID3V2       ; id3v2 parsing
    MPG123_FEATURE_DECODE_LAYER1     ; mpeg layer-1 decoder enabled
    MPG123_FEATURE_DECODE_LAYER2     ; mpeg layer-2 decoder enabled
    MPG123_FEATURE_DECODE_LAYER3     ; mpeg layer-3 decoder enabled
    MPG123_FEATURE_DECODE_ACCURATE   ; accurate decoder rounding   
    MPG123_FEATURE_DECODE_DOWNSAMPLE ; downsample (sample omit)    
    MPG123_FEATURE_DECODE_NTOM       ; flexible rate decoding      
    MPG123_FEATURE_PARSE_ICY         ; ICY support                 
    MPG123_FEATURE_TIMEOUT_READ      ; Reader with timeout (network).
    MPG123_FEATURE_EQUALIZER         ; tunable equalizer
]

#enum mpg123_channelcount! [
    MPG123_MONO:    1 ; mono
    MPG123_STEREO:  2 ; stereo
]

#enum mpg123_enc_enum! [
; 0000 0000 0000 1111 Some 8 bit  integer encoding.
   MPG123_ENC_8:      000Fh
; 0000 0000 0100 0000 Some 16 bit integer encoding.
   MPG123_ENC_16:     0040h
; 0100 0000 0000 0000 Some 24 bit integer encoding.
   MPG123_ENC_24:     4000h 
; 0000 0001 0000 0000 Some 32 bit integer encoding.
   MPG123_ENC_32:     0100h  
; 0000 0000 1000 0000 Some signed integer encoding.
   MPG123_ENC_SIGNED: 0080h  
; 0000 1110 0000 0000 Some float encoding.
   MPG123_ENC_FLOAT:  0E00h  
; 0000 0000 1101 0000 signed 16 bit
   MPG123_ENC_SIGNED_16:   00D0h ;(MPG123_ENC_16|MPG123_ENC_SIGNED|0x10)
; 0000 0000 0110 0000 unsigned 16 bit
   MPG123_ENC_UNSIGNED_16: 0060h ;(MPG123_ENC_16|0x20)
; 0000 0000 0000 0001 unsigned 8 bit
   MPG123_ENC_UNSIGNED_8:  0001h
; 0000 0000 1000 0010 signed 8 bit
   MPG123_ENC_SIGNED_8:    0082h ;(MPG123_ENC_SIGNED|0x02)
; 0000 0000 0000 0100 ulaw 8 bit
   MPG123_ENC_ULAW_8:      0004h
; 0000 0000 0000 1000 alaw 8 bit
   MPG123_ENC_ALAW_8:      0008h
; 0001 0001 1000 0000 signed 32 bit
   MPG123_ENC_SIGNED_32:   1180h ;MPG123_ENC_32|MPG123_ENC_SIGNED|0x1000
; 0010 0001 0000 0000 unsigned 32 bit
   MPG123_ENC_UNSIGNED_32: 2100h ;MPG123_ENC_32|0x2000
; 0101 0000 1000 0000 signed 24 bit
   MPG123_ENC_SIGNED_24:   5080h ;MPG123_ENC_24|MPG123_ENC_SIGNED|0x1000
; 0110 0000 0000 0000 unsigned 24 bit
   MPG123_ENC_UNSIGNED_24: 6000h ;MPG123_ENC_24|0x2000
; 0000 0010 0000 0000 32bit float
   MPG123_ENC_FLOAT_32:    0200h
; 0000 0100 0000 0000 64bit float
   MPG123_ENC_FLOAT_64:    0400h
; Any possibly known encoding from the list above.
;   MPG123_ENC_ANY = ( MPG123_ENC_SIGNED_16  | MPG123_ENC_UNSIGNED_16
;                     | MPG123_ENC_UNSIGNED_8 | MPG123_ENC_SIGNED_8
;                     | MPG123_ENC_ULAW_8     | MPG123_ENC_ALAW_8
;                     | MPG123_ENC_SIGNED_32  | MPG123_ENC_UNSIGNED_32
;                     | MPG123_ENC_SIGNED_24  | MPG123_ENC_UNSIGNED_24
;                     | MPG123_ENC_FLOAT_32   | MPG123_ENC_FLOAT_64    )
]

#enum mpg123_channels! [
    ;another channel enumeration, for left/right choice
    MPG123_LEFT:  01h  ; The Left Channel.
    MPG123_RIGHT: 02h  ; The Right Channel.
    MPG123_LR:    03h  ; Both left and right channel; same as MPG123_LEFT|MPG123_RIGHT
]

#enum mpg123_vbr! [
    ;Enumeration of the mode types of Variable Bitrate
    MPG123_CBR ; Constant Bitrate Mode (default)
    MPG123_VBR ; Variable Bitrate Mode
    MPG123_ABR ; Average Bitrate Mode
]

#enum mpg123_version! [
    ;Enumeration of the MPEG Versions
    MPG123_1_0 ; MPEG Version 1.0
    MPG123_2_0 ; MPEG Version 2.0
    MPG123_2_5 ; MPEG Version 2.5
]

#enum mpg123_mode! [
    ;Enumeration of the MPEG Audio mode.
    ;Only the mono mode has 1 channel, the others have 2 channels
    MPG123_M_STEREO ; Standard Stereo.
    MPG123_M_JOINT  ; Joint Stereo.
    MPG123_M_DUAL   ; Dual Channel.
    MPG123_M_MONO   ; Single Channel.
]

#enum mpg123_flags! [
    ;Enumeration of the MPEG Audio flag bits
    MPG123_CRC:       01h ; The bitstream is error protected using 16-bit CRC.
    MPG123_COPYRIGHT: 02h ; The bitstream is copyrighted.
    MPG123_PRIVATE:   04h ; The private bit has been set.
    MPG123_ORIGINAL:  08h ; The bitstream is an original, not a copy.
]

#enum mpg123_state! [
    ;The key values for state information from `mpg123_getstate`.
    MPG123_ACCURATE: 1   ; Query if positons are currently accurate (integer value, 0 if false, 1 if true).
    MPG123_BUFFERFILL    ; Get fill of internal (feed) input buffer as integer byte count returned as long and as double. An error is returned on integer overflow while converting to (signed) long, but the returned floating point value shold still be fine.
    MPG123_FRANKENSTEIN  ; Stream consists of carelessly stitched together files. Seeking may yield unexpected results (also with MPG123_ACCURATE, it may be confused).
    MPG123_FRESH_DECODER ; Decoder structure has been updated, possibly indicating changed stream (integer value, 0 if false, 1 if true). Flag is cleared after retrieval.
]

#enum mpg123_text_encoding! [
    ;The mpg123 text encodings. This contains encodings we encounter in ID3 tags or ICY meta info.
    mpg123_text_unknown:  0 ; Unkown encoding... mpg123_id3_encoding can return that on invalid codes.
    mpg123_text_utf8:     1 ; UTF-8
    mpg123_text_latin1:   2 ; ISO-8859-1. Note that sometimes latin1 in ID3 is abused for totally different encodings.
    mpg123_text_icy:      3 ; ICY metadata encoding, usually CP-1252 but we take it as UTF-8 if it qualifies as such.
    mpg123_text_cp1252:   4 ; Really CP-1252 without any guessing.
    mpg123_text_utf16:    5 ; Some UTF-16 encoding. The last of a set of leading BOMs (byte order mark) rules.
                            ;   When there is no BOM, big endian ordering is used. Note that UCS-2 qualifies as UTF-8 when
                            ;   you don't mess with the reserved code points. If you want to decode little endian data
                            ;   without BOM you need to prepend 0xff 0xfe yourself.
    mpg123_text_utf16bom: 6 ; Just an alias for UTF-16, ID3v2 has this as distinct code.
    mpg123_text_utf16be:  7 ; Another alias for UTF16 from ID3v2. Note, that, because of the mess that is reality,
                            ;   BOMs are used if encountered. There really is not much distinction between the UTF16 types for mpg123
                            ;   One exception: Since this is seen in ID3v2 tags, leading null bytes are skipped for all other UTF16
                            ;   types (we expect a BOM before real data there), not so for utf16be!
    mpg123_text_max:      7 ; Placeholder for the maximum encoding value.
]

#enum mpg123_id3_enc! [
    ;The encoding byte values from ID3v2.
    mpg123_id3_latin1:    0 ; Note: This sometimes can mean anything in practice...
    mpg123_id3_utf16bom:  1 ; UTF16, UCS-2 ... it's all the same for practical purposes.
    mpg123_id3_utf16be:   2 ; Big-endian UTF-16, BOM see note for mpg123_text_utf16be.
    mpg123_id3_utf8:      3 ; Our lovely overly ASCII-compatible 8 byte encoding for the world.
    mpg123_id3_enc_max:   3 ; Placeholder to check valid range of encoding byte.
]

#enum mpg123_id3_pic_type! [
    ;The picture type values from ID3v2.
    mpg123_id3_pic_other:            0 ; see ID3v2 docs */
    mpg123_id3_pic_icon:             1 ; see ID3v2 docs */
    mpg123_id3_pic_other_icon:       2 ; see ID3v2 docs */
    mpg123_id3_pic_front_cover:      3 ; see ID3v2 docs */
    mpg123_id3_pic_back_cover:       4 ; see ID3v2 docs */
    mpg123_id3_pic_leaflet:          5 ; see ID3v2 docs */
    mpg123_id3_pic_media:            6 ; see ID3v2 docs */
    mpg123_id3_pic_lead:             7 ; see ID3v2 docs */
    mpg123_id3_pic_artist:           8 ; see ID3v2 docs */
    mpg123_id3_pic_conductor:        9 ; see ID3v2 docs */
    mpg123_id3_pic_orchestra:       10 ; see ID3v2 docs */
    mpg123_id3_pic_composer:        11 ; see ID3v2 docs */
    mpg123_id3_pic_lyricist:        12 ; see ID3v2 docs */
    mpg123_id3_pic_location:        13 ; see ID3v2 docs */
    mpg123_id3_pic_recording:       14 ; see ID3v2 docs */
    mpg123_id3_pic_performance:     15 ; see ID3v2 docs */
    mpg123_id3_pic_video:           16 ; see ID3v2 docs */
    mpg123_id3_pic_fish:            17 ; see ID3v2 docs */
    mpg123_id3_pic_illustration:    18 ; see ID3v2 docs */
    mpg123_id3_pic_artist_logo:     19 ; see ID3v2 docs */
    mpg123_id3_pic_publisher_logo:  20 ; see ID3v2 docs */
]

mpg123_frameinfo!: alias struct! [
    ;Data structure for storing information about a frame of MPEG Audio
    version   [mpg123_version!] ; The MPEG version (1.0/2.0/2.5).
    layer     [integer!]        ; The MPEG Audio Layer (MP1/MP2/MP3).
    rate      [integer!]        ; The sampling rate in Hz.
    mode      [mpg123_mode!]    ; The audio mode (Mono, Stereo, Joint-stero, Dual Channel).
    mode_ext  [integer!]        ; The mode extension bit flag.
    framesize [integer!]        ; The size of the frame (in bytes, including header).
    flags     [mpg123_flags!]   ; MPEG Audio flag bits. Just now I realize that it should be declared as int, not enum. It's a bitwise combination of the enum values.
    emphasis  [integer!]        ; The emphasis type.
    bitrate   [integer!]        ; Bitrate of the frame (kbps).
    abr_rate  [integer!]        ; The target average bitrate.
    vbr       [mpg123_vbr!]     ; The VBR mode.
]

mpg123_string!: alias struct! [ 
    ;Data structure for storing strings in a safer way than a standard C-String.
    ;Can also hold a number of null-terminated strings.
    p [byte-ptr!]   ; pointer to the string data
    size [integer!] ; raw number of bytes allocated
    fill [integer!] ; number of used bytes (including closing zero byte)
]

mpg123_text!: alias struct! [
    ;Sub data structure for ID3v2, for storing various text fields (including comments).
    ;This is for ID3v2 COMM, TXXX and all the other text fields.
    ;Only COMM and TXXX have a description, only COMM and USLT have a language.
    ;You should consult the ID3v2 specification for the use of the various text fields ("frames" in ID3v2 documentation, I use "fields" here to separate from MPEG frames). */
    lang-id [integer!] 
        ;=  char lang[3]; /**< Three-letter language code (not terminated). */
        ;=  char id[4];   /**< The ID3v2 text field id, like TALB, TPE2, ... (4 characters, no string termination). */
    description [mpg123_string!] ; Empty for the generic comment... */
    text        [mpg123_string!] ; ... */
]

mpg123_picture!: alias struct! [
    ;Sub data structure for ID3v2, for storing picture data including comment.
    ;This is for the ID3v2 APIC field. You should consult the ID3v2 specification
    ;for the use of the APIC field ("frames" in ID3v2 documentation, I use "fields"
    ;here to separate from MPEG frames). */
    type        [byte!]           ; mpg123_id3_pic_type value */
    description [mpg123_string!]  ; description string */
    mime_type   [mpg123_string!]  ; MIME type */
    size        [integer!]        ; size in bytes */
    data        [byte-ptr!]       ; pointer to the image data */
]

mpg123_id3v2!: alias struct! [
    ;Data structure for storing IDV3v2 tags.
    ;This structure is not a direct binary mapping with the file contents.
    ;The ID3v2 text frames are allowed to contain multiple strings.
    ;So check for null bytes until you reach the mpg123_string fill.
    ;All text is encoded in UTF-8. */
    version  [byte!]; /**< 3 or 4 for ID3v2.3 or ID3v2.4. */
    title    [mpg123_string!]    ; Title string (pointer into text_list). */
    artist   [mpg123_string!]    ; Artist string (pointer into text_list). */
    album    [mpg123_string!]    ; Album string (pointer into text_list). */
    year     [mpg123_string!]    ; The year as a string (pointer into text_list). */
    genre    [mpg123_string!]    ; Genre String (pointer into text_list). The genre string(s) may very well need postprocessing, esp. for ID3v2.3. */
    comment  [mpg123_string!]    ; Pointer to last encountered comment text with empty description. */
    ; Encountered ID3v2 fields are appended to these lists.
    ; There can be multiple occurences, the pointers above always point to the last encountered data. */
    comment_list [mpg123_text!]    ; Array of comments. */
    comments     [integer!]        ; Number of comments. */
    text         [mpg123_text!]    ; Array of ID3v2 text fields (including USLT) */
    texts        [integer!]        ; Numer of text fields. */
    extra        [mpg123_text!]    ; The array of extra (TXXX) fields. */
    extras       [integer!]        ; Number of extra text (TXXX) fields. */
    picture      [mpg123_picture!] ; Array of ID3v2 pictures fields (APIC). */
    pictures     [integer!]        ; Number of picture (APIC) fields. */
]

mpg123_id3v1!: alias struct! [
    ;Data structure for ID3v1 tags (the last 128 bytes of a file).
    ;Don't take anything for granted (like string termination)!
    ;Also note the change ID3v1.1 did: comment[28] = 0; comment[29] = track_number
    ;It is your task to support ID3v1 only or ID3v1.1 ...*/
    ;@@ current Red does not support such a constructs yet :/ use as byte-ptr! and get data using pointer math
    data [integer!]
    ;= char tag[3];         /**< Always the string "TAG", the classic intro. */
    ;= char title[30];      /**< Title string.  */
    ;= char artist[30];     /**< Artist string. */
    ;= char album[30];      /**< Album string. */
    ;= char year[4];        /**< Year string. */
    ;= char comment[30];    /**< Comment string. */
    ;= unsigned char genre; /**< Genre index. */
]

#define MPG123_ID3     03h ; 0011 There is some ID3 info. Also matches 0010 or NEW_ID3. */
#define MPG123_NEW_ID3 01h ; 0001 There is ID3 info that changed since last call to mpg123_id3. */
#define MPG123_ICY     0Ch ; 1100 There is some ICY info. Also matches 0100 or NEW_ICY.*/
#define MPG123_NEW_ICY 04h ; 0100 There is ICY info that changed since last call to mpg123_icy. */

get-encoding-name: func[encoding [mpg123_enc_enum!] return: [c-string!]][
    switch encoding [
        MPG123_ENC_8           ["8"]
        MPG123_ENC_16          ["16"]
        MPG123_ENC_24          ["24"]
        MPG123_ENC_32          ["32"]
        MPG123_ENC_SIGNED      ["SIGNED"]
        MPG123_ENC_FLOAT       ["FLOAT"]
        MPG123_ENC_SIGNED_16   ["SIGNED_16"]
        MPG123_ENC_UNSIGNED_16 ["UNSIGNED_16"]
        MPG123_ENC_UNSIGNED_8  ["UNSIGNED_8"]
        MPG123_ENC_SIGNED_8    ["SIGNED_8"]
        MPG123_ENC_ULAW_8      ["ULAW_8"]
        MPG123_ENC_ALAW_8      ["ALAW_8"]
        MPG123_ENC_SIGNED_32   ["SIGNED_32"]
        MPG123_ENC_UNSIGNED_32 ["UNSIGNED_32"]
        MPG123_ENC_SIGNED_24   ["SIGNED_24"]
        MPG123_ENC_UNSIGNED_24 ["UNSIGNED_24"]
        MPG123_ENC_FLOAT_32    ["FLOAT_32"]
        MPG123_ENC_FLOAT_64    ["FLOAT_64"]
        default ["unknown"]
    ]
]

#import [
	MPG123_LIBRARY cdecl [
		mpg123_init: "mpg123_init"[
			; Function to initialise the mpg123 library. 
			return:  [mpg123-errors!] ;return MPG123_OK if successful, otherwise an error number.
		]
        mpg123_exit: "mpg123_exit" [
            ; Function to close down the mpg123 library.
            return:  [mpg123-errors!]
        ]
		mpg123_new: "mpg123_new" [
            ; Create a handle with optional choice of decoder (named by a string, see mpg123_decoders() or mpg123_supported_decoders()).
            ; and optional retrieval of an error code to feed to mpg123_plain_strerror().
            ; Optional means: Any of or both the parameters may be NULL.
            decoder [c-string!] ;decoder optional choice of decoder variant (NULL for default)
            error   [int-ptr!]  ;error optional address to store error codes
            return: [mpg123!]   ;Non-NULL pointer to fresh handle when successful.
        ]
        mpg123_delete: "mpg123_delete" [
            ; Delete handle
            mh [mpg123!] ;valid mpg123 handle or NULL.
        ]
        mpg123_param: "mpg123_param" [
            ; Set a specific parameter, for a specific mpg123_handle, using a parameter 
            ; type key chosen from the mpg123_parms enumeration, to the specified value.
            mh       [mpg123!]
            type     [mpg123_parms!] ; parameter choice
            value    [integer!]
            fvalue   [float!]
            return:  [mpg123-errors!] ; MPG123_OK on success
        ]
        mpg123_getparam: "mpg123_getparam" [
            ; Get a specific parameter, for a specific mpg123_handle. 
            ; See the mpg123_parms enumeration for a list of available parameters.
            mh       [mpg123!]
            type     [mpg123_parms!] ; parameter choice
            value    [integer!]
            fvalue   [float!]
            return:  [mpg123-errors!] ; MPG123_OK on success
        ]
        mpg123_feature: "mpg123_feature" [
            ; Query libmpg123 features
            key [mpg123_feature_set!]
            return: [integer!] ; 1 for success, 0 for unimplemented functions
        ]
        mpg123_plain_strerror: "mpg123_plain_strerror" [
            ; Look up error strings given integer code.
            errcode [mpg123-errors!]
            return: [c-string!]
        ]
        mpg123_strerror: "mpg123_strerror" [
            ; Give string describing what error has occured in the context of handle mh.
            ; When a function operating on an mpg123 handle returns MPG123_ERR, you should check for the actual reason via
            ; char *errmsg = mpg123_strerror(mh)
            ; This function will catch mh == NULL and return the message for MPG123_BAD_HANDLE.
            mh      [mpg123!]
            return: [c-string!]
        ]
        mpg123_errcode: "mpg123_errcode" [
            ; Return the plain errcode intead of a string.
            mh      [mpg123!]
            return: [mpg123-errors!]
        ]

        ;- Functions to list and select the available decoders.
        ;- Perhaps the most prominent feature of mpg123: You have several (optimized) decoders to choose from (on x86 and PPC (MacOS) systems, that is).

        mpg123_decoders: "mpg123_decoders" [
            ; Get available decoder list.
            return: [int-ptr!] ; NULL-terminated array of generally available decoder names (plain 8bit ASCII)
        ]
        mpg123_supported_decoders: "mpg123_supported_decoders" [
            ; Get supported decoder list.
            return: [int-ptr!] ; NULL-terminated array of the decoders supported by the CPU (plain 8bit ASCII)
        ]
        mpg123_decoder: "mpg123_decoder" [
            ; Set the active decoder.
            mh           [mpg123!]
            decoder_name [c-string!]
            return: [mpg123-errors!] ; MPG123_OK on success
        ]
        mpg123_current_decoder: "mpg123_current_decoder" [
            ; Get the currently active decoder name.
            ; The active decoder engine can vary depening on output constraints,
            ; mostly non-resampling, integer output is accelerated via 3DNow & Co. but for
            ; other modes a fallback engine kicks in.
            ; Note that this can return a decoder that is only active in the hidden and not
            ; available as decoder choice from the outside.
            mh      [mpg123!]
            return: [c-string!]
        ]

        ;- Functions to get and select the format of the decoded audio.
        ; Before you dive in, please be warned that you might get confused by this. This seems to happen a lot, 
        ; therefore I am trying to explain in advance.
        
        ; The mpg123 library decides what output format to use when encountering the first frame in a stream, 
        ; or actually any frame that is still valid but differs from the frames before in the prompted output format.
        ; At such a deciding point, an internal table of allowed encodings, sampling rates and channel setups is consulted.
        ; According to this table, an output format is chosen and the decoding engine set up accordingly
        ; (including optimized routines for different output formats). This might seem unusual but it just follows
        ; from the non-existence of "MPEG audio files" with defined overall properties. There are streams, streams are
        ; concatenations of (semi) independent frames. We store streams on disk and call them "MPEG audio files",
        ; but that does not change their nature as the decoder is concerned (the LAME/Xing header for gapless decoding
        ; makes things interesting again).

        ; To get to the point: What you do with `mpg123_format` and friends is to fill the internal table of allowed
        ; formats before it is used. That includes removing support for some formats or adding your forced sample rate
        ; (see MPG123_FORCE_RATE) that will be used with the crude internal resampler. Also keep in mind that the sample
        ; encoding is just a question of choice -- the MPEG frames do only indicate their native sampling rate and channel count.
        ; If you want to decode to integer or float samples, 8 or 16 bit ... that is your decision. In a "clean" world, libmpg123
        ; would always decode to 32 bit float and let you handle any sample conversion. But there are optimized routines that
        ; work faster by directly decoding to the desired encoding / accuracy. We prefer efficiency over conceptual tidyness.

        ; People often start out thinking that `mpg123_format` should change the actual decoding format on the fly. That is wrong.
        ; It only has effect on the next natural change of output format, when libmpg123 will consult its format table again.
        ; To make life easier, you might want to call `mpg123_format_none` before any thing else and then just allow one desired
        ; encoding and a limited set of sample rates / channel choices that you actually intend to deal with.
        ; You can force libmpg123 to decode everything to 44100 KHz, stereo, 16 bit integer ... it will duplicate mono channels
        ; and even do resampling if needed (unless that feature is disabled in the build, same with some encodings).
        ; But I have to stress that the resampling of libmpg123 is very crude and doesn't even contain any kind of "proper" interpolation.
        
        ; In any case, watch out for MPG123_NEW_FORMAT as return message from decoding routines and call `mpg123_getformat`
        ; to get the currently active output format.

        mpg123_rates: "mpg123_rates" [
            ; An array of supported standard sample rates
            ; These are possible native sample rates of MPEG audio files.
            ; You can still force mpg123 to resample to a different one, but by default you will only get audio in one of these samplings.
            list [int-ptr!]   ; Store a pointer to the sample rates array there.
            number [int-ptr!] ; Store the number of sample rates there.
        ]
        mpg123_encodings: "mpg123_encodings" [
            ; An array of supported audio encodings.
            ; An audio encoding is one of the fully qualified members of mpg123_enc_enum (MPG123_ENC_SIGNED_16, not MPG123_SIGNED).
            list [int-ptr!]   ; Store a pointer to the encodings array there.
            number [int-ptr!] ; Store the number of encodings there.
        ]
        mpg123_encsize: "mpg123_encsize" [
            ; Return the size (in bytes) of one mono sample of the named encoding.
            encoding [integer!] ; The encoding value to analyze.
            return:  [integer!]
        ]
        mpg123_format_none: "mpg123_format_none" [
            ; Configure a mpg123 handle to accept no output format at all, 
            ; use before specifying supported formats with mpg123_format
            mh      [mpg123!]
            return: [mpg123-errors!] ; MPG123_OK on success
        ]
        mpg123_format_all: "mpg123_format_all" [
            ; Configure mpg123 handle to accept all formats 
            ; (also any custom rate you may set) -- this is default.
            mh      [mpg123!]
            return: [mpg123-errors!] ; MPG123_OK on success
        ]
        mpg123_format: "mpg123_format" [
            ; Set the audio format support of a mpg123_handle in detail
            mh        [mpg123!]
            rate      [integer!] ;long!
            channels  [mpg123_channelcount!]
            encodings [integer!] ; A combination of accepted encodings for rate and channels, p.ex MPG123_ENC_SIGNED16 | MPG123_ENC_ULAW_8 (or 0 for no support).
            ; Please note that some encodings may not be supported in the library build and thus will be ignored here.
            return: [mpg123-errors!] ; MPG123_OK on success, MPG123_ERR if there was an error
        ]
        mpg123_format_support: "mpg123_format_support" [
            ; Check to see if a specific format at a specific rate is supported by mpg123_handle.
            mh        [mpg123!]
            rate      [integer!] ;long!
            encodings [integer!]
            return: [integer!] ; 0 for no support (that includes invalid parameters), MPG123_STEREO, MPG123_MONO or MPG123_STEREO|MPG123_MONO.
        ]
        mpg123_getformat: "mpg123_getformat" [
            ; Get the current output format written to the addresses given.
            ; If the stream is freshly loaded, this will try to parse enough
            ; of it to give you the format to come. This clears the flag that
            ; would otherwise make the first decoding call return MPG123_NEW_FORMAT.
            mh       [mpg123!]
            rate     [int-ptr!] ;long!
            channels [int-ptr!]
            encoding [int-ptr!] ; encoding return address
            return: [mpg123-errors!] ; MPG123_OK on success
        ]
        mpg123_getformat2: "mpg123_getformat2" [
            ; Get the current output format written to the addresses given.
            ; This differs from plain mpg123_getformat() in that you can choose
            ; _not_ to clear the flag that would trigger the next decoding call
            ; to return MPG123_NEW_FORMAT in case of a new format arriving.
            mh       [mpg123!]
            rate     [int-ptr!] ;long!
            channels [int-ptr!]
            encoding [int-ptr!] ; encoding return address
            clear_flag [integer!] ; if true, clear internal format flag
            return: [mpg123-errors!] ; MPG123_OK on success
        ]

        ;- Functions for input bitstream and decoding operations.
        ;- Decoding/seek functions may also return message codes MPG123_DONE, MPG123_NEW_FORMAT and MPG123_NEED_MORE
        ;- (please read up on these on how to react!).

        mpg123_open: "mpg123_open" [
            ; Open and prepare to decode the specified file by filesystem path.
            ; This does not open HTTP urls; libmpg123 contains no networking code.
            ; If you want to decode internet streams, use `mpg123_open_fd` or `mpg123_open_feed`.
            mh      [mpg123!]
            path    [c-string!]
            return: [mpg123-errors!]
        ]
        mpg123_open_fd: "mpg123_open_fd" [
            ; Use an already opened file descriptor as the bitstream input
            ; `mpg123_close` will _not_ close the file descriptor.
            mh      [mpg123!]
            fd      [integer!] ;file descriptor
            return: [mpg123-errors!]
        ]
        mpg123_open_handle: "mpg123_open_handle" [
            ; Use an opaque handle as bitstream input. This works only with the
            ; replaced I/O from `mpg123_replace_reader_handle`!
            ; `mpg123_close` will call the cleanup callback for your handle (if you gave one).
            mh      [mpg123!]
            iohandle [int-ptr!] ;your handle
            return: [mpg123-errors!]
        ]
        mpg123_open_feed: "mpg123_open_feed" [
            ; Open a new bitstream and prepare for direct feeding
            ; This works together with `mpg123_decode`; you are responsible for reading and feeding the input bitstream.
            mh      [mpg123!]
            return: [mpg123-errors!]
        ]
        mpg123_close: "mpg123_close" [
            ; Closes the source, if libmpg123 opened it.
            mh      [mpg123!]
            return: [mpg123-errors!]
        ]
        mpg123_read: "mpg123_read" [
            ; Read from stream and decode up to outmemsize bytes.
            mh         [mpg123!]
            outmemory  [byte-ptr!] ;outmemory address of output buffer to write to
            outmemsize [integer!]  ;outmemsize maximum number of bytes to write
            done       [int-ptr!]  ;address to store the number of actually decoded bytes to
            return: [mpg123-errors!]
        ]
        mpg123_feed: "mpg123_feed" [
            ; Feed data for a stream that has been opened with `mpg123_open_feed`.
            ; It's give and take: You provide the bytestream, mpg123 gives you the decoded samples.
            mh   [mpg123!]
            in   [byte-ptr!] ;input buffer
            size [integer!]  ;number of input bytes
            return: [mpg123-errors!]
        ]
        mpg123_decode: "mpg123_decode" [
            ; Decode MPEG Audio from inmemory to outmemory. 
            ; This is very close to a drop-in replacement for old mpglib.
            ; When you give zero-sized output buffer the input will be parsed until 
            ; decoded data is available. This enables you to get MPG123_NEW_FORMAT (and query it) 
            ; without taking decoded data.
            ; Think of this function being the union of `mpg123_read` and `mpg123_feed` (which it actually is, sort of;-).
            ; You can actually always decide if you want those specialized functions in separate steps or one call this one here.
            mh   [mpg123!]
            inmemory   [byte-ptr!] ;input buffer
            inmemsize  [integer!]  ;number of input bytes
            outmemory  [byte-ptr!] ;output buffer
            outmemsize [integer!]  ;maximum number of output bytes
            done       [int-ptr!]  ;address to store the number of actually decoded bytes to
            return: [mpg123-errors!]
        ]
        mpg123_decode_frame: "mpg123_decode_frame" [
            ; Decode next MPEG frame to internal buffer
            ; or read a frame and return after setting a new format.
            mh    [mpg123!]
            num   [int-ptr!] ;current frame offset gets stored there
            audio [int-ptr!] ;This pointer is set to the internal buffer to read the decoded audio from.
            bytes [int-ptr!] ;number of output bytes ready in the buffer
            return: [mpg123-errors!]
        ]
        mpg123_framebyframe_decode: "mpg123_framebyframe_decode" [
            ; Decode current MPEG frame to internal buffer.
            ;@@ Warning: This is experimental API that might change in future releases!
            ;@@ Please watch mpg123 development closely when using it.
            mh    [mpg123!]
            num   [int-ptr!] ;last frame offset gets stored there
            audio [int-ptr!] ;This pointer is set to the internal buffer to read the decoded audio from.
            bytes [int-ptr!] ;number of output bytes ready in the buffer
            return: [mpg123-errors!]
        ]
        mpg123_framebyframe_next: "mpg123_framebyframe_next" [
            ; Find, read and parse the next mp3 frame
            ;@@ Warning: This is experimental API that might change in future releases!
            ;@@ Please watch mpg123 development closely when using it.
            mh      [mpg123!]
            return: [mpg123-errors!]
        ]
        mpg123_framedata: "mpg123_framedata" [
            ; Get access to the raw input data for the last parsed frame.
            ; This gives you a direct look (and write access) to the frame body data.
            ; Together with the raw header, you can reconstruct the whole raw MPEG stream without junk and meta data,
            ; or play games by actually modifying the frame body data before decoding this frame (`mpg123_framebyframe_decode`).
            ; A more sane use would be to use this for CRC checking (see `mpg123_info` and MPG123_CRC), the first two bytes of the body make up the CRC16 checksum, if present.
            ; You can provide NULL for a parameter pointer when you are not interested in the value.
            mh        [mpg123!]
            header    [int-ptr!] ;the 4-byte MPEG header
            bodydata  [int-ptr!] ;pointer to the frame body stored in the handle (without the header)
            bodybytes [int-ptr!] ;size of frame body in bytes (without the header)
            return: [mpg123-errors!] ;MPG123_OK if there was a yet un-decoded frame to get the
                                ;  data from, MPG123_BAD_HANDLE or MPG123_ERR otherwise (without further
                                ;  explanation, the error state of the mpg123_handle is not modified by
                                ;  this function).
        ]
        mpg123_framepos: "mpg123_framepos" [
            ; Get the input position (byte offset in stream) of the last parsed frame.
            ; This can be used for external seek index building, for example.
            ; It just returns the internally stored offset, regardless of validity --
            ; you ensure that a valid frame has been parsed before!
            mh      [mpg123!]
            return: [integer!]
        ]

        ;--  Functions querying and manipulating position in the decoded audio bitstream.
        ; The position is measured in decoded audio samples, or MPEG frame offset for the specific functions.
        ; If gapless code is in effect, the positions are adjusted to compensate the skipped padding/delay - meaning, you should not care about that at all and just use the position defined for the samples you get out of the decoder;-)
        ; The general usage is modelled after stdlib's ftell() and fseek().
        ; Especially, the whence parameter for the seek functions has the same meaning as the one for fseek() and needs the same constants from stdlib.h: 
        ; - SEEK_SET: set position to (or near to) specified offset
        ; - SEEK_CUR: change position by offset from now
        ; - SEEK_END: set position to offset from end
        ;
        ; Note that sample-accurate seek only works when gapless support has been enabled at compile time; seek is frame-accurate otherwise.
        ; Also, really sample-accurate seeking (meaning that you get the identical sample value after seeking compared to plain decoding up to the position) is only guaranteed when you do not mess with the position code by using MPG123_UPSPEED, MPG123_DOWNSPEED or MPG123_START_FRAME. The first two mainly should cause trouble with NtoM resampling, but in any case with these options in effect, you have to keep in mind that the sample offset is not the same as counting the samples you get from decoding since mpg123 counts the skipped samples, too (or the samples played twice only once)!
        ; Short: When you care about the sample position, don't mess with those parameters;-)
        ; Also, seeking is not guaranteed to work for all streams (underlying stream may not support it).
        ; And yet another caveat: If the stream is concatenated out of differing pieces (Frankenstein stream), seeking may suffer, too.

        mpg123_tell: "mpg123_tell" [
            ; Returns the current position in samples.
            ; On the next successful read, you'd get that sample.
            mh      [mpg123!]
            return: [integer!] ;off_t - sample offset or MPG123_ERR (null handle)
        ]
        mpg123_tellframe: "mpg123_tellframe" [
            ; Returns the frame number that the next read will give you data from.
            mh      [mpg123!]
            return: [integer!] ;off_t - frame offset or MPG123_ERR (null handle)
        ]
        mpg123_tell_stream: "mpg123_tell_stream" [
            ; Returns the current byte offset in the input stream.
            mh      [mpg123!]
            return: [integer!] ;off_t - byte offset or MPG123_ERR (null handle)
        ]
        mpg123_seek: "mpg123_seek" [
            ; Seek to a desired sample offset.
            ; Usage is modelled afer the standard `lseek`.
            mh      [mpg123!]
            sampleoff [integer!] ;offset in PCM samples
            whence  [integer!]   ;one of SEEK_SET, SEEK_CUR or SEEK_END
            return: [integer!] ;The resulting offset >= 0 or error/message code
        ]
        mpg123_feedseek: "mpg123_feedseek" [
            ; Seek to a desired sample offset in data feeding mode. 
            ; This just prepares things to be right only if you ensure that the next chunk of input data will be from input_offset byte position.
            mh      [mpg123!]
            sampleoff [integer!] ;offset in PCM samples
            whence  [integer!]   ;one of SEEK_SET, SEEK_CUR or SEEK_END
            input_offset [int-ptr!] ;The position it expects to be at the next time data is fed to `mpg123_decode`
            return: [integer!] ;The resulting offset >= 0 or error/message code
        ]
        mpg123_seek_frame: "mpg123_seek_frame" [
            ; Seek to a desired MPEG frame offset.
            ; Usage is modelled afer the standard lseek().
            mh      [mpg123!]
            frameoff [integer!] ;offset in MPEG frames
            whence  [integer!]  ;one of SEEK_SET, SEEK_CUR or SEEK_END
            return: [integer!]  ;The resulting offset >= 0 or error/message code
        ]
        mpg123_timeframe: "mpg123_timeframe" [
            ; Return a MPEG frame offset corresponding to an offset in seconds.
            ; This assumes that the samples per frame do not change in the file/stream, which is a good assumption for any sane file/stream only.
            mh      [mpg123!]
            sec     [float!]
            return: [integer!]
        ]
        mpg123_index: "mpg123_index" [
            ; Give access to the frame index table that is managed for seeking.
            ; You are asked not to modify the values... Use `mpg123_set_index` to set the seek index
            mh      [mpg123!]
            offsets [int-ptr!] ;pointer to the index array
            step    [int-ptr!] ;one index byte offset advances this many MPEG frames
            fill    [int-ptr!] ;number of recorded index offsets; size of the array
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_set_index: "mpg123_set_index" [
            ; Set the frame index table
            ; Setting offsets to NULL and fill > 0 will allocate fill entries. Setting offsets
            ; to NULL and fill to 0 will clear the index and free the allocated memory used by the index.
            mh      [mpg123!]
            offsets [int-ptr!] ;pointer to the index array
            step    [integer!] ;one index byte offset advances this many MPEG frames
            fill    [integer!] ;number of recorded index offsets; size of the array
            return: [mpg123-errors!] ;MPG123_OK on success
        ]

        ;-- mpg123 volume and equalizer

        mpg123_eq: "mpg123_eq" [
            ; Set the 32 Band Audio Equalizer settings.
            mh      [mpg123!]
            channel [mpg123_channels!] ;Can be MPG123_LEFT, MPG123_RIGHT or MPG123_LEFT|MPG123_RIGHT for both.
            band    [integer!] ;The equaliser band to change (from 0 to 31)
            val     [float!]
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_geteq: "mpg123_geteq" [
            ; Get the 32 Band Audio Equalizer settings.
            mh      [mpg123!]
            channel [mpg123_channels!] ;Can be MPG123_LEFT, MPG123_RIGHT or MPG123_LEFT|MPG123_RIGHT for both.
            band    [integer!] ;The equaliser band to change (from 0 to 31)
            return: [float!] ;The (linear) adjustment factor (zero for pad parameters)
        ]
        mpg123_reset_eq: "mpg123_reset_eq" [
            ; Reset the 32 Band Audio Equalizer settings to flat
            mh      [mpg123!]
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_volume: "mpg123_volume" [
            ; Set the absolute output volume including the RVA setting, 
            ; vol<0 just applies (a possibly changed) RVA setting.
            mh      [mpg123!]
            vol     [float!] ;volume value (linear factor)
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_volume_change: "mpg123_volume_change" [
            ; Adjust output volume including the RVA setting by chosen amount
            mh      [mpg123!]
            change  [float!] ;volume value (linear factor increment)
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_getvolume: "mpg123_getvolume" [
            ; Return current volume setting, the actual value due to RVA, and the RVA 
            ; adjustment itself. It's all as double float value to abstract the sample 
            ; format. The volume values are linear factors / amplitudes (not percent) 
            ; and the RVA value is in decibels.
            mh      [mpg123!]
            base    [float-ptr!] ;return address for base volume (linear factor)
            really  [float-ptr!] ;return address for actual volume (linear factor)
            rva_db  [float-ptr!] ;return address for RVA value (decibels)
            return: [mpg123-errors!] ;MPG123_OK on success
        ]

        ;-- mpg123 status and information

        mpg123_info: "mpg123_info" [
            ;Get frame information about the MPEG audio bitstream and store it in a mpg123_frameinfo structure.
            mh [mpg123!]
            mi [mpg123_frameinfo!] ;address of existing frameinfo structure to write to
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_safe_buffer: "mpg123_safe_buffer" [
            ;Get the safe output buffer size for all cases
            ; (when you want to replace the internal buffer)
            mh [mpg123!]
            return:  [integer!]
        ]
        mpg123_scan: "mpg123_scan" [
            ; Make a full parsing scan of each frame in the file. ID3 tags are found. An
            ; accurate length value is stored. Seek index will be filled. A seek back to
            ; current position is performed. At all, this function refuses work when
            ; stream is not seekable.
            mh [mpg123!]
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_framelength: "mpg123_framelength" [
            ; Return, if possible, the full (expected) length of current track in frames.
            mh [mpg123!]
            return: [integer!] ;length >= 0 or MPG123_ERR if there is no length guess possible.
        ]
        mpg123_length: "mpg123_length" [
            ; Return, if possible, the full (expected) length of current track in samples.
            mh [mpg123!]
            return: [integer!] ;length >= 0 or MPG123_ERR if there is no length guess possible.
        ]
        mpg123_set_filesize: "mpg123_set_filesize" [
            ; Override the value for file size in bytes.
            ; Useful for getting sensible track length values in feed mode or for HTTP streams.
            mh [mpg123!]
            size    [integer!]
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_tpf: "mpg123_tpf" [
            ; Get MPEG frame duration in seconds.
            mh [mpg123!]
            return: [float!] ;frame duration in seconds, <0 on error
        ]
        mpg123_spf: "mpg123_spf" [
            ; Get MPEG frame duration in samples.
            mh [mpg123!]
            return: [integer!] ;samples per frame for the most recently parsed frame; <0 on errors
        ]
        mpg123_clip: "mpg123_clip" [
            ; Get and reset the clip count.
            mh [mpg123!]
            return: [integer!] ;count of clipped samples
        ]
        mpg123_getstate: "mpg123_getstate" [
            ; Get various current decoder/stream state information.
            mh [mpg123!]
            key  [mpg123_state!] ;the key to identify the information to give.
            val  [int-ptr!]
            fval [float-ptr!]
        ]

        ;-- Functions to retrieve the metadata from MPEG Audio files and streams.
        ;-- Also includes string handling functions.

        mpg123_init_string: "mpg123_init_string" [
            ; Create and allocate memory for a new mpg123_string
            sb [mpg123_string!] ;string handle (address of existing structure on your side)
        ]
        mpg123_free_string: "mpg123_free_string" [
            ; Free-up mempory for an existing mpg123_string
            sb [mpg123_string!]
        ]
        mpg123_resize_string: "mpg123_resize_string" [
            ; Change the size of a mpg123_string
            sb [mpg123_string!]
            news [integer!] ;new size in bytes
            return: [integer!] ;0 on error, 1 on success
        ]
        mpg123_grow_string: "mpg123_grow_string" [
            ; Increase size of a mpg123_string if necessary (it may stay larger).
            ; Note that the functions for adding and setting in current libmpg123
            ; use this instead of mpg123_resize_string().
            ; That way, you can preallocate memory and safely work afterwards with
            ; pieces.
            sb [mpg123_string!]
            news [integer!] ;new size in bytes
            return: [integer!] ;0 on error, 1 on success
        ]
        mpg123_copy_string: "mpg123_copy_string" [
            ; Append a C-String to an mpg123_string
            from [mpg123_string!]
            to   [mpg123_string!]
            return: [integer!] ;0 on error, 1 on success
        ]
        mpg123_add_substring: "mpg123_add_substring" [
            ; Append a C-substring to an mpg123 string
            sb [mpg123_string!]
            stuff [c-string!]
            from  [integer!] ;offset to copy from
            count [integer!] ;number of characters to copy (a null-byte is always appended)
            return: [integer!] ;0 on error, 1 on success
        ]
        mpg123_set_string: "mpg123_set_string" [
            ; Set the content of a mpg123_string to a C-string
            sb [mpg123_string!]
            stuff [c-string!]
            return: [integer!] ;0 on error, 1 on success
        ]
        mpg123_set_substring: "mpg123_set_substring" [
            ; Set the content of a mpg123_string to a C-substring
            sb [mpg123_string!]
            stuff [c-string!]
            from  [integer!] ;offset to copy from
            count [integer!] ;number of characters to copy (a null-byte is always appended)
            return: [integer!] ;0 on error, 1 on success
        ]
        mpg123_strlen: "mpg123_strlen" [
            ; Count characters in a mpg123 string (non-null bytes or UTF-8 characters).
            ; Even with the fill property, the character count is not obvious as there could be multiple trailing null bytes.
            sb [mpg123_string!]
            utf8 [integer!] ;a flag to tell if the string is in utf8 encoding
            return: [integer!]
        ]
        mpg123_chomp_string: "mpg123_chomp_string" [
            ; Remove trailing \\r and \\n, if present.
            sb [mpg123_string!]
            return: [integer!] ;0 on error, 1 on success
        ]
        mpg123_text_encoding: "mpg123_text_encoding" [
            ;Convert ID3 encoding byte to mpg123 encoding index.
            id3_enc_byte [byte!] ;the ID3 encoding code
            return: [mpg123_text_encoding!]
        ]
        mpg123_store_utf8: "mpg123_store_utf8" [
            ; Store text data in string, after converting to UTF-8 from indicated encoding
            ; A prominent error can be that you provided an unknown encoding value, or this build of libmpg123 lacks support for certain encodings (ID3 or ICY stuff missing).
            ; Also, you might want to take a bit of care with preparing the data; for example, strip leading zeroes (I have seen that).
            sb          [mpg123_string!]
            enc         [mpg123_text_encoding!]
            source      [c-string!]
            source_size [integer!]
            return: [integer!] ;0 on error, 1 on success (on error, `mpg123_free_string` is called on sb)
        ]
        mpg123_meta_check: "mpg123_meta_check" [
            ;Query if there is (new) meta info, be it ID3 or ICY (or something new in future).
            mh [mpg123!]
            return: [integer!] ;combination of flags, 0 on error (same as "nothing new")
        ]
        mpg123_meta_free: "mpg123_meta_free" [
            ;Clean up meta data storage (ID3v2 and ICY), freeing memory.
            mh [mpg123!]
        ]
        mpg123_id3: "mpg123_id3" [
            ;Point v1 and v2 to existing data structures wich may change on any next read/decode function call.
            ;v1 and/or v2 can be set to NULL when there is no corresponding data.
            mh [mpg123!]
            v1 [int-ptr!] ;pointer to mpg123_id3v1
            v2 [int-ptr!] ;pointer to mpg123_id3v2
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_icy: "mpg123_icy" [
            ;Point icy_meta to existing data structure wich may change on any next read/decode function call.
            mh [mpg123!]
            icy_meta [int-ptr!] ;return address for ICY meta string (set to NULL if nothing there)
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_icy2utf8: "mpg123_icy2utf8" [
            ;Decode from windows-1252 (the encoding ICY metainfo used) to UTF-8.
            ;Note that this is very similar to mpg123_store_utf8(&sb, mpg123_text_icy, icy_text, strlen(icy_text+1)) 
            icy_text [c-string!]
            return: [c-string!] ;pointer to newly allocated buffer with UTF-8 data (You free() it!) 
        ]

        ;- Direct access to a parameter set without full handle around it.
        ; Possible uses:
        ;   - Influence behaviour of library _during_ initialization of handle (MPG123_VERBOSE).
        ;   - Use one set of parameters for multiple handles.
        ; The functions for handling mpg123_pars (mpg123_par() and mpg123_fmt() 
        ; family) directly return a fully qualified mpg123 error code, the ones 
        ; operating on full handles normally MPG123_OK or MPG123_ERR, storing the 
        ; specific error code itseld inside the handle. 
        ;@@ TODO if once needed

        ;-- mpg123 low level I/O
        ; You may want to do tricky stuff with I/O that does not work with mpg123's default file access or you want to make it decode into your own pocket...

        mpg123_replace_buffer: "mpg123_replace_buffer" [
            ;Replace default internal buffer with user-supplied buffer.
            ;Instead of working on it's own private buffer, mpg123 will directly use the one you provide for storing decoded audio.
            ;Note that the required buffer size could be bigger than expected from output
            ;encoding if libmpg123 has to convert from primary decoder output (p.ex. 32 bit
            ;storage for 24 bit output).
            mh   [mpg123!]
            data [byte-ptr!]
            size [integer!]
            return: [mpg123-errors!] ;MPG123_OK on success
        ]
        mpg123_outblock: "mpg123_outblock" [
            ; The max size of one frame's decoded output with current settings.
            ; Use that to determine an appropriate minimum buffer size for decoding one frame.
            mh   [mpg123!]
            return: [integer!] ;maximum decoded data size in bytes
        ]
        mpg123_replace_reader: "mpg123_replace_reader" [
            ;Replace low-level stream access functions; read and lseek as known in POSIX.
            ;You can use this to make any fancy file opening/closing yourself, 
            ;using `mpg123_open_fd` to set the file descriptor for your read/lseek
            ;(doesn't need to be a "real" file descriptor...).
            ;Setting a function to NULL means that the default internal read is 
            ;used (active from next mpg123_open call on).
            ;Note: As it would be troublesome to mess with this while having a file open,
            ;this implies `mpg123_close`.
            mh   [mpg123!]
            read [function! [[cdecl] a [integer!] b [byte-ptr!] c [integer!] return: [integer!]]]
            lseek [function! [[cdecl] a [integer!] b [integer!] c [integer!] return: [integer!]]]
        ]
        mpg123_replace_reader_handle: "mpg123_replace_reader_handle" [
            ;Replace I/O functions with your own ones operating on some kind of
            ;handle instead of integer descriptors.
            ;The handle is a void pointer, so you can pass any data you want...
            ;`mpg123_open_handle` is the call you make to use the I/O defined here.
            ;There is no fallback to internal read/seek here.
            ;Note: As it would be troublesome to mess with this while having a file open,
            ;this `mpg123_close` is implied here.
            mh   [mpg123!]
            ;callback for reading (behaviour like POSIX read)
            read [function! [[cdecl] a [byte-ptr!] b [byte-ptr!] c [integer!] return: [integer!]]]
            ;callback for seeking (like POSIX lseek)
            lseek [function! [[cdecl] a [byte-ptr!] b [integer!] c [integer!] return: [integer!]]]
            ; cleanup A callback to clean up an I/O handle on mpg123_close,
            ; can be NULL for none (you take care of cleaning your handles)
            cleanup [function! [[cdecl] a [byte-ptr!]]]
        ]
   ]
]
