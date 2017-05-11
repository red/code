Red/System [
	Title:   "Red/System SteamMatchmakingServers API binding"
	Author:  "Oldes"
	File: 	 %Steam-MatchmakingServers.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamMatchmakingServers: declare ISteamMatchmakingServers!

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamMatchmakingServers_RequestInternetServerList: {SteamAPI_ISteamMatchmakingServers_RequestInternetServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			ppchFilters         [int-ptr!]     ;struct MatchMakingKeyValuePair_t **
			nFilters            [integer!]     ;uint32
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_RequestLANServerList: {SteamAPI_ISteamMatchmakingServers_RequestLANServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList: {SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			ppchFilters         [int-ptr!]     ;struct MatchMakingKeyValuePair_t **
			nFilters            [integer!]     ;uint32
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList: {SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			ppchFilters         [int-ptr!]     ;struct MatchMakingKeyValuePair_t **
			nFilters            [integer!]     ;uint32
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList: {SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			ppchFilters         [int-ptr!]     ;struct MatchMakingKeyValuePair_t **
			nFilters            [integer!]     ;uint32
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList: {SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList} [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			iApp                [integer!]     ;AppId_t
			ppchFilters         [int-ptr!]     ;struct MatchMakingKeyValuePair_t **
			nFilters            [integer!]     ;uint32
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingServerListResponse *
			return: [byte-ptr!]
		]
		SteamAPI_ISteamMatchmakingServers_ReleaseRequest: "SteamAPI_ISteamMatchmakingServers_ReleaseRequest" [
			instancePtr        [ISteamMatchmakingServers!];intptr_t
			hServerListRequest [byte-ptr!]     ;HServerListRequest
		]
		SteamAPI_ISteamMatchmakingServers_GetServerDetails: "SteamAPI_ISteamMatchmakingServers_GetServerDetails" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
			iServer     [integer!]             ;int
			return: [ISteamGameServerItem!]
		]
		SteamAPI_ISteamMatchmakingServers_CancelQuery: "SteamAPI_ISteamMatchmakingServers_CancelQuery" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
		]
		SteamAPI_ISteamMatchmakingServers_RefreshQuery: "SteamAPI_ISteamMatchmakingServers_RefreshQuery" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
		]
		SteamAPI_ISteamMatchmakingServers_IsRefreshing: "SteamAPI_ISteamMatchmakingServers_IsRefreshing" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
			return: [logic!]
		]
		SteamAPI_ISteamMatchmakingServers_GetServerCount: "SteamAPI_ISteamMatchmakingServers_GetServerCount" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
			return: [integer!]
		]
		SteamAPI_ISteamMatchmakingServers_RefreshServer: "SteamAPI_ISteamMatchmakingServers_RefreshServer" [
			instancePtr [ISteamMatchmakingServers!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
			iServer     [integer!]             ;int
		]
		SteamAPI_ISteamMatchmakingServers_PingServer: "SteamAPI_ISteamMatchmakingServers_PingServer" [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			unIP                [integer!]     ;uint32
			usPort              [uint16!]      ;uint16
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingPingResponse *
			return: [integer!]
		]
		SteamAPI_ISteamMatchmakingServers_PlayerDetails: "SteamAPI_ISteamMatchmakingServers_PlayerDetails" [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			unIP                [integer!]     ;uint32
			usPort              [uint16!]      ;uint16
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingPlayersResponse *
			return: [integer!]
		]
		SteamAPI_ISteamMatchmakingServers_ServerRules: "SteamAPI_ISteamMatchmakingServers_ServerRules" [
			instancePtr         [ISteamMatchmakingServers!];intptr_t
			unIP                [integer!]     ;uint32
			usPort              [uint16!]      ;uint16
			pRequestServersResponse[int-ptr!]  ;class ISteamMatchmakingRulesResponse *
			return: [integer!]
		]
		SteamAPI_ISteamMatchmakingServers_CancelServerQuery: {SteamAPI_ISteamMatchmakingServers_CancelServerQuery} [
			instancePtr  [ISteamMatchmakingServers!];intptr_t
			hServerQuery [integer!]            ;HServerQuery
		]


		SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded: {SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded} [
			instancePtr [ISteamMatchmakingServerListResponse!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
			iServer     [integer!]             ;int
		]
		SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond: {SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond} [
			instancePtr [ISteamMatchmakingServerListResponse!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
			iServer     [integer!]             ;int
		]
		SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete: {SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete} [
			instancePtr [ISteamMatchmakingServerListResponse!];intptr_t
			hRequest    [byte-ptr!]            ;HServerListRequest
			response    [EMatchMakingServerResponse!];EMatchMakingServerResponse
		]
		SteamAPI_ISteamMatchmakingPingResponse_ServerResponded: {SteamAPI_ISteamMatchmakingPingResponse_ServerResponded} [
			instancePtr [ISteamMatchmakingPingResponse!];intptr_t
			server      [ISteamGameServerItem!]             ;class gameserveritem_t &
		]
		SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond: {SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond} [
			instancePtr [ISteamMatchmakingPingResponse!];intptr_t
		]
		SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList: {SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList} [
			instancePtr  [ISteamMatchmakingPlayersResponse!];intptr_t
			pchName      [c-string!]           ;const char *
			nScore       [integer!]            ;int
			flTimePlayed [float32!]            ;float
		]
		SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond: {SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond} [
			instancePtr [ISteamMatchmakingPlayersResponse!];intptr_t
		]
		SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete: {SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete} [
			instancePtr [ISteamMatchmakingPlayersResponse!];intptr_t
		]
		SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded: {SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded} [
			instancePtr [ISteamMatchmakingRulesResponse!];intptr_t
			pchRule     [c-string!]            ;const char *
			pchValue    [c-string!]            ;const char *
		]
		SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond: {SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond} [
			instancePtr [ISteamMatchmakingRulesResponse!];intptr_t
		]
		SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete: {SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete} [
			instancePtr [ISteamMatchmakingRulesResponse!];intptr_t
		]
	]
]

