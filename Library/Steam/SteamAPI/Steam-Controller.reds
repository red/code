Red/System [
	Title:   "Red/System SteamController API binding"
	Author:  "Oldes"
	File: 	 %Steam-Controller.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;github.com/red/red/blob/master/BSD-3-License.txt"
]

ISteamController: declare ISteamController!

#enum ESteamControllerPad! [
	k_ESteamControllerPad_Left
	k_ESteamControllerPad_Right
]

#enum EControllerSource! [
	k_EControllerSource_None
	k_EControllerSource_LeftTrackpad
	k_EControllerSource_RightTrackpad
	k_EControllerSource_Joystick
	k_EControllerSource_ABXY
	k_EControllerSource_Switch
	k_EControllerSource_LeftTrigger
	k_EControllerSource_RightTrigger
	k_EControllerSource_Gyro
	k_EControllerSource_CenterTrackpad		;PS4
	k_EControllerSource_RightJoystick		;Traditional Controllers
	k_EControllerSource_DPad				;Traditional Controllers
	k_EControllerSource_Count
]

#enum EControllerSourceMode! [
	k_EControllerSourceMode_None
	k_EControllerSourceMode_Dpad
	k_EControllerSourceMode_Buttons
	k_EControllerSourceMode_FourButtons
	k_EControllerSourceMode_AbsoluteMouse
	k_EControllerSourceMode_RelativeMouse
	k_EControllerSourceMode_JoystickMove
	k_EControllerSourceMode_JoystickMouse
	k_EControllerSourceMode_JoystickCamera
	k_EControllerSourceMode_ScrollWheel
	k_EControllerSourceMode_Trigger
	k_EControllerSourceMode_TouchMenu
	k_EControllerSourceMode_MouseJoystick
	k_EControllerSourceMode_MouseRegion
	k_EControllerSourceMode_RadialMenu
	k_EControllerSourceMode_Switches
]

