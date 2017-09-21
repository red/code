Red/System [
	Title:   "Red/System - tcp-server example"
	Author:  "Oldes"
	File:    %tcp-server.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on tutorial: http://www.binarytides.com/code-tcp-socket-server-winsock/}
]

#include %../sockets.reds

s: sockets/make-socket AF_INET SOCK_STREAM 0 ;= SOCK_STREAM for TCP
if s = null [
	print-line ["Could not create socket: " sockets/get-error]
	quit 1
]
print "Socket created.^/"

server: sockets/make-server s INADDR_ANY 8080
if server = null [
	print-line ["Bind failed with error: " sockets/get-error]
	quit 1
]

print-line ["server/family-port: " as int-ptr! server/family-port]
print-line ["server/ip:          " as int-ptr! server/ip]

print "Bind done^/"

listen s 3 ;Listen to incoming connections
print "Waiting for incoming connections...^/"

len: size? server
client: accept s server :len
if client = null [
	print-line ["`accept` failed with error: " sockets/get-error]
	quit 1
]

print "Connection accepted^/"

;Reply to client
message: "Hello Client , I have received your connection. But I have to go now, bye!^/"
send client as byte-ptr! message length? message 0

print "Press any key to quit."
#include %../../os/key-hit.reds
key-hit-char

FREE_MEMORY(server)

closesocket s
sockets/dispose