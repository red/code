Red/System [
	Title:   "Red/System Portaudio (Portable Real-Time Audio Library) binding"
	Author:  "Oldes"
	File: 	 %portaudio.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on Portaudio source of version: pa_stable_v190600_20161030}
	
]

#switch OS [
	Windows   [	#define PORTAUDIO_LIBRARY "libportaudio32bit.dll" ]
	macOS     [ #define PORTAUDIO_LIBRARY "libportaudio.dylib " ] ;@@ not tested!
	#default  [   ]
]

#include %../os/definitions.reds ;common aliases and defines

#define PaHostApiIndex! integer!
#define PaDeviceIndex!  integer!
#define PaTime!         float! ;double; The type used to represent monotonic time in seconds.
#define PaError!        integer!

#define PaStream!     [pointer! [integer!]]
PaStream-ptr!:  alias struct! [value [PaStream!]]

PaVersionInfo!: alias struct! [
	versionMajor    [integer!]
    versionMinor    [integer!]
    versionSubMinor [integer!]
  	versionControlRevision [c-string!]  
  	; This is currently the Git revision hash but may change in the future.
    ; The versionControlRevision is updated by running a script before compiling the library.
    ; If the update does not occur, this value may refer to an earlier revision.
    versionText [c-string!]
    ; Version as a string, for example "PortAudio V19.5.0-devel, revision 1952M"
]

#enum PaErrorCode! [
    paNoError: 0

    paNotInitialized: -10000
    paUnanticipatedHostError
    paInvalidChannelCount
    paInvalidSampleRate
    paInvalidDevice
    paInvalidFlag
    paSampleFormatNotSupported
    paBadIODeviceCombination
    paInsufficientMemory
    paBufferTooBig
    paBufferTooSmall
    paNullCallback
    paBadStreamPtr
    paTimedOut
    paInternalError
    paDeviceUnavailable
    paIncompatibleHostApiSpecificStreamInfo
    paStreamIsStopped
    paStreamIsNotStopped
    paInputOverflowed
    paOutputUnderflowed
    paHostApiNotFound
    paInvalidHostApi
    paCanNotReadFromACallbackStream
    paCanNotWriteToACallbackStream
    paCanNotReadFromAnOutputOnlyStream
    paCanNotWriteToAnInputOnlyStream
    paIncompatibleStreamHostApi
    paBadBufferPtr
]

#define paNoDevice -1
#define paUseHostApiSpecificDeviceSpecification -2

#enum PaHostApiTypeId! [
    paInDevelopment: 0 ; use while developing support for a new host API
    paDirectSound: 1
    paMME: 2
    paASIO: 3
    paSoundManager: 4
    paCoreAudio: 5
    paOSS: 7
    paALSA: 8
    paAL: 9
    paBeOS: 10
    paWDMKS: 11
    paJACK: 12
    paWASAPI: 13
    paAudioScienceHPI: 14
]

PaHostApiInfo!: alias struct! [
    structVersion [integer!] ;this is struct version 1
    type [PaHostApiTypeId!] ;The well known unique identifier of this host API @see PaHostApiTypeId
    name [c-string!] ;A textual description of the host API for display on user interfaces.

    deviceCount [integer!]
    ; The number of devices belonging to this host API. This field may be
    ; used in conjunction with Pa_HostApiDeviceIndexToDeviceIndex() to enumerate
    ; all devices for this host API.

    defaultInputDevice [PaDeviceIndex!]
    ; The default input device for this host API. The value will be a
    ; device index ranging from 0 to (Pa_GetDeviceCount()-1), or paNoDevice
    ; if no default input device is available.

    defaultOutputDevice [PaDeviceIndex!]
    ; The default output device for this host API. The value will be a
    ; device index ranging from 0 to (Pa_GetDeviceCount()-1), or paNoDevice
    ; if no default output device is available.
]

PaHostErrorInfo!: alias struct! [
	;Structure used to return information about a host error condition.
	hostApiType [PaHostApiTypeId!] ;the host API which returned the error code
	errorCode   [integer!]         ;the error code returned
	errorText   [c-string!]        ;a textual description of the error if available, otherwise a zero-length string
]

#enum PaSampleFormat! [
; A type used to specify one or more sample formats. Each value indicates
; a possible format for sound data passed to and from the stream callback,
; Pa_ReadStream and Pa_WriteStream.
;
; The standard formats paFloat32, paInt16, paInt32, paInt24, paInt8
; and aUInt8 are usually implemented by all implementations.
;
; The floating point representation (paFloat32) uses +1.0 and -1.0 as the
; maximum and minimum respectively.
;
; paUInt8 is an unsigned 8 bit format where 128 is considered "ground"
;
; The paNonInterleaved flag indicates that audio data is passed as an array 
; of pointers to separate buffers, one buffer for each channel. Usually,
; when this flag is not used, audio data is passed as a single buffer with
; all channels interleaved.
	paFloat32:        00000001h
	paInt32:          00000002h
	paInt24:          00000004h
	paInt16:          00000008h
	paInt8:           00000010h
	paUInt8:          00000020h
	paCustomFormat:   00010000h
	paNonInterleaved: 80000000h
]

