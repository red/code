Red/System [
	Title:   "Red/System SteamMusic API binding"
	Author:  "Oldes"
	File: 	 %Steam-HTTP.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;github.com/red/red/blob/master/BSD-3-License.txt"
	
]

ISteamHTTP: declare ISteamHTTP!

; This enum is used in client API methods, do not re-number existing values.
#enum EHTTPMethod! [
	k_EHTTPMethodInvalid: 0
	k_EHTTPMethodGET
	k_EHTTPMethodHEAD
	k_EHTTPMethodPOST
	k_EHTTPMethodPUT
	k_EHTTPMethodDELETE
	k_EHTTPMethodOPTIONS
	k_EHTTPMethodPATCH

	; The remaining HTTP methods are not yet supported, per rfc2616 section 5.1.1 only GET and HEAD are required for 
	; a compliant general purpose server.  We'll likely add more as we find uses for them.

	; k_EHTTPMethodTRACE,
	; k_EHTTPMethodCONNECT
]


; HTTP Status codes that the server can send in response to a request, see rfc2616 section 10.3 for descriptions
; of each of these.
#enum EHTTPStatusCode! [
	; Invalid status code (this isn't defined in HTTP, used to indicate unset in our code)
	k_EHTTPStatusCodeInvalid:					0

	; Informational codes
	k_EHTTPStatusCode100Continue:				100
	k_EHTTPStatusCode101SwitchingProtocols:	    101

	; Success codes
	k_EHTTPStatusCode200OK:					    200
	k_EHTTPStatusCode201Created:				201
	k_EHTTPStatusCode202Accepted:				202
	k_EHTTPStatusCode203NonAuthoritative:		203
	k_EHTTPStatusCode204NoContent:				204
	k_EHTTPStatusCode205ResetContent:			205
	k_EHTTPStatusCode206PartialContent:		    206

	; Redirection codes
	k_EHTTPStatusCode300MultipleChoices:		300
	k_EHTTPStatusCode301MovedPermanently:		301
	k_EHTTPStatusCode302Found:					302
	k_EHTTPStatusCode303SeeOther:				303
	k_EHTTPStatusCode304NotModified:			304
	k_EHTTPStatusCode305UseProxy:				305
	;k_EHTTPStatusCode306Unused:				306 ;(used in old HTTP spec, now unused in 1.1)
	k_EHTTPStatusCode307TemporaryRedirect:		307

	; Error codes
	k_EHTTPStatusCode400BadRequest:			    400
	k_EHTTPStatusCode401Unauthorized:			401 ; You probably want 403 or something else. 401 implies you're sending a WWW-Authenticate header and the client can sent an Authorization header in response.
	k_EHTTPStatusCode402PaymentRequired:		402 ; This is reserved for future HTTP specs, not really supported by clients
	k_EHTTPStatusCode403Forbidden:				403
	k_EHTTPStatusCode404NotFound:				404
	k_EHTTPStatusCode405MethodNotAllowed:		405
	k_EHTTPStatusCode406NotAcceptable:			406
	k_EHTTPStatusCode407ProxyAuthRequired:		407
	k_EHTTPStatusCode408RequestTimeout:		    408
	k_EHTTPStatusCode409Conflict:				409
	k_EHTTPStatusCode410Gone:					410
	k_EHTTPStatusCode411LengthRequired:		    411
	k_EHTTPStatusCode412PreconditionFailed:	    412
	k_EHTTPStatusCode413RequestEntityTooLarge:	413
	k_EHTTPStatusCode414RequestURITooLong:		414
	k_EHTTPStatusCode415UnsupportedMediaType:	415
	k_EHTTPStatusCode416RequestedRangeNotSatisfiable: 416
	k_EHTTPStatusCode417ExpectationFailed:		417
	k_EHTTPStatusCode4xxUnknown: 				418 ; 418 is reserved, so we'll use it to mean unknown
	k_EHTTPStatusCode429TooManyRequests:		429

	; Server error codes
	k_EHTTPStatusCode500InternalServerError:	500
	k_EHTTPStatusCode501NotImplemented:		    501
	k_EHTTPStatusCode502BadGateway:			    502
	k_EHTTPStatusCode503ServiceUnavailable:	    503
	k_EHTTPStatusCode504GatewayTimeout:		    504
	k_EHTTPStatusCode505HTTPVersionNotSupported: 505
	k_EHTTPStatusCode5xxUnknown:				599
]


