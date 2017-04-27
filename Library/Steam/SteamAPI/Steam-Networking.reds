Red/System [
	Title:   "Red/System SteamNetworking API binding"
	Author:  "Oldes"
	File: 	 %Steam-Networking.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamNetworking: declare ISteamNetworking!

; list of possible errors returned by SendP2PPacket() API
; these will be posted in the P2PSessionConnectFail_t callback
#enum EP2PSessionError! [
	k_EP2PSessionErrorNone: 0
	k_EP2PSessionErrorNotRunningApp: 1			; target is not running the same game
	k_EP2PSessionErrorNoRightsToApp: 2			; local user doesn't own the app that is running
	k_EP2PSessionErrorDestinationNotLoggedIn: 3	; target user isn't connected to Steam
	k_EP2PSessionErrorTimeout: 4				; target isn't responding, perhaps not calling AcceptP2PSessionWithUser()
												; corporate firewalls can also block this (NAT traversal is not firewall traversal)
												; make sure that UDP ports 3478, 4379, and 4380 are open in an outbound direction
	k_EP2PSessionErrorMax: 5
]

; SendP2PPacket() send types
; Typically k_EP2PSendUnreliable is what you want for UDP-like packets, k_EP2PSendReliable for TCP-like packets
#enum EP2PSend! [
	; Basic UDP send. Packets can't be bigger than 1200 bytes (your typical MTU size). Can be lost, or arrive out of order (rare).
	; The sending API does have some knowledge of the underlying connection, so if there is no NAT-traversal accomplished or
	; there is a recognized adjustment happening on the connection, the packet will be batched until the connection is open again.
	k_EP2PSendUnreliable: 0

	; As above, but if the underlying p2p connection isn't yet established the packet will just be thrown away. Using this on the first
	; packet sent to a remote host almost guarantees the packet will be dropped.
	; This is only really useful for kinds of data that should never buffer up, i.e. voice payload packets
	k_EP2PSendUnreliableNoDelay: 1

	; Reliable message send. Can send up to 1MB of data in a single message. 
	; Does fragmentation/re-assembly of messages under the hood, as well as a sliding window for efficient sends of large chunks of data. 
	k_EP2PSendReliable: 2

	; As above, but applies the Nagle algorithm to the send - sends will accumulate 
	; until the current MTU size (typically ~1200 bytes, but can change) or ~200ms has passed (Nagle algorithm). 
	; Useful if you want to send a set of smaller messages but have the coalesced into a single packet
	; Since the reliable stream is all ordered, you can do several small message sends with k_EP2PSendReliableWithBuffering and then
	; do a normal k_EP2PSendReliable to force all the buffered data to be sent.
	k_EP2PSendReliableWithBuffering: 3
]

; connection progress indicators, used by CreateP2PConnectionSocket()
#enum ESNetSocketState! [
	k_ESNetSocketStateInvalid: 0						

	; communication is valid
	k_ESNetSocketStateConnected: 1				
	
	; states while establishing a connection
	k_ESNetSocketStateInitiated: 10				; the connection state machine has started

	; p2p connections
	k_ESNetSocketStateLocalCandidatesFound: 11	; we've found our local IP info
	k_ESNetSocketStateReceivedRemoteCandidates: 12 ; we've received information from the remote machine, via the Steam back-end, about their IP info

	; direct connections
	k_ESNetSocketStateChallengeHandshake: 15		; we've received a challenge packet from the server

	; failure states
	k_ESNetSocketStateDisconnecting: 21			; the API shut it down, and we're in the process of telling the other end	
	k_ESNetSocketStateLocalDisconnect: 22		; the API shut it down, and we've completed shutdown
	k_ESNetSocketStateTimeoutDuringConnect: 23	; we timed out while trying to creating the connection
	k_ESNetSocketStateRemoteEndDisconnected: 24	; the remote end has disconnected from us
	k_ESNetSocketStateConnectionBroken: 25		; connection has been broken; either the other end has disappeared or our local network connection has broke
]

