Red/System [
	Title:   "Red/System - udp-server example"
	Author:  "Oldes"
	File:    %udp-server.reds
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
		s: WSASocket AF_INET SOCK_DGRAM 0 NULL 0 0
    	if s = null [
    		print-line ["Could not create socket: " WSAGetLastError]
    		quit 1
    	]
    	print "Socket created.^/"

    	server: ALLOCATE_AS(sockaddr!)
    	server/family-port: (AF_INET and FFFFh) or ((htons 8888) << 16)
		server/addr/value:  INADDR_ANY
		server/zero: 0.0 ;just clearing these padding bytes 

		print-line ["server/family-port: " as int-ptr! server/family-port]
		print-line ["server/addr/value:  " as int-ptr! server/addr/value]

		if 0 <> bind s as int-ptr! server 16 [
			print-line ["Bind failed with error: " WSAGetLastError]
			quit 1
		]

		print "Bind done^/"

		address: ALLOCATE_AS(sockaddr!)
    	address/family-port: (AF_INET and FFFFh) or ((htons 8888) << 16) ;@@ TODO: change once we will have real int16! type
		address/addr:  inet_addr "127.0.0.1"
		address/zero:  0.0 ;just clearing these padding bytes 

		address-bytes: size? address

		buffer-bytes: 512
		buffer: allocate buffer-bytes

		bytes:    0 ;will hold number of bytes to send
		received: 0 ;will hold number of received bytes

		forever [
			ZERO_MEMORY(buffer buffer-bytes)

			received: recvfrom s buffer buffer-bytes 0 address :address-bytes
			if received < 0 [
				print-line ["`recvfrom` failed with error: " WSAGetLastError]
				quit 1
			]
			print-line [
				"Received packet from: " inet_ntoa address/addr #":" ntohs (server/family-port >> 16)
				" with: " as c-string! buffer
			]

			if SOCKET_ERROR = sendto s buffer received 0 address address-bytes [
				print-line ["`sendto` failed with error: " WSAGetLastError]
				quit 1
			]
		]

		FREE_MEMORY(buffer)
		FREE_MEMORY(server)
		FREE_MEMORY(address)

		closesocket s
		WSACleanup		
	]
   #default  [  ]
]

