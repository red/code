Red/System [
	Title:   "Red/System - udp-client example"
	Author:  "Oldes"
	File:    %udp-client.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on tutorial: http://www.binarytides.com/udp-socket-programming-in-winsock/}
]
#include %definitions.reds

#switch OS [
	Windows   [

		#include %windows/Ws2_32.reds

		wsa: as WSAData! allocate 400 ;= declare WSAData!

		;requesting version 2.2
		version: declare integer16! ;@@ TODO: change once we will have real int16! type
		version/lo: as byte! 2
		version/hi: as byte! 2

		print "Initialising Winsock... "
		error: WSAStartup version wsa
		if error <> 0 [
			print-line ["Failed. Error: " error]
			quit 1
		]
		print "DONE^/"

		; Create a socket
		s: WSASocket AF_INET SOCK_DGRAM IPPROTO_UDP NULL 0 0
    	if s = null [
    		print-line ["Could not create socket: " WSAGetLastError]
    		quit 1
    	]
    	print "Socket created.^/"

    	address: ALLOCATE_AS(sockaddr!)
    	address/family-port: (AF_INET and FFFFh) or ((htons 8888) << 16) ;@@ TODO: change once we will have real int16! type
		address/addr:  inet_addr "127.0.0.1"
		address/zero:  0.0 ;just clearing these padding bytes 

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
				print-line ["`sendto` failed with error: " WSAGetLastError]
				quit 1
			]

			;- receive a reply and print it:

			ZERO_MEMORY(buffer buffer-bytes) ;clears input buffer

			received: recvfrom s buffer buffer-bytes 0 address :address-bytes
			if received < 0 [
				print-line ["`recvfrom` failed with error: " WSAGetLastError]
				quit 1
			]
			print-line ["Received packet with: " as c-string! buffer]
			
		]

		FREE_MEMORY(buffer)
		FREE_MEMORY(address)

		closesocket s
		WSACleanup
		
	]
   #default  [
   		;@@ TODO: version for other systems!
   ]
]

