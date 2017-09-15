Red/System [
	Title:   "Red/System libvorbis binding"
	Author:  "Oldes"
	File: 	 %vorbis.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on libvorbis source of version: 1.3.5 from www.xiph.org/vorbis/}
]

#include %../ogg/ogg.reds

#switch OS [
	Windows   [	#define VORBIS_LIBRARY "libvorbis.dll" ]
	macOS     [ #define VORBIS_LIBRARY "libvorbis.dylib" ] ;@@ not tested!
	#default  [ #define VORBIS_LIBRARY "libvorbis.so" ] ;@@ not tested!
]

#include %../os/definitions.reds ;common aliases and defines

;-- Vorbis ERRORS and return codes --

#define OV_FALSE      -1
#define OV_EOF        -2
#define OV_HOLE       -3

#define OV_EREAD      -128
#define OV_EFAULT     -129
#define OV_EIMPL      -130
#define OV_EINVAL     -131
#define OV_ENOTVORBIS -132
#define OV_EBADHEADER -133
#define OV_EVERSION   -134
#define OV_ENOTAUDIO  -135
#define OV_EBADPACKET -136
#define OV_EBADLINK   -137
#define OV_ENOSEEK    -138

vorbis_info!: alias struct! [
    ;vorbis_info contains all the setup information specific to the
    ;specific compression/decompression mode in progress (eg,
    ;psychoacoustic settings, channel setup, options, codebook etc).
    version  [integer!]
    channels [integer!]
    rate     [integer!]

    ;The below bitrate declarations are *hints*.
    ; Combinations of the three values carry the following implications:
    ; 
    ; all three set to the same value:
    ;   implies a fixed rate bitstream
    ; only nominal set:
    ;   implies a VBR stream that averages the nominal bitrate.  No hard
    ;   upper/lower limit
    ; upper and or lower set:
    ;   implies a VBR bitstream that obeys the bitrate limits. nominal
    ;   may also be set to give a nominal rate.
    ; none set:
    ;   the coder does not care to speculate.

    bitrate_upper   [integer!]
    bitrate_nominal [integer!]
    bitrate_lower   [integer!]
    bitrate_window  [integer!]

    codec_setup     [byte-ptr!]
]

vorbis_dsp_state!: alias struct! [
    ;vorbis_dsp_state buffers the current vorbis audio
    ;analysis/synthesis state.  The DSP state belongs to a specific
    ;logical bitstream
    
    analysisp [integer!]
    vi        [vorbis_info!]

    pcm            [float32-ptr-ptr!]
    pcmret         [float32-ptr-ptr!]
    pcm_storage    [integer!]
    pcm_current    [integer!]
    pcm_returned   [integer!]

    preextrapolate [integer!]
    eofflag        [integer!]

    lW             [integer!]
    W              [integer!]
    nW             [integer!]
    centerW        [integer!]

    granulepos     [ogg_int64_t! value]
    sequence       [ogg_int64_t! value]

    glue_bits      [ogg_int64_t! value]
    time_bits      [ogg_int64_t! value]
    floor_bits     [ogg_int64_t! value]
    res_bits       [ogg_int64_t! value]

    backend_state  [byte-ptr!]
]

alloc_chain!: alias struct! [
    ptr [byte-ptr!]
    next [alloc_chain!]
]

vorbis_block!: alias struct! [
    ;vorbis_block is a single block of data to be processed as part of
    ;the analysis/synthesis stream; it belongs to a specific logical
    ;bitstream, but is independent from other vorbis_blocks belonging to
    ;that logical bitstream.

    ;necessary stream state for linking to the framing abstraction
    pcm          [float32-ptr-ptr!] ;this is a pointer into local storage
    opb          [oggpack_buffer! value]

    lW           [integer!]
    W            [integer!]
    nW           [integer!]
    pcmend       [integer!]
    mode         [integer!]

    eofflag      [integer!]
    granulepos   [ogg_int64_t! value]
    sequence     [ogg_int64_t! value]
    vd           [vorbis_dsp_state!] ;For read-only access of configuration

    ;local storage to avoid remallocing; it's up to the mapping to structure it
    localstore   [byte-ptr!]
    localtop     [integer!]
    localalloc   [integer!]
    totaluse     [integer!]
    reap         [alloc_chain!]

    ;bitmetrics for the frame
    glue_bits    [integer!]
    time_bits    [integer!]
    floor_bits   [integer!]
    res_bits     [integer!]

    internal     [byte-ptr!]
]

; the comments are not part of vorbis_info so that vorbis_info can be static storage
vorbis_comment!: alias struct! [
    ;unlimited user comment fields.  libvorbis writes 'libvorbis' whatever vendor is set to in encode
    user_comments   [int-ptr!] ;  char **
    comment_lengths [int-ptr!]
    comments        [integer!]
    vendor          [c-string!]
]


; libvorbis encodes in two abstraction layers; first we perform DSP
; and produce a packet (see docs/analysis.txt).  The packet is then
; coded into a framed OggSquish bitstream by the second layer (see
; docs/framing.txt).  Decode is the reverse process; we sync/frame
; the bitstream and extract individual packets, then decode the
; packet back into PCM audio.
;
; The extra framing/packetizing is used in streaming formats, such as
; files.  Over the net (such as with UDP), the framing and
; packetization aren't necessary as they're provided by the transport
; and the streaming layer is not used 


;-- `vorbis_encode_ctl` codes

;ovectl_ratemanage_arg is deprecated

ovectl_ratemanage2_arg!: alias struct! [
    ; The ovectl_ratemanage2_arg structure is used with vorbis_encode_ctl() and
    ; the OV_ECTL_RATEMANAGE2_GET and OV_ECTL_RATEMANAGE2_SET calls in order to
    ; query and modify specifics of the encoder's bitrate management
    ; configuration.
    management_active            [integer!] ; nonzero if bitrate management is active
    ; Lower allowed bitrate limit in kilobits per second
    bitrate_limit_min_kbps       [integer!]
    ; Upper allowed bitrate limit in kilobits per second
    bitrate_limit_max_kbps       [integer!]
    bitrate_limit_reservoir_bits [integer!] ;Size of the bitrate reservoir in bits
    ; Regulates the bitrate reservoir's preferred fill level in a range from 0.0
    ; to 1.0; 0.0 tries to bank bits to buffer against future bitrate spikes, 1.0
    ; buffers against future sudden drops in instantaneous bitrate. Default is 0.1
    bitrate_limit_reservoir_bias [float!]
    ; Average bitrate setting in kilobits per second
    bitrate_average_kbps         [integer!]
    ; Slew rate limit setting for average bitrate adjustment; sets the minimum
    ; time in seconds the bitrate tracker may swing from one extreme to the
    ; other when boosting or damping average bitrate.
    bitrate_average_damping      [float!]
]

#enum encctlcodes! [
    ; These values are passed as the number parameter of `vorbis_encode_ctl`.
    ; The type of the referent of that function's arg pointer depends on these
    ; codes.

    ; Query the current encoder bitrate management setting
    OV_ECTL_RATEMANAGE2_GET:    14h ; argument: ovectl_ratemanage2_arg!
    ; Used to query the current encoder bitrate management setting. Also used to
    ; initialize fields of an ovectl_ratemanage2_arg structure for use with
    ; OV_ECTL_RATEMANAGE2_SET.

    ; Set the current encoder bitrate management settings.
    OV_ECTL_RATEMANAGE2_SET:    15h ; argument: ovectl_ratemanage2_arg!
    ; Used to set the current encoder bitrate management settings to the values
    ; listed in the ovectl_ratemanage2_arg. Passing a NULL pointer will disable
    ; bitrate management.

    OV_ECTL_LOWPASS_GET:        20h ; argument: float! 
    ; Returns the current encoder hard-lowpass setting (kHz) in the double
    ; pointed to by arg.

    OV_ECTL_LOWPASS_SET:        21h ; argument: float! 
    ; Sets the encoder hard-lowpass to the value (kHz) pointed to by arg. Valid
    ; lowpass settings range from 2 to 99.

    OV_ECTL_IBLOCK_GET:         30h ; argument: float! 
    ; Returns the current encoder impulse block setting in the double pointed
    ; to by arg.

    OV_ECTL_IBLOCK_SET:         31h ; argument: float! 
    ; Sets the impulse block bias to the the value pointed to by arg.
    ; Valid range is -15.0 to 0.0 [default]. A negative impulse block bias will
    ; direct to encoder to use more bits when incoding short blocks that contain
    ; strong impulses, thus improving the accuracy of impulse encoding.

    OV_ECTL_COUPLING_GET:       40h ; argument: integer!
    ; Returns the current encoder coupling setting in the int pointed
    ; to by arg.

    OV_ECTL_COUPLING_SET:       41h ; argument: integer!
    ; Enables/disables channel coupling in multichannel encoding according to arg.
    ; Zero disables channel coupling for multichannel inputs, nonzer enables
    ; channel coupling.  Setting has no effect on monophonic encoding or
    ; multichannel counts that do not offer coupling.  At present, coupling is
    ; available for stereo and 5.1 encoding.
] 

