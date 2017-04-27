Red/System [
	Title:   "Red/System SteamUGC API binding"
	Author:  "Oldes"
	File:    %Steam-UGC.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamUGC: declare ISteamUGC!
;Matching UGC types for queries
#enum EUGCMatchingUGCType! [
	k_EUGCMatchingUGCType_Items:              0     ;both mtx items and ready-to-use items
	k_EUGCMatchingUGCType_Items_Mtx:          1
	k_EUGCMatchingUGCType_Items_ReadyToUse:   2
	k_EUGCMatchingUGCType_Collections:        3
	k_EUGCMatchingUGCType_Artwork:            4
	k_EUGCMatchingUGCType_Videos:             5
	k_EUGCMatchingUGCType_Screenshots:        6
	k_EUGCMatchingUGCType_AllGuides:          7     ;both web guides and integrated guides
	k_EUGCMatchingUGCType_WebGuides:          8
	k_EUGCMatchingUGCType_IntegratedGuides:   9
	k_EUGCMatchingUGCType_UsableInGame:       10    ;ready-to-use items and integrated guides
	k_EUGCMatchingUGCType_ControllerBindings: 11
	k_EUGCMatchingUGCType_GameManagedItems:   12    ;game managed items (not managed by users)
	k_EUGCMatchingUGCType_All:               FFh    ;return everything
]

;Different lists of published UGC for a user.
;If the current logged in user is different than the specified user, then some options may not be allowed.
#enum EUserUGCList! [
	k_EUserUGCList_Published
	k_EUserUGCList_VotedOn
	k_EUserUGCList_VotedUp
	k_EUserUGCList_VotedDown
	k_EUserUGCList_WillVoteLater
	k_EUserUGCList_Favorited
	k_EUserUGCList_Subscribed
	k_EUserUGCList_UsedOrPlayed
	k_EUserUGCList_Followed
]

;Sort order for user published UGC lists (defaults to creation order descending)
#enum EUserUGCListSortOrder! [
	k_EUserUGCListSortOrder_CreationOrderDesc
	k_EUserUGCListSortOrder_CreationOrderAsc
	k_EUserUGCListSortOrder_TitleAsc
	k_EUserUGCListSortOrder_LastUpdatedDesc
	k_EUserUGCListSortOrder_SubscriptionDateDesc
	k_EUserUGCListSortOrder_VoteScoreDesc
	k_EUserUGCListSortOrder_ForModeration
]

;Combination of sorting and filtering for queries across all UGC
#enum EUGCQuery! [
	k_EUGCQuery_RankedByVote:                                  0
	k_EUGCQuery_RankedByPublicationDate:                       1
	k_EUGCQuery_AcceptedForGameRankedByAcceptanceDate:         2
	k_EUGCQuery_RankedByTrend:                                 3
	k_EUGCQuery_FavoritedByFriendsRankedByPublicationDate:     4
	k_EUGCQuery_CreatedByFriendsRankedByPublicationDate:       5
	k_EUGCQuery_RankedByNumTimesReported:                      6
	k_EUGCQuery_CreatedByFollowedUsersRankedByPublicationDate: 7
	k_EUGCQuery_NotYetRated:                                   8
	k_EUGCQuery_RankedByTotalVotesAsc:                         9
	k_EUGCQuery_RankedByVotesUp:                               10
	k_EUGCQuery_RankedByTextSearch:                            11
	k_EUGCQuery_RankedByTotalUniqueSubscriptions:              12
	k_EUGCQuery_RankedByPlaytimeTrend:                         13
	k_EUGCQuery_RankedByTotalPlaytime:                         14
	k_EUGCQuery_RankedByAveragePlaytimeTrend:                  15
	k_EUGCQuery_RankedByLifetimeAveragePlaytime:               16
	k_EUGCQuery_RankedByPlaytimeSessionsTrend:                 17
	k_EUGCQuery_RankedByLifetimePlaytimeSessions:              18
]

