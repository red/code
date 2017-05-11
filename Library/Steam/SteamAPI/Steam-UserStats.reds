Red/System [
	Title:   "Red/System SteamUserStats API binding"
	Author:  "Oldes"
	File: 	 %Steam-UserStats.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;github.com/red/red/blob/master/BSD-3-License.txt"
	
]

ISteamUserStats: declare ISteamUserStats!

; size limit on stat or achievement name (UTF-8 encoded)
#define k_cchStatNameMax 128 

; maximum number of bytes for a leaderboard name (UTF-8 encoded)
#define  k_cchLeaderboardNameMax 128

; maximum number of details int32's storable for a single leaderboard entry
#define k_cLeaderboardDetailsMax 64

; type of data request, when downloading leaderboard entries
#enum ELeaderboardDataRequest! [
	k_ELeaderboardDataRequestGlobal: 0
	k_ELeaderboardDataRequestGlobalAroundUser: 1
	k_ELeaderboardDataRequestFriends: 2
	k_ELeaderboardDataRequestUsers: 3
]

; the sort order of a leaderboard
#enum ELeaderboardSortMethod! [
	k_ELeaderboardSortMethodNone: 0
	k_ELeaderboardSortMethodAscending: 1	; top-score is lowest number
	k_ELeaderboardSortMethodDescending: 2	; top-score is highest number
]

; the display type (used by the Steam Community web site) for a leaderboard
#enum ELeaderboardDisplayType! [
	k_ELeaderboardDisplayTypeNone: 0 
	k_ELeaderboardDisplayTypeNumeric: 1			; simple numerical score
	k_ELeaderboardDisplayTypeTimeSeconds: 2		; the score represents a time, in seconds
	k_ELeaderboardDisplayTypeTimeMilliSeconds: 3	; the score represents a time, in milliseconds
]

#enum ELeaderboardUploadScoreMethod! [
	k_ELeaderboardUploadScoreMethodNone: 0
	k_ELeaderboardUploadScoreMethodKeepBest: 1	; Leaderboard will keep user's best score
	k_ELeaderboardUploadScoreMethodForceUpdate: 2	; Leaderboard will always replace score with specified
]


