Red/System [
	Title:   "Red/System Bass binding"
	Author:  "Oldes"
	File: 	 %Bass.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
	
]

#switch OS [
	Windows   [	#define BASS_LIBRARY "bass.dll" ]
	macOS     [ #define BASS_LIBRARY "libbass.dylib " ] ;@@ not tested!
	#default  [   ]
]

long-long-ptr!: alias struct! [lo [integer!] hi [integer!]] ;@@ There is no `int64!` datatype in Red/System yet
#define long-long!        float! ;@@ struct is passed by reference so far so I must fake passing `long long` using `float!`
#define MAX_32_PRECISION 4294967296.0
int64-to-float: func[i [long-long-ptr!]	return: [float!]][
	(MAX_32_PRECISION * as float! i/hi)  + (as float! i/lo) ;@@ float can be used as a workaround to pass long-long! value in function call (instead int64!)
]
float-to-int64: func[f [float!] return: [long-long-ptr!] /local i [long-long-ptr!] ][
	i: declare long-long-ptr!
	i/hi: as integer! (f / MAX_32_PRECISION)
	i/lo: as integer! f
	i
]
ZERO_INT64: declare long-long-ptr! [0 0]

#define HMUSIC!    integer! ;// MOD music handle
#define HSAMPLE!   integer! ;// sample handle
#define HCHANNEL!  integer! ;// playing sample's channel handle
#define HSTREAM!   integer! ;// sample stream handle
#define HRECORD!   integer! ;// recording handle
#define HSYNC!     integer! ;// synchronizer handle
#define HDSP!      integer! ;// DSP handle
#define HFX!       integer! ;// DX8 effect handle
#define HPLUGIN!   integer! ;// Plugin handle

#define HWND! int-ptr!
#define BOOL! logic!

;-- Error codes returned by BASS_ErrorGetCode
#define BASS_OK				0	;// all is OK
#define BASS_ERROR_MEM		1	;// memory error
#define BASS_ERROR_FILEOPEN	2	;// can't open the file
#define BASS_ERROR_DRIVER	3	;// can't find a free/valid driver
#define BASS_ERROR_BUFLOST	4	;// the sample buffer was lost
#define BASS_ERROR_HANDLE	5	;// invalid handle
#define BASS_ERROR_FORMAT	6	;// unsupported sample format
#define BASS_ERROR_POSITION	7	;// invalid position
#define BASS_ERROR_INIT		8	;// BASS_Init has not been successfully called
#define BASS_ERROR_START	9	;// BASS_Start has not been successfully called
#define BASS_ERROR_SSL		10	;// SSL/HTTPS support isn't available
#define BASS_ERROR_ALREADY	14	;// already initialized/paused/whatever
#define BASS_ERROR_NOCHAN	18	;// can't get a free channel
#define BASS_ERROR_ILLTYPE	19	;// an illegal type was specified
#define BASS_ERROR_ILLPARAM	20	;// an illegal parameter was specified
#define BASS_ERROR_NO3D		21	;// no 3D support
#define BASS_ERROR_NOEAX	22	;// no EAX support
#define BASS_ERROR_DEVICE	23	;// illegal device number
#define BASS_ERROR_NOPLAY	24	;// not playing
#define BASS_ERROR_FREQ		25	;// illegal sample rate
#define BASS_ERROR_NOTFILE	27	;// the stream is not a file stream
#define BASS_ERROR_NOHW		29	;// no hardware voices available
#define BASS_ERROR_EMPTY	31	;// the MOD music has no sequence data
#define BASS_ERROR_NONET	32	;// no internet connection could be opened
#define BASS_ERROR_CREATE	33	;// couldn't create the file
#define BASS_ERROR_NOFX		34	;// effects are not available
#define BASS_ERROR_NOTAVAIL	37	;// requested data is not available
#define BASS_ERROR_DECODE	38	;// the channel is/isn't a "decoding channel"
#define BASS_ERROR_DX		39	;// a sufficient DirectX version is not installed
#define BASS_ERROR_TIMEOUT	40	;// connection timedout
#define BASS_ERROR_FILEFORM	41	;// unsupported file format
#define BASS_ERROR_SPEAKER	42	;// unavailable speaker
#define BASS_ERROR_VERSION	43	;// invalid BASS version (used by add-ons)
#define BASS_ERROR_CODEC	44	;// codec is not available/supported
#define BASS_ERROR_ENDED	45	;// the channel/file has ended
#define BASS_ERROR_BUSY		46	;// the device is busy
#define BASS_ERROR_UNKNOWN	-1	;// some other mystery problem

;-- BASS_SetConfig options
#define BASS_CONFIG_BUFFER			0
#define BASS_CONFIG_UPDATEPERIOD	1
#define BASS_CONFIG_GVOL_SAMPLE		4
#define BASS_CONFIG_GVOL_STREAM		5
#define BASS_CONFIG_GVOL_MUSIC		6
#define BASS_CONFIG_CURVE_VOL		7
#define BASS_CONFIG_CURVE_PAN		8
#define BASS_CONFIG_FLOATDSP		9
#define BASS_CONFIG_3DALGORITHM		10
#define BASS_CONFIG_NET_TIMEOUT		11
#define BASS_CONFIG_NET_BUFFER		12
#define BASS_CONFIG_PAUSE_NOPLAY	13
#define BASS_CONFIG_NET_PREBUF		15
#define BASS_CONFIG_NET_PASSIVE		18
#define BASS_CONFIG_REC_BUFFER		19
#define BASS_CONFIG_NET_PLAYLIST	21
#define BASS_CONFIG_MUSIC_VIRTUAL	22
#define BASS_CONFIG_VERIFY			23
#define BASS_CONFIG_UPDATETHREADS	24
#define BASS_CONFIG_DEV_BUFFER		27
#define BASS_CONFIG_VISTA_TRUEPOS	30
#define BASS_CONFIG_IOS_MIXAUDIO	34
#define BASS_CONFIG_DEV_DEFAULT		36
#define BASS_CONFIG_NET_READTIMEOUT	37
#define BASS_CONFIG_VISTA_SPEAKERS	38
#define BASS_CONFIG_IOS_SPEAKER		39
#define BASS_CONFIG_MF_DISABLE		40
#define BASS_CONFIG_HANDLES			41
#define BASS_CONFIG_UNICODE			42
#define BASS_CONFIG_SRC				43
#define BASS_CONFIG_SRC_SAMPLE		44
#define BASS_CONFIG_ASYNCFILE_BUFFER 45
#define BASS_CONFIG_OGG_PRESCAN		47
#define BASS_CONFIG_MF_VIDEO		48
#define BASS_CONFIG_AIRPLAY			49
#define BASS_CONFIG_DEV_NONSTOP		50
#define BASS_CONFIG_IOS_NOCATEGORY	51
#define BASS_CONFIG_VERIFY_NET		52
#define BASS_CONFIG_DEV_PERIOD		53
#define BASS_CONFIG_FLOAT			54
#define BASS_CONFIG_NET_SEEK		56

;-- BASS_SetConfigPtr options
#define BASS_CONFIG_NET_AGENT		16
#define BASS_CONFIG_NET_PROXY		17
#define BASS_CONFIG_IOS_NOTIFY		46

;-- BASS_Init flags
#define BASS_DEVICE_8BITS		1		;// 8 bit
#define BASS_DEVICE_MONO		2		;// mono
#define BASS_DEVICE_3D			4		;// enable 3D functionality
#define BASS_DEVICE_16BITS		8		;// limit output to 16 bit
#define BASS_DEVICE_LATENCY		0100h	;// calculate device latency (BASS_INFO struct)
#define BASS_DEVICE_CPSPEAKERS	0400h	;// detect speakers via Windows control panel
#define BASS_DEVICE_SPEAKERS	0800h	;// force enabling of speaker assignment
#define BASS_DEVICE_NOSPEAKER	1000h	;// ignore speaker arrangement
#define BASS_DEVICE_DMIX		2000h	;// use ALSA "dmix" plugin
#define BASS_DEVICE_FREQ		4000h	;// set device sample rate
#define BASS_DEVICE_STEREO		8000h	;// limit output to stereo

;-- DirectSound interfaces (for use with BASS_GetDSoundObject)
#define BASS_OBJECT_DS		1	;// IDirectSound
#define BASS_OBJECT_DS3DL	2	;// IDirectSound3DListener

;-- Device info structure
BASS_DEVICEINFO!: alias struct! [
	name   [c-string!] ;// description
	driver [c-string!] ;// driver
	flags  [integer!]
]

;-- BASS_DEVICEINFO flags
#define BASS_DEVICE_ENABLED		1
#define BASS_DEVICE_DEFAULT		2
#define BASS_DEVICE_INIT		4

#define BASS_DEVICE_TYPE_MASK			FF000000h
#define BASS_DEVICE_TYPE_NETWORK		01000000h
#define BASS_DEVICE_TYPE_SPEAKERS		02000000h
#define BASS_DEVICE_TYPE_LINE			03000000h
#define BASS_DEVICE_TYPE_HEADPHONES		04000000h
#define BASS_DEVICE_TYPE_MICROPHONE		05000000h
#define BASS_DEVICE_TYPE_HEADSET		06000000h
#define BASS_DEVICE_TYPE_HANDSET		07000000h
#define BASS_DEVICE_TYPE_DIGITAL		08000000h
#define BASS_DEVICE_TYPE_SPDIF			09000000h
#define BASS_DEVICE_TYPE_HDMI			0A000000h
#define BASS_DEVICE_TYPE_DISPLAYPORT	40000000h

;-- BASS_GetDeviceInfo flags
#define BASS_DEVICES_AIRPLAY	01000000h

BASS_INFO!: alias struct! [
	flags      [integer!]   ;// device capabilities (DSCAPS_xxx flags)
	hwsize     [integer!]	;// size of total device hardware memory
	hwfree     [integer!]   ;// size of free device hardware memory
	freesam    [integer!]   ;// number of free sample slots in the hardware
	free3d     [integer!]   ;// number of free 3D sample slots in the hardware
	minrate    [integer!]   ;// min sample rate supported by the hardware
	maxrate    [integer!]   ;// max sample rate supported by the hardware
	eax        [BOOL!]     ;// device supports EAX? (always FALSE if BASS_DEVICE_3D was not used)
	minbuf     [integer!]	;// recommended minimum buffer length in ms (requires BASS_DEVICE_LATENCY)
	dsver      [integer!]	;// DirectSound version
	latency    [integer!]	;// delay (in ms) before start of playback (requires BASS_DEVICE_LATENCY)
	initflags  [integer!]   ;// BASS_Init "flags" parameter
	speakers   [integer!]   ;// number of speakers available
	freq       [integer!]	;// current output rate
]

;-- BASS_INFO flags (from DSOUND.H)
#define DSCAPS_CONTINUOUSRATE	00000010h	;// supports all sample rates between min/maxrate
#define DSCAPS_EMULDRIVER		00000020h	;// device does NOT have hardware DirectSound support
#define DSCAPS_CERTIFIED		00000040h	;// device driver has been certified by Microsoft
#define DSCAPS_SECONDARYMONO	00000100h	;// mono
#define DSCAPS_SECONDARYSTEREO	00000200h	;// stereo
#define DSCAPS_SECONDARY8BIT	00000400h	;// 8 bit
#define DSCAPS_SECONDARY16BIT	00000800h	;// 16 bit

;-- Recording device info structure
BASS_RECORDINFO!: alias struct! [
	flags      [integer!]    ;// device capabilities (DSCCAPS_xxx flags)
	formats    [integer!]    ;// supported standard formats (WAVE_FORMAT_xxx flags)
	inputs     [integer!]    ;// number of inputs
	singlein   [BOOL!]       ;// TRUE = only 1 input can be set at a time
	freq       [integer!]    ;// current input rate
]

;-- BASS_RECORDINFO flags (from DSOUND.H)
#define DSCCAPS_EMULDRIVER		DSCAPS_EMULDRIVER	;// device does NOT have hardware DirectSound recording support
#define DSCCAPS_CERTIFIED		DSCAPS_CERTIFIED	;// device driver has been certified by Microsoft

;-- defines for formats field of BASS_RECORDINFO (from MMSYSTEM.H)
#define WAVE_FORMAT_1M08       00000001h       ;/* 11.025 kHz, Mono,   8-bit  */
#define WAVE_FORMAT_1S08       00000002h       ;/* 11.025 kHz, Stereo, 8-bit  */
#define WAVE_FORMAT_1M16       00000004h       ;/* 11.025 kHz, Mono,   16-bit */
#define WAVE_FORMAT_1S16       00000008h       ;/* 11.025 kHz, Stereo, 16-bit */
#define WAVE_FORMAT_2M08       00000010h       ;/* 22.05  kHz, Mono,   8-bit  */
#define WAVE_FORMAT_2S08       00000020h       ;/* 22.05  kHz, Stereo, 8-bit  */
#define WAVE_FORMAT_2M16       00000040h       ;/* 22.05  kHz, Mono,   16-bit */
#define WAVE_FORMAT_2S16       00000080h       ;/* 22.05  kHz, Stereo, 16-bit */
#define WAVE_FORMAT_4M08       00000100h       ;/* 44.1   kHz, Mono,   8-bit  */
#define WAVE_FORMAT_4S08       00000200h       ;/* 44.1   kHz, Stereo, 8-bit  */
#define WAVE_FORMAT_4M16       00000400h       ;/* 44.1   kHz, Mono,   16-bit */
#define WAVE_FORMAT_4S16       00000800h       ;/* 44.1   kHz, Stereo, 16-bit */

;-- Sample info structure
BASS_SAMPLE!: alias struct! [
	freq       [integer!]	;// default playback rate
	volume     [float32!]	;// default volume (0-1)
	pan        [float32!]	;// default pan (-1=left, 0=middle, 1=right)
	flags      [integer!]	;// BASS_SAMPLE_xxx flags
	length     [integer!]	;// length (in bytes)
	max        [integer!]	;// maximum simultaneous playbacks
	origres    [integer!]	;// original resolution bits
	chans      [integer!]	;// number of channels
	mingap     [integer!]	;// minimum gap (ms) between creating channels
	mode3d     [integer!]	;// BASS_3DMODE_xxx mode
	mindist    [float32!]	;// minimum distance
	maxdist    [float32!]	;// maximum distance
	iangle     [integer!]	;// angle of inside projection cone
	oangle     [integer!]	;// angle of outside projection cone
	outvol     [float32!]	;// delta-volume outside the projection cone
	vam        [integer!]	;// voice allocation/management flags (BASS_VAM_xxx)
	priority   [integer!]	;// priority (0=lowest, 0xffffffff=highest)
]

#define BASS_SAMPLE_8BITS		1	;// 8 bit
#define BASS_SAMPLE_FLOAT		256	;// 32 bit floating-point
#define BASS_SAMPLE_MONO		2	;// mono
#define BASS_SAMPLE_LOOP		4	;// looped
#define BASS_SAMPLE_3D			8	;// 3D functionality
#define BASS_SAMPLE_SOFTWARE	16	;// not using hardware mixing
#define BASS_SAMPLE_MUTEMAX		32	;// mute at max distance (3D only)
#define BASS_SAMPLE_VAM			64	;// DX7 voice allocation & management
#define BASS_SAMPLE_FX			128	;// old implementation of DX8 effects
#define BASS_SAMPLE_OVER_VOL	00010000h	;// override lowest volume
#define BASS_SAMPLE_OVER_POS	00020000h	;// override longest playing
#define BASS_SAMPLE_OVER_DIST	00030000h   ;// override furthest from listener (3D only)

#define BASS_STREAM_PRESCAN		00020000h ;// enable pin-point seeking/length (MP3/MP2/MP1)
#define BASS_MP3_SETPOS			BASS_STREAM_PRESCAN
#define BASS_STREAM_AUTOFREE	00040000h ;// automatically free the stream when it stop/ends
#define BASS_STREAM_RESTRATE	00800000h ;// restrict the download rate of internet file streams
#define BASS_STREAM_BLOCK		00100000h ;// download/play internet file stream in small blocks
#define BASS_STREAM_DECODE		00200000h ;// don't play the stream, only decode (BASS_ChannelGetData)
#define BASS_STREAM_STATUS		00800000h ;// give server status info (HTTP/ICY tags) in DOWNLOADPROC

#define BASS_MUSIC_FLOAT		BASS_SAMPLE_FLOAT
#define BASS_MUSIC_MONO			BASS_SAMPLE_MONO
#define BASS_MUSIC_LOOP			BASS_SAMPLE_LOOP
#define BASS_MUSIC_3D			BASS_SAMPLE_3D
#define BASS_MUSIC_FX			BASS_SAMPLE_FX
#define BASS_MUSIC_AUTOFREE		BASS_STREAM_AUTOFREE
#define BASS_MUSIC_DECODE		BASS_STREAM_DECODE
#define BASS_MUSIC_PRESCAN		BASS_STREAM_PRESCAN	;// calculate playback length
#define BASS_MUSIC_CALCLEN		BASS_MUSIC_PRESCAN
#define BASS_MUSIC_RAMP			0200h		;// normal ramping
#define BASS_MUSIC_RAMPS		0400h		;// sensitive ramping
#define BASS_MUSIC_SURROUND		0800h		;// surround sound
#define BASS_MUSIC_SURROUND2	00001000h	;// surround sound (mode 2)
#define BASS_MUSIC_FT2PAN		00002000h	;// apply FastTracker 2 panning to XM files
#define BASS_MUSIC_FT2MOD		00002000h	;// play .MOD as FastTracker 2 does
#define BASS_MUSIC_PT1MOD		00004000h	;// play .MOD as ProTracker 1 does
#define BASS_MUSIC_NONINTER		00010000h	;// non-interpolated sample mixing
#define BASS_MUSIC_SINCINTER	00800000h	;// sinc interpolated sample mixing
#define BASS_MUSIC_POSRESET		00008000h	;// stop all notes when moving position
#define BASS_MUSIC_POSRESETEX	00400000h	;// stop all notes and reset bmp/etc when moving position
#define BASS_MUSIC_STOPBACK		00080000h	;// stop the music on a backwards jump effect
#define BASS_MUSIC_NOSAMPLE		00100000h	;// don't load the samples

;-- Speaker assignment flags
#define BASS_SPEAKER_FRONT	01000000h	;// front speakers
#define BASS_SPEAKER_REAR	02000000h	;// rear/side speakers
#define BASS_SPEAKER_CENLFE	03000000h	;// center & LFE speakers (5.1)
#define BASS_SPEAKER_REAR2	04000000h	;// rear center speakers (7.1)
#define BASS_SPEAKER_N(n)	[n << 24]	;// n'th pair of speakers (max 15)
#define BASS_SPEAKER_LEFT	10000000h	;// modifier: left
#define BASS_SPEAKER_RIGHT	20000000h	;// modifier: right
#define BASS_SPEAKER_FRONTLEFT	[BASS_SPEAKER_FRONT  or BASS_SPEAKER_LEFT]
#define BASS_SPEAKER_FRONTRIGHT	[BASS_SPEAKER_FRONT  or BASS_SPEAKER_RIGHT]
#define BASS_SPEAKER_REARLEFT	[BASS_SPEAKER_REAR   or BASS_SPEAKER_LEFT]
#define BASS_SPEAKER_REARRIGHT	[BASS_SPEAKER_REAR   or BASS_SPEAKER_RIGHT]
#define BASS_SPEAKER_CENTER		[BASS_SPEAKER_CENLFE or BASS_SPEAKER_LEFT]
#define BASS_SPEAKER_LFE		[BASS_SPEAKER_CENLFE or BASS_SPEAKER_RIGHT]
#define BASS_SPEAKER_REAR2LEFT	[BASS_SPEAKER_REAR2  or BASS_SPEAKER_LEFT]
#define BASS_SPEAKER_REAR2RIGHT	[BASS_SPEAKER_REAR2  or BASS_SPEAKER_RIGHT]

#define BASS_ASYNCFILE			40000000h
#define BASS_UNICODE			80000000h

#define BASS_RECORD_PAUSE		8000h	;// start recording paused
#define BASS_RECORD_ECHOCANCEL	2000h
#define BASS_RECORD_AGC			4000h

;-- DX7 voice allocation & management flags
#define BASS_VAM_HARDWARE		1
#define BASS_VAM_SOFTWARE		2
#define BASS_VAM_TERM_TIME		4
#define BASS_VAM_TERM_DIST		8
#define BASS_VAM_TERM_PRIO		16

;-- Channel info structure
BASS_CHANNELINFO!: alias struct! [
	freq      [integer!]	;// default playback rate
	chans     [integer!]	;// channels
	flags     [integer!]	;// BASS_SAMPLE/STREAM/MUSIC/SPEAKER flags
	ctype     [integer!]	;// type of channel
	origres   [integer!]	;// original resolution
	plugin    [HPLUGIN!]	;// plugin
	sample    [HSAMPLE!]    ;// sample
	filename  [c-string!]   ;// filename
]

;-- BASS_CHANNELINFO types
#define BASS_CTYPE_SAMPLE		    1
#define BASS_CTYPE_RECORD		    2
#define BASS_CTYPE_STREAM		    00010000h
#define BASS_CTYPE_STREAM_OGG	    00010002h
#define BASS_CTYPE_STREAM_MP1	    00010003h
#define BASS_CTYPE_STREAM_MP2	    00010004h
#define BASS_CTYPE_STREAM_MP3	    00010005h
#define BASS_CTYPE_STREAM_AIFF	    00010006h
#define BASS_CTYPE_STREAM_CA	    00010007h
#define BASS_CTYPE_STREAM_MF	    00010008h
#define BASS_CTYPE_STREAM_WAV	    00040000h ;// WAVE flag, LOWORD=codec
#define BASS_CTYPE_STREAM_WAV_PCM	00050001h
#define BASS_CTYPE_STREAM_WAV_FLOAT	00050003h
#define BASS_CTYPE_MUSIC_MOD	    00020000h
#define BASS_CTYPE_MUSIC_MTM	    00020001h
#define BASS_CTYPE_MUSIC_S3M	    00020002h
#define BASS_CTYPE_MUSIC_XM		    00020003h
#define BASS_CTYPE_MUSIC_IT		    00020004h
#define BASS_CTYPE_MUSIC_MO3	    00000100h ;// MO3 flag

BASS_PLUGINFORM!: alias struct! [
	ctype      [integer!]		;// channel type
	;@@ NOTE: `const wchar_t *` where (_WIN32_WCE) || (WINAPI_FAMILY && WINAPI_FAMILY!=WINAPI_FAMILY_DESKTOP_APP)
	name  [c-string!]	;// format description
	exts  [c-string!]	;// file extension filter (*.ext1;*.ext2;etc...)
]

BASS_PLUGININFO!: alias struct! [
	version   [integer!]		 ;// version (same form as BASS_GetVersion)
	formatc   [integer!]		 ;// number of formats
	formats   [BASS_PLUGINFORM!] ;// the array of formats BASS_PLUGINFORM
]

;-- 3D vector (for 3D positions/velocities/orientations)
BASS_3DVECTOR!: alias struct! [
	x [float32!]	;// +=right, -=left
	y [float32!]	;// +=up, -=down
	z [float32!]	;// +=front, -=behind
]

;-- 3D channel modes
#define BASS_3DMODE_NORMAL		0	;// normal 3D processing
#define BASS_3DMODE_RELATIVE	1	;// position is relative to the listener
#define BASS_3DMODE_OFF			2	;// no 3D processing

;-- software 3D mixing algorithms (used with BASS_CONFIG_3DALGORITHM)
#define BASS_3DALG_DEFAULT	0
#define BASS_3DALG_OFF		1
#define BASS_3DALG_FULL		2
#define BASS_3DALG_LIGHT	3

;-- EAX environments, use with BASS_SetEAXParameters
#enum EAX_ENVIRONMENT! [
    EAX_ENVIRONMENT_GENERIC
    EAX_ENVIRONMENT_PADDEDCELL
    EAX_ENVIRONMENT_ROOM
    EAX_ENVIRONMENT_BATHROOM
    EAX_ENVIRONMENT_LIVINGROOM
    EAX_ENVIRONMENT_STONEROOM
    EAX_ENVIRONMENT_AUDITORIUM
    EAX_ENVIRONMENT_CONCERTHALL
    EAX_ENVIRONMENT_CAVE
    EAX_ENVIRONMENT_ARENA
    EAX_ENVIRONMENT_HANGAR
    EAX_ENVIRONMENT_CARPETEDHALLWAY
    EAX_ENVIRONMENT_HALLWAY
    EAX_ENVIRONMENT_STONECORRIDOR
    EAX_ENVIRONMENT_ALLEY
    EAX_ENVIRONMENT_FOREST
    EAX_ENVIRONMENT_CITY
    EAX_ENVIRONMENT_MOUNTAINS
    EAX_ENVIRONMENT_QUARRY
    EAX_ENVIRONMENT_PLAIN
    EAX_ENVIRONMENT_PARKINGLOT
    EAX_ENVIRONMENT_SEWERPIPE
    EAX_ENVIRONMENT_UNDERWATER
    EAX_ENVIRONMENT_DRUGGED
    EAX_ENVIRONMENT_DIZZY
    EAX_ENVIRONMENT_PSYCHOTIC

    EAX_ENVIRONMENT_COUNT			;// total number of environments
]