#enum EItemUpdateStatus! [
	k_EItemUpdateStatusInvalid:              0 ;The item update handle was invalid, job might be finished, listen too SubmitItemUpdateResult_t
	k_EItemUpdateStatusPreparingConfig:      1 ;The item update is processing configuration data
	k_EItemUpdateStatusPreparingContent:     2 ;The item update is reading and processing content files
	k_EItemUpdateStatusUploadingContent:     3 ;The item update is uploading content changes to Steam
	k_EItemUpdateStatusUploadingPreviewFile: 4 ;The item update is uploading new preview file image
	k_EItemUpdateStatusCommittingChanges:    5 ;The item update is committing all changes
]

#enum EItemState! [
	k_EItemStateNone:            0  ;item not tracked on client
	k_EItemStateSubscribed:      1  ;current user is subscribed to this item. Not just cached.
	k_EItemStateLegacyItem:      2  ;item was created with ISteamRemoteStorage
	k_EItemStateInstalled:       4  ;item is installed and usable (but maybe out of date)
	k_EItemStateNeedsUpdate:     8  ;items needs an update. Either because it's not installed yet or creator updated content
	k_EItemStateDownloading:     16 ;item update is currently downloading
	k_EItemStateDownloadPending: 32 ;DownloadItem() was called for this item, content isn't available until DownloadItemResult_t is fired
]

#enum EItemStatistic! [
	k_EItemStatistic_NumSubscriptions:       0
	k_EItemStatistic_NumFavorites:           1
	k_EItemStatistic_NumFollowers:           2
	k_EItemStatistic_NumUniqueSubscriptions: 3
	k_EItemStatistic_NumUniqueFavorites:     4
	k_EItemStatistic_NumUniqueFollowers:     5
	k_EItemStatistic_NumUniqueWebsiteViews:  6
	k_EItemStatistic_ReportScore:            7
	k_EItemStatistic_NumSecondsPlayed:       8
	k_EItemStatistic_NumPlaytimeSessions:    9
	k_EItemStatistic_NumComments:            10
]

#enum EItemPreviewType! [
	k_EItemPreviewType_Image:                            0    ;standard image file expected (e.g. jpg, png, gif, etc.)
	k_EItemPreviewType_YouTubeVideo:                     1    ;video id is stored
	k_EItemPreviewType_Sketchfab:                        2    ;model id is stored
	k_EItemPreviewType_EnvironmentMap_HorizontalCross:   3    ;standard image file expected - cube map in the layout
																;+---+---+-------+
																;|   |Up |       |
																;+---+---+---+---+
																;| L | F | R | B |
																;+---+---+---+---+
																;|   |Dn |       |
																;+---+---+---+---+
	k_EItemPreviewType_EnvironmentMap_LatLong:           4    ;standard image file expected
	k_EItemPreviewType_ReservedMax:                      255  ;you can specify your own types above this value
]

#define kNumUGCResultsPerPage  50
#define k_cchDeveloperMetadataMax 5000

;Details for a single published file/UGC
;struct SteamUGCDetails_t
;{
;	PublishedFileId_t m_nPublishedFileId;
;	EResult m_eResult;                                              ;The result of the operation.   
;	EWorkshopFileType m_eFileType;                                  ;Type of the file
;	AppId_t m_nCreatorAppID;                                        ;ID of the app that created this file.
;	AppId_t m_nConsumerAppID;                                       ;ID of the app that will consume this file.
;	char m_rgchTitle[k_cchPublishedDocumentTitleMax];               ;title of document
;	char m_rgchDescription[k_cchPublishedDocumentDescriptionMax];   ;description of document
;	uint64 m_ulSteamIDOwner;                                        ;Steam ID of the user who created this content.
;	uint32 m_rtimeCreated;                                          ;time when the published file was created
;	uint32 m_rtimeUpdated;                                          ;time when the published file was last updated
;	uint32 m_rtimeAddedToUserList;                                  ;time when the user added the published file to their list (not always applicable)
;	ERemoteStoragePublishedFileVisibility m_eVisibility;            ;visibility
;	bool m_bBanned;                                                 ;whether the file was banned
;	bool m_bAcceptedForUse;                                         ;developer has specifically flagged this item as accepted in the Workshop
;	bool m_bTagsTruncated;                                          ;whether the list of tags was too long to be returned in the provided buffer
;	char m_rgchTags[k_cchTagListMax];                               ;comma separated list of all tags associated with this file 
;	;file/url information
;	UGCHandle_t m_hFile;                                            ;The handle of the primary file
;	UGCHandle_t m_hPreviewFile;                                     ;The handle of the preview file
;	char m_pchFileName[k_cchFilenameMax];                           ;The cloud filename of the primary file
;	int32 m_nFileSize;                                              ;Size of the primary file
;	int32 m_nPreviewFileSize;                                       ;Size of the preview file
;	char m_rgchURL[k_cchPublishedFileURLMax];                       ;URL (for a video or a website)
;	;voting information
;	uint32 m_unVotesUp;                                             ;number of votes up
;	uint32 m_unVotesDown;                                           ;number of votes down
;	float m_flScore;                                                ;calculated score
;	;collection details
;	uint32 m_unNumChildren;                         
;};


