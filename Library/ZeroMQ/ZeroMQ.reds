Red/System [
	Title:   "Red/System ZeroMQ (0MQ) binding"
	Author: "Oldes"
	File: 	%ZeroMQ.reds
	Tabs: 	4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
	Comment: {
		This script needs external library, which can be downloaded from this site:
		http://zeromq.org/area:download
		(tested with libzmq-v120-mt-4_0_4.dll - renamed to libzmq.dll - on Win10)
	}
]

#define handle! byte-ptr!
#define zmq-socket! handle!


#enum zmq-error-code! [
	ZMQ_HAUSNUMERO: 156384712
	;On Windows platform some of the standard POSIX errnos are not defined. 
	ENOTSUP         ;ZMQ_HAUSNUMERO + 1
	EPROTONOSUPPORT
	ENOBUFS
	ENETDOWN
	EADDRINUSE
	EADDRNOTAVAIL
	ECONNREFUSED
	EINPROGRESS
	ENOTSOCK
	EMSGSIZE
	EAFNOSUPPORT
	ENETUNREACH
	ECONNABORTED
	ECONNRESET
	ENOTCONN
	ETIMEDOUT
	EHOSTUNREACH
	ENETRESET       ;ZMQ_HAUSNUMERO + 18
	;Native 0MQ error codes. 
	EFSM: 156384763 ;ZMQ_HAUSNUMERO + 51
	ENOCOMPATPROTO
	ETERM
	EMTHREAD        ;ZMQ_HAUSNUMERO + 54
]

;******************************************************************************/
;*  0MQ socket definition.                                                    */
;******************************************************************************/
;*  Socket types.
#define ZMQ_PAIR 0
#define ZMQ_PUB 1
#define ZMQ_SUB 2
#define ZMQ_REQ 3
#define ZMQ_REP 4
#define ZMQ_DEALER 5
#define ZMQ_ROUTER 6
#define ZMQ_PULL 7
#define ZMQ_PUSH 8
#define ZMQ_XPUB 9
#define ZMQ_XSUB 10
#define ZMQ_STREAM 11
;*  Deprecated aliases
#define ZMQ_XREQ ZMQ_DEALER
#define ZMQ_XREP ZMQ_ROUTER

;*  Socket options.                                                           */
#define ZMQ_AFFINITY 4
#define ZMQ_IDENTITY 5
#define ZMQ_SUBSCRIBE 6
#define ZMQ_UNSUBSCRIBE 7
#define ZMQ_RATE 8
#define ZMQ_RECOVERY_IVL 9
#define ZMQ_SNDBUF 11
#define ZMQ_RCVBUF 12
#define ZMQ_RCVMORE 13
#define ZMQ_FD 14
#define ZMQ_EVENTS 15
#define ZMQ_TYPE 16
#define ZMQ_LINGER 17
#define ZMQ_RECONNECT_IVL 18
#define ZMQ_BACKLOG 19
#define ZMQ_RECONNECT_IVL_MAX 21
#define ZMQ_MAXMSGSIZE 22
#define ZMQ_SNDHWM 23
#define ZMQ_RCVHWM 24
#define ZMQ_MULTICAST_HOPS 25
#define ZMQ_RCVTIMEO 27
#define ZMQ_SNDTIMEO 28
#define ZMQ_LAST_ENDPOINT 32
#define ZMQ_ROUTER_MANDATORY 33
#define ZMQ_TCP_KEEPALIVE 34
#define ZMQ_TCP_KEEPALIVE_CNT 35
#define ZMQ_TCP_KEEPALIVE_IDLE 36
#define ZMQ_TCP_KEEPALIVE_INTVL 37
#define ZMQ_TCP_ACCEPT_FILTER 38
#define ZMQ_IMMEDIATE 39
#define ZMQ_XPUB_VERBOSE 40
#define ZMQ_ROUTER_RAW 41
#define ZMQ_IPV6 42
#define ZMQ_MECHANISM 43
#define ZMQ_PLAIN_SERVER 44
#define ZMQ_PLAIN_USERNAME 45
#define ZMQ_PLAIN_PASSWORD 46
#define ZMQ_CURVE_SERVER 47
#define ZMQ_CURVE_PUBLICKEY 48
#define ZMQ_CURVE_SECRETKEY 49
#define ZMQ_CURVE_SERVERKEY 50
#define ZMQ_PROBE_ROUTER 51
#define ZMQ_REQ_CORRELATE 52
#define ZMQ_REQ_RELAXED 53
#define ZMQ_CONFLATE 54
#define ZMQ_ZAP_DOMAIN 55

;*  Message options
#define ZMQ_MORE 1

;*  Send/recv options.
#define ZMQ_DONTWAIT 1
#define ZMQ_SNDMORE 2