;--- EAX presets, usage: BASS_SetEAXParameters(EAX_PRESET_xxx)
;@@ #define EAX_PRESET_GENERIC         EAX_ENVIRONMENT_GENERIC,0.5F,1.493F,0.5F
;@@ #define EAX_PRESET_PADDEDCELL      EAX_ENVIRONMENT_PADDEDCELL,0.25F,0.1F,0.0F
;@@ #define EAX_PRESET_ROOM            EAX_ENVIRONMENT_ROOM,0.417F,0.4F,0.666F
;@@ #define EAX_PRESET_BATHROOM        EAX_ENVIRONMENT_BATHROOM,0.653F,1.499F,0.166F
;@@ #define EAX_PRESET_LIVINGROOM      EAX_ENVIRONMENT_LIVINGROOM,0.208F,0.478F,0.0F
;@@ #define EAX_PRESET_STONEROOM       EAX_ENVIRONMENT_STONEROOM,0.5F,2.309F,0.888F
;@@ #define EAX_PRESET_AUDITORIUM      EAX_ENVIRONMENT_AUDITORIUM,0.403F,4.279F,0.5F
;@@ #define EAX_PRESET_CONCERTHALL     EAX_ENVIRONMENT_CONCERTHALL,0.5F,3.961F,0.5F
;@@ #define EAX_PRESET_CAVE            EAX_ENVIRONMENT_CAVE,0.5F,2.886F,1.304F
;@@ #define EAX_PRESET_ARENA           EAX_ENVIRONMENT_ARENA,0.361F,7.284F,0.332F
;@@ #define EAX_PRESET_HANGAR          EAX_ENVIRONMENT_HANGAR,0.5F,10.0F,0.3F
;@@ #define EAX_PRESET_CARPETEDHALLWAY EAX_ENVIRONMENT_CARPETEDHALLWAY,0.153F,0.259F,2.0F
;@@ #define EAX_PRESET_HALLWAY         EAX_ENVIRONMENT_HALLWAY,0.361F,1.493F,0.0F
;@@ #define EAX_PRESET_STONECORRIDOR   EAX_ENVIRONMENT_STONECORRIDOR,0.444F,2.697F,0.638F
;@@ #define EAX_PRESET_ALLEY           EAX_ENVIRONMENT_ALLEY,0.25F,1.752F,0.776F
;@@ #define EAX_PRESET_FOREST          EAX_ENVIRONMENT_FOREST,0.111F,3.145F,0.472F
;@@ #define EAX_PRESET_CITY            EAX_ENVIRONMENT_CITY,0.111F,2.767F,0.224F
;@@ #define EAX_PRESET_MOUNTAINS       EAX_ENVIRONMENT_MOUNTAINS,0.194F,7.841F,0.472F
;@@ #define EAX_PRESET_QUARRY          EAX_ENVIRONMENT_QUARRY,1.0F,1.499F,0.5F
;@@ #define EAX_PRESET_PLAIN           EAX_ENVIRONMENT_PLAIN,0.097F,2.767F,0.224F
;@@ #define EAX_PRESET_PARKINGLOT      EAX_ENVIRONMENT_PARKINGLOT,0.208F,1.652F,1.5F
;@@ #define EAX_PRESET_SEWERPIPE       EAX_ENVIRONMENT_SEWERPIPE,0.652F,2.886F,0.25F
;@@ #define EAX_PRESET_UNDERWATER      EAX_ENVIRONMENT_UNDERWATER,1.0F,1.499F,0.0F
;@@ #define EAX_PRESET_DRUGGED         EAX_ENVIRONMENT_DRUGGED,0.875F,8.392F,1.388F
;@@ #define EAX_PRESET_DIZZY           EAX_ENVIRONMENT_DIZZY,0.139F,17.234F,0.666F
;@@ #define EAX_PRESET_PSYCHOTIC       EAX_ENVIRONMENT_PSYCHOTIC,0.486F,7.563F,0.806F