#enum PaStreamFlags! [
; Flags used to control the behavior of a stream. They are passed as
; parameters to Pa_OpenStream or Pa_OpenDefaultStream. Multiple flags may be
; ORed together.
	paNoFlag: 0
	paClipOff:        00000001h ;Disable default clipping of out of range samples.
	paDitherOff:      00000002h ;Disable default dithering.
	paNeverDropInput: 00000004h ;Flag requests that where possible a full duplex stream will not discard
                                ;overflowed input samples without calling the stream callback. This flag is
                                ;only valid for full duplex callback streams and only when used in combination
                                ;with the paFramesPerBufferUnspecified (0) framesPerBuffer parameter. Using
                                ;this flag incorrectly results in a paInvalidFlag error being returned from
                                ;Pa_OpenStream and Pa_OpenDefaultStream.
    paPrimeOutputBuffersUsingStreamCallback: 00000008h
                                ;Call the stream callback to fill initial output buffers, rather than the
                                ;default behavior of priming the buffers with zeros (silence). This flag has
                                ;no effect for input-only and blocking read/write streams.
    paPlatformSpecificFlags: FFFF0000h ;A mask specifying the platform specific bits.
]

PaDeviceInfo!: alias struct! [
    structVersion [integer!] ;this is struct version 2
    name [c-string!]
    hostApi [PaHostApiIndex!] ;note this is a host API index, not a type id
    
    maxInputChannels  [integer!]
    maxOutputChannels [integer!]

    pad [integer!] ;@@ this is not in c heaer source file:/

    ; Default latency values for interactive performance.
    defaultLowInputLatency   [PaTime!]
    defaultLowOutputLatency  [PaTime!]
    ; Default latency values for robust non-interactive applications (eg. playing sound files).
    defaultHighInputLatency  [PaTime!]
    defaultHighOutputLatency [PaTime!]

    defaultSampleRate [float!]
]

PaStreamInfo!: alias struct! [
    structVersion [integer!] ;this is struct version 1

    pad [integer!]
    
    inputLatency [PaTime!]
    ; The input latency of the stream in seconds. This value provides the most
    ; accurate estimate of input latency available to the implementation. It may
    ; differ significantly from the suggestedLatency value passed to Pa_OpenStream().
    ; The value of this field will be zero (0.) for output-only streams.
    
    outputLatency [PaTime!]
    ; The output latency of the stream in seconds. This value provides the most
    ; accurate estimate of output latency available to the implementation. It may
    ; differ significantly from the suggestedLatency value passed to Pa_OpenStream().
    ; The value of this field will be zero (0.) for input-only streams.
    
    sampleRate [float!]
    ; The sample rate of the stream in Hertz (samples per second). In cases
    ; where the hardware sample rate is inaccurate and PortAudio is aware of it,
    ; the value of this field may be different from the sampleRate parameter
    ; passed to Pa_OpenStream(). If information about the actual hardware sample
    ; rate is not available, this field will have the same value as the sampleRate
    ; parameter passed to Pa_OpenStream().
]


PaStreamParameters!: alias struct! [
	device [PaDeviceIndex!]
    ; A valid device index in the range 0 to (Pa_GetDeviceCount()-1)
    ; specifying the device to be used or the special constant
    ; paUseHostApiSpecificDeviceSpecification which indicates that the actual
    ; device(s) to use are specified in hostApiSpecificStreamInfo.
    ; This field must not be set to paNoDevice.

    channelCount [integer!]
    ; The number of channels of sound to be delivered to the
    ; stream callback or accessed by Pa_ReadStream() or Pa_WriteStream().
    ; It can range from 1 to the value of maxInputChannels in the
    ; PaDeviceInfo record for the device specified by the device parameter.
    
    sampleFormat [PaSampleFormat!]
    ; The sample format of the buffer provided to the stream callback,
    ; a_ReadStream() or Pa_WriteStream(). It may be any of the formats described
    ; by the PaSampleFormat enumeration.

    pad [integer!]
    
    suggestedLatency [PaTime!]
    ; The desired latency in seconds. Where practical, implementations should
    ; configure their latency based on these parameters, otherwise they may
    ; choose the closest viable latency instead. Unless the suggested latency
    ; is greater than the absolute upper limit for the device implementations
    ; should round the suggestedLatency up to the next practical value - ie to
    ; provide an equal or higher latency than suggestedLatency wherever possible.
    ; Actual latency values for an open stream may be retrieved using the
    ; inputLatency and outputLatency fields of the PaStreamInfo structure
    ; returned by Pa_GetStreamInfo().

    hostApiSpecificStreamInfo [int-ptr!]
    ; An optional pointer to a host api specific data structure
    ; containing additional information for device setup and/or stream processing.
    ; hostApiSpecificStreamInfo is never required for correct operation,
    ; if not used it should be set to NULL.
]


