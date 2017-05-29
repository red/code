Red/System [
	Title:   "Red/System ZeroMQ (0MQ) binding - Hello client example"
	Author: "Oldes"
	File: 	%ZeroMQ-Hello-client.reds
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
	if r < 0 [print-line ["ZMQ [" zmq/errno "]: " zmq/strerror zmq/errno]]
]

a: 0 b: 0 c: 0
zmq/version :a :b :c
print-line ["ZMQ version: " a "." b "." c]

print-line "Connecting to hello world server..."

ctx: zmq/ctx_new
requester: zmq/socket ctx ZMQ_REQ

print-line ["ZMQ Context:   " ctx]
print-line ["ZMQ Requester: " requester]

r: zmq/connect requester "tcp://127.0.0.1:5556"
ZMQ_ASSERT(r)

buffer: allocate 10

n: 0
while [n < 10][
	n: n + 1
	print-line ["Sending Hello " n]
	r: zmq/send requester as byte-ptr! "Hello" 5 0
	ZMQ_ASSERT(r) if r < 0 [break]

    r: zmq/recv requester buffer 10 0
    ZMQ_ASSERT(r) if r < 0 [break]
    print-line ["Received " n ": " as c-string! buffer]
]

zmq/close requester
zmq/ctx_destroy ctx