; describes how the socket is currently connected
#enum ESNetSocketConnectionType! [
	k_ESNetSocketConnectionTypeNotConnected: 0
	k_ESNetSocketConnectionTypeUDP: 1
	k_ESNetSocketConnectionTypeUDPRelay: 2
]



#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamNetworking_SendP2PPacket: "SteamAPI_ISteamNetworking_SendP2PPacket" [
			instancePtr   [ISteamNetworking!]  ;intptr_t
			steamIDRemote [CSteamID!]          ;class CSteamID
			pubData       [byte-ptr!]          ;const void *
			cubData       [integer!]           ;uint32
			eP2PSendType  [EP2PSend!]          ;EP2PSend
			nChannel      [integer!]           ;int
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_IsP2PPacketAvailable: "SteamAPI_ISteamNetworking_IsP2PPacketAvailable" [
			instancePtr [ISteamNetworking!]    ;intptr_t
			pcubMsgSize [int-ptr!]             ;uint32 *
			nChannel    [integer!]             ;int
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_ReadP2PPacket: "SteamAPI_ISteamNetworking_ReadP2PPacket" [
			instancePtr    [ISteamNetworking!] ;intptr_t
			pubDest        [byte-ptr!]         ;void *
			cubDest        [integer!]          ;uint32
			pcubMsgSize    [int-ptr!]          ;uint32 *
			psteamIDRemote [CSteamID-ref!]     ;class CSteamID *
			nChannel       [integer!]          ;int
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser: "SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser" [
			instancePtr   [ISteamNetworking!]  ;intptr_t
			steamIDRemote [CSteamID!]          ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_CloseP2PSessionWithUser: "SteamAPI_ISteamNetworking_CloseP2PSessionWithUser" [
			instancePtr   [ISteamNetworking!]  ;intptr_t
			steamIDRemote [CSteamID!]          ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_CloseP2PChannelWithUser: "SteamAPI_ISteamNetworking_CloseP2PChannelWithUser" [
			instancePtr   [ISteamNetworking!]  ;intptr_t
			steamIDRemote [CSteamID!]          ;class CSteamID
			nChannel      [integer!]           ;int
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_GetP2PSessionState: "SteamAPI_ISteamNetworking_GetP2PSessionState" [
			instancePtr      [ISteamNetworking!];intptr_t
			steamIDRemote    [CSteamID!]       ;class CSteamID
			pConnectionState [int-ptr!]        ;struct P2PSessionState_t *
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_AllowP2PPacketRelay: "SteamAPI_ISteamNetworking_AllowP2PPacketRelay" [
			instancePtr [ISteamNetworking!]    ;intptr_t
			bAllow      [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_CreateListenSocket: "SteamAPI_ISteamNetworking_CreateListenSocket" [
			instancePtr         [ISteamNetworking!];intptr_t
			nVirtualP2PPort     [integer!]     ;int
			nIP                 [integer!]     ;uint32
			nPort               [uint16!]      ;uint16
			bAllowUseOfPacketRelay[logic!]     ;bool
			return: [integer!]
		]
		SteamAPI_ISteamNetworking_CreateP2PConnectionSocket: {SteamAPI_ISteamNetworking_CreateP2PConnectionSocket} [
			instancePtr         [ISteamNetworking!];intptr_t
			steamIDTarget       [CSteamID!]    ;class CSteamID
			nVirtualPort        [integer!]     ;int
			nTimeoutSec         [integer!]     ;int
			bAllowUseOfPacketRelay[logic!]     ;bool
			return: [integer!]
		]
		SteamAPI_ISteamNetworking_CreateConnectionSocket: "SteamAPI_ISteamNetworking_CreateConnectionSocket" [
			instancePtr [ISteamNetworking!]    ;intptr_t
			nIP         [integer!]             ;uint32
			nPort       [uint16!]              ;uint16
			nTimeoutSec [integer!]             ;int
			return: [integer!]
		]
		SteamAPI_ISteamNetworking_DestroySocket: "SteamAPI_ISteamNetworking_DestroySocket" [
			instancePtr      [ISteamNetworking!];intptr_t
			hSocket          [integer!]        ;SNetSocket_t
			bNotifyRemoteEnd [logic!]          ;bool
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_DestroyListenSocket: "SteamAPI_ISteamNetworking_DestroyListenSocket" [
			instancePtr      [ISteamNetworking!];intptr_t
			hSocket          [integer!]        ;SNetListenSocket_t
			bNotifyRemoteEnd [logic!]          ;bool
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_SendDataOnSocket: "SteamAPI_ISteamNetworking_SendDataOnSocket" [
			instancePtr [ISteamNetworking!]    ;intptr_t
			hSocket     [integer!]             ;SNetSocket_t
			pubData     [byte-ptr!]            ;void *
			cubData     [integer!]             ;uint32
			bReliable   [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_IsDataAvailableOnSocket: "SteamAPI_ISteamNetworking_IsDataAvailableOnSocket" [
			instancePtr [ISteamNetworking!]    ;intptr_t
			hSocket     [integer!]             ;SNetSocket_t
			pcubMsgSize [int-ptr!]             ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_RetrieveDataFromSocket: "SteamAPI_ISteamNetworking_RetrieveDataFromSocket" [
			instancePtr [ISteamNetworking!]    ;intptr_t
			hSocket     [integer!]             ;SNetSocket_t
			pubDest     [byte-ptr!]            ;void *
			cubDest     [integer!]             ;uint32
			pcubMsgSize [int-ptr!]             ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_IsDataAvailable: "SteamAPI_ISteamNetworking_IsDataAvailable" [
			instancePtr   [ISteamNetworking!]  ;intptr_t
			hListenSocket [integer!]           ;SNetListenSocket_t
			pcubMsgSize   [int-ptr!]           ;uint32 *
			phSocket      [int-ptr!]           ;SNetSocket_t *
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_RetrieveData: "SteamAPI_ISteamNetworking_RetrieveData" [
			instancePtr   [ISteamNetworking!]  ;intptr_t
			hListenSocket [integer!]           ;SNetListenSocket_t
			pubDest       [byte-ptr!]          ;void *
			cubDest       [integer!]           ;uint32
			pcubMsgSize   [int-ptr!]           ;uint32 *
			phSocket      [int-ptr!]           ;SNetSocket_t *
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_GetSocketInfo: "SteamAPI_ISteamNetworking_GetSocketInfo" [
			instancePtr    [ISteamNetworking!] ;intptr_t
			hSocket        [integer!]          ;SNetSocket_t
			pSteamIDRemote [CSteamID-ref!]     ;class CSteamID *
			peSocketStatus [int-ptr!]          ;int *
			punIPRemote    [int-ptr!]          ;uint32 *
			punPortRemote  [pointer! [uint16!]];uint16 *
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_GetListenSocketInfo: "SteamAPI_ISteamNetworking_GetListenSocketInfo" [
			instancePtr   [ISteamNetworking!]  ;intptr_t
			hListenSocket [integer!]           ;SNetListenSocket_t
			pnIP          [int-ptr!]           ;uint32 *
			pnPort        [pointer! [uint16!]] ;uint16 *
			return: [logic!]
		]
		SteamAPI_ISteamNetworking_GetSocketConnectionType: "SteamAPI_ISteamNetworking_GetSocketConnectionType" [
			instancePtr [ISteamNetworking!]    ;intptr_t
			hSocket     [integer!]             ;SNetSocket_t
			return: [ESNetSocketConnectionType!]
		]
		SteamAPI_ISteamNetworking_GetMaxPacketSize: "SteamAPI_ISteamNetworking_GetMaxPacketSize" [
			instancePtr [ISteamNetworking!]    ;intptr_t
			hSocket     [integer!]             ;SNetSocket_t
			return: [integer!]
		]
	]
]