#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamUserStats_RequestCurrentStats: "SteamAPI_ISteamUserStats_RequestCurrentStats" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetStat: "SteamAPI_ISteamUserStats_GetStat" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchName     [c-string!]            ;const char *
			pData       [int-ptr!]             ;int32 *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetStat0: "SteamAPI_ISteamUserStats_GetStat0" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchName     [c-string!]            ;const char *
			pData       [pointer! [float32!]]  ;float *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_SetStat: "SteamAPI_ISteamUserStats_SetStat" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchName     [c-string!]            ;const char *
			nData       [integer!]             ;int32
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_SetStat0: "SteamAPI_ISteamUserStats_SetStat0" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchName     [c-string!]            ;const char *
			fData       [float32!]             ;float
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_UpdateAvgRateStat: "SteamAPI_ISteamUserStats_UpdateAvgRateStat" [
			instancePtr        [ISteamUserStats!];intptr_t
			pchName            [c-string!]     ;const char *
			flCountThisSession [float32!]      ;float
			dSessionLength     [float!]        ;double
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetAchievement: "SteamAPI_ISteamUserStats_GetAchievement" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchName     [c-string!]            ;const char *
			pbAchieved  [logic-ref!]    ;bool *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_SetAchievement: "SteamAPI_ISteamUserStats_SetAchievement" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchName     [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_ClearAchievement: "SteamAPI_ISteamUserStats_ClearAchievement" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchName     [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime: {SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime} [
			instancePtr   [ISteamUserStats!]   ;intptr_t
			pchName       [c-string!]          ;const char *
			pbAchieved    [logic-ref!]  ;bool *
			punUnlockTime [int-ptr!]           ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_StoreStats: "SteamAPI_ISteamUserStats_StoreStats" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetAchievementIcon: "SteamAPI_ISteamUserStats_GetAchievementIcon" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchName     [c-string!]            ;const char *
			return: [integer!]
		]
		SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute: {SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute} [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchName     [c-string!]            ;const char *
			pchKey      [c-string!]            ;const char *
			return: [c-string!]
		]
		SteamAPI_ISteamUserStats_IndicateAchievementProgress: {SteamAPI_ISteamUserStats_IndicateAchievementProgress} [
			instancePtr  [ISteamUserStats!]    ;intptr_t
			pchName      [c-string!]           ;const char *
			nCurProgress [integer!]            ;uint32
			nMaxProgress [integer!]            ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetNumAchievements: "SteamAPI_ISteamUserStats_GetNumAchievements" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUserStats_GetAchievementName: "SteamAPI_ISteamUserStats_GetAchievementName" [
			instancePtr  [ISteamUserStats!]    ;intptr_t
			iAchievement [integer!]            ;uint32
			return: [c-string!]
		]
		SteamAPI_ISteamUserStats_RequestUserStats: "SteamAPI_ISteamUserStats_RequestUserStats" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamUserStats_GetUserStat: "SteamAPI_ISteamUserStats_GetUserStat" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			pchName     [c-string!]            ;const char *
			pData       [int-ptr!]             ;int32 *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetUserStat0: "SteamAPI_ISteamUserStats_GetUserStat0" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			pchName     [c-string!]            ;const char *
			pData       [pointer! [float32!]]  ;float *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetUserAchievement: "SteamAPI_ISteamUserStats_GetUserAchievement" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			pchName     [c-string!]            ;const char *
			pbAchieved  [logic-ref!]    ;bool *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime: {SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime} [
			instancePtr   [ISteamUserStats!]   ;intptr_t
			steamIDUser   [CSteamID!]          ;class CSteamID
			pchName       [c-string!]          ;const char *
			pbAchieved    [logic-ref!]  ;bool *
			punUnlockTime [int-ptr!]           ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_ResetAllStats: "SteamAPI_ISteamUserStats_ResetAllStats" [
			instancePtr      [ISteamUserStats!];intptr_t
			bAchievementsToo [logic!]          ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_FindOrCreateLeaderboard: "SteamAPI_ISteamUserStats_FindOrCreateLeaderboard" [
			instancePtr         [ISteamUserStats!];intptr_t
			pchLeaderboardName  [c-string!]    ;const char *
			eLeaderboardSortMethod[ELeaderboardSortMethod!];ELeaderboardSortMethod
			eLeaderboardDisplayType[ELeaderboardDisplayType!];ELeaderboardDisplayType
			return: [uint64! value]
		]
		SteamAPI_ISteamUserStats_FindLeaderboard: "SteamAPI_ISteamUserStats_FindLeaderboard" [
			instancePtr        [ISteamUserStats!];intptr_t
			pchLeaderboardName [c-string!]     ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamUserStats_GetLeaderboardName: "SteamAPI_ISteamUserStats_GetLeaderboardName" [
			instancePtr       [ISteamUserStats!];intptr_t
			hSteamLeaderboard [uint64! value]  ;SteamLeaderboard_t
			return: [c-string!]
		]
		SteamAPI_ISteamUserStats_GetLeaderboardEntryCount: "SteamAPI_ISteamUserStats_GetLeaderboardEntryCount" [
			instancePtr       [ISteamUserStats!];intptr_t
			hSteamLeaderboard [uint64! value]  ;SteamLeaderboard_t
			return: [integer!]
		]
		SteamAPI_ISteamUserStats_GetLeaderboardSortMethod: "SteamAPI_ISteamUserStats_GetLeaderboardSortMethod" [
			instancePtr       [ISteamUserStats!];intptr_t
			hSteamLeaderboard [uint64! value]  ;SteamLeaderboard_t
			return: [ELeaderboardSortMethod!]
		]
		SteamAPI_ISteamUserStats_GetLeaderboardDisplayType: "SteamAPI_ISteamUserStats_GetLeaderboardDisplayType" [
			instancePtr       [ISteamUserStats!];intptr_t
			hSteamLeaderboard [uint64! value]  ;SteamLeaderboard_t
			return: [ELeaderboardDisplayType!]
		]
		SteamAPI_ISteamUserStats_DownloadLeaderboardEntries: {SteamAPI_ISteamUserStats_DownloadLeaderboardEntries} [
			instancePtr         [ISteamUserStats!];intptr_t
			hSteamLeaderboard   [uint64! value];SteamLeaderboard_t
			eLeaderboardDataRequest[ELeaderboardDataRequest!];ELeaderboardDataRequest
			nRangeStart         [integer!]     ;int
			nRangeEnd           [integer!]     ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers: {SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers} [
			instancePtr       [ISteamUserStats!];intptr_t
			hSteamLeaderboard [uint64! value]  ;SteamLeaderboard_t
			prgUsers          [CSteamID-ref!]  ;class CSteamID *
			cUsers            [integer!]       ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry: {SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry} [
			instancePtr         [ISteamUserStats!];intptr_t
			hSteamLeaderboardEntries[uint64! value];SteamLeaderboardEntries_t
			index               [integer!]     ;int
			pLeaderboardEntry   [LeaderboardEntry!];struct LeaderboardEntry_t *
			pDetails            [int-ptr!]     ;int32 *
			cDetailsMax         [integer!]     ;int
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_UploadLeaderboardScore: "SteamAPI_ISteamUserStats_UploadLeaderboardScore" [
			instancePtr         [ISteamUserStats!];intptr_t
			hSteamLeaderboard   [uint64! value];SteamLeaderboard_t
			eLeaderboardUploadScoreMethod[ELeaderboardUploadScoreMethod!];ELeaderboardUploadScoreMethod
			nScore              [integer!]     ;int32
			pScoreDetails       [int-ptr!]     ;const int32 *
			cScoreDetailsCount  [integer!]     ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamUserStats_AttachLeaderboardUGC: "SteamAPI_ISteamUserStats_AttachLeaderboardUGC" [
			instancePtr       [ISteamUserStats!];intptr_t
			hSteamLeaderboard [uint64! value]  ;SteamLeaderboard_t
			hUGC              [uint64! value]  ;UGCHandle_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers: "SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages: {SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages} [
			instancePtr [ISteamUserStats!]     ;intptr_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo: {SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo} [
			instancePtr  [ISteamUserStats!]    ;intptr_t
			pchName      [c-string!]           ;char *
			unNameBufLen [integer!]            ;uint32
			pflPercent   [pointer! [float32!]] ;float *
			pbAchieved   [logic-ref!]   ;bool *
			return: [integer!]
		]
		SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo: {SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo} [
			instancePtr       [ISteamUserStats!];intptr_t
			iIteratorPrevious [integer!]       ;int
			pchName           [c-string!]      ;char *
			unNameBufLen      [integer!]       ;uint32
			pflPercent        [pointer! [float32!]];float *
			pbAchieved        [logic-ref!];bool *
			return: [integer!]
		]
		SteamAPI_ISteamUserStats_GetAchievementAchievedPercent: {SteamAPI_ISteamUserStats_GetAchievementAchievedPercent} [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchName     [c-string!]            ;const char *
			pflPercent  [pointer! [float32!]]  ;float *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_RequestGlobalStats: "SteamAPI_ISteamUserStats_RequestGlobalStats" [
			instancePtr  [ISteamUserStats!]    ;intptr_t
			nHistoryDays [integer!]            ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamUserStats_GetGlobalStat: "SteamAPI_ISteamUserStats_GetGlobalStat" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchStatName [c-string!]            ;const char *
			pData       [int64-ref!]    ;int64 *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetGlobalStat0: "SteamAPI_ISteamUserStats_GetGlobalStat0" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchStatName [c-string!]            ;const char *
			pData       [pointer! [float!]]    ;double *
			return: [logic!]
		]
		SteamAPI_ISteamUserStats_GetGlobalStatHistory: "SteamAPI_ISteamUserStats_GetGlobalStatHistory" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchStatName [c-string!]            ;const char *
			pData       [int64-ref!]    ;int64 *
			cubData     [integer!]             ;uint32
			return: [integer!]
		]
		SteamAPI_ISteamUserStats_GetGlobalStatHistory0: "SteamAPI_ISteamUserStats_GetGlobalStatHistory0" [
			instancePtr [ISteamUserStats!]     ;intptr_t
			pchStatName [c-string!]            ;const char *
			pData       [pointer! [float!]]    ;double *
			cubData     [integer!]             ;uint32
			return: [integer!]
		]
	]
]

