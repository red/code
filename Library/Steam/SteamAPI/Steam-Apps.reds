Red/System [
	Title:   "Red/System SteamApps API binding"
	Author:  "Oldes"
	File: 	 %Steam-Apps.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamApps: declare ISteamApps!

#import [
	STEAM_LIBRARY STEAM_CALL  [
		SteamAPI_ISteamApps_BIsSubscribed: "SteamAPI_ISteamApps_BIsSubscribed" [
			instancePtr [ISteamApps!]          ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamApps_BIsLowViolence: "SteamAPI_ISteamApps_BIsLowViolence" [
			instancePtr [ISteamApps!]          ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamApps_BIsCybercafe: "SteamAPI_ISteamApps_BIsCybercafe" [
			instancePtr [ISteamApps!]          ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamApps_BIsVACBanned: "SteamAPI_ISteamApps_BIsVACBanned" [
			instancePtr [ISteamApps!]          ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamApps_GetCurrentGameLanguage: "SteamAPI_ISteamApps_GetCurrentGameLanguage" [
			instancePtr [ISteamApps!]          ;intptr_t
			return: [c-string!]
		]
		SteamAPI_ISteamApps_GetAvailableGameLanguages: "SteamAPI_ISteamApps_GetAvailableGameLanguages" [
			instancePtr [ISteamApps!]          ;intptr_t
			return: [c-string!]
		]
		SteamAPI_ISteamApps_BIsSubscribedApp: "SteamAPI_ISteamApps_BIsSubscribedApp" [
			instancePtr [ISteamApps!]          ;intptr_t
			appID       [integer!]             ;AppId_t
			return: [logic!]
		]
		SteamAPI_ISteamApps_BIsDlcInstalled: "SteamAPI_ISteamApps_BIsDlcInstalled" [
			instancePtr [ISteamApps!]          ;intptr_t
			appID       [integer!]             ;AppId_t
			return: [logic!]
		]
		SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime: "SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime" [
			instancePtr [ISteamApps!]          ;intptr_t
			nAppID      [integer!]             ;AppId_t
			return: [integer!]
		]
		SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend: "SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend" [
			instancePtr [ISteamApps!]          ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamApps_GetDLCCount: "SteamAPI_ISteamApps_GetDLCCount" [
			instancePtr [ISteamApps!]          ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamApps_BGetDLCDataByIndex: "SteamAPI_ISteamApps_BGetDLCDataByIndex" [
			instancePtr       [ISteamApps!]    ;intptr_t
			iDLC              [integer!]       ;int
			pAppID            [int-ptr!]       ;AppId_t *
			pbAvailable       [logic-ref!];bool *
			pchName           [c-string!]      ;char *
			cchNameBufferSize [integer!]       ;int
			return: [logic!]
		]
		SteamAPI_ISteamApps_InstallDLC: "SteamAPI_ISteamApps_InstallDLC" [
			instancePtr [ISteamApps!]          ;intptr_t
			nAppID      [integer!]             ;AppId_t
		]
		SteamAPI_ISteamApps_UninstallDLC: "SteamAPI_ISteamApps_UninstallDLC" [
			instancePtr [ISteamApps!]          ;intptr_t
			nAppID      [integer!]             ;AppId_t
		]
		SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey: "SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey" [
			instancePtr [ISteamApps!]          ;intptr_t
			nAppID      [integer!]             ;AppId_t
		]
		SteamAPI_ISteamApps_GetCurrentBetaName: "SteamAPI_ISteamApps_GetCurrentBetaName" [
			instancePtr       [ISteamApps!]    ;intptr_t
			pchName           [c-string!]      ;char *
			cchNameBufferSize [integer!]       ;int
			return: [logic!]
		]
		SteamAPI_ISteamApps_MarkContentCorrupt: "SteamAPI_ISteamApps_MarkContentCorrupt" [
			instancePtr       [ISteamApps!]    ;intptr_t
			bMissingFilesOnly [logic!]         ;bool
			return: [logic!]
		]
		SteamAPI_ISteamApps_GetInstalledDepots: "SteamAPI_ISteamApps_GetInstalledDepots" [
			instancePtr [ISteamApps!]          ;intptr_t
			appID       [integer!]             ;AppId_t
			pvecDepots  [int-ptr!]             ;DepotId_t *
			cMaxDepots  [integer!]             ;uint32
			return: [integer!]
		]
		SteamAPI_ISteamApps_GetAppInstallDir: "SteamAPI_ISteamApps_GetAppInstallDir" [
			instancePtr         [ISteamApps!]  ;intptr_t
			appID               [integer!]     ;AppId_t
			pchFolder           [c-string!]    ;char *
			cchFolderBufferSize [integer!]     ;uint32
			return: [integer!]
		]
		SteamAPI_ISteamApps_BIsAppInstalled: "SteamAPI_ISteamApps_BIsAppInstalled" [
			instancePtr [ISteamApps!]          ;intptr_t
			appID       [integer!]             ;AppId_t
			return: [logic!]
		]
		SteamAPI_ISteamApps_GetAppOwner: "SteamAPI_ISteamApps_GetAppOwner" [
			instancePtr [ISteamApps!]          ;intptr_t
			return: [uint64! value]
		]
		SteamAPI_ISteamApps_GetLaunchQueryParam: "SteamAPI_ISteamApps_GetLaunchQueryParam" [
			instancePtr [ISteamApps!]          ;intptr_t
			pchKey      [c-string!]            ;const char *
			return: [c-string!]
		]
		SteamAPI_ISteamApps_GetDlcDownloadProgress: "SteamAPI_ISteamApps_GetDlcDownloadProgress" [
			instancePtr        [ISteamApps!]   ;intptr_t
			nAppID             [integer!]      ;AppId_t
			punBytesDownloaded [uint64-ref!]   ;uint64 *
			punBytesTotal      [uint64-ref!]   ;uint64 *
			return: [logic!]
		]
		SteamAPI_ISteamApps_GetAppBuildId: "SteamAPI_ISteamApps_GetAppBuildId" [
			instancePtr [ISteamApps!]          ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys: "SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys" [
			instancePtr [ISteamApps!]          ;intptr_t
		]
		SteamAPI_ISteamApps_GetFileDetails: "SteamAPI_ISteamApps_GetFileDetails" [
			instancePtr [ISteamApps!]          ;intptr_t
			pszFileName [c-string!]            ;const char *
			return: [uint64! value]
		]
	]
]

