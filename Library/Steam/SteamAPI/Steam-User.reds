Red/System [
	Title:   "Red/System SteamUser API binding"
	Author:  "Oldes"
	File: 	 %Steam-user.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamUser: declare ISteamUser!

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamUser_GetHSteamUser: "SteamAPI_ISteamUser_GetHSteamUser" [
			instancePtr [ISteamUser!]          ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUser_BLoggedOn: "SteamAPI_ISteamUser_BLoggedOn" [
			instancePtr [ISteamUser!]          ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUser_GetSteamID: "SteamAPI_ISteamUser_GetSteamID" [
			instancePtr [ISteamUser!]          ;intptr_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUser_InitiateGameConnection: "SteamAPI_ISteamUser_InitiateGameConnection" [
			instancePtr       [ISteamUser!]    ;intptr_t
			pAuthBlob         [byte-ptr!]      ;void *
			cbMaxAuthBlob     [integer!]       ;int
			steamIDGameServer [CSteamID!]      ;class CSteamID
			unIPServer        [integer!]       ;uint32
			usPortServer      [uint16!]        ;uint16
			bSecure           [logic!]         ;bool
			return: [integer!]
		]
		SteamAPI_ISteamUser_TerminateGameConnection: "SteamAPI_ISteamUser_TerminateGameConnection" [
			instancePtr  [ISteamUser!]         ;intptr_t
			unIPServer   [integer!]            ;uint32
			usPortServer [uint16!]             ;uint16
		]
		SteamAPI_ISteamUser_TrackAppUsageEvent: "SteamAPI_ISteamUser_TrackAppUsageEvent" [
			instancePtr    [ISteamUser!]       ;intptr_t
			gameID         [CGameID!]          ;class CGameID
			eAppUsageEvent [integer!]          ;int
			pchExtraInfo   [c-string!]         ;const char *
		]
		SteamAPI_ISteamUser_GetUserDataFolder: "SteamAPI_ISteamUser_GetUserDataFolder" [
			instancePtr [ISteamUser!]          ;intptr_t
			pchBuffer   [c-string!]            ;char *
			cubBuffer   [integer!]             ;int
			return: [logic!]
		]
		SteamAPI_ISteamUser_StartVoiceRecording: "SteamAPI_ISteamUser_StartVoiceRecording" [
			instancePtr [ISteamUser!]          ;intptr_t
		]
		SteamAPI_ISteamUser_StopVoiceRecording: "SteamAPI_ISteamUser_StopVoiceRecording" [
			instancePtr [ISteamUser!]          ;intptr_t
		]
		SteamAPI_ISteamUser_GetAvailableVoice: "SteamAPI_ISteamUser_GetAvailableVoice" [
			instancePtr         [ISteamUser!]  ;intptr_t
			pcbCompressed       [int-ptr!]     ;uint32 *
			pcbUncompressed     [int-ptr!]     ;uint32 *
			nUncompressedVoiceDesiredSampleRate[integer!];uint32
			return: [EVoiceResult!]
		]
		SteamAPI_ISteamUser_GetVoice: "SteamAPI_ISteamUser_GetVoice" [
			instancePtr         [ISteamUser!]  ;intptr_t
			bWantCompressed     [logic!]       ;bool
			pDestBuffer         [byte-ptr!]    ;void *
			cbDestBufferSize    [integer!]     ;uint32
			nBytesWritten       [int-ptr!]     ;uint32 *
			bWantUncompressed   [logic!]       ;bool
			pUncompressedDestBuffer[byte-ptr!] ;void *
			cbUncompressedDestBufferSize[integer!];uint32
			nUncompressBytesWritten[int-ptr!]  ;uint32 *
			nUncompressedVoiceDesiredSampleRate[integer!];uint32
			return: [EVoiceResult!]
		]
		SteamAPI_ISteamUser_DecompressVoice: "SteamAPI_ISteamUser_DecompressVoice" [
			instancePtr        [ISteamUser!]   ;intptr_t
			pCompressed        [byte-ptr!]     ;const void *
			cbCompressed       [integer!]      ;uint32
			pDestBuffer        [byte-ptr!]     ;void *
			cbDestBufferSize   [integer!]      ;uint32
			nBytesWritten      [int-ptr!]      ;uint32 *
			nDesiredSampleRate [integer!]      ;uint32
			return: [EVoiceResult!]
		]
		SteamAPI_ISteamUser_GetVoiceOptimalSampleRate: "SteamAPI_ISteamUser_GetVoiceOptimalSampleRate" [
			instancePtr [ISteamUser!]          ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUser_GetAuthSessionTicket: "SteamAPI_ISteamUser_GetAuthSessionTicket" [
			instancePtr [ISteamUser!]          ;intptr_t
			pTicket     [byte-ptr!]            ;void *
			cbMaxTicket [integer!]             ;int
			pcbTicket   [int-ptr!]             ;uint32 *
			return: [HAuthTicket!]
		]
		SteamAPI_ISteamUser_BeginAuthSession: "SteamAPI_ISteamUser_BeginAuthSession" [
			instancePtr  [ISteamUser!]         ;intptr_t
			pAuthTicket  [byte-ptr!]           ;const void *
			cbAuthTicket [integer!]            ;int
			steamID      [CSteamID!]           ;class CSteamID
			return: [EBeginAuthSessionResult!]
		]
		SteamAPI_ISteamUser_EndAuthSession: "SteamAPI_ISteamUser_EndAuthSession" [
			instancePtr [ISteamUser!]          ;intptr_t
			steamID     [CSteamID!]            ;class CSteamID
		]
		SteamAPI_ISteamUser_CancelAuthTicket: "SteamAPI_ISteamUser_CancelAuthTicket" [
			instancePtr [ISteamUser!]          ;intptr_t
			hAuthTicket [HAuthTicket!]         ;HAuthTicket
		]
		SteamAPI_ISteamUser_UserHasLicenseForApp: "SteamAPI_ISteamUser_UserHasLicenseForApp" [
			instancePtr [ISteamUser!]          ;intptr_t
			steamID     [CSteamID!]            ;class CSteamID
			appID       [integer!]             ;AppId_t
			return: [EUserHasLicenseForAppResult!]
		]
		SteamAPI_ISteamUser_BIsBehindNAT: "SteamAPI_ISteamUser_BIsBehindNAT" [
			instancePtr [ISteamUser!]          ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUser_AdvertiseGame: "SteamAPI_ISteamUser_AdvertiseGame" [
			instancePtr       [ISteamUser!]    ;intptr_t
			steamIDGameServer [CSteamID!]      ;class CSteamID
			unIPServer        [integer!]       ;uint32
			usPortServer      [uint16!]        ;uint16
		]
		SteamAPI_ISteamUser_RequestEncryptedAppTicket: "SteamAPI_ISteamUser_RequestEncryptedAppTicket" [
			instancePtr     [ISteamUser!]      ;intptr_t
			pDataToInclude  [byte-ptr!]        ;void *
			cbDataToInclude [integer!]         ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamUser_GetEncryptedAppTicket: "SteamAPI_ISteamUser_GetEncryptedAppTicket" [
			instancePtr [ISteamUser!]          ;intptr_t
			pTicket     [byte-ptr!]            ;void *
			cbMaxTicket [integer!]             ;int
			pcbTicket   [int-ptr!]             ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamUser_GetGameBadgeLevel: "SteamAPI_ISteamUser_GetGameBadgeLevel" [
			instancePtr [ISteamUser!]          ;intptr_t
			nSeries     [integer!]             ;int
			bFoil       [logic!]               ;bool
			return: [integer!]
		]
		SteamAPI_ISteamUser_GetPlayerSteamLevel: "SteamAPI_ISteamUser_GetPlayerSteamLevel" [
			instancePtr [ISteamUser!]          ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUser_RequestStoreAuthURL: "SteamAPI_ISteamUser_RequestStoreAuthURL" [
			instancePtr    [ISteamUser!]       ;intptr_t
			pchRedirectURL [c-string!]         ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamUser_BIsPhoneVerified: "SteamAPI_ISteamUser_BIsPhoneVerified" [
			instancePtr [ISteamUser!]          ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUser_BIsTwoFactorEnabled: "SteamAPI_ISteamUser_BIsTwoFactorEnabled" [
			instancePtr [ISteamUser!]          ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUser_BIsPhoneIdentifying: "SteamAPI_ISteamUser_BIsPhoneIdentifying" [
			instancePtr [ISteamUser!]          ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUser_BIsPhoneRequiringVerification: "SteamAPI_ISteamUser_BIsPhoneRequiringVerification" [
			instancePtr [ISteamUser!]          ;intptr_t
			return: [logic!]
		]
	]
]