#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamUGC_CreateQueryUserUGCRequest: "SteamAPI_ISteamUGC_CreateQueryUserUGCRequest" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			unAccountID      [integer!]        ;AccountID_t
			eListType        [EUserUGCList!]   ;EUserUGCList
			eMatchingUGCType [EUGCMatchingUGCType!];EUGCMatchingUGCType
			eSortOrder       [EUserUGCListSortOrder!];EUserUGCListSortOrder
			nCreatorAppID    [integer!]        ;AppId_t
			nConsumerAppID   [integer!]        ;AppId_t
			unPage           [integer!]        ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_CreateQueryAllUGCRequest: "SteamAPI_ISteamUGC_CreateQueryAllUGCRequest" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			eQueryType          [EUGCQuery!]   ;EUGCQuery
			eMatchingeMatchingUGCTypeFileType[EUGCMatchingUGCType!];EUGCMatchingUGCType
			nCreatorAppID       [integer!]     ;AppId_t
			nConsumerAppID      [integer!]     ;AppId_t
			unPage              [integer!]     ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest: "SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			pvecPublishedFileID [uint64-ref!]  ;PublishedFileId_t *
			unNumPublishedFileIDs[integer!]    ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_SendQueryUGCRequest: "SteamAPI_ISteamUGC_SendQueryUGCRequest" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_GetQueryUGCResult: "SteamAPI_ISteamUGC_GetQueryUGCResult" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			index       [integer!]             ;uint32
			pDetails    [int-ptr!]             ;struct SteamUGCDetails_t *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_GetQueryUGCPreviewURL: "SteamAPI_ISteamUGC_GetQueryUGCPreviewURL" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			index       [integer!]             ;uint32
			pchURL      [c-string!]            ;char *
			cchURLSize  [integer!]             ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamUGC_GetQueryUGCMetadata: "SteamAPI_ISteamUGC_GetQueryUGCMetadata" [
			instancePtr     [ISteamUGC!]       ;intptr_t
			handle          [uint64! value]    ;UGCQueryHandle_t
			index           [integer!]         ;uint32
			pchMetadata     [c-string!]        ;char *
			cchMetadatasize [integer!]         ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamUGC_GetQueryUGCChildren: "SteamAPI_ISteamUGC_GetQueryUGCChildren" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			handle              [uint64! value];UGCQueryHandle_t
			index               [integer!]     ;uint32
			pvecPublishedFileID [uint64-ref!]  ;PublishedFileId_t *
			cMaxEntries         [integer!]     ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamUGC_GetQueryUGCStatistic: "SteamAPI_ISteamUGC_GetQueryUGCStatistic" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			index       [integer!]             ;uint32
			eStatType   [EItemStatistic!]      ;EItemStatistic
			pStatValue  [uint64-ref!]          ;uint64 *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews: {SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews} [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			index       [integer!]             ;uint32
			return: [integer!]
		]
		SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview: "SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			handle              [uint64! value];UGCQueryHandle_t
			index               [integer!]     ;uint32
			previewIndex        [integer!]     ;uint32
			pchURLOrVideoID     [c-string!]    ;char *
			cchURLSize          [integer!]     ;uint32
			pchOriginalFileName [c-string!]    ;char *
			cchOriginalFileNameSize[integer!]  ;uint32
			pPreviewType        [int-ptr!]     ;EItemPreviewType *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags: "SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			index       [integer!]             ;uint32
			return: [integer!]
		]
		SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag: "SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			handle           [uint64! value]   ;UGCQueryHandle_t
			index            [integer!]        ;uint32
			keyValueTagIndex [integer!]        ;uint32
			pchKey           [c-string!]       ;char *
			cchKeySize       [integer!]        ;uint32
			pchValue         [c-string!]       ;char *
			cchValueSize     [integer!]        ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamUGC_ReleaseQueryUGCRequest: "SteamAPI_ISteamUGC_ReleaseQueryUGCRequest" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			return: [logic!]
		]
		SteamAPI_ISteamUGC_AddRequiredTag: "SteamAPI_ISteamUGC_AddRequiredTag" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			pTagName    [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_AddExcludedTag: "SteamAPI_ISteamUGC_AddExcludedTag" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			pTagName    [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetReturnOnlyIDs: "SteamAPI_ISteamUGC_SetReturnOnlyIDs" [
			instancePtr    [ISteamUGC!]        ;intptr_t
			handle         [uint64! value]     ;UGCQueryHandle_t
			bReturnOnlyIDs [logic!]            ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetReturnKeyValueTags: "SteamAPI_ISteamUGC_SetReturnKeyValueTags" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			handle              [uint64! value];UGCQueryHandle_t
			bReturnKeyValueTags [logic!]       ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetReturnLongDescription: "SteamAPI_ISteamUGC_SetReturnLongDescription" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			handle              [uint64! value];UGCQueryHandle_t
			bReturnLongDescription[logic!]     ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetReturnMetadata: "SteamAPI_ISteamUGC_SetReturnMetadata" [
			instancePtr     [ISteamUGC!]       ;intptr_t
			handle          [uint64! value]    ;UGCQueryHandle_t
			bReturnMetadata [logic!]           ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetReturnChildren: "SteamAPI_ISteamUGC_SetReturnChildren" [
			instancePtr     [ISteamUGC!]       ;intptr_t
			handle          [uint64! value]    ;UGCQueryHandle_t
			bReturnChildren [logic!]           ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetReturnAdditionalPreviews: "SteamAPI_ISteamUGC_SetReturnAdditionalPreviews" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			handle              [uint64! value];UGCQueryHandle_t
			bReturnAdditionalPreviews[logic!]  ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetReturnTotalOnly: "SteamAPI_ISteamUGC_SetReturnTotalOnly" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			handle           [uint64! value]   ;UGCQueryHandle_t
			bReturnTotalOnly [logic!]          ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetLanguage: "SteamAPI_ISteamUGC_SetLanguage" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			pchLanguage [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetAllowCachedResponse: "SteamAPI_ISteamUGC_SetAllowCachedResponse" [
			instancePtr     [ISteamUGC!]       ;intptr_t
			handle          [uint64! value]    ;UGCQueryHandle_t
			unMaxAgeSeconds [integer!]         ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetCloudFileNameFilter: "SteamAPI_ISteamUGC_SetCloudFileNameFilter" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			handle              [uint64! value];UGCQueryHandle_t
			pMatchCloudFileName [c-string!]    ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetMatchAnyTag: "SteamAPI_ISteamUGC_SetMatchAnyTag" [
			instancePtr  [ISteamUGC!]          ;intptr_t
			handle       [uint64! value]       ;UGCQueryHandle_t
			bMatchAnyTag [logic!]              ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetSearchText: "SteamAPI_ISteamUGC_SetSearchText" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			pSearchText [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetRankedByTrendDays: "SteamAPI_ISteamUGC_SetRankedByTrendDays" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			unDays      [integer!]             ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamUGC_AddRequiredKeyValueTag: "SteamAPI_ISteamUGC_AddRequiredKeyValueTag" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCQueryHandle_t
			pKey        [c-string!]            ;const char *
			pValue      [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_RequestUGCDetails: "SteamAPI_ISteamUGC_RequestUGCDetails" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			unMaxAgeSeconds  [integer!]        ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_CreateItem: "SteamAPI_ISteamUGC_CreateItem" [
			instancePtr    [ISteamUGC!]        ;intptr_t
			nConsumerAppId [integer!]          ;AppId_t
			eFileType      [EWorkshopFileType!];EWorkshopFileType
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_StartItemUpdate: "SteamAPI_ISteamUGC_StartItemUpdate" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nConsumerAppId   [integer!]        ;AppId_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_SetItemTitle: "SteamAPI_ISteamUGC_SetItemTitle" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCUpdateHandle_t
			pchTitle    [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetItemDescription: "SteamAPI_ISteamUGC_SetItemDescription" [
			instancePtr    [ISteamUGC!]        ;intptr_t
			handle         [uint64! value]     ;UGCUpdateHandle_t
			pchDescription [c-string!]         ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetItemUpdateLanguage: "SteamAPI_ISteamUGC_SetItemUpdateLanguage" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCUpdateHandle_t
			pchLanguage [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetItemMetadata: "SteamAPI_ISteamUGC_SetItemMetadata" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCUpdateHandle_t
			pchMetaData [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetItemVisibility: "SteamAPI_ISteamUGC_SetItemVisibility" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCUpdateHandle_t
			eVisibility [ERemoteStoragePublishedFileVisibility!];ERemoteStoragePublishedFileVisibility
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetItemTags: "SteamAPI_ISteamUGC_SetItemTags" [
			instancePtr  [ISteamUGC!]          ;intptr_t
			updateHandle [uint64! value]       ;UGCUpdateHandle_t
			pTags        [int-ptr!]            ;const struct SteamParamStringArray_t *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetItemContent: "SteamAPI_ISteamUGC_SetItemContent" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			handle           [uint64! value]   ;UGCUpdateHandle_t
			pszContentFolder [c-string!]       ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SetItemPreview: "SteamAPI_ISteamUGC_SetItemPreview" [
			instancePtr    [ISteamUGC!]        ;intptr_t
			handle         [uint64! value]     ;UGCUpdateHandle_t
			pszPreviewFile [c-string!]         ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_RemoveItemKeyValueTags: "SteamAPI_ISteamUGC_RemoveItemKeyValueTags" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCUpdateHandle_t
			pchKey      [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_AddItemKeyValueTag: "SteamAPI_ISteamUGC_AddItemKeyValueTag" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCUpdateHandle_t
			pchKey      [c-string!]            ;const char *
			pchValue    [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_AddItemPreviewFile: "SteamAPI_ISteamUGC_AddItemPreviewFile" [
			instancePtr    [ISteamUGC!]        ;intptr_t
			handle         [uint64! value]     ;UGCUpdateHandle_t
			pszPreviewFile [c-string!]         ;const char *
			type           [EItemPreviewType!] ;EItemPreviewType
			return: [logic!]
		]
		SteamAPI_ISteamUGC_AddItemPreviewVideo: "SteamAPI_ISteamUGC_AddItemPreviewVideo" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCUpdateHandle_t
			pszVideoID  [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_UpdateItemPreviewFile: "SteamAPI_ISteamUGC_UpdateItemPreviewFile" [
			instancePtr    [ISteamUGC!]        ;intptr_t
			handle         [uint64! value]     ;UGCUpdateHandle_t
			index          [integer!]          ;uint32
			pszPreviewFile [c-string!]         ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_UpdateItemPreviewVideo: "SteamAPI_ISteamUGC_UpdateItemPreviewVideo" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCUpdateHandle_t
			index       [integer!]             ;uint32
			pszVideoID  [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_RemoveItemPreview: "SteamAPI_ISteamUGC_RemoveItemPreview" [
			instancePtr [ISteamUGC!]           ;intptr_t
			handle      [uint64! value]        ;UGCUpdateHandle_t
			index       [integer!]             ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SubmitItemUpdate: "SteamAPI_ISteamUGC_SubmitItemUpdate" [
			instancePtr   [ISteamUGC!]         ;intptr_t
			handle        [uint64! value]      ;UGCUpdateHandle_t
			pchChangeNote [c-string!]          ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_GetItemUpdateProgress: "SteamAPI_ISteamUGC_GetItemUpdateProgress" [
			instancePtr       [ISteamUGC!]     ;intptr_t
			handle            [uint64! value]  ;UGCUpdateHandle_t
			punBytesProcessed [uint64-ref!]    ;uint64 *
			punBytesTotal     [uint64-ref!]    ;uint64 *
			return: [EItemUpdateStatus!]
		]
		SteamAPI_ISteamUGC_SetUserItemVote: "SteamAPI_ISteamUGC_SetUserItemVote" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			bVoteUp          [logic!]          ;bool
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_GetUserItemVote: "SteamAPI_ISteamUGC_GetUserItemVote" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_AddItemToFavorites: "SteamAPI_ISteamUGC_AddItemToFavorites" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nAppId           [integer!]        ;AppId_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_RemoveItemFromFavorites: "SteamAPI_ISteamUGC_RemoveItemFromFavorites" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nAppId           [integer!]        ;AppId_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_SubscribeItem: "SteamAPI_ISteamUGC_SubscribeItem" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_UnsubscribeItem: "SteamAPI_ISteamUGC_UnsubscribeItem" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_GetNumSubscribedItems: "SteamAPI_ISteamUGC_GetNumSubscribedItems" [
			instancePtr [ISteamUGC!]           ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamUGC_GetSubscribedItems: "SteamAPI_ISteamUGC_GetSubscribedItems" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			pvecPublishedFileID [uint64-ref!]  ;PublishedFileId_t *
			cMaxEntries         [integer!]     ;uint32
			return: [integer!]
		]
		SteamAPI_ISteamUGC_GetItemState: "SteamAPI_ISteamUGC_GetItemState" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			return: [integer!]
		]
		SteamAPI_ISteamUGC_GetItemInstallInfo: "SteamAPI_ISteamUGC_GetItemInstallInfo" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			punSizeOnDisk    [uint64-ref!]     ;uint64 *
			pchFolder        [c-string!]       ;char *
			cchFolderSize    [integer!]        ;uint32
			punTimeStamp     [int-ptr!]        ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_GetItemDownloadInfo: "SteamAPI_ISteamUGC_GetItemDownloadInfo" [
			instancePtr        [ISteamUGC!]    ;intptr_t
			nPublishedFileID   [uint64! value] ;PublishedFileId_t
			punBytesDownloaded [uint64-ref!]   ;uint64 *
			punBytesTotal      [uint64-ref!]   ;uint64 *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_DownloadItem: "SteamAPI_ISteamUGC_DownloadItem" [
			instancePtr      [ISteamUGC!]      ;intptr_t
			nPublishedFileID [uint64! value]   ;PublishedFileId_t
			bHighPriority    [logic!]          ;bool
			return: [logic!]
		]
		SteamAPI_ISteamUGC_BInitWorkshopForGameServer: "SteamAPI_ISteamUGC_BInitWorkshopForGameServer" [
			instancePtr       [ISteamUGC!]     ;intptr_t
			unWorkshopDepotID [integer!]       ;DepotId_t
			pszFolder         [c-string!]      ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamUGC_SuspendDownloads: "SteamAPI_ISteamUGC_SuspendDownloads" [
			instancePtr [ISteamUGC!]           ;intptr_t
			bSuspend    [logic!]               ;bool
		]
		SteamAPI_ISteamUGC_StartPlaytimeTracking: "SteamAPI_ISteamUGC_StartPlaytimeTracking" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			pvecPublishedFileID [uint64-ref!]  ;PublishedFileId_t *
			unNumPublishedFileIDs[integer!]    ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_StopPlaytimeTracking: "SteamAPI_ISteamUGC_StopPlaytimeTracking" [
			instancePtr         [ISteamUGC!]   ;intptr_t
			pvecPublishedFileID [uint64-ref!]  ;PublishedFileId_t *
			unNumPublishedFileIDs[integer!]    ;uint32
			return: [uint64! value]
		]
		SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems: "SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems" [
			instancePtr [ISteamUGC!]           ;intptr_t
			return: [uint64! value]
		]
	]
]

