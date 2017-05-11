Red/System [
	Title:   "Red/System SteamGameServerStats API binding"
	Author:  "Oldes"
	File: 	 %Steam-GameServerStats.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamGameServerStats: declare ISteamGameServerStats!

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamGameServerStats_RequestUserStats: "SteamAPI_ISteamGameServerStats_RequestUserStats" [
			instancePtr [ISteamGameServerStats!];intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamGameServerStats_GetUserStat: "SteamAPI_ISteamGameServerStats_GetUserStat" [
			instancePtr [ISteamGameServerStats!];intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			pchName     [c-string!]            ;const char *
			pData       [int-ptr!]             ;int32 *
			return: [logic!]
		]
		SteamAPI_ISteamGameServerStats_GetUserStat0: "SteamAPI_ISteamGameServerStats_GetUserStat0" [
			instancePtr [ISteamGameServerStats!];intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			pchName     [c-string!]            ;const char *
			pData       [pointer! [float32!]]  ;float *
			return: [logic!]
		]
		SteamAPI_ISteamGameServerStats_GetUserAchievement: "SteamAPI_ISteamGameServerStats_GetUserAchievement" [
			instancePtr [ISteamGameServerStats!];intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			pchName     [c-string!]            ;const char *
			pbAchieved  [logic-ref!]    ;bool *
			return: [logic!]
		]
		SteamAPI_ISteamGameServerStats_SetUserStat: "SteamAPI_ISteamGameServerStats_SetUserStat" [
			instancePtr [ISteamGameServerStats!];intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			pchName     [c-string!]            ;const char *
			nData       [integer!]             ;int32
			return: [logic!]
		]
		SteamAPI_ISteamGameServerStats_SetUserStat0: "SteamAPI_ISteamGameServerStats_SetUserStat0" [
			instancePtr [ISteamGameServerStats!];intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			pchName     [c-string!]            ;const char *
			fData       [float32!]             ;float
			return: [logic!]
		]
		SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat: {SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat} [
			instancePtr        [ISteamGameServerStats!];intptr_t
			steamIDUser        [CSteamID!]     ;class CSteamID
			pchName            [c-string!]     ;const char *
			flCountThisSession [float32!]      ;float
			dSessionLength     [float!]        ;double
			return: [logic!]
		]
		SteamAPI_ISteamGameServerStats_SetUserAchievement: "SteamAPI_ISteamGameServerStats_SetUserAchievement" [
			instancePtr [ISteamGameServerStats!];intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			pchName     [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamGameServerStats_ClearUserAchievement: {SteamAPI_ISteamGameServerStats_ClearUserAchievement} [
			instancePtr [ISteamGameServerStats!];intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			pchName     [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamGameServerStats_StoreUserStats: "SteamAPI_ISteamGameServerStats_StoreUserStats" [
			instancePtr [ISteamGameServerStats!];intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			return: [uint64! value]
		]
	]
]

