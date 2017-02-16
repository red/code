Red/System [
	Title:   "Red/System FMOD binding"
	Author:  "Oldes"
	File: 	 %FMOD.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

FMOD: context [

	#include %FMOD.reds

	#import [
		"kernel32.dll" stdcall [
			Sleep: "Sleep" [
				dwMilliseconds	[integer!]
			]
		]
	]


	print-error: func[
		result [integer!]
		/local
			msg [c-string!]
	][
		switch result [
		    FMOD_ERR_BADCOMMAND                [msg: {Tried to call a function on a data type that does not allow this type of functionality (ie calling Sound::lock on a streaming sound).}]
		    FMOD_ERR_CHANNEL_ALLOC             [msg: {Error trying to allocate a channel.}]
		    FMOD_ERR_CHANNEL_STOLEN            [msg: {The specified channel has been reused to play another sound.}]
		    FMOD_ERR_DMA                       [msg: {DMA Failure.  See debug output for more information.}]
		    FMOD_ERR_DSP_CONNECTION            [msg: {DSP connection error.  Connection possibly caused a cyclic dependency or connected dsps with incompatible buffer counts.}]
		    FMOD_ERR_DSP_DONTPROCESS           [msg: {DSP return code from a DSP process query callback.  Tells mixer not to call the process callback and therefore not consume CPU.  Use this to optimize the DSP graph.}]
		    FMOD_ERR_DSP_FORMAT                [msg: {DSP Format error.  A DSP unit may have attempted to connect to this network with the wrong format, or a matrix may have been set with the wrong size if the target unit has a specified channel map.}]
		    FMOD_ERR_DSP_INUSE                 [msg: {DSP is already in the mixer's DSP network. It must be removed before being reinserted or released.}]
		    FMOD_ERR_DSP_NOTFOUND              [msg: {DSP connection error.  Couldn't find the DSP unit specified.}]
		    FMOD_ERR_DSP_RESERVED              [msg: {DSP operation error.  Cannot perform operation on this DSP as it is reserved by the system.}]
		    FMOD_ERR_DSP_SILENCE               [msg: {DSP return code from a DSP process query callback.  Tells mixer silence would be produced from read, so go idle and not consume CPU.  Use this to optimize the DSP graph.}]
		    FMOD_ERR_DSP_TYPE                  [msg: {DSP operation cannot be performed on a DSP of this type.}]
		    FMOD_ERR_FILE_BAD                  [msg: {Error loading file.}]
		    FMOD_ERR_FILE_COULDNOTSEEK         [msg: {Couldn't perform seek operation.  This is a limitation of the medium (ie netstreams) or the file format.}]
		    FMOD_ERR_FILE_DISKEJECTED          [msg: {Media was ejected while reading.}]
		    FMOD_ERR_FILE_EOF                  [msg: {End of file unexpectedly reached while trying to read essential data (truncated?).}]
		    FMOD_ERR_FILE_ENDOFDATA            [msg: {End of current chunk reached while trying to read data.}]
		    FMOD_ERR_FILE_NOTFOUND             [msg: {File not found.}]
		    FMOD_ERR_FORMAT                    [msg: {Unsupported file or audio format.}]
		    FMOD_ERR_HEADER_MISMATCH           [msg: {There is a version mismatch between the FMOD header and either the FMOD Studio library or the FMOD Low Level library.}]
		    FMOD_ERR_HTTP                      [msg: {A HTTP error occurred. This is a catch-all for HTTP errors not listed elsewhere.}]
		    FMOD_ERR_HTTP_ACCESS               [msg: {The specified resource requires authentication or is forbidden.}]
		    FMOD_ERR_HTTP_PROXY_AUTH           [msg: {Proxy authentication is required to access the specified resource.}]
		    FMOD_ERR_HTTP_SERVER_ERROR         [msg: {A HTTP server error occurred.}]
		    FMOD_ERR_HTTP_TIMEOUT              [msg: {The HTTP request timed out.}]
		    FMOD_ERR_INITIALIZATION            [msg: {FMOD was not initialized correctly to support this function.}]
		    FMOD_ERR_INITIALIZED               [msg: {Cannot call this command after System::init.}]
		    FMOD_ERR_INTERNAL                  [msg: {An error occurred that wasn't supposed to.  Contact support.}]
		    FMOD_ERR_INVALID_FLOAT             [msg: {Value passed in was a NaN, Inf or denormalized float.}]
		    FMOD_ERR_INVALID_HANDLE            [msg: {An invalid object handle was used.}]
		    FMOD_ERR_INVALID_PARAM             [msg: {An invalid parameter was passed to this function.}]
		    FMOD_ERR_INVALID_POSITION          [msg: {An invalid seek position was passed to this function.}]
		    FMOD_ERR_INVALID_SPEAKER           [msg: {An invalid speaker was passed to this function based on the current speaker mode.}]
		    FMOD_ERR_INVALID_SYNCPOINT         [msg: {The syncpoint did not come from this sound handle.}]
		    FMOD_ERR_INVALID_THREAD            [msg: {Tried to call a function on a thread that is not supported.}]
		    FMOD_ERR_INVALID_VECTOR            [msg: {The vectors passed in are not unit length, or perpendicular.}]
		    FMOD_ERR_MAXAUDIBLE                [msg: {Reached maximum audible playback count for this sound's soundgroup.}]
		    FMOD_ERR_MEMORY                    [msg: {Not enough memory or resources.}]
		    FMOD_ERR_MEMORY_CANTPOINT          [msg: {Can't use FMOD_OPENMEMORY_POINT on non PCM source data, or non mp3/xma/adpcm data if FMOD_CREATECOMPRESSEDSAMPLE was used.}]
		    FMOD_ERR_NEEDS3D                   [msg: {Tried to call a command on a 2d sound when the command was meant for 3d sound.}]
		    FMOD_ERR_NEEDSHARDWARE             [msg: {Tried to use a feature that requires hardware support.}]
		    FMOD_ERR_NET_CONNECT               [msg: {Couldn't connect to the specified host.}]
		    FMOD_ERR_NET_SOCKET_ERROR          [msg: {A socket error occurred.  This is a catch-all for socket-related errors not listed elsewhere.}]
		    FMOD_ERR_NET_URL                   [msg: {The specified URL couldn't be resolved.}]
		    FMOD_ERR_NET_WOULD_BLOCK           [msg: {Operation on a non-blocking socket could not complete immediately.}]
		    FMOD_ERR_NOTREADY                  [msg: {Operation could not be performed because specified sound/DSP connection is not ready.}]
		    FMOD_ERR_OUTPUT_ALLOCATED          [msg: {Error initializing output device, but more specifically, the output device is already in use and cannot be reused.}]
		    FMOD_ERR_OUTPUT_CREATEBUFFER       [msg: {Error creating hardware sound buffer.}]
		    FMOD_ERR_OUTPUT_DRIVERCALL         [msg: {A call to a standard soundcard driver failed, which could possibly mean a bug in the driver or resources were missing or exhausted.}]
		    FMOD_ERR_OUTPUT_FORMAT             [msg: {Soundcard does not support the specified format.}]
		    FMOD_ERR_OUTPUT_INIT               [msg: {Error initializing output device.}]
		    FMOD_ERR_OUTPUT_NODRIVERS          [msg: {The output device has no drivers installed.  If pre-init, FMOD_OUTPUT_NOSOUND is selected as the output mode.  If post-init, the function just fails.}]
		    FMOD_ERR_PLUGIN                    [msg: {An unspecified error has been returned from a plugin.}]
		    FMOD_ERR_PLUGIN_MISSING            [msg: {A requested output, dsp unit type or codec was not available.}]
		    FMOD_ERR_PLUGIN_RESOURCE           [msg: {A resource that the plugin requires cannot be found. (ie the DLS file for MIDI playback)}]
		    FMOD_ERR_PLUGIN_VERSION            [msg: {A plugin was built with an unsupported SDK version.}]
		    FMOD_ERR_RECORD                    [msg: {An error occurred trying to initialize the recording device.}]
		    FMOD_ERR_REVERB_CHANNELGROUP       [msg: {Reverb properties cannot be set on this channel because a parent channelgroup owns the reverb connection.}]
		    FMOD_ERR_REVERB_INSTANCE           [msg: {Specified instance in FMOD_REVERB_PROPERTIES couldn't be set. Most likely because it is an invalid instance number or the reverb doesn't exist.}]
		    FMOD_ERR_SUBSOUNDS                 [msg: {The error occurred because the sound referenced contains subsounds when it shouldn't have, or it doesn't contain subsounds when it should have.  The operation may also not be able to be performed on a parent sound.}]
		    FMOD_ERR_SUBSOUND_ALLOCATED        [msg: {This subsound is already being used by another sound, you cannot have more than one parent to a sound.  Null out the other parent's entry first.}]
		    FMOD_ERR_SUBSOUND_CANTMOVE         [msg: {Shared subsounds cannot be replaced or moved from their parent stream, such as when the parent stream is an FSB file.}]
		    FMOD_ERR_TAGNOTFOUND               [msg: {The specified tag could not be found or there are no tags.}]
		    FMOD_ERR_TOOMANYCHANNELS           [msg: {The sound created exceeds the allowable input channel count.  This can be increased using the 'maxinputchannels' parameter in System::setSoftwareFormat.}]
		    FMOD_ERR_TRUNCATED                 [msg: {The retrieved string is too long to fit in the supplied buffer and has been truncated.}]
		    FMOD_ERR_UNIMPLEMENTED             [msg: {Something in FMOD hasn't been implemented when it should be! contact support!}]
		    FMOD_ERR_UNINITIALIZED             [msg: {This command failed because System::init or System::setDriver was not called.}]
		    FMOD_ERR_UNSUPPORTED               [msg: {A command issued was not supported by this object.  Possibly a plugin without certain callbacks specified.}]
		    FMOD_ERR_VERSION                   [msg: {The version number of this file format is not supported.}]
		    FMOD_ERR_EVENT_ALREADY_LOADED      [msg: {The specified bank has already been loaded.}]
		    FMOD_ERR_EVENT_LIVEUPDATE_BUSY     [msg: {The live update connection failed due to the game already being connected.}]
		    FMOD_ERR_EVENT_LIVEUPDATE_MISMATCH [msg: {The live update connection failed due to the game data being out of sync with the tool.}]
		    FMOD_ERR_EVENT_LIVEUPDATE_TIMEOUT  [msg: {The live update connection timed out.}]
		    FMOD_ERR_EVENT_NOTFOUND            [msg: {The requested event, bus or vca could not be found.}]
		    FMOD_ERR_STUDIO_UNINITIALIZED      [msg: {The Studio::System object is not yet initialized.}]
		    FMOD_ERR_STUDIO_NOT_LOADED         [msg: {The specified resource is not loaded, so it can't be unloaded.}]
		    FMOD_ERR_INVALID_STRING            [msg: {An invalid string was passed to this function.}]
		    FMOD_ERR_ALREADY_LOCKED            [msg: {The specified resource is already locked.}]
		    FMOD_ERR_NOT_LOCKED                [msg: {The specified resource is not locked, so it can't be unlocked.}]
		    FMOD_ERR_RECORD_DISCONNECTED       [msg: {The specified recording driver has been disconnected.}]
		    FMOD_ERR_TOOMANYSAMPLES            [msg: {The length provided exceeds the allowable limit.}]
		]
		print ["*** FMOD Error: [" result "] " msg lf]
	]

	#define ERRORCHECK(result) [
		if result <> FMOD_OK [
			print ["FMOD ERROR"]
		]
	]


	*fs:    declare FMOD_SYSTEM!
	*sound: declare FMOD_SOUND!

	result: FMOD_System_Create :*fs
	ERRORCHECK(result)

	result: FMOD_System_Init *fs 16 FMOD_INIT_NORMAL null
	ERRORCHECK(result)

	either result = FMOD_OK [
		print "FMOD system ready!^/"
	][
		quit 0
	]

	version: 0
	FMOD_System_GetVersion *fs :version
	print ["FMOD version: " (version >> 16) #"." ((version and 0000FF00h) >> 8) #"." (version and 000000FFh) lf]

	numdrivers: -1
	FMOD_System_GetNumDrivers *fs :numdrivers
	print ["Number of sound drivers: " numdrivers lf]

	result: FMOD_System_CreateSound *fs "drumloop.wav" FMOD_DEFAULT 0 :*sound
	ERRORCHECK(result)

	*channel: 0
	currentalloced: 0
	maxalloced: 0


	if FMOD_OK = result [
		result: FMOD_System_PlaySound *fs *sound 0 0 :*channel
		ERRORCHECK(result)

		print ["Playing sound at channel: " as int-ptr! *channel " (3 seconds)" lf]

		Sleep 3000 ;wait 3s

		FMOD_System_Update *fs

		result: FMOD_Memory_GetStats :currentalloced :maxalloced 1
		print ["Sound RAM current: " currentalloced " max: " maxalloced lf]

	]

	result: FMOD_System_Close *fs
	ERRORCHECK(result)
]