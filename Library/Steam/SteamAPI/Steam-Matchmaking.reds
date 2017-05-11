Red/System [
	Title:   "Red/System SteamMatchmaking API binding"
	Author:  "Oldes"
	File: 	 %Steam-matchmaking.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;github.com/red/red/blob/master/BSD-3-License.txt"
	
]

ISteamMatchmaking: declare ISteamMatchmaking!
; lobby type description
#enum ELobbyType! [
	k_ELobbyTypePrivate: 0		; only way to join the lobby is to invite to someone else
	k_ELobbyTypeFriendsOnly: 1	; shows for friends or invitees, but not in lobby list
	k_ELobbyTypePublic: 2			; visible for friends and in lobby list
	k_ELobbyTypeInvisible: 3		; returned by search, but not visible to other friends 
									;    useful if you want a user in two lobbies, for example matching groups together
									;	  a user can be in only one regular lobby, and up to two invisible lobbies
]

; lobby search filter tools
#enum ELobbyComparison! [
	k_ELobbyComparisonEqualToOrLessThan: -2
	k_ELobbyComparisonLessThan: -1
	k_ELobbyComparisonEqual: 0
	k_ELobbyComparisonGreaterThan: 1
	k_ELobbyComparisonEqualToOrGreaterThan: 2
	k_ELobbyComparisonNotEqual: 3
]

