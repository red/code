Red/System [
	Title:   "Red/System SteamInventory API binding"
	Author:  "Oldes"
	File: 	 %Steam-Inventory.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamInventory: declare ISteamInventory!

#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamInventory_GetResultStatus: "SteamAPI_ISteamInventory_GetResultStatus" [
			instancePtr  [ISteamInventory!]    ;intptr_t
			resultHandle [integer!]            ;SteamInventoryResult_t
			return: [EResult!]
		]
		SteamAPI_ISteamInventory_GetResultItems: "SteamAPI_ISteamInventory_GetResultItems" [
			instancePtr         [ISteamInventory!];intptr_t
			resultHandle        [integer!]     ;SteamInventoryResult_t
			pOutItemsArray      [int-ptr!]     ;struct SteamItemDetails_t *
			punOutItemsArraySize[int-ptr!]     ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamInventory_GetResultTimestamp: "SteamAPI_ISteamInventory_GetResultTimestamp" [
			instancePtr  [ISteamInventory!]    ;intptr_t
			resultHandle [integer!]            ;SteamInventoryResult_t
			return: [integer!]
		]
		SteamAPI_ISteamInventory_CheckResultSteamID: "SteamAPI_ISteamInventory_CheckResultSteamID" [
			instancePtr     [ISteamInventory!] ;intptr_t
			resultHandle    [integer!]         ;SteamInventoryResult_t
			steamIDExpected [CSteamID!]        ;class CSteamID
			return: [logic!]
		]
		SteamAPI_ISteamInventory_DestroyResult: "SteamAPI_ISteamInventory_DestroyResult" [
			instancePtr  [ISteamInventory!]    ;intptr_t
			resultHandle [integer!]            ;SteamInventoryResult_t
		]
		SteamAPI_ISteamInventory_GetAllItems: "SteamAPI_ISteamInventory_GetAllItems" [
			instancePtr   [ISteamInventory!]   ;intptr_t
			pResultHandle [int-ptr!]           ;SteamInventoryResult_t *
			return: [logic!]
		]
		SteamAPI_ISteamInventory_GetItemsByID: "SteamAPI_ISteamInventory_GetItemsByID" [
			instancePtr        [ISteamInventory!];intptr_t
			pResultHandle      [int-ptr!]      ;SteamInventoryResult_t *
			pInstanceIDs       [uint64-ref!]   ;const SteamItemInstanceID_t *
			unCountInstanceIDs [integer!]      ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamInventory_SerializeResult: "SteamAPI_ISteamInventory_SerializeResult" [
			instancePtr      [ISteamInventory!];intptr_t
			resultHandle     [integer!]        ;SteamInventoryResult_t
			pOutBuffer       [byte-ptr!]       ;void *
			punOutBufferSize [int-ptr!]        ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamInventory_DeserializeResult: "SteamAPI_ISteamInventory_DeserializeResult" [
			instancePtr         [ISteamInventory!];intptr_t
			pOutResultHandle    [int-ptr!]     ;SteamInventoryResult_t *
			pBuffer             [byte-ptr!]    ;const void *
			unBufferSize        [integer!]     ;uint32
			bRESERVED_MUST_BE_FALSE[logic!]    ;bool
			return: [logic!]
		]
		SteamAPI_ISteamInventory_GenerateItems: "SteamAPI_ISteamInventory_GenerateItems" [
			instancePtr      [ISteamInventory!];intptr_t
			pResultHandle    [int-ptr!]        ;SteamInventoryResult_t *
			pArrayItemDefs   [int-ptr!]        ;const SteamItemDef_t *
			punArrayQuantity [int-ptr!]        ;const uint32 *
			unArrayLength    [integer!]        ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamInventory_GrantPromoItems: "SteamAPI_ISteamInventory_GrantPromoItems" [
			instancePtr   [ISteamInventory!]   ;intptr_t
			pResultHandle [int-ptr!]           ;SteamInventoryResult_t *
			return: [logic!]
		]
		SteamAPI_ISteamInventory_AddPromoItem: "SteamAPI_ISteamInventory_AddPromoItem" [
			instancePtr   [ISteamInventory!]   ;intptr_t
			pResultHandle [int-ptr!]           ;SteamInventoryResult_t *
			itemDef       [integer!]           ;SteamItemDef_t
			return: [logic!]
		]
		SteamAPI_ISteamInventory_AddPromoItems: "SteamAPI_ISteamInventory_AddPromoItems" [
			instancePtr    [ISteamInventory!]  ;intptr_t
			pResultHandle  [int-ptr!]          ;SteamInventoryResult_t *
			pArrayItemDefs [int-ptr!]          ;const SteamItemDef_t *
			unArrayLength  [integer!]          ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamInventory_ConsumeItem: "SteamAPI_ISteamInventory_ConsumeItem" [
			instancePtr   [ISteamInventory!]   ;intptr_t
			pResultHandle [int-ptr!]           ;SteamInventoryResult_t *
			itemConsume   [uint64! value]      ;SteamItemInstanceID_t
			unQuantity    [integer!]           ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamInventory_ExchangeItems: "SteamAPI_ISteamInventory_ExchangeItems" [
			instancePtr         [ISteamInventory!];intptr_t
			pResultHandle       [int-ptr!]     ;SteamInventoryResult_t *
			pArrayGenerate      [int-ptr!]     ;const SteamItemDef_t *
			punArrayGenerateQuantity[int-ptr!] ;const uint32 *
			unArrayGenerateLength[integer!]    ;uint32
			pArrayDestroy       [uint64-ref!]  ;const SteamItemInstanceID_t *
			punArrayDestroyQuantity[int-ptr!]  ;const uint32 *
			unArrayDestroyLength[integer!]     ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamInventory_TransferItemQuantity: "SteamAPI_ISteamInventory_TransferItemQuantity" [
			instancePtr   [ISteamInventory!]   ;intptr_t
			pResultHandle [int-ptr!]           ;SteamInventoryResult_t *
			itemIdSource  [uint64! value]      ;SteamItemInstanceID_t
			unQuantity    [integer!]           ;uint32
			itemIdDest    [uint64! value]      ;SteamItemInstanceID_t
			return: [logic!]
		]
		SteamAPI_ISteamInventory_SendItemDropHeartbeat: "SteamAPI_ISteamInventory_SendItemDropHeartbeat" [
			instancePtr [ISteamInventory!]     ;intptr_t
		]
		SteamAPI_ISteamInventory_TriggerItemDrop: "SteamAPI_ISteamInventory_TriggerItemDrop" [
			instancePtr        [ISteamInventory!];intptr_t
			pResultHandle      [int-ptr!]      ;SteamInventoryResult_t *
			dropListDefinition [integer!]      ;SteamItemDef_t
			return: [logic!]
		]
		SteamAPI_ISteamInventory_TradeItems: "SteamAPI_ISteamInventory_TradeItems" [
			instancePtr         [ISteamInventory!];intptr_t
			pResultHandle       [int-ptr!]     ;SteamInventoryResult_t *
			steamIDTradePartner [CSteamID!]    ;class CSteamID
			pArrayGive          [uint64-ref!]  ;const SteamItemInstanceID_t *
			pArrayGiveQuantity  [int-ptr!]     ;const uint32 *
			nArrayGiveLength    [integer!]     ;uint32
			pArrayGet           [uint64-ref!]  ;const SteamItemInstanceID_t *
			pArrayGetQuantity   [int-ptr!]     ;const uint32 *
			nArrayGetLength     [integer!]     ;uint32
			return: [logic!]
		]
		SteamAPI_ISteamInventory_LoadItemDefinitions: "SteamAPI_ISteamInventory_LoadItemDefinitions" [
			instancePtr [ISteamInventory!]     ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamInventory_GetItemDefinitionIDs: "SteamAPI_ISteamInventory_GetItemDefinitionIDs" [
			instancePtr         [ISteamInventory!];intptr_t
			pItemDefIDs         [int-ptr!]     ;SteamItemDef_t *
			punItemDefIDsArraySize[int-ptr!]   ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamInventory_GetItemDefinitionProperty: "SteamAPI_ISteamInventory_GetItemDefinitionProperty" [
			instancePtr         [ISteamInventory!];intptr_t
			iDefinition         [integer!]     ;SteamItemDef_t
			pchPropertyName     [c-string!]    ;const char *
			pchValueBuffer      [c-string!]    ;char *
			punValueBufferSizeOut[int-ptr!]    ;uint32 *
			return: [logic!]
		]
		SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs: {SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs} [
			instancePtr [ISteamInventory!]     ;intptr_t
			steamID     [CSteamID!]            ;class CSteamID
			return: [uint64! value]
		]
		SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs: {SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs} [
			instancePtr         [ISteamInventory!];intptr_t
			steamID             [CSteamID!]    ;class CSteamID
			pItemDefIDs         [int-ptr!]     ;SteamItemDef_t *
			punItemDefIDsArraySize[int-ptr!]   ;uint32 *
			return: [logic!]
		]
	]
]

