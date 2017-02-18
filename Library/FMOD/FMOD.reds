Red/System [
	Title:   "Red/System FMOD binding"
	Author:  "Oldes"
	File: 	 %FMOD.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

#switch OS [
	Windows   [
		#define FMOD_LIBRARY "fmod.dll"
	]
	#default  [   ]
]

#define handle!           integer!
#define u-integer!        integer!  ;unsigned int

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

#define FMOD_RESULT!      integer!

#define FMOD_BOOL!                 integer! ;typedef int                        FMOD_BOOL;
#define FMOD_SYSTEM!               handle! ;typedef struct FMOD_SYSTEM         FMOD_SYSTEM;
#define FMOD_SOUND!                handle! ;typedef struct FMOD_SOUND          FMOD_SOUND;
#define FMOD_CHANNELCONTROL!       handle! ;typedef struct FMOD_CHANNELCONTROL FMOD_CHANNELCONTROL;
#define FMOD_CHANNEL!              handle! ;typedef struct FMOD_CHANNEL        FMOD_CHANNEL;
#define FMOD_CHANNELGROUP!         handle! ;typedef struct FMOD_CHANNELGROUP   FMOD_CHANNELGROUP;
#define FMOD_SOUNDGROUP!           handle! ;typedef struct FMOD_SOUNDGROUP     FMOD_SOUNDGROUP;
#define FMOD_REVERB3D!             handle! ;typedef struct FMOD_REVERB3D       FMOD_REVERB3D;
#define FMOD_DSP!                  handle! ;typedef struct FMOD_DSP            FMOD_DSP;
#define FMOD_DSPCONNECTION!        handle! ;typedef struct FMOD_DSPCONNECTION  FMOD_DSPCONNECTION;
#define FMOD_POLYGON!              handle! ;typedef struct FMOD_POLYGON        FMOD_POLYGON;
#define FMOD_GEOMETRY!             handle! ;typedef struct FMOD_GEOMETRY       FMOD_GEOMETRY;
#define FMOD_SYNCPOINT!            handle! ;typedef struct FMOD_SYNCPOINT      FMOD_SYNCPOINT;
#define FMOD_ASYNCREADINFO!        handle! ;typedef struct FMOD_ASYNCREADINFO  FMOD_ASYNCREADINFO;
#define FMOD_MODE!                 integer! ;typedef unsigned int               FMOD_MODE;
#define FMOD_TIMEUNIT!             integer! ;typedef unsigned int               FMOD_TIMEUNIT;
#define FMOD_INITFLAGS!            integer! ;typedef unsigned int               FMOD_INITFLAGS;
#define FMOD_DEBUG_FLAGS!          integer! ;typedef unsigned int               FMOD_DEBUG_FLAGS;
#define FMOD_MEMORY_TYPE!          integer! ;typedef unsigned int               FMOD_MEMORY_TYPE;
#define FMOD_SYSTEM_CALLBACK_TYPE! integer! ;typedef unsigned int               FMOD_SYSTEM_CALLBACK_TYPE;
#define FMOD_CHANNELMASK!          integer! ;typedef unsigned int               FMOD_CHANNELMASK;
#define FMOD_DRIVER_STATE!         integer! ;typedef unsigned int               FMOD_DRIVER_STATE;
#define FMOD_PORT_TYPE!            integer! ;typedef unsigned int               FMOD_PORT_TYPE;
;@@ There is no `int64!` datatype in Red/System yet so I'm using float32! instead bellow!
#define FMOD_PORT_INDEX!           long-long!  ;typedef unsigned long long         FMOD_PORT_INDEX;

#define FMOD_DEBUG_CALLBACK!  [function! [flags [FMOD_DEBUG_FLAGS!] file [c-string!] line [integer!] func [c-string!] message [c-string!] return: [FMOD_RESULT!]]]

#define FMOD_SYSTEM_CALLBACK!  [function! [system [FMOD_SYSTEM!] type [FMOD_SYSTEM_CALLBACK_TYPE!] commanddata1 [byte-ptr!] commanddata2 [byte-ptr!] userdata [byte-ptr!] return: [FMOD_RESULT!]]]

#define FMOD_CHANNELCONTROL_CALLBACK! [function! [channelcontrol [FMOD_CHANNELCONTROL!] controltype [FMOD_CHANNELCONTROL_TYPE!] callbacktype [FMOD_CHANNELCONTROL_CALLBACK_TYPE!] commanddata1 [byte-ptr!] commanddata2 [byte-ptr!] return: [FMOD_RESULT!]]]

#define FMOD_SOUND_PCMREAD_CALLBACK!   [function! [sound [FMOD_SOUND!] data [byte-ptr!] datalen [integer!] return: [FMOD_RESULT!]]]
#define FMOD_SOUND_PCMSETPOS_CALLBACK! [function! [sound [FMOD_SOUND!] subsound  [integer!] position [u-integer!] postype [FMOD_TIMEUNIT!] return: [FMOD_RESULT!]]]
#define FMOD_SOUND_NONBLOCK_CALLBACK!  [function! [sound [FMOD_SOUND!] result [FMOD_RESULT!] return: [FMOD_RESULT!]]]

#define FMOD_FILE_OPEN_CALLBACK!  [function! [name [c-string!] filesize [integer!] handle [pointer! [integer!]] userdata [byte-ptr!] return: [FMOD_RESULT!]]]
#define FMOD_FILE_CLOSE_CALLBACK! [function! [handle [pointer! [integer!]] userdata [byte-ptr!] return: [FMOD_RESULT!]]]
#define FMOD_FILE_READ_CALLBACK!  [function! [handle [pointer! [integer!]] buffer [byte-ptr!] sizebytes [u-integer!] bytesread [pointer! [integer!]] userdata [byte-ptr!] return: [FMOD_RESULT!]]]
#define FMOD_FILE_SEEK_CALLBACK!  [function! [handle [pointer! [integer!]] pos [integer!] userdata [byte-ptr!] return: [FMOD_RESULT!]]]
#define FMOD_FILE_ASYNCREAD_CALLBACK!   [function! [info [pointer! [FMOD_ASYNCREADINFO!]] userdata [byte-ptr!] return: [FMOD_RESULT!]]]
#define FMOD_FILE_ASYNCCANCEL_CALLBACK! [function! [info [pointer! [FMOD_ASYNCREADINFO!]] userdata [byte-ptr!] return: [FMOD_RESULT!]]]

#define FMOD_FILE_ASYNCDONE_FUNC! [function! [info [pointer! [FMOD_ASYNCREADINFO!]] result [FMOD_RESULT!]]]

#define FMOD_MEMORY_ALLOC_CALLBACK!   [function! [size [integer!] type [FMOD_MEMORY_TYPE!] sourcestr [c-string!] return: [byte-ptr!]]]
#define FMOD_MEMORY_REALLOC_CALLBACK! [function! [ptr [byte-ptr!] size [integer!] type [FMOD_MEMORY_TYPE!] sourcestr [c-string!] return: [byte-ptr!]]]
#define FMOD_MEMORY_FREE_CALLBACK!    [function! [ptr [byte-ptr!] type [FMOD_MEMORY_TYPE!] sourcestr [c-string!]]]

#define FMOD_3D_ROLLOFF_CALLBACK! [function! [channelcontrol [FMOD_CHANNELCONTROL!] distance [float32!] return: [float32!]]]

;== Initialization flags.  Use them with System::init in the *flags* parameter to change various behavior.  
;Use System::setAdvancedSettings to adjust settings for some of the features that are enabled by these flags.
#define FMOD_INIT_NORMAL                     00000000h ;/* Initialize normally */
#define FMOD_INIT_STREAM_FROM_UPDATE         00000001h ;/* No stream thread is created internally.  Streams are driven from System::update.  Mainly used with non-realtime outputs. */
#define FMOD_INIT_MIX_FROM_UPDATE            00000002h ;/* No mixer thread is created internally. Mixing is driven from System::update. Only applies to polling based output modes such as FMOD_OUTPUTTYPE_NOSOUND, FMOD_OUTPUTTYPE_WAVWRITER, FMOD_OUTPUTTYPE_DSOUND, FMOD_OUTPUTTYPE_WINMM,FMOD_OUTPUTTYPE_XAUDIO. */
#define FMOD_INIT_3D_RIGHTHANDED             00000004h ;/* FMOD will treat +X as right, +Y as up and +Z as backwards (towards you). */
#define FMOD_INIT_CHANNEL_LOWPASS            00000100h ;/* All FMOD_3D based voices will add a software lowpass filter effect into the DSP chain which is automatically used when Channel::set3DOcclusion is used or the geometry API.   This also causes sounds to sound duller when the sound goes behind the listener, as a fake HRTF style effect.  Use System::setAdvancedSettings to disable or adjust cutoff frequency for this feature. */
#define FMOD_INIT_CHANNEL_DISTANCEFILTER     00000200h ;/* All FMOD_3D based voices will add a software lowpass and highpass filter effect into the DSP chain which will act as a distance-automated bandpass filter. Use System::setAdvancedSettings to adjust the center frequency. */
#define FMOD_INIT_PROFILE_ENABLE             00010000h ;/* Enable TCP/IP based host which allows FMOD Designer or FMOD Profiler to connect to it, and view memory, CPU and the DSP network graph in real-time. */
#define FMOD_INIT_VOL0_BECOMES_VIRTUAL       00020000h ;/* Any sounds that are 0 volume will go virtual and not be processed except for having their positions updated virtually.  Use System::setAdvancedSettings to adjust what volume besides zero to switch to virtual at. */
#define FMOD_INIT_GEOMETRY_USECLOSEST        00040000h ;/* With the geometry engine, only process the closest polygon rather than accumulating all polygons the sound to listener line intersects. */
#define FMOD_INIT_PREFER_DOLBY_DOWNMIX       00080000h ;/* When using FMOD_SPEAKERMODE_5POINT1 with a stereo output device, use the Dolby Pro Logic II downmix algorithm instead of the SRS Circle Surround algorithm. */
#define FMOD_INIT_THREAD_UNSAFE              00100000h ;/* Disables thread safety for API calls. Only use this if FMOD low level is being called from a single thread, and if Studio API is not being used! */
#define FMOD_INIT_PROFILE_METER_ALL          00200000h ;/* Slower, but adds level metering for every single DSP unit in the graph.  Use DSP::setMeteringEnabled to turn meters off individually. */

;== Sound description bitfields, bitwise OR them together for loading and describing sounds.
#define FMOD_DEFAULT                   00000000h  ;/* Default for all modes listed below. FMOD_LOOP_OFF, FMOD_2D, FMOD_3D_WORLDRELATIVE, FMOD_3D_INVERSEROLLOFF */
#define FMOD_LOOP_OFF                  00000001h  ;/* For non looping sounds. (DEFAULT).  Overrides FMOD_LOOP_NORMAL / FMOD_LOOP_BIDI. */
#define FMOD_LOOP_NORMAL               00000002h  ;/* For forward looping sounds. */
#define FMOD_LOOP_BIDI                 00000004h  ;/* For bidirectional looping sounds. (only works on software mixed static sounds). */
#define FMOD_2D                        00000008h  ;/* Ignores any 3d processing. (DEFAULT). */
#define FMOD_3D                        00000010h  ;/* Makes the sound positionable in 3D.  Overrides FMOD_2D. */
#define FMOD_CREATESTREAM              00000080h  ;/* Decompress at runtime, streaming from the source provided (ie from disk).  Overrides FMOD_CREATESAMPLE and FMOD_CREATECOMPRESSEDSAMPLE.  Note a stream can only be played once at a time due to a stream only having 1 stream buffer and file handle.  Open multiple streams to have them play concurrently. */
#define FMOD_CREATESAMPLE              00000100h  ;/* Decompress at loadtime, decompressing or decoding whole file into memory as the target sample format (ie PCM).  Fastest for playback and most flexible.  */
#define FMOD_CREATECOMPRESSEDSAMPLE    00000200h  ;/* Load MP2/MP3/IMAADPCM/Vorbis/AT9 or XMA into memory and leave it compressed.  Vorbis/AT9 encoding only supported in the FSB file format.  During playback the FMOD software mixer will decode it in realtime as a 'compressed sample'.  Overrides FMOD_CREATESAMPLE.  If the sound data is not one of the supported formats, it will behave as if it was created with FMOD_CREATESAMPLE and decode the sound into PCM. */
#define FMOD_OPENUSER                  00000400h  ;/* Opens a user created static sample or stream. Use FMOD_CREATESOUNDEXINFO to specify format and/or read callbacks.  If a user created 'sample' is created with no read callback, the sample will be empty.  Use Sound::lock and Sound::unlock to place sound data into the sound if this is the case. */
#define FMOD_OPENMEMORY                00000800h  ;/* "name_or_data" will be interpreted as a pointer to memory instead of filename for creating sounds.  Use FMOD_CREATESOUNDEXINFO to specify length.  If used with FMOD_CREATESAMPLE or FMOD_CREATECOMPRESSEDSAMPLE, FMOD duplicates the memory into its own buffers.  Your own buffer can be freed after open.  If used with FMOD_CREATESTREAM, FMOD will stream out of the buffer whose pointer you passed in.  In this case, your own buffer should not be freed until you have finished with and released the stream.*/
#define FMOD_OPENMEMORY_POINT          10000000h  ;/* "name_or_data" will be interpreted as a pointer to memory instead of filename for creating sounds.  Use FMOD_CREATESOUNDEXINFO to specify length.  This differs to FMOD_OPENMEMORY in that it uses the memory as is, without duplicating the memory into its own buffers.  Cannot be freed after open, only after Sound::release.   Will not work if the data is compressed and FMOD_CREATECOMPRESSEDSAMPLE is not used. */
#define FMOD_OPENRAW                   00001000h  ;/* Will ignore file format and treat as raw pcm.  Use FMOD_CREATESOUNDEXINFO to specify format.  Requires at least defaultfrequency, numchannels and format to be specified before it will open.  Must be little endian data. */
#define FMOD_OPENONLY                  00002000h  ;/* Just open the file, dont prebuffer or read.  Good for fast opens for info, or when sound::readData is to be used. */
#define FMOD_ACCURATETIME              00004000h  ;/* For System::createSound - for accurate Sound::getLength/Channel::setPosition on VBR MP3, and MOD/S3M/XM/IT/MIDI files.  Scans file first, so takes longer to open. FMOD_OPENONLY does not affect this. */
#define FMOD_MPEGSEARCH                00008000h  ;/* For corrupted / bad MP3 files.  This will search all the way through the file until it hits a valid MPEG header.  Normally only searches for 4k. */
#define FMOD_NONBLOCKING               00010000h  ;/* For opening sounds and getting streamed subsounds (seeking) asyncronously.  Use Sound::getOpenState to poll the state of the sound as it opens or retrieves the subsound in the background. */
#define FMOD_UNIQUE                    00020000h  ;/* Unique sound, can only be played one at a time */
#define FMOD_3D_HEADRELATIVE           00040000h  ;/* Make the sound's position, velocity and orientation relative to the listener. */
#define FMOD_3D_WORLDRELATIVE          00080000h  ;/* Make the sound's position, velocity and orientation absolute (relative to the world). (DEFAULT) */
#define FMOD_3D_INVERSEROLLOFF         00100000h  ;/* This sound will follow the inverse rolloff model where mindistance = full volume, maxdistance = where sound stops attenuating, and rolloff is fixed according to the global rolloff factor.  (DEFAULT) */
#define FMOD_3D_LINEARROLLOFF          00200000h  ;/* This sound will follow a linear rolloff model where mindistance = full volume, maxdistance = silence. */
#define FMOD_3D_LINEARSQUAREROLLOFF    00400000h  ;/* This sound will follow a linear-square rolloff model where mindistance = full volume, maxdistance = silence. */
#define FMOD_3D_INVERSETAPEREDROLLOFF  00800000h  ;/* This sound will follow the inverse rolloff model at distances close to mindistance and a linear-square rolloff close to maxdistance. */
#define FMOD_3D_CUSTOMROLLOFF          04000000h  ;/* This sound will follow a rolloff model defined by Sound::set3DCustomRolloff / Channel::set3DCustomRolloff.  */
#define FMOD_3D_IGNOREGEOMETRY         40000000h  ;/* Is not affect by geometry occlusion.  If not specified in Sound::setMode, or Channel::setMode, the flag is cleared and it is affected by geometry again. */

;== These callback types are used with System::setCallback (FMOD_SYSTEM_CALLBACK_TYPE).
#define FMOD_SYSTEM_CALLBACK_DEVICELISTCHANGED      00000001h  ;/* Called from System::update when the enumerated list of devices has changed. */
#define FMOD_SYSTEM_CALLBACK_DEVICELOST             00000002h  ;/* Called from System::update when an output device has been lost due to control panel parameter changes and FMOD cannot automatically recover. */
#define FMOD_SYSTEM_CALLBACK_MEMORYALLOCATIONFAILED 00000004h  ;/* Called directly when a memory allocation fails somewhere in FMOD.  (NOTE - 'system' will be NULL in this callback type.)*/
#define FMOD_SYSTEM_CALLBACK_THREADCREATED          00000008h  ;/* Called directly when a thread is created. */
#define FMOD_SYSTEM_CALLBACK_BADDSPCONNECTION       00000010h  ;/* Called when a bad connection was made with DSP::addInput. Usually called from mixer thread because that is where the connections are made.  */
#define FMOD_SYSTEM_CALLBACK_PREMIX                 00000020h  ;/* Called each tick before a mix update happens. */
#define FMOD_SYSTEM_CALLBACK_POSTMIX                00000040h  ;/* Called each tick after a mix update happens. */
#define FMOD_SYSTEM_CALLBACK_ERROR                  00000080h  ;/* Called when each API function returns an error code, including delayed async functions. */
#define FMOD_SYSTEM_CALLBACK_MIDMIX                 00000100h  ;/* Called each tick in mix update after clocks have been updated before the main mix occurs. */
#define FMOD_SYSTEM_CALLBACK_THREADDESTROYED        00000200h  ;/* Called directly when a thread is destroyed. */
#define FMOD_SYSTEM_CALLBACK_PREUPDATE              00000400h  ;/* Called at start of System::update function. */
#define FMOD_SYSTEM_CALLBACK_POSTUPDATE             00000800h  ;/* Called at end of System::update function. */
#define FMOD_SYSTEM_CALLBACK_RECORDLISTCHANGED      00001000h  ;/* Called from System::update when the enumerated list of recording devices has changed. */
#define FMOD_SYSTEM_CALLBACK_ALL                    FFFFFFFFh  ;/* Pass this mask to System::setCallback to receive all callback types. */

;== Specify the requested information to be output when using the logging version of FMOD.
#define FMOD_DEBUG_LEVEL_NONE           00000000h    ;/* Disable all messages */
#define FMOD_DEBUG_LEVEL_ERROR          00000001h    ;/* Enable only error messages. */
#define FMOD_DEBUG_LEVEL_WARNING        00000002h    ;/* Enable warning and error messages. */
#define FMOD_DEBUG_LEVEL_LOG            00000004h    ;/* Enable informational, warning and error messages (default). */
#define FMOD_DEBUG_TYPE_MEMORY          00000100h    ;/* Verbose logging for memory operations, only use this if you are debugging a memory related issue. */
#define FMOD_DEBUG_TYPE_FILE            00000200h    ;/* Verbose logging for file access, only use this if you are debugging a file related issue. */
#define FMOD_DEBUG_TYPE_CODEC           00000400h    ;/* Verbose logging for codec initialization, only use this if you are debugging a codec related issue. */
#define FMOD_DEBUG_TYPE_TRACE           00000800h    ;/* Verbose logging for internal errors, use this for tracking the origin of error codes. */
#define FMOD_DEBUG_DISPLAY_TIMESTAMPS   00010000h    ;/* Display the time stamp of the log message in milliseconds. */
#define FMOD_DEBUG_DISPLAY_LINENUMBERS  00020000h    ;/* Display the source code file and line number for where the message originated. */
#define FMOD_DEBUG_DISPLAY_THREAD       00040000h    ;/* Display the thread ID of the calling function that generated the message. */

#enum FMOD_OPENSTATE! [
;== These values describe what state a sound is in after FMOD_NONBLOCKING has been used to open it.
;    With streams, if you are using FMOD_NONBLOCKING, note that if the user calls Sound::getSubSound, a stream will go into FMOD_OPENSTATE_SEEKING state and sound related commands will return FMOD_ERR_NOTREADY.
;    With streams, if you are using FMOD_NONBLOCKING, note that if the user calls Channel::getPosition, a stream will go into FMOD_OPENSTATE_SETPOSITION state and sound related commands will return FMOD_ERR_NOTREADY.
    FMOD_OPENSTATE_READY         ;/* Opened and ready to play. */
    FMOD_OPENSTATE_LOADING       ;/* Initial load in progress. */
    FMOD_OPENSTATE_ERROR         ;/* Failed to open - file not found, out of memory etc.  See return value of Sound::getOpenState for what happened. */
    FMOD_OPENSTATE_CONNECTING    ;/* Connecting to remote host (internet sounds only). */
    FMOD_OPENSTATE_BUFFERING     ;/* Buffering data. */
    FMOD_OPENSTATE_SEEKING       ;/* Seeking to subsound and re-flushing stream buffer. */
    FMOD_OPENSTATE_PLAYING       ;/* Ready and playing, but not possible to release at this time without stalling the main thread. */
    FMOD_OPENSTATE_SETPOSITION   ;/* Seeking within a stream to a different position. */

    FMOD_OPENSTATE_MAX           ;/* Maximum number of open state types. */
]

#enum FMOD_SOUNDGROUP_BEHAVIOR! [
;== These values are used with SoundGroup::setMaxAudibleBehavior to determine what happens when more sounds are played than are specified with SoundGroup::setMaxAudible.
;    When using FMOD_SOUNDGROUP_BEHAVIOR_MUTE, SoundGroup::setMuteFadeSpeed can be used to stop a sudden transition.  
;    Instead, the time specified will be used to cross fade between the sounds that go silent and the ones that become audible.
    FMOD_SOUNDGROUP_BEHAVIOR_FAIL            ;/* Any sound played that puts the sound count over the SoundGroup::setMaxAudible setting, will simply fail during System::playSound. */
    FMOD_SOUNDGROUP_BEHAVIOR_MUTE            ;/* Any sound played that puts the sound count over the SoundGroup::setMaxAudible setting, will be silent, then if another sound in the group stops the sound that was silent before becomes audible again. */
    FMOD_SOUNDGROUP_BEHAVIOR_STEALLOWEST     ;/* Any sound played that puts the sound count over the SoundGroup::setMaxAudible setting, will steal the quietest / least important sound playing in the group. */

    FMOD_SOUNDGROUP_BEHAVIOR_MAX             ;/* Maximum number of sound group behaviors. */
]

