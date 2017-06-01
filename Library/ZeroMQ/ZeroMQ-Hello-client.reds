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
		(tested with libzmq-v120-mt-4_0_4.dll - renamed to libzmq.dll - on Win10)
	}
]

#include %ZeroMQ.reds
#include %../os/wait.reds

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

buffer: allocate 256

n: 0
bytes: 0

while [n < 10][
	n: n + 1
	print-line ["Sending Hello " n]
	bytes: zmq/send requester as byte-ptr! "Hello" 5 0
	if bytes < 0 [
		ZMQ_ASSERT(bytes)
		break
	]
    bytes: zmq/recv requester buffer 255 0
    either bytes < 0 [
    	ZMQ_ASSERT(bytes)
    	break
    ][
		if bytes > 255 [bytes: 255]
		bytes: bytes + 1
		buffer/bytes: #"^@" ;to create valid c-string ending just in case
	]
    print-line ["Received " n ": " as c-string! buffer]
    wait 500
]

zmq/close requester
zmq/ctx_destroy ctx
free buffer
