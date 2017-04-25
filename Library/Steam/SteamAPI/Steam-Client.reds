Red/System [
	Title:   "Red/System SteamClient API binding"
	Author:  "Oldes"
	File: 	 %Steam-Client.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamClient: declare ISteamClient!

#import [
	STEAM_LIBRARY STEAM_CALL  [
		SteamAPI_ISteamClient_CreateSteamPipe: "SteamAPI_ISteamClient_CreateSteamPipe" [
			instancePtr [ISteamClient!]        ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamClient_BReleaseSteamPipe: "SteamAPI_ISteamClient_BReleaseSteamPipe" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamPipe  [integer!]             ;HSteamPipe
			return: [logic!]
		]
		SteamAPI_ISteamClient_ConnectToGlobalUser: "SteamAPI_ISteamClient_ConnectToGlobalUser" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamPipe  [integer!]             ;HSteamPipe
			return: [integer!]
		]
		SteamAPI_ISteamClient_CreateLocalUser: "SteamAPI_ISteamClient_CreateLocalUser" [
			instancePtr  [ISteamClient!]       ;intptr_t
			phSteamPipe  [int-ptr!]            ;HSteamPipe *
			eAccountType [EAccountType!]       ;EAccountType
			return: [integer!]
		]
		SteamAPI_ISteamClient_ReleaseUser: "SteamAPI_ISteamClient_ReleaseUser" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamPipe  [integer!]             ;HSteamPipe
			hUser       [integer!]             ;HSteamUser
		]
		SteamAPI_ISteamClient_GetISteamUser: "SteamAPI_ISteamClient_GetISteamUser" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamUser!]
		]
		SteamAPI_ISteamClient_GetISteamGameServer: "SteamAPI_ISteamClient_GetISteamGameServer" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamGameServer!]
		]
		SteamAPI_ISteamClient_SetLocalIPBinding: "SteamAPI_ISteamClient_SetLocalIPBinding" [
			instancePtr [ISteamClient!]        ;intptr_t
			unIP        [integer!]             ;uint32
			usPort      [uint16!]              ;uint16
		]
		SteamAPI_ISteamClient_GetISteamFriends: "SteamAPI_ISteamClient_GetISteamFriends" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamFriends!]
		]
		SteamAPI_ISteamClient_GetISteamUtils: "SteamAPI_ISteamClient_GetISteamUtils" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamUtils!]
		]
		SteamAPI_ISteamClient_GetISteamMatchmaking: "SteamAPI_ISteamClient_GetISteamMatchmaking" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamMatchmaking!]
		]
		SteamAPI_ISteamClient_GetISteamMatchmakingServers: "SteamAPI_ISteamClient_GetISteamMatchmakingServers" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamMatchmakingServers!]
		]
		SteamAPI_ISteamClient_GetISteamGenericInterface: "SteamAPI_ISteamClient_GetISteamGenericInterface" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [int-ptr!]
		]
		SteamAPI_ISteamClient_GetISteamUserStats: "SteamAPI_ISteamClient_GetISteamUserStats" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamUserStats!]
		]
		SteamAPI_ISteamClient_GetISteamGameServerStats: "SteamAPI_ISteamClient_GetISteamGameServerStats" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamuser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamGameServerStats!]
		]
		SteamAPI_ISteamClient_GetISteamApps: "SteamAPI_ISteamClient_GetISteamApps" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamApps!]
		]
		SteamAPI_ISteamClient_GetISteamNetworking: "SteamAPI_ISteamClient_GetISteamNetworking" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamNetworking!]
		]
		SteamAPI_ISteamClient_GetISteamRemoteStorage: "SteamAPI_ISteamClient_GetISteamRemoteStorage" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamuser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamRemoteStorage!]
		]
		SteamAPI_ISteamClient_GetISteamScreenshots: "SteamAPI_ISteamClient_GetISteamScreenshots" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamuser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamScreenshots!]
		]
		SteamAPI_ISteamClient_GetIPCCallCount: "SteamAPI_ISteamClient_GetIPCCallCount" [
			instancePtr [ISteamClient!]        ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamClient_SetWarningMessageHook: "SteamAPI_ISteamClient_SetWarningMessageHook" [
			instancePtr [ISteamClient!]        ;intptr_t
			pFunction   [function! [a [integer!] b [c-string!]]];SteamAPIWarningMessageHook_t
		]
		SteamAPI_ISteamClient_BShutdownIfAllPipesClosed: "SteamAPI_ISteamClient_BShutdownIfAllPipesClosed" [
			instancePtr [ISteamClient!]        ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamClient_GetISteamHTTP: "SteamAPI_ISteamClient_GetISteamHTTP" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamuser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamHTTP!]
		]
		SteamAPI_ISteamClient_GetISteamUnifiedMessages: "SteamAPI_ISteamClient_GetISteamUnifiedMessages" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamuser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamUnifiedMessages!]
		]
		SteamAPI_ISteamClient_GetISteamController: "SteamAPI_ISteamClient_GetISteamController" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamController!]
		]
		SteamAPI_ISteamClient_GetISteamUGC: "SteamAPI_ISteamClient_GetISteamUGC" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamUGC!]
		]
		SteamAPI_ISteamClient_GetISteamAppList: "SteamAPI_ISteamClient_GetISteamAppList" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamUser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamAppList!]
		]
		SteamAPI_ISteamClient_GetISteamMusic: "SteamAPI_ISteamClient_GetISteamMusic" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamuser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamMusic!]
		]
		SteamAPI_ISteamClient_GetISteamMusicRemote: "SteamAPI_ISteamClient_GetISteamMusicRemote" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamuser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamMusicRemote!]
		]
		SteamAPI_ISteamClient_GetISteamHTMLSurface: "SteamAPI_ISteamClient_GetISteamHTMLSurface" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamuser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamHTMLSurface!]
		]
		SteamAPI_ISteamClient_GetISteamInventory: "SteamAPI_ISteamClient_GetISteamInventory" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamuser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamInventory!]
		]
		SteamAPI_ISteamClient_GetISteamVideo: "SteamAPI_ISteamClient_GetISteamVideo" [
			instancePtr [ISteamClient!]        ;intptr_t
			hSteamuser  [integer!]             ;HSteamUser
			hSteamPipe  [integer!]             ;HSteamPipe
			pchVersion  [c-string!]            ;const char *
			return: [ISteamVideo!]
		]
	]
]