#define paFramesPerBufferUnspecified 0 ;Can be passed as the framesPerBuffer parameter to Pa_OpenStream()
                                       ; or Pa_OpenDefaultStream() to indicate that the stream callback will
                                       ; accept buffers of any size.


PaStreamCallbackTimeInfo!: alias struct! [
; Timing information for the buffers passed to the stream callback.
; Time values are expressed in seconds and are synchronised with the time base used by Pa_GetStreamTime() for the associated stream.
    inputBufferAdcTime  [PaTime!] ;The time when the first sample of the input buffer was captured at the ADC input
    currentTime         [PaTime!] ;The time when the stream callback was invoked
    outputBufferDacTime [PaTime!] ;The time when the first sample of the output buffer will output the DAC
]

#enum PaStreamCallbackFlags! [
; Flag bit constants for the statusFlags to PaStreamCallback.
	paInputUnderflow: 00000001h
	; In a stream opened with paFramesPerBufferUnspecified, indicates that
	; input data is all silence (zeros) because no real data is available. In a
	; stream opened without paFramesPerBufferUnspecified, it indicates that one or
	; more zero samples have been inserted into the input buffer to compensate
	; for an input underflow.

	paInputOverflow:  00000002h
	; In a stream opened with paFramesPerBufferUnspecified, indicates that data
	; prior to the first sample of the input buffer was discarded due to an
	; overflow, possibly because the stream callback is using too much CPU time.
	; Otherwise indicates that data prior to one or more samples in the
	; input buffer was discarded.

	paOutputUnderflow: 00000004h
	; Indicates that output data (or a gap) was inserted, possibly because the
	; stream callback is using too much CPU time.

	paOutputOverflow: 00000008h
	; Indicates that output data will be discarded because no room is available.

	paPrimingOutput: 00000010h
	; Some of all of the output data will be used to prime the stream, input
	; data may be zero.
]

#enum PaStreamCallbackResult! [
; Allowable return values for the PaStreamCallback.
    paContinue: 0 ;Signal that the stream should continue invoking the callback and processing audio.
    paComplete: 1 ;Signal that the stream should stop invoking the callback and finish once all output samples have played.
    paAbort:    2 ;Signal that the stream should stop invoking the callback and finish as soon as possible.
]

#define PaStreamCallback! [
	function! [
		; Functions of type PaStreamCallback are implemented by PortAudio clients.
		; They consume, process or generate audio in response to requests from an
		; active PortAudio stream.
		;
		; When a stream is running, PortAudio calls the stream callback periodically.
		; The callback function is responsible for processing buffers of audio samples 
		; passed via the input and output parameters.
		;
		; The PortAudio stream callback runs at very high or real-time priority.
		; It is required to consistently meet its time deadlines. Do not allocate 
		; memory, access the file system, call library functions or call other functions 
		; from the stream callback that may block or take an unpredictable amount of
		; time to complete.
		;
		; In order for a stream to maintain glitch-free operation the callback
		; must consume and return audio data faster than it is recorded and/or
		; played. PortAudio anticipates that each callback invocation may execute for 
		; a duration approaching the duration of frameCount audio frames at the stream 
		; sample rate. It is reasonable to expect to be able to utilise 70% or more of
		; the available CPU time in the PortAudio callback. However, due to buffer size 
		; adaption and other factors, not all host APIs are able to guarantee audio 
		; stability under heavy CPU load with arbitrary fixed callback buffer sizes. 
		; When high callback CPU utilisation is required the most robust behavior 
		; can be achieved by using paFramesPerBufferUnspecified as the 
		; Pa_OpenStream() framesPerBuffer parameter.

		input  [int-ptr!]
		output [int-ptr!]
		; @param input and @param output are either arrays of interleaved samples or;
		; if non-interleaved samples were requested using the paNonInterleaved sample 
		; format flag, an array of buffer pointers, one non-interleaved buffer for 
		; each channel.
		;
		; The format, packing and number of channels used by the buffers are
		; determined by parameters to Pa_OpenStream().

		frameCount [integer!]
		; The number of sample frames to be processed by the stream callback.

		timeInfo [PaStreamCallbackTimeInfo!]
		; @param timeInfo Timestamps indicating the ADC capture time of the first sample
		; in the input buffer, the DAC output time of the first sample in the output buffer
		; and the time the callback was invoked. 

		statusFlags [PaStreamCallbackFlags!]
		; @param statusFlags Flags indicating whether input and/or output buffers
		; have been inserted or will be dropped to overcome underflow or overflow
		; conditions.

		userData [byte-ptr!]
		; @param userData The value of a user supplied pointer passed to
		; Pa_OpenStream() intended for storing synthesis data etc.

		return: [integer!]
		; The stream callback should return one of the values in the
		; PaStreamCallbackResult! enumeration. To ensure that the callback continues
		; to be called, it should return paContinue (0). Either paComplete or paAbort
		; can be returned to finish stream processing, after either of these values is
		; returned the callback will not be called again. If paAbort is returned the
		; stream will finish as soon as possible. If paComplete is returned, the stream
		; will continue until all buffers generated by the callback have been played.
		; This may be useful in applications such as soundfile players where a specific
		; duration of output is required. However, it is not necessary to utilize this
		; mechanism as Pa_StopStream(), Pa_AbortStream() or Pa_CloseStream() can also
		; be used to stop the stream. The callback must always fill the entire output
		; buffer irrespective of its return value.
	]
	; @note With the exception of Pa_GetStreamCpuLoad() it is not permissible to call
	; PortAudio API functions from within the stream callback.
]

