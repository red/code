Red/System [
	Title:   "Red/System - udp-client sockets example"
	Author:  "Oldes"
	File:    %udp-client.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on tutorial: http://www.binarytides.com/udp-socket-programming-in-winsock/}
]

#include %../sockets.reds

s: sockets/make-socket AF_INET SOCK_DGRAM IPPROTO_UDP
if s = null [
	print-line ["Could not create socket: " sockets/get-error]
	quit 1
]
print "Socket created.^/"

address: sockets/make-address inet_addr "127.0.0.1" 8888
address-bytes: size? address

buffer-bytes: 512
buffer: allocate buffer-bytes

bytes:    0 ;will hold number of bytes to send
received: 0 ;will hold number of received bytes

n:  0
while[n < 10] [
	n: n + 1

	;-  send message to specified address:

	ZERO_MEMORY(buffer buffer-bytes) ;clears output buffer

	bytes: sprintf [buffer "Hello Red n.%i" n ]

	print-line ["Sending message[" n "]: " as c-string! buffer]

	if SOCKET_ERROR = sendto s buffer bytes 0 address address-bytes [
		print-line ["`sendto` failed with error: " sockets/get-error]
		quit 1
	]

	;- receive a reply and print it:

	ZERO_MEMORY(buffer buffer-bytes) ;clears input buffer

	received: recvfrom s buffer buffer-bytes 0 address :address-bytes
	if received < 0 [
		print-line ["`recvfrom` failed with error: " sockets/get-error]
		quit 1
	]
	print-line ["Received packet with: " as c-string! buffer]
	
]

FREE_MEMORY(buffer)
FREE_MEMORY(address)

closesocket s
sockets/dispose
