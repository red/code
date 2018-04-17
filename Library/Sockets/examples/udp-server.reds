Red/System [
	Title:   "Red/System - udp-server example"
	Author:  "Oldes"
	File:    %udp-server.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on tutorial: http://www.binarytides.com/udp-socket-programming-in-winsock/}
]

#include %../sockets.reds

s: sockets/make-socket AF_INET SOCK_DGRAM 0
if s = null [
	print-line ["Could not create socket: " sockets/get-error]
	quit 1
]
print "Socket created.^/"

server: sockets/make-server s INADDR_ANY 8888

if server = null [
	print-line ["Bind failed with error: " sockets/get-error]
	quit 1
]

print "Bind done^/"

address: sockets/make-address inet_addr "127.0.0.1" 8888
address-bytes: size? address

buffer-bytes: 512
buffer: allocate buffer-bytes

bytes:    0 ;will hold number of bytes to send
received: 0 ;will hold number of received bytes
error:    0
forever [
	ZERO_MEMORY(buffer buffer-bytes)

	received: recvfrom s buffer buffer-bytes 0 address :address-bytes
	either received < 0 [
		error: sockets/get-error
		switch error [
			10054 [
				print-line "Connection reset by peer."
			]
			default [
				print-line ["`recvfrom` failed with error: " error " received: " received]
			]
		]
		
	][
		print-line [
			"Received packet from: " inet_ntoa address/ip #":" ntohs (server/family-port >> 16)
			" with: " as c-string! buffer
		]

		if SOCKET_ERROR = sendto s buffer received 0 address address-bytes [
			print-line ["`sendto` failed with error: " sockets/get-error]
		]
	]
]

FREE_MEMORY(buffer)
FREE_MEMORY(server)
FREE_MEMORY(address)

closesocket s
sockets/dispose