#define PaStreamFinishedCallback! [
	function! [
		; Functions of type PaStreamFinishedCallback are implemented by PortAudio 
		; clients. They can be registered with a stream using the Pa_SetStreamFinishedCallback
		; function. Once registered they are called when the stream becomes inactive
		; (ie once a call to Pa_StopStream() will not block).
		; A stream will become inactive after the stream callback returns non-zero,
		; or when Pa_StopStream or Pa_AbortStream is called. For a stream providing audio
		; output, if the stream callback returns paComplete, or Pa_StopStream() is called,
		; the stream finished callback will not be called until all generated sample data
		; has been played.
		userData [byte-ptr!] ;The userData parameter supplied to Pa_OpenStream()
	]
]


#import [
	PORTAUDIO_LIBRARY cdecl [
		Pa_GetVersion: "Pa_GetVersion"[
			; Retrieve the release number of the currently running PortAudio build.
 			; For example, for version "19.5.1" this will return 0x00130501.
			return:  [integer!]
		]
		Pa_GetVersionText: "Pa_GetVersionText" [
			return: [c-string!]
		]
		Pa_GetVersionInfo: "Pa_GetVersionInfo" [
			return: [PaVersionInfo!]
		]
		Pa_GetErrorText: "Pa_GetErrorText" [
			; Translate the supplied PortAudio error code into a human readable message.
			errorCode [PaErrorCode!]
			return: [c-string!]
		]
		Pa_Initialize: "Pa_Initialize" [
			; Library initialization function - call this before using PortAudio.
			; This function initializes internal data structures and prepares underlying
			; host APIs for use.  With the exception of Pa_GetVersion(), Pa_GetVersionText(),
			; and Pa_GetErrorText(), this function MUST be called before using any other
			; PortAudio API functions.
			;
			; If Pa_Initialize() is called multiple times, each successful 
			; call must be matched with a corresponding call to Pa_Terminate(). 
			; Pairs of calls to Pa_Initialize()/Pa_Terminate() may overlap, and are not 
			; required to be fully nested.
			;
			; Note that if Pa_Initialize() returns an error code, Pa_Terminate() should
			; NOT be called.
			;
			; @return paNoError if successful, otherwise an error code indicating the cause
			; of failure.
			return: [PaError!]
		]
		Pa_Terminate: "Pa_Terminate" [
			; Library termination function - call this when finished using PortAudio.
			; This function deallocates all resources allocated by PortAudio since it was
			; initialized by a call to Pa_Initialize(). In cases where Pa_Initialise() has
			; been called multiple times, each call must be matched with a corresponding call
			; to Pa_Terminate(). The final matching call to Pa_Terminate() will automatically
			; close any PortAudio streams that are still open.
			;
			; Pa_Terminate() MUST be called before exiting a program which uses PortAudio.
			; Failure to do so may result in serious resource leaks, such as audio devices
			; not being available until the next reboot.
			;
			; @return paNoError if successful, otherwise an error code indicating the cause
			; of failure.
			return: [PaError!]
		]
		Pa_GetHostApiCount: "Pa_GetHostApiCount" [
			; Retrieve the number of available host APIs. Even if a host API is
			; available it may have no devices available.
			;
			; @return A non-negative value indicating the number of available host APIs
			; or, a PaErrorCode (which are always negative) if PortAudio is not initialized
			; or an error is encountered.
			return: [integer!]
		]
		Pa_GetDefaultHostApi: "Pa_GetDefaultHostApi" [
			; Retrieve the index of the default host API. The default host API will be
			; the lowest common denominator host API on the current platform and is
			; unlikely to provide the best performance.
			;
			; @return A non-negative value ranging from 0 to (Pa_GetHostApiCount()-1)
			; indicating the default host API index or, a PaErrorCode (which are always
			; negative) if PortAudio is not initialized or an error is encountered.
			return: [integer!]
		]
		Pa_GetHostApiInfo: "Pa_GetHostApiInfo" [
			; Retrieve a pointer to a structure containing information about a specific
			; host Api.
			;
			; @param hostApi A valid host API index ranging from 0 to (Pa_GetHostApiCount()-1)
			;
			; @return A pointer to an immutable PaHostApiInfo structure describing
			; a specific host API. If the hostApi parameter is out of range or an error
			; is encountered, the function returns NULL.
			;
			; The returned structure is owned by the PortAudio implementation and must not
			; be manipulated or freed. The pointer is only guaranteed to be valid between
			; calls to Pa_Initialize() and Pa_Terminate().
			hostApi [PaHostApiIndex!]
			return: [PaHostApiInfo!]
		]
		Pa_HostApiTypeIdToHostApiIndex: "Pa_HostApiTypeIdToHostApiIndex" [
			; Convert a static host API unique identifier, into a runtime
			; host API index.
			;
			; @param type A unique host API identifier belonging to the PaHostApiTypeId
			; enumeration.
			;
			; @return A valid PaHostApiIndex ranging from 0 to (Pa_GetHostApiCount()-1) or,
			; a PaErrorCode (which are always negative) if PortAudio is not initialized
			; or an error is encountered.
			; 
			; The paHostApiNotFound error code indicates that the host API specified by the
			; type parameter is not available
			type [PaHostApiTypeId!]
			return: [PaHostApiIndex!]
		]
		Pa_HostApiDeviceIndexToDeviceIndex: "Pa_HostApiDeviceIndexToDeviceIndex" [
			; Convert a host-API-specific device index to standard PortAudio device index.
			; This function may be used in conjunction with the deviceCount field of
			; PaHostApiInfo to enumerate all devices for the specified host API.
			;
			; @param hostApi A valid host API index ranging from 0 to (Pa_GetHostApiCount()-1)
			;
			; @param hostApiDeviceIndex A valid per-host device index in the range
			; 0 to (Pa_GetHostApiInfo(hostApi)->deviceCount-1)
			;
			; @return A non-negative PaDeviceIndex ranging from 0 to (Pa_GetDeviceCount()-1)
			; or, a PaErrorCode (which are always negative) if PortAudio is not initialized
			; or an error is encountered.
			;
			; A paInvalidHostApi error code indicates that the host API index specified by
			; the hostApi parameter is out of range.
			;
			; A paInvalidDevice error code indicates that the hostApiDeviceIndex parameter
			; is out of range.
			hostApi [PaHostApiIndex!]
			hostApiDeviceIndex [integer!]
			return: [PaDeviceIndex!]
		]
		Pa_GetLastHostErrorInfo: "Pa_GetLastHostErrorInfo" [
			; Return information about the last host error encountered. The error
			; information returned by Pa_GetLastHostErrorInfo() will never be modified
			; asynchronously by errors occurring in other PortAudio owned threads
			; (such as the thread that manages the stream callback.)
			;
			; This function is provided as a last resort, primarily to enhance debugging
			; by providing clients with access to all available error information.
			;
			; @return A pointer to an immutable structure constraining information about
			; the host error. The values in this structure will only be valid if a
			; PortAudio function has previously returned the paUnanticipatedHostError
			; error code.
			return: [PaHostErrorInfo!]
		]

		;-- Device enumeration and capabilities  --;

		Pa_GetDeviceCount: "Pa_GetDeviceCount" [
			; Retrieve the number of available devices. The number of available devices
			; may be zero.			;
			;
			; @return A non-negative value indicating the number of available devices or,			;
			; a PaErrorCode (which are always negative) if PortAudio is not initialized
			; or an error is encountered.
			return: [PaDeviceIndex!]
		]
		Pa_GetDefaultInputDevice: "Pa_GetDefaultInputDevice" [
			; Retrieve the index of the default input device. The result can be
			; used in the inputDevice parameter to Pa_OpenStream().			;
			;
			; @return The default input device index for the default host API, or paNoDevice
			; if no default input device is available or an error was encountered.
			return: [PaDeviceIndex!]
		]
		Pa_GetDefaultOutputDevice: "Pa_GetDefaultOutputDevice" [
			; Retrieve the index of the default output device. The result can be
			; used in the outputDevice parameter to Pa_OpenStream().
			;
			; @return The default output device index for the default host API, or paNoDevice
			; if no default output device is available or an error was encountered.
			;
			; @note
			; On the PC, the user can specify a default device by
			; setting an environment variable. For example, to use device #1.
			;<pre>
			; set PA_RECOMMENDED_OUTPUT_DEVICE=1
			;</pre>
			; The user should first determine the available device ids by using
			; the supplied application "pa_devs".
			return: [PaDeviceIndex!]
		]
		Pa_GetDeviceInfo: "Pa_GetDeviceInfo" [
			; Retrieve a pointer to a PaDeviceInfo structure containing information
			; about the specified device.
			; @return A pointer to an immutable PaDeviceInfo structure. If the device
			; parameter is out of range the function returns NULL.
			;
			; @param device A valid device index in the range 0 to (Pa_GetDeviceCount()-1)
			;
			; @note PortAudio manages the memory referenced by the returned pointer,
			; the client must not manipulate or free the memory. The pointer is only
			; guaranteed to be valid between calls to Pa_Initialize() and Pa_Terminate().
			device [PaDeviceIndex!]
			return: [PaDeviceInfo!]
		]
		Pa_IsFormatSupported: "Pa_IsFormatSupported" [
			; Determine whether it would be possible to open a stream with the specified
			; parameters.
			;
			; @param inputParameters A structure that describes the input parameters used to
			; open a stream. The suggestedLatency field is ignored. See PaStreamParameters
			; for a description of these parameters. inputParameters must be NULL for
			; output-only streams.
			;
			; @param outputParameters A structure that describes the output parameters used
			; to open a stream. The suggestedLatency field is ignored. See PaStreamParameters
			; for a description of these parameters. outputParameters must be NULL for
			; input-only streams.
			;
			; @param sampleRate The required sampleRate. For full-duplex streams it is the
			; sample rate for both input and output
			;
			; @return Returns 0 if the format is supported, and an error code indicating why
			; the format is not supported otherwise. The constant paFormatIsSupported is
			; provided to compare with the return value for success.
			inputParameters  [PaStreamParameters!]
			outputParameters [PaStreamParameters!]
			sampleRate       [float!]
		]

		;-- Streaming types and functions --;

		Pa_OpenStream: "Pa_OpenStream" [
			; Opens a stream for either input, output or both.
			stream [PaStream-ptr!]
			; @param stream The address of a PaStream pointer which will receive
			; a pointer to the newly opened stream.
            inputParameters  [PaStreamParameters!]
			; @param inputParameters A structure that describes the input parameters used by
			; the opened stream. See PaStreamParameters for a description of these parameters.
			; inputParameters must be NULL for output-only streams.
            outputParameters [PaStreamParameters!]
			; @param outputParameters A structure that describes the output parameters used by
			; the opened stream. See PaStreamParameters for a description of these parameters.
			; outputParameters must be NULL for input-only streams.
            sampleRate       [float!]
			; @param sampleRate The desired sampleRate. For full-duplex streams it is the
			; sample rate for both input and output
            framesPerBuffer  [integer!]
			; @param framesPerBuffer The number of frames passed to the stream callback
			; function, or the preferred block granularity for a blocking read/write stream.
			; The special value paFramesPerBufferUnspecified (0) may be used to request that
			; the stream callback will receive an optimal (and possibly varying) number of
			; frames based on host requirements and the requested latency settings.
			; Note: With some host APIs, the use of non-zero framesPerBuffer for a callback
			; stream may introduce an additional layer of buffering which could introduce
			; additional latency. PortAudio guarantees that the additional latency
			; will be kept to the theoretical minimum however, it is strongly recommended
			; that a non-zero framesPerBuffer value only be used when your algorithm
			; requires a fixed number of frames per stream callback.
            streamFlags      [PaStreamFlags!]
			; @param streamFlags Flags which modify the behavior of the streaming process.
			; This parameter may contain a combination of flags ORed together. Some flags may
			; only be relevant to certain buffer formats.
            streamCallback   [PaStreamCallback!]
			; @param streamCallback A pointer to a client supplied function that is responsible
			; for processing and filling input and output buffers. If this parameter is NULL
			; the stream will be opened in 'blocking read/write' mode. In blocking mode,
			; the client can receive sample data using Pa_ReadStream and write sample data
			; using Pa_WriteStream, the number of samples that may be read or written
			; without blocking is returned by Pa_GetStreamReadAvailable and
			; Pa_GetStreamWriteAvailable respectively.            
            userData         [byte-ptr!]
			; @param userData A client supplied pointer which is passed to the stream callback
			; function. It could for example, contain a pointer to instance data necessary
			; for processing the audio buffers. This parameter is ignored if streamCallback
			; is NULL.
            return: [PaError!]
			; Upon success Pa_OpenStream() returns paNoError and places a pointer to a
			; valid PaStream in the stream argument. The stream is inactive (stopped).
			; If a call to Pa_OpenStream() fails, a non-zero error code is returned (see
			; PaError for possible error codes) and the value of stream is invalid.            
        ]
        Pa_OpenDefaultStream: "Pa_OpenDefaultStream" [
			; A simplified version of Pa_OpenStream() that opens the default input
			; and/or output devices.
			stream [PaStream-ptr!]
			; @param stream The address of a PaStream pointer which will receive
			; a pointer to the newly opened stream.
            numInputChannels  [integer!]
			; @param numInputChannels  The number of channels of sound that will be supplied
			; to the stream callback or returned by Pa_ReadStream. It can range from 1 to
			; the value of maxInputChannels in the PaDeviceInfo record for the default input
			; device. If 0 the stream is opened as an output-only stream.
            numOutputChannels [integer!]
			; @param numOutputChannels The number of channels of sound to be delivered to the
			; stream callback or passed to Pa_WriteStream. It can range from 1 to the value
			; of maxOutputChannels in the PaDeviceInfo record for the default output device.
			; If 0 the stream is opened as an output-only stream.
			sampleFormat [PaSampleFormat!]
			; @param sampleFormat The sample format of both the input and output buffers
			; provided to the callback or passed to and from Pa_ReadStream and Pa_WriteStream.
			; sampleFormat may be any of the formats described by the PaSampleFormat
			; enumeration.
            sampleRate       [float!]
            framesPerBuffer  [integer!]
            streamCallback   [PaStreamCallback!]       
            userData         [byte-ptr!]
            return: [PaError!]         
        ]
        Pa_CloseStream: "Pa_CloseStream" [
			; Closes an audio stream. If the audio stream is active it
			; discards any pending buffers as if Pa_AbortStream() had been called.
        	stream [PaStream!]
        	return: [PaError!]
        ]
        Pa_SetStreamFinishedCallback: "Pa_SetStreamFinishedCallback" [
			; Register a stream finished callback function which will be called when the 
			; stream becomes inactive. See the description of PaStreamFinishedCallback for 
			; further details about when the callback will be called.
        	stream [PaStream!]
			; @param stream a pointer to a PaStream that is in the stopped state - if the
			; stream is not stopped, the stream's finished callback will remain unchanged 
			; and an error code will be returned.
        	streamFinishedCallback [PaStreamFinishedCallback!]
			; @param streamFinishedCallback a pointer to a function with the same signature
			; as PaStreamFinishedCallback, that will be called when the stream becomes
			; inactive. Passing NULL for this parameter will un-register a previously
			; registered stream finished callback function.
			return: [PaError!]
        ]
        Pa_StartStream: "Pa_StartStream" [
        	; Commences audio processing.
        	stream [PaStream!]
        	return: [PaError!]
        ]
        Pa_StopStream: "Pa_StopStream" [
			; Terminates audio processing. It waits until all pending
			; audio buffers have been played before it returns.
        	stream [PaStream!]
        	return: [PaError!]
        ]
        Pa_AbortStream: "Pa_AbortStream" [
			; Terminates audio processing immediately without waiting for pending
			; buffers to complete.
        	stream [PaStream!]
        	return: [PaError!]
        ]
        Pa_IsStreamStopped: "Pa_IsStreamStopped" [
			; Determine whether the stream is stopped.
			; A stream is considered to be stopped prior to a successful call to
			; Pa_StartStream and after a successful call to Pa_StopStream or Pa_AbortStream.
			; If a stream callback returns a value other than paContinue the stream is NOT
			; considered to be stopped.
			stream [PaStream!]
        	return: [PaError!]
			; @return Returns one (1) when the stream is stopped, zero (0) when
			; the stream is running or, a PaErrorCode (which are always negative) if
			; PortAudio is not initialized or an error is encountered.
        ]
        Pa_IsStreamActive: "Pa_IsStreamActive" [
			; Determine whether the stream is active.
			; A stream is active after a successful call to Pa_StartStream(), until it
			; becomes inactive either as a result of a call to Pa_StopStream() or
			; Pa_AbortStream(), or as a result of a return value other than paContinue from
			; the stream callback. In the latter case, the stream is considered inactive
			; after the last buffer has finished playing.
			stream [PaStream!]
        	return: [PaError!]
			; @return Returns one (1) when the stream is active (ie playing or recording
			; audio), zero (0) when not playing or, a PaErrorCode (which are always negative)
			; if PortAudio is not initialized or an error is encountered.
        ]
        Pa_GetStreamInfo: "Pa_GetStreamInfo" [
			; Retrieve a pointer to a PaStreamInfo structure containing information
			; about the specified stream.
			stream [PaStream!]
        	return: [PaStreamInfo!]
			; @note PortAudio manages the memory referenced by the returned pointer,
			; the client must not manipulate or free the memory. The pointer is only
			; guaranteed to be valid until the specified stream is closed.
        ]
        Pa_GetStreamTime: "Pa_GetStreamTime" [
			; Returns the current time in seconds for a stream according to the same clock used
			; to generate callback PaStreamCallbackTimeInfo timestamps. The time values are
			; monotonically increasing and have unspecified origin. 
			; 
			; Pa_GetStreamTime returns valid time values for the entire life of the stream,
			; from when the stream is opened until it is closed. Starting and stopping the stream
			; does not affect the passage of time returned by Pa_GetStreamTime.
			;
			; This time may be used for synchronizing other events to the audio stream, for 
			; example synchronizing audio to MIDI.
			stream [PaStream!]
        	return: [PaTime!] ;The stream's current time in seconds, or 0 if an error occurred.
        ]
        Pa_GetStreamCpuLoad: "Pa_GetStreamCpuLoad" [
			; Retrieve CPU usage information for the specified stream.
			; The "CPU Load" is a fraction of total CPU time consumed by a callback stream's
			; audio processing routines including, but not limited to the client supplied
			; stream callback. This function does not work with blocking read/write streams.
			;
			; This function may be called from the stream callback function or the
			; application.
			stream [PaStream!]
        	return: [float!]
			; A floating point value, typically between 0.0 and 1.0, where 1.0 indicates
			; that the stream callback is consuming the maximum number of CPU cycles possible
			; to maintain real-time operation. A value of 0.5 would imply that PortAudio and
			; the stream callback was consuming roughly 50% of the available CPU time. The
			; return value may exceed 1.0. A value of 0.0 will always be returned for a
			; blocking read/write stream, or if an error occurs.
        ]
        Pa_ReadStream: "Pa_ReadStream" [
			; Read samples from an input stream. The function doesn't return until
			; the entire buffer has been filled - this may involve waiting for the operating
			; system to supply the data.
			stream [PaStream!]
			buffer [byte-ptr!]
			; @param buffer A pointer to a buffer of sample frames. The buffer contains
			; samples in the format specified by the inputParameters->sampleFormat field
			; used to open the stream, and the number of channels specified by
			; inputParameters->numChannels. If non-interleaved samples were requested using
			; the paNonInterleaved sample format flag, buffer is a pointer to the first element 
			; of an array of buffer pointers, one non-interleaved buffer for each channel.
			frames [integer!]
			; @param frames The number of frames to be read into buffer. This parameter
			; is not constrained to a specific range, however high performance applications
			; will want to match this parameter to the framesPerBuffer parameter used
			; when opening the stream.
			return: [PaError!]
			; @return On success PaNoError will be returned, or PaInputOverflowed if input
			; data was discarded by PortAudio after the previous call and before this call.
        ]
        Pa_WriteStream: "Pa_WriteStream" [
			; Write samples to an output stream. This function doesn't return until the
			; entire buffer has been written - this may involve waiting for the operating
			; system to consume the data.
			stream [PaStream!]
			buffer [byte-ptr!]
			; @param buffer A pointer to a buffer of sample frames. The buffer contains
			; samples in the format specified by the outputParameters->sampleFormat field
			; used to open the stream, and the number of channels specified by
			; outputParameters->numChannels. If non-interleaved samples were requested using
			; the paNonInterleaved sample format flag, buffer is a pointer to the first element 
			; of an array of buffer pointers, one non-interleaved buffer for each channel.
			frames [integer!]
			; @param frames The number of frames to be written from buffer. This parameter
			; is not constrained to a specific range, however high performance applications
			; will want to match this parameter to the framesPerBuffer parameter used
			; when opening the stream.
			return: [PaError!]
			; @return On success PaNoError will be returned, or paOutputUnderflowed if
			; additional output data was inserted after the previous call and before this
			; call.
        ]
        Pa_GetStreamReadAvailable: "Pa_GetStreamReadAvailable" [
			; Retrieve the number of frames that can be read from the stream without
			; waiting.
			stream [PaStream!]
			return: [integer!]
			; @return Returns a non-negative value representing the maximum number of frames
			; that can be read from the stream without blocking or busy waiting or, a
			; PaErrorCode (which are always negative) if PortAudio is not initialized or an
			; error is encountered.
        ]
        Pa_GetStreamWriteAvailable: "Pa_GetStreamWriteAvailable" [
			; Retrieve the number of frames that can be written from the stream without
			; waiting.
			stream [PaStream!]
			return: [integer!]
			; @return Returns a non-negative value representing the maximum number of frames
			; that can be read from the stream without blocking or busy waiting or, a
			; PaErrorCode (which are always negative) if PortAudio is not initialized or an
			; error is encountered.
        ]

        ;-- Miscellaneous utilities --;

        Pa_GetSampleSize: "Pa_GetSampleSize" [
        	; Retrieve the size of a given sample format in bytes.
        	format [PaSampleFormat!]
        	return: [PaError!]
			; @return The size in bytes of a single sample in the specified format,
			; or paSampleFormatNotSupported if the format is not supported.
        ]
        Pa_Sleep: "Pa_Sleep" [
			; Put the caller to sleep for at least 'msec' milliseconds. This function is
			; provided only as a convenience for authors of portable code (such as the tests
			; and examples in the PortAudio distribution.)
			;
			; The function may sleep longer than requested so don't rely on this for accurate
			; musical timing.
			msec [integer!]
        ]
    ]
]