;*  Security mechanisms
#define ZMQ_NULL 0
#define ZMQ_PLAIN 1
#define ZMQ_CURVE 2

;*  Deprecated options and aliases
#define ZMQ_IPV4ONLY                31
#define ZMQ_DELAY_ATTACH_ON_CONNECT ZMQ_IMMEDIATE
#define ZMQ_NOBLOCK                 ZMQ_DONTWAIT
#define ZMQ_FAIL_UNROUTABLE         ZMQ_ROUTER_MANDATORY
#define ZMQ_ROUTER_BEHAVIOR         ZMQ_ROUTER_MANDATORY

;*  Socket transport events (tcp and ipc only)
#define ZMQ_EVENT_CONNECTED 1
#define ZMQ_EVENT_CONNECT_DELAYED 2
#define ZMQ_EVENT_CONNECT_RETRIED 4

#define ZMQ_EVENT_LISTENING 8
#define ZMQ_EVENT_BIND_FAILED 16

#define ZMQ_EVENT_ACCEPTED 32
#define ZMQ_EVENT_ACCEPT_FAILED 64

#define ZMQ_EVENT_CLOSED 128
#define ZMQ_EVENT_CLOSE_FAILED 256
#define ZMQ_EVENT_DISCONNECTED 512
#define ZMQ_EVENT_MONITOR_STOPPED 1024

#define ZMQ_EVENT_ALL [ ZMQ_EVENT_CONNECTED or ZMQ_EVENT_CONNECT_DELAYED or
                        ZMQ_EVENT_CONNECT_RETRIED or ZMQ_EVENT_LISTENING or
                        ZMQ_EVENT_BIND_FAILED or ZMQ_EVENT_ACCEPTED or
                        ZMQ_EVENT_ACCEPT_FAILED or ZMQ_EVENT_CLOSED or
                        ZMQ_EVENT_CLOSE_FAILED or ZMQ_EVENT_DISCONNECTED or
                        ZMQ_EVENT_MONITOR_STOPPED]

zmq-message!: alias struct! [
	;32 bytes
	data1 [integer!]
	data2 [integer!]
	data3 [integer!]
	data4 [integer!]
	data5 [integer!]
	data6 [integer!]
	data7 [integer!]
	data8 [integer!]
]
zmq-event!: alias struct! [
	id-lo  [byte!]    ;id of the event as bitfield
	id-hi  [byte!]    ;@@ TODO: use integer16! once available
	value  [integer!] ;value is either error code, fd or reconnect interval
]
zmq-poll-item!: alias struct! [
	socket [handle!]
	fd     [handle!]
	events [integer!] ;consist of 2 shorts
]

