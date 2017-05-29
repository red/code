Red/System [
	Title:   "Red/System ZeroMQ (0MQ) binding - Hello server example"
	Author: "Oldes"
	File: 	%ZeroMQ-Hello-server.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
	Comment: {
		This script needs external library, which can be downloaded from this site:
		http://zeromq.org/area:download
		(tested with xz-5.2.3-windows\[bin_i686|bin_i686-sse2]\liblzma.dll)
	}
]

#include %ZeroMQ.reds 

#define ZMQ_ASSERT(r) [
	if r < 0 [print-line ["ZMQ [" zmq/errno "]: " zmq/strerror zmq/errno ]]
]

a: 0 b: 0 c: 0
zmq/version :a :b :c
print-line ["ZMQ version: " a "." b "." c]

ctx: zmq/ctx_new
responder: zmq/socket ctx ZMQ_REP

print-line ["ZMQ Context:   " ctx]
print-line ["ZMQ Responder: " responder]


r: zmq/bind responder "tcp://*:5556"
ZMQ_ASSERT(r)

if r <> 0 [
	print-line  "ZMQ bind failed!"
	quit -1
]

buffer: allocate 10
forever [
	print-line "Waiting for request..."
	r: zmq/recv responder buffer 10 0
	ZMQ_ASSERT(r)
	print-line ["Received request: " as c-string! buffer]
	r: zmq/send responder as byte-ptr! "World" 5 0
	ZMQ_ASSERT(r)
]



