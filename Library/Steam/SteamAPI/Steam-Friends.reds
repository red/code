Red/System [
	Title:   "Red/System SteamFriends API binding"
	Author:  "Oldes"
	File: 	 %Steam-Friends.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamFriends: declare ISteamFriends!

;-----------------------------------------------------------------------------
;- Purpose: flags for enumerating friends list, or quickly checking a the relationship between users
;-----------------------------------------------------------------------------
#enum EFriendFlags! [
	EFriendFlagNone:			    00h
	EFriendFlagBlocked:	            01h
	EFriendFlagFriendshipRequested: 02h
	EFriendFlagImmediate:           04h			; "regular" friend
	EFriendFlagClanMember:          08h
	EFriendFlagOnGameServer:        10h	
	; k_EFriendFlagHasPlayedWith	= 0x20,	 not currently used
	; k_EFriendFlagFriendOfFriend	= 0x40,  not currently used
	EFriendFlagRequestingFriendship: 80h
	EFriendFlagRequestingInfo:  0100h
	EFriendFlagIgnored:         0200h
	EFriendFlagIgnoredFriend:   0400h
	EFriendFlagSuggested:       0800h
	EFriendFlagChatMember:      1000h
	EFriendFlagAll:             FFFFh
]

;------------------------------------------------------------------------------
;- Purpose: list of states a friend can be in
;------------------------------------------------------------------------------
#enum EPersonaState! [
	k_EPersonaStateOffline: 0			; friend is not currently logged on
	k_EPersonaStateOnline:  1			; friend is logged on
	k_EPersonaStateBusy:    2			; user is on, but busy
	k_EPersonaStateAway:    3			; auto-away feature
	k_EPersonaStateSnooze:  4			; auto-away for a long time
	k_EPersonaStateLookingToTrade: 5	; Online, trading
	k_EPersonaStateLookingToPlay:  6	; Online, wanting to play
	k_EPersonaStateMax
]

;-----------------------------------------------------------------------------
;- Purpose: set of relationships to other users
;-----------------------------------------------------------------------------
#enum EFriendRelationship! [
	k_EFriendRelationshipNone:             0
	k_EFriendRelationshipBlocked:          1     ; this doesn't get stored; the user has just done an Ignore on an friendship invite
	k_EFriendRelationshipRequestRecipient: 2
	k_EFriendRelationshipFriend:           3
	k_EFriendRelationshipRequestInitiator: 4
	k_EFriendRelationshipIgnored:          5	 ; this is stored; the user has explicit blocked this other user from comments/chat/etc
	k_EFriendRelationshipIgnoredFriend:    6
	k_EFriendRelationshipSuggested_DEPRECATED: 7 ; was used by the original implementation of the facebook linking feature, but now unused.
	; keep this updated
	k_EFriendRelationshipMax: 8
]

; maximum length of friend group name (not including terminating nul!)
#define k_cchMaxFriendsGroupName  64

; maximum number of groups a single user is allowed
#define k_cFriendsGroupLimit  100

; invalid friends group identifier constant
#define k_FriendsGroupID_Invalid -1 ;int16!

#define k_cEnumerateFollowersMax  50

; These values are passed as parameters to the store
#enum EOverlayToStoreFlag! [
	k_EOverlayToStoreFlag_None: 0
	k_EOverlayToStoreFlag_AddToCart: 1
	k_EOverlayToStoreFlag_AddToCartAndShow: 2
]


