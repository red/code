Red/System [
	Title:   "Red/System - Get source IP of system"
	Author:  "Oldes"
	File:    %get-local-ip.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %../sockets.reds

get-local-ip: func[
	return: [c-string!]
	/local sock serv name len ip
][
	sock: sockets/make-socket AF_INET SOCK_DGRAM 0
	serv: declare sockaddr!
	name: declare sockaddr!
	len:  size? sockaddr! 

	sockets/init-address serv inet_addr "8.8.8.8" 53

	connect sock serv len
	ip: either 0 > getsockname sock name :len [0][name/ip]
	closesocket sock

	inet_ntoa ip ;converts numeric IP value into doted string
]

print-line ["Your local IP address is: " get-local-ip ]
sockets/dispose