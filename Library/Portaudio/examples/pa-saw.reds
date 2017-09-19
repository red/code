Red/System [
	Title:   "Red/System Portaudio play a simple (aliasing) sawtooth wave example"
    Purpose: "Play a simple (aliasing) sawtooth wave."
	Author:  "Oldes"
	File: 	 %pa-saw.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
    Comment: {
    This code is port of original work:
        @file paex_saw.c
        @ingroup examples_src
        @brief Play a simple (aliasing) sawtooth wave.
        @author Phil Burk  http://www.softsynth.com
    }
]

#define NUM_SECONDS         5
#define SAMPLE_RATE         44100
#define FRAMES_PER_BUFFER   64

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

testData!: alias struct! [
    phase-left  [float32!]
    phase-right [float32!]
    pitch-left  [float32!]
    pitch-right [float32!]
]

paTestCallback: func[[cdecl]
    inputBuffer  [int-ptr!]
    outputBuffer [int-ptr!]
    frameCount [integer!]
    timeInfo [PaStreamCallbackTimeInfo!]
    statusFlags [PaStreamCallbackFlags!]
    userData [byte-ptr!]
    return: [integer!]
    /local data out i pl pr
][
    data: as testData! userData
    out: as pointer! [float32!] outputBuffer
    i: 0
    pl: data/phase-left
    pr: data/phase-right
    while [i < frameCount][
        out/1: pl
        out/2: pr
        pl: pl + data/pitch-left
        pr: pr + data/pitch-right
        if pl >= as float32! 1.0 [ pl: pl - as float32! 2.0 ]
        if pr >= as float32! 1.0 [ pr: pr - as float32! 2.0 ]
        out: out + 2
        i: i + 1
    ]
    data/phase-left: pl
    data/phase-right: pr
    paContinue
]

playSound: func[
    /local 
        userData
        err
        stream-ref stream
][
    userData: as testData! allocate size? testData!
    userData/phase-left:  as float32! 0.0
    userData/phase-right: as float32! 0.0
    userData/pitch-left:  as float32! 0.01
    userData/pitch-right: as float32! 0.03
    
    stream-ref: declare PaStream-ptr!

    err: Pa_OpenDefaultStream
              stream-ref
              0 ;no inputchannels
              2 ;stereo output
              paFloat32  ;32 bit floating point output
              as float! SAMPLE_RATE
              FRAMES_PER_BUFFER
              :paTestCallback
              as byte-ptr! userData
    if err <> paNoError [ onError err ]

    stream: stream-ref/value

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
