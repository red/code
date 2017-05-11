Red/System [
	Title:   "Red/System Steam API enums"
	Author:  "Oldes"
	File:    %Steam-enums.reds
	Rights:  [
		"Copyright (C) 1996-2008, Valve LLC, All rights reserved."
		"Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	]
	License: "BSD-3 - https:;github.com/red/red/blob/master/BSD-3-License.txt"
	Comment: "Based on file %steamclientpublic.h from Steam SDK v"
]

;- General result codes
#enum EResult! [
	k_EResultOK:  1                         ; success
	k_EResultFail: 2                        ; generic failure 
	k_EResultNoConnection: 3                ; no/failed network connection
;   k_EResultNoConnectionRetry: 4           ; OBSOLETE - removed
	k_EResultInvalidPassword:  5            ; password/ticket is invalid
	k_EResultLoggedInElsewhere: 6           ; same user logged in elsewhere
	k_EResultInvalidProtocolVer: 7          ; protocol version is incorrect
	k_EResultInvalidParam: 8                ; a parameter is incorrect
	k_EResultFileNotFound: 9                ; file was not found
	k_EResultBusy: 10                       ; called method busy - action not taken
	k_EResultInvalidState: 11               ; called object was in an invalid state
	k_EResultInvalidName: 12                ; name is invalid
	k_EResultInvalidEmail: 13               ; email is invalid
	k_EResultDuplicateName: 14              ; name is not unique
	k_EResultAccessDenied: 15               ; access is denied
	k_EResultTimeout: 16                    ; operation timed out
	k_EResultBanned: 17                     ; VAC2 banned
	k_EResultAccountNotFound: 18            ; account not found
	k_EResultInvalidSteamID: 19             ; steamID is invalid
	k_EResultServiceUnavailable: 20         ; The requested service is currently unavailable
	k_EResultNotLoggedOn: 21                ; The user is not logged on
	k_EResultPending: 22                    ; Request is pending (may be in process, or waiting on third party)
	k_EResultEncryptionFailure: 23          ; Encryption or Decryption failed
	k_EResultInsufficientPrivilege: 24      ; Insufficient privilege
	k_EResultLimitExceeded: 25              ; Too much of a good thing
	k_EResultRevoked: 26                    ; Access has been revoked (used for revoked guest passes)
	k_EResultExpired: 27                    ; License/Guest pass the user is trying to access is expired
	k_EResultAlreadyRedeemed: 28            ; Guest pass has already been redeemed by account, cannot be acked again
	k_EResultDuplicateRequest: 29           ; The request is a duplicate and the action has already occurred in the past, ignored this time
	k_EResultAlreadyOwned: 30               ; All the games in this guest pass redemption request are already owned by the user
	k_EResultIPNotFound: 31                 ; IP address not found
	k_EResultPersistFailed: 32              ; failed to write change to the data store
	k_EResultLockingFailed: 33              ; failed to acquire access lock for this operation
	k_EResultLogonSessionReplaced: 34
	k_EResultConnectFailed: 35
	k_EResultHandshakeFailed: 36
	k_EResultIOFailure: 37
	k_EResultRemoteDisconnect: 38
	k_EResultShoppingCartNotFound: 39       ; failed to find the shopping cart requested
	k_EResultBlocked: 40                    ; a user didn't allow it
	k_EResultIgnored: 41                    ; target is ignoring sender
	k_EResultNoMatch: 42                    ; nothing matching the request found
	k_EResultAccountDisabled: 43
	k_EResultServiceReadOnly: 44            ; this service is not accepting content changes right now
	k_EResultAccountNotFeatured: 45         ; account doesn't have value, so this feature isn't available
	k_EResultAdministratorOK: 46            ; allowed to take this action, but only because requester is admin
	k_EResultContentVersion: 47             ; A Version mismatch in content transmitted within the Steam protocol.
	k_EResultTryAnotherCM: 48               ; The current CM can't service the user making a request, user should try another.
	k_EResultPasswordRequiredToKickSession: 49 ; You are already logged in elsewhere, this cached credential login has failed.
	k_EResultAlreadyLoggedInElsewhere: 50   ; You are already logged in elsewhere, you must wait
	k_EResultSuspended: 51                  ; Long running operation (content download) suspended/paused
	k_EResultCancelled: 52                  ; Operation canceled (typically by user: content download)
	k_EResultDataCorruption: 53             ; Operation canceled because data is ill formed or unrecoverable
	k_EResultDiskFull: 54                   ; Operation canceled - not enough disk space.
	k_EResultRemoteCallFailed: 55           ; an remote call or IPC call failed
	k_EResultPasswordUnset: 56              ; Password could not be verified as it's unset server side
	k_EResultExternalAccountUnlinked: 57    ; External account (PSN, Facebook...) is not linked to a Steam account
	k_EResultPSNTicketInvalid: 58           ; PSN ticket was invalid
	k_EResultExternalAccountAlreadyLinked: 59 ; External account (PSN, Facebook...) is already linked to some other account, must explicitly request to replace/delete the link first
	k_EResultRemoteFileConflict: 60         ; The sync cannot resume due to a conflict between the local and remote files
	k_EResultIllegalPassword: 61            ; The requested new password is not legal
	k_EResultSameAsPreviousValue: 62        ; new value is the same as the old one ( secret question and answer )
	k_EResultAccountLogonDenied: 63         ; account login denied due to 2nd factor authentication failure
	k_EResultCannotUseOldPassword: 64       ; The requested new password is not legal
	k_EResultInvalidLoginAuthCode: 65       ; account login denied due to auth code invalid
	k_EResultAccountLogonDeniedNoMail: 66   ; account login denied due to 2nd factor auth failure - and no mail has been sent
	k_EResultHardwareNotCapableOfIPT: 67    ; 
	k_EResultIPTInitError: 68               ; 
	k_EResultParentalControlRestricted: 69  ; operation failed due to parental control restrictions for current user
	k_EResultFacebookQueryError: 70         ; Facebook query returned an error
	k_EResultExpiredLoginAuthCode: 71       ; account login denied due to auth code expired
	k_EResultIPLoginRestrictionFailed: 72
	k_EResultAccountLockedDown: 73
	k_EResultAccountLogonDeniedVerifiedEmailRequired: 74
	k_EResultNoMatchingURL: 75
	k_EResultBadResponse: 76                ; parse failure, missing field, etc.
	k_EResultRequirePasswordReEntry: 77     ; The user cannot complete the action until they re-enter their password
	k_EResultValueOutOfRange: 78            ; the value entered is outside the acceptable range
	k_EResultUnexpectedError: 79            ; something happened that we didn't expect to ever happen
	k_EResultDisabled: 80                   ; The requested service has been configured to be unavailable
	k_EResultInvalidCEGSubmission: 81       ; The set of files submitted to the CEG server are not valid !
	k_EResultRestrictedDevice: 82           ; The device being used is not allowed to perform this action
	k_EResultRegionLocked: 83               ; The action could not be complete because it is region restricted
	k_EResultRateLimitExceeded: 84          ; Temporary rate limit exceeded, try again later, different from k_EResultLimitExceeded which may be permanent
	k_EResultAccountLoginDeniedNeedTwoFactor: 85 ; Need two-factor code to login
	k_EResultItemDeleted: 86                ; The thing we're trying to access has been deleted
	k_EResultAccountLoginDeniedThrottle: 87 ; login attempt failed, try to throttle response to possible attacker
	k_EResultTwoFactorCodeMismatch: 88      ; two factor code mismatch
	k_EResultTwoFactorActivationCodeMismatch: 89 ; activation code for two-factor didn't match
	k_EResultAccountAssociatedToMultiplePartners: 90 ; account has been associated with multiple partners
	k_EResultNotModified: 91                ; data not modified
	k_EResultNoMobileDevice: 92             ; the account does not have a mobile device associated with it
	k_EResultTimeNotSynced: 93              ; the time presented is out of range or tolerance
	k_EResultSmsCodeFailed: 94              ; SMS code failure (no match, none pending, etc.)
	k_EResultAccountLimitExceeded: 95       ; Too many accounts access this resource
	k_EResultAccountActivityLimitExceeded: 96 ; Too many changes to this account
	k_EResultPhoneActivityLimitExceeded: 97 ; Too many changes to this phone
	k_EResultRefundToWallet: 98             ; Cannot refund to payment method, must use wallet
	k_EResultEmailSendFailure: 99           ; Cannot send an email
	k_EResultNotSettled: 100                ; Can't perform operation till payment has settled
	k_EResultNeedCaptcha: 101               ; Needs to provide a valid captcha
	k_EResultGSLTDenied: 102                ; a game server login token owned by this token's owner has been banned
	k_EResultGSOwnerDenied: 103             ; game server owner is denied for other reason (account lock, community ban, vac ban, missing phone)
	k_EResultInvalidItemType: 104           ; the type of thing we were requested to act on is invalid
	k_EResultIPBanned: 105                  ; the ip address has been banned from taking this action
	k_EResultGSLTExpired: 106               ; this token has expired from disuse; can be reset for use
]

