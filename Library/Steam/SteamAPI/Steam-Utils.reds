Red/System [
	Title:   "Red/System SteamUtils API binding"
	Author:  "Oldes"
	File: 	 %Steam-Utils.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamUtils: declare ISteamUtils!

; Steam API call failure results
#enum ESteamAPICallFailure! [
	k_ESteamAPICallFailureNone: -1			; no failure
	k_ESteamAPICallFailureSteamGone: 0		; the local Steam process has gone away
	k_ESteamAPICallFailureNetworkFailure: 1	; the network connection to Steam has been broken, or was already broken
	; SteamServersDisconnected_t callback will be sent around the same time
	; SteamServersConnected_t will be sent when the client is able to talk to the Steam servers again
	k_ESteamAPICallFailureInvalidHandle: 2   	; the SteamAPICall_t handle passed in no longer exists
	k_ESteamAPICallFailureMismatchedCallback: 3 ; GetAPICallResult() was called with the wrong callback type for this API call
]

; Input modes for the Big Picture gamepad text entry
#enum EGamepadTextInputMode! [
	k_EGamepadTextInputModeNormal: 0
	k_EGamepadTextInputModePassword: 1
]

; Controls number of allowed lines for the Big Picture gamepad text entry
#enum EGamepadTextInputLineMode! [
	k_EGamepadTextInputLineModeSingleLine: 0
	k_EGamepadTextInputLineModeMultipleLines: 1
]

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamUtils_GetSecondsSinceAppActive: "SteamAPI_ISteamUtils_GetSecondsSinceAppActive" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUtils_GetSecondsSinceComputerActive: "SteamAPI_ISteamUtils_GetSecondsSinceComputerActive" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUtils_GetConnectedUniverse: "SteamAPI_ISteamUtils_GetConnectedUniverse" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [EUniverse!]
		]
		SteamAPI_ISteamUtils_GetServerRealTime: "SteamAPI_ISteamUtils_GetServerRealTime" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUtils_GetIPCountry: "SteamAPI_ISteamUtils_GetIPCountry" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [c-string!]
		]
		SteamAPI_ISteamUtils_GetImageSize: "SteamAPI_ISteamUtils_GetImageSize" [
			instancePtr [ISteamUtils!]         ;intptr_t
			iImage      [integer!]             ;int
			pnWidth     [int-ptr!]             ;uint32 *
			pnHeight    [int-ptr!]             ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamUtils_GetImageRGBA: "SteamAPI_ISteamUtils_GetImageRGBA" [
			instancePtr     [ISteamUtils!]     ;intptr_t
			iImage          [integer!]         ;int
			pubDest         [pointer! [byte!]] ;uint8 *
			nDestBufferSize [integer!]         ;int
			return: [logic!]
		]
		SteamAPI_ISteamUtils_GetCSERIPPort: "SteamAPI_ISteamUtils_GetCSERIPPort" [
			instancePtr [ISteamUtils!]         ;intptr_t
			unIP        [int-ptr!]             ;uint32 *
			usPort      [pointer! [uint16!]]   ;uint16 *
			return: [logic!]
		]
		SteamAPI_ISteamUtils_GetCurrentBatteryPower: "SteamAPI_ISteamUtils_GetCurrentBatteryPower" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [byte!]
		]
		SteamAPI_ISteamUtils_GetAppID: "SteamAPI_ISteamUtils_GetAppID" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUtils_SetOverlayNotificationPosition: {SteamAPI_ISteamUtils_SetOverlayNotificationPosition} [
			instancePtr         [ISteamUtils!] ;intptr_t
			eNotificationPosition[ENotificationPosition!];ENotificationPosition
		]
		SteamAPI_ISteamUtils_IsAPICallCompleted: "SteamAPI_ISteamUtils_IsAPICallCompleted" [
			instancePtr   [ISteamUtils!]       ;intptr_t
			hSteamAPICall [uint64! value]      ;SteamAPICall_t
			pbFailed      [logic-ref!]  ;bool *
			return: [logic!]
		]
		SteamAPI_ISteamUtils_GetAPICallFailureReason: "SteamAPI_ISteamUtils_GetAPICallFailureReason" [
			instancePtr   [ISteamUtils!]       ;intptr_t
			hSteamAPICall [uint64! value]      ;SteamAPICall_t
			return: [ESteamAPICallFailure!]
		]
		SteamAPI_ISteamUtils_GetAPICallResult: "SteamAPI_ISteamUtils_GetAPICallResult" [
			instancePtr       [ISteamUtils!]   ;intptr_t
			hSteamAPICall     [uint64! value]  ;SteamAPICall_t
			pCallback         [byte-ptr!]      ;void *
			cubCallback       [integer!]       ;int
			iCallbackExpected [integer!]       ;int
			pbFailed          [logic-ref!];bool *
			return: [logic!]
		]
		SteamAPI_ISteamUtils_GetIPCCallCount: "SteamAPI_ISteamUtils_GetIPCCallCount" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUtils_SetWarningMessageHook: "SteamAPI_ISteamUtils_SetWarningMessageHook" [
			instancePtr [ISteamUtils!]         ;intptr_t
			pFunction   [function! [a [integer!] b [c-string!]]];SteamAPIWarningMessageHook_t
		]
		SteamAPI_ISteamUtils_IsOverlayEnabled: "SteamAPI_ISteamUtils_IsOverlayEnabled" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUtils_BOverlayNeedsPresent: "SteamAPI_ISteamUtils_BOverlayNeedsPresent" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUtils_CheckFileSignature: "SteamAPI_ISteamUtils_CheckFileSignature" [
			instancePtr [ISteamUtils!]         ;intptr_t
			szFileName  [c-string!]            ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamUtils_ShowGamepadTextInput: "SteamAPI_ISteamUtils_ShowGamepadTextInput" [
			instancePtr     [ISteamUtils!]     ;intptr_t
			eInputMode      [EGamepadTextInputMode!];EGamepadTextInputMode
			eLineInputMode  [EGamepadTextInputLineMode!];EGamepadTextInputLineMode
			pchDescription  [c-string!]        ;const char *
			unCharMax       [integer!]         ;uint32
			pchExistingText [c-string!]        ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUtils_GetEnteredGamepadTextLength: "SteamAPI_ISteamUtils_GetEnteredGamepadTextLength" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUtils_GetEnteredGamepadTextInput: "SteamAPI_ISteamUtils_GetEnteredGamepadTextInput" [
			instancePtr [ISteamUtils!]         ;intptr_t
			pchText     [c-string!]            ;char *
			cchText     [integer!]             ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamUtils_GetSteamUILanguage: "SteamAPI_ISteamUtils_GetSteamUILanguage" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [c-string!]
		]
		SteamAPI_ISteamUtils_IsSteamRunningInVR: "SteamAPI_ISteamUtils_IsSteamRunningInVR" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUtils_SetOverlayNotificationInset: "SteamAPI_ISteamUtils_SetOverlayNotificationInset" [
			instancePtr      [ISteamUtils!]    ;intptr_t
			nHorizontalInset [integer!]        ;int
			nVerticalInset   [integer!]        ;int
		]
		SteamAPI_ISteamUtils_IsSteamInBigPictureMode: "SteamAPI_ISteamUtils_IsSteamInBigPictureMode" [
			instancePtr [ISteamUtils!]         ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamUtils_StartVRDashboard: "SteamAPI_ISteamUtils_StartVRDashboard" [
			instancePtr [ISteamUtils!]         ;intptr_t
		]
	]
]