#import [
	VORBIS_LIBRARY cdecl [
        ;-- Vorbis PRIMITIVES: general --

        vorbis_info_init: "vorbis_info_init" [
            vi [vorbis_info!]
        ]
        vorbis_info_clear: "vorbis_info_clear" [
            vi [vorbis_info!]
        ]
        vorbis_info_blocksize: "vorbis_info_blocksize" [
            ;This function gets the possible sizes for encoded blocks. There are short blocks (zo = 0) and long blocks (zo = 1). The size of a long block is guaranteed to be greater than or equal to the size of a short block.
            vi [vorbis_info!]
            zo [integer!] ;Integer for which block size to get: 0 for short and 1 for long
            return: [integer!]
        ]
        vorbis_comment_init: "vorbis_comment_init" [
            ;This function initializes a vorbis_block structure and allocates its internal storage. A vorbis_block is used to represent a particular block of input audio which can be analyzed and coded as a unit.
            vc [vorbis_comment!]
        ]
        vorbis_comment_add: "vorbis_comment_add" [
            vc [vorbis_comment!]
            comment [c-string!]
        ]
        vorbis_comment_add_tag: "vorbis_comment_add_tag" [
            vc [vorbis_comment!]
            tag [c-string!]
            contents [c-string!]
        ]
        vorbis_comment_query: "vorbis_comment_query" [
            vc [vorbis_comment!]
            tag [c-string!]
            count [integer!]
            return: [c-string!]
        ]
        vorbis_comment_query_count: "vorbis_comment_query_count" [
            vc [vorbis_comment!]
            tag [c-string!]
            return: [integer!]
        ]
        vorbis_comment_clear: "vorbis_comment_clear" [
            vc [vorbis_comment!]
        ]

        vorbis_block_init: "vorbis_block_init" [
            v  [vorbis_dsp_state!]
            vb [vorbis_block!]
            return: [integer!]
        ]
        vorbis_block_clear: "vorbis_block_clear" [
            ;This function frees the internal storage for a vorbis_block structure.
            vb [vorbis_block!]
            return: [integer!]
        ]
        vorbis_dsp_clear: "vorbis_dsp_clear" [
            v [vorbis_dsp_state!]
        ]
        vorbis_granule_time: "vorbis_granule_time" [
            v [vorbis_dsp_state!]
            granulepos [ogg_int64_t! value]
            return: [float!]
        ]

        vorbis_version_string: "vorbis_version_string" [
            return: [c-string!]
        ]

        ;-- Vorbis PRIMITIVES: analysis/DSP layer --

        vorbis_analysis_init: "vorbis_analysis_init" [
            v  [vorbis_dsp_state!]
            vi [vorbis_info!]
            return: [integer!]
        ]
        vorbis_commentheader_out: "vorbis_commentheader_out" [
            vc  [vorbis_comment!]
            op  [ogg_packet!]
            return: [integer!]
        ]
        vorbis_analysis_headerout: "vorbis_analysis_headerout" [
            v  [vorbis_dsp_state!]
            vc [vorbis_comment!]
            op [ogg_packet!]
            op_comm [ogg_packet!]
            op_code [ogg_packet!]
            return: [integer!]
        ]
        vorbis_analysis_buffer: "vorbis_analysis_buffer" [
            v [vorbis_dsp_state!]
            vals [integer!]
            return: [float32-ptr-ptr!]
        ]
        vorbis_analysis_wrote: "vorbis_analysis_wrote" [
            v [vorbis_dsp_state!]
            vals [integer!]
            return: [integer!]
        ]
        vorbis_analysis_blockout: "vorbis_analysis_blockout" [
            v [vorbis_dsp_state!]
            vb [vorbis_block!]
            return: [integer!]
        ]
        vorbis_analysis: "vorbis_analysis" [
            vb [vorbis_block!]
            op [ogg_packet!]
            return: [integer!]
        ]

        vorbis_bitrate_addblock: "vorbis_bitrate_addblock" [
            vb [vorbis_block!]
            return: [integer!]
        ]
        vorbis_bitrate_flushpacket: "vorbis_bitrate_flushpacket" [
            vd [vorbis_dsp_state!]
            op [ogg_packet!]
            return: [integer!]
        ]

        ;-- Vorbis PRIMITIVES: synthesis layer *******************************/
        vorbis_synthesis_idheader: "vorbis_synthesis_idheader" [
            op  [ogg_packet!]
            return: [integer!]
        ]
        vorbis_synthesis_headerin: "vorbis_synthesis_headerin" [
            vi  [vorbis_info!]
            vc  [vorbis_comment!]
            op  [ogg_packet!]
            return: [integer!]
        ]

        vorbis_synthesis_init: "vorbis_synthesis_init" [
            v [vorbis_dsp_state!]
            vi [vorbis_info!]
            return: [integer!]
        ]
        vorbis_synthesis_restart: "vorbis_synthesis_restart" [
            v [vorbis_dsp_state!]
            return: [integer!]
        ]
        vorbis_synthesis: "vorbis_synthesis" [
            vb [vorbis_block!]
            op [ogg_packet!]
            return: [integer!]
        ]
        vorbis_synthesis_trackonly: "vorbis_synthesis_trackonly" [
            vb [vorbis_block!]
            op [ogg_packet!]
            return: [integer!]
        ]
        vorbis_synthesis_blockin: "vorbis_synthesis_blockin" [
            v [vorbis_dsp_state!]
            vb [vorbis_block!]
            return: [integer!]
        ]
        vorbis_synthesis_pcmout: "vorbis_synthesis_pcmout" [
            v [vorbis_dsp_state!]
            pcm [int-ptr!] ;float ***
            return: [integer!]
        ]
        vorbis_synthesis_lapout: "vorbis_synthesis_lapout" [
            v [vorbis_dsp_state!]
            pcm [int-ptr!] ;float ***
            return: [integer!]
        ]
        vorbis_synthesis_read: "vorbis_synthesis_read" [
            v [vorbis_dsp_state!]
            samples [integer!]
            return: [integer!]
        ]
        vorbis_packet_blocksize: "vorbis_packet_blocksize" [
            vi [vorbis_info!]
            op [ogg_packet!]
            return: [integer!]
        ]

        vorbis_synthesis_halfrate: "vorbis_synthesis_halfrate" [
            v [vorbis_info!]
            flag [integer!]
            return: [integer!]
        ]
        vorbis_synthesis_halfrate_p: "vorbis_synthesis_halfrate_p" [
            v [vorbis_info!]
            return: [integer!]
        ]


        ;-- encoder related functions:

        vorbis_encode_init: "vorbis_encode_init" [
            ; This is the primary function for setting up managed bitrate modes.
            ;
            ; Before this function is called, the `vorbis_info`
            ; struct should be initialized by using `vorbis_info_init` from the libvorbis
            ; API.  After encoding, `vorbis_info_clear should be called.
            ;
            ; The max_bitrate, nominal_bitrate, and min_bitrate settings are used to set
            ; constraints for the encoded file.  This function uses these settings to
            ; select the appropriate encoding mode and set it up.
            vi              [vorbis_info!] ;Pointer to an initialized `vorbis_info!` struct.
            channels        [integer!] ;The number of channels to be encoded.
            rate            [integer!] ;The sampling rate of the source audio.
            max_bitrate     [integer!] ;Desired maximum bitrate (limit). -1 indicates unset.
            nominal_bitrate [integer!] ;Desired average, or central, bitrate. -1 indicates unset.
            min_bitrate     [integer!] ;Desired minimum bitrate. -1 indicates unset.

            return: [integer!] ;Zero for success, and negative values for failure.
        ]

        vorbis_encode_setup_managed: "vorbis_encode_setup_managed" [
            ; This function performs step-one of a three-step bitrate-managed encode
            ; setup.  It functions similarly to the one-step setup performed by 
            ; `vorbis_encode_init` but allows an application to make further encode setup
            ; tweaks using `vorbis_encode_ctl` before finally calling 
            ; `vorbis_encode_setup_init` to complete the setup process.
            ;
            ; Before this function is called, the `vorbis_info` struct should be
            ; initialized by using `vorbis_info_init` from the libvorbis API.  After
            ; encoding, `vorbis_info_clear` should be called.
            ;
            ; The max_bitrate, nominal_bitrate, and min_bitrate settings are used to set
            ; constraints for the encoded file.  This function uses these settings to
            ; select the appropriate encoding mode and set it up.
            vi              [vorbis_info!] ;Pointer to an initialized `vorbis_info!` struct.
            channels        [integer!] ;The number of channels to be encoded.
            rate            [integer!] ;The sampling rate of the source audio.
            max_bitrate     [integer!] ;Desired maximum bitrate (limit). -1 indicates unset.
            nominal_bitrate [integer!] ;Desired average, or central, bitrate. -1 indicates unset.
            min_bitrate     [integer!] ;Desired minimum bitrate. -1 indicates unset.

            return: [integer!] ;Zero for success, and negative values for failure.
        ]

        vorbis_encode_setup_vbr: "vorbis_encode_setup_vbr" [
            ; This function performs step-one of a three-step variable bitrate
            ; (quality-based) encode setup.  It functions similarly to the one-step setup
            ; performed by `vorbis_encode_init_vbr` but allows an application to
            ; make further encode setup tweaks using `vorbis_encode_ctl` before
            ; finally calling `vorbis_encode_setup_init` to complete the setup
            ; process.
            ;
            ; Before this function is called, the `vorbis_info` struct should be
            ; initialized by using `vorbis_info_init` from the libvorbis API.  After
            ; encoding, `vorbis_info_clear` should be called.
            vi              [vorbis_info!] ;Pointer to an initialized `vorbis_info!` struct.
            channels        [integer!] ;The number of channels to be encoded.
            rate            [integer!] ;The sampling rate of the source audio.
            quality         [float32!] ;Desired quality level, currently from -0.1 to 1.0 (lo to hi).

            return: [integer!] ;Zero for success, and negative values for failure.
        ]

        vorbis_encode_init_vbr: "vorbis_encode_init_vbr" [
            ; This is the primary function for setting up variable
            ; bitrate ("quality" based) modes.
            ;
            ; Before this function is called, the vorbis_info struct should be
            ; initialized by using `vorbis_info_init` from the libvorbis API. After
            ; encoding, `vorbis_info_clear` should be called.
            vi              [vorbis_info!] ;Pointer to an initialized `vorbis_info!` struct.
            channels        [integer!] ;The number of channels to be encoded.
            rate            [integer!] ;The sampling rate of the source audio.
            base_quality    [float32!] ;Desired quality level, currently from -0.1 to 1.0 (lo to hi).

            return: [integer!] ;Zero for success, and negative values for failure.
        ]

        vorbis_encode_setup_init: "vorbis_encode_setup_init" [
            ; This function performs the last stage of three-step encoding setup, as
            ; described in the API overview under managed bitrate modes.
            ;
            ; Before this function is called, the \ref vorbis_info struct should be
            ; initialized by using vorbis_info_init() from the libvorbis API, one of
            ; \ref vorbis_encode_setup_managed() or \ref vorbis_encode_setup_vbr() called to
            ; initialize the high-level encoding setup, and \ref vorbis_encode_ctl()
            ; called if necessary to make encoding setup changes.
            ; vorbis_encode_setup_init() finalizes the highlevel encoding structure into
            ; a complete encoding setup after which the application may make no further
            ; setup changes.
            vi              [vorbis_info!] ;Pointer to an initialized `vorbis_info!` struct.

            return: [integer!] ;Zero for success, and negative values for failure.
        ]

        vorbis_encode_ctl: "vorbis_encode_ctl" [
            ; This function implements a generic interface to miscellaneous encoder
            ; settings similar to the classic UNIX `ioctl` system call.  Applications
            ; may use `vorbis_encode_ctl` to query or set bitrate management or quality
            ; mode details by using one of several request arguments detailed below.
            ; `vorbis_encode_ctl must be called after one of
            ; `vorbis_encode_setup_managed` or `vorbis_encode_setup_vbr`.  When used
            ; to modify settings, `vorbis_encode_ctl` must be called before 
            ; `vorbis_encode_setup_init`.
            vi      [vorbis_info!] ;Pointer to an initialized `vorbis_info!` struct.
            number  [integer!]  ;Specifies the desired action; See `encctlcodes` "the list of available requests".
            arg     [byte-ptr!] ;pointing to a data structure matching the request argument. 
            return: [integer!] ;Zero for success, and negative values for failure.
        ]
    ]
]