;- Error codes for use with the voice functions
#enum EVoiceResult! [
	k_EVoiceResultOK: 0
	k_EVoiceResultNotInitialized: 1
	k_EVoiceResultNotRecording: 2
	k_EVoiceResultNoData: 3
	k_EVoiceResultBufferTooSmall: 4
	k_EVoiceResultDataCorrupted: 5
	k_EVoiceResultRestricted: 6
	k_EVoiceResultUnsupportedCodec: 7
	k_EVoiceResultReceiverOutOfDate: 8
	k_EVoiceResultReceiverDidNotAnswer: 9
]

;- Result codes to GSHandleClientDeny/Kick
#enum EDenyReason! [
	k_EDenyInvalid: 0
	k_EDenyInvalidVersion: 1
	k_EDenyGeneric: 2
	k_EDenyNotLoggedOn: 3
	k_EDenyNoLicense: 4
	k_EDenyCheater: 5
	k_EDenyLoggedInElseWhere: 6
	k_EDenyUnknownText: 7
	k_EDenyIncompatibleAnticheat: 8
	k_EDenyMemoryCorruption: 9
	k_EDenyIncompatibleSoftware: 10
	k_EDenySteamConnectionLost: 11
	k_EDenySteamConnectionError: 12
	k_EDenySteamResponseTimedOut: 13
	k_EDenySteamValidationStalled: 14
	k_EDenySteamOwnerLeftGuestUser: 15
]

