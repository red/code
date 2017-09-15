Red/System [
	Title:   "Red/System Portaudio record input example"
    Purpose: "Record input into an array; Save array to a file; Playback recorded data."
	Author:  "Oldes"
	File: 	 %pa-record.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
    Comment: {
    This code is based on original work:
        @file paex_record.c
        @ingroup examples_src
        @brief Record input into an array; Save array to a file; Playback recorded data.
        @author Phil Burk  http://www.softsynth.com
    }
]

#define NUM_SECONDS         5
#define NUM_CHANNELS        2
#define SAMPLE_RATE         44100
#define FRAMES_PER_BUFFER   512

#include %../portaudio.reds
#include %../../Stream-IO/simple-io-minimal.reds

if paNoError <> Pa_Initialize [
    "Portaudio failed to initialize!"
    quit -1
]

onError: func[err [integer!]][
    print-line ["Portaudio ERROR[" err "]: " Pa_GetErrorText err]
    Pa_Terminate
    quit -1
]

recordData!: alias struct! [
    buffer    [pointer! [float32!]]
    index     [integer!]
    maxFrames [integer!]
]

recordCallback: func[[cdecl]
    inputBuffer  [int-ptr!]
    outputBuffer [int-ptr!]
    frameCount [integer!]
    timeInfo [PaStreamCallbackTimeInfo!]
    statusFlags [PaStreamCallbackFlags!]
    userData [byte-ptr!]
    return: [integer!]
    /local data in i p framesLeft framesToCalc finished?
][
    data: as recordData! userData
    in:  as pointer! [float32!] inputBuffer
    framesLeft: data/maxFrames - data/index

    either framesLeft < frameCount [
        framesToCalc: framesLeft
        finished?: paComplete
    ][
        framesToCalc: frameCount
        finished?: paContinue
    ]

    i: 0
    p: data/buffer + (data/index * NUM_CHANNELS)
    either in = NULL [
        print-line "null in"
        while [i  < framesToCalc][
            p/1: as float32! 0.0
            either NUM_CHANNELS = 2 [
                p/2: as float32! 0.0
                p: p + 2
            ][  p: p + 1 ] 
            i: i + 1
        ]
    ][
        while [i  < framesToCalc][
            p/1: in/1
            either NUM_CHANNELS = 2 [
                p/2: in/2
                in: in + 2
                p: p + 2
            ][
                in: in + 1
                p: p + 1
            ] 
            i: i + 1
        ]
    ]
    data/index: data/index + framesToCalc
    finished?
]

playCallback: func[[cdecl]
    inputBuffer  [int-ptr!]
    outputBuffer [int-ptr!]
    frameCount [integer!]
    timeInfo [PaStreamCallbackTimeInfo!]
    statusFlags [PaStreamCallbackFlags!]
    userData [byte-ptr!]
    return: [integer!]
    /local data in out i p framesLeft framesToCalc finished?
][
    data: as recordData! userData

    out: as pointer! [float32!] outputBuffer
    framesLeft: data/maxFrames - data/index

    either framesLeft < frameCount [
        framesToCalc: framesLeft
        finished?: paComplete
    ][
        framesToCalc: frameCount
        finished?: paContinue
    ]

    p: data/buffer + (NUM_CHANNELS * data/index)

    i: 0
    while [i < framesToCalc][
        out/1: p/1
        either NUM_CHANNELS = 2 [
            out/2: p/2
            out: out + 2
            p: p + 2
        ][
            out: out + 1
            p: p + 1
        ]
        i: i + 1
    ]
    if framesToCalc < frameCount [
        while [i < frameCount][
            out/1: as float32! 0.0
            either NUM_CHANNELS = 2 [
                out/2: as float32! 0.0
                out: out + 2
            ][
                out: out + 1
            ]
            i: i + 1
        ]
    ]
    data/index: data/index + framesToCalc
    finished?
]

