Red/System [
	Title:   "Red/System SteamVideo API binding"
	Author:  "Oldes"
	File: 	 %Steam-Video.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamVideo: declare ISteamVideo!

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamVideo_GetVideoURL: "SteamAPI_ISteamVideo_GetVideoURL" [
			instancePtr  [ISteamVideo!]        ;intptr_t
			unVideoAppID [integer!]            ;AppId_t
		]
		SteamAPI_ISteamVideo_IsBroadcasting: "SteamAPI_ISteamVideo_IsBroadcasting" [
			instancePtr  [ISteamVideo!]        ;intptr_t
			pnNumViewers [int-ptr!]            ;int *
			return: [logic!]
		]
	]
]