;- return type of GetAuthSessionTicket
#define HAuthTicket! integer!


;- results from BeginAuthSession
#enum EBeginAuthSessionResult! [
	k_EBeginAuthSessionResultOK: 0                  ; Ticket is valid for this game and this steamID.
	k_EBeginAuthSessionResultInvalidTicket: 1       ; Ticket is not valid.
	k_EBeginAuthSessionResultDuplicateRequest: 2    ; A ticket has already been submitted for this steamID
	k_EBeginAuthSessionResultInvalidVersion: 3      ; Ticket is from an incompatible interface version
	k_EBeginAuthSessionResultGameMismatch: 4        ; Ticket is not for this game
	k_EBeginAuthSessionResultExpiredTicket: 5       ; Ticket has expired
]

;- Callback values for callback ValidateAuthTicketResponse_t which is a response to BeginAuthSession
#enum EAuthSessionResponse! [
	k_EAuthSessionResponseOK: 0                         ; Steam has verified the user is online, the ticket is valid and ticket has not been reused.
	k_EAuthSessionResponseUserNotConnectedToSteam: 1    ; The user in question is not connected to steam
	k_EAuthSessionResponseNoLicenseOrExpired: 2         ; The license has expired.
	k_EAuthSessionResponseVACBanned: 3                  ; The user is VAC banned for this game.
	k_EAuthSessionResponseLoggedInElseWhere: 4          ; The user account has logged in elsewhere and the session containing the game instance has been disconnected.
	k_EAuthSessionResponseVACCheckTimedOut: 5           ; VAC has been unable to perform anti-cheat checks on this user
	k_EAuthSessionResponseAuthTicketCanceled: 6         ; The ticket has been canceled by the issuer
	k_EAuthSessionResponseAuthTicketInvalidAlreadyUsed: 7 ; This ticket has already been used, it is not valid.
	k_EAuthSessionResponseAuthTicketInvalid: 8          ; This ticket is not from a user instance currently connected to steam.
	k_EAuthSessionResponsePublisherIssuedBan: 9         ; The user is banned for this game. The ban came via the web api and not VAC
]