recordSound: func[
    /local 
        inputParameters outputParameters
        deviceInfo
        userData numSamples
        err p t
        stream-ref stream
        val average max
        file
][
    userData: as recordData! allocate size? recordData!
    userData/maxFrames: NUM_SECONDS * SAMPLE_RATE
    numSamples: userData/maxFrames * NUM_CHANNELS
    userData/buffer: as pointer! [float32!] allocate (numSamples * size? float32!)
    userData/index: 0

    p: userData/buffer
    t: p + numSamples
    while [p < t] [ p/1: as float32! 0.0 p: p + 1 ]

    inputParameters: declare PaStreamParameters!
    inputParameters/device: Pa_GetDefaultInputDevice
    if inputParameters/device = paNoDevice [
        print-line "Error: No default input device."
        onError inputParameters/device
    ]
    deviceInfo: Pa_GetDeviceInfo inputParameters/device
    inputParameters/channelCount:     NUM_CHANNELS
    inputParameters/sampleFormat:     paFloat32 ;32 bit floating point input
    inputParameters/suggestedLatency: deviceInfo/defaultLowInputLatency
    inputParameters/hostApiSpecificStreamInfo: null
    
    stream-ref: declare PaStream-ptr!

    print-line ["Device: " inputParameters/device]

    err: Pa_OpenStream
              stream-ref
              inputParameters
              NULL
              as float! SAMPLE_RATE
              FRAMES_PER_BUFFER
              paClipOff
              :recordCallback
              as byte-ptr! userData
    if err <> paNoError [ onError err ]

    stream: stream-ref/value

    err: Pa_StartStream stream
    if err <> paNoError [ onError err ]

    print-line "^/=== Now recording!! Please speak into the microphone. ===^/"

    while [all [
        1 = Pa_IsStreamActive stream
        userData/index < userData/maxFrames
    ]][
        print-line ["recorded frames: " userData/index " / " userData/maxFrames "^-= " (as float! userData/index) / (as float! userData/maxFrames)]
        Pa_Sleep 1000
    ]
    print-line "done^/"

    err: Pa_CloseStream stream
    if err <> paNoError [ onError err ]

    userData/index: 0
    p: userData/buffer
    t: p + numSamples
    average: 0.0
    max: 0.0
    while [p < t][
        val: as float! p/1
        if val < 0.0 [val: 0.0 - val] ;abs
        if val > max [max: val]
        average: average + val
        p: p + 1
    ]
    average: average / as float! numSamples

    print-line ["sample average: " average " maximum amplitude: " max]

    file: simple-io/open-file "recorded.raw" 0 false
    if file > 0 [
        simple-io/write-data file as byte-ptr! userData/buffer (numSamples * size? float32!)
        simple-io/close-file file
        print-line "Wrote data to 'recorded.raw'"
    ]

    print-line "^/=== Now playing back. ===^/"

    outputParameters: declare PaStreamParameters!
    outputParameters/device: Pa_GetDefaultOutputDevice
    if outputParameters/device = paNoDevice [
        print-line "Error: No default input device."
        onError outputParameters/device
    ]
    deviceInfo: Pa_GetDeviceInfo inputParameters/device
    outputParameters/channelCount:     NUM_CHANNELS
    outputParameters/sampleFormat:     paFloat32 ;32 bit floating point output
    outputParameters/suggestedLatency: deviceInfo/defaultLowOutputLatency
    outputParameters/hostApiSpecificStreamInfo: null

    err: Pa_OpenStream
              stream-ref
              NULL
              outputParameters
              as float! SAMPLE_RATE
              FRAMES_PER_BUFFER
              paClipOff
              :playCallback
              as byte-ptr! userData
    if err <> paNoError [ onError err ]

    stream: stream-ref/value

    err: Pa_StartStream stream
    if err <> paNoError [ onError err ]

    while [1 = Pa_IsStreamActive stream][
        print-line ["frames left: " userData/maxFrames - userData/index]
        Pa_Sleep 1000
    ]
    print-line "done"

    err: Pa_CloseStream stream
    if err <> paNoError [ onError err ]

    free as byte-ptr! userData/buffer
    free as byte-ptr! userData
]

recordSound

Pa_Terminate