;-- User stream callback function.
#define STREAMPROC! [function! [handle [HSTREAM!] buffer [byte-ptr!] length [integer!] user [int-ptr!] return: [integer!]]]
;A stream function should obviously be as quick
;as possible, other streams (and MOD musics) can't be mixed until it's finished.
;handle : The stream that needs writing
;buffer : Buffer to write the samples in
;length : Number of bytes to write
;user   : The 'user' parameter value given when calling BASS_StreamCreate
;RETURN : Number of bytes written. Set the BASS_STREAMPROC_END flag to end the stream. 

#define BASS_STREAMPROC_END		80000000h	;// end of user stream flag

;-- BASS_StreamCreateFileUser file systems
#define STREAMFILE_NOBUFFER		0
#define STREAMFILE_BUFFER		1
#define STREAMFILE_BUFFERPUSH	2

;-- User file stream callback functions
#define FILECLOSEPROC! [function! [user [int-ptr!]]]
#define FILELENPROC!   [function! [user [int-ptr!] return: [long-long-ptr!]]]
#define FILEREADPROC!  [function! [buffer [byte-ptr!] length [integer!] user [int-ptr!] return: [integer!]]]
#define FILESEEKPROC!  [function! [offset [long-long!] user [int-ptr!] return: [BOOL!]]]