;- results from UserHasLicenseForApp
#enum EUserHasLicenseForAppResult! [
	k_EUserHasLicenseResultHasLicense: 0                ; User has a license for specified app
	k_EUserHasLicenseResultDoesNotHaveLicense: 1        ; User does not have a license for the specified app
	k_EUserHasLicenseResultNoAuth: 2                    ; User has not been authenticated
]

;- Steam account types
#enum EAccountType! [
	k_EAccountTypeInvalid: 0        
	k_EAccountTypeIndividual: 1     ; single user account
	k_EAccountTypeMultiseat: 2      ; multiseat (e.g. cybercafe) account
	k_EAccountTypeGameServer: 3     ; game server account
	k_EAccountTypeAnonGameServer: 4 ; anonymous game server account
	k_EAccountTypePending: 5        ; pending
	k_EAccountTypeContentServer: 6  ; content server
	k_EAccountTypeClan: 7
	k_EAccountTypeChat: 8
	k_EAccountTypeConsoleUser: 9    ; Fake SteamID for local PSN account on PS3 or Live account on 360, etc.
	k_EAccountTypeAnonUser: 10
	; Max of 16 items in this field
	k_EAccountTypeMax
]

#enum EAppReleaseState! [
	k_EAppReleaseState_Unknown:         0 ; unknown, required appinfo or license info is missing
	k_EAppReleaseState_Unavailable:     1 ; even if user 'just' owns it, can see game at all
	k_EAppReleaseState_Prerelease:      2 ; can be purchased and is visible in games list, nothing else. Common appInfo section released
	k_EAppReleaseState_PreloadOnly:     3 ; owners can preload app, not play it. AppInfo fully released.
	k_EAppReleaseState_Released:        4 ; owners can download and play app.
]

#enum EAppOwnershipFlags! [
	k_EAppOwnershipFlags_None:              0000h ; unknown
	k_EAppOwnershipFlags_OwnsLicense:       0001h ; owns license for this game
	k_EAppOwnershipFlags_FreeLicense:       0002h ; not paid for game
	k_EAppOwnershipFlags_RegionRestricted:  0004h ; owns app, but not allowed to play in current region
	k_EAppOwnershipFlags_LowViolence:       0008h ; only low violence version
	k_EAppOwnershipFlags_InvalidPlatform:   0010h ; app not supported on current platform
	k_EAppOwnershipFlags_SharedLicense:     0020h ; license was granted by authorized local device
	k_EAppOwnershipFlags_FreeWeekend:       0040h ; owned by a free weekend licenses
	k_EAppOwnershipFlags_RetailLicense:     0080h ; has a retail license for game, (CD-Key etc)
	k_EAppOwnershipFlags_LicenseLocked:     0100h ; shared license is locked (in use) by other user
	k_EAppOwnershipFlags_LicensePending:    0200h ; owns app, but transaction is still pending. Can't install or play
	k_EAppOwnershipFlags_LicenseExpired:    0400h ; doesn't own app anymore since license expired
	k_EAppOwnershipFlags_LicensePermanent:  0800h ; permanent license, not borrowed, or guest or freeweekend etc
	k_EAppOwnershipFlags_LicenseRecurring:  1000h ; Recurring license, user is charged periodically
	k_EAppOwnershipFlags_LicenseCanceled:   2000h ; Mark as canceled, but might be still active if recurring
	k_EAppOwnershipFlags_AutoGrant:         4000h ; Ownership is based on any kind of autogrant license
	k_EAppOwnershipFlags_PendingGift:       8000h ; user has pending gift to redeem
	k_EAppOwnershipFlags_RentalNotActivated: 00010000h ; Rental hasn't been activated yet
	k_EAppOwnershipFlags_Rental:             00020000h ; Is a rental
]

