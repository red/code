Red/System [
	Title:   "Red/System Steam API binding"
	Author:  "Oldes"
	File: 	 %Steam-API.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]
#define STEAM_CALL cdecl

#switch OS [
	Windows   [ #define STEAM_LIBRARY "Steam_api.dll"      ]
	macOS     [ #define STEAM_LIBRARY "libsteam_api.dylib" ]
	#default  [ #define STEAM_LIBRARY "libsteam_api.so"    ]
]

#include %../../os/definitions.reds ;common aliases and defines

#define ISteamClient!             int-ptr!
#define ISteamUser!               int-ptr!
#define ISteamFriends!            int-ptr!
#define ISteamUtils!              int-ptr!
#define ISteamMatchmaking!        int-ptr!
#define ISteamUserStats!          int-ptr!
#define ISteamApps!               int-ptr!
#define ISteamNetworking!         int-ptr!
#define ISteamMatchmakingServers! int-ptr!
#define ISteamMatchmakingPingResponse!       int-ptr!
#define ISteamMatchmakingPlayersResponse!    int-ptr!
#define ISteamMatchmakingRulesResponse!      int-ptr!
#define ISteamMatchmakingServerListResponse! int-ptr!
#define ISteamRemoteStorage!      int-ptr!
#define ISteamScreenshots!        int-ptr!
#define ISteamHTTP!               int-ptr!
#define ISteamUnifiedMessages!    int-ptr!
#define ISteamController!         int-ptr!
#define ISteamUGC!                int-ptr!
#define ISteamAppList!            int-ptr!
#define ISteamMusic!              int-ptr!
#define ISteamMusicRemote!        int-ptr!
#define ISteamHTMLSurface!        int-ptr!
#define ISteamInventory!          int-ptr!
#define ISteamVideo!              int-ptr!
#define ISteamGameServer!         int-ptr!
#define ISteamGameServerStats!    int-ptr!
#define ISteamGameServerItem!     int-ptr!


CGameID!: alias struct! [
	m_ulGameID [uint64-value!]
	m_gameID   [struct! [
		m_nAppID [integer!]
		m_nType  [integer!]
		m_nModID [integer!]
	]]
]

#define CSteamID! [uint64-value!]
#define CSteamID-ptr! uint64-ptr!

FriendGameInfo!: alias struct! [
	m_gameID       [CGameID!]
	m_unGameIP     [integer!]
	;m_usGamePort "uint16"},
	;m_usQueryPort "uint16"},
	ports          [integer!]
	m_steamIDLobby [CSteamID!]
]

LeaderboardEntry!: alias struct! [
	m_steamIDUser [CSteamID!]
	m_nGlobalRank [integer!]
	m_nScore      [integer!]
	m_cDetails    [integer!]
	m_hUGC        [uint64-value!]
]

#include %Steam-enums.reds

#import [
	"Steam_api.dll" cdecl [
		SteamAPI_Shutdown: "SteamAPI_Shutdown" []
		SteamAPI_IsSteamRunning: "SteamAPI_IsSteamRunning" [
			return: [logic!]
		]
		SteamAPI_InitSafe: "SteamAPI_InitSafe" [
			return: [logic!]
		]
		SteamAPI_Init: "SteamAPI_Init" [
			return: [logic!]
		]
		;Steam API interface getters:
		GetISteamClient:             "SteamClient"          [return: [ISteamClient!]]
		GetISteamUser:               "SteamUser"            [return: [ISteamUser!]]
		GetISteamFriends:            "SteamFriends"         [return: [ISteamFriends!]]
		GetISteamUtils:              "SteamUtils"           [return: [ISteamUtils!]]
		GetISteamMatchmaking:        "SteamMatchmaking"     [return: [ISteamMatchmaking!]]
		GetISteamUserStats:          "SteamUserStats"       [return: [ISteamUserStats!]]
		GetISteamApps:               "SteamApps"            [return: [ISteamApps!]]
		GetISteamNetworking:         "SteamNetworking"      [return: [ISteamNetworking!]]
		GetISteamMatchmakingServers: "SteamMatchmakingServers" [return: [ISteamMatchmakingServers!]]
		GetISteamRemoteStorage:      "SteamRemoteStorage"   [return: [ISteamRemoteStorage!]]
		GetISteamScreenshots:        "SteamScreenshots"     [return: [ISteamScreenshots!]]
		GetISteamHTTP:               "SteamHTTP"            [return: [ISteamHTTP!]]
		GetISteamUnifiedMessages:    "SteamUnifiedMessages" [return: [ISteamUnifiedMessages!]]
		GetISteamController:         "SteamController"      [return: [ISteamController!]]
		GetISteamUGC:                "SteamUGC"             [return: [ISteamUGC!]]
		GetISteamAppList:            "SteamAppList"         [return: [ISteamAppList!]]
		GetISteamMusic:              "SteamMusic"           [return: [ISteamMusic!]]
		GetISteamMusicRemote:        "SteamMusicRemote"     [return: [ISteamMusicRemote!]]
		GetISteamHTMLSurface:        "SteamHTMLSurface"     [return: [ISteamHTMLSurface!]]
		GetISteamInventory:          "SteamInventory"       [return: [ISteamInventory!]]
		GetISteamVideo:              "SteamVideo"           [return: [ISteamVideo!]]
	]
]

#include %Steam-Client.reds
#include %Steam-User.reds
#include %Steam-Friends.reds
#include %Steam-Utils.reds
#include %Steam-Matchmaking.reds
#include %Steam-MatchmakingServers.reds
#include %Steam-RemoteStorage.reds
#include %Steam-UserStats.reds
#include %Steam-Apps.reds
#include %Steam-Networking.reds
#include %Steam-Screenshots.reds
#include %Steam-Music.reds
#include %Steam-MusicRemote.reds
#include %Steam-HTTP.reds
#include %Steam-UnifiedMessages.reds
#include %Steam-Controller.reds
#include %Steam-UGC.reds
#include %Steam-AppList.reds
#include %Steam-HTMLSurface.reds
#include %Steam-Inventory.reds
#include %Steam-Video.reds
#include %Steam-GameServer.reds
#include %Steam-GameServerStats.reds