BASS_FILEPROCS!: alias struct! [
	close  [FILECLOSEPROC!]
	length [FILELENPROC!]
	read   [FILEREADPROC!]
	seek   [FILESEEKPROC!]
]

;-- BASS_StreamPutFileData options
#define BASS_FILEDATA_END		0	;// end & close the file

;-- BASS_StreamGetFilePosition modes
#define BASS_FILEPOS_CURRENT	0
#define BASS_FILEPOS_DECODE		BASS_FILEPOS_CURRENT
#define BASS_FILEPOS_DOWNLOAD	1
#define BASS_FILEPOS_END		2
#define BASS_FILEPOS_START		3
#define BASS_FILEPOS_CONNECTED	4
#define BASS_FILEPOS_BUFFER		5
#define BASS_FILEPOS_SOCKET		6
#define BASS_FILEPOS_ASYNCBUF	7
#define BASS_FILEPOS_SIZE		8

;-- Internet stream download callback function.
#define DOWNLOADPROC! [function! [buffer [byte-ptr!] length [integer!] user [int-ptr!]]]
;buffer : Buffer containing the downloaded data... NULL=end of download
;length : Number of bytes in the buffer
;user   : The 'user' parameter value given when calling BASS_StreamCreateURL

;-- BASS_ChannelSetSync types
#define BASS_SYNC_POS			0
#define BASS_SYNC_END			2
#define BASS_SYNC_META			4
#define BASS_SYNC_SLIDE			5
#define BASS_SYNC_STALL			6
#define BASS_SYNC_DOWNLOAD		7
#define BASS_SYNC_FREE			8
#define BASS_SYNC_SETPOS		11
#define BASS_SYNC_MUSICPOS		10
#define BASS_SYNC_MUSICINST		1
#define BASS_SYNC_MUSICFX		3
#define BASS_SYNC_OGG_CHANGE	12
#define BASS_SYNC_MIXTIME		40000000h	;// flag: sync at mixtime, else at playtime
#define BASS_SYNC_ONETIME		80000000h	;// flag: sync only once, else continuously

;-- Sync callback function.
#define SYNCPROC! [function! [handle [HSYNC!] channel [integer!] data [integer!] user [int-ptr!]]]
;NOTE: a sync callback function should be very
;quick as other syncs can't be processed until it has finished. If the sync
;is a "mixtime" sync, then other streams and MOD musics can't be mixed until
;it's finished either.
;handle : The sync that has occured
;channel: Channel that the sync occured in
;data   : Additional data associated with the sync's occurance
;user   : The 'user' parameter given when calling BASS_ChannelSetSync 

;-- DSP callback function.
#define DSPPROC! [function! [handle [HDSP!] channel [integer!] buffer [byte-ptr!] length [integer!] user [int-ptr!]]]
;NOTE: A DSP function should obviously be as quick as
;possible... other DSP functions, streams and MOD musics can not be processed
;until it's finished.
;handle : The DSP handle
;channel: Channel that the DSP is being applied to
;buffer : Buffer to apply the DSP to
;length : Number of bytes in the buffer
;user   : The 'user' parameter given when calling BASS_ChannelSetDSP 

;-- Recording callback function.
#define RECORDPROC! [function! [handle [HRECORD!] buffer [byte-ptr!] length [integer!] user [int-ptr!] return: [BOOL!]]]
;handle : The recording handle
;buffer : Buffer containing the recorded sample data
;length : Number of bytes
;user   : The 'user' parameter value given when calling BASS_RecordStart
;RETURN : TRUE = continue recording, FALSE = stop */

;-- BASS_ChannelIsActive return values
#define BASS_ACTIVE_STOPPED	0
#define BASS_ACTIVE_PLAYING	1
#define BASS_ACTIVE_STALLED	2
#define BASS_ACTIVE_PAUSED	3

;-- Channel attributes
#define BASS_ATTRIB_FREQ			 1
#define BASS_ATTRIB_VOL				 2
#define BASS_ATTRIB_PAN				 3
#define BASS_ATTRIB_EAXMIX			 4
#define BASS_ATTRIB_NOBUFFER		 5
#define BASS_ATTRIB_VBR				 6
#define BASS_ATTRIB_CPU				 7
#define BASS_ATTRIB_SRC				 8
#define BASS_ATTRIB_NET_RESUME		 9
#define BASS_ATTRIB_SCANINFO		 10
#define BASS_ATTRIB_NORAMP			 11
#define BASS_ATTRIB_BITRATE			 12
#define BASS_ATTRIB_MUSIC_AMPLIFY	 0100h
#define BASS_ATTRIB_MUSIC_PANSEP	 0101h
#define BASS_ATTRIB_MUSIC_PSCALER	 0102h
#define BASS_ATTRIB_MUSIC_BPM		 0103h
#define BASS_ATTRIB_MUSIC_SPEED		 0104h
#define BASS_ATTRIB_MUSIC_VOL_GLOBAL 0105h
#define BASS_ATTRIB_MUSIC_ACTIVE	 0106h
#define BASS_ATTRIB_MUSIC_VOL_CHAN	 0200h ;// + channel #
#define BASS_ATTRIB_MUSIC_VOL_INST	 0300h ;// + instrument #

;-- BASS_ChannelGetData flags
#define BASS_DATA_AVAILABLE	0			;// query how much data is buffered
#define BASS_DATA_FIXED		20000000h	;// flag: return 8.24 fixed-point data
#define BASS_DATA_FLOAT		40000000h	;// flag: return floating-point sample data
#define BASS_DATA_FFT256	80000000h	;// 256 sample FFT
#define BASS_DATA_FFT512	80000001h	;// 512 FFT
#define BASS_DATA_FFT1024	80000002h	;// 1024 FFT
#define BASS_DATA_FFT2048	80000003h	;// 2048 FFT
#define BASS_DATA_FFT4096	80000004h	;// 4096 FFT
#define BASS_DATA_FFT8192	80000005h	;// 8192 FFT
#define BASS_DATA_FFT16384	80000006h	;// 16384 FFT
#define BASS_DATA_FFT32768	80000007h	;// 32768 FFT
#define BASS_DATA_FFT_INDIVIDUAL 10h	;// FFT flag: FFT for each channel, else all combined
#define BASS_DATA_FFT_NOWINDOW	 20h	;// FFT flag: no Hanning window
#define BASS_DATA_FFT_REMOVEDC	 40h	;// FFT flag: pre-remove DC bias
#define BASS_DATA_FFT_COMPLEX	 80h	;// FFT flag: return complex data