#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamHTTP_CreateHTTPRequest: "SteamAPI_ISteamHTTP_CreateHTTPRequest" [
			instancePtr        [ISteamHTTP!]   ;intptr_t
			eHTTPRequestMethod [EHTTPMethod!]  ;EHTTPMethod
			pchAbsoluteURL     [c-string!]     ;const char *
			return: [integer!]
		]
		SteamAPI_ISteamHTTP_SetHTTPRequestContextValue: "SteamAPI_ISteamHTTP_SetHTTPRequestContextValue" [
			instancePtr    [ISteamHTTP!]       ;intptr_t
			hRequest       [integer!]          ;HTTPRequestHandle
			ulContextValue [uint64! value]     ;uint64
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout: {SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout} [
			instancePtr      [ISteamHTTP!]     ;intptr_t
			hRequest         [integer!]        ;HTTPRequestHandle
			unTimeoutSeconds [integer!]        ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue: "SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue" [
			instancePtr    [ISteamHTTP!]       ;intptr_t
			hRequest       [integer!]          ;HTTPRequestHandle
			pchHeaderName  [c-string!]         ;const char *
			pchHeaderValue [c-string!]         ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter: {SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter} [
			instancePtr   [ISteamHTTP!]        ;intptr_t
			hRequest      [integer!]           ;HTTPRequestHandle
			pchParamName  [c-string!]          ;const char *
			pchParamValue [c-string!]          ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SendHTTPRequest: "SteamAPI_ISteamHTTP_SendHTTPRequest" [
			instancePtr [ISteamHTTP!]          ;intptr_t
			hRequest    [integer!]             ;HTTPRequestHandle
			pCallHandle [uint64-ref!]          ;SteamAPICall_t *
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse: {SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse} [
			instancePtr [ISteamHTTP!]          ;intptr_t
			hRequest    [integer!]             ;HTTPRequestHandle
			pCallHandle [uint64-ref!]          ;SteamAPICall_t *
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_DeferHTTPRequest: "SteamAPI_ISteamHTTP_DeferHTTPRequest" [
			instancePtr [ISteamHTTP!]          ;intptr_t
			hRequest    [integer!]             ;HTTPRequestHandle
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_PrioritizeHTTPRequest: "SteamAPI_ISteamHTTP_PrioritizeHTTPRequest" [
			instancePtr [ISteamHTTP!]          ;intptr_t
			hRequest    [integer!]             ;HTTPRequestHandle
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize: "SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize" [
			instancePtr         [ISteamHTTP!]  ;intptr_t
			hRequest            [integer!]     ;HTTPRequestHandle
			pchHeaderName       [c-string!]    ;const char *
			unResponseHeaderSize[int-ptr!]     ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue: "SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue" [
			instancePtr        [ISteamHTTP!]   ;intptr_t
			hRequest           [integer!]      ;HTTPRequestHandle
			pchHeaderName      [c-string!]     ;const char *
			pHeaderValueBuffer [pointer! [byte!]];uint8 *
			unBufferSize       [integer!]      ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_GetHTTPResponseBodySize: "SteamAPI_ISteamHTTP_GetHTTPResponseBodySize" [
			instancePtr [ISteamHTTP!]          ;intptr_t
			hRequest    [integer!]             ;HTTPRequestHandle
			unBodySize  [int-ptr!]             ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_GetHTTPResponseBodyData: "SteamAPI_ISteamHTTP_GetHTTPResponseBodyData" [
			instancePtr     [ISteamHTTP!]      ;intptr_t
			hRequest        [integer!]         ;HTTPRequestHandle
			pBodyDataBuffer [pointer! [byte!]] ;uint8 *
			unBufferSize    [integer!]         ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData: {SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData} [
			instancePtr     [ISteamHTTP!]      ;intptr_t
			hRequest        [integer!]         ;HTTPRequestHandle
			cOffset         [integer!]         ;uint32
			pBodyDataBuffer [pointer! [byte!]] ;uint8 *
			unBufferSize    [integer!]         ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_ReleaseHTTPRequest: "SteamAPI_ISteamHTTP_ReleaseHTTPRequest" [
			instancePtr [ISteamHTTP!]          ;intptr_t
			hRequest    [integer!]             ;HTTPRequestHandle
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct: "SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct" [
			instancePtr   [ISteamHTTP!]        ;intptr_t
			hRequest      [integer!]           ;HTTPRequestHandle
			pflPercentOut [pointer! [float32!]];float *
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody: "SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody" [
			instancePtr    [ISteamHTTP!]       ;intptr_t
			hRequest       [integer!]          ;HTTPRequestHandle
			pchContentType [c-string!]         ;const char *
			pubBody        [pointer! [byte!]]  ;uint8 *
			unBodyLen      [integer!]          ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_CreateCookieContainer: "SteamAPI_ISteamHTTP_CreateCookieContainer" [
			instancePtr         [ISteamHTTP!]  ;intptr_t
			bAllowResponsesToModify[logic!]    ;bool
			return: [integer!]
		]
		SteamAPI_ISteamHTTP_ReleaseCookieContainer: "SteamAPI_ISteamHTTP_ReleaseCookieContainer" [
			instancePtr      [ISteamHTTP!]     ;intptr_t
			hCookieContainer [integer!]        ;HTTPCookieContainerHandle
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SetCookie: "SteamAPI_ISteamHTTP_SetCookie" [
			instancePtr      [ISteamHTTP!]     ;intptr_t
			hCookieContainer [integer!]        ;HTTPCookieContainerHandle
			pchHost          [c-string!]       ;const char *
			pchUrl           [c-string!]       ;const char *
			pchCookie        [c-string!]       ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer: "SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer" [
			instancePtr      [ISteamHTTP!]     ;intptr_t
			hRequest         [integer!]        ;HTTPRequestHandle
			hCookieContainer [integer!]        ;HTTPCookieContainerHandle
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo: "SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo" [
			instancePtr      [ISteamHTTP!]     ;intptr_t
			hRequest         [integer!]        ;HTTPRequestHandle
			pchUserAgentInfo [c-string!]       ;const char *
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate: {SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate} [
			instancePtr         [ISteamHTTP!]  ;intptr_t
			hRequest            [integer!]     ;HTTPRequestHandle
			bRequireVerifiedCertificate[logic!];bool
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS: {SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS} [
			instancePtr    [ISteamHTTP!]       ;intptr_t
			hRequest       [integer!]          ;HTTPRequestHandle
			unMilliseconds [integer!]          ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut: "SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut" [
			instancePtr   [ISteamHTTP!]        ;intptr_t
			hRequest      [integer!]           ;HTTPRequestHandle
			pbWasTimedOut [logic-ref!]  ;bool *
			return: [logic!]
		]
	]
]

