Red/System [
	Title:   "Red/System SteamScreenshots API binding"
	Author:  "Oldes"
	File: 	 %Steam-Screenshots.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamScreenshots: declare ISteamScreenshots!

#define k_nScreenshotMaxTaggedUsers 32
#define k_nScreenshotMaxTaggedPublishedFiles 32
#define k_cubUFSTagTypeMax 255
#define k_cubUFSTagValueMax 255

; Required with of a thumbnail provided to AddScreenshotToLibrary.  If you do not provide a thumbnail
; one will be generated.
#define k_ScreenshotThumbWidth 200

; Handle is valid for the lifetime of your process and no longer
#define INVALID_SCREENSHOT_HANDLE 0

#enum EVRScreenshotType! [
	k_EVRScreenshotType_None:			 0
	k_EVRScreenshotType_Mono:			 1
	k_EVRScreenshotType_Stereo:			 2
	k_EVRScreenshotType_MonoCubemap:     3
	k_EVRScreenshotType_MonoPanorama:	 4
	k_EVRScreenshotType_StereoPanorama:	 5
]

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamScreenshots_WriteScreenshot: "SteamAPI_ISteamScreenshots_WriteScreenshot" [
			instancePtr [ISteamScreenshots!]   ;intptr_t
			pubRGB      [byte-ptr!]            ;void *
			cubRGB      [integer!]             ;uint32
			nWidth      [integer!]             ;int
			nHeight     [integer!]             ;int
			return: [integer!]
		]
		SteamAPI_ISteamScreenshots_AddScreenshotToLibrary: "SteamAPI_ISteamScreenshots_AddScreenshotToLibrary" [
			instancePtr         [ISteamScreenshots!];intptr_t
			pchFilename         [c-string!]    ;const char *
			pchThumbnailFilename[c-string!]    ;const char *
			nWidth              [integer!]     ;int
			nHeight             [integer!]     ;int
			return: [integer!]
		]
		SteamAPI_ISteamScreenshots_TriggerScreenshot: "SteamAPI_ISteamScreenshots_TriggerScreenshot" [
			instancePtr [ISteamScreenshots!]   ;intptr_t
		]
		SteamAPI_ISteamScreenshots_HookScreenshots: "SteamAPI_ISteamScreenshots_HookScreenshots" [
			instancePtr [ISteamScreenshots!]   ;intptr_t
			bHook       [logic!]               ;bool
		]
		SteamAPI_ISteamScreenshots_SetLocation: "SteamAPI_ISteamScreenshots_SetLocation" [
			instancePtr [ISteamScreenshots!]   ;intptr_t
			hScreenshot [integer!]             ;ScreenshotHandle
			pchLocation [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamScreenshots_TagUser: "SteamAPI_ISteamScreenshots_TagUser" [
			instancePtr [ISteamScreenshots!]   ;intptr_t
			hScreenshot [integer!]             ;ScreenshotHandle
			steamID     [CSteamID!]            ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamScreenshots_TagPublishedFile: "SteamAPI_ISteamScreenshots_TagPublishedFile" [
			instancePtr       [ISteamScreenshots!];intptr_t
			hScreenshot       [integer!]       ;ScreenshotHandle
			unPublishedFileID [uint64! value]  ;PublishedFileId_t
			return: [logic!]
		]
		SteamAPI_ISteamScreenshots_IsScreenshotsHooked: "SteamAPI_ISteamScreenshots_IsScreenshotsHooked" [
			instancePtr [ISteamScreenshots!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary: {SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary} [
			instancePtr   [ISteamScreenshots!] ;intptr_t
			eType         [EVRScreenshotType!] ;EVRScreenshotType
			pchFilename   [c-string!]          ;const char *
			pchVRFilename [c-string!]          ;const char *
			return: [integer!]
		]
	]
]

