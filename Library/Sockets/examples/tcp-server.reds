Red/System [
	Title:   "Red/System - tcp-server example"
	Purpose: {
	Very simple TCP server example.
	It accepts 1 connection and after initial introduction it echos 5 client messages.}
	Author:  "Oldes"
	File:    %tcp-server.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on tutorial: http://www.binarytides.com/code-tcp-socket-server-winsock/}
]

#include %../sockets.reds

buffer-bytes: 512
buffer: allocate buffer-bytes

bytes:    0 ;will hold number of bytes to send/receive
received: 0 ;will hold number of received bytes
connected?: false

;- Define main communication functions

receive-message: func[return: [logic!]] [
	received: recv client buffer buffer-bytes - 1 0 ;buffer bytes decreesed so I can add null char to mark a string end
	either received < 0 [
		either sockets/get-error = 10054 [
			print-line "Connection reset by peer."
		][
			print-line ["`recv` failed with error: " sockets/get-error]
		]
		connected?: false
		closesocket client
		false
	][
		bytes: received + 1	buffer/bytes: #"^@" ;mark end of received string
		print-line ["Server received: " as c-string! buffer]
		true
	]
]
send-message: func[text [c-string!]][
	print-line ["Reply: " text]
	bytes: sprintf [buffer text]
	send client buffer bytes 0
]

;- Create a socket

s: sockets/make-socket AF_INET SOCK_STREAM 0 ;= SOCK_STREAM for TCP
if s = null [
	print-line ["Could not create socket: " sockets/get-error]
	quit 1
]
print "Socket created.^/"

;- Prepare the server structure and bind it

server: sockets/make-server s INADDR_ANY 8080
if server = null [
	print-line ["Bind failed with error: " sockets/get-error]
	quit 1
]
print "Bind done^/"

;- Listen to incoming connections

listen s 3

;- Accept and incoming connection

print "Waiting for incoming connections...^/"
len: size? server
client: accept s server :len
if client = null [
	print-line ["`accept` failed with error: " sockets/get-error]
	quit 1
]

;- Connection accepted

print "Connection accepted^/"

address: ALLOCATE_AS(sockaddr!) ;using address to get client's info
address-bytes: size? address
either 0 > getpeername client address :address-bytes [;retrives information about client's IP and PORT
	print-line ["`getpeername` failed with error: " sockets/get-error]
][
	print-line ["Client is from: " inet_ntoa address/ip #":" ntohs (address/family-port >> 16)]
]

;- Wait for first client message and answer it

either receive-message [
	send-message "Hello Client, I have received your connection. What do you want?"
][	quit 1 ] ;exit if receive failed

;- Echo incomming messages, but only 5 times!

connected?: true
messages: 0
while[connected?][
	either receive-message [
		messages: messages + 1
		either messages < 6 [
			;echo the received message
			send-message as c-string! buffer
		][
			send-message "Enough playing... have to leave now!"
			closesocket client
			connected?: false
			print "Connection closed by server!^/"
		]
	][
		connected?: false
		closesocket client
	]
]

;- Clean resources

FREE_MEMORY(server)
FREE_MEMORY(address)
closesocket s
sockets/dispose