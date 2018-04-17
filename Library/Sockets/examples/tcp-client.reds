Red/System [
	Title:   "Red/System - tcp-client sockets example"
	Author:  "Oldes"
	File:    %tcp-client.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on tutorial: http://www.binarytides.com/udp-socket-programming-in-winsock/}
]

#include %../sockets.reds

buffer-bytes: 512
buffer: allocate buffer-bytes

bytes:    0 ;will hold number of bytes to send/receive
received: 0 ;will hold number of received bytes
n:        0 ;message counter

;- Define main communication functions

receive-message: func[return: [logic!]] [
	received: recv s buffer buffer-bytes - 1 0 ;buffer bytes decreesed so I can add null char to mark a string end
	either received < 0 [
		either sockets/get-error = 10054 [
			print-line "Connection reset by peer."
		][
			print-line ["`recv` failed with error: " sockets/get-error]
		]
		false
	][
		bytes: received + 1	buffer/bytes: #"^@" ;mark end of received string
		print-line ["Server reply with: " as c-string! buffer]
		true
	]
]
send-message: func[text [byte-ptr!] bytes [integer!]][
	print-line ["Sending message: " as c-string! text]
	send s buffer bytes 0
]

;- Create a socket

s: sockets/make-socket AF_INET SOCK_STREAM 0
if s = null [
	print-line ["Could not create socket: " sockets/get-error]
	quit 1
]
print "Socket created.^/"

;- Connect to specified adress

address: sockets/make-address inet_addr "127.0.0.1" 8080
address-bytes: size? address

if 0 > connect s address address-bytes [
	print-line ["`connect` failed with error: " sockets/get-error]
	quit 1
]

print "Connected^/"

;- Send first message

message: "Is anybody at home?"
send-message as byte-ptr! message length? message
either receive-message [
	;server answered, so lets send him something more
	n:  0
	while[n < 10] [ ;try to send 10 messages
		n: n + 1

		;-  send message to specified address:

		bytes: sprintf [buffer "Hello Red n.%i" n ]
		send-message buffer bytes

		;- receive a reply and print it:

		if not receive-message [
			break
		]
	]
][
	print-line "Something went wrong!"
]

;- Clean resources

FREE_MEMORY(buffer)
FREE_MEMORY(address)

closesocket s
sockets/dispose
