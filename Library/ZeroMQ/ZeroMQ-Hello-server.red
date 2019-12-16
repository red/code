Red [
	Title:     "Red/System ZeroMQ (0MQ) binding - Hello server example (Red)"
	Author: "Intey"
	File:    %ZeroMQ-Hello-server.red
	Tabs:    4
	Rights: "Copyright (C) 2017 Intey. All rights reserved."
	License: {
        Distributed under the Boost Software License, Version 1.0.
        See https://github.com/red/red/blob/master/BSL-License.txt
	}
	Comment: {
        This script needs external library, which can be downloaded from this site:
        http://zeromq.org/area:download
        (tested with libzmq-v120-mt-4_0_4.dll - renamed to libzmq.dll - on Win10)

        As ZeroMQ-Hello-server.reds, this provides same server example, but written
        in Red, not Red/System.

        Also, this can be used as test for API interfaces from Red/System of ZeroMQ
	}
]

#system [
    #define ZMQ_ASSERT(r) [
        if r < 0 [print-line ["ZMQ [" zmq/errno "]: " zmq/strerror zmq/errno ]]
    ]
    #include %ZeroMQ.reds
]

start-server: routine [
    /local
        ctx [zmq-context!]
        socket [zmq-socket!]
        r [integer!] 
        buffer [byte-ptr!]
        bytes [integer!]
][
    ctx: zmq/ctx_new
    socket: zmq/socket ctx ZMQ_REP
    print-line ["ZMQ Context:     " ctx]
    print-line ["ZMQ Responder: " socket]
    r: zmq/bind socket "tcp://*:5556"
    ZMQ_ASSERT(r)
    if r <> 0 [
        print-line    "ZMQ bind failed!"
        quit -1
    ]
    r: zmq/setsockopt socket ZMQ_SUB as byte-ptr! "" 0
    ZMQ_ASSERT(r)

    buffer: allocate 256
    bytes: 0
    forever [
        print-line "Waiting for request..."
        bytes: zmq/recv socket buffer 255 0
        ZMQ_ASSERT(bytes)
        if bytes >= 0 [
            if bytes > 255 [bytes: 255]
            bytes: bytes + 1
            buffer/bytes: #"^@" ;to create valid c-string ending just in case
        ]
        print-line ["Received request: " as c-string! buffer]
        r: zmq/send socket as byte-ptr! "World" 5 0
        ZMQ_ASSERT(r)
    ]
]

start-server
