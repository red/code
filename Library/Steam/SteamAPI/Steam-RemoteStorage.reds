Red/System [
	Title:   "Red/System SteamRemoteStorage API binding"
	Author:  "Oldes"
	File: 	 %Steam-RemoteStorage.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamRemoteStorage: declare ISteamRemoteStorage!

#enum ERemoteStoragePlatform! [
	k_ERemoteStoragePlatformNone:		0
	k_ERemoteStoragePlatformWindows:	1
	k_ERemoteStoragePlatformOSX:		2
	k_ERemoteStoragePlatformPS3:		4
	k_ERemoteStoragePlatformLinux:		8
	k_ERemoteStoragePlatformReserved2:	16
	k_ERemoteStoragePlatformAll:  FFFFFFFFh
]

#enum ERemoteStoragePublishedFileVisibility! [
	k_ERemoteStoragePublishedFileVisibilityPublic: 0
	k_ERemoteStoragePublishedFileVisibilityFriendsOnly: 1
	k_ERemoteStoragePublishedFileVisibilityPrivate: 2
]


#enum EWorkshopFileType! [
	k_EWorkshopFileTypeFirst: 0

	k_EWorkshopFileTypeCommunity:			  0		; normal Workshop item that can be subscribed to
	k_EWorkshopFileTypeMicrotransaction:	  1		; Workshop item that is meant to be voted on for the purpose of selling in-game
	k_EWorkshopFileTypeCollection:			  2		; a collection of Workshop or Greenlight items
	k_EWorkshopFileTypeArt:					  3		; artwork
	k_EWorkshopFileTypeVideo:				  4		; external video
	k_EWorkshopFileTypeScreenshot:			  5		; screenshot
	k_EWorkshopFileTypeGame:				  6		; Greenlight game entry
	k_EWorkshopFileTypeSoftware:			  7		; Greenlight software entry
	k_EWorkshopFileTypeConcept:				  8		; Greenlight concept
	k_EWorkshopFileTypeWebGuide:			  9		; Steam web guide
	k_EWorkshopFileTypeIntegratedGuide:		  10		; application integrated guide
	k_EWorkshopFileTypeMerch:				  11		; Workshop merchandise meant to be voted on for the purpose of being sold
	k_EWorkshopFileTypeControllerBinding:	  12		; Steam Controller bindings
	k_EWorkshopFileTypeSteamworksAccessInvite: 13		; internal
	k_EWorkshopFileTypeSteamVideo:			  14		; Steam video
	k_EWorkshopFileTypeGameManagedItem:		  15		; managed completely by the game, not the user, and not shown on the web

	; Update k_EWorkshopFileTypeMax if you add values.
	k_EWorkshopFileTypeMax:  16
]

#enum EWorkshopVote! [
	k_EWorkshopVoteUnvoted:  0
	k_EWorkshopVoteFor:      1
	k_EWorkshopVoteAgainst:  2
	k_EWorkshopVoteLater:    3
]

#enum EWorkshopFileAction! [
	k_EWorkshopFileActionPlayed:  0
	k_EWorkshopFileActionCompleted:  1
]

#enum EWorkshopEnumerationType! [
	k_EWorkshopEnumerationTypeRankedByVote: 0
	k_EWorkshopEnumerationTypeRecent: 1
	k_EWorkshopEnumerationTypeTrending: 2
	k_EWorkshopEnumerationTypeFavoritesOfFriends: 3
	k_EWorkshopEnumerationTypeVotedByFriends: 4
	k_EWorkshopEnumerationTypeContentByFriends: 5
	k_EWorkshopEnumerationTypeRecentFromFollowedUsers: 6
]

#enum EWorkshopVideoProvider! [
	k_EWorkshopVideoProviderNone: 0
	k_EWorkshopVideoProviderYoutube: 1
]