#enum EControllerActionOrigin! [
	;Steam Controller
	k_EControllerActionOrigin_None
	k_EControllerActionOrigin_A
	k_EControllerActionOrigin_B
	k_EControllerActionOrigin_X
	k_EControllerActionOrigin_Y
	k_EControllerActionOrigin_LeftBumper
	k_EControllerActionOrigin_RightBumper
	k_EControllerActionOrigin_LeftGrip
	k_EControllerActionOrigin_RightGrip
	k_EControllerActionOrigin_Start
	k_EControllerActionOrigin_Back
	k_EControllerActionOrigin_LeftPad_Touch
	k_EControllerActionOrigin_LeftPad_Swipe
	k_EControllerActionOrigin_LeftPad_Click
	k_EControllerActionOrigin_LeftPad_DPadNorth
	k_EControllerActionOrigin_LeftPad_DPadSouth
	k_EControllerActionOrigin_LeftPad_DPadWest
	k_EControllerActionOrigin_LeftPad_DPadEast
	k_EControllerActionOrigin_RightPad_Touch
	k_EControllerActionOrigin_RightPad_Swipe
	k_EControllerActionOrigin_RightPad_Click
	k_EControllerActionOrigin_RightPad_DPadNorth
	k_EControllerActionOrigin_RightPad_DPadSouth
	k_EControllerActionOrigin_RightPad_DPadWest
	k_EControllerActionOrigin_RightPad_DPadEast
	k_EControllerActionOrigin_LeftTrigger_Pull
	k_EControllerActionOrigin_LeftTrigger_Click
	k_EControllerActionOrigin_RightTrigger_Pull
	k_EControllerActionOrigin_RightTrigger_Click
	k_EControllerActionOrigin_LeftStick_Move
	k_EControllerActionOrigin_LeftStick_Click
	k_EControllerActionOrigin_LeftStick_DPadNorth
	k_EControllerActionOrigin_LeftStick_DPadSouth
	k_EControllerActionOrigin_LeftStick_DPadWest
	k_EControllerActionOrigin_LeftStick_DPadEast
	k_EControllerActionOrigin_Gyro_Move
	k_EControllerActionOrigin_Gyro_Pitch
	k_EControllerActionOrigin_Gyro_Yaw
	k_EControllerActionOrigin_Gyro_Roll
	
	;PS4 Dual Shock
	k_EControllerActionOrigin_PS4_X
	k_EControllerActionOrigin_PS4_Circle
	k_EControllerActionOrigin_PS4_Triangle
	k_EControllerActionOrigin_PS4_Square
	k_EControllerActionOrigin_PS4_LeftBumper
	k_EControllerActionOrigin_PS4_RightBumper
	k_EControllerActionOrigin_PS4_Options  ;Start
	k_EControllerActionOrigin_PS4_Share	;Back
	k_EControllerActionOrigin_PS4_LeftPad_Touch
	k_EControllerActionOrigin_PS4_LeftPad_Swipe
	k_EControllerActionOrigin_PS4_LeftPad_Click
	k_EControllerActionOrigin_PS4_LeftPad_DPadNorth
	k_EControllerActionOrigin_PS4_LeftPad_DPadSouth
	k_EControllerActionOrigin_PS4_LeftPad_DPadWest
	k_EControllerActionOrigin_PS4_LeftPad_DPadEast
	k_EControllerActionOrigin_PS4_RightPad_Touch
	k_EControllerActionOrigin_PS4_RightPad_Swipe
	k_EControllerActionOrigin_PS4_RightPad_Click
	k_EControllerActionOrigin_PS4_RightPad_DPadNorth
	k_EControllerActionOrigin_PS4_RightPad_DPadSouth
	k_EControllerActionOrigin_PS4_RightPad_DPadWest
	k_EControllerActionOrigin_PS4_RightPad_DPadEast
	k_EControllerActionOrigin_PS4_CenterPad_Touch
	k_EControllerActionOrigin_PS4_CenterPad_Swipe
	k_EControllerActionOrigin_PS4_CenterPad_Click
	k_EControllerActionOrigin_PS4_CenterPad_DPadNorth
	k_EControllerActionOrigin_PS4_CenterPad_DPadSouth
	k_EControllerActionOrigin_PS4_CenterPad_DPadWest
	k_EControllerActionOrigin_PS4_CenterPad_DPadEast
	k_EControllerActionOrigin_PS4_LeftTrigger_Pull
	k_EControllerActionOrigin_PS4_LeftTrigger_Click
	k_EControllerActionOrigin_PS4_RightTrigger_Pull
	k_EControllerActionOrigin_PS4_RightTrigger_Click
	k_EControllerActionOrigin_PS4_LeftStick_Move
	k_EControllerActionOrigin_PS4_LeftStick_Click
	k_EControllerActionOrigin_PS4_LeftStick_DPadNorth
	k_EControllerActionOrigin_PS4_LeftStick_DPadSouth
	k_EControllerActionOrigin_PS4_LeftStick_DPadWest
	k_EControllerActionOrigin_PS4_LeftStick_DPadEast
	k_EControllerActionOrigin_PS4_RightStick_Move
	k_EControllerActionOrigin_PS4_RightStick_Click
	k_EControllerActionOrigin_PS4_RightStick_DPadNorth
	k_EControllerActionOrigin_PS4_RightStick_DPadSouth
	k_EControllerActionOrigin_PS4_RightStick_DPadWest
	k_EControllerActionOrigin_PS4_RightStick_DPadEast
	k_EControllerActionOrigin_PS4_DPad_North
	k_EControllerActionOrigin_PS4_DPad_South
	k_EControllerActionOrigin_PS4_DPad_West
	k_EControllerActionOrigin_PS4_DPad_East
	k_EControllerActionOrigin_PS4_Gyro_Move
	k_EControllerActionOrigin_PS4_Gyro_Pitch
	k_EControllerActionOrigin_PS4_Gyro_Yaw
	k_EControllerActionOrigin_PS4_Gyro_Roll

	;XBox One
	k_EControllerActionOrigin_XBoxOne_A
	k_EControllerActionOrigin_XBoxOne_B
	k_EControllerActionOrigin_XBoxOne_X
	k_EControllerActionOrigin_XBoxOne_Y
	k_EControllerActionOrigin_XBoxOne_LeftBumper
	k_EControllerActionOrigin_XBoxOne_RightBumper
	k_EControllerActionOrigin_XBoxOne_Menu  ;Start
	k_EControllerActionOrigin_XBoxOne_View  ;Back
	k_EControllerActionOrigin_XBoxOne_LeftTrigger_Pull
	k_EControllerActionOrigin_XBoxOne_LeftTrigger_Click
	k_EControllerActionOrigin_XBoxOne_RightTrigger_Pull
	k_EControllerActionOrigin_XBoxOne_RightTrigger_Click
	k_EControllerActionOrigin_XBoxOne_LeftStick_Move
	k_EControllerActionOrigin_XBoxOne_LeftStick_Click
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadNorth
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadSouth
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadWest
	k_EControllerActionOrigin_XBoxOne_LeftStick_DPadEast
	k_EControllerActionOrigin_XBoxOne_RightStick_Move
	k_EControllerActionOrigin_XBoxOne_RightStick_Click
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadNorth
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadSouth
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadWest
	k_EControllerActionOrigin_XBoxOne_RightStick_DPadEast
	k_EControllerActionOrigin_XBoxOne_DPad_North
	k_EControllerActionOrigin_XBoxOne_DPad_South
	k_EControllerActionOrigin_XBoxOne_DPad_West
	k_EControllerActionOrigin_XBoxOne_DPad_East

	;XBox 360
	k_EControllerActionOrigin_XBox360_A
	k_EControllerActionOrigin_XBox360_B
	k_EControllerActionOrigin_XBox360_X
	k_EControllerActionOrigin_XBox360_Y
	k_EControllerActionOrigin_XBox360_LeftBumper
	k_EControllerActionOrigin_XBox360_RightBumper
	k_EControllerActionOrigin_XBox360_Start  ;Start
	k_EControllerActionOrigin_XBox360_Back  ;Back
	k_EControllerActionOrigin_XBox360_LeftTrigger_Pull
	k_EControllerActionOrigin_XBox360_LeftTrigger_Click
	k_EControllerActionOrigin_XBox360_RightTrigger_Pull
	k_EControllerActionOrigin_XBox360_RightTrigger_Click
	k_EControllerActionOrigin_XBox360_LeftStick_Move
	k_EControllerActionOrigin_XBox360_LeftStick_Click
	k_EControllerActionOrigin_XBox360_LeftStick_DPadNorth
	k_EControllerActionOrigin_XBox360_LeftStick_DPadSouth
	k_EControllerActionOrigin_XBox360_LeftStick_DPadWest
	k_EControllerActionOrigin_XBox360_LeftStick_DPadEast
	k_EControllerActionOrigin_XBox360_RightStick_Move
	k_EControllerActionOrigin_XBox360_RightStick_Click
	k_EControllerActionOrigin_XBox360_RightStick_DPadNorth
	k_EControllerActionOrigin_XBox360_RightStick_DPadSouth
	k_EControllerActionOrigin_XBox360_RightStick_DPadWest
	k_EControllerActionOrigin_XBox360_RightStick_DPadEast
	k_EControllerActionOrigin_XBox360_DPad_North
	k_EControllerActionOrigin_XBox360_DPad_South
	k_EControllerActionOrigin_XBox360_DPad_West
	k_EControllerActionOrigin_XBox360_DPad_East	

	;SteamController V2
	k_EControllerActionOrigin_SteamV2_A
	k_EControllerActionOrigin_SteamV2_B
	k_EControllerActionOrigin_SteamV2_X
	k_EControllerActionOrigin_SteamV2_Y
	k_EControllerActionOrigin_SteamV2_LeftBumper
	k_EControllerActionOrigin_SteamV2_RightBumper
	k_EControllerActionOrigin_SteamV2_LeftGrip
	k_EControllerActionOrigin_SteamV2_RightGrip
	k_EControllerActionOrigin_SteamV2_Start
	k_EControllerActionOrigin_SteamV2_Back
	k_EControllerActionOrigin_SteamV2_LeftPad_Touch
	k_EControllerActionOrigin_SteamV2_LeftPad_Swipe
	k_EControllerActionOrigin_SteamV2_LeftPad_Click
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadNorth
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadSouth
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadWest
	k_EControllerActionOrigin_SteamV2_LeftPad_DPadEast
	k_EControllerActionOrigin_SteamV2_RightPad_Touch
	k_EControllerActionOrigin_SteamV2_RightPad_Swipe
	k_EControllerActionOrigin_SteamV2_RightPad_Click
	k_EControllerActionOrigin_SteamV2_RightPad_DPadNorth
	k_EControllerActionOrigin_SteamV2_RightPad_DPadSouth
	k_EControllerActionOrigin_SteamV2_RightPad_DPadWest
	k_EControllerActionOrigin_SteamV2_RightPad_DPadEast
	k_EControllerActionOrigin_SteamV2_LeftTrigger_Pull
	k_EControllerActionOrigin_SteamV2_LeftTrigger_Click
	k_EControllerActionOrigin_SteamV2_RightTrigger_Pull
	k_EControllerActionOrigin_SteamV2_RightTrigger_Click
	k_EControllerActionOrigin_SteamV2_LeftStick_Move
	k_EControllerActionOrigin_SteamV2_LeftStick_Click
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadNorth
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadSouth
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadWest
	k_EControllerActionOrigin_SteamV2_LeftStick_DPadEast
	k_EControllerActionOrigin_SteamV2_Gyro_Move
	k_EControllerActionOrigin_SteamV2_Gyro_Pitch
	k_EControllerActionOrigin_SteamV2_Gyro_Yaw
	k_EControllerActionOrigin_SteamV2_Gyro_Roll

	k_EControllerActionOrigin_Count
]

