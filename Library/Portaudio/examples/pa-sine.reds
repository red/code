Red/System [
	Title:   "Red/System Portaudio play sine wave example"
    Purpose: "Play a sine wave for several seconds."
	Author:  "Oldes"
	File: 	 %pa-sine.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
    Comment: {
    This code is port of original work:
        @file paex_sine.c
        @ingroup examples_src
        @brief Play a sine wave for several seconds.
        @author Ross Bencina <rossb@audiomulch.com>
        @author Phil Burk <philburk@softsynth.com>
    }
]

#define NUM_SECONDS         5
#define SAMPLE_RATE         44100
#define FRAMES_PER_BUFFER   64
#define TABLE_SIZE 200

#include %../portaudio.reds

if paNoError <> Pa_Initialize [
    "Portaudio failed to initialize!"
    quit -1
]

onError: func[err [integer!]][
    print-line ["Portaudio ERROR[" err "]: " Pa_GetErrorText err]
    Pa_Terminate
    quit -1
]

precountSineTable: func[
    size [integer!] amp [float!]
    return: [pointer! [float32!]]
    /local data n ts
][
    ts: as float! size
    data: as pointer! [float32!] allocate size * 32
    n: 0
    while [n < size][
        data/n: as float32! sin (((as float! n) / ts) * pi * amp)
        n: n + 1
    ]
    data
]

stereoData!: alias struct! [
    left  [float32!]
    right [float32!]
]

testData!: alias struct! [
    sine [pointer! [float32!]]
    phase-left  [integer!]
    phase-right [integer!]
    message [c-string!]
]

paTestCallback: func[[cdecl]
    inputBuffer  [int-ptr!]
    outputBuffer [int-ptr!]
    frameCount [integer!]
    timeInfo [PaStreamCallbackTimeInfo!]
    statusFlags [PaStreamCallbackFlags!]
    userData [byte-ptr!]
    return: [integer!]
    /local data out i sine pl pr
][
    data: as testData! userData
    out: as pointer! [float32!] outputBuffer
    sine: data/sine
    i: 0
    pl: data/phase-left
    pr: data/phase-right
    while [i < frameCount][
        out/1: sine/pl
        out/2: sine/pr
        pl: pl + 1
        pr: pr + 3
        if pl >= TABLE_SIZE [ pl: pl - TABLE_SIZE ]
        if pr >= TABLE_SIZE [ pr: pr - TABLE_SIZE ]
        out: out + 2
        i: i + 1
    ]
    data/phase-left: pl
    data/phase-right: pr
    paContinue
]

StreamFinished: func[[cdecl]
    userData [byte-ptr!]
    /local data
][
    data: as testData! userData
    print-line ["Stream finished with message: " data/message]
]

playSound: func[
    /local 
        userData
        outputParameters [PaStreamParameters!]
        err
        stream-ref stream streamInfo
][
    userData: as testData! allocate size? testData!
    userData/sine: precountSineTable TABLE_SIZE 2.0
    userData/phase-left: 0
    userData/phase-right: 0
    userData/message: "Hello"
    
    outputParameters: declare PaStreamParameters!
    outputParameters/device: Pa_GetDefaultOutputDevice
    if outputParameters/device = paNoDevice [
        print-line "Error: No default output device."
        onError outputParameters/device
    ]
    print-line ["device: " outputParameters/device]
    outputParameters/channelCount:     2  ;stereo output
    outputParameters/sampleFormat:     paFloat32 ;32 bit floating point output
    outputParameters/suggestedLatency: 0.050 ;Pa_GetDeviceInfo( outputParameters.device )->defaultLowOutputLatency;
    outputParameters/hostApiSpecificStreamInfo: null
    stream-ref: declare PaStream-ptr!

    err: Pa_OpenStream
              stream-ref
              NULL ;no input
              outputParameters
              as float! SAMPLE_RATE
              FRAMES_PER_BUFFER
              paClipOff      ;we won't output out of range samples so don't bother clipping them
              :paTestCallback
              as byte-ptr! userData
    if err <> paNoError [ onError err ]

    stream: stream-ref/value
    print-line ["stream: " stream]

    err: Pa_SetStreamFinishedCallback stream :StreamFinished
    if err <> paNoError [ onError err ]

    err: Pa_StartStream stream
    if err <> paNoError [ onError err ]

    
    print-line ["Play for " NUM_SECONDS " seconds."]
    Pa_Sleep NUM_SECONDS * 1000

    err: Pa_StopStream stream
    if err <> paNoError [ onError err ]

    err: Pa_CloseStream stream
    if err <> paNoError [ onError err ]

]

playSound

Pa_Terminate