#enum EAppType! [
	k_EAppType_Invalid:             0000h ; unknown / invalid
	k_EAppType_Game:                0001h ; playable game, default type
	k_EAppType_Application:         0002h ; software application
	k_EAppType_Tool:                0004h ; SDKs, editors & dedicated servers
	k_EAppType_Demo:                0008h ; game demo
	k_EAppType_Media_DEPRECATED:    0010h ; legacy - was used for game trailers, which are now just videos on the web
	k_EAppType_DLC:                 0020h ; down loadable content
	k_EAppType_Guide:               0040h ; game guide, PDF etc
	k_EAppType_Driver:              0080h ; hardware driver updater (ATI, Razor etc)
	k_EAppType_Config:              0100h ; hidden app used to config Steam features (backpack, sales, etc)
	k_EAppType_Hardware:            0200h ; a hardware device (Steam Machine, Steam Controller, Steam Link, etc.)
	k_EAppType_Franchise:           0400h ; A hub for collections of multiple apps, eg films, series, games
	k_EAppType_Video:               0800h ; A video component of either a Film or TVSeries (may be the feature, an episode, preview, making-of, etc)
	k_EAppType_Plugin:              1000h ; Plug-in types for other Apps
	k_EAppType_Music:               2000h ; Music files
	k_EAppType_Series:              4000h ; Container app for video series
		
	k_EAppType_Shortcut:            40000000h ; just a shortcut, client side only
	k_EAppType_DepotOnly:           80000000h ; placeholder since depots and apps share the same namespace
]

#enum ESteamUserStatType! [
	k_ESteamUserStatTypeINVALID: 0
	k_ESteamUserStatTypeINT: 1
	k_ESteamUserStatTypeFLOAT: 2
	; Read as FLOAT, set with count / session length
	k_ESteamUserStatTypeAVGRATE: 3
	k_ESteamUserStatTypeACHIEVEMENTS: 4
	k_ESteamUserStatTypeGROUPACHIEVEMENTS: 5

	; max, for sanity checks
	k_ESteamUserStatTypeMAX
]

#enum EChatEntryType! [
	k_EChatEntryTypeInvalid: 0
	k_EChatEntryTypeChatMsg: 1      ; Normal text message from another user
	k_EChatEntryTypeTyping: 2       ; Another user is typing (not used in multi-user chat)
	k_EChatEntryTypeInviteGame: 3   ; Invite from other user into that users current game
	k_EChatEntryTypeEmote: 4        ; text emote message (deprecated, should be treated as ChatMsg)
	;k_EChatEntryTypeLobbyGameStart: 5 ; lobby game is starting (dead - listen for LobbyGameCreated_t callback instead)
	k_EChatEntryTypeLeftConversation: 6 ; user has left the conversation ( closed chat window )
	; Above are previous FriendMsgType entries, now merged into more generic chat entry types
	k_EChatEntryTypeEntered: 7      ; user has entered the conversation (used in multi-user chat and group chat)
	k_EChatEntryTypeWasKicked: 8    ; user was kicked (data: 64-bit steamid of actor performing the kick)
	k_EChatEntryTypeWasBanned: 9    ; user was banned (data: 64-bit steamid of actor performing the ban)
	k_EChatEntryTypeDisconnected: 10 ; user disconnected
	k_EChatEntryTypeHistoricalChat: 11 ; a chat message from user's chat history or offilne message
	;k_EChatEntryTypeReserved1: 12  ; No longer used
	;k_EChatEntryTypeReserved2: 13  ; No longer used
	k_EChatEntryTypeLinkBlocked: 14 ; a link was removed by the chat filter.
]