;-- BASS_ChannelGetLevelEx flags
#define BASS_LEVEL_MONO		1
#define BASS_LEVEL_STEREO	2
#define BASS_LEVEL_RMS		4

;-- BASS_ChannelGetTags types : what's returned
#define BASS_TAG_ID3		0	;// ID3v1 tags : TAG_ID3 structure
#define BASS_TAG_ID3V2		1	;// ID3v2 tags : variable length block
#define BASS_TAG_OGG		2	;// OGG comments : series of null-terminated UTF-8 strings
#define BASS_TAG_HTTP		3	;// HTTP headers : series of null-terminated ANSI strings
#define BASS_TAG_ICY		4	;// ICY headers : series of null-terminated ANSI strings
#define BASS_TAG_META		5	;// ICY metadata : ANSI string
#define BASS_TAG_APE		6	;// APE tags : series of null-terminated UTF-8 strings
#define BASS_TAG_MP4 		7	;// MP4/iTunes metadata : series of null-terminated UTF-8 strings
#define BASS_TAG_WMA		8	;// WMA tags : series of null-terminated UTF-8 strings
#define BASS_TAG_VENDOR		9	;// OGG encoder : UTF-8 string
#define BASS_TAG_LYRICS3	10	;// Lyric3v2 tag : ASCII string
#define BASS_TAG_CA_CODEC	11	;// CoreAudio codec info : TAG_CA_CODEC structure
#define BASS_TAG_MF			13	;// Media Foundation tags : series of null-terminated UTF-8 strings
#define BASS_TAG_WAVEFORMAT	14	;// WAVE format : WAVEFORMATEEX structure
#define BASS_TAG_RIFF_INFO	0100h ;// RIFF "INFO" tags : series of null-terminated ANSI strings
#define BASS_TAG_RIFF_BEXT	0101h ;// RIFF/BWF "bext" tags : TAG_BEXT structure
#define BASS_TAG_RIFF_CART	0102h ;// RIFF/BWF "cart" tags : TAG_CART structure
#define BASS_TAG_RIFF_DISP	0103h ;// RIFF "DISP" text tag : ANSI string
#define BASS_TAG_APE_BINARY	1000h ;// + index #, binary APE tag : TAG_APE_BINARY structure
#define BASS_TAG_MUSIC_NAME		00010000h	;// MOD music name : ANSI string
#define BASS_TAG_MUSIC_MESSAGE	00010001h	;// MOD message : ANSI string
#define BASS_TAG_MUSIC_ORDERS	00010002h	;// MOD order list : BYTE array of pattern numbers
#define BASS_TAG_MUSIC_AUTH		00010003h	;// MOD author : UTF-8 string
#define BASS_TAG_MUSIC_INST		00010100h	;// + instrument #, MOD instrument name : ANSI string
#define BASS_TAG_MUSIC_SAMPLE	00010300h	;// + sample #, MOD sample name : ANSI string

;-- ID3v1 tag structure
;@@TAG_ID3!: alias struct! [
;@@	char id[3];
;@@	char title[30];
;@@	char artist[30];
;@@	char album[30];
;@@	char year[4];
;@@	char comment[30];
;@@	BYTE genre;
;@@]
#define TAG_ID3! int-ptr!

;-- Binary APE tag structure
TAG_APE_BINARY!: alias struct! [
	key    [c-string!]
	data   [byte-ptr!]
	length [integer!]
]

#define TAG_BEXT! int-ptr!
#define TAG_CART! int-ptr!

;-- BASS_ChannelGetLength/GetPosition/SetPosition modes
#define BASS_POS_BYTE			0		  ;// byte position
#define BASS_POS_MUSIC_ORDER	1		  ;// order.row position, MAKELONG(order,row)
#define BASS_POS_OGG			3		  ;// OGG bitstream number
#define BASS_POS_INEXACT		08000000h ;// flag: allow seeking to inexact position
#define BASS_POS_DECODE			10000000h ;// flag: get the decoding (not playing) position
#define BASS_POS_DECODETO		20000000h ;// flag: decode to the position instead of seeking
#define BASS_POS_SCAN			40000000h ;// flag: scan to the position

;-- BASS_RecordSetInput flags
#define BASS_INPUT_OFF		00010000h
#define BASS_INPUT_ON		00020000h

#define BASS_INPUT_TYPE_MASK		FF000000h
#define BASS_INPUT_TYPE_UNDEF		00000000h
#define BASS_INPUT_TYPE_DIGITAL		01000000h
#define BASS_INPUT_TYPE_LINE		02000000h
#define BASS_INPUT_TYPE_MIC			03000000h
#define BASS_INPUT_TYPE_SYNTH		04000000h
#define BASS_INPUT_TYPE_CD			05000000h
#define BASS_INPUT_TYPE_PHONE		06000000h
#define BASS_INPUT_TYPE_SPEAKER		07000000h
#define BASS_INPUT_TYPE_WAVE		08000000h
#define BASS_INPUT_TYPE_AUX			09000000h
#define BASS_INPUT_TYPE_ANALOG		0A000000h

;-- DX8 effect types, use with BASS_ChannelSetFX
#enum BASS_FX_DX8! [
	BASS_FX_DX8_CHORUS
	BASS_FX_DX8_COMPRESSOR
	BASS_FX_DX8_DISTORTION
	BASS_FX_DX8_ECHO
	BASS_FX_DX8_FLANGER
	BASS_FX_DX8_GARGLE
	BASS_FX_DX8_I3DL2REVERB
	BASS_FX_DX8_PARAMEQ
	BASS_FX_DX8_REVERB
]

BASS_DX8_CHORUS!: alias struct! [
    fWetDryMix  [float32!]
    fDepth      [float32!]
    fFeedback   [float32!]
    fFrequency  [float32!]
    lWaveform   [integer!] ;// 0=triangle, 1=sine
    fDelay      [float32!]
    lPhase      [integer!] ;// BASS_DX8_PHASE_xxx
]

BASS_DX8_COMPRESSOR!: alias struct! [
    fGain       [float32!]
    fAttack     [float32!]
    fRelease    [float32!]
    fThreshold  [float32!]
    fRatio      [float32!]
    fPredelay   [float32!]
]

BASS_DX8_DISTORTION!: alias struct! [
    fGain                  [float32!]
    fEdge                  [float32!]
    fPostEQCenterFrequency [float32!]
    fPostEQBandwidth       [float32!]
    fPreLowpassCutoff      [float32!]
]

BASS_DX8_ECHO!: alias struct! [
    fWetDryMix   [float32!]
    fFeedback    [float32!]
    fLeftDelay   [float32!]
    fRightDelay  [float32!]
    lPanDelay    [BOOL!]
]

BASS_DX8_FLANGER!: alias struct! [
    fWetDryMix   [float32!]
    fDepth       [float32!]
    fFeedback    [float32!]
    fFrequency   [float32!]
    lWaveform    [integer!] ;// 0=triangle, 1=sine
    fDelay       [float32!]
    lPhase       [integer!] ;// BASS_DX8_PHASE_xxx
]

BASS_DX8_GARGLE!: alias struct! [
    dwRateHz     [integer!] ;// Rate of modulation in hz
    dwWaveShape  [integer!] ;// 0=triangle, 1=square
]

BASS_DX8_I3DL2REVERB!: alias struct! [
    lRoom               [integer!] ;// [-10000, 0]      default: -1000 mB
    lRoomHF             [integer!] ;// [-10000, 0]      default: 0 mB
    flRoomRolloffFactor [float32!] ;// [0.0, 10.0]      default: 0.0
    flDecayTime         [float32!] ;// [0.1, 20.0]      default: 1.49s
    flDecayHFRatio      [float32!] ;// [0.1, 2.0]       default: 0.83
    lReflections        [integer!] ;// [-10000, 1000]   default: -2602 mB
    flReflectionsDelay  [float32!] ;// [0.0, 0.3]       default: 0.007 s
    lReverb             [integer!] ;// [-10000, 2000]   default: 200 mB
    flReverbDelay       [float32!] ;// [0.0, 0.1]       default: 0.011 s
    flDiffusion         [float32!] ;// [0.0, 100.0]     default: 100.0 %
    flDensity           [float32!] ;// [0.0, 100.0]     default: 100.0 %
    flHFReference       [float32!] ;// [20.0, 20000.0]  default: 5000.0 Hz
]

BASS_DX8_PARAMEQ!: alias struct! [
    fCenter     [float32!] 
    fBandwidth  [float32!]
    fGain       [float32!]
]

BASS_DX8_REVERB!: alias struct! [
    fInGain          [float32!] ;// [-96.0,0.0]            default: 0.0 dB
    fReverbMix       [float32!] ;// [-96.0,0.0]            default: 0.0 db
    fReverbTime      [float32!] ;// [0.001,3000.0]         default: 1000.0 ms
    fHighFreqRTRatio [float32!] ;// [0.001,0.999]          default: 0.001
]

