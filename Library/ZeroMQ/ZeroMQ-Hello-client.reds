Red/System [
	Title:   "Red/System ZeroMQ (0MQ) binding"
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

a: 0 b: 0 c: 0
zmq/version :a :b :c
print-line ["ZMQ version: " a "." b "." c]

print-line "Connecting to hello world server…"

ctx: zmq/ctx_new
requester: zmq/socket ctx ZMQ_REP

print-line ["requester: " requester]

zmq/connect requester "tcp://localhost:85555"

buffer: allocate 10

n: 0
while [n < 10][
	n: n + 1
	print-line ["Sending Hello " n]
	zmq/send requester as byte-ptr! "Hello" 5 0
    zmq/recv requester buffer 10 0
    print-line ["Received World " n]
]

zmq/close requester
zmq/ctx_destroy ctx