#enum EChatRoomEnterResponse! [
	k_EChatRoomEnterResponseSuccess: 1      ; Success
	k_EChatRoomEnterResponseDoesntExist: 2  ; Chat doesn't exist (probably closed)
	k_EChatRoomEnterResponseNotAllowed: 3   ; General Denied - You don't have the permissions needed to join the chat
	k_EChatRoomEnterResponseFull: 4         ; Chat room has reached its maximum size
	k_EChatRoomEnterResponseError: 5        ; Unexpected Error
	k_EChatRoomEnterResponseBanned: 6       ; You are banned from this chat room and may not join
	k_EChatRoomEnterResponseLimited: 7      ; Joining this chat is not allowed because you are a limited user (no value on account)
	k_EChatRoomEnterResponseClanDisabled: 8 ; Attempt to join a clan chat when the clan is locked or disabled
	k_EChatRoomEnterResponseCommunityBan: 9 ; Attempt to join a chat when the user has a community lock on their account
	k_EChatRoomEnterResponseMemberBlockedYou: 10 ; Join failed - some member in the chat has blocked you from joining
	k_EChatRoomEnterResponseYouBlockedMember: 11 ; Join failed - you have blocked some member already in the chat
	; k_EChatRoomEnterResponseNoRankingDataLobby: 12,  ; No longer used
	; k_EChatRoomEnterResponseNoRankingDataUser: 13,  ;  No longer used
	; k_EChatRoomEnterResponseRankOutOfRange: 14, ;  No longer used
]

#define k_unSteamAccountIDMask        FFFFFFFFh
#define k_unSteamAccountInstanceMask  000FFFFFh
; we allow 3 simultaneous user account instances right now, 1= desktop, 2: console, 4: web, 0: all
#define k_unSteamUserDesktopInstance    1    
#define k_unSteamUserConsoleInstance    2
#define k_unSteamUserWebInstance        4

; Special flags for Chat accounts - they go in the top 8 bits
; of the steam ID's "instance", leaving 12 for the actual instances
#enum EChatSteamIDInstanceFlags! [
	k_EChatAccountInstanceMask: 00000FFFh ;top 8 bits are flags
	k_EChatInstanceFlagClan:     524288 ;( k_unSteamAccountInstanceMask + 1 ) >> 1 ; top bit
	k_EChatInstanceFlagLobby:    262144 ;( k_unSteamAccountInstanceMask + 1 ) >> 2 ; next one down, etc
	k_EChatInstanceFlagMMSLobby: 131072 ;( k_unSteamAccountInstanceMask + 1 ) >> 3 ; next one down, etc
	; Max of 8 flags
]

; Purpose: Marketing message flags that change how a client should handle them
#enum EMarketingMessageFlags! [
	k_EMarketingMessageFlagsNone: 0
	k_EMarketingMessageFlagsHighPriority: 1
	k_EMarketingMessageFlagsPlatformWindows: 2
	k_EMarketingMessageFlagsPlatformMac: 4
	k_EMarketingMessageFlagsPlatformLinux: 8

	;aggregate flags
	k_EMarketingMessageFlagsPlatformRestrictions: 15
]

; Purpose: Possible positions to tell the overlay to show notifications in
#enum ENotificationPosition! [
	k_EPositionTopLeft
	k_EPositionTopRight
	k_EPositionBottomLeft
	k_EPositionBottomRight
]

; Purpose: Broadcast upload result details
#enum EBroadcastUploadResult! [
	k_EBroadcastUploadResultNone: 0               ; broadcast state unknown
	k_EBroadcastUploadResultOK: 1                 ; broadcast was good, no problems
	k_EBroadcastUploadResultInitFailed: 2         ; broadcast init failed
	k_EBroadcastUploadResultFrameFailed: 3        ; broadcast frame upload failed
	k_EBroadcastUploadResultTimeout: 4            ; broadcast upload timed out
	k_EBroadcastUploadResultBandwidthExceeded: 5  ; broadcast send too much data
	k_EBroadcastUploadResultLowFPS: 6             ; broadcast FPS too low
	k_EBroadcastUploadResultMissingKeyFrames: 7   ; broadcast sending not enough key frames
	k_EBroadcastUploadResultNoConnection: 8       ; broadcast client failed to connect to relay
	k_EBroadcastUploadResultRelayFailed: 9        ; relay dropped the upload
	k_EBroadcastUploadResultSettingsChanged: 10   ; the client changed broadcast settings 
	k_EBroadcastUploadResultMissingAudio: 11      ; client failed to send audio data
	k_EBroadcastUploadResultTooFarBehind: 12      ; clients was too slow uploading
	k_EBroadcastUploadResultTranscodeBehind: 13   ; server failed to keep up with transcode
]