#enum FMOD_OUTPUTTYPE! [
;== These output types are used with System::setOutput / System::getOutput, to choose which output method to use.
;    To pass information to the driver when initializing fmod use the *extradriverdata* parameter in System::init for the following reasons.
;
;    - FMOD_OUTPUTTYPE_WAVWRITER     - extradriverdata is a pointer to a char * file name that the wav writer will output to.
;    - FMOD_OUTPUTTYPE_WAVWRITER_NRT - extradriverdata is a pointer to a char * file name that the wav writer will output to.
;    - FMOD_OUTPUTTYPE_DSOUND        - extradriverdata is cast to a HWND type, so that FMOD can set the focus on the audio for a particular window.
;    - FMOD_OUTPUTTYPE_PS3           - extradriverdata is a pointer to a FMOD_PS3_EXTRADRIVERDATA struct. This can be found in fmodps3.h.
;    - FMOD_OUTPUTTYPE_XAUDIO        - (Xbox360) extradriverdata is a pointer to a FMOD_360_EXTRADRIVERDATA struct. This can be found in fmodxbox360.h.
;
;    Currently these are the only FMOD drivers that take extra information.  Other unknown plugins may have different requirements.
;
;    Note! If FMOD_OUTPUTTYPE_WAVWRITER_NRT or FMOD_OUTPUTTYPE_NOSOUND_NRT are used, and if the System::update function is being called
;    very quickly (ie for a non realtime decode) it may be being called too quickly for the FMOD streamer thread to respond to.
;    The result will be a skipping/stuttering output in the captured audio.
;
;    To remedy this, disable the FMOD streamer thread, and use FMOD_INIT_STREAM_FROM_UPDATE to avoid skipping in the output stream,
;    as it will lock the mixer and the streamer together in the same thread.
    FMOD_OUTPUTTYPE_AUTODETECT    ;/* Picks the best output mode for the platform. This is the default. */

    FMOD_OUTPUTTYPE_UNKNOWN       ;/* All - 3rd party plugin, unknown. This is for use with System::getOutput only. */
    FMOD_OUTPUTTYPE_NOSOUND       ;/* All - Perform all mixing but discard the final output. */
    FMOD_OUTPUTTYPE_WAVWRITER     ;/* All - Writes output to a .wav file. */
    FMOD_OUTPUTTYPE_NOSOUND_NRT   ;/* All - Non-realtime version of FMOD_OUTPUTTYPE_NOSOUND. User can drive mixer with System::update at whatever rate they want. */
    FMOD_OUTPUTTYPE_WAVWRITER_NRT ;/* All - Non-realtime version of FMOD_OUTPUTTYPE_WAVWRITER. User can drive mixer with System::update at whatever rate they want. */

    FMOD_OUTPUTTYPE_DSOUND        ;/* Win                  - Direct Sound.                        (Default on Windows XP and below) */
    FMOD_OUTPUTTYPE_WINMM         ;/* Win                  - Windows Multimedia. */
    FMOD_OUTPUTTYPE_WASAPI        ;/* Win/WinStore/XboxOne - Windows Audio Session API.           (Default on Windows Vista and above, Xbox One and Windows Store Applications) */
    FMOD_OUTPUTTYPE_ASIO          ;/* Win                  - Low latency ASIO 2.0. */
    FMOD_OUTPUTTYPE_PULSEAUDIO    ;/* Linux                - Pulse Audio.                         (Default on Linux if available) */
    FMOD_OUTPUTTYPE_ALSA          ;/* Linux                - Advanced Linux Sound Architecture.   (Default on Linux if PulseAudio isn't available) */
    FMOD_OUTPUTTYPE_COREAUDIO     ;/* Mac/iOS              - Core Audio.                          (Default on Mac and iOS) */
    FMOD_OUTPUTTYPE_XAUDIO        ;/* Xbox 360             - XAudio.                              (Default on Xbox 360) */
    FMOD_OUTPUTTYPE_PS3           ;/* PS3                  - Audio Out.                           (Default on PS3) */
    FMOD_OUTPUTTYPE_AUDIOTRACK    ;/* Android              - Java Audio Track.                    (Default on Android 2.2 and below) */
    FMOD_OUTPUTTYPE_OPENSL        ;/* Android              - OpenSL ES.                           (Default on Android 2.3 and above) */
    FMOD_OUTPUTTYPE_WIIU          ;/* Wii U                - AX.                                  (Default on Wii U) */
    FMOD_OUTPUTTYPE_AUDIOOUT      ;/* PS4/PSVita           - Audio Out.                           (Default on PS4 and PS Vita) */
    FMOD_OUTPUTTYPE_AUDIO3D       ;/* PS4                  - Audio3D. */
    FMOD_OUTPUTTYPE_ATMOS         ;/* Win                  - Dolby Atmos (WASAPI). */
    FMOD_OUTPUTTYPE_WEBAUDIO      ;/* Web Browser          - JavaScript webaudio output.          (Default on JavaScript) */
    FMOD_OUTPUTTYPE_NNAUDIO       ;/* NX                   - NX nn::audio.                        (Default on NX)*/

    FMOD_OUTPUTTYPE_MAX           ;/* Maximum number of output types supported. */
]

;== List of time types that can be returned by Sound::getLength and used with Channel::setPosition or Channel::getPosition.
;Do not combine flags except FMOD_TIMEUNIT_BUFFERED.
#define FMOD_TIMEUNIT_MS                00000001h  ;/* Milliseconds. */
#define FMOD_TIMEUNIT_PCM               00000002h  ;/* PCM samples, related to milliseconds * samplerate / 1000. */
#define FMOD_TIMEUNIT_PCMBYTES          00000004h  ;/* Bytes, related to PCM samples * channels * datawidth (ie 16bit = 2 bytes). */
#define FMOD_TIMEUNIT_RAWBYTES          00000008h  ;/* Raw file bytes of (compressed) sound data (does not include headers).  Only used by Sound::getLength and Channel::getPosition. */
#define FMOD_TIMEUNIT_PCMFRACTION       00000010h  ;/* Fractions of 1 PCM sample.  Unsigned int range 0 to 0xFFFFFFFF.  Used for sub-sample granularity for DSP purposes. */
#define FMOD_TIMEUNIT_MODORDER          00000100h  ;/* MOD/S3M/XM/IT.  Order in a sequenced module format.  Use Sound::getFormat to determine the PCM format being decoded to. */
#define FMOD_TIMEUNIT_MODROW            00000200h  ;/* MOD/S3M/XM/IT.  Current row in a sequenced module format.  Sound::getLength will return the number of rows in the currently playing or seeked to pattern. */
#define FMOD_TIMEUNIT_MODPATTERN        00000400h  ;/* MOD/S3M/XM/IT.  Current pattern in a sequenced module format.  Sound::getLength will return the number of patterns in the song and Channel::getPosition will return the currently playing pattern. */
#define FMOD_TIMEUNIT_BUFFERED          10000000h  ;/* Time value as seen by buffered stream.  This is always ahead of audible time, and is only used for processing. */

;== These are bitfields to describe for a certain number of channels in a signal, which channels are being represented.
;== For example, a signal could be 1 channel, but contain the LFE channel only.
;FMOD_CHANNELMASK_BACK_CENTER is not represented as an output speaker in fmod - but it is encountered in input formats and is down or upmixed appropriately to the nearest speakers.
#define FMOD_CHANNELMASK_FRONT_LEFT             00000001h
#define FMOD_CHANNELMASK_FRONT_RIGHT            00000002h
#define FMOD_CHANNELMASK_FRONT_CENTER           00000004h
#define FMOD_CHANNELMASK_LOW_FREQUENCY          00000008h
#define FMOD_CHANNELMASK_SURROUND_LEFT          00000010h
#define FMOD_CHANNELMASK_SURROUND_RIGHT         00000020h
#define FMOD_CHANNELMASK_BACK_LEFT              00000040h
#define FMOD_CHANNELMASK_BACK_RIGHT             00000080h
#define FMOD_CHANNELMASK_BACK_CENTER            00000100h

#define FMOD_CHANNELMASK_MONO                    (FMOD_CHANNELMASK_FRONT_LEFT)
#define FMOD_CHANNELMASK_STEREO                  (FMOD_CHANNELMASK_FRONT_LEFT | FMOD_CHANNELMASK_FRONT_RIGHT)
#define FMOD_CHANNELMASK_LRC                     (FMOD_CHANNELMASK_FRONT_LEFT | FMOD_CHANNELMASK_FRONT_RIGHT | FMOD_CHANNELMASK_FRONT_CENTER)
#define FMOD_CHANNELMASK_QUAD                    (FMOD_CHANNELMASK_FRONT_LEFT | FMOD_CHANNELMASK_FRONT_RIGHT | FMOD_CHANNELMASK_SURROUND_LEFT | FMOD_CHANNELMASK_SURROUND_RIGHT)
#define FMOD_CHANNELMASK_SURROUND                (FMOD_CHANNELMASK_FRONT_LEFT | FMOD_CHANNELMASK_FRONT_RIGHT | FMOD_CHANNELMASK_FRONT_CENTER | FMOD_CHANNELMASK_SURROUND_LEFT | FMOD_CHANNELMASK_SURROUND_RIGHT)
#define FMOD_CHANNELMASK_5POINT1                 (FMOD_CHANNELMASK_FRONT_LEFT | FMOD_CHANNELMASK_FRONT_RIGHT | FMOD_CHANNELMASK_FRONT_CENTER | FMOD_CHANNELMASK_LOW_FREQUENCY | FMOD_CHANNELMASK_SURROUND_LEFT | FMOD_CHANNELMASK_SURROUND_RIGHT)
#define FMOD_CHANNELMASK_5POINT1_REARS           (FMOD_CHANNELMASK_FRONT_LEFT | FMOD_CHANNELMASK_FRONT_RIGHT | FMOD_CHANNELMASK_FRONT_CENTER | FMOD_CHANNELMASK_LOW_FREQUENCY | FMOD_CHANNELMASK_BACK_LEFT | FMOD_CHANNELMASK_BACK_RIGHT)
#define FMOD_CHANNELMASK_7POINT0                 (FMOD_CHANNELMASK_FRONT_LEFT | FMOD_CHANNELMASK_FRONT_RIGHT | FMOD_CHANNELMASK_FRONT_CENTER | FMOD_CHANNELMASK_SURROUND_LEFT | FMOD_CHANNELMASK_SURROUND_RIGHT | FMOD_CHANNELMASK_BACK_LEFT | FMOD_CHANNELMASK_BACK_RIGHT)
#define FMOD_CHANNELMASK_7POINT1                 (FMOD_CHANNELMASK_FRONT_LEFT | FMOD_CHANNELMASK_FRONT_RIGHT | FMOD_CHANNELMASK_FRONT_CENTER | FMOD_CHANNELMASK_LOW_FREQUENCY | FMOD_CHANNELMASK_SURROUND_LEFT | FMOD_CHANNELMASK_SURROUND_RIGHT | FMOD_CHANNELMASK_BACK_LEFT | FMOD_CHANNELMASK_BACK_RIGHT)


#enum FMOD_SOUND_FORMAT! [
    FMOD_SOUND_FORMAT_NONE             ;/* Unitialized / unknown. */
    FMOD_SOUND_FORMAT_PCM8             ;/* 8bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCM16            ;/* 16bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCM24            ;/* 24bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCM32            ;/* 32bit integer PCM data. */
    FMOD_SOUND_FORMAT_PCMFLOAT         ;/* 32bit floating point PCM data. */
    FMOD_SOUND_FORMAT_BITSTREAM        ;/* Sound data is in its native compressed format. */

    FMOD_SOUND_FORMAT_MAX              ;/* Maximum number of sound formats supported. */   
]

#enum FMOD_SOUND_TYPE! [
;== These definitions describe the type of song being played.
    FMOD_SOUND_TYPE_UNKNOWN         ;/* 3rd party / unknown plugin format. */
    FMOD_SOUND_TYPE_AIFF            ;/* AIFF. */
    FMOD_SOUND_TYPE_ASF             ;/* Microsoft Advanced Systems Format (ie WMA/ASF/WMV). */
    FMOD_SOUND_TYPE_DLS             ;/* Sound font / downloadable sound bank. */
    FMOD_SOUND_TYPE_FLAC            ;/* FLAC lossless codec. */
    FMOD_SOUND_TYPE_FSB             ;/* FMOD Sample Bank. */
    FMOD_SOUND_TYPE_IT              ;/* Impulse Tracker. */
    FMOD_SOUND_TYPE_MIDI            ;/* MIDI. */
    FMOD_SOUND_TYPE_MOD             ;/* Protracker / Fasttracker MOD. */
    FMOD_SOUND_TYPE_MPEG            ;/* MP2/MP3 MPEG. */
    FMOD_SOUND_TYPE_OGGVORBIS       ;/* Ogg vorbis. */
    FMOD_SOUND_TYPE_PLAYLIST        ;/* Information only from ASX/PLS/M3U/WAX playlists */
    FMOD_SOUND_TYPE_RAW             ;/* Raw PCM data. */
    FMOD_SOUND_TYPE_S3M             ;/* ScreamTracker 3. */
    FMOD_SOUND_TYPE_USER            ;/* User created sound. */
    FMOD_SOUND_TYPE_WAV             ;/* Microsoft WAV. */
    FMOD_SOUND_TYPE_XM              ;/* FastTracker 2 XM. */
    FMOD_SOUND_TYPE_XMA             ;/* Xbox360 XMA */
    FMOD_SOUND_TYPE_AUDIOQUEUE      ;/* iPhone hardware decoder supports AAC ALAC and MP3. */
    FMOD_SOUND_TYPE_AT9             ;/* PS4 / PSVita ATRAC 9 format */
    FMOD_SOUND_TYPE_VORBIS          ;/* Vorbis */
    FMOD_SOUND_TYPE_MEDIA_FOUNDATION;/* Windows Store Application built in system codecs */
    FMOD_SOUND_TYPE_MEDIACODEC      ;/* Android MediaCodec */
    FMOD_SOUND_TYPE_FADPCM          ;/* FMOD Adaptive Differential Pulse Code Modulation */

    FMOD_SOUND_TYPE_MAX             ;/* Maximum number of sound types supported. */
]
#enum FMOD_CHANNELORDER! [
;== When creating a multichannel sound, FMOD will pan them to their default speaker locations, for example a 6 channel sound will default to one channel per 5.1 output speaker.
;== Another example is a stereo sound.  It will default to left = front left, right = front right.
;==
;== This is for sounds that are not 'default'.  For example you might have a sound that is 6 channels but actually made up of 3 stereo pairs, that should all be located in front left, front right only.
    FMOD_CHANNELORDER_DEFAULT              ;/* Left Right Center LFE Surround Left Surround Right Back Left Back Right (see FMOD_SPEAKER enumeration)   */
    FMOD_CHANNELORDER_WAVEFORMAT           ;/* Left Right Center LFE Back Left Back Right Surround Left Surround Right (as per Microsoft .wav WAVEFORMAT structure master order) */
    FMOD_CHANNELORDER_PROTOOLS             ;/* Left Center Right Surround Left Surround Right LFE */
    FMOD_CHANNELORDER_ALLMONO              ;/* Mono Mono Mono Mono Mono Mono ... (each channel all the way up to FMOD_MAX_CHANNEL_WIDTH channels are treated as if they were mono) */
    FMOD_CHANNELORDER_ALLSTEREO            ;/* Left Right Left Right Left Right ... (each pair of channels is treated as stereo all the way up to FMOD_MAX_CHANNEL_WIDTH channels) */
    FMOD_CHANNELORDER_ALSA                 ;/* Left Right Surround Left Surround Right Center LFE (as per Linux ALSA channel order) */

    FMOD_CHANNELORDER_MAX                  ;/* Maximum number of channel orderings supported. */
]

#enum FMOD_CHANNELCONTROL_TYPE! [
;== Used to distinguish if a FMOD_CHANNELCONTROL parameter is actually a channel or a channelgroup.
;    Cast the FMOD_CHANNELCONTROL to an FMOD_CHANNEL/FMOD::Channel, or FMOD_CHANNELGROUP/FMOD::ChannelGroup if specific functionality is needed for either class.
;    Otherwise use as FMOD_CHANNELCONTROL/FMOD::ChannelControl and use that API.
    FMOD_CHANNELCONTROL_CHANNEL
    FMOD_CHANNELCONTROL_CHANNELGROUP
]

#enum FMOD_CHANNELCONTROL_CALLBACK_TYPE! [
;== These callback types are used with Channel::setCallback.
;    Each callback has commanddata parameters passed as int unique to the type of callback.
;    See reference to FMOD_CHANNELCONTROL_CALLBACK to determine what they might mean for each type of callback.
;    Note!:  Currently the user must call System::update for these callbacks to trigger!
    FMOD_CHANNELCONTROL_CALLBACK_END                ;/* Called when a sound ends. */
    FMOD_CHANNELCONTROL_CALLBACK_VIRTUALVOICE       ;/* Called when a voice is swapped out or swapped in. */
    FMOD_CHANNELCONTROL_CALLBACK_SYNCPOINT          ;/* Called when a syncpoint is encountered.  Can be from wav file markers. */
    FMOD_CHANNELCONTROL_CALLBACK_OCCLUSION          ;/* Called when the channel has its geometry occlusion value calculated.  Can be used to clamp or change the value. */

    FMOD_CHANNELCONTROL_CALLBACK_MAX                ;/* Maximum number of callback types supported. */
]

#enum FMOD_SPEAKERMODE! [
;== These are speaker types defined for use with the System::setSoftwareFormat command.
;    Note below the phrase 'sound channels' is used.  These are the subchannels inside a sound, they are not related and 
;    have nothing to do with the FMOD class "Channel".
;    For example a mono sound has 1 sound channel, a stereo sound has 2 sound channels, and an AC3 or 6 channel wav file have 6 "sound channels".
;    
;    FMOD_SPEAKERMODE_RAW
;    ---------------------
;    This mode is for output devices that are not specifically mono/stereo/quad/surround/5.1 or 7.1, but are multichannel.
;    Use System::setSoftwareFormat to specify the number of speakers you want to address, otherwise it will default to 2 (stereo).
;    Sound channels map to speakers sequentially, so a mono sound maps to output speaker 0, stereo sound maps to output speaker 0 & 1.
;    The user assumes knowledge of the speaker order.  FMOD_SPEAKER enumerations may not apply, so raw channel indices should be used.
;    Multichannel sounds map input channels to output channels 1:1. 
;    Channel::setPan and Channel::setPanLevels do not work.
;    Speaker levels must be manually set with Channel::setPanMatrix.
;    
;    FMOD_SPEAKERMODE_MONO
;    ---------------------
;    This mode is for a 1 speaker arrangement.
;    Panning does not work in this speaker mode.
;    Mono, stereo and multichannel sounds have each sound channel played on the one speaker unity.
;    Mix behavior for multichannel sounds can be set with Channel::setPanMatrix.
;    Channel::setPanLevels does not work.
;    
;    FMOD_SPEAKERMODE_STEREO
;    -----------------------
;    This mode is for 2 speaker arrangements that have a left and right speaker.
;    * Mono sounds default to an even distribution between left and right.  They can be panned with Channel::setPan.
;    * Stereo sounds default to the middle, or full left in the left speaker and full right in the right speaker.  
;    * They can be cross faded with Channel::setPan.
;    * Multichannel sounds have each sound channel played on each speaker at unity.
;    * Mix behavior for multichannel sounds can be set with Channel::setPanMatrix.
;    * Channel::setPanLevels works but only front left and right parameters are used, the rest are ignored.
;    
;    FMOD_SPEAKERMODE_QUAD
;    ------------------------
;    This mode is for 4 speaker arrangements that have a front left, front right, surround left and a surround right speaker.
;    * Mono sounds default to an even distribution between front left and front right.  They can be panned with Channel::setPan.
;    * Stereo sounds default to the left sound channel played on the front left, and the right sound channel played on the front right.
;    * They can be cross faded with Channel::setPan.
;    * Multichannel sounds default to all of their sound channels being played on each speaker in order of input.
;    * Mix behavior for multichannel sounds can be set with Channel::setPanMatrix.
;    * Channel::setPanLevels works but rear left, rear right, center and lfe are ignored.
;    
;    FMOD_SPEAKERMODE_SURROUND
;    ------------------------
;    This mode is for 5 speaker arrangements that have a left/right/center/surround left/surround right.
;    * Mono sounds default to the center speaker.  They can be panned with Channel::setPan.
;    * Stereo sounds default to the left sound channel played on the front left, and the right sound channel played on the front right.  
;    * They can be cross faded with Channel::setPan.
;    * Multichannel sounds default to all of their sound channels being played on each speaker in order of input.  
;    * Mix behavior for multichannel sounds can be set with Channel::setPanMatrix.
;    * Channel::setPanLevels works but rear left / rear right are ignored.
;    
;    FMOD_SPEAKERMODE_5POINT1
;    ---------------------------------------------------------
;    This mode is for 5.1 speaker arrangements that have a left/right/center/surround left/surround right and a subwoofer speaker.
;    * Mono sounds default to the center speaker.  They can be panned with Channel::setPan.
;    * Stereo sounds default to the left sound channel played on the front left, and the right sound channel played on the front right.  
;    * They can be cross faded with Channel::setPan.
;    * Multichannel sounds default to all of their sound channels being played on each speaker in order of input.  
;    * Mix behavior for multichannel sounds can be set with Channel::setPanMatrix.
;    * Channel::setPanLevels works but rear left / rear right are ignored.
;    
;    FMOD_SPEAKERMODE_7POINT1
;    ------------------------
;    This mode is for 7.1 speaker arrangements that have a left/right/center/surround left/surround right/rear left/rear right 
;    and a subwoofer speaker.
;    * Mono sounds default to the center speaker.  They can be panned with Channel::setPan.
;    * Stereo sounds default to the left sound channel played on the front left, and the right sound channel played on the front right.  
;    * They can be cross faded with Channel::setPan.
;    * Multichannel sounds default to all of their sound channels being played on each speaker in order of input.  
;    * Mix behavior for multichannel sounds can be set with Channel::setPanMatrix.
;    * Channel::setPanLevels works and every parameter is used to set the balance of a sound in any speaker.
    FMOD_SPEAKERMODE_DEFAULT        ;/* Default speaker mode based on operating system/output mode.  Windows = control panel setting, Xbox = 5.1, PS3 = 7.1 etc. */
    FMOD_SPEAKERMODE_RAW            ;/* There is no specific speakermode.  Sound channels are mapped in order of input to output.  Use System::setSoftwareFormat to specify speaker count. See remarks for more information. */
    FMOD_SPEAKERMODE_MONO           ;/* The speakers are monaural. */
    FMOD_SPEAKERMODE_STEREO         ;/* The speakers are stereo. */
    FMOD_SPEAKERMODE_QUAD           ;/* 4 speaker setup.    This includes front left, front right, surround left, surround right.  */
    FMOD_SPEAKERMODE_SURROUND       ;/* 5 speaker setup.    This includes front left, front right, center, surround left, surround right. */
    FMOD_SPEAKERMODE_5POINT1        ;/* 5.1 speaker setup.  This includes front left, front right, center, surround left, surround right and an LFE speaker. */
    FMOD_SPEAKERMODE_7POINT1        ;/* 7.1 speaker setup.  This includes front left, front right, center, surround left, surround right, back left, back right and an LFE speaker. */
    
    FMOD_SPEAKERMODE_MAX            ;/* Maximum number of speaker modes supported. */
] ;FMOD_SPEAKERMODE;

#enum FMOD_SPEAKER! [
;== Assigns an enumeration for a speaker index.
    FMOD_SPEAKER_FRONT_LEFT      ;/* The front left speaker */
    FMOD_SPEAKER_FRONT_RIGHT     ;/* The front right speaker */
    FMOD_SPEAKER_FRONT_CENTER    ;/* The front center speaker */
    FMOD_SPEAKER_LOW_FREQUENCY   ;/* The LFE or 'subwoofer' speaker */
    FMOD_SPEAKER_SURROUND_LEFT   ;/* The surround left (usually to the side) speaker */
    FMOD_SPEAKER_SURROUND_RIGHT  ;/* The surround right (usually to the side) speaker */
    FMOD_SPEAKER_BACK_LEFT       ;/* The back left speaker */
    FMOD_SPEAKER_BACK_RIGHT      ;/* The back right speaker */

    FMOD_SPEAKER_MAX             ;/* Maximum number of speaker types supported. */
]

#enum FMOD_PLUGINTYPE! [
;== These are plugin types defined for use with the System::getNumPlugins, System::getPluginInfo and System::unloadPlugin functions.
    FMOD_PLUGINTYPE_OUTPUT        ;/* The plugin type is an output module.  FMOD mixed audio will play through one of these devices */
    FMOD_PLUGINTYPE_CODEC         ;/* The plugin type is a file format codec.  FMOD will use these codecs to load file formats for playback. */
    FMOD_PLUGINTYPE_DSP           ;/* The plugin type is a DSP unit.  FMOD will use these plugins as part of its DSP network to apply effects to output or generate sound in realtime. */

    FMOD_PLUGINTYPE_MAX           ;/* Maximum number of plugin types supported. */
]

#enum FMOD_DEBUG_MODE! [
;== Specify the destination of log output when using the logging version of FMOD.
;    TTY destination can vary depending on platform, common examples include the
;    Visual Studio / Xcode output window, stderr and LogCat.
    FMOD_DEBUG_MODE_TTY             ;/* Default log location per platform, i.e. Visual Studio output window, stderr, LogCat, etc */
    FMOD_DEBUG_MODE_FILE            ;/* Write log to specified file path */
    FMOD_DEBUG_MODE_CALLBACK        ;/* Call specified callback with log information */
]

#enum FMOD_DSPCONNECTION_TYPE! [
 ;==   List of connection types between 2 DSP nodes.
    FMOD_DSPCONNECTION_TYPE_STANDARD          ;/* Default connection type.         Audio is mixed from the input to the output DSP's audible buffer.  */
    FMOD_DSPCONNECTION_TYPE_SIDECHAIN         ;/* Sidechain connection type.       Audio is mixed from the input to the output DSP's sidechain buffer.  */
    FMOD_DSPCONNECTION_TYPE_SEND              ;/* Send connection type.            Audio is mixed from the input to the output DSP's audible buffer, but the input is NOT executed, only copied from.  A standard connection or sidechain needs to make an input execute to generate data. */
    FMOD_DSPCONNECTION_TYPE_SEND_SIDECHAIN    ;/* Send sidechain connection type.  Audio is mixed from the input to the output DSP's sidechain buffer, but the input is NOT executed, only copied from.  A standard connection or sidechain needs to make an input execute to generate data. */

    FMOD_DSPCONNECTION_TYPE_MAX               ;/* Maximum number of DSP connection types supported. */
]

