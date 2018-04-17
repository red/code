Red/System [
	Title:   "URL! struct and related functions"
	Purpose: "URL! struct can be used for passing URL data into sockets instead of plain c-string!."
	Exports: [
		url!         [struct!]
		decode-url   [function! [url [c-string!] result  [url!] return: [url!]]]
		probe-url    [function! [url [url!] return: [url!]]]
		validate-url [function! [url [url!] return: [logic!]]]
		read-url:    [function! [url [url!] size [int-ptr!]	return: [byte-ptr!]]]
	]
	Author:  "Oldes"
	File: 	 %url.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %c-string.reds
#include %../../Sockets/sockets.reds

#import [
	LIBC-file cdecl [
		realloc: "realloc" [ ;@@ move this into more appropriate file!
			"Resize and return allocated memory."
			memory			[byte-ptr!]
			size			[integer!]
			return:			[byte-ptr!]
		]
	]
]

url!: alias struct! [
	scheme  [c-string!]
	user    [c-string!]
	pass    [c-string!]
	host    [c-string!]
	port    [integer! ]
	path    [c-string!]
	target  [c-string!]
]

decode-url: func[
	url     [c-string!]
	result  [url!]       ;if null, new struct will be allocated
	return: [url!]
	/local num
		tail-url         ;end of the url
		tail-scheme      ;begin of the url or position after "://" part
		tail-user        ;tail-scheme or position of : in credentials
		tail-host        ;tail-url or start of the path
		tail-credentials ;tail of the credentials definition or tail-scheme
		tail-path        ;tail-url or begin of the target
][
	;print-line ["decode-url: " url]
	tail-url: url + size? url

	if result = null [ result: ALLOCATE_AS(url!) ]

	set-memory as byte-ptr! result #"^@" size? url! ;null all url values

	tail-scheme: strstr url "://"
	either tail-scheme = null [
		tail-scheme: url
	][
		num: as integer! (tail-scheme - url)
		if num > 0 [
			result/scheme: copy-c-string url num
		]
		tail-scheme: tail-scheme + 3 ;removes the :// part
	]
	;find host tail before parsing credentials
	tail-host: strnchr tail-scheme #"/" as integer! (tail-url - tail-scheme)
	if tail-host = null [ tail-host: tail-url ]

	;find tail of credentials
	tail-credentials: strnchr tail-scheme #"@" as integer! (tail-host - tail-scheme)
	either tail-credentials = null [
		tail-credentials: tail-scheme
	][
		num: as integer! (tail-credentials - tail-scheme)
		if num > 0 [
			tail-user: strnchr tail-scheme #":" num
			result/user: copy-c-string tail-scheme as integer! (tail-user - tail-scheme)
			if tail-user <> null [
				result/pass: copy-c-string (tail-user + 1) (as integer! (tail-credentials - tail-user) - 1)
			]
		]
		tail-credentials: tail-credentials + 1 ;skip the @ char
	]
	if tail-credentials < tail-host [
		result/host: copy-c-string tail-credentials as integer! (tail-host - tail-credentials)
	]

	if tail-host < tail-url [
		num: as integer! (tail-url - tail-host)
		tail-path: strnchr tail-host #"#" num
		either tail-path = null [
			result/path: copy-c-string tail-host num
		][
			result/path: copy-c-string tail-host as integer! (tail-path - tail-host)
			tail-path: tail-path + 1 ;skip the # char
			num: as integer! (tail-url - tail-path)
			if num > 0 [
				result/target: copy-c-string tail-path as integer! (tail-url - tail-path)
			]
		]
	]
	result
]

probe-url: func[
	url [url!]
	return: [url!]
][
	print "url: [^/"
	if url/scheme <> null [print-line ["  scheme: " url/scheme]]
	if url/user   <> null [print-line ["  user:   " url/user]]
	if url/pass   <> null [print-line ["  pass:   " url/pass]]
	if url/host   <> null [print-line ["  host:   " url/host]]
	if url/port    > 0    [print-line ["  port:   " url/port]]
	if url/path   <> null [print-line ["  path:   " url/path]]
	if url/target <> null [print-line ["  target: " url/target]]
	print "]^/"
	url
]

validate-url: func[
	url [url!]
	return: [logic!]
][
	;@@ TODO: validating url values is not yet implemented!
	true
]

read-url: func[
	url         [url!]
	size        [int-ptr!]
	return:     [byte-ptr!]
	/local
		sock address host port path ip buffer buffer-size bytes ips
		result result-bytes available received to-read-bytes
][
	host: either url/host <> null [url/host]["localhost"]
	port: either url/port > 0 [url/port][80]
	path: either url/path <> null [url/path]["/"]

	buffer-size: 1024 * 2 ;could be enough for request and read chunks

	;- init TCP socket --------------------------------------

	sock: sockets/make-socket AF_INET SOCK_STREAM IPPROTO_TCP

	;- resolve host's IP adress

	address: declare sockaddr!
	print "Resolving host's ip... "
	ip: sockets/host-to-ip url/host
	if ip = 0 [
		print "FAILED^/"
		size/value: 0
		return null
	]
	print-line inet_ntoa ip ;prints ip in dotted format

	;- connect to specified host server ---------------------
	
	sockets/init-address address ip port

	print "Connecting...          "

	if 0 > connect sock address size? address [
		print-line ["*** Connection error: " sockets/get-error]
		quit 1
	]
	print "Connected.^/"

	;- allocate input/output buffer -------------------------

	buffer: allocate buffer-size
	ZERO_MEMORY(buffer buffer-size)

	;- form request string and send it ----------------------
	;@@ note: there is no check for path or host validity and size

	bytes: sprintf [buffer "GET %s HTTP/1.1^M^/Host: %s^M^/Connection: close^M^/^M^/" path host]

	print-line ["Request:^/" as c-string! buffer]

	send sock buffer bytes 0 ;sends above request

	;- receive response from server -------------------------
	print "Receiving...^/"

	received: 0
	result-bytes: 2 * buffer-size
	result: allocate result-bytes
	available: result-bytes - 1

	to-read-bytes: available

	while [
		bytes: recv sock (result + received) to-read-bytes 0
		bytes > 0
	][

		if (available - 2048) < bytes [
			result-bytes: (result-bytes * 2) + 2048
			print-line ["Resizing result buffer to: " result-bytes]
			result: realloc result result-bytes
			if result = null [
				print-line "*** Failed to re-allocate memory."
				quit 1
			]
		]
		;copy-memory (result + received) buffer bytes
		received: received + bytes
		available: result-bytes - received - 1
		to-read-bytes: available
		print-line ["Bytes received: " bytes " available: " available " total: " received]
	]

	free buffer
	closesocket sock

	size/value: received       ;will pass received bytes value with result (without terminating null char)
	received: received + 1     ;add terminating null char, so result can be safely cased to c-string! if needed
	result/received: #"^@"
	realloc result received ;shring result buffer and return it
]