; Purpose: codes for well defined launch options
#enum ELaunchOptionType! [
	k_ELaunchOptionType_None: 0        ; unknown what launch option does
	k_ELaunchOptionType_Default        ; runs the game, app, whatever in default mode
	k_ELaunchOptionType_SafeMode       ; runs the game in safe mode
	k_ELaunchOptionType_Multiplayer    ; runs the game in multiplayer mode
	k_ELaunchOptionType_Config         ; runs config tool for this game
	k_ELaunchOptionType_OpenVR         ; runs game in VR mode using OpenVR
	k_ELaunchOptionType_Server         ; runs dedicated server for this game
	k_ELaunchOptionType_Editor         ; runs game editor
	k_ELaunchOptionType_Manual         ; shows game manual
	k_ELaunchOptionType_Benchmark      ; runs game benchmark
	k_ELaunchOptionType_Option1        ; generic run option, uses description field for game name
	k_ELaunchOptionType_Option2        ; generic run option, uses description field for game name
	k_ELaunchOptionType_Option3        ; generic run option, uses description field for game name
	k_ELaunchOptionType_OculusVR       ; runs game in VR mode using the Oculus SDK 
	k_ELaunchOptionType_OpenVROverlay  ; runs an OpenVR dashboard overlay
	k_ELaunchOptionType_OSVR           ; runs game in VR mode using the OSVR SDK

	k_ELaunchOptionType_Dialog:   1000 ; show launch options dialog
]

; Purpose: true if this launch option is any of the vr launching types
#define BIsVRLaunchOptionType(eType) [
	any [
		eType = k_ELaunchOptionType_OpenVR 
		eType = k_ELaunchOptionType_OpenVROverlay 
		eType = k_ELaunchOptionType_OculusVR
		eType = k_ELaunchOptionType_OSVR
	]
]

; Purpose: code points for VR HMD vendors and models 
; WARNING: DO NOT RENUMBER EXISTING VALUES - STORED IN A DATABASE
#enum EVRHMDType! [
	k_eEVRHMDType_None: -1       ; unknown vendor and model
	k_eEVRHMDType_Unknown: 0     ; unknown vendor and model
	k_eEVRHMDType_HTC_Dev: 1     ; original HTC dev kits
	k_eEVRHMDType_HTC_VivePre: 2 ; htc vive pre
	k_eEVRHMDType_HTC_Vive: 3    ; htc vive consumer release

	k_eEVRHMDType_HTC_Unknown: 20 ; unknown htc hmd

	k_eEVRHMDType_Oculus_DK1: 21  ; Oculus DK1 
	k_eEVRHMDType_Oculus_DK2: 22  ; Oculus DK2
	k_eEVRHMDType_Oculus_Rift: 23 ; Oculus rift

	k_eEVRHMDType_Oculus_Unknown: 40 ; Oculus unknown HMD
]

; Purpose: true if this is from an Oculus HMD
#define BIsOculusHMD(eType) [
	any [
		eType = k_eEVRHMDType_Oculus_DK1
		eType = k_eEVRHMDType_Oculus_DK2
		eType = k_eEVRHMDType_Oculus_Rift
		eType = k_eEVRHMDType_Oculus_Unknown
	]
]

; Purpose: true if this is from an Vive HMD
#define BIsViveHMD( eType ) [
	any [
		eType = k_eEVRHMDType_HTC_Dev
		eType = k_eEVRHMDType_HTC_VivePre
		eType = k_eEVRHMDType_HTC_Vive
		eType = k_eEVRHMDType_HTC_Unknown
	]
]


;-- Steam universes.  Each universe is a self-contained Steam instance.
#enum EUniverse! [
	k_EUniverseInvalid: 0
	k_EUniversePublic: 1
	k_EUniverseBeta: 2
	k_EUniverseInternal: 3
	k_EUniverseDev: 4
	;k_EUniverseRC: 5	; no such universe anymore
	k_EUniverseMax
]

#enum EMatchMakingServerResponse! [
	eServerResponded:  0
	eServerFailedToRespond
	eNoServersListedOnMasterServer ;for the Internet query type, returned in response callback if no servers of this type match
]