#switch OS [
	Windows   [ #define ZMQ-library "libzmq.dll"]
	macOS     [ #define ZMQ-library "libzmq.dylib"] ;@@ FIXME: use real file name
	#default  [ #define ZMQ-library "libzmq.so.4" ]    ;@@ FIXME: use real file name
]

ZMQ: context [
	#import [ZMQ-library cdecl [
		;*  Run-time API version detection  
		version: "zmq_version" [
			"Return 0MQ version."
			major		[int-ptr!]
			minor		[int-ptr!]
			patch		[int-ptr!]
		]
		;*  This function retrieves the errno as it is known to 0MQ library. The goal */
		;*  of this function is to make the code 100% portable, including where 0MQ   */
		;*  compiled with certain CRT library (on Windows) is linked to an            */
		;*  application that uses different CRT library.                              */
		errno: "zmq_errno" [return: [zmq-error-code!]]
		;*  Resolves system errors and 0MQ errors to human-readable string.
		strerror: "zmq_strerror" [
			errnum [integer!]
			return: [c-string!]
		]

		;******************************************************************************/
		;*  0MQ infrastructure (a.k.a. context) initialisation & termination.         */
		;******************************************************************************/

		ctx_new: "zmq_ctx_new" [ return: [handle!]]
		ctx_term: "zmq_ctx_term" [context [handle!] return: [integer!]]
		ctx_shutdown: "zmq_ctx_shutdown" [context [handle!] return: [integer!]]
		ctx_set: "zmq_ctx_set" [context [handle!] option [integer!] optval [integer!] return: [integer!]]
		ctx_get: "zmq_ctx_get" [context [handle!] option [integer!] return: [integer!]]
		;*  Old (legacy) API
		init: "zmq_init" [io_threads [integer!] return: [handle!]]
		term: "zmq_term" [context [handle!] return: [integer!]]
		ctx_destroy: "zmq_ctx_destroy" [context [handle!] return: [integer!]]

		;******************************************************************************/
		;*  0MQ message definition.                                                   */
		;******************************************************************************/
		msg_init: "zmq_msg_init" [msg [zmq-message!] return: [integer!]]
		msg_init_size: "zmq_msg_init_size" [msg [zmq-message!] size [integer!] return: [integer!]]
		msg_init_data: "zmq_msg_init_data" [
			msg     [zmq-message!]
			data    [byte-ptr!]
			size    [integer!]
			ffn     [function! [data [byte-ptr!] hint [handle!]]]
			hint    [handle!]
			return: [integer!]
		]
		msg_send: "zmq_msg_send" [
			msg     [zmq-message!]
			s       [byte-ptr!]
			flags   [integer!]
			return: [integer!]
		]
		msg_recv: "zmq_msg_recv" [
			msg     [zmq-message!]
			s       [byte-ptr!]
			flags   [integer!]
			return: [integer!]
		]
		msg_close: "zmq_msg_close" [
			msg     [zmq-message!]
			return: [integer!]
		]
		msg_move: "zmq_msg_move" [
			dest    [zmq-message!]
			src     [zmq-message!]
			return: [integer!]
		]
		msg_copy: "zmq_msg_move" [
			dest    [zmq-message!]
			src     [zmq-message!]
			return: [integer!]
		]
		msg_data: "zmq_msg_data" [msg [zmq-message!] return: [byte-ptr!]]
		msg_size: "zmq_msg_size" [msg [zmq-message!] return: [integer!]]
		msg_more: "zmq_msg_more" [msg [zmq-message!] return: [integer!]] ;Is message followed by more parts in a multi-part message?
		msg_get: "zmq_msg_get" [msg [zmq-message!] option [integer!] return: [integer!]]
		msg_set: "zmq_msg_set" [msg [zmq-message!] option [integer!] optval [integer!] return: [integer!]]

		;******************************************************************************/
		;*  0MQ socket events and monitoring                                          */
		;******************************************************************************/
		socket: "zmq_socket" [
			pool    [byte-ptr!]
			type    [integer!]
			return: [zmq-socket!]
		]
		close: "zmq_close" [s [zmq-socket!] return: [integer!]]
		setsockopt: "zmq_setsockopt" [
			s       [zmq-socket!]
			option  [integer!]
			optval  [byte-ptr!]
			optvallen [integer!]
			return: [integer!]
		]
		getsockopt: "zmq_getsockopt" [
			s       [zmq-socket!]
			option  [integer!]
			optval  [byte-ptr!]
			optvallen [int-ptr!]
			return: [integer!]
		]
		bind: "zmq_bind" [
			s       [zmq-socket!]
			addr    [c-string!]
			return: [integer!]
		]
		connect: "zmq_connect" [
			s       [zmq-socket!]
			addr    [c-string!]
			return: [integer!]
		]
		unbind: "zmq_unbind" [
			s       [zmq-socket!]
			addr    [c-string!]
			return: [integer!]
		]
		disconnect: "zmq_disconnect" [
			s       [zmq-socket!]
			addr    [c-string!]
			return: [integer!]
		]
		send: "zmq_send" [
			s       [zmq-socket!]
			buf     [byte-ptr!]
			len     [integer!]
			flags   [integer!]
			return: [integer!]
		]
		send_const: "zmq_send_const" [
			s       [zmq-socket!]
			buf     [byte-ptr!]
			len     [integer!]
			flags   [integer!]
			return: [integer!]
		]
		recv: "zmq_recv" [
			s       [zmq-socket!]
			buf     [byte-ptr!]
			len     [integer!]
			flags   [integer!]
			return: [integer!]
		]
		socket_monitor: "zmq_socket_monitor" [
			s       [zmq-socket!]
			addr    [c-string!]
			events  [integer!]
			return: [integer!]
		]
		sendmsg: "zmq_sendmsg" [
			s       [zmq-socket!]
			msg     [zmq-message!]
			flags   [integer!]
			return: [integer!]
		]
		recvmsg: "zmq_recvmsg" [
			s       [zmq-socket!]
			msg     [zmq-message!]
			flags   [integer!]
			return: [integer!]
		]

		;******************************************************************************/
		;*  I/O multiplexing.                                                         */
		;******************************************************************************/
		poll: "zmq_poll" [
			items   [int-ptr!]
			nitems  [integer!]
			timeout [integer!]
			return: [integer!]
		]
		;*  Built-in message proxy (3-way)
		proxy: "zmq_proxy" [
			frontend [zmq-socket!]
			backend  [zmq-socket!]
			capture  [zmq-socket!]
			return: [integer!]
		]
		;*  Encode a binary key as printable text using ZMQ RFC 32
		z85_encode: "zmq_z85_encode" [
			dest   [c-string!]
			data   [byte-ptr!]
			size   [integer!]
			return: [c-string!]
		]
		;*  Encode a binary key from printable text per ZMQ RFC 32
		z85_decode: "zmq_z85_decode" [
			dest    [byte-ptr!]
			string  [c-string!]
			return: [byte-ptr!]
		]
	]]
]