#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamFriends_GetPersonaName: "SteamAPI_ISteamFriends_GetPersonaName" [
			instancePtr [ISteamFriends!]       ;intptr_t
			return: [c-string!]
		]
		SteamAPI_ISteamFriends_SetPersonaName: "SteamAPI_ISteamFriends_SetPersonaName" [
			instancePtr    [ISteamFriends!]    ;intptr_t
			pchPersonaName [c-string!]         ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_GetPersonaState: "SteamAPI_ISteamFriends_GetPersonaState" [
			instancePtr [ISteamFriends!]       ;intptr_t
			return: [EPersonaState!]
		]
		SteamAPI_ISteamFriends_GetFriendCount: "SteamAPI_ISteamFriends_GetFriendCount" [
			instancePtr  [ISteamFriends!]      ;intptr_t
			iFriendFlags [integer!]            ;int
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetFriendByIndex: "SteamAPI_ISteamFriends_GetFriendByIndex" [
			instancePtr  [ISteamFriends!]      ;intptr_t
			iFriend      [integer!]            ;int
			iFriendFlags [integer!]            ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_GetFriendRelationship: "SteamAPI_ISteamFriends_GetFriendRelationship" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			return: [EFriendRelationship!]
		]
		SteamAPI_ISteamFriends_GetFriendPersonaState: "SteamAPI_ISteamFriends_GetFriendPersonaState" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			return: [EPersonaState!]
		]
		SteamAPI_ISteamFriends_GetFriendPersonaName: "SteamAPI_ISteamFriends_GetFriendPersonaName" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			return: [c-string!]
		]
		SteamAPI_ISteamFriends_GetFriendGamePlayed: "SteamAPI_ISteamFriends_GetFriendGamePlayed" [
			instancePtr     [ISteamFriends!]   ;intptr_t
			steamIDFriend   [CSteamID!]        ;class CSteamID
			pFriendGameInfo [FriendGameInfo!]  ;struct FriendGameInfo_t *
			return: [logic!]
		]
		SteamAPI_ISteamFriends_GetFriendPersonaNameHistory: "SteamAPI_ISteamFriends_GetFriendPersonaNameHistory" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			iPersonaName  [integer!]           ;int
			return: [c-string!]
		]
		SteamAPI_ISteamFriends_GetFriendSteamLevel: "SteamAPI_ISteamFriends_GetFriendSteamLevel" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetPlayerNickname: "SteamAPI_ISteamFriends_GetPlayerNickname" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDPlayer [CSteamID!]          ;class CSteamID
			return: [c-string!]
		]
		SteamAPI_ISteamFriends_GetFriendsGroupCount: "SteamAPI_ISteamFriends_GetFriendsGroupCount" [
			instancePtr [ISteamFriends!]       ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex: "SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex" [
			instancePtr [ISteamFriends!]       ;intptr_t
			iFG         [integer!]             ;int
			return: [int16!]
		]
		SteamAPI_ISteamFriends_GetFriendsGroupName: "SteamAPI_ISteamFriends_GetFriendsGroupName" [
			instancePtr    [ISteamFriends!]    ;intptr_t
			friendsGroupID [int16!]            ;FriendsGroupID_t
			return: [c-string!]
		]
		SteamAPI_ISteamFriends_GetFriendsGroupMembersCount: "SteamAPI_ISteamFriends_GetFriendsGroupMembersCount" [
			instancePtr    [ISteamFriends!]    ;intptr_t
			friendsGroupID [int16!]            ;FriendsGroupID_t
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetFriendsGroupMembersList: "SteamAPI_ISteamFriends_GetFriendsGroupMembersList" [
			instancePtr        [ISteamFriends!];intptr_t
			friendsGroupID     [int16!]        ;FriendsGroupID_t
			pOutSteamIDMembers [CSteamID-ref!] ;class CSteamID *
			nMembersCount      [integer!]      ;int
		]
		SteamAPI_ISteamFriends_HasFriend: "SteamAPI_ISteamFriends_HasFriend" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			iFriendFlags  [integer!]           ;int
			return: [logic!]
		]
		SteamAPI_ISteamFriends_GetClanCount: "SteamAPI_ISteamFriends_GetClanCount" [
			instancePtr [ISteamFriends!]       ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetClanByIndex: "SteamAPI_ISteamFriends_GetClanByIndex" [
			instancePtr [ISteamFriends!]       ;intptr_t
			iClan       [integer!]             ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_GetClanName: "SteamAPI_ISteamFriends_GetClanName" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			return: [c-string!]
		]
		SteamAPI_ISteamFriends_GetClanTag: "SteamAPI_ISteamFriends_GetClanTag" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			return: [c-string!]
		]
		SteamAPI_ISteamFriends_GetClanActivityCounts: "SteamAPI_ISteamFriends_GetClanActivityCounts" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			pnOnline    [int-ptr!]             ;int *
			pnInGame    [int-ptr!]             ;int *
			pnChatting  [int-ptr!]             ;int *
			return: [logic!]
		]
		SteamAPI_ISteamFriends_DownloadClanActivityCounts: "SteamAPI_ISteamFriends_DownloadClanActivityCounts" [
			instancePtr     [ISteamFriends!]   ;intptr_t
			psteamIDClans   [CSteamID-ref!]    ;class CSteamID *
			cClansToRequest [integer!]         ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_GetFriendCountFromSource: "SteamAPI_ISteamFriends_GetFriendCountFromSource" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDSource [CSteamID!]          ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetFriendFromSourceByIndex: "SteamAPI_ISteamFriends_GetFriendFromSourceByIndex" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDSource [CSteamID!]          ;class CSteamID
			iFriend       [integer!]           ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_IsUserInSource: "SteamAPI_ISteamFriends_IsUserInSource" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDUser   [CSteamID!]          ;class CSteamID
			steamIDSource [CSteamID!]          ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamFriends_SetInGameVoiceSpeaking: "SteamAPI_ISteamFriends_SetInGameVoiceSpeaking" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDUser [CSteamID!]            ;class CSteamID
			bSpeaking   [logic!]               ;bool
		]
		SteamAPI_ISteamFriends_ActivateGameOverlay: "SteamAPI_ISteamFriends_ActivateGameOverlay" [
			instancePtr [ISteamFriends!]       ;intptr_t
			pchDialog   [c-string!]            ;const char *
		]
		SteamAPI_ISteamFriends_ActivateGameOverlayToUser: "SteamAPI_ISteamFriends_ActivateGameOverlayToUser" [
			instancePtr [ISteamFriends!]       ;intptr_t
			pchDialog   [c-string!]            ;const char *
			steamID     [CSteamID!]            ;class CSteamID
		]
		SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage: {SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage} [
			instancePtr [ISteamFriends!]       ;intptr_t
			pchURL      [c-string!]            ;const char *
		]
		SteamAPI_ISteamFriends_ActivateGameOverlayToStore: "SteamAPI_ISteamFriends_ActivateGameOverlayToStore" [
			instancePtr [ISteamFriends!]       ;intptr_t
			nAppID      [integer!]             ;AppId_t
			eFlag       [EOverlayToStoreFlag!] ;EOverlayToStoreFlag
		]
		SteamAPI_ISteamFriends_SetPlayedWith: "SteamAPI_ISteamFriends_SetPlayedWith" [
			instancePtr         [ISteamFriends!];intptr_t
			steamIDUserPlayedWith[CSteamID!]   ;class CSteamID
		]
		SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog: {SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog} [
			instancePtr  [ISteamFriends!]      ;intptr_t
			steamIDLobby [CSteamID!]           ;class CSteamID
		]
		SteamAPI_ISteamFriends_GetSmallFriendAvatar: "SteamAPI_ISteamFriends_GetSmallFriendAvatar" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetMediumFriendAvatar: "SteamAPI_ISteamFriends_GetMediumFriendAvatar" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetLargeFriendAvatar: "SteamAPI_ISteamFriends_GetLargeFriendAvatar" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamFriends_RequestUserInformation: "SteamAPI_ISteamFriends_RequestUserInformation" [
			instancePtr      [ISteamFriends!]  ;intptr_t
			steamIDUser      [CSteamID!]       ;class CSteamID
			bRequireNameOnly [logic!]          ;bool
			return: [logic!]
		]
		SteamAPI_ISteamFriends_RequestClanOfficerList: "SteamAPI_ISteamFriends_RequestClanOfficerList" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_GetClanOwner: "SteamAPI_ISteamFriends_GetClanOwner" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_GetClanOfficerCount: "SteamAPI_ISteamFriends_GetClanOfficerCount" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetClanOfficerByIndex: "SteamAPI_ISteamFriends_GetClanOfficerByIndex" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			iOfficer    [integer!]             ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_GetUserRestrictions: "SteamAPI_ISteamFriends_GetUserRestrictions" [
			instancePtr [ISteamFriends!]       ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamFriends_SetRichPresence: "SteamAPI_ISteamFriends_SetRichPresence" [
			instancePtr [ISteamFriends!]       ;intptr_t
			pchKey      [c-string!]            ;const char *
			pchValue    [c-string!]            ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamFriends_ClearRichPresence: "SteamAPI_ISteamFriends_ClearRichPresence" [
			instancePtr [ISteamFriends!]       ;intptr_t
		]
		SteamAPI_ISteamFriends_GetFriendRichPresence: "SteamAPI_ISteamFriends_GetFriendRichPresence" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			pchKey        [c-string!]          ;const char *
			return: [c-string!]
		]
		SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount: {SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount} [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex: {SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex} [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			iKey          [integer!]           ;int
			return: [c-string!]
		]
		SteamAPI_ISteamFriends_RequestFriendRichPresence: "SteamAPI_ISteamFriends_RequestFriendRichPresence" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
		]
		SteamAPI_ISteamFriends_InviteUserToGame: "SteamAPI_ISteamFriends_InviteUserToGame" [
			instancePtr      [ISteamFriends!]  ;intptr_t
			steamIDFriend    [CSteamID!]       ;class CSteamID
			pchConnectString [c-string!]       ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamFriends_GetCoplayFriendCount: "SteamAPI_ISteamFriends_GetCoplayFriendCount" [
			instancePtr [ISteamFriends!]       ;intptr_t
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetCoplayFriend: "SteamAPI_ISteamFriends_GetCoplayFriend" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			iCoplayFriend [integer!]           ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_GetFriendCoplayTime: "SteamAPI_ISteamFriends_GetFriendCoplayTime" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetFriendCoplayGame: "SteamAPI_ISteamFriends_GetFriendCoplayGame" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamFriends_JoinClanChatRoom: "SteamAPI_ISteamFriends_JoinClanChatRoom" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_LeaveClanChatRoom: "SteamAPI_ISteamFriends_LeaveClanChatRoom" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamFriends_GetClanChatMemberCount: "SteamAPI_ISteamFriends_GetClanChatMemberCount" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetChatMemberByIndex: "SteamAPI_ISteamFriends_GetChatMemberByIndex" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamIDClan [CSteamID!]            ;class CSteamID
			iUser       [integer!]             ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_SendClanChatMessage: "SteamAPI_ISteamFriends_SendClanChatMessage" [
			instancePtr     [ISteamFriends!]   ;intptr_t
			steamIDClanChat [CSteamID!]        ;class CSteamID
			pchText         [c-string!]        ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamFriends_GetClanChatMessage: "SteamAPI_ISteamFriends_GetClanChatMessage" [
			instancePtr     [ISteamFriends!]   ;intptr_t
			steamIDClanChat [CSteamID!]        ;class CSteamID
			iMessage        [integer!]         ;int
			prgchText       [byte-ptr!]        ;void *
			cchTextMax      [integer!]         ;int
			peChatEntryType [int-ptr!]         ;EChatEntryType *
			psteamidChatter [CSteamID-ref!]    ;class CSteamID *
			return: [integer!]
		]
		SteamAPI_ISteamFriends_IsClanChatAdmin: "SteamAPI_ISteamFriends_IsClanChatAdmin" [
			instancePtr     [ISteamFriends!]   ;intptr_t
			steamIDClanChat [CSteamID!]        ;class CSteamID
			steamIDUser     [CSteamID!]        ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam: "SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam" [
			instancePtr     [ISteamFriends!]   ;intptr_t
			steamIDClanChat [CSteamID!]        ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamFriends_OpenClanChatWindowInSteam: "SteamAPI_ISteamFriends_OpenClanChatWindowInSteam" [
			instancePtr     [ISteamFriends!]   ;intptr_t
			steamIDClanChat [CSteamID!]        ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamFriends_CloseClanChatWindowInSteam: "SteamAPI_ISteamFriends_CloseClanChatWindowInSteam" [
			instancePtr     [ISteamFriends!]   ;intptr_t
			steamIDClanChat [CSteamID!]        ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamFriends_SetListenForFriendsMessages: "SteamAPI_ISteamFriends_SetListenForFriendsMessages" [
			instancePtr       [ISteamFriends!] ;intptr_t
			bInterceptEnabled [logic!]         ;bool
			return: [logic!]
		]
		SteamAPI_ISteamFriends_ReplyToFriendMessage: "SteamAPI_ISteamFriends_ReplyToFriendMessage" [
			instancePtr   [ISteamFriends!]     ;intptr_t
			steamIDFriend [CSteamID!]          ;class CSteamID
			pchMsgToSend  [c-string!]          ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamFriends_GetFriendMessage: "SteamAPI_ISteamFriends_GetFriendMessage" [
			instancePtr     [ISteamFriends!]   ;intptr_t
			steamIDFriend   [CSteamID!]        ;class CSteamID
			iMessageID      [integer!]         ;int
			pvData          [byte-ptr!]        ;void *
			cubData         [integer!]         ;int
			peChatEntryType [int-ptr!]         ;EChatEntryType *
			return: [integer!]
		]
		SteamAPI_ISteamFriends_GetFollowerCount: "SteamAPI_ISteamFriends_GetFollowerCount" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamID     [CSteamID!]            ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_IsFollowing: "SteamAPI_ISteamFriends_IsFollowing" [
			instancePtr [ISteamFriends!]       ;intptr_t
			steamID     [CSteamID!]            ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamFriends_EnumerateFollowingList: "SteamAPI_ISteamFriends_EnumerateFollowingList" [
			instancePtr  [ISteamFriends!]      ;intptr_t
			unStartIndex [integer!]            ;uint32
			return: [uint64! value]
		]
	]
]