#enum EUGCReadAction! [
	;Keeps the file handle open unless the last byte is read.  You can use this when reading large files (over 100MB) in sequential chunks.
	;If the last byte is read, this will behave the same as k_EUGCRead_Close.  Otherwise, it behaves the same as k_EUGCRead_ContinueReading.
	;This value maintains the same behavior as before the EUGCReadAction parameter was introduced.
	k_EUGCRead_ContinueReadingUntilFinished: 0

	;Keeps the file handle open.  Use this when using UGCRead to seek to different parts of the file.
	;When you are done seeking around the file, make a final call with k_EUGCRead_Close to close it.
	k_EUGCRead_ContinueReading: 1

	;Frees the file handle.  Use this when you're done reading the content.  
	;To read the file from Steam again you will need to call UGCDownload again. 
	k_EUGCRead_Close: 2	
]



#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamRemoteStorage_FileWrite: "SteamAPI_ISteamRemoteStorage_FileWrite" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			pvData      [byte-ptr!]            ;const void *
			cubData     [integer!]             ;int32
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_FileRead: "SteamAPI_ISteamRemoteStorage_FileRead" [
			instancePtr   [ISteamRemoteStorage!];intptr_t
			pchFile       [c-string!]          ;const char *
			pvData        [byte-ptr!]          ;void *
			cubDataToRead [integer!]           ;int32
			return: [integer!]
		]
		SteamAPI_ISteamRemoteStorage_FileWriteAsync: "SteamAPI_ISteamRemoteStorage_FileWriteAsync" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			pvData      [byte-ptr!]            ;const void *
			cubData     [integer!]             ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_FileReadAsync: "SteamAPI_ISteamRemoteStorage_FileReadAsync" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			nOffset     [integer!]             ;uint32
			cubToRead   [integer!]             ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_FileReadAsyncComplete: "SteamAPI_ISteamRemoteStorage_FileReadAsyncComplete" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			hReadCall   [uint64! value]        ;SteamAPICall_t
			pvBuffer    [byte-ptr!]             ;void *
			cubToRead   [integer!]             ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_FileForget: "SteamAPI_ISteamRemoteStorage_FileForget" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_FileDelete: "SteamAPI_ISteamRemoteStorage_FileDelete" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_FileShare: "SteamAPI_ISteamRemoteStorage_FileShare" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_SetSyncPlatforms: "SteamAPI_ISteamRemoteStorage_SetSyncPlatforms" [
			instancePtr         [ISteamRemoteStorage!];intptr_t
			pchFile             [c-string!]    ;const char *
			eRemoteStoragePlatform[ERemoteStoragePlatform!];ERemoteStoragePlatform
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen: "SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk: {SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk} [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			writeHandle [uint64! value]        ;UGCFileWriteStreamHandle_t
			pvData      [byte-ptr!]            ;const void *
			cubData     [integer!]             ;int32
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_FileWriteStreamClose: "SteamAPI_ISteamRemoteStorage_FileWriteStreamClose" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			writeHandle [uint64! value]        ;UGCFileWriteStreamHandle_t
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel: "SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			writeHandle [uint64! value]        ;UGCFileWriteStreamHandle_t
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_FileExists: "SteamAPI_ISteamRemoteStorage_FileExists" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_FilePersisted: "SteamAPI_ISteamRemoteStorage_FilePersisted" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_GetFileSize: "SteamAPI_ISteamRemoteStorage_GetFileSize" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			return: [integer!]
		]
		SteamAPI_ISteamRemoteStorage_GetFileTimestamp: "SteamAPI_ISteamRemoteStorage_GetFileTimestamp" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			return: [int64!]
		]
		SteamAPI_ISteamRemoteStorage_GetSyncPlatforms: "SteamAPI_ISteamRemoteStorage_GetSyncPlatforms" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			pchFile     [c-string!]            ;const char *
			return: [ERemoteStoragePlatform!]
		]
		SteamAPI_ISteamRemoteStorage_GetFileCount: "SteamAPI_ISteamRemoteStorage_GetFileCount" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamRemoteStorage_GetFileNameAndSize: "SteamAPI_ISteamRemoteStorage_GetFileNameAndSize" [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			iFile             [integer!]       ;int
			pnFileSizeInBytes [int-ptr!]       ;int32 *
			return: [c-string!]
		]
		SteamAPI_ISteamRemoteStorage_GetQuota: "SteamAPI_ISteamRemoteStorage_GetQuota" [
			instancePtr      [ISteamRemoteStorage!];intptr_t
			pnTotalBytes     [uint64-ref!]     ;uint64 *
			puAvailableBytes [uint64-ref!]     ;uint64 *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount: {SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount} [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp: "SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp: "SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			bEnabled    [logic!]               ;bool
		]
		SteamAPI_ISteamRemoteStorage_UGCDownload: "SteamAPI_ISteamRemoteStorage_UGCDownload" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			hContent    [uint64! value]        ;UGCHandle_t
			unPriority  [integer!]             ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress: {SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress} [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			hContent          [uint64! value]  ;UGCHandle_t
			pnBytesDownloaded [int-ptr!]       ;int32 *
			pnBytesExpected   [int-ptr!]       ;int32 *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_GetUGCDetails: "SteamAPI_ISteamRemoteStorage_GetUGCDetails" [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			hContent          [uint64! value]  ;UGCHandle_t
			pnAppID           [int-ptr!]       ;AppId_t *
			ppchName          [string-ref!]    ;char **
			pnFileSizeInBytes [int-ptr!]       ;int32 *
			pSteamIDOwner     [CSteamID-ref!]  ;class CSteamID *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_UGCRead: "SteamAPI_ISteamRemoteStorage_UGCRead" [
			instancePtr   [ISteamRemoteStorage!];intptr_t
			hContent      [uint64! value]      ;UGCHandle_t
			pvData        [byte-ptr!]          ;void *
			cubDataToRead [integer!]           ;int32
			cOffset       [integer!]           ;uint32
			eAction       [EUGCReadAction!]    ;EUGCReadAction
			return: [integer!]
		]
		SteamAPI_ISteamRemoteStorage_GetCachedUGCCount: "SteamAPI_ISteamRemoteStorage_GetCachedUGCCount" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle: "SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle" [
			instancePtr    [ISteamRemoteStorage!];intptr_t
			iCachedContent [integer!]          ;int32
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_PublishWorkshopFile: "SteamAPI_ISteamRemoteStorage_PublishWorkshopFile" [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			pchFile           [c-string!]      ;const char *
			pchPreviewFile    [c-string!]      ;const char *
			nConsumerAppId    [integer!]       ;AppId_t
			pchTitle          [c-string!]      ;const char *
			pchDescription    [c-string!]      ;const char *
			eVisibility       [ERemoteStoragePublishedFileVisibility!];ERemoteStoragePublishedFileVisibility
			pTags             [int-ptr!]       ;struct SteamParamStringArray_t *
			eWorkshopFileType [EWorkshopFileType!];EWorkshopFileType
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest: {SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest} [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			unPublishedFileId [uint64! value]  ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile: {SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile} [
			instancePtr  [ISteamRemoteStorage!];intptr_t
			updateHandle [uint64! value]       ;PublishedFileUpdateHandle_t
			pchFile      [c-string!]           ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile: {SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile} [
			instancePtr    [ISteamRemoteStorage!];intptr_t
			updateHandle   [uint64! value]     ;PublishedFileUpdateHandle_t
			pchPreviewFile [c-string!]         ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle: {SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle} [
			instancePtr  [ISteamRemoteStorage!];intptr_t
			updateHandle [uint64! value]       ;PublishedFileUpdateHandle_t
			pchTitle     [c-string!]           ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription: {SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription} [
			instancePtr    [ISteamRemoteStorage!];intptr_t
			updateHandle   [uint64! value]     ;PublishedFileUpdateHandle_t
			pchDescription [c-string!]         ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility: {SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility} [
			instancePtr  [ISteamRemoteStorage!];intptr_t
			updateHandle [uint64! value]       ;PublishedFileUpdateHandle_t
			eVisibility  [ERemoteStoragePublishedFileVisibility!];ERemoteStoragePublishedFileVisibility
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags: {SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags} [
			instancePtr  [ISteamRemoteStorage!];intptr_t
			updateHandle [uint64! value]       ;PublishedFileUpdateHandle_t
			pTags        [int-ptr!]            ;struct SteamParamStringArray_t *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate: {SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate} [
			instancePtr  [ISteamRemoteStorage!];intptr_t
			updateHandle [uint64! value]       ;PublishedFileUpdateHandle_t
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails: {SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails} [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			unPublishedFileId [uint64! value]  ;PublishedFileId_t
			unMaxSecondsOld   [integer!]       ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_DeletePublishedFile: "SteamAPI_ISteamRemoteStorage_DeletePublishedFile" [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			unPublishedFileId [uint64! value]  ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles: {SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles} [
			instancePtr  [ISteamRemoteStorage!];intptr_t
			unStartIndex [integer!]            ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_SubscribePublishedFile: {SteamAPI_ISteamRemoteStorage_SubscribePublishedFile} [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			unPublishedFileId [uint64! value]  ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles: {SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles} [
			instancePtr  [ISteamRemoteStorage!];intptr_t
			unStartIndex [integer!]            ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile: {SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile} [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			unPublishedFileId [uint64! value]  ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription: {SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription} [
			instancePtr         [ISteamRemoteStorage!];intptr_t
			updateHandle        [uint64! value];PublishedFileUpdateHandle_t
			pchChangeDescription[c-string!]    ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails: {SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails} [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			unPublishedFileId [uint64! value]  ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote: {SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote} [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			unPublishedFileId [uint64! value]  ;PublishedFileId_t
			bVoteUp           [logic!]         ;bool
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails: {SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails} [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			unPublishedFileId [uint64! value]  ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles: {SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles} [
			instancePtr   [ISteamRemoteStorage!];intptr_t
			steamId       [CSteamID!]          ;class CSteamID
			unStartIndex  [integer!]           ;uint32
			pRequiredTags [int-ptr!]           ;struct SteamParamStringArray_t *
			pExcludedTags [int-ptr!]           ;struct SteamParamStringArray_t *
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_PublishVideo: "SteamAPI_ISteamRemoteStorage_PublishVideo" [
			instancePtr        [ISteamRemoteStorage!];intptr_t
			eVideoProvider     [EWorkshopVideoProvider!];EWorkshopVideoProvider
			pchVideoAccount    [c-string!]     ;const char *
			pchVideoIdentifier [c-string!]     ;const char *
			pchPreviewFile     [c-string!]     ;const char *
			nConsumerAppId     [integer!]      ;AppId_t
			pchTitle           [c-string!]     ;const char *
			pchDescription     [c-string!]     ;const char *
			eVisibility        [ERemoteStoragePublishedFileVisibility!];ERemoteStoragePublishedFileVisibility
			pTags              [int-ptr!]      ;struct SteamParamStringArray_t *
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction: {SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction} [
			instancePtr       [ISteamRemoteStorage!];intptr_t
			unPublishedFileId [uint64! value]  ;PublishedFileId_t
			eAction           [EWorkshopFileAction!];EWorkshopFileAction
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction: {SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction} [
			instancePtr  [ISteamRemoteStorage!];intptr_t
			eAction      [EWorkshopFileAction!];EWorkshopFileAction
			unStartIndex [integer!]            ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles: {SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles} [
			instancePtr      [ISteamRemoteStorage!];intptr_t
			eEnumerationType [EWorkshopEnumerationType!];EWorkshopEnumerationType
			unStartIndex     [integer!]        ;uint32
			unCount          [integer!]        ;uint32
			unDays           [integer!]        ;uint32
			pTags            [int-ptr!]        ;struct SteamParamStringArray_t *
			pUserTags        [int-ptr!]        ;struct SteamParamStringArray_t *
			return: [uint64! value]
		]
		SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation: "SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation" [
			instancePtr [ISteamRemoteStorage!] ;intptr_t
			hContent    [uint64! value]        ;UGCHandle_t
			pchLocation [c-string!]            ;const char *
			unPriority  [integer!]             ;uint32
			return: [uint64! value]
		]
	]
]
