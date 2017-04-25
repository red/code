Red/System [
	Title:   "Red/System SteamMusic API binding"
	Author:  "Oldes"
	File: 	 %Steam-Music.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamMusic: declare ISteamMusic!

#enum AudioPlayback_Status! [
	AudioPlayback_Undefined 
	AudioPlayback_Playing
	AudioPlayback_Paused
	AudioPlayback_Idle
]

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamMusic_BIsEnabled: "SteamAPI_ISteamMusic_BIsEnabled" [
			instancePtr [ISteamMusic!]         ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusic_BIsPlaying: "SteamAPI_ISteamMusic_BIsPlaying" [
			instancePtr [ISteamMusic!]         ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusic_GetPlaybackStatus: "SteamAPI_ISteamMusic_GetPlaybackStatus" [
			instancePtr [ISteamMusic!]         ;intptr_t
			return: [AudioPlayback_Status!]
		]
		SteamAPI_ISteamMusic_Play: "SteamAPI_ISteamMusic_Play" [
			instancePtr [ISteamMusic!]         ;intptr_t
		]
		SteamAPI_ISteamMusic_Pause: "SteamAPI_ISteamMusic_Pause" [
			instancePtr [ISteamMusic!]         ;intptr_t
		]
		SteamAPI_ISteamMusic_PlayPrevious: "SteamAPI_ISteamMusic_PlayPrevious" [
			instancePtr [ISteamMusic!]         ;intptr_t
		]
		SteamAPI_ISteamMusic_PlayNext: "SteamAPI_ISteamMusic_PlayNext" [
			instancePtr [ISteamMusic!]         ;intptr_t
		]
		SteamAPI_ISteamMusic_SetVolume: "SteamAPI_ISteamMusic_SetVolume" [
			instancePtr [ISteamMusic!]         ;intptr_t
			flVolume    [float32!]             ;float
		]
		SteamAPI_ISteamMusic_GetVolume: "SteamAPI_ISteamMusic_GetVolume" [
			instancePtr [ISteamMusic!]         ;intptr_t
			return: [float32!]
		]
	]
]