#define BASS_DX8_PHASE_NEG_180        0
#define BASS_DX8_PHASE_NEG_90         1
#define BASS_DX8_PHASE_ZERO           2
#define BASS_DX8_PHASE_90             3
#define BASS_DX8_PHASE_180            4


#import [
	BASS_LIBRARY stdcall [
		BASS_SetConfig: "BASS_SetConfig"[
		;BOOL BASSDEF(BASS_SetConfig)(DWORD option, DWORD value);
			option                        [integer!]
			value                         [integer!]
			return:                       [BOOL!]
		]
		BASS_GetConfig: "BASS_GetConfig"[
		;DWORD BASSDEF(BASS_GetConfig)(DWORD option);
			option                        [integer!]
			return:                       [integer!]
		]
		BASS_SetConfigPtr: "BASS_SetConfigPtr"[
		;BOOL BASSDEF(BASS_SetConfigPtr)(DWORD option, const void *value);
			option                        [integer!]
			value                         [int-ptr!]
			return:                       [BOOL!]
		]
		BASS_GetVersion: "BASS_GetVersion"[
		;DWORD BASSDEF(BASS_GetVersion)();
			return:                       [integer!]
		]
		BASS_ErrorGetCode: "BASS_ErrorGetCode"[
		;int BASSDEF(BASS_ErrorGetCode)();
			return:                       [integer!]
		]
		BASS_GetDeviceInfo: "BASS_GetDeviceInfo"[
		;BOOL BASSDEF(BASS_GetDeviceInfo)(DWORD device, BASS_DEVICEINFO *info);
			device                        [integer!]
			info                          [BASS_DEVICEINFO!]
			return:                       [BOOL!]
		]
		BASS_Init: "BASS_Init"[
		;BOOL BASSDEF(BASS_Init)(int device, DWORD freq, DWORD flags, void *win, void *dsguid);
			device                        [integer!]
			freq                          [integer!]
			flags                         [integer!]
			win                           [integer!]
			dsguid                        [int-ptr!]
			return:                       [BOOL!]
		]
		BASS_SetDevice: "BASS_SetDevice"[
		;BOOL BASSDEF(BASS_SetDevice)(DWORD device);
			device                        [integer!]
			return:                       [BOOL!]
		]
		BASS_GetDevice: "BASS_GetDevice"[
		;DWORD BASSDEF(BASS_GetDevice)();
			return:                       [integer!]
		]
		BASS_Free: "BASS_Free"[
		;BOOL BASSDEF(BASS_Free)();
			return:                       [BOOL!]
		]
		BASS_GetInfo: "BASS_GetInfo"[
		;BOOL BASSDEF(BASS_GetInfo)(BASS_INFO *info);
			info                          [BASS_INFO!]
			return:                       [BOOL!]
		]
		BASS_Update: "BASS_Update"[
		;BOOL BASSDEF(BASS_Update)(DWORD length);
			length                        [integer!]
			return:                       [BOOL!]
		]
		BASS_GetCPU: "BASS_GetCPU"[
		;float BASSDEF(BASS_GetCPU)();
			return:                       [float32!]
		]
		BASS_Start: "BASS_Start"[
		;BOOL BASSDEF(BASS_Start)();
			return:                       [BOOL!]
		]
		BASS_Stop: "BASS_Stop"[
		;BOOL BASSDEF(BASS_Stop)();
			return:                       [BOOL!]
		]
		BASS_Pause: "BASS_Pause"[
		;BOOL BASSDEF(BASS_Pause)();
			return:                       [BOOL!]
		]
		BASS_SetVolume: "BASS_SetVolume"[
		;BOOL BASSDEF(BASS_SetVolume)(float volume);
			volume                        [float32!]
			return:                       [BOOL!]
		]
		BASS_GetVolume: "BASS_GetVolume"[
		;float BASSDEF(BASS_GetVolume)();
			return:                       [float32!]
		]
		BASS_PluginLoad: "BASS_PluginLoad"[
		;HPLUGIN BASSDEF(BASS_PluginLoad)(const char *file, DWORD flags);
			file                          [int-ptr!]
			flags                         [integer!]
			return:                       [HPLUGIN!]
		]
		BASS_PluginFree: "BASS_PluginFree"[
		;BOOL BASSDEF(BASS_PluginFree)(HPLUGIN handle);
			handle                        [HPLUGIN!]
			return:                       [BOOL!]
		]
		BASS_Set3DFactors: "BASS_Set3DFactors"[
		;BOOL BASSDEF(BASS_Set3DFactors)(float distf, float rollf, float doppf);
			distf                         [float32!]
			rollf                         [float32!]
			doppf                         [float32!]
			return:                       [BOOL!]
		]
		BASS_Get3DFactors: "BASS_Get3DFactors"[
		;BOOL BASSDEF(BASS_Get3DFactors)(float *distf, float *rollf, float *doppf);
			distf                         [pointer! [float32!]]
			rollf                         [pointer! [float32!]]
			doppf                         [pointer! [float32!]]
			return:                       [BOOL!]
		]
		BASS_Set3DPosition: "BASS_Set3DPosition"[
		;BOOL BASSDEF(BASS_Set3DPosition)(const BASS_3DVECTOR *pos, const BASS_3DVECTOR *vel, const BASS_3DVECTOR *front, const BASS_3DVECTOR *top);
			pos                           [int-ptr!]
			vel                           [int-ptr!]
			front                         [int-ptr!]
			top                           [int-ptr!]
			return:                       [BOOL!]
		]
		BASS_Get3DPosition: "BASS_Get3DPosition"[
		;BOOL BASSDEF(BASS_Get3DPosition)(BASS_3DVECTOR *pos, BASS_3DVECTOR *vel, BASS_3DVECTOR *front, BASS_3DVECTOR *top);
			pos                           [BASS_3DVECTOR!]
			vel                           [BASS_3DVECTOR!]
			front                         [BASS_3DVECTOR!]
			top                           [BASS_3DVECTOR!]
			return:                       [BOOL!]
		]
		BASS_Apply3D: "BASS_Apply3D"[
		;void BASSDEF(BASS_Apply3D)();
		]
		BASS_SetEAXParameters: "BASS_SetEAXParameters"[
		;BOOL BASSDEF(BASS_SetEAXParameters)(int env, float vol, float decay, float damp);
			env                           [integer!]
			vol                           [float32!]
			decay                         [float32!]
			damp                          [float32!]
			return:                       [BOOL!]
		]
		BASS_GetEAXParameters: "BASS_GetEAXParameters"[
		;BOOL BASSDEF(BASS_GetEAXParameters)(DWORD *env, float *vol, float *decay, float *damp);
			env                           [int-ptr!]
			vol                           [pointer! [float32!]]
			decay                         [pointer! [float32!]]
			damp                          [pointer! [float32!]]
			return:                       [BOOL!]
		]
		BASS_MusicLoad: "BASS_MusicLoad"[
		;HMUSIC BASSDEF(BASS_MusicLoad)(BOOL mem, const void *file, QWORD offset, DWORD length, DWORD flags, DWORD freq);
			mem                           [BOOL!]
			file                          [c-string!]
			offset                        [long-long!]
			length                        [integer!]
			flags                         [integer!]
			freq                          [integer!]
			return:                       [HMUSIC!]
		]
		BASS_MusicFree: "BASS_MusicFree"[
		;BOOL BASSDEF(BASS_MusicFree)(HMUSIC handle);
			handle                        [HMUSIC!]
			return:                       [BOOL!]
		]
		BASS_SampleLoad: "BASS_SampleLoad"[
		;HSAMPLE BASSDEF(BASS_SampleLoad)(BOOL mem, const void *file, QWORD offset, DWORD length, DWORD max, DWORD flags);
			mem                           [BOOL!]
			file                          [c-string!]
			offset                        [long-long!]
			length                        [integer!]
			max                           [integer!]
			flags                         [integer!]
			return:                       [HSAMPLE!]
		]
		BASS_SampleCreate: "BASS_SampleCreate"[
		;HSAMPLE BASSDEF(BASS_SampleCreate)(DWORD length, DWORD freq, DWORD chans, DWORD max, DWORD flags);
			length                        [integer!]
			freq                          [integer!]
			chans                         [integer!]
			max                           [integer!]
			flags                         [integer!]
			return:                       [HSAMPLE!]
		]
		BASS_SampleFree: "BASS_SampleFree"[
		;BOOL BASSDEF(BASS_SampleFree)(HSAMPLE handle);
			handle                        [HSAMPLE!]
			return:                       [BOOL!]
		]
		BASS_SampleSetData: "BASS_SampleSetData"[
		;BOOL BASSDEF(BASS_SampleSetData)(HSAMPLE handle, const void *buffer);
			handle                        [HSAMPLE!]
			buffer                        [int-ptr!]
			return:                       [BOOL!]
		]
		BASS_SampleGetData: "BASS_SampleGetData"[
		;BOOL BASSDEF(BASS_SampleGetData)(HSAMPLE handle, void *buffer);
			handle                        [HSAMPLE!]
			buffer                        [int-ptr!]
			return:                       [BOOL!]
		]
		BASS_SampleGetInfo: "BASS_SampleGetInfo"[
		;BOOL BASSDEF(BASS_SampleGetInfo)(HSAMPLE handle, BASS_SAMPLE *info);
			handle                        [HSAMPLE!]
			info                          [BASS_SAMPLE!]
			return:                       [BOOL!]
		]
		BASS_SampleSetInfo: "BASS_SampleSetInfo"[
		;BOOL BASSDEF(BASS_SampleSetInfo)(HSAMPLE handle, const BASS_SAMPLE *info);
			handle                        [HSAMPLE!]
			info                          [BASS_SAMPLE!]
			return:                       [BOOL!]
		]
		BASS_SampleGetChannel: "BASS_SampleGetChannel"[
		;HCHANNEL BASSDEF(BASS_SampleGetChannel)(HSAMPLE handle, BOOL onlynew);
			handle                        [HSAMPLE!]
			onlynew                       [BOOL!]
			return:                       [HCHANNEL!]
		]
		BASS_SampleGetChannels: "BASS_SampleGetChannels"[
		;DWORD BASSDEF(BASS_SampleGetChannels)(HSAMPLE handle, HCHANNEL *channels);
			handle                        [HSAMPLE!]
			channels                      [HCHANNEL!]
			return:                       [integer!]
		]
		BASS_SampleStop: "BASS_SampleStop"[
		;BOOL BASSDEF(BASS_SampleStop)(HSAMPLE handle);
			handle                        [HSAMPLE!]
			return:                       [BOOL!]
		]
		BASS_StreamCreate: "BASS_StreamCreate"[
		;HSTREAM BASSDEF(BASS_StreamCreate)(DWORD freq, DWORD chans, DWORD flags, STREAMPROC *proc, void *user);
			freq                          [integer!]
			chans                         [integer!]
			flags                         [integer!]
			proc                          [STREAMPROC!]
			user                          [int-ptr!]
			return:                       [HSTREAM!]
		]
		BASS_StreamCreateFile: "BASS_StreamCreateFile"[
		;HSTREAM BASSDEF(BASS_StreamCreateFile)(BOOL mem, const void *file, QWORD offset, QWORD length, DWORD flags);
			mem                           [BOOL!]
			file                          [int-ptr!]
			offset                        [long-long-ptr!]
			length                        [long-long-ptr!]
			flags                         [integer!]
			return:                       [HSTREAM!]
		]
		BASS_StreamCreateURL: "BASS_StreamCreateURL"[
		;HSTREAM BASSDEF(BASS_StreamCreateURL)(const char *url, DWORD offset, DWORD flags, DOWNLOADPROC *proc, void *user);
			url                           [int-ptr!]
			offset                        [integer!]
			flags                         [integer!]
			proc                          [DOWNLOADPROC!]
			user                          [int-ptr!]
			return:                       [HSTREAM!]
		]
		BASS_StreamCreateFileUser: "BASS_StreamCreateFileUser"[
		;HSTREAM BASSDEF(BASS_StreamCreateFileUser)(DWORD system, DWORD flags, const BASS_FILEPROCS *proc, void *user);
			system                        [integer!]
			flags                         [integer!]
			proc                          [int-ptr!]
			user                          [int-ptr!]
			return:                       [HSTREAM!]
		]
		BASS_StreamFree: "BASS_StreamFree"[
		;BOOL BASSDEF(BASS_StreamFree)(HSTREAM handle);
			handle                        [HSTREAM!]
			return:                       [BOOL!]
		]
		BASS_StreamGetFilePosition: "BASS_StreamGetFilePosition"[
		;QWORD BASSDEF(BASS_StreamGetFilePosition)(HSTREAM handle, DWORD mode);
			handle                        [HSTREAM!]
			mode                          [integer!]
			return:                       [long-long-ptr!]
		]
		BASS_StreamPutData: "BASS_StreamPutData"[
		;DWORD BASSDEF(BASS_StreamPutData)(HSTREAM handle, const void *buffer, DWORD length);
			handle                        [HSTREAM!]
			buffer                        [int-ptr!]
			length                        [integer!]
			return:                       [integer!]
		]
		BASS_StreamPutFileData: "BASS_StreamPutFileData"[
		;DWORD BASSDEF(BASS_StreamPutFileData)(HSTREAM handle, const void *buffer, DWORD length);
			handle                        [HSTREAM!]
			buffer                        [int-ptr!]
			length                        [integer!]
			return:                       [integer!]
		]
		BASS_RecordGetDeviceInfo: "BASS_RecordGetDeviceInfo"[
		;BOOL BASSDEF(BASS_RecordGetDeviceInfo)(DWORD device, BASS_DEVICEINFO *info);
			device                        [integer!]
			info                          [BASS_DEVICEINFO!]
			return:                       [BOOL!]
		]
		BASS_RecordInit: "BASS_RecordInit"[
		;BOOL BASSDEF(BASS_RecordInit)(int device);
			device                        [integer!]
			return:                       [BOOL!]
		]
		BASS_RecordSetDevice: "BASS_RecordSetDevice"[
		;BOOL BASSDEF(BASS_RecordSetDevice)(DWORD device);
			device                        [integer!]
			return:                       [BOOL!]
		]
		BASS_RecordGetDevice: "BASS_RecordGetDevice"[
		;DWORD BASSDEF(BASS_RecordGetDevice)();
			return:                       [integer!]
		]
		BASS_RecordFree: "BASS_RecordFree"[
		;BOOL BASSDEF(BASS_RecordFree)();
			return:                       [BOOL!]
		]
		BASS_RecordGetInfo: "BASS_RecordGetInfo"[
		;BOOL BASSDEF(BASS_RecordGetInfo)(BASS_RECORDINFO *info);
			info                          [BASS_RECORDINFO!]
			return:                       [BOOL!]
		]
		BASS_RecordSetInput: "BASS_RecordSetInput"[
		;BOOL BASSDEF(BASS_RecordSetInput)(int input, DWORD flags, float volume);
			input                         [integer!]
			flags                         [integer!]
			volume                        [float32!]
			return:                       [BOOL!]
		]
		BASS_RecordGetInput: "BASS_RecordGetInput"[
		;DWORD BASSDEF(BASS_RecordGetInput)(int input, float *volume);
			input                         [integer!]
			volume                        [pointer! [float32!]]
			return:                       [integer!]
		]
		BASS_RecordStart: "BASS_RecordStart"[
		;HRECORD BASSDEF(BASS_RecordStart)(DWORD freq, DWORD chans, DWORD flags, RECORDPROC *proc, void *user);
			freq                          [integer!]
			chans                         [integer!]
			flags                         [integer!]
			proc                          [RECORDPROC!]
			user                          [int-ptr!]
			return:                       [HRECORD!]
		]
		BASS_ChannelBytes2Seconds: "BASS_ChannelBytes2Seconds"[
		;double BASSDEF(BASS_ChannelBytes2Seconds)(DWORD handle, QWORD pos);
			handle                        [integer!]
			pos                           [long-long-ptr!]
			return:                       [float!]
		]
		BASS_ChannelSeconds2Bytes: "BASS_ChannelSeconds2Bytes"[
		;QWORD BASSDEF(BASS_ChannelSeconds2Bytes)(DWORD handle, double pos);
			handle                        [integer!]
			pos                           [float!]
			return:                       [long-long-ptr!]
		]
		BASS_ChannelGetDevice: "BASS_ChannelGetDevice"[
		;DWORD BASSDEF(BASS_ChannelGetDevice)(DWORD handle);
			handle                        [integer!]
			return:                       [integer!]
		]
		BASS_ChannelSetDevice: "BASS_ChannelSetDevice"[
		;BOOL BASSDEF(BASS_ChannelSetDevice)(DWORD handle, DWORD device);
			handle                        [integer!]
			device                        [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelIsActive: "BASS_ChannelIsActive"[
		;DWORD BASSDEF(BASS_ChannelIsActive)(DWORD handle);
			handle                        [integer!]
			return:                       [integer!]
		]
		BASS_ChannelGetInfo: "BASS_ChannelGetInfo"[
		;BOOL BASSDEF(BASS_ChannelGetInfo)(DWORD handle, BASS_CHANNELINFO *info);
			handle                        [integer!]
			info                          [BASS_CHANNELINFO!]
			return:                       [BOOL!]
		]
		BASS_ChannelFlags: "BASS_ChannelFlags"[
		;DWORD BASSDEF(BASS_ChannelFlags)(DWORD handle, DWORD flags, DWORD mask);
			handle                        [integer!]
			flags                         [integer!]
			mask                          [integer!]
			return:                       [integer!]
		]
		BASS_ChannelUpdate: "BASS_ChannelUpdate"[
		;BOOL BASSDEF(BASS_ChannelUpdate)(DWORD handle, DWORD length);
			handle                        [integer!]
			length                        [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelLock: "BASS_ChannelLock"[
		;BOOL BASSDEF(BASS_ChannelLock)(DWORD handle, BOOL lock);
			handle                        [integer!]
			lock                          [BOOL!]
			return:                       [BOOL!]
		]
		BASS_ChannelPlay: "BASS_ChannelPlay"[
		;BOOL BASSDEF(BASS_ChannelPlay)(DWORD handle, BOOL restart);
			handle                        [integer!]
			restart                       [BOOL!]
			return:                       [BOOL!]
		]
		BASS_ChannelStop: "BASS_ChannelStop"[
		;BOOL BASSDEF(BASS_ChannelStop)(DWORD handle);
			handle                        [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelPause: "BASS_ChannelPause"[
		;BOOL BASSDEF(BASS_ChannelPause)(DWORD handle);
			handle                        [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelSetAttribute: "BASS_ChannelSetAttribute"[
		;BOOL BASSDEF(BASS_ChannelSetAttribute)(DWORD handle, DWORD attrib, float value);
			handle                        [integer!]
			attrib                        [integer!]
			value                         [float32!]
			return:                       [BOOL!]
		]
		BASS_ChannelGetAttribute: "BASS_ChannelGetAttribute"[
		;BOOL BASSDEF(BASS_ChannelGetAttribute)(DWORD handle, DWORD attrib, float *value);
			handle                        [integer!]
			attrib                        [integer!]
			value                         [pointer! [float32!]]
			return:                       [BOOL!]
		]
		BASS_ChannelSlideAttribute: "BASS_ChannelSlideAttribute"[
		;BOOL BASSDEF(BASS_ChannelSlideAttribute)(DWORD handle, DWORD attrib, float value, DWORD time);
			handle                        [integer!]
			attrib                        [integer!]
			value                         [float32!]
			time                          [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelIsSliding: "BASS_ChannelIsSliding"[
		;BOOL BASSDEF(BASS_ChannelIsSliding)(DWORD handle, DWORD attrib);
			handle                        [integer!]
			attrib                        [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelSetAttributeEx: "BASS_ChannelSetAttributeEx"[
		;BOOL BASSDEF(BASS_ChannelSetAttributeEx)(DWORD handle, DWORD attrib, void *value, DWORD size);
			handle                        [integer!]
			attrib                        [integer!]
			value                         [int-ptr!]
			size                          [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelGetAttributeEx: "BASS_ChannelGetAttributeEx"[
		;DWORD BASSDEF(BASS_ChannelGetAttributeEx)(DWORD handle, DWORD attrib, void *value, DWORD size);
			handle                        [integer!]
			attrib                        [integer!]
			value                         [int-ptr!]
			size                          [integer!]
			return:                       [integer!]
		]
		BASS_ChannelSet3DAttributes: "BASS_ChannelSet3DAttributes"[
		;BOOL BASSDEF(BASS_ChannelSet3DAttributes)(DWORD handle, int mode, float min, float max, int iangle, int oangle, float outvol);
			handle                        [integer!]
			mode                          [integer!]
			min                           [float32!]
			max                           [float32!]
			iangle                        [integer!]
			oangle                        [integer!]
			outvol                        [float32!]
			return:                       [BOOL!]
		]
		BASS_ChannelGet3DAttributes: "BASS_ChannelGet3DAttributes"[
		;BOOL BASSDEF(BASS_ChannelGet3DAttributes)(DWORD handle, DWORD *mode, float *min, float *max, DWORD *iangle, DWORD *oangle, float *outvol);
			handle                        [integer!]
			mode                          [int-ptr!]
			min                           [pointer! [float32!]]
			max                           [pointer! [float32!]]
			iangle                        [int-ptr!]
			oangle                        [int-ptr!]
			outvol                        [pointer! [float32!]]
			return:                       [BOOL!]
		]
		BASS_ChannelSet3DPosition: "BASS_ChannelSet3DPosition"[
		;BOOL BASSDEF(BASS_ChannelSet3DPosition)(DWORD handle, const BASS_3DVECTOR *pos, const BASS_3DVECTOR *orient, const BASS_3DVECTOR *vel);
			handle                        [integer!]
			pos                           [int-ptr!]
			orient                        [int-ptr!]
			vel                           [int-ptr!]
			return:                       [BOOL!]
		]
		BASS_ChannelGet3DPosition: "BASS_ChannelGet3DPosition"[
		;BOOL BASSDEF(BASS_ChannelGet3DPosition)(DWORD handle, BASS_3DVECTOR *pos, BASS_3DVECTOR *orient, BASS_3DVECTOR *vel);
			handle                        [integer!]
			pos                           [BASS_3DVECTOR!]
			orient                        [BASS_3DVECTOR!]
			vel                           [BASS_3DVECTOR!]
			return:                       [BOOL!]
		]
		BASS_ChannelGetLength: "BASS_ChannelGetLength"[
		;QWORD BASSDEF(BASS_ChannelGetLength)(DWORD handle, DWORD mode);
			handle                        [integer!]
			mode                          [integer!]
			return:                       [long-long-ptr!]
		]
		BASS_ChannelSetPosition: "BASS_ChannelSetPosition"[
		;BOOL BASSDEF(BASS_ChannelSetPosition)(DWORD handle, QWORD pos, DWORD mode);
			handle                        [integer!]
			pos                           [long-long-ptr!]
			mode                          [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelGetPosition: "BASS_ChannelGetPosition"[
		;QWORD BASSDEF(BASS_ChannelGetPosition)(DWORD handle, DWORD mode);
			handle                        [integer!]
			mode                          [integer!]
			return:                       [long-long-ptr!]
		]
		BASS_ChannelGetLevel: "BASS_ChannelGetLevel"[
		;DWORD BASSDEF(BASS_ChannelGetLevel)(DWORD handle);
			handle                        [integer!]
			return:                       [integer!]
		]
		BASS_ChannelGetLevelEx: "BASS_ChannelGetLevelEx"[
		;BOOL BASSDEF(BASS_ChannelGetLevelEx)(DWORD handle, float *levels, float length, DWORD flags);
			handle                        [integer!]
			levels                        [pointer! [float32!]]
			length                        [float32!]
			flags                         [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelGetData: "BASS_ChannelGetData"[
		;DWORD BASSDEF(BASS_ChannelGetData)(DWORD handle, void *buffer, DWORD length);
			handle                        [integer!]
			buffer                        [int-ptr!]
			length                        [integer!]
			return:                       [integer!]
		]
		BASS_ChannelSetSync: "BASS_ChannelSetSync"[
		;HSYNC BASSDEF(BASS_ChannelSetSync)(DWORD handle, DWORD type, QWORD param, SYNCPROC *proc, void *user);
			handle                        [integer!]
			type                          [integer!]
			param                         [long-long-ptr!]
			proc                          [SYNCPROC!]
			user                          [int-ptr!]
			return:                       [HSYNC!]
		]
		BASS_ChannelRemoveSync: "BASS_ChannelRemoveSync"[
		;BOOL BASSDEF(BASS_ChannelRemoveSync)(DWORD handle, HSYNC sync);
			handle                        [integer!]
			sync                          [HSYNC!]
			return:                       [BOOL!]
		]
		BASS_ChannelSetDSP: "BASS_ChannelSetDSP"[
		;HDSP BASSDEF(BASS_ChannelSetDSP)(DWORD handle, DSPPROC *proc, void *user, int priority);
			handle                        [integer!]
			proc                          [DSPPROC!]
			user                          [int-ptr!]
			priority                      [integer!]
			return:                       [HDSP!]
		]
		BASS_ChannelRemoveDSP: "BASS_ChannelRemoveDSP"[
		;BOOL BASSDEF(BASS_ChannelRemoveDSP)(DWORD handle, HDSP dsp);
			handle                        [integer!]
			dsp                           [HDSP!]
			return:                       [BOOL!]
		]
		BASS_ChannelSetLink: "BASS_ChannelSetLink"[
		;BOOL BASSDEF(BASS_ChannelSetLink)(DWORD handle, DWORD chan);
			handle                        [integer!]
			chan                          [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelRemoveLink: "BASS_ChannelRemoveLink"[
		;BOOL BASSDEF(BASS_ChannelRemoveLink)(DWORD handle, DWORD chan);
			handle                        [integer!]
			chan                          [integer!]
			return:                       [BOOL!]
		]
		BASS_ChannelSetFX: "BASS_ChannelSetFX"[
		;HFX BASSDEF(BASS_ChannelSetFX)(DWORD handle, DWORD type, int priority);
			handle                        [integer!]
			type                          [integer!]
			priority                      [integer!]
			return:                       [HFX!]
		]
		BASS_ChannelRemoveFX: "BASS_ChannelRemoveFX"[
		;BOOL BASSDEF(BASS_ChannelRemoveFX)(DWORD handle, HFX fx);
			handle                        [integer!]
			fx                            [HFX!]
			return:                       [BOOL!]
		]
		BASS_FXSetParameters: "BASS_FXSetParameters"[
		;BOOL BASSDEF(BASS_FXSetParameters)(HFX handle, const void *params);
			handle                        [HFX!]
			params                        [int-ptr!]
			return:                       [BOOL!]
		]
		BASS_FXGetParameters: "BASS_FXGetParameters"[
		;BOOL BASSDEF(BASS_FXGetParameters)(HFX handle, void *params);
			handle                        [HFX!]
			params                        [int-ptr!]
			return:                       [BOOL!]
		]
		BASS_FXReset: "BASS_FXReset"[
		;BOOL BASSDEF(BASS_FXReset)(HFX handle);
			handle                        [HFX!]
			return:                       [BOOL!]
		]
		BASS_FXSetPriority: "BASS_FXSetPriority"[
		;BOOL BASSDEF(BASS_FXSetPriority)(HFX handle, int priority);
			handle                        [HFX!]
			priority                      [integer!]
			return:                       [BOOL!]
		]

	]
]