; lobby search distance. Lobby results are sorted from closest to farthest.
#enum ELobbyDistanceFilter! [
	k_ELobbyDistanceFilterClose 		; only lobbies in the same immediate region will be returned
	k_ELobbyDistanceFilterDefault 		; only lobbies in the same region or near by regions
	k_ELobbyDistanceFilterFar 			; for games that don't have many latency requirements, will return lobbies about half-way around the globe
	k_ELobbyDistanceFilterWorldwide 	; no filtering, will match lobbies as far as India to NY (not recommended, expect multiple seconds of latency between the clients)
]

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamMatchmaking_GetFavoriteGameCount: "SteamAPI_ISteamMatchmaking_GetFavoriteGameCount" [
			instancePtr [ISteamMatchmaking!]   ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamMatchmaking_GetFavoriteGame: "SteamAPI_ISteamMatchmaking_GetFavoriteGame" [
			instancePtr         [ISteamMatchmaking!];intptr_t
			iGame               [integer!]     ;int
			pnAppID             [int-ptr!]     ;AppId_t *
			pnIP                [int-ptr!]     ;uint32 *
			pnConnPort          [pointer! [uint16!]];uint16 *
			pnQueryPort         [pointer! [uint16!]];uint16 *
			punFlags            [int-ptr!]     ;uint32 *
			pRTime32LastPlayedOnServer[int-ptr!];uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_AddFavoriteGame: "SteamAPI_ISteamMatchmaking_AddFavoriteGame" [
			instancePtr         [ISteamMatchmaking!];intptr_t
			nAppID              [integer!]     ;AppId_t
			nIP                 [integer!]     ;uint32
			nConnPort           [uint16!]      ;uint16
			nQueryPort          [uint16!]      ;uint16
			unFlags             [integer!]     ;uint32
			rTime32LastPlayedOnServer[integer!];uint32
			return: [integer!]
		]
		SteamAPI_ISteamMatchmaking_RemoveFavoriteGame: "SteamAPI_ISteamMatchmaking_RemoveFavoriteGame" [
			instancePtr [ISteamMatchmaking!]   ;intptr_t
			nAppID      [integer!]             ;AppId_t
			nIP         [integer!]             ;uint32
			nConnPort   [uint16!]              ;uint16
			nQueryPort  [uint16!]              ;uint16
			unFlags     [integer!]             ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_RequestLobbyList: "SteamAPI_ISteamMatchmaking_RequestLobbyList" [
			instancePtr [ISteamMatchmaking!]   ;intptr_t
			return: [uint64! value]
		]
		SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter: {SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter} [
			instancePtr     [ISteamMatchmaking!];intptr_t
			pchKeyToMatch   [c-string!]        ;const char *
			pchValueToMatch [c-string!]        ;const char *
			eComparisonType [ELobbyComparison!];ELobbyComparison
		]
		SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter: {SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter} [
			instancePtr     [ISteamMatchmaking!];intptr_t
			pchKeyToMatch   [c-string!]        ;const char *
			nValueToMatch   [integer!]         ;int
			eComparisonType [ELobbyComparison!];ELobbyComparison
		]
		SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter: {SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter} [
			instancePtr       [ISteamMatchmaking!];intptr_t
			pchKeyToMatch     [c-string!]      ;const char *
			nValueToBeCloseTo [integer!]       ;int
		]
		SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable: {SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable} [
			instancePtr     [ISteamMatchmaking!];intptr_t
			nSlotsAvailable [integer!]         ;int
		]
		SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter: {SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter} [
			instancePtr         [ISteamMatchmaking!];intptr_t
			eLobbyDistanceFilter[ELobbyDistanceFilter!];ELobbyDistanceFilter
		]
		SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter: {SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter} [
			instancePtr [ISteamMatchmaking!]   ;intptr_t
			cMaxResults [integer!]             ;int
		]
		SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter: {SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter} [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
		]
		SteamAPI_ISteamMatchmaking_GetLobbyByIndex: "SteamAPI_ISteamMatchmaking_GetLobbyByIndex" [
			instancePtr [ISteamMatchmaking!]   ;intptr_t
			iLobby      [integer!]             ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamMatchmaking_CreateLobby: "SteamAPI_ISteamMatchmaking_CreateLobby" [
			instancePtr [ISteamMatchmaking!]   ;intptr_t
			eLobbyType  [ELobbyType!]          ;ELobbyType
			cMaxMembers [integer!]             ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamMatchmaking_JoinLobby: "SteamAPI_ISteamMatchmaking_JoinLobby" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamMatchmaking_LeaveLobby: "SteamAPI_ISteamMatchmaking_LeaveLobby" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
		]
		SteamAPI_ISteamMatchmaking_InviteUserToLobby: "SteamAPI_ISteamMatchmaking_InviteUserToLobby" [
			instancePtr    [ISteamMatchmaking!];intptr_t
			steamIDLobby   [CSteamID!]         ;class CSteamID
			steamIDInvitee [CSteamID!]         ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_GetNumLobbyMembers: "SteamAPI_ISteamMatchmaking_GetNumLobbyMembers" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex: "SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			iMember      [integer!]            ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamMatchmaking_GetLobbyData: "SteamAPI_ISteamMatchmaking_GetLobbyData" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			pchKey       [c-string!]           ;const char *
			return: [c-string!]
		]
		SteamAPI_ISteamMatchmaking_SetLobbyData: "SteamAPI_ISteamMatchmaking_SetLobbyData" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			pchKey       [c-string!]           ;const char *
			pchValue     [c-string!]           ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_GetLobbyDataCount: "SteamAPI_ISteamMatchmaking_GetLobbyDataCount" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex: "SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex" [
			instancePtr        [ISteamMatchmaking!];intptr_t
			steamIDLobby       [CSteamID!]     ;class CSteamID
			iLobbyData         [integer!]      ;int
			pchKey             [c-string!]     ;char *
			cchKeyBufferSize   [integer!]      ;int
			pchValue           [c-string!]     ;char *
			cchValueBufferSize [integer!]      ;int
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_DeleteLobbyData: "SteamAPI_ISteamMatchmaking_DeleteLobbyData" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			pchKey       [c-string!]           ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_GetLobbyMemberData: "SteamAPI_ISteamMatchmaking_GetLobbyMemberData" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			steamIDUser  [CSteamID!]           ;class CSteamID
			pchKey       [c-string!]           ;const char *
			return: [c-string!]
		]
		SteamAPI_ISteamMatchmaking_SetLobbyMemberData: "SteamAPI_ISteamMatchmaking_SetLobbyMemberData" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			pchKey       [c-string!]           ;const char *
			pchValue     [c-string!]           ;const char *
		]
		SteamAPI_ISteamMatchmaking_SendLobbyChatMsg: "SteamAPI_ISteamMatchmaking_SendLobbyChatMsg" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			pvMsgBody    [byte-ptr!]           ;const void *
			cubMsgBody   [integer!]            ;int
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_GetLobbyChatEntry: "SteamAPI_ISteamMatchmaking_GetLobbyChatEntry" [
			instancePtr     [ISteamMatchmaking!];intptr_t
			steamIDLobby    [CSteamID!]        ;class CSteamID
			iChatID         [integer!]         ;int
			pSteamIDUser    [CSteamID-ref!]    ;class CSteamID *
			pvData          [byte-ptr!]        ;void *
			cubData         [integer!]         ;int
			peChatEntryType [int-ptr!]         ;EChatEntryType *
			return: [integer!]
		]
		SteamAPI_ISteamMatchmaking_RequestLobbyData: "SteamAPI_ISteamMatchmaking_RequestLobbyData" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_SetLobbyGameServer: "SteamAPI_ISteamMatchmaking_SetLobbyGameServer" [
			instancePtr       [ISteamMatchmaking!];intptr_t
			steamIDLobby      [CSteamID!]      ;class CSteamID
			unGameServerIP    [integer!]       ;uint32
			unGameServerPort  [uint16!]        ;uint16
			steamIDGameServer [CSteamID!]      ;class CSteamID
		]
		SteamAPI_ISteamMatchmaking_GetLobbyGameServer: "SteamAPI_ISteamMatchmaking_GetLobbyGameServer" [
			instancePtr        [ISteamMatchmaking!];intptr_t
			steamIDLobby       [CSteamID!]     ;class CSteamID
			punGameServerIP    [int-ptr!]      ;uint32 *
			punGameServerPort  [pointer! [uint16!]];uint16 *
			psteamIDGameServer [CSteamID-ref!] ;class CSteamID *
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit: "SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			cMaxMembers  [integer!]            ;int
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit: "SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamMatchmaking_SetLobbyType: "SteamAPI_ISteamMatchmaking_SetLobbyType" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			eLobbyType   [ELobbyType!]         ;ELobbyType
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_SetLobbyJoinable: "SteamAPI_ISteamMatchmaking_SetLobbyJoinable" [
			instancePtr    [ISteamMatchmaking!];intptr_t
			steamIDLobby   [CSteamID!]         ;class CSteamID
			bLobbyJoinable [logic!]            ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_GetLobbyOwner: "SteamAPI_ISteamMatchmaking_GetLobbyOwner" [
			instancePtr  [ISteamMatchmaking!]  ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamMatchmaking_SetLobbyOwner: "SteamAPI_ISteamMatchmaking_SetLobbyOwner" [
			instancePtr     [ISteamMatchmaking!];intptr_t
			steamIDLobby    [CSteamID!]        ;class CSteamID
			steamIDNewOwner [CSteamID!]        ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamMatchmaking_SetLinkedLobby: "SteamAPI_ISteamMatchmaking_SetLinkedLobby" [
			instancePtr         [ISteamMatchmaking!];intptr_t
			steamIDLobby        [CSteamID!]    ;class CSteamID
			steamIDLobbyDependent[CSteamID!]   ;class CSteamID
			return: [logic!]
		]
	]
]