FMOD_ASYNCREADINFO!: alias struct! [
;== Structure that is passed into FMOD_FILE_ASYNCREAD_CALLBACK.  Use the information in this structure to perform
;    Members marked with [r] mean the variable is modified by FMOD and is for reading purposes only.  Do not change this value.
;    Members marked with [w] mean the variable can be written to.  The user can set the value.
;
;    Instructions: write to 'buffer', and 'bytesread' <b>BEFORE</b> calling 'done'.  
;    As soon as done is called, FMOD will asynchronously continue internally using the data provided in this structure.
;
;    Set result in the 'done' function pointer to the result expected from a normal file read callback.
;    If the read was successful, set it to FMOD_OK.
;    If it read some data but hit the end of the file, set it to FMOD_ERR_FILE_EOF.
;    If a bad error occurred, return FMOD_ERR_FILE_BAD
;    If a disk was ejected, return FMOD_ERR_FILE_DISKEJECTED.
    handle    [pointer! [integer!]]    ; /* [r] The file handle that was filled out in the open callback. */
    offset    [u-integer!]             ; /* [r] Seek position, make sure you read from this file offset. */
    sizebytes [u-integer!]             ; /* [r] how many bytes requested for read. */
    priority  [integer!]               ; /* [r] 0 = low importance.  100 = extremely important (ie 'must read now or stuttering may occur') */
    userdata  [byte-ptr!]              ; /* [r/w] User data pointer specific to this request.  Initially 0, can be ignored or set by the user.  Not related to the file's main userdata member.  */
    buffer    [byte-ptr!]              ; /* [w] Buffer to read file data into. */
    bytesread [u-integer!]             ; /* [w] Fill this in before setting result code to tell FMOD how many bytes were read. */

    done      [FMOD_FILE_ASYNCDONE_FUNC!] ;/* [r] FMOD file system wake up function.  Call this when user file read is finished.  Pass result of file read as a parameter. */
]

FMOD_GUID!: alias struct! [
;== Structure describing a globally unique identifier.
    data1 [u-integer!] ;/* Specifies the first 8 hexadecimal digits of the GUID */
    data2 [u-integer!] ;/* Specifies the first and the second group of 4 hexadecimal digits.   */
    data3 [u-integer!]    
    data4 [u-integer!] ;/* Array of 8 bytes. The first 2 bytes contain the third group of 4 hexadecimal digits. The remaining 6 bytes contain the final 12 hexadecimal digits. */
]

FMOD_VECTOR!: alias struct! [
;== Structure describing a point in 3D space.
;    FMOD uses a left handed co-ordinate system by default.
;    To use a right handed co-ordinate system specify FMOD_INIT_3D_RIGHTHANDED from FMOD_INITFLAGS in System::init.
    x [float32!]        ;/* X co-ordinate in 3D space. */
    y [float32!]        ;/* Y co-ordinate in 3D space. */
    z [float32!]        ;/* Z co-ordinate in 3D space. */
]


FMOD_CREATESOUNDEXINFO!: alias struct! [
    cbsize              [integer!]                        ;/* [w]   Size of this structure.  This is used so the structure can be expanded in the future and still work on older versions of FMOD Studio. */
    length              [u-integer!]                      ;/* [w]   Optional. Specify 0 to ignore. Number of bytes to load starting at 'fileoffset', or size of sound to create (if FMOD_OPENUSER is used).  Required if loading from memory.  If 0 is specified, then it will use the size of the file (unless loading from memory then an error will be returned). */
    fileoffset          [u-integer!]                      ;/* [w]   Optional. Specify 0 to ignore. Offset from start of the file to start loading from.  This is useful for loading files from inside big data files. */
    numchannels         [integer!]                        ;/* [w]   Optional. Specify 0 to ignore. Number of channels in a sound mandatory if FMOD_OPENUSER or FMOD_OPENRAW is used.  Can be specified up to FMOD_MAX_CHANNEL_WIDTH. */
    defaultfrequency    [integer!]                        ;/* [w]   Optional. Specify 0 to ignore. Default frequency of sound in Hz, mandatory if FMOD_OPENUSER or FMOD_OPENRAW is used.  Other formats use the frequency determined by the file format. */
    format              [FMOD_SOUND_FORMAT!]              ;/* [w]   Optional. Specify 0 or FMOD_SOUND_FORMAT_NONE to ignore. Format of the sound, mandatory if FMOD_OPENUSER or FMOD_OPENRAW is used.  Other formats use the format determined by the file format.   */
    decodebuffersize    [u-integer!]                      ;/* [w]   Optional. Specify 0 to ignore. For streams.  This determines the size of the double buffer (in PCM samples) that a stream uses.  Use this for user created streams if you want to determine the size of the callback buffer passed to you.  Specify 0 to use FMOD's default size which is currently equivalent to 400ms of the sound format created/loaded. */
    initialsubsound     [integer!]                        ;/* [w]   Optional. Specify 0 to ignore. In a multi-sample file format such as .FSB/.DLS, specify the initial subsound to seek to, only if FMOD_CREATESTREAM is used. */
    numsubsounds        [integer!]                        ;/* [w]   Optional. Specify 0 to ignore or have no subsounds.  In a sound created with FMOD_OPENUSER, specify the number of subsounds that are accessable with Sound::getSubSound.  If not created with FMOD_OPENUSER, this will limit the number of subsounds loaded within a multi-subsound file.  If using FSB, then if FMOD_CREATESOUNDEXINFO::inclusionlist is used, this will shuffle subsounds down so that there are not any gaps.  It will mean that the indices of the sounds will be different. */
    inclusionlist       [pointer! [integer!]]             ;/* [w]   Optional. Specify 0 to ignore. In a multi-sample format such as .FSB/.DLS it may be desirable to specify only a subset of sounds to be loaded out of the whole file.  This is an array of subsound indices to load into memory when created. */
    inclusionlistnum    [integer!]                        ;/* [w]   Optional. Specify 0 to ignore. This is the number of integers contained within the inclusionlist array. */
    pcmreadcallback     [FMOD_SOUND_PCMREAD_CALLBACK!]    ;/* [w]   Optional. Specify 0 to ignore. Callback to 'piggyback' on FMOD's read functions and accept or even write PCM data while FMOD is opening the sound.  Used for user sounds created with FMOD_OPENUSER or for capturing decoded data as FMOD reads it. */
    pcmsetposcallback   [FMOD_SOUND_PCMSETPOS_CALLBACK!]  ;/* [w]   Optional. Specify 0 to ignore. Callback for when the user calls a seeking function such as Channel::setTime or Channel::setPosition within a multi-sample sound, and for when it is opened.*/
    nonblockcallback    [FMOD_SOUND_NONBLOCK_CALLBACK!]   ;/* [w]   Optional. Specify 0 to ignore. Callback for successful completion, or error while loading a sound that used the FMOD_NONBLOCKING flag.  Also called duing seeking, when setPosition is called or a stream is restarted. */
    dlsname             [c-string!]                       ;/* [w]   Optional. Specify 0 to ignore. Filename for a DLS sample set when loading a MIDI file. If not specified, on Windows it will attempt to open /windows/system32/drivers/gm.dls or /windows/system32/drivers/etc/gm.dls, on Mac it will attempt to load /System/Library/Components/CoreAudio.component/Contents/Resources/gs_instruments.dls, otherwise the MIDI will fail to open. Current DLS support is for level 1 of the specification. */
    encryptionkey       [c-string!]                       ;/* [w]   Optional. Specify 0 to ignore. Key for encrypted FSB file.  Without this key an encrypted FSB file will not load. */
    maxpolyphony        [integer!]                        ;/* [w]   Optional. Specify 0 to ignore. For sequenced formats with dynamic channel allocation such as .MID and .IT, this specifies the maximum voice count allowed while playing.  .IT defaults to 64.  .MID defaults to 32. */
    userdata            [byte-ptr!]                       ;/* [w]   Optional. Specify 0 to ignore. This is user data to be attached to the sound during creation.  Access via Sound::getUserData.  Note: This is not passed to FMOD_FILE_OPEN_CALLBACK - use fileuserdata for that. */
    suggestedsoundtype  [FMOD_SOUND_TYPE!]                ;/* [w]   Optional. Specify 0 or FMOD_SOUND_TYPE_UNKNOWN to ignore.  Instead of scanning all codec types, use this to speed up loading by making it jump straight to this codec. */
    fileuseropen        [FMOD_FILE_OPEN_CALLBACK!]        ;/* [w]   Optional. Specify 0 to ignore. Callback for opening this file. */
    fileuserclose       [FMOD_FILE_CLOSE_CALLBACK!]       ;/* [w]   Optional. Specify 0 to ignore. Callback for closing this file. */
    fileuserread        [FMOD_FILE_READ_CALLBACK!]        ;/* [w]   Optional. Specify 0 to ignore. Callback for reading from this file. */
    fileuserseek        [FMOD_FILE_SEEK_CALLBACK!]        ;/* [w]   Optional. Specify 0 to ignore. Callback for seeking within this file. */
    fileuserasyncread   [FMOD_FILE_ASYNCREAD_CALLBACK!]   ;/* [w]   Optional. Specify 0 to ignore. Callback for seeking within this file. */
    fileuserasynccancel [FMOD_FILE_ASYNCCANCEL_CALLBACK!] ;/* [w]   Optional. Specify 0 to ignore. Callback for seeking within this file. */
    fileuserdata        [byte-ptr!]                       ;/* [w]   Optional. Specify 0 to ignore. User data to be passed into the file callbacks. */
    filebuffersize      [integer!]                        ;/* [w]   Optional. Specify 0 to ignore. Buffer size for reading the file, -1 to disable buffering, or 0 for system default. */
    channelorder        [FMOD_CHANNELORDER!]              ;/* [w]   Optional. Specify 0 to ignore. Use this to differ the way fmod maps multichannel sounds to speakers.  See FMOD_CHANNELORDER for more. */
    channelmask         [FMOD_CHANNELMASK!]               ;/* [w]   Optional. Specify 0 to ignore. Use this to specify which channels map to which speakers.  See FMOD_CHANNELMASK for more. */
    initialsoundgroup   [FMOD_SOUNDGROUP!]     ;/* [w]   Optional. Specify 0 to ignore. Specify a sound group if required, to put sound in as it is created. */
    initialseekposition [u-integer!]                      ;/* [w]   Optional. Specify 0 to ignore. For streams. Specify an initial position to seek the stream to. */
    initialseekpostype  [FMOD_TIMEUNIT!]                  ;/* [w]   Optional. Specify 0 to ignore. For streams. Specify the time unit for the position set in initialseekposition. */
    ignoresetfilesystem [integer!]                        ;/* [w]   Optional. Specify 0 to ignore. Set to 1 to use fmod's built in file system. Ignores setFileSystem callbacks and also FMOD_CREATESOUNEXINFO file callbacks.  Useful for specific cases where you don't want to use your own file system but want to use fmod's file system (ie net streaming). */
    audioqueuepolicy    [u-integer!]                      ;/* [w]   Optional. Specify 0 or FMOD_AUDIOQUEUE_CODECPOLICY_DEFAULT to ignore. Policy used to determine whether hardware or software is used for decoding, see FMOD_AUDIOQUEUE_CODECPOLICY for options (iOS >= 3.0 required, otherwise only hardware is available) */ 
    minmidigranularity  [u-integer!]                      ;/* [w]   Optional. Specify 0 to ignore. Allows you to set a minimum desired MIDI mixer granularity. Values smaller than 512 give greater than default accuracy at the cost of more CPU and vice versa. Specify 0 for default (512 samples). */
    nonblockthreadid    [integer!]                        ;/* [w]   Optional. Specify 0 to ignore. Specifies a thread index to execute non blocking load on.  Allows for up to 5 threads to be used for loading at once.  This is to avoid one load blocking another.  Maximum value = 4. */
    fsbguid             [FMOD_GUID!]           ;/* [r/w] Optional. Specify 0 to ignore. Allows you to provide the GUID lookup for cached FSB header info. Once loaded the GUID will be written back to the pointer. This is to avoid seeking and reading the FSB header. */
];} FMOD_CREATESOUNDEXINFO;