#enum ESteamControllerLEDFlag! [
	k_ESteamControllerLEDFlag_SetColor
	k_ESteamControllerLEDFlag_RestoreUserDefault
]


#import [
	STEAM_LIBRARY STEAM_CALL [
		SteamAPI_ISteamController_Init: "SteamAPI_ISteamController_Init" [
			instancePtr [ISteamController!]    ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamController_Shutdown: "SteamAPI_ISteamController_Shutdown" [
			instancePtr [ISteamController!]    ;intptr_t
			return: [logic!]
		]
		SteamAPI_ISteamController_RunFrame: "SteamAPI_ISteamController_RunFrame" [
			instancePtr [ISteamController!]    ;intptr_t
		]
		SteamAPI_ISteamController_GetConnectedControllers: "SteamAPI_ISteamController_GetConnectedControllers" [
			instancePtr [ISteamController!]    ;intptr_t
			handlesOut  [uint64-ref!]          ;ControllerHandle_t *
			return: [integer!]
		]
		SteamAPI_ISteamController_ShowBindingPanel: "SteamAPI_ISteamController_ShowBindingPanel" [
			instancePtr      [ISteamController!];intptr_t
			controllerHandle [uint64! value]   ;ControllerHandle_t
			return: [logic!]
		]
		SteamAPI_ISteamController_GetActionSetHandle: "SteamAPI_ISteamController_GetActionSetHandle" [
			instancePtr      [ISteamController!];intptr_t
			pszActionSetName [c-string!]       ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamController_ActivateActionSet: "SteamAPI_ISteamController_ActivateActionSet" [
			instancePtr      [ISteamController!];intptr_t
			controllerHandle [uint64! value]   ;ControllerHandle_t
			actionSetHandle  [uint64! value]   ;ControllerActionSetHandle_t
		]
		SteamAPI_ISteamController_GetCurrentActionSet: "SteamAPI_ISteamController_GetCurrentActionSet" [
			instancePtr      [ISteamController!];intptr_t
			controllerHandle [uint64! value]   ;ControllerHandle_t
			return: [uint64! value]
		]
		SteamAPI_ISteamController_GetDigitalActionHandle: "SteamAPI_ISteamController_GetDigitalActionHandle" [
			instancePtr   [ISteamController!]  ;intptr_t
			pszActionName [c-string!]          ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamController_GetDigitalActionOrigins: "SteamAPI_ISteamController_GetDigitalActionOrigins" [
			instancePtr         [ISteamController!];intptr_t
			controllerHandle    [uint64! value];ControllerHandle_t
			actionSetHandle     [uint64! value];ControllerActionSetHandle_t
			digitalActionHandle [uint64! value];ControllerDigitalActionHandle_t
			originsOut          [int-ptr!]     ;EControllerActionOrigin *
			return: [integer!]
		]
		SteamAPI_ISteamController_GetAnalogActionHandle: "SteamAPI_ISteamController_GetAnalogActionHandle" [
			instancePtr   [ISteamController!]  ;intptr_t
			pszActionName [c-string!]          ;const char *
			return: [uint64! value]
		]
		SteamAPI_ISteamController_GetAnalogActionOrigins: "SteamAPI_ISteamController_GetAnalogActionOrigins" [
			instancePtr        [ISteamController!];intptr_t
			controllerHandle   [uint64! value] ;ControllerHandle_t
			actionSetHandle    [uint64! value] ;ControllerActionSetHandle_t
			analogActionHandle [uint64! value] ;ControllerAnalogActionHandle_t
			originsOut         [int-ptr!]      ;EControllerActionOrigin *
			return: [integer!]
		]
		SteamAPI_ISteamController_StopAnalogActionMomentum: "SteamAPI_ISteamController_StopAnalogActionMomentum" [
			instancePtr      [ISteamController!];intptr_t
			controllerHandle [uint64! value]   ;ControllerHandle_t
			eAction          [uint64! value]   ;ControllerAnalogActionHandle_t
		]
		SteamAPI_ISteamController_TriggerHapticPulse: "SteamAPI_ISteamController_TriggerHapticPulse" [
			instancePtr        [ISteamController!];intptr_t
			controllerHandle   [uint64! value] ;ControllerHandle_t
			eTargetPad         [ESteamControllerPad!];ESteamControllerPad
			usDurationMicroSec [uin16! value]        ;unsigned short
		]
		SteamAPI_ISteamController_TriggerRepeatedHapticPulse: {SteamAPI_ISteamController_TriggerRepeatedHapticPulse} [
			instancePtr        [ISteamController!];intptr_t
			controllerHandle   [uint64! value] ;ControllerHandle_t
			eTargetPad         [ESteamControllerPad!];ESteamControllerPad
			usDurationMicroSec [uin16! value]        ;unsigned short
			usOffMicroSec      [uin16! value]        ;unsigned short
			unRepeat           [uin16! value]        ;unsigned short
			nFlags             [integer!]      ;unsigned int
		]
		SteamAPI_ISteamController_TriggerVibration: "SteamAPI_ISteamController_TriggerVibration" [
			instancePtr      [ISteamController!];intptr_t
			controllerHandle [uint64! value]   ;ControllerHandle_t
			usLeftSpeed      [uin16! value]          ;unsigned short
			usRightSpeed     [uin16! value]          ;unsigned short
		]
		SteamAPI_ISteamController_SetLEDColor: "SteamAPI_ISteamController_SetLEDColor" [
			instancePtr      [ISteamController!];intptr_t
			controllerHandle [uint64! value]   ;ControllerHandle_t
			nColorR          [byte!]           ;uint8
			nColorG          [byte!]           ;uint8
			nColorB          [byte!]           ;uint8
			nFlags           [integer!]        ;unsigned int
		]
		SteamAPI_ISteamController_GetGamepadIndexForController: {SteamAPI_ISteamController_GetGamepadIndexForController} [
			instancePtr        [ISteamController!];intptr_t
			ulControllerHandle [uint64! value] ;ControllerHandle_t
			return: [integer!]
		]
		SteamAPI_ISteamController_GetControllerForGamepadIndex: {SteamAPI_ISteamController_GetControllerForGamepadIndex} [
			instancePtr [ISteamController!]    ;intptr_t
			nIndex      [integer!]             ;int
			return: [uint64! value]
		]
		SteamAPI_ISteamController_ShowDigitalActionOrigins: "SteamAPI_ISteamController_ShowDigitalActionOrigins" [
			instancePtr         [ISteamController!];intptr_t
			controllerHandle    [uint64! value];ControllerHandle_t
			digitalActionHandle [uint64! value];ControllerDigitalActionHandle_t
			flScale             [float32!]     ;float
			flXPosition         [float32!]     ;float
			flYPosition         [float32!]     ;float
			return: [logic!]
		]
		SteamAPI_ISteamController_ShowAnalogActionOrigins: "SteamAPI_ISteamController_ShowAnalogActionOrigins" [
			instancePtr        [ISteamController!];intptr_t
			controllerHandle   [uint64! value] ;ControllerHandle_t
			analogActionHandle [uint64! value] ;ControllerAnalogActionHandle_t
			flScale            [float32!]      ;float
			flXPosition        [float32!]      ;float
			flYPosition        [float32!]      ;float
			return: [logic!]
		]
		SteamAPI_ISteamController_GetStringForActionOrigin: "SteamAPI_ISteamController_GetStringForActionOrigin" [
			instancePtr [ISteamController!]    ;intptr_t
			eOrigin     [EControllerActionOrigin!] ;EControllerActionOrigin
			return: [c-string!]
		]
		SteamAPI_ISteamController_GetGlyphForActionOrigin: "SteamAPI_ISteamController_GetGlyphForActionOrigin" [
			instancePtr [ISteamController!]    ;intptr_t
			eOrigin     [EControllerActionOrigin!] ;EControllerActionOrigin
			return: [c-string!]
		]
	]
]

