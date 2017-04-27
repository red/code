Red/System [
	Title:   "Red/System SteamGameServer API binding"
	Author:  "Oldes"
	File: 	 %Steam-GameServer.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamGameServer: declare ISteamGameServer!

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamGameServer_InitGameServer: "SteamAPI_ISteamGameServer_InitGameServer" [
			instancePtr      [ISteamGameServer!];intptr_t
			unIP             [integer!]        ;uint32
			usGamePort       [uint16!]         ;uint16
			usQueryPort      [uint16!]         ;uint16
			unFlags          [integer!]        ;uint32
			nGameAppId       [integer!]        ;AppId_t
			pchVersionString [c-string!]       ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamGameServer_SetProduct: "SteamAPI_ISteamGameServer_SetProduct" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pszProduct  [c-string!]            ;const char *
		]
		SteamAPI_ISteamGameServer_SetGameDescription: "SteamAPI_ISteamGameServer_SetGameDescription" [
			instancePtr        [ISteamGameServer!];intptr_t
			pszGameDescription [c-string!]     ;const char *
		]
		SteamAPI_ISteamGameServer_SetModDir: "SteamAPI_ISteamGameServer_SetModDir" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pszModDir   [c-string!]            ;const char *
		]
		SteamAPI_ISteamGameServer_SetDedicatedServer: "SteamAPI_ISteamGameServer_SetDedicatedServer" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			bDedicated  [logic!]               ;bool
		]
		SteamAPI_ISteamGameServer_LogOn: "SteamAPI_ISteamGameServer_LogOn" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pszToken    [c-string!]            ;const char *
		]
		SteamAPI_ISteamGameServer_LogOnAnonymous: "SteamAPI_ISteamGameServer_LogOnAnonymous" [
			instancePtr [ISteamGameServer!]    ;intptr_t
		]
		SteamAPI_ISteamGameServer_LogOff: "SteamAPI_ISteamGameServer_LogOff" [
			instancePtr [ISteamGameServer!]    ;intptr_t
		]
		SteamAPI_ISteamGameServer_BLoggedOn: "SteamAPI_ISteamGameServer_BLoggedOn" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamGameServer_BSecure: "SteamAPI_ISteamGameServer_BSecure" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamGameServer_GetSteamID: "SteamAPI_ISteamGameServer_GetSteamID" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			return: [uint64! value]
		]
		SteamAPI_ISteamGameServer_WasRestartRequested: "SteamAPI_ISteamGameServer_WasRestartRequested" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamGameServer_SetMaxPlayerCount: "SteamAPI_ISteamGameServer_SetMaxPlayerCount" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			cPlayersMax [integer!]             ;int
		]
		SteamAPI_ISteamGameServer_SetBotPlayerCount: "SteamAPI_ISteamGameServer_SetBotPlayerCount" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			cBotplayers [integer!]             ;int
		]
		SteamAPI_ISteamGameServer_SetServerName: "SteamAPI_ISteamGameServer_SetServerName" [
			instancePtr   [ISteamGameServer!]  ;intptr_t
			pszServerName [c-string!]          ;const char *
		]
		SteamAPI_ISteamGameServer_SetMapName: "SteamAPI_ISteamGameServer_SetMapName" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pszMapName  [c-string!]            ;const char *
		]
		SteamAPI_ISteamGameServer_SetPasswordProtected: "SteamAPI_ISteamGameServer_SetPasswordProtected" [
			instancePtr        [ISteamGameServer!];intptr_t
			bPasswordProtected [logic!]        ;bool
		]
		SteamAPI_ISteamGameServer_SetSpectatorPort: "SteamAPI_ISteamGameServer_SetSpectatorPort" [
			instancePtr     [ISteamGameServer!];intptr_t
			unSpectatorPort [uint16!]          ;uint16
		]
		SteamAPI_ISteamGameServer_SetSpectatorServerName: "SteamAPI_ISteamGameServer_SetSpectatorServerName" [
			instancePtr         [ISteamGameServer!];intptr_t
			pszSpectatorServerName[c-string!]  ;const char *
		]
		SteamAPI_ISteamGameServer_ClearAllKeyValues: "SteamAPI_ISteamGameServer_ClearAllKeyValues" [
			instancePtr [ISteamGameServer!]    ;intptr_t
		]
		SteamAPI_ISteamGameServer_SetKeyValue: "SteamAPI_ISteamGameServer_SetKeyValue" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pKey        [c-string!]            ;const char *
			pValue      [c-string!]            ;const char *
		]
		SteamAPI_ISteamGameServer_SetGameTags: "SteamAPI_ISteamGameServer_SetGameTags" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pchGameTags [c-string!]            ;const char *
		]
		SteamAPI_ISteamGameServer_SetGameData: "SteamAPI_ISteamGameServer_SetGameData" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pchGameData [c-string!]            ;const char *
		]
		SteamAPI_ISteamGameServer_SetRegion: "SteamAPI_ISteamGameServer_SetRegion" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pszRegion   [c-string!]            ;const char *
		]
		SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate: {SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate} [
			instancePtr     [ISteamGameServer!];intptr_t
			unIPClient      [integer!]         ;uint32
			pvAuthBlob      [byte-ptr!]        ;const void *
			cubAuthBlobSize [integer!]         ;uint32
			pSteamIDUser    [CSteamID-ref!]    ;class CSteamID *
			return: [logic!]
		]
		SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection: {SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection} [
			instancePtr [ISteamGameServer!]    ;intptr_t
			return: [uint64! value]
		]
		SteamAPI_ISteamGameServer_SendUserDisconnect: "SteamAPI_ISteamGameServer_SendUserDisconnect" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
		]
		SteamAPI_ISteamGameServer_BUpdateUserData: "SteamAPI_ISteamGameServer_BUpdateUserData" [
			instancePtr   [ISteamGameServer!]  ;intptr_t
			steamIDUser   [CSteamID!]          ;class CSteamID
			pchPlayerName [c-string!]          ;const char *
			uScore        [integer!]           ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamGameServer_GetAuthSessionTicket: "SteamAPI_ISteamGameServer_GetAuthSessionTicket" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pTicket     [byte-ptr!]            ;void *
			cbMaxTicket [integer!]             ;int
			pcbTicket   [int-ptr!]             ;uint32 *
			return: [HAuthTicket!]
		]
		SteamAPI_ISteamGameServer_BeginAuthSession: "SteamAPI_ISteamGameServer_BeginAuthSession" [
			instancePtr  [ISteamGameServer!]   ;intptr_t
			pAuthTicket  [byte-ptr!]           ;const void *
			cbAuthTicket [integer!]            ;int
			steamID      [CSteamID!]           ;class CSteamID
			return: [EBeginAuthSessionResult!]
		]
		SteamAPI_ISteamGameServer_EndAuthSession: "SteamAPI_ISteamGameServer_EndAuthSession" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			steamID     [CSteamID!]            ;class CSteamID
		]
		SteamAPI_ISteamGameServer_CancelAuthTicket: "SteamAPI_ISteamGameServer_CancelAuthTicket" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			hAuthTicket [HAuthTicket!]         ;HAuthTicket
		]
		SteamAPI_ISteamGameServer_UserHasLicenseForApp: "SteamAPI_ISteamGameServer_UserHasLicenseForApp" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			steamID     [CSteamID!]            ;class CSteamID
			appID       [integer!]             ;AppId_t
			return: [EUserHasLicenseForAppResult!]
		]
		SteamAPI_ISteamGameServer_RequestUserGroupStatus: "SteamAPI_ISteamGameServer_RequestUserGroupStatus" [
			instancePtr  [ISteamGameServer!]   ;intptr_t
			steamIDUser  [CSteamID!]           ;class CSteamID
			steamIDGroup [CSteamID!]           ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamGameServer_GetGameplayStats: "SteamAPI_ISteamGameServer_GetGameplayStats" [
			instancePtr [ISteamGameServer!]    ;intptr_t
		]
		SteamAPI_ISteamGameServer_GetServerReputation: "SteamAPI_ISteamGameServer_GetServerReputation" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			return: [uint64! value]
		]
		SteamAPI_ISteamGameServer_GetPublicIP: "SteamAPI_ISteamGameServer_GetPublicIP" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamGameServer_HandleIncomingPacket: "SteamAPI_ISteamGameServer_HandleIncomingPacket" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pData       [byte-ptr!]            ;const void *
			cbData      [integer!]             ;int
			srcIP       [integer!]             ;uint32
			srcPort     [uint16!]              ;uint16
			return: [logic!]
		]
		SteamAPI_ISteamGameServer_GetNextOutgoingPacket: "SteamAPI_ISteamGameServer_GetNextOutgoingPacket" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			pOut        [byte-ptr!]            ;void *
			cbMaxOut    [integer!]             ;int
			pNetAdr     [int-ptr!]             ;uint32 *
			pPort       [pointer! [uint16!]]   ;uint16 *
			return: [integer!]
		]
		SteamAPI_ISteamGameServer_EnableHeartbeats: "SteamAPI_ISteamGameServer_EnableHeartbeats" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			bActive     [logic!]               ;bool
		]
		SteamAPI_ISteamGameServer_SetHeartbeatInterval: "SteamAPI_ISteamGameServer_SetHeartbeatInterval" [
			instancePtr        [ISteamGameServer!];intptr_t
			iHeartbeatInterval [integer!]      ;int
		]
		SteamAPI_ISteamGameServer_ForceHeartbeat: "SteamAPI_ISteamGameServer_ForceHeartbeat" [
			instancePtr [ISteamGameServer!]    ;intptr_t
		]
		SteamAPI_ISteamGameServer_AssociateWithClan: "SteamAPI_ISteamGameServer_AssociateWithClan" [
			instancePtr [ISteamGameServer!]    ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility: {SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility} [
			instancePtr      [ISteamGameServer!];intptr_t
			steamIDNewPlayer [CSteamID!]       ;class CSteamID
			return: [uint64! value]
		]
	]
]