FMOD_ADVANCEDSETTINGS!: alias struct! [
;== Settings for advanced features like configuring memory and cpu usage for the FMOD_CREATECOMPRESSEDSAMPLE feature.
;    maxMPEGCodecs / maxADPCMCodecs / maxXMACodecs will determine the maximum cpu usage of playing realtime samples.  Use this to lower potential excess cpu usage and also control memory usage.
;    
;    maxPCMCodecs is for use with PS3 only. It will determine the maximum number of PCM voices that can be played at once. This includes streams of any format and all sounds created
;    *without* the FMOD_CREATECOMPRESSEDSAMPLE flag.
;    
;    Memory will be allocated for codecs 'up front' (during System::init) if these values are specified as non zero.  If any are zero, it allocates memory for the codec whenever a file of the type in question is loaded.  So if maxMPEGCodecs is 0 for example, it will allocate memory for the mpeg codecs the first time an mp3 is loaded or an mp3 based .FSB file is loaded.
;    
;    Due to inefficient encoding techniques on certain .wav based ADPCM files, FMOD can can need an extra 29720 bytes per codec.  This means for lowest memory consumption.  Use FSB as it uses an optimal/small ADPCM block size.
;    
;    Members marked with [r] mean the variable is modified by FMOD and is for reading purposes only.  Do not change this value.
;    Members marked with [w] mean the variable can be written to.  The user can set the value.
;    Members marked with [r/w] are either read or write depending on if you are using System::setAdvancedSettings (w) or System::getAdvancedSettings (r).
    cbsize					[integer!]                  ;/* [w]   Size of this structure.  Use sizeof(FMOD_ADVANCEDSETTINGS)  NOTE: This must be set before calling System::getAdvancedSettings or System::setAdvancedSettings! */
    maxMPEGCodecs			[integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  MPEG   codecs consume 22,216 bytes per instance and this number will determine how many MPEG   channels can be played simultaneously. Default = 32. */
    maxADPCMCodecs 			[integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  ADPCM  codecs consume  2,480 bytes per instance and this number will determine how many ADPCM  channels can be played simultaneously. Default = 32. */
    maxXMACodecs			[integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  XMA    codecs consume  6,263 bytes per instance and this number will determine how many XMA    channels can be played simultaneously. Default = 32. */
    maxVorbisCodecs 		[integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  Vorbis codecs consume 16,512 bytes per instance and this number will determine how many Vorbis channels can be played simultaneously. Default = 32. */    
    maxAT9Codecs 			[integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  AT9    codecs consume 20,664 bytes per instance and this number will determine how many AT9    channels can be played simultaneously. Default = 32. */    
    maxFADPCMCodecs 		[integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. For use with FMOD_CREATECOMPRESSEDSAMPLE only.  FADPCM codecs consume  2,232 bytes per instance and this number will determine how many FADPCM channels can be played simultaneously. Default = 32. */
    maxPCMCodecs 			[integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. For use with PS3 only.                          PCM    codecs consume  2,536 bytes per instance and this number will determine how many streams and PCM voices can be played simultaneously. Default = 32. */
    ASIONumChannels 		[integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. Number of channels available on the ASIO device. */
    ASIOChannelList 		[handle!];[pointer! [c-string!]]      ;/* [r/w] Optional. Specify 0 to ignore. Pointer to an array of strings (number of entries defined by ASIONumChannels) with ASIO channel names. */
    ASIOSpeakerList 		[FMOD_SPEAKER!]  ;/* [r/w] Optional. Specify 0 to ignore. Pointer to a list of speakers that the ASIO channels map to.  This can be called after System::init to remap ASIO output. */
    HRTFMinAngle 			[float32!]                    ;/* [r/w] Optional.                      For use with FMOD_INIT_HRTF_LOWPASS.  The angle range (0-360) of a 3D sound in relation to the listener, at which the HRTF function begins to have an effect. 0 = in front of the listener. 180 = from 90 degrees to the left of the listener to 90 degrees to the right. 360 = behind the listener. Default = 180.0. */
    HRTFMaxAngle 			[float32!]                    ;/* [r/w] Optional.                      For use with FMOD_INIT_HRTF_LOWPASS.  The angle range (0-360) of a 3D sound in relation to the listener, at which the HRTF function has maximum effect. 0 = front of the listener. 180 = from 90 degrees to the left of the listener to 90 degrees to the right. 360 = behind the listener. Default = 360.0. */
    HRTFFreq 				[float32!]                    ;/* [r/w] Optional. Specify 0 to ignore. For use with FMOD_INIT_HRTF_LOWPASS.  The cutoff frequency of the HRTF's lowpass filter function when at maximum effect. (i.e. at HRTFMaxAngle).  Default = 4000.0. */
    vol0virtualvol 			[float32!]                    ;/* [r/w] Optional. Specify 0 to ignore. For use with FMOD_INIT_VOL0_BECOMES_VIRTUAL.  If this flag is used, and the volume is below this, then the sound will become virtual.  Use this value to raise the threshold to a different point where a sound goes virtual. */
    defaultDecodeBufferSize [integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. For streams. This determines the default size of the double buffer (in milliseconds) that a stream uses.  Default = 400ms */
    profilePortA            [byte!]                     ;/* [r/w] Optional. Specify 0 to ignore. For use with FMOD_INIT_PROFILE_ENABLE.  Specify the port to listen on for connections by the profiler application. */
    profilePortB            [byte!] ;@@ `profilePort` is of type `unsigned short` but such a type is not in Red/System yet, so it is here as two bytes!
    geometryMaxFadeTime     [integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. The maximum time in miliseconds it takes for a channel to fade to the new level when its occlusion changes. */
    distanceFilterCenterFreq [float32!]                   ;/* [r/w] Optional. Specify 0 to ignore. For use with FMOD_INIT_DISTANCE_FILTERING.  The default center frequency in Hz for the distance filtering effect. Default = 1500.0. */
    reverb3Dinstance 		[integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. Out of 0 to 3, 3d reverb spheres will create a phyical reverb unit on this instance slot.  See FMOD_REVERB_PROPERTIES. */
    DSPBufferPoolSize 		[integer!]                  ;/* [r/w] Optional. Specify 0 to ignore. Number of buffers in DSP buffer pool.  Each buffer will be DSPBlockSize * sizeof(float) * SpeakerModeChannelCount.  ie 7.1 @ 1024 DSP block size = 8 * 1024 * 4 = 32kb.  Default = 8. */
    stackSizeStream 		[u-integer!]                ;/* [r/w] Optional. Specify 0 to ignore. Specify the stack size for the FMOD Stream thread in bytes.  Useful for custom codecs that use excess stack.  Default 49,152 (48kb) */
    stackSizeNonBlocking 	[u-integer!]                ;/* [r/w] Optional. Specify 0 to ignore. Specify the stack size for the FMOD_NONBLOCKING loading thread.  Useful for custom codecs that use excess stack.  Default 65,536 (64kb) */
    stackSizeMixer 			[u-integer!]                ;/* [r/w] Optional. Specify 0 to ignore. Specify the stack size for the FMOD mixer thread.  Useful for custom dsps that use excess stack.  Default 49,152 (48kb) */
    resamplerMethod			[handle!];[FMOD_DSP_RESAMPLER!]       ;/* [r/w] Optional. Specify 0 to ignore. Resampling method used with fmod's software mixer.  See FMOD_DSP_RESAMPLER for details on methods. */
    commandQueueSize 		[u-integer!]                ;/* [r/w] Optional. Specify 0 to ignore. Specify the command queue size for thread safe processing.  Default 2048 (2kb) */
    randomSeed 				[u-integer!]                ;/* [r/w] Optional. Specify 0 to ignore. Seed value that FMOD will use to initialize its internal random number generators. */
]

FMOD_REVERB_PROPERTIES!: alias struct! [
;== Structure defining a reverb environment.
;    Note the default reverb properties are the same as the FMOD_PRESET_GENERIC preset.
;    All members are read/write [r/w], written to by FMOD when queried with System::getReverbProperties and read by FMOD when set with System::setReverbProperties.
;                                 /*       MIN    MAX     DEFAULT DESCRIPTION */
    DecayTime 			[float32!] ;/* [r/w] 0.0    20000.0 1500.0  Reverberation decay time (ms)                                             */
    EarlyDelay 			[float32!] ;/* [r/w] 0.0    300.0   7.0     Initial reflection delay time (ms)                                        */
    LateDelay 			[float32!] ;/* [r/w] 0.0    100     11.0    Late reverberation delay time relative to initial reflection (ms)         */
    HFReference 		[float32!] ;/* [r/w] 20.0   20000.0 5000    Reference high frequency (Hz)                                             */
    HFDecayRatio 		[float32!] ;/* [r/w] 10.0   100.0   50.0    High-frequency to mid-frequency decay time ratio (%)                      */
    Diffusion 			[float32!] ;/* [r/w] 0.0    100.0   100.0   Value that controls the echo density in the late reverberation decay (%)  */
    Density 			[float32!] ;/* [r/w] 0.0    100.0   100.0   Value that controls the modal density in the late reverberation decay (%) */
    LowShelfFrequency 	[float32!] ;/* [r/w] 20.0   1000.0  250.0   Reference low frequency (Hz)                                              */
    LowShelfGain 		[float32!] ;/* [r/w] -36.0  12.0    0.0     Relative room effect level at low frequencies (dB)                        */
    HighCut 			[float32!] ;/* [r/w] 20.0   20000.0 20000.0 Relative room effect level at high frequencies (Hz)                       */
    EarlyLateMix 		[float32!] ;/* [r/w] 0.0    100.0   50.0    Early reflections level relative to room effect (%)                       */
    WetLevel 			[float32!] ;/* [r/w] -80.0  20.0    -6.0    Room effect level at mid frequencies (dB)                                 */
]

#enum FMOD_DSP_TYPE! [
;== These definitions can be used for creating FMOD defined special effects or DSP units.
;    To get them to be active, first create the unit, then add it somewhere into the DSP network, 
;    either at the front of the network near the soundcard unit to affect the global output
;    (by using System::getDSPHead), or on a single channel (using Channel::getDSPHead).
    FMOD_DSP_TYPE_UNKNOWN           ;/* This unit was created via a non FMOD plugin so has an unknown purpose. */
    FMOD_DSP_TYPE_MIXER             ;/* This unit does nothing but take inputs and mix them together then feed the result to the soundcard unit. */
    FMOD_DSP_TYPE_OSCILLATOR        ;/* This unit generates sine/square/saw/triangle or noise tones. */
    FMOD_DSP_TYPE_LOWPASS           ;/* This unit filters sound using a high quality, resonant lowpass filter algorithm but consumes more CPU time. Deprecated and will be removed in a future release (see FMOD_DSP_LOWPASS remarks for alternatives). */
    FMOD_DSP_TYPE_ITLOWPASS         ;/* This unit filters sound using a resonant lowpass filter algorithm that is used in Impulse Tracker, but with limited cutoff range (0 to 8060hz). */
    FMOD_DSP_TYPE_HIGHPASS          ;/* This unit filters sound using a resonant highpass filter algorithm. Deprecated and will be removed in a future release (see FMOD_DSP_HIGHPASS remarks for alternatives). */
    FMOD_DSP_TYPE_ECHO              ;/* This unit produces an echo on the sound and fades out at the desired rate. */
    FMOD_DSP_TYPE_FADER             ;/* This unit pans and scales the volume of a unit. */
    FMOD_DSP_TYPE_FLANGE            ;/* This unit produces a flange effect on the sound. */
    FMOD_DSP_TYPE_DISTORTION        ;/* This unit distorts the sound. */
    FMOD_DSP_TYPE_NORMALIZE         ;/* This unit normalizes or amplifies the sound to a certain level. */
    FMOD_DSP_TYPE_LIMITER           ;/* This unit limits the sound to a certain level. */
    FMOD_DSP_TYPE_PARAMEQ           ;/* This unit attenuates or amplifies a selected frequency range. Deprecated and will be removed in a future release (see FMOD_DSP_PARAMEQ remarks for alternatives). */
    FMOD_DSP_TYPE_PITCHSHIFT        ;/* This unit bends the pitch of a sound without changing the speed of playback. */
    FMOD_DSP_TYPE_CHORUS            ;/* This unit produces a chorus effect on the sound. */
    FMOD_DSP_TYPE_VSTPLUGIN         ;/* This unit allows the use of Steinberg VST plugins */
    FMOD_DSP_TYPE_WINAMPPLUGIN      ;/* This unit allows the use of Nullsoft Winamp plugins */
    FMOD_DSP_TYPE_ITECHO            ;/* This unit produces an echo on the sound and fades out at the desired rate as is used in Impulse Tracker. */
    FMOD_DSP_TYPE_COMPRESSOR        ;/* This unit implements dynamic compression (linked/unlinked multichannel, wideband) */
    FMOD_DSP_TYPE_SFXREVERB         ;/* This unit implements SFX reverb */
    FMOD_DSP_TYPE_LOWPASS_SIMPLE    ;/* This unit filters sound using a simple lowpass with no resonance, but has flexible cutoff and is fast. Deprecated and will be removed in a future release (see FMOD_DSP_LOWPASS_SIMPLE remarks for alternatives). */
    FMOD_DSP_TYPE_DELAY             ;/* This unit produces different delays on individual channels of the sound. */
    FMOD_DSP_TYPE_TREMOLO           ;/* This unit produces a tremolo / chopper effect on the sound. */
    FMOD_DSP_TYPE_LADSPAPLUGIN      ;/* Unsupported / Deprecated. */
    FMOD_DSP_TYPE_SEND              ;/* This unit sends a copy of the signal to a return DSP anywhere in the DSP tree. */
    FMOD_DSP_TYPE_RETURN            ;/* This unit receives signals from a number of send DSPs. */
    FMOD_DSP_TYPE_HIGHPASS_SIMPLE   ;/* This unit filters sound using a simple highpass with no resonance, but has flexible cutoff and is fast. Deprecated and will be removed in a future release (see FMOD_DSP_HIGHPASS_SIMPLE remarks for alternatives). */
    FMOD_DSP_TYPE_PAN               ;/* This unit pans the signal, possibly upmixing or downmixing as well. */
    FMOD_DSP_TYPE_THREE_EQ          ;/* This unit is a three-band equalizer. */
    FMOD_DSP_TYPE_FFT               ;/* This unit simply analyzes the signal and provides spectrum information back through getParameter. */
    FMOD_DSP_TYPE_LOUDNESS_METER    ;/* This unit analyzes the loudness and true peak of the signal. */
    FMOD_DSP_TYPE_ENVELOPEFOLLOWER  ;/* This unit tracks the envelope of the input/sidechain signal. Format to be publicly disclosed soon. */
    FMOD_DSP_TYPE_CONVOLUTIONREVERB ;/* This unit implements convolution reverb. */
    FMOD_DSP_TYPE_CHANNELMIX        ;/* This unit provides per signal channel gain, and output channel mapping to allow 1 multichannel signal made up of many groups of signals to map to a single output signal. */
    FMOD_DSP_TYPE_TRANSCEIVER       ;/* This unit 'sends' and 'receives' from a selection of up to 32 different slots.  It is like a send/return but it uses global slots rather than returns as the destination.  It also has other features.  Multiple transceivers can receive from a single channel, or multiple transceivers can send to a single channel, or a combination of both. */
    FMOD_DSP_TYPE_OBJECTPAN         ;/* This unit sends the signal to a 3d object encoder like Dolby Atmos.   Supports a subset of the FMOD_DSP_TYPE_PAN parameters. */
    FMOD_DSP_TYPE_MULTIBAND_EQ      ;/* This unit is a flexible five band parametric equalizer. */

    FMOD_DSP_TYPE_MAX               ;/* Maximum number of pre-defined DSP types. */
]

#enum FMOD_TAGTYPE! [
;== List of tag types that could be stored within a sound.  These include id3 tags, metadata from netstreams and vorbis/asf data.
    FMOD_TAGTYPE_UNKNOWN
    FMOD_TAGTYPE_ID3V1
    FMOD_TAGTYPE_ID3V2
    FMOD_TAGTYPE_VORBISCOMMENT
    FMOD_TAGTYPE_SHOUTCAST
    FMOD_TAGTYPE_ICECAST
    FMOD_TAGTYPE_ASF
    FMOD_TAGTYPE_MIDI
    FMOD_TAGTYPE_PLAYLIST
    FMOD_TAGTYPE_FMOD
    FMOD_TAGTYPE_USER

    FMOD_TAGTYPE_MAX               ;/* Maximum number of tag types supported. */
]


#enum FMOD_TAGDATATYPE! [
;== List of data types that can be returned by Sound::getTag
    FMOD_TAGDATATYPE_BINARY
    FMOD_TAGDATATYPE_INT
    FMOD_TAGDATATYPE_FLOAT
    FMOD_TAGDATATYPE_STRING
    FMOD_TAGDATATYPE_STRING_UTF16
    FMOD_TAGDATATYPE_STRING_UTF16BE
    FMOD_TAGDATATYPE_STRING_UTF8
    FMOD_TAGDATATYPE_CDTOC

    FMOD_TAGDATATYPE_MAX               ;/* Maximum number of tag datatypes supported. */
]


FMOD_TAG!: alias struct! [
;== Structure describing a piece of tag data.
    type		[FMOD_TAGTYPE!]     ;/* [r] The type of this tag. */
    datatype 	[FMOD_TAGDATATYPE!] ;/* [r] The type of data that this tag contains */
    name 		[c-string!]         ;/* [r] The name of this tag i.e. "TITLE", "ARTIST" etc. */
    data 		[byte-ptr!]         ;/* [r] Pointer to the tag data - its format is determined by the datatype member */
    datalen 	[u-integer!]        ;/* [r] Length of the data contained in this tag */
    updated     [FMOD_BOOL!]        ;/* [r] True if this tag has been updated since last being accessed with Sound::getTag */
]

#enum FMOD_RESULT_CODES! [
;== error codes.  Returned from every function.
    FMOD_OK                            ;/* No errors. */
    FMOD_ERR_BADCOMMAND                ;/* Tried to call a function on a data type that does not allow this type of functionality (ie calling Sound::lock on a streaming sound). */
    FMOD_ERR_CHANNEL_ALLOC             ;/* Error trying to allocate a channel. */
    FMOD_ERR_CHANNEL_STOLEN            ;/* The specified channel has been reused to play another sound. */
    FMOD_ERR_DMA                       ;/* DMA Failure.  See debug output for more information. */
    FMOD_ERR_DSP_CONNECTION            ;/* DSP connection error.  Connection possibly caused a cyclic dependency or connected dsps with incompatible buffer counts. */
    FMOD_ERR_DSP_DONTPROCESS           ;/* DSP return code from a DSP process query callback.  Tells mixer not to call the process callback and therefore not consume CPU.  Use this to optimize the DSP graph. */
    FMOD_ERR_DSP_FORMAT                ;/* DSP Format error.  A DSP unit may have attempted to connect to this network with the wrong format, or a matrix may have been set with the wrong size if the target unit has a specified channel map. */
    FMOD_ERR_DSP_INUSE                 ;/* DSP is already in the mixer's DSP network. It must be removed before being reinserted or released. */
    FMOD_ERR_DSP_NOTFOUND              ;/* DSP connection error.  Couldn't find the DSP unit specified. */
    FMOD_ERR_DSP_RESERVED              ;/* DSP operation error.  Cannot perform operation on this DSP as it is reserved by the system. */
    FMOD_ERR_DSP_SILENCE               ;/* DSP return code from a DSP process query callback.  Tells mixer silence would be produced from read, so go idle and not consume CPU.  Use this to optimize the DSP graph. */
    FMOD_ERR_DSP_TYPE                  ;/* DSP operation cannot be performed on a DSP of this type. */
    FMOD_ERR_FILE_BAD                  ;/* Error loading file. */
    FMOD_ERR_FILE_COULDNOTSEEK         ;/* Couldn't perform seek operation.  This is a limitation of the medium (ie netstreams) or the file format. */
    FMOD_ERR_FILE_DISKEJECTED          ;/* Media was ejected while reading. */
    FMOD_ERR_FILE_EOF                  ;/* End of file unexpectedly reached while trying to read essential data (truncated?). */
    FMOD_ERR_FILE_ENDOFDATA            ;/* End of current chunk reached while trying to read data. */
    FMOD_ERR_FILE_NOTFOUND             ;/* File not found. */
    FMOD_ERR_FORMAT                    ;/* Unsupported file or audio format. */
    FMOD_ERR_HEADER_MISMATCH           ;/* There is a version mismatch between the FMOD header and either the FMOD Studio library or the FMOD Low Level library. */
    FMOD_ERR_HTTP                      ;/* A HTTP error occurred. This is a catch-all for HTTP errors not listed elsewhere. */
    FMOD_ERR_HTTP_ACCESS               ;/* The specified resource requires authentication or is forbidden. */
    FMOD_ERR_HTTP_PROXY_AUTH           ;/* Proxy authentication is required to access the specified resource. */
    FMOD_ERR_HTTP_SERVER_ERROR         ;/* A HTTP server error occurred. */
    FMOD_ERR_HTTP_TIMEOUT              ;/* The HTTP request timed out. */
    FMOD_ERR_INITIALIZATION            ;/* FMOD was not initialized correctly to support this function. */
    FMOD_ERR_INITIALIZED               ;/* Cannot call this command after System::init. */
    FMOD_ERR_INTERNAL                  ;/* An error occurred that wasn't supposed to.  Contact support. */
    FMOD_ERR_INVALID_FLOAT             ;/* Value passed in was a NaN, Inf or denormalized float. */
    FMOD_ERR_INVALID_HANDLE            ;/* An invalid object handle was used. */
    FMOD_ERR_INVALID_PARAM             ;/* An invalid parameter was passed to this function. */
    FMOD_ERR_INVALID_POSITION          ;/* An invalid seek position was passed to this function. */
    FMOD_ERR_INVALID_SPEAKER           ;/* An invalid speaker was passed to this function based on the current speaker mode. */
    FMOD_ERR_INVALID_SYNCPOINT         ;/* The syncpoint did not come from this sound handle. */
    FMOD_ERR_INVALID_THREAD            ;/* Tried to call a function on a thread that is not supported. */
    FMOD_ERR_INVALID_VECTOR            ;/* The vectors passed in are not unit length, or perpendicular. */
    FMOD_ERR_MAXAUDIBLE                ;/* Reached maximum audible playback count for this sound's soundgroup. */
    FMOD_ERR_MEMORY                    ;/* Not enough memory or resources. */
    FMOD_ERR_MEMORY_CANTPOINT          ;/* Can't use FMOD_OPENMEMORY_POINT on non PCM source data, or non mp3/xma/adpcm data if FMOD_CREATECOMPRESSEDSAMPLE was used. */
    FMOD_ERR_NEEDS3D                   ;/* Tried to call a command on a 2d sound when the command was meant for 3d sound. */
    FMOD_ERR_NEEDSHARDWARE             ;/* Tried to use a feature that requires hardware support. */
    FMOD_ERR_NET_CONNECT               ;/* Couldn't connect to the specified host. */
    FMOD_ERR_NET_SOCKET_ERROR          ;/* A socket error occurred.  This is a catch-all for socket-related errors not listed elsewhere. */
    FMOD_ERR_NET_URL                   ;/* The specified URL couldn't be resolved. */
    FMOD_ERR_NET_WOULD_BLOCK           ;/* Operation on a non-blocking socket could not complete immediately. */
    FMOD_ERR_NOTREADY                  ;/* Operation could not be performed because specified sound/DSP connection is not ready. */
    FMOD_ERR_OUTPUT_ALLOCATED          ;/* Error initializing output device, but more specifically, the output device is already in use and cannot be reused. */
    FMOD_ERR_OUTPUT_CREATEBUFFER       ;/* Error creating hardware sound buffer. */
    FMOD_ERR_OUTPUT_DRIVERCALL         ;/* A call to a standard soundcard driver failed, which could possibly mean a bug in the driver or resources were missing or exhausted. */
    FMOD_ERR_OUTPUT_FORMAT             ;/* Soundcard does not support the specified format. */
    FMOD_ERR_OUTPUT_INIT               ;/* Error initializing output device. */
    FMOD_ERR_OUTPUT_NODRIVERS          ;/* The output device has no drivers installed.  If pre-init, FMOD_OUTPUT_NOSOUND is selected as the output mode.  If post-init, the function just fails. */
    FMOD_ERR_PLUGIN                    ;/* An unspecified error has been returned from a plugin. */
    FMOD_ERR_PLUGIN_MISSING            ;/* A requested output, dsp unit type or codec was not available. */
    FMOD_ERR_PLUGIN_RESOURCE           ;/* A resource that the plugin requires cannot be found. (ie the DLS file for MIDI playback) */
    FMOD_ERR_PLUGIN_VERSION            ;/* A plugin was built with an unsupported SDK version. */
    FMOD_ERR_RECORD                    ;/* An error occurred trying to initialize the recording device. */
    FMOD_ERR_REVERB_CHANNELGROUP       ;/* Reverb properties cannot be set on this channel because a parent channelgroup owns the reverb connection. */
    FMOD_ERR_REVERB_INSTANCE           ;/* Specified instance in FMOD_REVERB_PROPERTIES couldn't be set. Most likely because it is an invalid instance number or the reverb doesn't exist. */
    FMOD_ERR_SUBSOUNDS                 ;/* The error occurred because the sound referenced contains subsounds when it shouldn't have, or it doesn't contain subsounds when it should have.  The operation may also not be able to be performed on a parent sound. */
    FMOD_ERR_SUBSOUND_ALLOCATED        ;/* This subsound is already being used by another sound, you cannot have more than one parent to a sound.  Null out the other parent's entry first. */
    FMOD_ERR_SUBSOUND_CANTMOVE         ;/* Shared subsounds cannot be replaced or moved from their parent stream, such as when the parent stream is an FSB file. */
    FMOD_ERR_TAGNOTFOUND               ;/* The specified tag could not be found or there are no tags. */
    FMOD_ERR_TOOMANYCHANNELS           ;/* The sound created exceeds the allowable input channel count.  This can be increased using the 'maxinputchannels' parameter in System::setSoftwareFormat. */
    FMOD_ERR_TRUNCATED                 ;/* The retrieved string is too long to fit in the supplied buffer and has been truncated. */
    FMOD_ERR_UNIMPLEMENTED             ;/* Something in FMOD hasn't been implemented when it should be! contact support! */
    FMOD_ERR_UNINITIALIZED             ;/* This command failed because System::init or System::setDriver was not called. */
    FMOD_ERR_UNSUPPORTED               ;/* A command issued was not supported by this object.  Possibly a plugin without certain callbacks specified. */
    FMOD_ERR_VERSION                   ;/* The version number of this file format is not supported. */
    FMOD_ERR_EVENT_ALREADY_LOADED      ;/* The specified bank has already been loaded. */
    FMOD_ERR_EVENT_LIVEUPDATE_BUSY     ;/* The live update connection failed due to the game already being connected. */
    FMOD_ERR_EVENT_LIVEUPDATE_MISMATCH ;/* The live update connection failed due to the game data being out of sync with the tool. */
    FMOD_ERR_EVENT_LIVEUPDATE_TIMEOUT  ;/* The live update connection timed out. */
    FMOD_ERR_EVENT_NOTFOUND            ;/* The requested event, bus or vca could not be found. */
    FMOD_ERR_STUDIO_UNINITIALIZED      ;/* The Studio::System object is not yet initialized. */
    FMOD_ERR_STUDIO_NOT_LOADED         ;/* The specified resource is not loaded, so it can't be unloaded. */
    FMOD_ERR_INVALID_STRING            ;/* An invalid string was passed to this function. */
    FMOD_ERR_ALREADY_LOCKED            ;/* The specified resource is already locked. */
    FMOD_ERR_NOT_LOCKED                ;/* The specified resource is not locked, so it can't be unlocked. */
    FMOD_ERR_RECORD_DISCONNECTED       ;/* The specified recording driver has been disconnected. */
    FMOD_ERR_TOOMANYSAMPLES            ;/* The length provided exceeds the allowable limit. */
] ; FMOD_RESULT;

#import [
	FMOD_LIBRARY stdcall [

		;-- FMOD global system functions (optional).

		FMOD_Memory_Initialize: "FMOD_Memory_Initialize"[
		;(void *poolmem, int poollen, FMOD_MEMORY_ALLOC_CALLBACK useralloc, FMOD_MEMORY_REALLOC_CALLBACK userrealloc, FMOD_MEMORY_FREE_CALLBACK userfree, FMOD_MEMORY_TYPE memtypeflags)
			poolmem                       [byte-ptr!]
			poollen                       [integer!]
			useralloc                     [FMOD_MEMORY_ALLOC_CALLBACK!]
			userrealloc                   [FMOD_MEMORY_REALLOC_CALLBACK!]
			userfree                      [FMOD_MEMORY_FREE_CALLBACK!]
			memtypeflags                  [FMOD_MEMORY_TYPE!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Memory_GetStats: "FMOD_Memory_GetStats"[
		;(int *currentalloced, int *maxalloced, FMOD_BOOL blocking)
			currentalloced                [int-ptr!]
			maxalloced                    [int-ptr!]
			blocking                      [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Debug_Initialize: "FMOD_Debug_Initialize"[
		;(FMOD_DEBUG_FLAGS flags, FMOD_DEBUG_MODE mode, FMOD_DEBUG_CALLBACK callback, const char *filename)
			flags                         [FMOD_DEBUG_FLAGS!]
			mode                          [FMOD_DEBUG_MODE!]
			callback                      [FMOD_DEBUG_CALLBACK!]
			filename                      [c-string!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_File_SetDiskBusy: "FMOD_File_SetDiskBusy"[
		;(int busy)
			busy                          [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_File_GetDiskBusy: "FMOD_File_GetDiskBusy"[
		;(int *busy)
			busy                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;-- FMOD System factory functions.  Use this to create an FMOD System Instance.  below you will see FMOD_System_Init/Close to get started.

		FMOD_System_Create: "FMOD_System_Create"[
		;(FMOD_SYSTEM **system)
			system                        [pointer! [FMOD_SYSTEM!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_Release: "FMOD_System_Release"[
		;(FMOD_SYSTEM *system)
			system                        [FMOD_SYSTEM!]
			return:                       [FMOD_RESULT!]
		]


		;-- 'System' API



		;--  Setup functions.

		FMOD_System_SetOutput: "FMOD_System_SetOutput"[
		;(FMOD_SYSTEM *system, FMOD_OUTPUTTYPE output)
			system                        [FMOD_SYSTEM!]
			output                        [FMOD_OUTPUTTYPE!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetOutput: "FMOD_System_GetOutput"[
		;(FMOD_SYSTEM *system, FMOD_OUTPUTTYPE *output)
			system                        [FMOD_SYSTEM!]
			output                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetNumDrivers: "FMOD_System_GetNumDrivers"[
		;(FMOD_SYSTEM *system, int *numdrivers)
			system                        [FMOD_SYSTEM!]
			numdrivers                    [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetDriverInfo: "FMOD_System_GetDriverInfo"[
		;(FMOD_SYSTEM *system, int id, char *name, int namelen, FMOD_GUID *guid, int *systemrate, FMOD_SPEAKERMODE *speakermode, int *speakermodechannels)
			system                        [FMOD_SYSTEM!]
			id                            [integer!]
			name                          [c-string!]
			namelen                       [integer!]
			guid                          [FMOD_GUID!]
			systemrate                    [int-ptr!]
			speakermode                   [int-ptr!]
			speakermodechannels           [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetDriver: "FMOD_System_SetDriver"[
		;(FMOD_SYSTEM *system, int driver)
			system                        [FMOD_SYSTEM!]
			driver                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetDriver: "FMOD_System_GetDriver"[
		;(FMOD_SYSTEM *system, int *driver)
			system                        [FMOD_SYSTEM!]
			driver                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetSoftwareChannels: "FMOD_System_SetSoftwareChannels"[
		;(FMOD_SYSTEM *system, int numsoftwarechannels)
			system                        [FMOD_SYSTEM!]
			numsoftwarechannels           [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetSoftwareChannels: "FMOD_System_GetSoftwareChannels"[
		;(FMOD_SYSTEM *system, int *numsoftwarechannels)
			system                        [FMOD_SYSTEM!]
			numsoftwarechannels           [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetSoftwareFormat: "FMOD_System_SetSoftwareFormat"[
		;(FMOD_SYSTEM *system, int samplerate, FMOD_SPEAKERMODE speakermode, int numrawspeakers)
			system                        [FMOD_SYSTEM!]
			samplerate                    [integer!]
			speakermode                   [FMOD_SPEAKERMODE!]
			numrawspeakers                [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetSoftwareFormat: "FMOD_System_GetSoftwareFormat"[
		;(FMOD_SYSTEM *system, int *samplerate, FMOD_SPEAKERMODE *speakermode, int *numrawspeakers)
			system                        [FMOD_SYSTEM!]
			samplerate                    [int-ptr!]
			speakermode                   [int-ptr!]
			numrawspeakers                [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetDSPBufferSize: "FMOD_System_SetDSPBufferSize"[
		;(FMOD_SYSTEM *system, unsigned int bufferlength, int numbuffers)
			system                        [FMOD_SYSTEM!]
			bufferlength                  [integer!]
			numbuffers                    [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetDSPBufferSize: "FMOD_System_GetDSPBufferSize"[
		;(FMOD_SYSTEM *system, unsigned int *bufferlength, int *numbuffers)
			system                        [FMOD_SYSTEM!]
			bufferlength                  [int-ptr!]
			numbuffers                    [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetFileSystem: "FMOD_System_SetFileSystem"[
		;(FMOD_SYSTEM *system, FMOD_FILE_OPEN_CALLBACK useropen, FMOD_FILE_CLOSE_CALLBACK userclose, FMOD_FILE_READ_CALLBACK userread, FMOD_FILE_SEEK_CALLBACK userseek, FMOD_FILE_ASYNCREAD_CALLBACK userasyncread, FMOD_FILE_ASYNCCANCEL_CALLBACK userasynccancel, int blockalign)
			system                        [FMOD_SYSTEM!]
			useropen                      [FMOD_FILE_OPEN_CALLBACK!]
			userclose                     [FMOD_FILE_CLOSE_CALLBACK!]
			userread                      [FMOD_FILE_READ_CALLBACK!]
			userseek                      [FMOD_FILE_SEEK_CALLBACK!]
			userasyncread                 [FMOD_FILE_ASYNCREAD_CALLBACK!]
			userasynccancel               [FMOD_FILE_ASYNCCANCEL_CALLBACK!]
			blockalign                    [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_AttachFileSystem: "FMOD_System_AttachFileSystem"[
		;(FMOD_SYSTEM *system, FMOD_FILE_OPEN_CALLBACK useropen, FMOD_FILE_CLOSE_CALLBACK userclose, FMOD_FILE_READ_CALLBACK userread, FMOD_FILE_SEEK_CALLBACK userseek)
			system                        [FMOD_SYSTEM!]
			useropen                      [FMOD_FILE_OPEN_CALLBACK!]
			userclose                     [FMOD_FILE_CLOSE_CALLBACK!]
			userread                      [FMOD_FILE_READ_CALLBACK!]
			userseek                      [FMOD_FILE_SEEK_CALLBACK!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetAdvancedSettings: "FMOD_System_SetAdvancedSettings"[
		;(FMOD_SYSTEM *system, FMOD_ADVANCEDSETTINGS *settings)
			system                        [FMOD_SYSTEM!]
			settings                      [FMOD_ADVANCEDSETTINGS!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetAdvancedSettings: "FMOD_System_GetAdvancedSettings"[
		;(FMOD_SYSTEM *system, FMOD_ADVANCEDSETTINGS *settings)
			system                        [FMOD_SYSTEM!]
			settings                      [FMOD_ADVANCEDSETTINGS!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetCallback: "FMOD_System_SetCallback"[
		;(FMOD_SYSTEM *system, FMOD_SYSTEM_CALLBACK callback, FMOD_SYSTEM_CALLBACK_TYPE callbackmask)
			system                        [FMOD_SYSTEM!]
			callback                      [FMOD_SYSTEM_CALLBACK!]
			callbackmask                  [integer!]
			return:                       [FMOD_RESULT!]
		]


		;--  Plug-in support.

		FMOD_System_SetPluginPath: "FMOD_System_SetPluginPath"[
		;(FMOD_SYSTEM *system, const char *path)
			system                        [FMOD_SYSTEM!]
			path                          [c-string!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_LoadPlugin: "FMOD_System_LoadPlugin"[
		;(FMOD_SYSTEM *system, const char *filename, unsigned int *handle, unsigned int priority)
			system                        [FMOD_SYSTEM!]
			filename                      [c-string!]
			handle                        [int-ptr!]
			priority                      [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_UnloadPlugin: "FMOD_System_UnloadPlugin"[
		;(FMOD_SYSTEM *system, unsigned int handle)
			system                        [FMOD_SYSTEM!]
			handle                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetNumNestedPlugins: "FMOD_System_GetNumNestedPlugins"[
		;(FMOD_SYSTEM *system, unsigned int handle, int *count)
			system                        [FMOD_SYSTEM!]
			handle                        [integer!]
			count                         [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetNestedPlugin: "FMOD_System_GetNestedPlugin"[
		;(FMOD_SYSTEM *system, unsigned int handle, int index, unsigned int *nestedhandle)
			system                        [FMOD_SYSTEM!]
			handle                        [integer!]
			index                         [integer!]
			nestedhandle                  [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetNumPlugins: "FMOD_System_GetNumPlugins"[
		;(FMOD_SYSTEM *system, FMOD_PLUGINTYPE plugintype, int *numplugins)
			system                        [FMOD_SYSTEM!]
			plugintype                    [FMOD_PLUGINTYPE!]
			numplugins                    [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetPluginHandle: "FMOD_System_GetPluginHandle"[
		;(FMOD_SYSTEM *system, FMOD_PLUGINTYPE plugintype, int index, unsigned int *handle)
			system                        [FMOD_SYSTEM!]
			plugintype                    [FMOD_PLUGINTYPE!]
			index                         [integer!]
			handle                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetPluginInfo: "FMOD_System_GetPluginInfo"[
		;(FMOD_SYSTEM *system, unsigned int handle, FMOD_PLUGINTYPE *plugintype, char *name, int namelen, unsigned int *version)
			system                        [FMOD_SYSTEM!]
			handle                        [integer!]
			plugintype                    [int-ptr!]
			name                          [c-string!]
			namelen                       [integer!]
			version                       [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetOutputByPlugin: "FMOD_System_SetOutputByPlugin"[
		;(FMOD_SYSTEM *system, unsigned int handle)
			system                        [FMOD_SYSTEM!]
			handle                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetOutputByPlugin: "FMOD_System_GetOutputByPlugin"[
		;(FMOD_SYSTEM *system, unsigned int *handle)
			system                        [FMOD_SYSTEM!]
			handle                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_CreateDSPByPlugin: "FMOD_System_CreateDSPByPlugin"[
		;(FMOD_SYSTEM *system, unsigned int handle, FMOD_DSP **dsp)
			system                        [FMOD_SYSTEM!]
			handle                        [integer!]
			dsp                           [pointer! [FMOD_DSP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetDSPInfoByPlugin: "FMOD_System_GetDSPInfoByPlugin"[
		;(FMOD_SYSTEM *system, unsigned int handle, const FMOD_DSP_DESCRIPTION **description)
			system                        [FMOD_SYSTEM!]
			handle                        [integer!]
			description                   [pointer! [handle!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_RegisterCodec: "FMOD_System_RegisterCodec"[
		;(FMOD_SYSTEM *system, FMOD_CODEC_DESCRIPTION *description, unsigned int *handle, unsigned int priority)
			system                        [FMOD_SYSTEM!]
			description                   [handle!]
			handle                        [int-ptr!]
			priority                      [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_RegisterDSP: "FMOD_System_RegisterDSP"[
		;(FMOD_SYSTEM *system, const FMOD_DSP_DESCRIPTION *description, unsigned int *handle)
			system                        [FMOD_SYSTEM!]
			description                   [handle!]
			handle                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_RegisterOutput: "FMOD_System_RegisterOutput"[
		;(FMOD_SYSTEM *system, const FMOD_OUTPUT_DESCRIPTION *description, unsigned int *handle)
			system                        [FMOD_SYSTEM!]
			description                   [handle!]
			handle                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Init/Close.

		FMOD_System_Init: "FMOD_System_Init"[
		;(FMOD_SYSTEM *system, int maxchannels, FMOD_INITFLAGS flags, void *extradriverdata)
			system                        [FMOD_SYSTEM!]
			maxchannels                   [integer!]
			flags                         [FMOD_INITFLAGS!]
			extradriverdata               [byte-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_Close: "FMOD_System_Close"[
		;(FMOD_SYSTEM *system)
			system                        [FMOD_SYSTEM!]
			return:                       [FMOD_RESULT!]
		]


		;--  General post-init system functions.

		FMOD_System_Update: "FMOD_System_Update"[
		;(FMOD_SYSTEM *system)
			system                        [FMOD_SYSTEM!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetSpeakerPosition: "FMOD_System_SetSpeakerPosition"[
		;(FMOD_SYSTEM *system, FMOD_SPEAKER speaker, float x, float y, FMOD_BOOL active)
			system                        [FMOD_SYSTEM!]
			speaker                       [FMOD_SPEAKER!]
			x                             [float32!]
			y                             [float32!]
			active                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetSpeakerPosition: "FMOD_System_GetSpeakerPosition"[
		;(FMOD_SYSTEM *system, FMOD_SPEAKER speaker, float *x, float *y, FMOD_BOOL *active)
			system                        [FMOD_SYSTEM!]
			speaker                       [FMOD_SPEAKER!]
			x                             [pointer! [float32!]]
			y                             [pointer! [float32!]]
			active                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetStreamBufferSize: "FMOD_System_SetStreamBufferSize"[
		;(FMOD_SYSTEM *system, unsigned int filebuffersize, FMOD_TIMEUNIT filebuffersizetype)
			system                        [FMOD_SYSTEM!]
			filebuffersize                [integer!]
			filebuffersizetype            [FMOD_TIMEUNIT!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetStreamBufferSize: "FMOD_System_GetStreamBufferSize"[
		;(FMOD_SYSTEM *system, unsigned int *filebuffersize, FMOD_TIMEUNIT *filebuffersizetype)
			system                        [FMOD_SYSTEM!]
			filebuffersize                [int-ptr!]
			filebuffersizetype            [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_Set3DSettings: "FMOD_System_Set3DSettings"[
		;(FMOD_SYSTEM *system, float dopplerscale, float distancefactor, float rolloffscale)
			system                        [FMOD_SYSTEM!]
			dopplerscale                  [float32!]
			distancefactor                [float32!]
			rolloffscale                  [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_Get3DSettings: "FMOD_System_Get3DSettings"[
		;(FMOD_SYSTEM *system, float *dopplerscale, float *distancefactor, float *rolloffscale)
			system                        [FMOD_SYSTEM!]
			dopplerscale                  [pointer! [float32!]]
			distancefactor                [pointer! [float32!]]
			rolloffscale                  [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_Set3DNumListeners: "FMOD_System_Set3DNumListeners"[
		;(FMOD_SYSTEM *system, int numlisteners)
			system                        [FMOD_SYSTEM!]
			numlisteners                  [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_Get3DNumListeners: "FMOD_System_Get3DNumListeners"[
		;(FMOD_SYSTEM *system, int *numlisteners)
			system                        [FMOD_SYSTEM!]
			numlisteners                  [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_Set3DListenerAttributes: "FMOD_System_Set3DListenerAttributes"[
		;(FMOD_SYSTEM *system, int listener, const FMOD_VECTOR *pos, const FMOD_VECTOR *vel, const FMOD_VECTOR *forward, const FMOD_VECTOR *up)
			system                        [FMOD_SYSTEM!]
			listener                      [integer!]
			pos                           [FMOD_VECTOR!]
			vel                           [FMOD_VECTOR!]
			forward                       [FMOD_VECTOR!]
			up                            [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_Get3DListenerAttributes: "FMOD_System_Get3DListenerAttributes"[
		;(FMOD_SYSTEM *system, int listener, FMOD_VECTOR *pos, FMOD_VECTOR *vel, FMOD_VECTOR *forward, FMOD_VECTOR *up)
			system                        [FMOD_SYSTEM!]
			listener                      [integer!]
			pos                           [FMOD_VECTOR!]
			vel                           [FMOD_VECTOR!]
			forward                       [FMOD_VECTOR!]
			up                            [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_Set3DRolloffCallback: "FMOD_System_Set3DRolloffCallback"[
		;(FMOD_SYSTEM *system, FMOD_3D_ROLLOFF_CALLBACK callback)
			system                        [FMOD_SYSTEM!]
			callback                      [FMOD_3D_ROLLOFF_CALLBACK!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_MixerSuspend: "FMOD_System_MixerSuspend"[
		;(FMOD_SYSTEM *system)
			system                        [FMOD_SYSTEM!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_MixerResume: "FMOD_System_MixerResume"[
		;(FMOD_SYSTEM *system)
			system                        [FMOD_SYSTEM!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetDefaultMixMatrix: "FMOD_System_GetDefaultMixMatrix"[
		;(FMOD_SYSTEM *system, FMOD_SPEAKERMODE sourcespeakermode, FMOD_SPEAKERMODE targetspeakermode, float *matrix, int matrixhop)
			system                        [FMOD_SYSTEM!]
			sourcespeakermode             [FMOD_SPEAKERMODE!]
			targetspeakermode             [FMOD_SPEAKERMODE!]
			matrix                        [pointer! [float32!]]
			matrixhop                     [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetSpeakerModeChannels: "FMOD_System_GetSpeakerModeChannels"[
		;(FMOD_SYSTEM *system, FMOD_SPEAKERMODE mode, int *channels)
			system                        [FMOD_SYSTEM!]
			mode                          [FMOD_SPEAKERMODE!]
			channels                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  System information functions.

		FMOD_System_GetVersion: "FMOD_System_GetVersion"[
		;(FMOD_SYSTEM *system, unsigned int *version)
			system                        [FMOD_SYSTEM!]
			version                       [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetOutputHandle: "FMOD_System_GetOutputHandle"[
		;(FMOD_SYSTEM *system, void **handle)
			system                        [FMOD_SYSTEM!]
			handle                        [byte-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetChannelsPlaying: "FMOD_System_GetChannelsPlaying"[
		;(FMOD_SYSTEM *system, int *channels, int *realchannels)
			system                        [FMOD_SYSTEM!]
			channels                      [int-ptr!]
			realchannels                  [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetCPUUsage: "FMOD_System_GetCPUUsage"[
		;(FMOD_SYSTEM *system, float *dsp, float *stream, float *geometry, float *update, float *total)
			system                        [FMOD_SYSTEM!]
			dsp                           [pointer! [float32!]]
			stream                        [pointer! [float32!]]
			geometry                      [pointer! [float32!]]
			update                        [pointer! [float32!]]
			total                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetFileUsage: "FMOD_System_GetFileUsage"[
		;(FMOD_SYSTEM *system, long long *sampleBytesRead, long long *streamBytesRead, long long *otherBytesRead)
			system                        [FMOD_SYSTEM!]
			sampleBytesRead               [long-long-ptr!]
			streamBytesRead               [long-long-ptr!]
			otherBytesRead                [long-long-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetSoundRAM: "FMOD_System_GetSoundRAM"[
		;(FMOD_SYSTEM *system, int *currentalloced, int *maxalloced, int *total)
			system                        [FMOD_SYSTEM!]
			currentalloced                [int-ptr!]
			maxalloced                    [int-ptr!]
			total                         [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Sound/DSP/Channel/FX creation and retrieval.

		FMOD_System_CreateSound: "FMOD_System_CreateSound"[
		;(FMOD_SYSTEM *system, const char *name_or_data, FMOD_MODE mode, FMOD_CREATESOUNDEXINFO *exinfo, FMOD_SOUND **sound)
			system                        [FMOD_SYSTEM!]
			name_or_data                  [c-string!]
			mode                          [FMOD_MODE!]
			exinfo                        [handle!]
			sound                         [pointer! [FMOD_SOUND!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_CreateStream: "FMOD_System_CreateStream"[
		;(FMOD_SYSTEM *system, const char *name_or_data, FMOD_MODE mode, FMOD_CREATESOUNDEXINFO *exinfo, FMOD_SOUND **sound)
			system                        [FMOD_SYSTEM!]
			name_or_data                  [c-string!]
			mode                          [FMOD_MODE!]
			exinfo                        [handle!]
			sound                         [pointer! [FMOD_SOUND!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_CreateDSP: "FMOD_System_CreateDSP"[
		;(FMOD_SYSTEM *system, const FMOD_DSP_DESCRIPTION *description, FMOD_DSP **dsp)
			system                        [FMOD_SYSTEM!]
			description                   [handle!]
			dsp                           [pointer! [FMOD_DSP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_CreateDSPByType: "FMOD_System_CreateDSPByType"[
		;(FMOD_SYSTEM *system, FMOD_DSP_TYPE type, FMOD_DSP **dsp)
			system                        [FMOD_SYSTEM!]
			type                          [FMOD_DSP_TYPE!]
			dsp                           [pointer! [FMOD_DSP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_CreateChannelGroup: "FMOD_System_CreateChannelGroup"[
		;(FMOD_SYSTEM *system, const char *name, FMOD_CHANNELGROUP **channelgroup)
			system                        [FMOD_SYSTEM!]
			name                          [c-string!]
			channelgroup                  [pointer! [FMOD_CHANNELGROUP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_CreateSoundGroup: "FMOD_System_CreateSoundGroup"[
		;(FMOD_SYSTEM *system, const char *name, FMOD_SOUNDGROUP **soundgroup)
			system                        [FMOD_SYSTEM!]
			name                          [c-string!]
			soundgroup                    [pointer! [FMOD_SOUNDGROUP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_CreateReverb3D: "FMOD_System_CreateReverb3D"[
		;(FMOD_SYSTEM *system, FMOD_REVERB3D **reverb)
			system                        [FMOD_SYSTEM!]
			reverb                        [pointer! [FMOD_REVERB3D!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_PlaySound: "FMOD_System_PlaySound"[
		;(FMOD_SYSTEM *system, FMOD_SOUND *sound, FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL paused, FMOD_CHANNEL **channel)
			system                        [FMOD_SYSTEM!]
			sound                         [FMOD_SOUND!]
			channelgroup                  [FMOD_CHANNELGROUP!]
			paused                        [integer!]
			channel                       [pointer! [FMOD_CHANNEL!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_PlayDSP: "FMOD_System_PlayDSP"[
		;(FMOD_SYSTEM *system, FMOD_DSP *dsp, FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL paused, FMOD_CHANNEL **channel)
			system                        [FMOD_SYSTEM!]
			dsp                           [FMOD_DSP!]
			channelgroup                  [FMOD_CHANNELGROUP!]
			paused                        [integer!]
			channel                       [pointer! [FMOD_CHANNEL!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetChannel: "FMOD_System_GetChannel"[
		;(FMOD_SYSTEM *system, int channelid, FMOD_CHANNEL **channel)
			system                        [FMOD_SYSTEM!]
			channelid                     [integer!]
			channel                       [pointer! [FMOD_CHANNEL!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetMasterChannelGroup: "FMOD_System_GetMasterChannelGroup"[
		;(FMOD_SYSTEM *system, FMOD_CHANNELGROUP **channelgroup)
			system                        [FMOD_SYSTEM!]
			channelgroup                  [pointer! [FMOD_CHANNELGROUP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetMasterSoundGroup: "FMOD_System_GetMasterSoundGroup"[
		;(FMOD_SYSTEM *system, FMOD_SOUNDGROUP **soundgroup)
			system                        [FMOD_SYSTEM!]
			soundgroup                    [pointer! [FMOD_SOUNDGROUP!]]
			return:                       [FMOD_RESULT!]
		]


		;--  Routing to ports.

		FMOD_System_AttachChannelGroupToPort: "FMOD_System_AttachChannelGroupToPort"[
		;(FMOD_SYSTEM *system, FMOD_PORT_TYPE portType, FMOD_PORT_INDEX portIndex, FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL passThru)
			system                        [FMOD_SYSTEM!]
			portType                      [FMOD_PORT_TYPE!]
			portIndex                     [FMOD_PORT_INDEX!]
			channelgroup                  [FMOD_CHANNELGROUP!]
			passThru                      [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_DetachChannelGroupFromPort: "FMOD_System_DetachChannelGroupFromPort"[
		;(FMOD_SYSTEM *system, FMOD_CHANNELGROUP *channelgroup)
			system                        [FMOD_SYSTEM!]
			channelgroup                  [FMOD_CHANNELGROUP!]
			return:                       [FMOD_RESULT!]
		]


		;--  Reverb API.

		FMOD_System_SetReverbProperties: "FMOD_System_SetReverbProperties"[
		;(FMOD_SYSTEM *system, int instance, const FMOD_REVERB_PROPERTIES *prop)
			system                        [FMOD_SYSTEM!]
			instance                      [integer!]
			prop                          [handle!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetReverbProperties: "FMOD_System_GetReverbProperties"[
		;(FMOD_SYSTEM *system, int instance, FMOD_REVERB_PROPERTIES *prop)
			system                        [FMOD_SYSTEM!]
			instance                      [integer!]
			prop                          [FMOD_REVERB_PROPERTIES!]
			return:                       [FMOD_RESULT!]
		]


		;--  System level DSP functionality.

		FMOD_System_LockDSP: "FMOD_System_LockDSP"[
		;(FMOD_SYSTEM *system)
			system                        [FMOD_SYSTEM!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_UnlockDSP: "FMOD_System_UnlockDSP"[
		;(FMOD_SYSTEM *system)
			system                        [FMOD_SYSTEM!]
			return:                       [FMOD_RESULT!]
		]


		;--  Recording API.

		FMOD_System_GetRecordNumDrivers: "FMOD_System_GetRecordNumDrivers"[
		;(FMOD_SYSTEM *system, int *numdrivers, int *numconnected)
			system                        [FMOD_SYSTEM!]
			numdrivers                    [int-ptr!]
			numconnected                  [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetRecordDriverInfo: "FMOD_System_GetRecordDriverInfo"[
		;(FMOD_SYSTEM *system, int id, char *name, int namelen, FMOD_GUID *guid, int *systemrate, FMOD_SPEAKERMODE *speakermode, int *speakermodechannels, FMOD_DRIVER_STATE *state)
			system                        [FMOD_SYSTEM!]
			id                            [integer!]
			name                          [c-string!]
			namelen                       [integer!]
			guid                          [FMOD_GUID!]
			systemrate                    [int-ptr!]
			speakermode                   [int-ptr!]
			speakermodechannels           [int-ptr!]
			state                         [pointer! [FMOD_DRIVER_STATE!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetRecordPosition: "FMOD_System_GetRecordPosition"[
		;(FMOD_SYSTEM *system, int id, unsigned int *position)
			system                        [FMOD_SYSTEM!]
			id                            [integer!]
			position                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_RecordStart: "FMOD_System_RecordStart"[
		;(FMOD_SYSTEM *system, int id, FMOD_SOUND *sound, FMOD_BOOL loop)
			system                        [FMOD_SYSTEM!]
			id                            [integer!]
			sound                         [FMOD_SOUND!]
			loop                          [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_RecordStop: "FMOD_System_RecordStop"[
		;(FMOD_SYSTEM *system, int id)
			system                        [FMOD_SYSTEM!]
			id                            [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_IsRecording: "FMOD_System_IsRecording"[
		;(FMOD_SYSTEM *system, int id, FMOD_BOOL *recording)
			system                        [FMOD_SYSTEM!]
			id                            [integer!]
			recording                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Geometry API.

		FMOD_System_CreateGeometry: "FMOD_System_CreateGeometry"[
		;(FMOD_SYSTEM *system, int maxpolygons, int maxvertices, FMOD_GEOMETRY **geometry)
			system                        [FMOD_SYSTEM!]
			maxpolygons                   [integer!]
			maxvertices                   [integer!]
			geometry                      [pointer! [FMOD_GEOMETRY!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetGeometrySettings: "FMOD_System_SetGeometrySettings"[
		;(FMOD_SYSTEM *system, float maxworldsize)
			system                        [FMOD_SYSTEM!]
			maxworldsize                  [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetGeometrySettings: "FMOD_System_GetGeometrySettings"[
		;(FMOD_SYSTEM *system, float *maxworldsize)
			system                        [FMOD_SYSTEM!]
			maxworldsize                  [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_LoadGeometry: "FMOD_System_LoadGeometry"[
		;(FMOD_SYSTEM *system, const void *data, int datasize, FMOD_GEOMETRY **geometry)
			system                        [FMOD_SYSTEM!]
			data                          [byte-ptr!]
			datasize                      [integer!]
			geometry                      [pointer! [FMOD_GEOMETRY!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetGeometryOcclusion: "FMOD_System_GetGeometryOcclusion"[
		;(FMOD_SYSTEM *system, const FMOD_VECTOR *listener, const FMOD_VECTOR *source, float *direct, float *reverb)
			system                        [FMOD_SYSTEM!]
			listener                      [FMOD_VECTOR!]
			source                        [FMOD_VECTOR!]
			direct                        [pointer! [float32!]]
			reverb                        [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]


		;--  Network functions.

		FMOD_System_SetNetworkProxy: "FMOD_System_SetNetworkProxy"[
		;(FMOD_SYSTEM *system, const char *proxy)
			system                        [FMOD_SYSTEM!]
			proxy                         [c-string!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetNetworkProxy: "FMOD_System_GetNetworkProxy"[
		;(FMOD_SYSTEM *system, char *proxy, int proxylen)
			system                        [FMOD_SYSTEM!]
			proxy                         [c-string!]
			proxylen                      [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_SetNetworkTimeout: "FMOD_System_SetNetworkTimeout"[
		;(FMOD_SYSTEM *system, int timeout)
			system                        [FMOD_SYSTEM!]
			timeout                       [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetNetworkTimeout: "FMOD_System_GetNetworkTimeout"[
		;(FMOD_SYSTEM *system, int *timeout)
			system                        [FMOD_SYSTEM!]
			timeout                       [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Userdata set/get.

		FMOD_System_SetUserData: "FMOD_System_SetUserData"[
		;(FMOD_SYSTEM *system, void *userdata)
			system                        [FMOD_SYSTEM!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_System_GetUserData: "FMOD_System_GetUserData"[
		;(FMOD_SYSTEM *system, void **userdata)
			system                        [FMOD_SYSTEM!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;-- 'Sound' API

		FMOD_Sound_Release: "FMOD_Sound_Release"[
		;(FMOD_SOUND *sound)
			sound                         [FMOD_SOUND!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetSystemObject: "FMOD_Sound_GetSystemObject"[
		;(FMOD_SOUND *sound, FMOD_SYSTEM **system)
			sound                         [FMOD_SOUND!]
			system                        [pointer! [FMOD_SYSTEM!]]
			return:                       [FMOD_RESULT!]
		]


		;--  Standard sound manipulation functions.

		FMOD_Sound_Lock: "FMOD_Sound_Lock"[
		;(FMOD_SOUND *sound, unsigned int offset, unsigned int length, void **ptr1, void **ptr2, unsigned int *len1, unsigned int *len2)
			sound                         [FMOD_SOUND!]
			offset                        [integer!]
			length                        [integer!]
			ptr1                          [byte-ptr!]
			ptr2                          [byte-ptr!]
			len1                          [int-ptr!]
			len2                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_Unlock: "FMOD_Sound_Unlock"[
		;(FMOD_SOUND *sound, void *ptr1, void *ptr2, unsigned int len1, unsigned int len2)
			sound                         [FMOD_SOUND!]
			ptr1                          [byte-ptr!]
			ptr2                          [byte-ptr!]
			len1                          [integer!]
			len2                          [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_SetDefaults: "FMOD_Sound_SetDefaults"[
		;(FMOD_SOUND *sound, float frequency, int priority)
			sound                         [FMOD_SOUND!]
			frequency                     [float32!]
			priority                      [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetDefaults: "FMOD_Sound_GetDefaults"[
		;(FMOD_SOUND *sound, float *frequency, int *priority)
			sound                         [FMOD_SOUND!]
			frequency                     [pointer! [float32!]]
			priority                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_Set3DMinMaxDistance: "FMOD_Sound_Set3DMinMaxDistance"[
		;(FMOD_SOUND *sound, float min, float max)
			sound                         [FMOD_SOUND!]
			min                           [float32!]
			max                           [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_Get3DMinMaxDistance: "FMOD_Sound_Get3DMinMaxDistance"[
		;(FMOD_SOUND *sound, float *min, float *max)
			sound                         [FMOD_SOUND!]
			min                           [pointer! [float32!]]
			max                           [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_Set3DConeSettings: "FMOD_Sound_Set3DConeSettings"[
		;(FMOD_SOUND *sound, float insideconeangle, float outsideconeangle, float outsidevolume)
			sound                         [FMOD_SOUND!]
			insideconeangle               [float32!]
			outsideconeangle              [float32!]
			outsidevolume                 [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_Get3DConeSettings: "FMOD_Sound_Get3DConeSettings"[
		;(FMOD_SOUND *sound, float *insideconeangle, float *outsideconeangle, float *outsidevolume)
			sound                         [FMOD_SOUND!]
			insideconeangle               [pointer! [float32!]]
			outsideconeangle              [pointer! [float32!]]
			outsidevolume                 [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_Set3DCustomRolloff: "FMOD_Sound_Set3DCustomRolloff"[
		;(FMOD_SOUND *sound, FMOD_VECTOR *points, int numpoints)
			sound                         [FMOD_SOUND!]
			points                        [FMOD_VECTOR!]
			numpoints                     [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_Get3DCustomRolloff: "FMOD_Sound_Get3DCustomRolloff"[
		;(FMOD_SOUND *sound, FMOD_VECTOR **points, int *numpoints)
			sound                         [FMOD_SOUND!]
			points                        [byte-ptr!]
			numpoints                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetSubSound: "FMOD_Sound_GetSubSound"[
		;(FMOD_SOUND *sound, int index, FMOD_SOUND **subsound)
			sound                         [FMOD_SOUND!]
			index                         [integer!]
			subsound                      [pointer! [FMOD_SOUND!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetSubSoundParent: "FMOD_Sound_GetSubSoundParent"[
		;(FMOD_SOUND *sound, FMOD_SOUND **parentsound)
			sound                         [FMOD_SOUND!]
			parentsound                   [pointer! [FMOD_SOUND!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetName: "FMOD_Sound_GetName"[
		;(FMOD_SOUND *sound, char *name, int namelen)
			sound                         [FMOD_SOUND!]
			name                          [c-string!]
			namelen                       [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetLength: "FMOD_Sound_GetLength"[
		;(FMOD_SOUND *sound, unsigned int *length, FMOD_TIMEUNIT lengthtype)
			sound                         [FMOD_SOUND!]
			length                        [int-ptr!]
			lengthtype                    [FMOD_TIMEUNIT!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetFormat: "FMOD_Sound_GetFormat"[
		;(FMOD_SOUND *sound, FMOD_SOUND_TYPE *type, FMOD_SOUND_FORMAT *format, int *channels, int *bits)
			sound                         [FMOD_SOUND!]
			type                          [FMOD_SOUND_TYPE!]
			format                        [FMOD_SOUND_FORMAT!]
			channels                      [int-ptr!]
			bits                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetNumSubSounds: "FMOD_Sound_GetNumSubSounds"[
		;(FMOD_SOUND *sound, int *numsubsounds)
			sound                         [FMOD_SOUND!]
			numsubsounds                  [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetNumTags: "FMOD_Sound_GetNumTags"[
		;(FMOD_SOUND *sound, int *numtags, int *numtagsupdated)
			sound                         [FMOD_SOUND!]
			numtags                       [int-ptr!]
			numtagsupdated                [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetTag: "FMOD_Sound_GetTag"[
		;(FMOD_SOUND *sound, const char *name, int index, FMOD_TAG *tag)
			sound                         [FMOD_SOUND!]
			name                          [c-string!]
			index                         [integer!]
			tag                           [FMOD_TAG!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetOpenState: "FMOD_Sound_GetOpenState"[
		;(FMOD_SOUND *sound, FMOD_OPENSTATE *openstate, unsigned int *percentbuffered, FMOD_BOOL *starving, FMOD_BOOL *diskbusy)
			sound                         [FMOD_SOUND!]
			openstate                     [int-ptr!]
			percentbuffered               [int-ptr!]
			starving                      [int-ptr!]
			diskbusy                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_ReadData: "FMOD_Sound_ReadData"[
		;(FMOD_SOUND *sound, void *buffer, unsigned int length, unsigned int *read)
			sound                         [FMOD_SOUND!]
			buffer                        [byte-ptr!]
			length                        [integer!]
			read                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_SeekData: "FMOD_Sound_SeekData"[
		;(FMOD_SOUND *sound, unsigned int pcm)
			sound                         [FMOD_SOUND!]
			pcm                           [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_SetSoundGroup: "FMOD_Sound_SetSoundGroup"[
		;(FMOD_SOUND *sound, FMOD_SOUNDGROUP *soundgroup)
			sound                         [FMOD_SOUND!]
			soundgroup                    [FMOD_SOUNDGROUP!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetSoundGroup: "FMOD_Sound_GetSoundGroup"[
		;(FMOD_SOUND *sound, FMOD_SOUNDGROUP **soundgroup)
			sound                         [FMOD_SOUND!]
			soundgroup                    [pointer! [FMOD_SOUNDGROUP!]]
			return:                       [FMOD_RESULT!]
		]


		;--  Synchronization point API.  These points can come from markers embedded in wav files, and can also generate channel callbacks.

		FMOD_Sound_GetNumSyncPoints: "FMOD_Sound_GetNumSyncPoints"[
		;(FMOD_SOUND *sound, int *numsyncpoints)
			sound                         [FMOD_SOUND!]
			numsyncpoints                 [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetSyncPoint: "FMOD_Sound_GetSyncPoint"[
		;(FMOD_SOUND *sound, int index, FMOD_SYNCPOINT **point)
			sound                         [FMOD_SOUND!]
			index                         [integer!]
			point                         [pointer! [FMOD_SYNCPOINT!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetSyncPointInfo: "FMOD_Sound_GetSyncPointInfo"[
		;(FMOD_SOUND *sound, FMOD_SYNCPOINT *point, char *name, int namelen, unsigned int *offset, FMOD_TIMEUNIT offsettype)
			sound                         [FMOD_SOUND!]
			point                         [FMOD_SYNCPOINT!]
			name                          [c-string!]
			namelen                       [integer!]
			offset                        [int-ptr!]
			offsettype                    [FMOD_TIMEUNIT!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_AddSyncPoint: "FMOD_Sound_AddSyncPoint"[
		;(FMOD_SOUND *sound, unsigned int offset, FMOD_TIMEUNIT offsettype, const char *name, FMOD_SYNCPOINT **point)
			sound                         [FMOD_SOUND!]
			offset                        [integer!]
			offsettype                    [FMOD_TIMEUNIT!]
			name                          [c-string!]
			point                         [pointer! [FMOD_SYNCPOINT!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_DeleteSyncPoint: "FMOD_Sound_DeleteSyncPoint"[
		;(FMOD_SOUND *sound, FMOD_SYNCPOINT *point)
			sound                         [FMOD_SOUND!]
			point                         [FMOD_SYNCPOINT!]
			return:                       [FMOD_RESULT!]
		]


		;--  Functions also in Channel class but here they are the 'default' to save having to change it in Channel all the time.

		FMOD_Sound_SetMode: "FMOD_Sound_SetMode"[
		;(FMOD_SOUND *sound, FMOD_MODE mode)
			sound                         [FMOD_SOUND!]
			mode                          [FMOD_MODE!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetMode: "FMOD_Sound_GetMode"[
		;(FMOD_SOUND *sound, FMOD_MODE *mode)
			sound                         [FMOD_SOUND!]
			mode                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_SetLoopCount: "FMOD_Sound_SetLoopCount"[
		;(FMOD_SOUND *sound, int loopcount)
			sound                         [FMOD_SOUND!]
			loopcount                     [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetLoopCount: "FMOD_Sound_GetLoopCount"[
		;(FMOD_SOUND *sound, int *loopcount)
			sound                         [FMOD_SOUND!]
			loopcount                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_SetLoopPoints: "FMOD_Sound_SetLoopPoints"[
		;(FMOD_SOUND *sound, unsigned int loopstart, FMOD_TIMEUNIT loopstarttype, unsigned int loopend, FMOD_TIMEUNIT loopendtype)
			sound                         [FMOD_SOUND!]
			loopstart                     [integer!]
			loopstarttype                 [FMOD_TIMEUNIT!]
			loopend                       [integer!]
			loopendtype                   [FMOD_TIMEUNIT!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetLoopPoints: "FMOD_Sound_GetLoopPoints"[
		;(FMOD_SOUND *sound, unsigned int *loopstart, FMOD_TIMEUNIT loopstarttype, unsigned int *loopend, FMOD_TIMEUNIT loopendtype)
			sound                         [FMOD_SOUND!]
			loopstart                     [int-ptr!]
			loopstarttype                 [FMOD_TIMEUNIT!]
			loopend                       [int-ptr!]
			loopendtype                   [FMOD_TIMEUNIT!]
			return:                       [FMOD_RESULT!]
		]


		;--  For MOD/S3M/XM/IT/MID sequenced formats only.

		FMOD_Sound_GetMusicNumChannels: "FMOD_Sound_GetMusicNumChannels"[
		;(FMOD_SOUND *sound, int *numchannels)
			sound                         [FMOD_SOUND!]
			numchannels                   [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_SetMusicChannelVolume: "FMOD_Sound_SetMusicChannelVolume"[
		;(FMOD_SOUND *sound, int channel, float volume)
			sound                         [FMOD_SOUND!]
			channel                       [integer!]
			volume                        [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetMusicChannelVolume: "FMOD_Sound_GetMusicChannelVolume"[
		;(FMOD_SOUND *sound, int channel, float *volume)
			sound                         [FMOD_SOUND!]
			channel                       [integer!]
			volume                        [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_SetMusicSpeed: "FMOD_Sound_SetMusicSpeed"[
		;(FMOD_SOUND *sound, float speed)
			sound                         [FMOD_SOUND!]
			speed                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetMusicSpeed: "FMOD_Sound_GetMusicSpeed"[
		;(FMOD_SOUND *sound, float *speed)
			sound                         [FMOD_SOUND!]
			speed                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]


		;--  Userdata set/get.

		FMOD_Sound_SetUserData: "FMOD_Sound_SetUserData"[
		;(FMOD_SOUND *sound, void *userdata)
			sound                         [FMOD_SOUND!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Sound_GetUserData: "FMOD_Sound_GetUserData"[
		;(FMOD_SOUND *sound, void **userdata)
			sound                         [FMOD_SOUND!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;-- 'Channel' API

		FMOD_Channel_GetSystemObject: "FMOD_Channel_GetSystemObject"[
		;(FMOD_CHANNEL *channel, FMOD_SYSTEM **system)
			channel                       [handle!]
			system                        [pointer! [FMOD_SYSTEM!]]
			return:                       [FMOD_RESULT!]
		]


		;--  General control functionality for Channels and ChannelGroups.

		FMOD_Channel_Stop: "FMOD_Channel_Stop"[
		;(FMOD_CHANNEL *channel)
			channel                       [handle!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetPaused: "FMOD_Channel_SetPaused"[
		;(FMOD_CHANNEL *channel, FMOD_BOOL paused)
			channel                       [handle!]
			paused                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetPaused: "FMOD_Channel_GetPaused"[
		;(FMOD_CHANNEL *channel, FMOD_BOOL *paused)
			channel                       [handle!]
			paused                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetVolume: "FMOD_Channel_SetVolume"[
		;(FMOD_CHANNEL *channel, float volume)
			channel                       [handle!]
			volume                        [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetVolume: "FMOD_Channel_GetVolume"[
		;(FMOD_CHANNEL *channel, float *volume)
			channel                       [handle!]
			volume                        [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetVolumeRamp: "FMOD_Channel_SetVolumeRamp"[
		;(FMOD_CHANNEL *channel, FMOD_BOOL ramp)
			channel                       [handle!]
			ramp                          [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetVolumeRamp: "FMOD_Channel_GetVolumeRamp"[
		;(FMOD_CHANNEL *channel, FMOD_BOOL *ramp)
			channel                       [handle!]
			ramp                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetAudibility: "FMOD_Channel_GetAudibility"[
		;(FMOD_CHANNEL *channel, float *audibility)
			channel                       [handle!]
			audibility                    [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetPitch: "FMOD_Channel_SetPitch"[
		;(FMOD_CHANNEL *channel, float pitch)
			channel                       [handle!]
			pitch                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetPitch: "FMOD_Channel_GetPitch"[
		;(FMOD_CHANNEL *channel, float *pitch)
			channel                       [handle!]
			pitch                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetMute: "FMOD_Channel_SetMute"[
		;(FMOD_CHANNEL *channel, FMOD_BOOL mute)
			channel                       [handle!]
			mute                          [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetMute: "FMOD_Channel_GetMute"[
		;(FMOD_CHANNEL *channel, FMOD_BOOL *mute)
			channel                       [handle!]
			mute                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetReverbProperties: "FMOD_Channel_SetReverbProperties"[
		;(FMOD_CHANNEL *channel, int instance, float wet)
			channel                       [handle!]
			instance                      [integer!]
			wet                           [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetReverbProperties: "FMOD_Channel_GetReverbProperties"[
		;(FMOD_CHANNEL *channel, int instance, float *wet)
			channel                       [handle!]
			instance                      [integer!]
			wet                           [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetLowPassGain: "FMOD_Channel_SetLowPassGain"[
		;(FMOD_CHANNEL *channel, float gain)
			channel                       [handle!]
			gain                          [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetLowPassGain: "FMOD_Channel_GetLowPassGain"[
		;(FMOD_CHANNEL *channel, float *gain)
			channel                       [handle!]
			gain                          [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetMode: "FMOD_Channel_SetMode"[
		;(FMOD_CHANNEL *channel, FMOD_MODE mode)
			channel                       [handle!]
			mode                          [FMOD_MODE!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetMode: "FMOD_Channel_GetMode"[
		;(FMOD_CHANNEL *channel, FMOD_MODE *mode)
			channel                       [handle!]
			mode                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetCallback: "FMOD_Channel_SetCallback"[
		;(FMOD_CHANNEL *channel, FMOD_CHANNELCONTROL_CALLBACK callback)
			channel                       [handle!]
			callback                      [FMOD_CHANNELCONTROL_CALLBACK!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_IsPlaying: "FMOD_Channel_IsPlaying"[
		;(FMOD_CHANNEL *channel, FMOD_BOOL *isplaying)
			channel                       [handle!]
			isplaying                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Note all 'set' functions alter a final matrix, this is why the only get function is getMixMatrix, to avoid other get functions returning incorrect/obsolete values.

		FMOD_Channel_SetPan: "FMOD_Channel_SetPan"[
		;(FMOD_CHANNEL *channel, float pan)
			channel                       [handle!]
			pan                           [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetMixLevelsOutput: "FMOD_Channel_SetMixLevelsOutput"[
		;(FMOD_CHANNEL *channel, float frontleft, float frontright, float center, float lfe, float surroundleft, float surroundright, float backleft, float backright)
			channel                       [handle!]
			frontleft                     [float32!]
			frontright                    [float32!]
			center                        [float32!]
			lfe                           [float32!]
			surroundleft                  [float32!]
			surroundright                 [float32!]
			backleft                      [float32!]
			backright                     [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetMixLevelsInput: "FMOD_Channel_SetMixLevelsInput"[
		;(FMOD_CHANNEL *channel, float *levels, int numlevels)
			channel                       [handle!]
			levels                        [pointer! [float32!]]
			numlevels                     [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetMixMatrix: "FMOD_Channel_SetMixMatrix"[
		;(FMOD_CHANNEL *channel, float *matrix, int outchannels, int inchannels, int inchannel_hop)
			channel                       [handle!]
			matrix                        [pointer! [float32!]]
			outchannels                   [integer!]
			inchannels                    [integer!]
			inchannel_hop                 [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetMixMatrix: "FMOD_Channel_GetMixMatrix"[
		;(FMOD_CHANNEL *channel, float *matrix, int *outchannels, int *inchannels, int inchannel_hop)
			channel                       [handle!]
			matrix                        [pointer! [float32!]]
			outchannels                   [int-ptr!]
			inchannels                    [int-ptr!]
			inchannel_hop                 [integer!]
			return:                       [FMOD_RESULT!]
		]


		;--  Clock based functionality.

		FMOD_Channel_GetDSPClock: "FMOD_Channel_GetDSPClock"[
		;(FMOD_CHANNEL *channel, unsigned long long *dspclock, unsigned long long *parentclock)
			channel                       [handle!]
			dspclock                      [long-long-ptr!]
			parentclock                   [long-long-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetDelay: "FMOD_Channel_SetDelay"[
		;(FMOD_CHANNEL *channel, unsigned long long dspclock_start, unsigned long long dspclock_end, FMOD_BOOL stopchannels)
			channel                       [handle!]
			dspclock_start                [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			dspclock_end                  [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			stopchannels                  [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetDelay: "FMOD_Channel_GetDelay"[
		;(FMOD_CHANNEL *channel, unsigned long long *dspclock_start, unsigned long long *dspclock_end, FMOD_BOOL *stopchannels)
			channel                       [handle!]
			dspclock_start                [long-long-ptr!]
			dspclock_end                  [long-long-ptr!]
			stopchannels                  [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_AddFadePoint: "FMOD_Channel_AddFadePoint"[
		;(FMOD_CHANNEL *channel, unsigned long long dspclock, float volume)
			channel                       [handle!]
			dspclock                      [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			volume                        [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetFadePointRamp: "FMOD_Channel_SetFadePointRamp"[
		;(FMOD_CHANNEL *channel, unsigned long long dspclock, float volume)
			channel                       [handle!]
			dspclock                      [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			volume                        [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_RemoveFadePoints: "FMOD_Channel_RemoveFadePoints"[
		;(FMOD_CHANNEL *channel, unsigned long long dspclock_start, unsigned long long dspclock_end)
			channel                       [handle!]
			dspclock_start                [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			dspclock_end                  [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetFadePoints: "FMOD_Channel_GetFadePoints"[
		;(FMOD_CHANNEL *channel, unsigned int *numpoints, unsigned long long *point_dspclock, float *point_volume)
			channel                       [handle!]
			numpoints                     [int-ptr!]
			point_dspclock                [long-long-ptr!]
			point_volume                  [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]


		;--  DSP effects.

		FMOD_Channel_GetDSP: "FMOD_Channel_GetDSP"[
		;(FMOD_CHANNEL *channel, int index, FMOD_DSP **dsp)
			channel                       [handle!]
			index                         [integer!]
			dsp                           [pointer! [FMOD_DSP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_AddDSP: "FMOD_Channel_AddDSP"[
		;(FMOD_CHANNEL *channel, int index, FMOD_DSP *dsp)
			channel                       [handle!]
			index                         [integer!]
			dsp                           [FMOD_DSP!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_RemoveDSP: "FMOD_Channel_RemoveDSP"[
		;(FMOD_CHANNEL *channel, FMOD_DSP *dsp)
			channel                       [handle!]
			dsp                           [FMOD_DSP!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetNumDSPs: "FMOD_Channel_GetNumDSPs"[
		;(FMOD_CHANNEL *channel, int *numdsps)
			channel                       [handle!]
			numdsps                       [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetDSPIndex: "FMOD_Channel_SetDSPIndex"[
		;(FMOD_CHANNEL *channel, FMOD_DSP *dsp, int index)
			channel                       [handle!]
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetDSPIndex: "FMOD_Channel_GetDSPIndex"[
		;(FMOD_CHANNEL *channel, FMOD_DSP *dsp, int *index)
			channel                       [handle!]
			dsp                           [FMOD_DSP!]
			index                         [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  3D functionality.

		FMOD_Channel_Set3DAttributes: "FMOD_Channel_Set3DAttributes"[
		;(FMOD_CHANNEL *channel, const FMOD_VECTOR *pos, const FMOD_VECTOR *vel, const FMOD_VECTOR *alt_pan_pos)
			channel                       [handle!]
			pos                           [FMOD_VECTOR!]
			vel                           [FMOD_VECTOR!]
			alt_pan_pos                   [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Get3DAttributes: "FMOD_Channel_Get3DAttributes"[
		;(FMOD_CHANNEL *channel, FMOD_VECTOR *pos, FMOD_VECTOR *vel, FMOD_VECTOR *alt_pan_pos)
			channel                       [handle!]
			pos                           [FMOD_VECTOR!]
			vel                           [FMOD_VECTOR!]
			alt_pan_pos                   [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Set3DMinMaxDistance: "FMOD_Channel_Set3DMinMaxDistance"[
		;(FMOD_CHANNEL *channel, float mindistance, float maxdistance)
			channel                       [handle!]
			mindistance                   [float32!]
			maxdistance                   [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Get3DMinMaxDistance: "FMOD_Channel_Get3DMinMaxDistance"[
		;(FMOD_CHANNEL *channel, float *mindistance, float *maxdistance)
			channel                       [handle!]
			mindistance                   [pointer! [float32!]]
			maxdistance                   [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Set3DConeSettings: "FMOD_Channel_Set3DConeSettings"[
		;(FMOD_CHANNEL *channel, float insideconeangle, float outsideconeangle, float outsidevolume)
			channel                       [handle!]
			insideconeangle               [float32!]
			outsideconeangle              [float32!]
			outsidevolume                 [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Get3DConeSettings: "FMOD_Channel_Get3DConeSettings"[
		;(FMOD_CHANNEL *channel, float *insideconeangle, float *outsideconeangle, float *outsidevolume)
			channel                       [handle!]
			insideconeangle               [pointer! [float32!]]
			outsideconeangle              [pointer! [float32!]]
			outsidevolume                 [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Set3DConeOrientation: "FMOD_Channel_Set3DConeOrientation"[
		;(FMOD_CHANNEL *channel, FMOD_VECTOR *orientation)
			channel                       [handle!]
			orientation                   [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Get3DConeOrientation: "FMOD_Channel_Get3DConeOrientation"[
		;(FMOD_CHANNEL *channel, FMOD_VECTOR *orientation)
			channel                       [handle!]
			orientation                   [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Set3DCustomRolloff: "FMOD_Channel_Set3DCustomRolloff"[
		;(FMOD_CHANNEL *channel, FMOD_VECTOR *points, int numpoints)
			channel                       [handle!]
			points                        [FMOD_VECTOR!]
			numpoints                     [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Get3DCustomRolloff: "FMOD_Channel_Get3DCustomRolloff"[
		;(FMOD_CHANNEL *channel, FMOD_VECTOR **points, int *numpoints)
			channel                       [handle!]
			points                        [byte-ptr!]
			numpoints                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Set3DOcclusion: "FMOD_Channel_Set3DOcclusion"[
		;(FMOD_CHANNEL *channel, float directocclusion, float reverbocclusion)
			channel                       [handle!]
			directocclusion               [float32!]
			reverbocclusion               [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Get3DOcclusion: "FMOD_Channel_Get3DOcclusion"[
		;(FMOD_CHANNEL *channel, float *directocclusion, float *reverbocclusion)
			channel                       [handle!]
			directocclusion               [pointer! [float32!]]
			reverbocclusion               [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Set3DSpread: "FMOD_Channel_Set3DSpread"[
		;(FMOD_CHANNEL *channel, float angle)
			channel                       [handle!]
			angle                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Get3DSpread: "FMOD_Channel_Get3DSpread"[
		;(FMOD_CHANNEL *channel, float *angle)
			channel                       [handle!]
			angle                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Set3DLevel: "FMOD_Channel_Set3DLevel"[
		;(FMOD_CHANNEL *channel, float level)
			channel                       [handle!]
			level                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Get3DLevel: "FMOD_Channel_Get3DLevel"[
		;(FMOD_CHANNEL *channel, float *level)
			channel                       [handle!]
			level                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Set3DDopplerLevel: "FMOD_Channel_Set3DDopplerLevel"[
		;(FMOD_CHANNEL *channel, float level)
			channel                       [handle!]
			level                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Get3DDopplerLevel: "FMOD_Channel_Get3DDopplerLevel"[
		;(FMOD_CHANNEL *channel, float *level)
			channel                       [handle!]
			level                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Set3DDistanceFilter: "FMOD_Channel_Set3DDistanceFilter"[
		;(FMOD_CHANNEL *channel, FMOD_BOOL custom, float customLevel, float centerFreq)
			channel                       [handle!]
			custom                        [integer!]
			customLevel                   [float32!]
			centerFreq                    [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_Get3DDistanceFilter: "FMOD_Channel_Get3DDistanceFilter"[
		;(FMOD_CHANNEL *channel, FMOD_BOOL *custom, float *customLevel, float *centerFreq)
			channel                       [handle!]
			custom                        [int-ptr!]
			customLevel                   [pointer! [float32!]]
			centerFreq                    [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]


		;--  Userdata set/get.

		FMOD_Channel_SetUserData: "FMOD_Channel_SetUserData"[
		;(FMOD_CHANNEL *channel, void *userdata)
			channel                       [handle!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetUserData: "FMOD_Channel_GetUserData"[
		;(FMOD_CHANNEL *channel, void **userdata)
			channel                       [handle!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Channel specific control functionality.

		FMOD_Channel_SetFrequency: "FMOD_Channel_SetFrequency"[
		;(FMOD_CHANNEL *channel, float frequency)
			channel                       [handle!]
			frequency                     [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetFrequency: "FMOD_Channel_GetFrequency"[
		;(FMOD_CHANNEL *channel, float *frequency)
			channel                       [handle!]
			frequency                     [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetPriority: "FMOD_Channel_SetPriority"[
		;(FMOD_CHANNEL *channel, int priority)
			channel                       [handle!]
			priority                      [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetPriority: "FMOD_Channel_GetPriority"[
		;(FMOD_CHANNEL *channel, int *priority)
			channel                       [handle!]
			priority                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetPosition: "FMOD_Channel_SetPosition"[
		;(FMOD_CHANNEL *channel, unsigned int position, FMOD_TIMEUNIT postype)
			channel                       [handle!]
			position                      [integer!]
			postype                       [FMOD_TIMEUNIT!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetPosition: "FMOD_Channel_GetPosition"[
		;(FMOD_CHANNEL *channel, unsigned int *position, FMOD_TIMEUNIT postype)
			channel                       [handle!]
			position                      [int-ptr!]
			postype                       [FMOD_TIMEUNIT!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetChannelGroup: "FMOD_Channel_SetChannelGroup"[
		;(FMOD_CHANNEL *channel, FMOD_CHANNELGROUP *channelgroup)
			channel                       [handle!]
			channelgroup                  [FMOD_CHANNELGROUP!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetChannelGroup: "FMOD_Channel_GetChannelGroup"[
		;(FMOD_CHANNEL *channel, FMOD_CHANNELGROUP **channelgroup)
			channel                       [handle!]
			channelgroup                  [pointer! [FMOD_CHANNELGROUP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetLoopCount: "FMOD_Channel_SetLoopCount"[
		;(FMOD_CHANNEL *channel, int loopcount)
			channel                       [handle!]
			loopcount                     [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetLoopCount: "FMOD_Channel_GetLoopCount"[
		;(FMOD_CHANNEL *channel, int *loopcount)
			channel                       [handle!]
			loopcount                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_SetLoopPoints: "FMOD_Channel_SetLoopPoints"[
		;(FMOD_CHANNEL *channel, unsigned int loopstart, FMOD_TIMEUNIT loopstarttype, unsigned int loopend, FMOD_TIMEUNIT loopendtype)
			channel                       [handle!]
			loopstart                     [integer!]
			loopstarttype                 [FMOD_TIMEUNIT!]
			loopend                       [integer!]
			loopendtype                   [FMOD_TIMEUNIT!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetLoopPoints: "FMOD_Channel_GetLoopPoints"[
		;(FMOD_CHANNEL *channel, unsigned int *loopstart, FMOD_TIMEUNIT loopstarttype, unsigned int *loopend, FMOD_TIMEUNIT loopendtype)
			channel                       [handle!]
			loopstart                     [int-ptr!]
			loopstarttype                 [FMOD_TIMEUNIT!]
			loopend                       [int-ptr!]
			loopendtype                   [FMOD_TIMEUNIT!]
			return:                       [FMOD_RESULT!]
		]


		;--  Information only functions.

		FMOD_Channel_IsVirtual: "FMOD_Channel_IsVirtual"[
		;(FMOD_CHANNEL *channel, FMOD_BOOL *isvirtual)
			channel                       [handle!]
			isvirtual                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetCurrentSound: "FMOD_Channel_GetCurrentSound"[
		;(FMOD_CHANNEL *channel, FMOD_SOUND **sound)
			channel                       [handle!]
			sound                         [pointer! [FMOD_SOUND!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Channel_GetIndex: "FMOD_Channel_GetIndex"[
		;(FMOD_CHANNEL *channel, int *index)
			channel                       [handle!]
			index                         [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;-- 'ChannelGroup' API

		FMOD_ChannelGroup_GetSystemObject: "FMOD_ChannelGroup_GetSystemObject"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_SYSTEM **system)
			channelgroup                  [FMOD_CHANNELGROUP!]
			system                        [pointer! [FMOD_SYSTEM!]]
			return:                       [FMOD_RESULT!]
		]


		;--  General control functionality for Channels and ChannelGroups.

		FMOD_ChannelGroup_Stop: "FMOD_ChannelGroup_Stop"[
		;(FMOD_CHANNELGROUP *channelgroup)
			channelgroup                  [FMOD_CHANNELGROUP!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetPaused: "FMOD_ChannelGroup_SetPaused"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL paused)
			channelgroup                  [FMOD_CHANNELGROUP!]
			paused                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetPaused: "FMOD_ChannelGroup_GetPaused"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL *paused)
			channelgroup                  [FMOD_CHANNELGROUP!]
			paused                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetVolume: "FMOD_ChannelGroup_SetVolume"[
		;(FMOD_CHANNELGROUP *channelgroup, float volume)
			channelgroup                  [FMOD_CHANNELGROUP!]
			volume                        [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetVolume: "FMOD_ChannelGroup_GetVolume"[
		;(FMOD_CHANNELGROUP *channelgroup, float *volume)
			channelgroup                  [FMOD_CHANNELGROUP!]
			volume                        [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetVolumeRamp: "FMOD_ChannelGroup_SetVolumeRamp"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL ramp)
			channelgroup                  [FMOD_CHANNELGROUP!]
			ramp                          [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetVolumeRamp: "FMOD_ChannelGroup_GetVolumeRamp"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL *ramp)
			channelgroup                  [FMOD_CHANNELGROUP!]
			ramp                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetAudibility: "FMOD_ChannelGroup_GetAudibility"[
		;(FMOD_CHANNELGROUP *channelgroup, float *audibility)
			channelgroup                  [FMOD_CHANNELGROUP!]
			audibility                    [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetPitch: "FMOD_ChannelGroup_SetPitch"[
		;(FMOD_CHANNELGROUP *channelgroup, float pitch)
			channelgroup                  [FMOD_CHANNELGROUP!]
			pitch                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetPitch: "FMOD_ChannelGroup_GetPitch"[
		;(FMOD_CHANNELGROUP *channelgroup, float *pitch)
			channelgroup                  [FMOD_CHANNELGROUP!]
			pitch                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetMute: "FMOD_ChannelGroup_SetMute"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL mute)
			channelgroup                  [FMOD_CHANNELGROUP!]
			mute                          [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetMute: "FMOD_ChannelGroup_GetMute"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL *mute)
			channelgroup                  [FMOD_CHANNELGROUP!]
			mute                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetReverbProperties: "FMOD_ChannelGroup_SetReverbProperties"[
		;(FMOD_CHANNELGROUP *channelgroup, int instance, float wet)
			channelgroup                  [FMOD_CHANNELGROUP!]
			instance                      [integer!]
			wet                           [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetReverbProperties: "FMOD_ChannelGroup_GetReverbProperties"[
		;(FMOD_CHANNELGROUP *channelgroup, int instance, float *wet)
			channelgroup                  [FMOD_CHANNELGROUP!]
			instance                      [integer!]
			wet                           [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetLowPassGain: "FMOD_ChannelGroup_SetLowPassGain"[
		;(FMOD_CHANNELGROUP *channelgroup, float gain)
			channelgroup                  [FMOD_CHANNELGROUP!]
			gain                          [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetLowPassGain: "FMOD_ChannelGroup_GetLowPassGain"[
		;(FMOD_CHANNELGROUP *channelgroup, float *gain)
			channelgroup                  [FMOD_CHANNELGROUP!]
			gain                          [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetMode: "FMOD_ChannelGroup_SetMode"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_MODE mode)
			channelgroup                  [FMOD_CHANNELGROUP!]
			mode                          [FMOD_MODE!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetMode: "FMOD_ChannelGroup_GetMode"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_MODE *mode)
			channelgroup                  [FMOD_CHANNELGROUP!]
			mode                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetCallback: "FMOD_ChannelGroup_SetCallback"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_CHANNELCONTROL_CALLBACK callback)
			channelgroup                  [FMOD_CHANNELGROUP!]
			callback                      [FMOD_CHANNELCONTROL_CALLBACK!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_IsPlaying: "FMOD_ChannelGroup_IsPlaying"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL *isplaying)
			channelgroup                  [FMOD_CHANNELGROUP!]
			isplaying                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Note all 'set' functions alter a final matrix, this is why the only get function is getMixMatrix, to avoid other get functions returning incorrect/obsolete values.

		FMOD_ChannelGroup_SetPan: "FMOD_ChannelGroup_SetPan"[
		;(FMOD_CHANNELGROUP *channelgroup, float pan)
			channelgroup                  [FMOD_CHANNELGROUP!]
			pan                           [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetMixLevelsOutput: "FMOD_ChannelGroup_SetMixLevelsOutput"[
		;(FMOD_CHANNELGROUP *channelgroup, float frontleft, float frontright, float center, float lfe, float surroundleft, float surroundright, float backleft, float backright)
			channelgroup                  [FMOD_CHANNELGROUP!]
			frontleft                     [float32!]
			frontright                    [float32!]
			center                        [float32!]
			lfe                           [float32!]
			surroundleft                  [float32!]
			surroundright                 [float32!]
			backleft                      [float32!]
			backright                     [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetMixLevelsInput: "FMOD_ChannelGroup_SetMixLevelsInput"[
		;(FMOD_CHANNELGROUP *channelgroup, float *levels, int numlevels)
			channelgroup                  [FMOD_CHANNELGROUP!]
			levels                        [pointer! [float32!]]
			numlevels                     [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetMixMatrix: "FMOD_ChannelGroup_SetMixMatrix"[
		;(FMOD_CHANNELGROUP *channelgroup, float *matrix, int outchannels, int inchannels, int inchannel_hop)
			channelgroup                  [FMOD_CHANNELGROUP!]
			matrix                        [pointer! [float32!]]
			outchannels                   [integer!]
			inchannels                    [integer!]
			inchannel_hop                 [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetMixMatrix: "FMOD_ChannelGroup_GetMixMatrix"[
		;(FMOD_CHANNELGROUP *channelgroup, float *matrix, int *outchannels, int *inchannels, int inchannel_hop)
			channelgroup                  [FMOD_CHANNELGROUP!]
			matrix                        [pointer! [float32!]]
			outchannels                   [int-ptr!]
			inchannels                    [int-ptr!]
			inchannel_hop                 [integer!]
			return:                       [FMOD_RESULT!]
		]


		;--  Clock based functionality.

		FMOD_ChannelGroup_GetDSPClock: "FMOD_ChannelGroup_GetDSPClock"[
		;(FMOD_CHANNELGROUP *channelgroup, unsigned long long *dspclock, unsigned long long *parentclock)
			channelgroup                  [FMOD_CHANNELGROUP!]
			dspclock                      [long-long-ptr!]
			parentclock                   [long-long-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetDelay: "FMOD_ChannelGroup_SetDelay"[
		;(FMOD_CHANNELGROUP *channelgroup, unsigned long long dspclock_start, unsigned long long dspclock_end, FMOD_BOOL stopchannels)
			channelgroup                  [FMOD_CHANNELGROUP!]
			dspclock_start                [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			dspclock_end                  [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			stopchannels                  [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetDelay: "FMOD_ChannelGroup_GetDelay"[
		;(FMOD_CHANNELGROUP *channelgroup, unsigned long long *dspclock_start, unsigned long long *dspclock_end, FMOD_BOOL *stopchannels)
			channelgroup                  [FMOD_CHANNELGROUP!]
			dspclock_start                [long-long-ptr!]
			dspclock_end                  [long-long-ptr!]
			stopchannels                  [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_AddFadePoint: "FMOD_ChannelGroup_AddFadePoint"[
		;(FMOD_CHANNELGROUP *channelgroup, unsigned long long dspclock, float volume)
			channelgroup                  [FMOD_CHANNELGROUP!]
			dspclock                      [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			volume                        [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetFadePointRamp: "FMOD_ChannelGroup_SetFadePointRamp"[
		;(FMOD_CHANNELGROUP *channelgroup, unsigned long long dspclock, float volume)
			channelgroup                  [FMOD_CHANNELGROUP!]
			dspclock                      [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			volume                        [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_RemoveFadePoints: "FMOD_ChannelGroup_RemoveFadePoints"[
		;(FMOD_CHANNELGROUP *channelgroup, unsigned long long dspclock_start, unsigned long long dspclock_end)
			channelgroup                  [FMOD_CHANNELGROUP!]
			dspclock_start                [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			dspclock_end                  [long-long!] ;@@ there is no support for `long long` yet in Red/System!
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetFadePoints: "FMOD_ChannelGroup_GetFadePoints"[
		;(FMOD_CHANNELGROUP *channelgroup, unsigned int *numpoints, unsigned long long *point_dspclock, float *point_volume)
			channelgroup                  [FMOD_CHANNELGROUP!]
			numpoints                     [long-long-ptr!]
			point_dspclock                [long-long-ptr!]
			point_volume                  [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]


		;--  DSP effects.

		FMOD_ChannelGroup_GetDSP: "FMOD_ChannelGroup_GetDSP"[
		;(FMOD_CHANNELGROUP *channelgroup, int index, FMOD_DSP **dsp)
			channelgroup                  [FMOD_CHANNELGROUP!]
			index                         [integer!]
			dsp                           [pointer! [FMOD_DSP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_AddDSP: "FMOD_ChannelGroup_AddDSP"[
		;(FMOD_CHANNELGROUP *channelgroup, int index, FMOD_DSP *dsp)
			channelgroup                  [FMOD_CHANNELGROUP!]
			index                         [integer!]
			dsp                           [FMOD_DSP!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_RemoveDSP: "FMOD_ChannelGroup_RemoveDSP"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_DSP *dsp)
			channelgroup                  [FMOD_CHANNELGROUP!]
			dsp                           [FMOD_DSP!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetNumDSPs: "FMOD_ChannelGroup_GetNumDSPs"[
		;(FMOD_CHANNELGROUP *channelgroup, int *numdsps)
			channelgroup                  [FMOD_CHANNELGROUP!]
			numdsps                       [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_SetDSPIndex: "FMOD_ChannelGroup_SetDSPIndex"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_DSP *dsp, int index)
			channelgroup                  [FMOD_CHANNELGROUP!]
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetDSPIndex: "FMOD_ChannelGroup_GetDSPIndex"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_DSP *dsp, int *index)
			channelgroup                  [FMOD_CHANNELGROUP!]
			dsp                           [FMOD_DSP!]
			index                         [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  3D functionality.

		FMOD_ChannelGroup_Set3DAttributes: "FMOD_ChannelGroup_Set3DAttributes"[
		;(FMOD_CHANNELGROUP *channelgroup, const FMOD_VECTOR *pos, const FMOD_VECTOR *vel, const FMOD_VECTOR *alt_pan_pos)
			channelgroup                  [FMOD_CHANNELGROUP!]
			pos                           [FMOD_VECTOR!]
			vel                           [FMOD_VECTOR!]
			alt_pan_pos                   [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Get3DAttributes: "FMOD_ChannelGroup_Get3DAttributes"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_VECTOR *pos, FMOD_VECTOR *vel, FMOD_VECTOR *alt_pan_pos)
			channelgroup                  [FMOD_CHANNELGROUP!]
			pos                           [FMOD_VECTOR!]
			vel                           [FMOD_VECTOR!]
			alt_pan_pos                   [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Set3DMinMaxDistance: "FMOD_ChannelGroup_Set3DMinMaxDistance"[
		;(FMOD_CHANNELGROUP *channelgroup, float mindistance, float maxdistance)
			channelgroup                  [FMOD_CHANNELGROUP!]
			mindistance                   [float32!]
			maxdistance                   [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Get3DMinMaxDistance: "FMOD_ChannelGroup_Get3DMinMaxDistance"[
		;(FMOD_CHANNELGROUP *channelgroup, float *mindistance, float *maxdistance)
			channelgroup                  [FMOD_CHANNELGROUP!]
			mindistance                   [pointer! [float32!]]
			maxdistance                   [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Set3DConeSettings: "FMOD_ChannelGroup_Set3DConeSettings"[
		;(FMOD_CHANNELGROUP *channelgroup, float insideconeangle, float outsideconeangle, float outsidevolume)
			channelgroup                  [FMOD_CHANNELGROUP!]
			insideconeangle               [float32!]
			outsideconeangle              [float32!]
			outsidevolume                 [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Get3DConeSettings: "FMOD_ChannelGroup_Get3DConeSettings"[
		;(FMOD_CHANNELGROUP *channelgroup, float *insideconeangle, float *outsideconeangle, float *outsidevolume)
			channelgroup                  [FMOD_CHANNELGROUP!]
			insideconeangle               [pointer! [float32!]]
			outsideconeangle              [pointer! [float32!]]
			outsidevolume                 [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Set3DConeOrientation: "FMOD_ChannelGroup_Set3DConeOrientation"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_VECTOR *orientation)
			channelgroup                  [FMOD_CHANNELGROUP!]
			orientation                   [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Get3DConeOrientation: "FMOD_ChannelGroup_Get3DConeOrientation"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_VECTOR *orientation)
			channelgroup                  [FMOD_CHANNELGROUP!]
			orientation                   [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Set3DCustomRolloff: "FMOD_ChannelGroup_Set3DCustomRolloff"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_VECTOR *points, int numpoints)
			channelgroup                  [FMOD_CHANNELGROUP!]
			points                        [FMOD_VECTOR!]
			numpoints                     [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Get3DCustomRolloff: "FMOD_ChannelGroup_Get3DCustomRolloff"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_VECTOR **points, int *numpoints)
			channelgroup                  [FMOD_CHANNELGROUP!]
			points                        [byte-ptr!]
			numpoints                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Set3DOcclusion: "FMOD_ChannelGroup_Set3DOcclusion"[
		;(FMOD_CHANNELGROUP *channelgroup, float directocclusion, float reverbocclusion)
			channelgroup                  [FMOD_CHANNELGROUP!]
			directocclusion               [float32!]
			reverbocclusion               [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Get3DOcclusion: "FMOD_ChannelGroup_Get3DOcclusion"[
		;(FMOD_CHANNELGROUP *channelgroup, float *directocclusion, float *reverbocclusion)
			channelgroup                  [FMOD_CHANNELGROUP!]
			directocclusion               [pointer! [float32!]]
			reverbocclusion               [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Set3DSpread: "FMOD_ChannelGroup_Set3DSpread"[
		;(FMOD_CHANNELGROUP *channelgroup, float angle)
			channelgroup                  [FMOD_CHANNELGROUP!]
			angle                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Get3DSpread: "FMOD_ChannelGroup_Get3DSpread"[
		;(FMOD_CHANNELGROUP *channelgroup, float *angle)
			channelgroup                  [FMOD_CHANNELGROUP!]
			angle                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Set3DLevel: "FMOD_ChannelGroup_Set3DLevel"[
		;(FMOD_CHANNELGROUP *channelgroup, float level)
			channelgroup                  [FMOD_CHANNELGROUP!]
			level                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Get3DLevel: "FMOD_ChannelGroup_Get3DLevel"[
		;(FMOD_CHANNELGROUP *channelgroup, float *level)
			channelgroup                  [FMOD_CHANNELGROUP!]
			level                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Set3DDopplerLevel: "FMOD_ChannelGroup_Set3DDopplerLevel"[
		;(FMOD_CHANNELGROUP *channelgroup, float level)
			channelgroup                  [FMOD_CHANNELGROUP!]
			level                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Get3DDopplerLevel: "FMOD_ChannelGroup_Get3DDopplerLevel"[
		;(FMOD_CHANNELGROUP *channelgroup, float *level)
			channelgroup                  [FMOD_CHANNELGROUP!]
			level                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Set3DDistanceFilter: "FMOD_ChannelGroup_Set3DDistanceFilter"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL custom, float customLevel, float centerFreq)
			channelgroup                  [FMOD_CHANNELGROUP!]
			custom                        [integer!]
			customLevel                   [float32!]
			centerFreq                    [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Get3DDistanceFilter: "FMOD_ChannelGroup_Get3DDistanceFilter"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_BOOL *custom, float *customLevel, float *centerFreq)
			channelgroup                  [FMOD_CHANNELGROUP!]
			custom                        [int-ptr!]
			customLevel                   [pointer! [float32!]]
			centerFreq                    [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]


		;--  Userdata set/get.

		FMOD_ChannelGroup_SetUserData: "FMOD_ChannelGroup_SetUserData"[
		;(FMOD_CHANNELGROUP *channelgroup, void *userdata)
			channelgroup                  [FMOD_CHANNELGROUP!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetUserData: "FMOD_ChannelGroup_GetUserData"[
		;(FMOD_CHANNELGROUP *channelgroup, void **userdata)
			channelgroup                  [FMOD_CHANNELGROUP!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_Release: "FMOD_ChannelGroup_Release"[
		;(FMOD_CHANNELGROUP *channelgroup)
			channelgroup                  [FMOD_CHANNELGROUP!]
			return:                       [FMOD_RESULT!]
		]


		;--  Nested channel groups.

		FMOD_ChannelGroup_AddGroup: "FMOD_ChannelGroup_AddGroup"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_CHANNELGROUP *group, FMOD_BOOL propagatedspclock, FMOD_DSPCONNECTION **connection)
			channelgroup                  [FMOD_CHANNELGROUP!]
			group                         [FMOD_CHANNELGROUP!]
			propagatedspclock             [integer!]
			connection                    [pointer! [FMOD_DSPCONNECTION!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetNumGroups: "FMOD_ChannelGroup_GetNumGroups"[
		;(FMOD_CHANNELGROUP *channelgroup, int *numgroups)
			channelgroup                  [FMOD_CHANNELGROUP!]
			numgroups                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetGroup: "FMOD_ChannelGroup_GetGroup"[
		;(FMOD_CHANNELGROUP *channelgroup, int index, FMOD_CHANNELGROUP **group)
			channelgroup                  [FMOD_CHANNELGROUP!]
			index                         [integer!]
			group                         [pointer! [FMOD_CHANNELGROUP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetParentGroup: "FMOD_ChannelGroup_GetParentGroup"[
		;(FMOD_CHANNELGROUP *channelgroup, FMOD_CHANNELGROUP **group)
			channelgroup                  [FMOD_CHANNELGROUP!]
			group                         [pointer! [FMOD_CHANNELGROUP!]]
			return:                       [FMOD_RESULT!]
		]


		;--  Information only functions.

		FMOD_ChannelGroup_GetName: "FMOD_ChannelGroup_GetName"[
		;(FMOD_CHANNELGROUP *channelgroup, char *name, int namelen)
			channelgroup                  [FMOD_CHANNELGROUP!]
			name                          [c-string!]
			namelen                       [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetNumChannels: "FMOD_ChannelGroup_GetNumChannels"[
		;(FMOD_CHANNELGROUP *channelgroup, int *numchannels)
			channelgroup                  [FMOD_CHANNELGROUP!]
			numchannels                   [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_ChannelGroup_GetChannel: "FMOD_ChannelGroup_GetChannel"[
		;(FMOD_CHANNELGROUP *channelgroup, int index, FMOD_CHANNEL **channel)
			channelgroup                  [FMOD_CHANNELGROUP!]
			index                         [integer!]
			channel                       [pointer! [FMOD_CHANNEL!]]
			return:                       [FMOD_RESULT!]
		]


		;-- 'SoundGroup' API

		FMOD_SoundGroup_Release: "FMOD_SoundGroup_Release"[
		;(FMOD_SOUNDGROUP *soundgroup)
			soundgroup                    [FMOD_SOUNDGROUP!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_GetSystemObject: "FMOD_SoundGroup_GetSystemObject"[
		;(FMOD_SOUNDGROUP *soundgroup, FMOD_SYSTEM **system)
			soundgroup                    [FMOD_SOUNDGROUP!]
			system                        [pointer! [FMOD_SYSTEM!]]
			return:                       [FMOD_RESULT!]
		]


		;--  SoundGroup control functions.

		FMOD_SoundGroup_SetMaxAudible: "FMOD_SoundGroup_SetMaxAudible"[
		;(FMOD_SOUNDGROUP *soundgroup, int maxaudible)
			soundgroup                    [FMOD_SOUNDGROUP!]
			maxaudible                    [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_GetMaxAudible: "FMOD_SoundGroup_GetMaxAudible"[
		;(FMOD_SOUNDGROUP *soundgroup, int *maxaudible)
			soundgroup                    [FMOD_SOUNDGROUP!]
			maxaudible                    [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_SetMaxAudibleBehavior: "FMOD_SoundGroup_SetMaxAudibleBehavior"[
		;(FMOD_SOUNDGROUP *soundgroup, FMOD_SOUNDGROUP_BEHAVIOR behavior)
			soundgroup                    [FMOD_SOUNDGROUP!]
			behavior                      [FMOD_SOUNDGROUP_BEHAVIOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_GetMaxAudibleBehavior: "FMOD_SoundGroup_GetMaxAudibleBehavior"[
		;(FMOD_SOUNDGROUP *soundgroup, FMOD_SOUNDGROUP_BEHAVIOR *behavior)
			soundgroup                    [FMOD_SOUNDGROUP!]
			behavior                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_SetMuteFadeSpeed: "FMOD_SoundGroup_SetMuteFadeSpeed"[
		;(FMOD_SOUNDGROUP *soundgroup, float speed)
			soundgroup                    [FMOD_SOUNDGROUP!]
			speed                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_GetMuteFadeSpeed: "FMOD_SoundGroup_GetMuteFadeSpeed"[
		;(FMOD_SOUNDGROUP *soundgroup, float *speed)
			soundgroup                    [FMOD_SOUNDGROUP!]
			speed                         [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_SetVolume: "FMOD_SoundGroup_SetVolume"[
		;(FMOD_SOUNDGROUP *soundgroup, float volume)
			soundgroup                    [FMOD_SOUNDGROUP!]
			volume                        [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_GetVolume: "FMOD_SoundGroup_GetVolume"[
		;(FMOD_SOUNDGROUP *soundgroup, float *volume)
			soundgroup                    [FMOD_SOUNDGROUP!]
			volume                        [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_Stop: "FMOD_SoundGroup_Stop"[
		;(FMOD_SOUNDGROUP *soundgroup)
			soundgroup                    [FMOD_SOUNDGROUP!]
			return:                       [FMOD_RESULT!]
		]


		;--  Information only functions.

		FMOD_SoundGroup_GetName: "FMOD_SoundGroup_GetName"[
		;(FMOD_SOUNDGROUP *soundgroup, char *name, int namelen)
			soundgroup                    [FMOD_SOUNDGROUP!]
			name                          [c-string!]
			namelen                       [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_GetNumSounds: "FMOD_SoundGroup_GetNumSounds"[
		;(FMOD_SOUNDGROUP *soundgroup, int *numsounds)
			soundgroup                    [FMOD_SOUNDGROUP!]
			numsounds                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_GetSound: "FMOD_SoundGroup_GetSound"[
		;(FMOD_SOUNDGROUP *soundgroup, int index, FMOD_SOUND **sound)
			soundgroup                    [FMOD_SOUNDGROUP!]
			index                         [integer!]
			sound                         [pointer! [FMOD_SOUND!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_GetNumPlaying: "FMOD_SoundGroup_GetNumPlaying"[
		;(FMOD_SOUNDGROUP *soundgroup, int *numplaying)
			soundgroup                    [FMOD_SOUNDGROUP!]
			numplaying                    [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Userdata set/get.

		FMOD_SoundGroup_SetUserData: "FMOD_SoundGroup_SetUserData"[
		;(FMOD_SOUNDGROUP *soundgroup, void *userdata)
			soundgroup                    [FMOD_SOUNDGROUP!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_SoundGroup_GetUserData: "FMOD_SoundGroup_GetUserData"[
		;(FMOD_SOUNDGROUP *soundgroup, void **userdata)
			soundgroup                    [FMOD_SOUNDGROUP!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;-- 'DSP' API

		FMOD_DSP_Release: "FMOD_DSP_Release"[
		;(FMOD_DSP *dsp)
			dsp                           [FMOD_DSP!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetSystemObject: "FMOD_DSP_GetSystemObject"[
		;(FMOD_DSP *dsp, FMOD_SYSTEM **system)
			dsp                           [FMOD_DSP!]
			system                        [pointer! [FMOD_SYSTEM!]]
			return:                       [FMOD_RESULT!]
		]


		;--  Connection / disconnection / input and output enumeration.

		FMOD_DSP_AddInput: "FMOD_DSP_AddInput"[
		;(FMOD_DSP *dsp, FMOD_DSP *input, FMOD_DSPCONNECTION **connection, FMOD_DSPCONNECTION_TYPE type)
			dsp                           [FMOD_DSP!]
			input                         [FMOD_DSP!]
			connection                    [pointer! [FMOD_DSPCONNECTION!]]
			type                          [FMOD_DSPCONNECTION_TYPE!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_DisconnectFrom: "FMOD_DSP_DisconnectFrom"[
		;(FMOD_DSP *dsp, FMOD_DSP *target, FMOD_DSPCONNECTION *connection)
			dsp                           [FMOD_DSP!]
			target                        [FMOD_DSP!]
			connection                    [FMOD_DSPCONNECTION!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_DisconnectAll: "FMOD_DSP_DisconnectAll"[
		;(FMOD_DSP *dsp, FMOD_BOOL inputs, FMOD_BOOL outputs)
			dsp                           [FMOD_DSP!]
			inputs                        [integer!]
			outputs                       [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetNumInputs: "FMOD_DSP_GetNumInputs"[
		;(FMOD_DSP *dsp, int *numinputs)
			dsp                           [FMOD_DSP!]
			numinputs                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetNumOutputs: "FMOD_DSP_GetNumOutputs"[
		;(FMOD_DSP *dsp, int *numoutputs)
			dsp                           [FMOD_DSP!]
			numoutputs                    [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetInput: "FMOD_DSP_GetInput"[
		;(FMOD_DSP *dsp, int index, FMOD_DSP **input, FMOD_DSPCONNECTION **inputconnection)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			input                         [pointer! [FMOD_DSP!]]
			inputconnection               [pointer! [FMOD_DSPCONNECTION!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetOutput: "FMOD_DSP_GetOutput"[
		;(FMOD_DSP *dsp, int index, FMOD_DSP **output, FMOD_DSPCONNECTION **outputconnection)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			output                        [pointer! [FMOD_DSP!]]
			outputconnection              [pointer! [FMOD_DSPCONNECTION!]]
			return:                       [FMOD_RESULT!]
		]


		;--  DSP unit control.

		FMOD_DSP_SetActive: "FMOD_DSP_SetActive"[
		;(FMOD_DSP *dsp, FMOD_BOOL active)
			dsp                           [FMOD_DSP!]
			active                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetActive: "FMOD_DSP_GetActive"[
		;(FMOD_DSP *dsp, FMOD_BOOL *active)
			dsp                           [FMOD_DSP!]
			active                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_SetBypass: "FMOD_DSP_SetBypass"[
		;(FMOD_DSP *dsp, FMOD_BOOL bypass)
			dsp                           [FMOD_DSP!]
			bypass                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetBypass: "FMOD_DSP_GetBypass"[
		;(FMOD_DSP *dsp, FMOD_BOOL *bypass)
			dsp                           [FMOD_DSP!]
			bypass                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_SetWetDryMix: "FMOD_DSP_SetWetDryMix"[
		;(FMOD_DSP *dsp, float prewet, float postwet, float dry)
			dsp                           [FMOD_DSP!]
			prewet                        [float32!]
			postwet                       [float32!]
			dry                           [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetWetDryMix: "FMOD_DSP_GetWetDryMix"[
		;(FMOD_DSP *dsp, float *prewet, float *postwet, float *dry)
			dsp                           [FMOD_DSP!]
			prewet                        [pointer! [float32!]]
			postwet                       [pointer! [float32!]]
			dry                           [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_SetChannelFormat: "FMOD_DSP_SetChannelFormat"[
		;(FMOD_DSP *dsp, FMOD_CHANNELMASK channelmask, int numchannels, FMOD_SPEAKERMODE source_speakermode)
			dsp                           [FMOD_DSP!]
			channelmask                   [FMOD_CHANNELMASK!]
			numchannels                   [integer!]
			source_speakermode            [FMOD_SPEAKERMODE!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetChannelFormat: "FMOD_DSP_GetChannelFormat"[
		;(FMOD_DSP *dsp, FMOD_CHANNELMASK *channelmask, int *numchannels, FMOD_SPEAKERMODE *source_speakermode)
			dsp                           [FMOD_DSP!]
			channelmask                   [pointer! [FMOD_CHANNELMASK!]]
			numchannels                   [int-ptr!]
			source_speakermode            [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetOutputChannelFormat: "FMOD_DSP_GetOutputChannelFormat"[
		;(FMOD_DSP *dsp, FMOD_CHANNELMASK inmask, int inchannels, FMOD_SPEAKERMODE inspeakermode, FMOD_CHANNELMASK *outmask, int *outchannels, FMOD_SPEAKERMODE *outspeakermode)
			dsp                           [FMOD_DSP!]
			inmask                        [FMOD_CHANNELMASK!]
			inchannels                    [integer!]
			inspeakermode                 [FMOD_SPEAKERMODE!]
			outmask                       [pointer! [FMOD_CHANNELMASK!]]
			outchannels                   [int-ptr!]
			outspeakermode                [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_Reset: "FMOD_DSP_Reset"[
		;(FMOD_DSP *dsp)
			dsp                           [FMOD_DSP!]
			return:                       [FMOD_RESULT!]
		]


		;--  DSP parameter control.

		FMOD_DSP_SetParameterFloat: "FMOD_DSP_SetParameterFloat"[
		;(FMOD_DSP *dsp, int index, float value)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			value                         [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_SetParameterInt: "FMOD_DSP_SetParameterInt"[
		;(FMOD_DSP *dsp, int index, int value)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			value                         [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_SetParameterBool: "FMOD_DSP_SetParameterBool"[
		;(FMOD_DSP *dsp, int index, FMOD_BOOL value)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			value                         [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_SetParameterData: "FMOD_DSP_SetParameterData"[
		;(FMOD_DSP *dsp, int index, void *data, unsigned int length)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			data                          [byte-ptr!]
			length                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetParameterFloat: "FMOD_DSP_GetParameterFloat"[
		;(FMOD_DSP *dsp, int index, float *value, char *valuestr, int valuestrlen)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			value                         [pointer! [float32!]]
			valuestr                      [c-string!]
			valuestrlen                   [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetParameterInt: "FMOD_DSP_GetParameterInt"[
		;(FMOD_DSP *dsp, int index, int *value, char *valuestr, int valuestrlen)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			value                         [int-ptr!]
			valuestr                      [c-string!]
			valuestrlen                   [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetParameterBool: "FMOD_DSP_GetParameterBool"[
		;(FMOD_DSP *dsp, int index, FMOD_BOOL *value, char *valuestr, int valuestrlen)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			value                         [int-ptr!]
			valuestr                      [c-string!]
			valuestrlen                   [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetParameterData: "FMOD_DSP_GetParameterData"[
		;(FMOD_DSP *dsp, int index, void **data, unsigned int *length, char *valuestr, int valuestrlen)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			data                          [byte-ptr!]
			length                        [int-ptr!]
			valuestr                      [c-string!]
			valuestrlen                   [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetNumParameters: "FMOD_DSP_GetNumParameters"[
		;(FMOD_DSP *dsp, int *numparams)
			dsp                           [FMOD_DSP!]
			numparams                     [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetParameterInfo: "FMOD_DSP_GetParameterInfo"[
		;(FMOD_DSP *dsp, int index, FMOD_DSP_PARAMETER_DESC **desc)
			dsp                           [FMOD_DSP!]
			index                         [integer!]
			desc                          [pointer! [handle!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetDataParameterIndex: "FMOD_DSP_GetDataParameterIndex"[
		;(FMOD_DSP *dsp, int datatype, int *index)
			dsp                           [FMOD_DSP!]
			datatype                      [integer!]
			index                         [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_ShowConfigDialog: "FMOD_DSP_ShowConfigDialog"[
		;(FMOD_DSP *dsp, void *hwnd, FMOD_BOOL show)
			dsp                           [FMOD_DSP!]
			hwnd                          [byte-ptr!]
			show                          [integer!]
			return:                       [FMOD_RESULT!]
		]


		;--  DSP attributes.

		FMOD_DSP_GetInfo: "FMOD_DSP_GetInfo"[
		;(FMOD_DSP *dsp, char *name, unsigned int *version, int *channels, int *configwidth, int *configheight)
			dsp                           [FMOD_DSP!]
			name                          [c-string!]
			version                       [int-ptr!]
			channels                      [int-ptr!]
			configwidth                   [int-ptr!]
			configheight                  [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetType: "FMOD_DSP_GetType"[
		;(FMOD_DSP *dsp, FMOD_DSP_TYPE *type)
			dsp                           [FMOD_DSP!]
			type                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetIdle: "FMOD_DSP_GetIdle"[
		;(FMOD_DSP *dsp, FMOD_BOOL *idle)
			dsp                           [FMOD_DSP!]
			idle                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Userdata set/get.

		FMOD_DSP_SetUserData: "FMOD_DSP_SetUserData"[
		;(FMOD_DSP *dsp, void *userdata)
			dsp                           [FMOD_DSP!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetUserData: "FMOD_DSP_GetUserData"[
		;(FMOD_DSP *dsp, void **userdata)
			dsp                           [FMOD_DSP!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Metering.

		FMOD_DSP_SetMeteringEnabled: "FMOD_DSP_SetMeteringEnabled"[
		;(FMOD_DSP *dsp, FMOD_BOOL inputEnabled, FMOD_BOOL outputEnabled)
			dsp                           [FMOD_DSP!]
			inputEnabled                  [integer!]
			outputEnabled                 [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetMeteringEnabled: "FMOD_DSP_GetMeteringEnabled"[
		;(FMOD_DSP *dsp, FMOD_BOOL *inputEnabled, FMOD_BOOL *outputEnabled)
			dsp                           [FMOD_DSP!]
			inputEnabled                  [int-ptr!]
			outputEnabled                 [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSP_GetMeteringInfo: "FMOD_DSP_GetMeteringInfo"[
		;(FMOD_DSP *dsp, FMOD_DSP_METERING_INFO *inputInfo, FMOD_DSP_METERING_INFO *outputInfo)
			dsp                           [FMOD_DSP!]
			inputInfo                     [handle!]
			outputInfo                    [handle!]
			return:                       [FMOD_RESULT!]
		]


		;-- 'DSPConnection' API

		FMOD_DSPConnection_GetInput: "FMOD_DSPConnection_GetInput"[
		;(FMOD_DSPCONNECTION *dspconnection, FMOD_DSP **input)
			dspconnection                 [FMOD_DSPCONNECTION!]
			input                         [pointer! [FMOD_DSP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSPConnection_GetOutput: "FMOD_DSPConnection_GetOutput"[
		;(FMOD_DSPCONNECTION *dspconnection, FMOD_DSP **output)
			dspconnection                 [FMOD_DSPCONNECTION!]
			output                        [pointer! [FMOD_DSP!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSPConnection_SetMix: "FMOD_DSPConnection_SetMix"[
		;(FMOD_DSPCONNECTION *dspconnection, float volume)
			dspconnection                 [FMOD_DSPCONNECTION!]
			volume                        [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSPConnection_GetMix: "FMOD_DSPConnection_GetMix"[
		;(FMOD_DSPCONNECTION *dspconnection, float *volume)
			dspconnection                 [FMOD_DSPCONNECTION!]
			volume                        [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSPConnection_SetMixMatrix: "FMOD_DSPConnection_SetMixMatrix"[
		;(FMOD_DSPCONNECTION *dspconnection, float *matrix, int outchannels, int inchannels, int inchannel_hop)
			dspconnection                 [FMOD_DSPCONNECTION!]
			matrix                        [pointer! [float32!]]
			outchannels                   [integer!]
			inchannels                    [integer!]
			inchannel_hop                 [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSPConnection_GetMixMatrix: "FMOD_DSPConnection_GetMixMatrix"[
		;(FMOD_DSPCONNECTION *dspconnection, float *matrix, int *outchannels, int *inchannels, int inchannel_hop)
			dspconnection                 [FMOD_DSPCONNECTION!]
			matrix                        [pointer! [float32!]]
			outchannels                   [int-ptr!]
			inchannels                    [int-ptr!]
			inchannel_hop                 [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSPConnection_GetType: "FMOD_DSPConnection_GetType"[
		;(FMOD_DSPCONNECTION *dspconnection, FMOD_DSPCONNECTION_TYPE *type)
			dspconnection                 [FMOD_DSPCONNECTION!]
			type                          [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Userdata set/get.

		FMOD_DSPConnection_SetUserData: "FMOD_DSPConnection_SetUserData"[
		;(FMOD_DSPCONNECTION *dspconnection, void *userdata)
			dspconnection                 [FMOD_DSPCONNECTION!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_DSPConnection_GetUserData: "FMOD_DSPConnection_GetUserData"[
		;(FMOD_DSPCONNECTION *dspconnection, void **userdata)
			dspconnection                 [FMOD_DSPCONNECTION!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;-- 'Geometry' API

		FMOD_Geometry_Release: "FMOD_Geometry_Release"[
		;(FMOD_GEOMETRY *geometry)
			geometry                      [FMOD_GEOMETRY!]
			return:                       [FMOD_RESULT!]
		]


		;--  Polygon manipulation.

		FMOD_Geometry_AddPolygon: "FMOD_Geometry_AddPolygon"[
		;(FMOD_GEOMETRY *geometry, float directocclusion, float reverbocclusion, FMOD_BOOL doublesided, int numvertices, const FMOD_VECTOR *vertices, int *polygonindex)
			geometry                      [FMOD_GEOMETRY!]
			directocclusion               [float32!]
			reverbocclusion               [float32!]
			doublesided                   [integer!]
			numvertices                   [integer!]
			vertices                      [FMOD_VECTOR!]
			polygonindex                  [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_GetNumPolygons: "FMOD_Geometry_GetNumPolygons"[
		;(FMOD_GEOMETRY *geometry, int *numpolygons)
			geometry                      [FMOD_GEOMETRY!]
			numpolygons                   [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_GetMaxPolygons: "FMOD_Geometry_GetMaxPolygons"[
		;(FMOD_GEOMETRY *geometry, int *maxpolygons, int *maxvertices)
			geometry                      [FMOD_GEOMETRY!]
			maxpolygons                   [int-ptr!]
			maxvertices                   [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_GetPolygonNumVertices: "FMOD_Geometry_GetPolygonNumVertices"[
		;(FMOD_GEOMETRY *geometry, int index, int *numvertices)
			geometry                      [FMOD_GEOMETRY!]
			index                         [integer!]
			numvertices                   [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_SetPolygonVertex: "FMOD_Geometry_SetPolygonVertex"[
		;(FMOD_GEOMETRY *geometry, int index, int vertexindex, const FMOD_VECTOR *vertex)
			geometry                      [FMOD_GEOMETRY!]
			index                         [integer!]
			vertexindex                   [integer!]
			vertex                        [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_GetPolygonVertex: "FMOD_Geometry_GetPolygonVertex"[
		;(FMOD_GEOMETRY *geometry, int index, int vertexindex, FMOD_VECTOR *vertex)
			geometry                      [FMOD_GEOMETRY!]
			index                         [integer!]
			vertexindex                   [integer!]
			vertex                        [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_SetPolygonAttributes: "FMOD_Geometry_SetPolygonAttributes"[
		;(FMOD_GEOMETRY *geometry, int index, float directocclusion, float reverbocclusion, FMOD_BOOL doublesided)
			geometry                      [FMOD_GEOMETRY!]
			index                         [integer!]
			directocclusion               [float32!]
			reverbocclusion               [float32!]
			doublesided                   [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_GetPolygonAttributes: "FMOD_Geometry_GetPolygonAttributes"[
		;(FMOD_GEOMETRY *geometry, int index, float *directocclusion, float *reverbocclusion, FMOD_BOOL *doublesided)
			geometry                      [FMOD_GEOMETRY!]
			index                         [integer!]
			directocclusion               [pointer! [float32!]]
			reverbocclusion               [pointer! [float32!]]
			doublesided                   [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Object manipulation.

		FMOD_Geometry_SetActive: "FMOD_Geometry_SetActive"[
		;(FMOD_GEOMETRY *geometry, FMOD_BOOL active)
			geometry                      [FMOD_GEOMETRY!]
			active                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_GetActive: "FMOD_Geometry_GetActive"[
		;(FMOD_GEOMETRY *geometry, FMOD_BOOL *active)
			geometry                      [FMOD_GEOMETRY!]
			active                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_SetRotation: "FMOD_Geometry_SetRotation"[
		;(FMOD_GEOMETRY *geometry, const FMOD_VECTOR *forward, const FMOD_VECTOR *up)
			geometry                      [FMOD_GEOMETRY!]
			forward                       [FMOD_VECTOR!]
			up                            [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_GetRotation: "FMOD_Geometry_GetRotation"[
		;(FMOD_GEOMETRY *geometry, FMOD_VECTOR *forward, FMOD_VECTOR *up)
			geometry                      [FMOD_GEOMETRY!]
			forward                       [FMOD_VECTOR!]
			up                            [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_SetPosition: "FMOD_Geometry_SetPosition"[
		;(FMOD_GEOMETRY *geometry, const FMOD_VECTOR *position)
			geometry                      [FMOD_GEOMETRY!]
			position                      [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_GetPosition: "FMOD_Geometry_GetPosition"[
		;(FMOD_GEOMETRY *geometry, FMOD_VECTOR *position)
			geometry                      [FMOD_GEOMETRY!]
			position                      [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_SetScale: "FMOD_Geometry_SetScale"[
		;(FMOD_GEOMETRY *geometry, const FMOD_VECTOR *scale)
			geometry                      [FMOD_GEOMETRY!]
			scale                         [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_GetScale: "FMOD_Geometry_GetScale"[
		;(FMOD_GEOMETRY *geometry, FMOD_VECTOR *scale)
			geometry                      [FMOD_GEOMETRY!]
			scale                         [FMOD_VECTOR!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_Save: "FMOD_Geometry_Save"[
		;(FMOD_GEOMETRY *geometry, void *data, int *datasize)
			geometry                      [FMOD_GEOMETRY!]
			data                          [byte-ptr!]
			datasize                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Userdata set/get.

		FMOD_Geometry_SetUserData: "FMOD_Geometry_SetUserData"[
		;(FMOD_GEOMETRY *geometry, void *userdata)
			geometry                      [FMOD_GEOMETRY!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Geometry_GetUserData: "FMOD_Geometry_GetUserData"[
		;(FMOD_GEOMETRY *geometry, void **userdata)
			geometry                      [FMOD_GEOMETRY!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;-- 'Reverb3D' API

		FMOD_Reverb3D_Release: "FMOD_Reverb3D_Release"[
		;(FMOD_REVERB3D *reverb3d)
			reverb3d                      [FMOD_REVERB3D!]
			return:                       [FMOD_RESULT!]
		]


		;--  Reverb manipulation.

		FMOD_Reverb3D_Set3DAttributes: "FMOD_Reverb3D_Set3DAttributes"[
		;(FMOD_REVERB3D *reverb3d, const FMOD_VECTOR *position, float mindistance, float maxdistance)
			reverb3d                      [FMOD_REVERB3D!]
			position                      [FMOD_VECTOR!]
			mindistance                   [float32!]
			maxdistance                   [float32!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Reverb3D_Get3DAttributes: "FMOD_Reverb3D_Get3DAttributes"[
		;(FMOD_REVERB3D *reverb3d, FMOD_VECTOR *position, float *mindistance, float *maxdistance)
			reverb3d                      [FMOD_REVERB3D!]
			position                      [FMOD_VECTOR!]
			mindistance                   [pointer! [float32!]]
			maxdistance                   [pointer! [float32!]]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Reverb3D_SetProperties: "FMOD_Reverb3D_SetProperties"[
		;(FMOD_REVERB3D *reverb3d, const FMOD_REVERB_PROPERTIES *properties)
			reverb3d                      [FMOD_REVERB3D!]
			properties                    [handle!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Reverb3D_GetProperties: "FMOD_Reverb3D_GetProperties"[
		;(FMOD_REVERB3D *reverb3d, FMOD_REVERB_PROPERTIES *properties)
			reverb3d                      [FMOD_REVERB3D!]
			properties                    [FMOD_REVERB_PROPERTIES!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Reverb3D_SetActive: "FMOD_Reverb3D_SetActive"[
		;(FMOD_REVERB3D *reverb3d, FMOD_BOOL active)
			reverb3d                      [FMOD_REVERB3D!]
			active                        [integer!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Reverb3D_GetActive: "FMOD_Reverb3D_GetActive"[
		;(FMOD_REVERB3D *reverb3d, FMOD_BOOL *active)
			reverb3d                      [FMOD_REVERB3D!]
			active                        [int-ptr!]
			return:                       [FMOD_RESULT!]
		]


		;--  Userdata set/get.

		FMOD_Reverb3D_SetUserData: "FMOD_Reverb3D_SetUserData"[
		;(FMOD_REVERB3D *reverb3d, void *userdata)
			reverb3d                      [FMOD_REVERB3D!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]
		FMOD_Reverb3D_GetUserData: "FMOD_Reverb3D_GetUserData"[
		;(FMOD_REVERB3D *reverb3d, void **userdata)
			reverb3d                      [FMOD_REVERB3D!]
			userdata                      [int-ptr!]
			return:                       [FMOD_RESULT!]
		]

	]
]
