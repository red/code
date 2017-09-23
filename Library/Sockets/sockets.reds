Red/System [
	Title:   "Red/System - crossplaform Sockets binding"
	Author:  "Oldes"
	File:    %sockets.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {Based on tutorial: http://www.binarytides.com/udp-socket-programming-in-winsock/}
]

#include %sockets-core.reds

sockets: context [
	error: 0 ;just a variable to hold last returned error code

	#if OS = 'Windows [

		wsa: as WSAData! allocate 400 ;= declare WSAData!
		wsa/version: 0 ; not initialized yet
		
		init: func[
			major [integer!]
			minor [integer!]
			return: [logic!]
			/local version
		][
			version: declare integer16! ;@@ TODO: change once we will have real int16! type
			version/lo: as byte! major
			version/hi: as byte! minor
			;print "Initialising Winsock... "
			error: WSAStartup version wsa
			error = 0
		]
		;automatic initialization...
		if not init 2 2 [;version 2.2
			print-line ["*** Failed Winsock initialization. Error: " error]
		]
	]

	make-socket: func[
		"Create socket of specified type"
		family   [integer!]
		type     [integer!]
		protocol [integer!]
		return:  [SOCKET!]
	][
		#either OS = 'Windows [
			WSASocket family type protocol NULL 0 0
		][
			socket family type protocol
		]
	]

	make-address: func[
		"Allocates a new socket address struct and fills it with ip and port info values"
		ip      [ip-address!]
		port    [integer!]
		return: [sockaddr!]
	][
		init-address ALLOCATE_AS(sockaddr!) ip port
	]

	init-address: func[
		"Fills existing socket address struct with ip and port info values"
		address  [sockaddr!]
		ip       [ip-address!]
		port     [integer!]
		return: [sockaddr!]
	][
		address/family-port: (AF_INET and FFFFh) or ((htons port) << 16) ;@@ TODO: change once we will have real int16! type
		address/ip:   ip
		address/zero: 0.0 ;just clearing these padding bytes
		address
	]

	make-server: func[
		"Creates sockaddress and binds it to provided socket"
		s       [SOCKET!]
		ip      [ip-address!]
		port    [integer!]
		return: [sockaddr!]
		/local server
	][
		server: make-address ip port
		if 0 <> bind s server size? sockaddr! [
			;failed!
			FREE_MEMORY(server)
			return null
		]
		server
	]

	get-error: func[return: [integer!]][
		#either OS = 'Windows [WSAGetLastError][error]
	]

	host-to-ip: func[
		host     [c-string!]
		return:  [ip-address!]
		/local h [hostent!]
	][
		h: gethostbyname host
		if h = null [return 0]
		h/list/ips/1
	]

	dispose: does[
		#if OS = 'Windows [
			WSACleanup
			wsa/version: 0
		]
	]
]
