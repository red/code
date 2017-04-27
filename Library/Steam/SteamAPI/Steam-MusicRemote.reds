Red/System [
	Title:   "Red/System SteamMusicRemote API binding"
	Author:  "Oldes"
	File: 	 %Steam-MusicRemote.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamMusicRemote: declare ISteamMusicRemote!

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote: {SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote} [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			pchName     [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote: {SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote} [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote: "SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_BActivationSuccess: "SteamAPI_ISteamMusicRemote_BActivationSuccess" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			bValue      [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_SetDisplayName: "SteamAPI_ISteamMusicRemote_SetDisplayName" [
			instancePtr    [ISteamMusicRemote!];intptr_t
			pchDisplayName [c-string!]         ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64: "SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64" [
			instancePtr    [ISteamMusicRemote!];intptr_t
			pvBuffer       [byte-ptr!]         ;void *
			cbBufferLength [integer!]          ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_EnablePlayPrevious: "SteamAPI_ISteamMusicRemote_EnablePlayPrevious" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			bValue      [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_EnablePlayNext: "SteamAPI_ISteamMusicRemote_EnablePlayNext" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			bValue      [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_EnableShuffled: "SteamAPI_ISteamMusicRemote_EnableShuffled" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			bValue      [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_EnableLooped: "SteamAPI_ISteamMusicRemote_EnableLooped" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			bValue      [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_EnableQueue: "SteamAPI_ISteamMusicRemote_EnableQueue" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			bValue      [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_EnablePlaylists: "SteamAPI_ISteamMusicRemote_EnablePlaylists" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			bValue      [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus: "SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			nStatus     [AudioPlayback_Status!];AudioPlayback_Status
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_UpdateShuffled: "SteamAPI_ISteamMusicRemote_UpdateShuffled" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			bValue      [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_UpdateLooped: "SteamAPI_ISteamMusicRemote_UpdateLooped" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			bValue      [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_UpdateVolume: "SteamAPI_ISteamMusicRemote_UpdateVolume" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			flValue     [float32!]             ;float
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_CurrentEntryWillChange: "SteamAPI_ISteamMusicRemote_CurrentEntryWillChange" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable: "SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			bAvailable  [logic!]               ;bool
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText: "SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			pchText     [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds: {SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds} [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			nValue      [integer!]             ;int
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt: {SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt} [
			instancePtr    [ISteamMusicRemote!];intptr_t
			pvBuffer       [byte-ptr!]         ;void *
			cbBufferLength [integer!]          ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_CurrentEntryDidChange: "SteamAPI_ISteamMusicRemote_CurrentEntryDidChange" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_QueueWillChange: "SteamAPI_ISteamMusicRemote_QueueWillChange" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_ResetQueueEntries: "SteamAPI_ISteamMusicRemote_ResetQueueEntries" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_SetQueueEntry: "SteamAPI_ISteamMusicRemote_SetQueueEntry" [
			instancePtr  [ISteamMusicRemote!]  ;intptr_t
			nID          [integer!]            ;int
			nPosition    [integer!]            ;int
			pchEntryText [c-string!]           ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry: "SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			nID         [integer!]             ;int
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_QueueDidChange: "SteamAPI_ISteamMusicRemote_QueueDidChange" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_PlaylistWillChange: "SteamAPI_ISteamMusicRemote_PlaylistWillChange" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_ResetPlaylistEntries: "SteamAPI_ISteamMusicRemote_ResetPlaylistEntries" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_SetPlaylistEntry: "SteamAPI_ISteamMusicRemote_SetPlaylistEntry" [
			instancePtr  [ISteamMusicRemote!]  ;intptr_t
			nID          [integer!]            ;int
			nPosition    [integer!]            ;int
			pchEntryText [c-string!]           ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry: "SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			nID         [integer!]             ;int
			return: [logic!]
		]
		SteamAPI_ISteamMusicRemote_PlaylistDidChange: "SteamAPI_ISteamMusicRemote_PlaylistDidChange" [
			instancePtr [ISteamMusicRemote!]   ;intptr_t
			return: [logic!]
		]
	]
]

