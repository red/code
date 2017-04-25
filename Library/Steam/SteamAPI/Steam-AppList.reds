Red/System [
	Title:   "Red/System SteamAppList API binding"
	Author:  "Oldes"
	File: 	 %Steam-AppList.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamAppList: declare ISteamAppList!

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamAppList_GetNumInstalledApps: "SteamAPI_ISteamAppList_GetNumInstalledApps" [
			instancePtr [ISteamAppList!]       ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamAppList_GetInstalledApps: "SteamAPI_ISteamAppList_GetInstalledApps" [
			instancePtr [ISteamAppList!]       ;intptr_t
			pvecAppID   [int-ptr!]             ;AppId_t *
			unMaxAppIDs [integer!]             ;uint32
			return: [integer!]
		]
		SteamAPI_ISteamAppList_GetAppName: "SteamAPI_ISteamAppList_GetAppName" [
			instancePtr [ISteamAppList!]       ;intptr_t
			nAppID      [integer!]             ;AppId_t
			pchName     [c-string!]            ;char *
			cchNameMax  [integer!]             ;int
			return: [integer!]
		]
		SteamAPI_ISteamAppList_GetAppInstallDir: "SteamAPI_ISteamAppList_GetAppInstallDir" [
			instancePtr  [ISteamAppList!]      ;intptr_t
			nAppID       [integer!]            ;AppId_t
			pchDirectory [c-string!]           ;char *
			cchNameMax   [integer!]            ;int
			return: [integer!]
		]
		SteamAPI_ISteamAppList_GetAppBuildId: "SteamAPI_ISteamAppList_GetAppBuildId" [
			instancePtr [ISteamAppList!]       ;intptr_t
			nAppID      [integer!]             ;AppId_t
			return: [integer!]
		]
	]
]

