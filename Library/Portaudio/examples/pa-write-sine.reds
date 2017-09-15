Red/System [
	Title:   "Red/System Portaudio play sine wave example using blocking API"
    Purpose: "Play a sine wave for several seconds using the blocking API `Pa_WriteStream`"
	Author:  "Oldes"
	File: 	 %pa-write-sine.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
    Comment: {
    This code is port of original work:
        @file paex_write_sine.c
        @ingroup examples_src
        @brief Play a sine wave for several seconds using the blocking API (Pa_WriteStream())
        @author Ross Bencina <rossb@audiomulch.com>
        @author Phil Burk <philburk@softsynth.com>
    }
]

#define NUM_SECONDS         2
#define SAMPLE_RATE         44100
#define FRAMES_PER_BUFFER   1024
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


playSound: func[
    /local 
        outputParameters [PaStreamParameters!]
        phase-left phase-right
        inc-left inc-right
        err
        stream-ref stream streamInfo
        buffer
        bufferCount
        data
        sine
        i j k p
][
    outputParameters: declare PaStreamParameters!
    phase-left:  0
    phase-right: 0
    inc-left:    1
    inc-right:   3
    sine: precountSineTable TABLE_SIZE 4.3

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
              NULL ;no callback, use blocking API
              NULL ;no callback, so no callback userData
    if err <> paNoError [ onError err ]

    stream: stream-ref/value
    print-line ["stream: " stream]

    streamInfo: Pa_GetStreamInfo stream
    print-line ["^-inputLatency: " streamInfo/inputLatency]
    print-line ["^-outputLatency: " streamInfo/outputLatency]
    print-line ["^-sampleRate: " streamInfo/sampleRate]


    buffer: as pointer! [float32!] allocate (FRAMES_PER_BUFFER * 2 * 32)
    
    print-line "Play 3 times, higher each time."

    k: 0
    while [k < 3][ ; playing 3 times
        k: k + 1
        print-line ["Plaing " k ". sound for " NUM_SECONDS " seconds."]

        err: Pa_StartStream stream
        if err <> paNoError [ onError err ]
        
        bufferCount: (NUM_SECONDS * SAMPLE_RATE) / FRAMES_PER_BUFFER

        i: 0
        while [i < bufferCount][
            j: 0 p: buffer
            while [j < FRAMES_PER_BUFFER][
                data: as stereoData! p
                data/left:  sine/phase-left
                data/right: sine/phase-right
                phase-left: phase-left + inc-left
                phase-right: phase-right + inc-right
                if phase-left  >= TABLE_SIZE [ phase-left: phase-left - TABLE_SIZE ]
                if phase-right >= TABLE_SIZE [ phase-right: phase-right - TABLE_SIZE ]
                j: j + 1
                p: p + 2
            ]
            err: Pa_WriteStream stream as byte-ptr! buffer FRAMES_PER_BUFFER
            if err <> paNoError [ onError err ]
            i: i + 1
        ]
        err: Pa_StopStream stream
        if err <> paNoError [ onError err]

        inc-left: inc-left + 1
        inc-right: inc-right + 1
    ]

    err: Pa_CloseStream stream
    if err <> paNoError [ onError err ]

    free as byte-ptr! sine
    free as byte-ptr! buffer
]

playSound

Pa_Terminate
