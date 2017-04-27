Red/System [
	Title:   "Red/System SteamHTMLSurface API binding"
	Author:  "Oldes"
	File: 	 %Steam-HTMLSurface.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#enum EHTMLMouseButton! [
	eHTMLMouseButton_Left:   0
	eHTMLMouseButton_Right:  1
	eHTMLMouseButton_Middle: 2
]

#enum EHTMLKeyModifiers! [
	k_eHTMLKeyModifier_None:      0
	k_eHTMLKeyModifier_AltDown:   1
	k_eHTMLKeyModifier_CtrlDown:  2
	k_eHTMLKeyModifier_ShiftDown: 4
]

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamHTMLSurface_DestructISteamHTMLSurface: {SteamAPI_ISteamHTMLSurface_DestructISteamHTMLSurface} [
			instancePtr [ISteamHTMLSurface!]   ;intptr_t
		]
		SteamAPI_ISteamHTMLSurface_Init: "SteamAPI_ISteamHTMLSurface_Init" [
			instancePtr [ISteamHTMLSurface!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamHTMLSurface_Shutdown: "SteamAPI_ISteamHTMLSurface_Shutdown" [
			instancePtr [ISteamHTMLSurface!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamHTMLSurface_CreateBrowser: "SteamAPI_ISteamHTMLSurface_CreateBrowser" [
			instancePtr  [ISteamHTMLSurface!]  ;intptr_t
			pchUserAgent [c-string!]           ;const char *
			pchUserCSS   [c-string!]           ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamHTMLSurface_RemoveBrowser: "SteamAPI_ISteamHTMLSurface_RemoveBrowser" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
		]
		SteamAPI_ISteamHTMLSurface_LoadURL: "SteamAPI_ISteamHTMLSurface_LoadURL" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			pchURL          [c-string!]        ;const char *
			pchPostData     [c-string!]        ;const char *
		]
		SteamAPI_ISteamHTMLSurface_SetSize: "SteamAPI_ISteamHTMLSurface_SetSize" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			unWidth         [integer!]         ;uint32
			unHeight        [integer!]         ;uint32
		]
		SteamAPI_ISteamHTMLSurface_StopLoad: "SteamAPI_ISteamHTMLSurface_StopLoad" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
		]
		SteamAPI_ISteamHTMLSurface_Reload: "SteamAPI_ISteamHTMLSurface_Reload" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
		]
		SteamAPI_ISteamHTMLSurface_GoBack: "SteamAPI_ISteamHTMLSurface_GoBack" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
		]
		SteamAPI_ISteamHTMLSurface_GoForward: "SteamAPI_ISteamHTMLSurface_GoForward" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
		]
		SteamAPI_ISteamHTMLSurface_AddHeader: "SteamAPI_ISteamHTMLSurface_AddHeader" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			pchKey          [c-string!]        ;const char *
			pchValue        [c-string!]        ;const char *
		]
		SteamAPI_ISteamHTMLSurface_ExecuteJavascript: "SteamAPI_ISteamHTMLSurface_ExecuteJavascript" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			pchScript       [c-string!]        ;const char *
		]
		SteamAPI_ISteamHTMLSurface_MouseUp: "SteamAPI_ISteamHTMLSurface_MouseUp" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			eMouseButton    [EHTMLMouseButton!];ISteamHTMLSurface::EHTMLMouseButton
		]
		SteamAPI_ISteamHTMLSurface_MouseDown: "SteamAPI_ISteamHTMLSurface_MouseDown" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			eMouseButton    [EHTMLMouseButton!];ISteamHTMLSurface::EHTMLMouseButton
		]
		SteamAPI_ISteamHTMLSurface_MouseDoubleClick: "SteamAPI_ISteamHTMLSurface_MouseDoubleClick" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			eMouseButton    [EHTMLMouseButton!];ISteamHTMLSurface::EHTMLMouseButton
		]
		SteamAPI_ISteamHTMLSurface_MouseMove: "SteamAPI_ISteamHTMLSurface_MouseMove" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			x               [integer!]         ;int
			y               [integer!]         ;int
		]
		SteamAPI_ISteamHTMLSurface_MouseWheel: "SteamAPI_ISteamHTMLSurface_MouseWheel" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			nDelta          [integer!]         ;int32
		]
		SteamAPI_ISteamHTMLSurface_KeyDown: "SteamAPI_ISteamHTMLSurface_KeyDown" [
			instancePtr       [ISteamHTMLSurface!];intptr_t
			unBrowserHandle   [integer!]       ;HHTMLBrowser
			nNativeKeyCode    [integer!]       ;uint32
			eHTMLKeyModifiers [EHTMLKeyModifiers!];ISteamHTMLSurface::EHTMLKeyModifiers
		]
		SteamAPI_ISteamHTMLSurface_KeyUp: "SteamAPI_ISteamHTMLSurface_KeyUp" [
			instancePtr       [ISteamHTMLSurface!];intptr_t
			unBrowserHandle   [integer!]       ;HHTMLBrowser
			nNativeKeyCode    [integer!]       ;uint32
			eHTMLKeyModifiers [EHTMLKeyModifiers!];ISteamHTMLSurface::EHTMLKeyModifiers
		]
		SteamAPI_ISteamHTMLSurface_KeyChar: "SteamAPI_ISteamHTMLSurface_KeyChar" [
			instancePtr       [ISteamHTMLSurface!];intptr_t
			unBrowserHandle   [integer!]       ;HHTMLBrowser
			cUnicodeChar      [integer!]       ;uint32
			eHTMLKeyModifiers [EHTMLKeyModifiers!];ISteamHTMLSurface::EHTMLKeyModifiers
		]
		SteamAPI_ISteamHTMLSurface_SetHorizontalScroll: "SteamAPI_ISteamHTMLSurface_SetHorizontalScroll" [
			instancePtr         [ISteamHTMLSurface!];intptr_t
			unBrowserHandle     [integer!]     ;HHTMLBrowser
			nAbsolutePixelScroll[integer!]     ;uint32
		]
		SteamAPI_ISteamHTMLSurface_SetVerticalScroll: "SteamAPI_ISteamHTMLSurface_SetVerticalScroll" [
			instancePtr         [ISteamHTMLSurface!];intptr_t
			unBrowserHandle     [integer!]     ;HHTMLBrowser
			nAbsolutePixelScroll[integer!]     ;uint32
		]
		SteamAPI_ISteamHTMLSurface_SetKeyFocus: "SteamAPI_ISteamHTMLSurface_SetKeyFocus" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			bHasKeyFocus    [logic!]           ;bool
		]
		SteamAPI_ISteamHTMLSurface_ViewSource: "SteamAPI_ISteamHTMLSurface_ViewSource" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
		]
		SteamAPI_ISteamHTMLSurface_CopyToClipboard: "SteamAPI_ISteamHTMLSurface_CopyToClipboard" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
		]
		SteamAPI_ISteamHTMLSurface_PasteFromClipboard: "SteamAPI_ISteamHTMLSurface_PasteFromClipboard" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
		]
		SteamAPI_ISteamHTMLSurface_Find: "SteamAPI_ISteamHTMLSurface_Find" [
			instancePtr      [ISteamHTMLSurface!];intptr_t
			unBrowserHandle  [integer!]        ;HHTMLBrowser
			pchSearchStr     [c-string!]       ;const char *
			bCurrentlyInFind [logic!]          ;bool
			bReverse         [logic!]          ;bool
		]
		SteamAPI_ISteamHTMLSurface_StopFind: "SteamAPI_ISteamHTMLSurface_StopFind" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
		]
		SteamAPI_ISteamHTMLSurface_GetLinkAtPosition: "SteamAPI_ISteamHTMLSurface_GetLinkAtPosition" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			x               [integer!]         ;int
			y               [integer!]         ;int
		]
		SteamAPI_ISteamHTMLSurface_SetCookie: "SteamAPI_ISteamHTMLSurface_SetCookie" [
			instancePtr [ISteamHTMLSurface!]   ;intptr_t
			pchHostname [c-string!]            ;const char *
			pchKey      [c-string!]            ;const char *
			pchValue    [c-string!]            ;const char *
			pchPath     [c-string!]            ;const char *
			nExpires    [integer!]             ;RTime32
			bSecure     [logic!]               ;bool
			bHTTPOnly   [logic!]               ;bool
		]
		SteamAPI_ISteamHTMLSurface_SetPageScaleFactor: "SteamAPI_ISteamHTMLSurface_SetPageScaleFactor" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			flZoom          [float32!]         ;float
			nPointX         [integer!]         ;int
			nPointY         [integer!]         ;int
		]
		SteamAPI_ISteamHTMLSurface_SetBackgroundMode: "SteamAPI_ISteamHTMLSurface_SetBackgroundMode" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			bBackgroundMode [logic!]           ;bool
		]
		SteamAPI_ISteamHTMLSurface_AllowStartRequest: "SteamAPI_ISteamHTMLSurface_AllowStartRequest" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			bAllowed        [logic!]           ;bool
		]
		SteamAPI_ISteamHTMLSurface_JSDialogResponse: "SteamAPI_ISteamHTMLSurface_JSDialogResponse" [
			instancePtr     [ISteamHTMLSurface!];intptr_t
			unBrowserHandle [integer!]         ;HHTMLBrowser
			bResult         [logic!]           ;bool
		]
	]
]

