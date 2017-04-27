Red/System [
	Title:   "Red/System SteamUnifiedMessages API binding"
	Author:  "Oldes"
	File: 	 %Steam-UnifiedMessages.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamUnifiedMessages: declare ISteamUnifiedMessages!

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamUnifiedMessages_SendMethod: "SteamAPI_ISteamUnifiedMessages_SendMethod" [
			instancePtr         [ISteamUnifiedMessages!];intptr_t
			pchServiceMethod    [c-string!]    ;const char *
			pRequestBuffer      [byte-ptr!]    ;const void *
			unRequestBufferSize [integer!]     ;uint32
			unContext           [uint64! value];uint64
			return: [uint64! value]
		]
		SteamAPI_ISteamUnifiedMessages_GetMethodResponseInfo: {SteamAPI_ISteamUnifiedMessages_GetMethodResponseInfo} [
			instancePtr     [ISteamUnifiedMessages!];intptr_t
			hHandle         [uint64! value]    ;ClientUnifiedMessageHandle
			punResponseSize [int-ptr!]         ;uint32 *
			peResult        [int-ptr!]         ;EResult *
			return: [logic!]
		]
		SteamAPI_ISteamUnifiedMessages_GetMethodResponseData: {SteamAPI_ISteamUnifiedMessages_GetMethodResponseData} [
			instancePtr         [ISteamUnifiedMessages!];intptr_t
			hHandle             [uint64! value];ClientUnifiedMessageHandle
			pResponseBuffer     [byte-ptr!]    ;void *
			unResponseBufferSize[integer!]     ;uint32
			bAutoRelease        [logic!]       ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUnifiedMessages_ReleaseMethod: "SteamAPI_ISteamUnifiedMessages_ReleaseMethod" [
			instancePtr [ISteamUnifiedMessages!];intptr_t
			hHandle     [uint64! value]        ;ClientUnifiedMessageHandle
			return: [logic!]
		]
		SteamAPI_ISteamUnifiedMessages_SendNotification: "SteamAPI_ISteamUnifiedMessages_SendNotification" [
			instancePtr         [ISteamUnifiedMessages!];intptr_t
			pchServiceNotification[c-string!]  ;const char *
			pNotificationBuffer [byte-ptr!]    ;const void *
			unNotificationBufferSize[integer!] ;uint32
			return: [logic!]
		]
	]
]

