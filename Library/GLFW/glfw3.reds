Red/System [
	Title:   "Red/System glfw3 binding - A library for OpenGL/Vulkan, window and input"
	Author:  "Oldes"
	File: 	 %glfw3.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
/*************************************************************************
 * GLFW 3.1 - www.glfw.org
 * A library for OpenGL, window and input
 *------------------------------------------------------------------------
 * Copyright (c) 2002-2006 Marcus Geelnard
 * Copyright (c) 2006-2010 Camilla Berglund <elmindreda@elmindreda.org>
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would
 *    be appreciated but is not required.
 *
 * 2. Altered source versions must be plainly marked as such, and must not
 *    be misrepresented as being the original software.
 *
 * 3. This notice may not be removed or altered from any source
 *    distribution.
 *
 *************************************************************************/
	}
]

#switch OS [
	Windows   [
		#define GLFW3_LIBRARY "glfw3.dll"
		#define GLFW3_CALLING stdcall
	]
	macOS     [;@@ not tested!
		#define GLFW3_LIBRARY "glfw3.dylib"
		#define GLFW3_CALLING cdecl
	] 
	#default  [;@@ not tested!
		#define GLFW3_LIBRARY "glfw3.so"
		#define GLFW3_CALLING cdecl
	]
]

string-ref!:  alias struct! [value [c-string!]]


;-  The major version number of the GLFW library.
;   This is incremented when the API is changed in non-compatible ways.
;   @ingroup init
#define  GLFW_VERSION_MAJOR          3

;-  The minor version number of the GLFW library.
;   This is incremented when features are added to the API but it remains
;   backward-compatible.
;   @ingroup init
#define  GLFW_VERSION_MINOR          1

;-  The revision number of the GLFW library.
;   This is incremented when a bug fix release is made that does not contain any
;   API changes.
;   @ingroup init
#define  GLFW_VERSION_REVISION       2

;-  The key or mouse button was released.
;   The key or mouse button was released.
; 
;   @ingroup input
#define  GLFW_RELEASE                0

;-  The key or mouse button was pressed.
;   The key or mouse button was pressed.
; 
;   @ingroup input
#define  GLFW_PRESS                  1

;-  The key was held down until it repeated.
;   The key was held down until it repeated.
; 
;   @ingroup input
#define  GLFW_REPEAT                 2


;-------------------------------------------
;-- Keyboard keys
;-------------------------------------------


#define  GLFW_KEY_UNKNOWN            -1
#define  GLFW_KEY_SPACE              32
#define  GLFW_KEY_APOSTROPHE         39  ; '
#define  GLFW_KEY_COMMA              44  ; ,
#define  GLFW_KEY_MINUS              45  ; -
#define  GLFW_KEY_PERIOD             46  ; .
#define  GLFW_KEY_SLASH              47  ; /
#define  GLFW_KEY_0                  48
#define  GLFW_KEY_1                  49
#define  GLFW_KEY_2                  50
#define  GLFW_KEY_3                  51
#define  GLFW_KEY_4                  52
#define  GLFW_KEY_5                  53
#define  GLFW_KEY_6                  54
#define  GLFW_KEY_7                  55
#define  GLFW_KEY_8                  56
#define  GLFW_KEY_9                  57
#define  GLFW_KEY_SEMICOLON          59  ; ;
#define  GLFW_KEY_EQUAL              61  ; =
#define  GLFW_KEY_A                  65
#define  GLFW_KEY_B                  66
#define  GLFW_KEY_C                  67
#define  GLFW_KEY_D                  68
#define  GLFW_KEY_E                  69
#define  GLFW_KEY_F                  70
#define  GLFW_KEY_G                  71
#define  GLFW_KEY_H                  72
#define  GLFW_KEY_I                  73
#define  GLFW_KEY_J                  74
#define  GLFW_KEY_K                  75
#define  GLFW_KEY_L                  76
#define  GLFW_KEY_M                  77
#define  GLFW_KEY_N                  78
#define  GLFW_KEY_O                  79
#define  GLFW_KEY_P                  80
#define  GLFW_KEY_Q                  81
#define  GLFW_KEY_R                  82
#define  GLFW_KEY_S                  83
#define  GLFW_KEY_T                  84
#define  GLFW_KEY_U                  85
#define  GLFW_KEY_V                  86
#define  GLFW_KEY_W                  87
#define  GLFW_KEY_X                  88
#define  GLFW_KEY_Y                  89
#define  GLFW_KEY_Z                  90
#define  GLFW_KEY_LEFT_BRACKET       91  ; [
#define  GLFW_KEY_BACKSLASH          92  ; \
#define  GLFW_KEY_RIGHT_BRACKET      93  ; ]
#define  GLFW_KEY_GRAVE_ACCENT       96  ; `
#define  GLFW_KEY_WORLD_1            161 ; non-US #1
#define  GLFW_KEY_WORLD_2            162 ; non-US #2
#define  GLFW_KEY_ESCAPE             256
#define  GLFW_KEY_ENTER              257
#define  GLFW_KEY_TAB                258
#define  GLFW_KEY_BACKSPACE          259
#define  GLFW_KEY_INSERT             260
#define  GLFW_KEY_DELETE             261
#define  GLFW_KEY_RIGHT              262
#define  GLFW_KEY_LEFT               263
#define  GLFW_KEY_DOWN               264
#define  GLFW_KEY_UP                 265
#define  GLFW_KEY_PAGE_UP            266
#define  GLFW_KEY_PAGE_DOWN          267
#define  GLFW_KEY_HOME               268
#define  GLFW_KEY_END                269
#define  GLFW_KEY_CAPS_LOCK          280
#define  GLFW_KEY_SCROLL_LOCK        281
#define  GLFW_KEY_NUM_LOCK           282
#define  GLFW_KEY_PRINT_SCREEN       283
#define  GLFW_KEY_PAUSE              284
#define  GLFW_KEY_F1                 290
#define  GLFW_KEY_F2                 291
#define  GLFW_KEY_F3                 292
#define  GLFW_KEY_F4                 293
#define  GLFW_KEY_F5                 294
#define  GLFW_KEY_F6                 295
#define  GLFW_KEY_F7                 296
#define  GLFW_KEY_F8                 297
#define  GLFW_KEY_F9                 298
#define  GLFW_KEY_F10                299
#define  GLFW_KEY_F11                300
#define  GLFW_KEY_F12                301
#define  GLFW_KEY_F13                302
#define  GLFW_KEY_F14                303
#define  GLFW_KEY_F15                304
#define  GLFW_KEY_F16                305
#define  GLFW_KEY_F17                306
#define  GLFW_KEY_F18                307
#define  GLFW_KEY_F19                308
#define  GLFW_KEY_F20                309
#define  GLFW_KEY_F21                310
#define  GLFW_KEY_F22                311
#define  GLFW_KEY_F23                312
#define  GLFW_KEY_F24                313
#define  GLFW_KEY_F25                314
#define  GLFW_KEY_KP_0               320
#define  GLFW_KEY_KP_1               321
#define  GLFW_KEY_KP_2               322
#define  GLFW_KEY_KP_3               323
#define  GLFW_KEY_KP_4               324
#define  GLFW_KEY_KP_5               325
#define  GLFW_KEY_KP_6               326
#define  GLFW_KEY_KP_7               327
#define  GLFW_KEY_KP_8               328
#define  GLFW_KEY_KP_9               329
#define  GLFW_KEY_KP_DECIMAL         330
#define  GLFW_KEY_KP_DIVIDE          331
#define  GLFW_KEY_KP_MULTIPLY        332
#define  GLFW_KEY_KP_SUBTRACT        333
#define  GLFW_KEY_KP_ADD             334
#define  GLFW_KEY_KP_ENTER           335
#define  GLFW_KEY_KP_EQUAL           336
#define  GLFW_KEY_LEFT_SHIFT         340
#define  GLFW_KEY_LEFT_CONTROL       341
#define  GLFW_KEY_LEFT_ALT           342
#define  GLFW_KEY_LEFT_SUPER         343
#define  GLFW_KEY_RIGHT_SHIFT        344
#define  GLFW_KEY_RIGHT_CONTROL      345
#define  GLFW_KEY_RIGHT_ALT          346
#define  GLFW_KEY_RIGHT_SUPER        347
#define  GLFW_KEY_MENU               348
#define  GLFW_KEY_LAST               GLFW_KEY_MENU


;-------------------------------------------
;-- Modifier key flags
;-------------------------------------------



;-  If this bit is set one or more Shift keys were held down.
#define  GLFW_MOD_SHIFT            0001h

;-  If this bit is set one or more Control keys were held down.
#define  GLFW_MOD_CONTROL          0002h

;-  If this bit is set one or more Alt keys were held down.
#define  GLFW_MOD_ALT              0004h

;-  If this bit is set one or more Super keys were held down.
#define  GLFW_MOD_SUPER            0008h


;-------------------------------------------
;-- Mouse buttons
;-------------------------------------------


#define  GLFW_MOUSE_BUTTON_1         0
#define  GLFW_MOUSE_BUTTON_2         1
#define  GLFW_MOUSE_BUTTON_3         2
#define  GLFW_MOUSE_BUTTON_4         3
#define  GLFW_MOUSE_BUTTON_5         4
#define  GLFW_MOUSE_BUTTON_6         5
#define  GLFW_MOUSE_BUTTON_7         6
#define  GLFW_MOUSE_BUTTON_8         7
#define  GLFW_MOUSE_BUTTON_LAST      GLFW_MOUSE_BUTTON_8
#define  GLFW_MOUSE_BUTTON_LEFT      GLFW_MOUSE_BUTTON_1
#define  GLFW_MOUSE_BUTTON_RIGHT     GLFW_MOUSE_BUTTON_2
#define  GLFW_MOUSE_BUTTON_MIDDLE    GLFW_MOUSE_BUTTON_3


;-------------------------------------------
;-- Joysticks
;-------------------------------------------


#define  GLFW_JOYSTICK_1             0
#define  GLFW_JOYSTICK_2             1
#define  GLFW_JOYSTICK_3             2
#define  GLFW_JOYSTICK_4             3
#define  GLFW_JOYSTICK_5             4
#define  GLFW_JOYSTICK_6             5
#define  GLFW_JOYSTICK_7             6
#define  GLFW_JOYSTICK_8             7
#define  GLFW_JOYSTICK_9             8
#define  GLFW_JOYSTICK_10            9
#define  GLFW_JOYSTICK_11            10
#define  GLFW_JOYSTICK_12            11
#define  GLFW_JOYSTICK_13            12
#define  GLFW_JOYSTICK_14            13
#define  GLFW_JOYSTICK_15            14
#define  GLFW_JOYSTICK_16            15
#define  GLFW_JOYSTICK_LAST          GLFW_JOYSTICK_16


;-------------------------------------------
;-- Error codes
;-------------------------------------------



;-  GLFW has not been initialized.
;   This occurs if a GLFW function was called that may not be called unless the
;   library is [initialized](@ref intro_init).
; 
;   @par Analysis
;   Application programmer error.  Initialize GLFW before calling any function
;   that requires initialization.
#define  GLFW_NOT_INITIALIZED         00010001h

;-  No context is current for this thread.
;   This occurs if a GLFW function was called that needs and operates on the
;   current OpenGL or OpenGL ES context but no context is current on the calling
;   thread.  One such function is @ref glfwSwapInterval.
; 
;   @par Analysis
;   Application programmer error.  Ensure a context is current before calling
;   functions that require a current context.
#define  GLFW_NO_CURRENT_CONTEXT      00010002h

;-  One of the arguments to the function was an invalid enum value.
;   One of the arguments to the function was an invalid enum value, for example
;   requesting [GLFW_RED_BITS](@ref window_hints_fb) with @ref
;   glfwGetWindowAttrib.
; 
;   @par Analysis
;   Application programmer error.  Fix the offending call.
#define  GLFW_INVALID_ENUM            00010003h

;-  One of the arguments to the function was an invalid value.
;   One of the arguments to the function was an invalid value, for example
;   requesting a non-existent OpenGL or OpenGL ES version like 2.7.
; 
;   Requesting a valid but unavailable OpenGL or OpenGL ES version will instead
;   result in a @ref GLFW_VERSION_UNAVAILABLE error.
; 
;   @par Analysis
;   Application programmer error.  Fix the offending call.
#define  GLFW_INVALID_VALUE           00010004h

;-  A memory allocation failed.
;   A memory allocation failed.
; 
;   @par Analysis
;   A bug in GLFW or the underlying operating system.  Report the bug to our
;   [issue tracker](https://github.com/glfw/glfw/issues).
#define  GLFW_OUT_OF_MEMORY           00010005h

;-  GLFW could not find support for the requested client API on the system.
;   GLFW could not find support for the requested client API on the system.  If
;   emitted by functions other than @ref glfwCreateWindow, no supported client
;   API was found.
; 
;   @par Analysis
;   The installed graphics driver does not support the requested client API, or
;   does not support it via the chosen context creation backend.  Below are
;   a few examples.
; 
;   @par
;   Some pre-installed Windows graphics drivers do not support OpenGL.  AMD only
;   supports OpenGL ES via EGL, while Nvidia and Intel only support it via
;   a WGL or GLX extension.  OS X does not provide OpenGL ES at all.  The Mesa
;   EGL, OpenGL and OpenGL ES libraries do not interface with the Nvidia binary
;   driver.
#define  GLFW_API_UNAVAILABLE         00010006h

;-  The requested OpenGL or OpenGL ES version is not available.
;   The requested OpenGL or OpenGL ES version (including any requested context
;   or framebuffer hints) is not available on this machine.
; 
;   @par Analysis
;   The machine does not support your requirements.  If your application is
;   sufficiently flexible, downgrade your requirements and try again.
;   Otherwise, inform the user that their machine does not match your
;   requirements.
; 
;   @par
;   Future invalid OpenGL and OpenGL ES versions, for example OpenGL 4.8 if 5.0
;   comes out before the 4.x series gets that far, also fail with this error and
;   not @ref GLFW_INVALID_VALUE, because GLFW cannot know what future versions
;   will exist.
#define  GLFW_VERSION_UNAVAILABLE     00010007h

;-  A platform-specific error occurred that does not match any of the more specific categories.
;   A platform-specific error occurred that does not match any of the more
;   specific categories.
; 
;   @par Analysis
;   A bug or configuration error in GLFW, the underlying operating system or
;   its drivers, or a lack of required resources.  Report the issue to our
;   [issue tracker](https://github.com/glfw/glfw/issues).
#define  GLFW_PLATFORM_ERROR          00010008h

;-  The requested format is not supported or available.
;   If emitted during window creation, the requested pixel format is not
;   supported.
; 
;   If emitted when querying the clipboard, the contents of the clipboard could
;   not be converted to the requested format.
; 
;   @par Analysis
;   If emitted during window creation, one or more
;   [hard constraints](@ref window_hints_hard) did not match any of the
;   available pixel formats.  If your application is sufficiently flexible,
;   downgrade your requirements and try again.  Otherwise, inform the user that
;   their machine does not match your requirements.
; 
;   @par
;   If emitted when querying the clipboard, ignore the error or report it to
;   the user, as appropriate.
#define  GLFW_FORMAT_UNAVAILABLE      00010009h
#define  GLFW_FOCUSED                 00020001h
#define  GLFW_ICONIFIED               00020002h
#define  GLFW_RESIZABLE               00020003h
#define  GLFW_VISIBLE                 00020004h
#define  GLFW_DECORATED               00020005h
#define  GLFW_AUTO_ICONIFY            00020006h
#define  GLFW_FLOATING                00020007h
#define  GLFW_RED_BITS                00021001h
#define  GLFW_GREEN_BITS              00021002h
#define  GLFW_BLUE_BITS               00021003h
#define  GLFW_ALPHA_BITS              00021004h
#define  GLFW_DEPTH_BITS              00021005h
#define  GLFW_STENCIL_BITS            00021006h
#define  GLFW_ACCUM_RED_BITS          00021007h
#define  GLFW_ACCUM_GREEN_BITS        00021008h
#define  GLFW_ACCUM_BLUE_BITS         00021009h
#define  GLFW_ACCUM_ALPHA_BITS        0002100Ah
#define  GLFW_AUX_BUFFERS             0002100Bh
#define  GLFW_STEREO                  0002100Ch
#define  GLFW_SAMPLES                 0002100Dh
#define  GLFW_SRGB_CAPABLE            0002100Eh
#define  GLFW_REFRESH_RATE            0002100Fh
#define  GLFW_DOUBLEBUFFER            00021010h
#define  GLFW_CLIENT_API              00022001h
#define  GLFW_CONTEXT_VERSION_MAJOR   00022002h
#define  GLFW_CONTEXT_VERSION_MINOR   00022003h
#define  GLFW_CONTEXT_REVISION        00022004h
#define  GLFW_CONTEXT_ROBUSTNESS      00022005h
#define  GLFW_OPENGL_FORWARD_COMPAT   00022006h
#define  GLFW_OPENGL_DEBUG_CONTEXT    00022007h
#define  GLFW_OPENGL_PROFILE          00022008h
#define  GLFW_CONTEXT_RELEASE_BEHAVIOR  00022009h
#define  GLFW_OPENGL_API              00030001h
#define  GLFW_OPENGL_ES_API           00030002h
#define  GLFW_NO_ROBUSTNESS                   0
#define  GLFW_NO_RESET_NOTIFICATION   00031001h
#define  GLFW_LOSE_CONTEXT_ON_RESET   00031002h
#define  GLFW_OPENGL_ANY_PROFILE              0
#define  GLFW_OPENGL_CORE_PROFILE     00032001h
#define  GLFW_OPENGL_COMPAT_PROFILE   00032002h
#define  GLFW_CURSOR                  00033001h
#define  GLFW_STICKY_KEYS             00033002h
#define  GLFW_STICKY_MOUSE_BUTTONS    00033003h
#define  GLFW_CURSOR_NORMAL           00034001h
#define  GLFW_CURSOR_HIDDEN           00034002h
#define  GLFW_CURSOR_DISABLED         00034003h
#define  GLFW_ANY_RELEASE_BEHAVIOR            0
#define  GLFW_RELEASE_BEHAVIOR_FLUSH  00035001h
#define  GLFW_RELEASE_BEHAVIOR_NONE   00035002h


;-------------------------------------------
;-- Standard cursor shapes
;-------------------------------------------



;-  The regular arrow cursor shape.
;   The regular arrow cursor.
#define  GLFW_ARROW_CURSOR            00036001h

;-  The text input I-beam cursor shape.
;   The text input I-beam cursor shape.
#define  GLFW_IBEAM_CURSOR            00036002h

;-  The crosshair shape.
;   The crosshair shape.
#define  GLFW_CROSSHAIR_CURSOR        00036003h

;-  The hand shape.
;   The hand shape.
#define  GLFW_HAND_CURSOR             00036004h

;-  The horizontal resize arrow shape.
;   The horizontal resize arrow shape.
#define  GLFW_HRESIZE_CURSOR          00036005h

;-  The vertical resize arrow shape.
;   The vertical resize arrow shape.
#define  GLFW_VRESIZE_CURSOR          00036006h
#define  GLFW_CONNECTED               00040001h
#define  GLFW_DISCONNECTED            00040002h
#define  GLFW_DONT_CARE              -1


;-==================================================
;- GLFW API types
;-==================================================


#define GLFWglproc! [ function! [
;-  Client API function pointer type.
;   Generic function pointer used for returning client API function pointers
;   without forcing a cast from a regular pointer.
; 
;   @ingroup context
]]
#define GLFWmonitor!	[pointer! [integer!]]	; Opaque monitor object.
#define GLFWwindow!	[pointer! [integer!]]	; Opaque window object.
#define GLFWcursor!	[pointer! [integer!]]	; Opaque cursor object.
#define GLFWerrorfun! [ function! [
;-  The function signature for error callbacks.
;   This is the function signature for error callback functions.
; 
;   @param[in] error An [error code](@ref errors).
;   @param[in] description A UTF-8 encoded string describing the error.
; 
;   @sa glfwSetErrorCallback
; 
;   @ingroup init
	arg1	[ integer! ]
	arg2	[ c-string! ]
]]
#define GLFWwindowposfun! [ function! [
;-  The function signature for window position callbacks.
;   This is the function signature for window position callback functions.
; 
;   @param[in] window The window that was moved.
;   @param[in] xpos The new x-coordinate, in screen coordinates, of the
;   upper-left corner of the client area of the window.
;   @param[in] ypos The new y-coordinate, in screen coordinates, of the
;   upper-left corner of the client area of the window.
; 
;   @sa glfwSetWindowPosCallback
; 
;   @ingroup window
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
	arg3	[ integer! ]
]]
#define GLFWwindowsizefun! [ function! [
;-  The function signature for window resize callbacks.
;   This is the function signature for window size callback functions.
; 
;   @param[in] window The window that was resized.
;   @param[in] width The new width, in screen coordinates, of the window.
;   @param[in] height The new height, in screen coordinates, of the window.
; 
;   @sa glfwSetWindowSizeCallback
; 
;   @ingroup window
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
	arg3	[ integer! ]
]]
#define GLFWwindowclosefun! [ function! [
;-  The function signature for window close callbacks.
;   This is the function signature for window close callback functions.
; 
;   @param[in] window The window that the user attempted to close.
; 
;   @sa glfwSetWindowCloseCallback
; 
;   @ingroup window
	arg1	[ GLFWwindow! ]
]]
#define GLFWwindowrefreshfun! [ function! [
;-  The function signature for window content refresh callbacks.
;   This is the function signature for window refresh callback functions.
; 
;   @param[in] window The window whose content needs to be refreshed.
; 
;   @sa glfwSetWindowRefreshCallback
; 
;   @ingroup window
	arg1	[ GLFWwindow! ]
]]
#define GLFWwindowfocusfun! [ function! [
;-  The function signature for window focus/defocus callbacks.
;   This is the function signature for window focus callback functions.
; 
;   @param[in] window The window that gained or lost input focus.
;   @param[in] focused `GL_TRUE` if the window was given input focus, or
;   `GL_FALSE` if it lost it.
; 
;   @sa glfwSetWindowFocusCallback
; 
;   @ingroup window
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
]]
#define GLFWwindowiconifyfun! [ function! [
;-  The function signature for window iconify/restore callbacks.
;   This is the function signature for window iconify/restore callback
;   functions.
; 
;   @param[in] window The window that was iconified or restored.
;   @param[in] iconified `GL_TRUE` if the window was iconified, or `GL_FALSE`
;   if it was restored.
; 
;   @sa glfwSetWindowIconifyCallback
; 
;   @ingroup window
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
]]
#define GLFWframebuffersizefun! [ function! [
;-  The function signature for framebuffer resize callbacks.
;   This is the function signature for framebuffer resize callback
;   functions.
; 
;   @param[in] window The window whose framebuffer was resized.
;   @param[in] width The new width, in pixels, of the framebuffer.
;   @param[in] height The new height, in pixels, of the framebuffer.
; 
;   @sa glfwSetFramebufferSizeCallback
; 
;   @ingroup window
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
	arg3	[ integer! ]
]]
#define GLFWmousebuttonfun! [ function! [
;-  The function signature for mouse button callbacks.
;   This is the function signature for mouse button callback functions.
; 
;   @param[in] window The window that received the event.
;   @param[in] button The [mouse button](@ref buttons) that was pressed or
;   released.
;   @param[in] action One of `GLFW_PRESS` or `GLFW_RELEASE`.
;   @param[in] mods Bit field describing which [modifier keys](@ref mods) were
;   held down.
; 
;   @sa glfwSetMouseButtonCallback
; 
;   @ingroup input
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
	arg3	[ integer! ]
	arg4	[ integer! ]
]]
#define GLFWcursorposfun! [ function! [
;-  The function signature for cursor position callbacks.
;   This is the function signature for cursor position callback functions.
; 
;   @param[in] window The window that received the event.
;   @param[in] xpos The new x-coordinate, in screen coordinates, of the cursor.
;   @param[in] ypos The new y-coordinate, in screen coordinates, of the cursor.
; 
;   @sa glfwSetCursorPosCallback
; 
;   @ingroup input
	arg1	[ GLFWwindow! ]
	arg2	[ float! ]
	arg3	[ float! ]
]]
#define GLFWcursorenterfun! [ function! [
;-  The function signature for cursor enter/leave callbacks.
;   This is the function signature for cursor enter/leave callback functions.
; 
;   @param[in] window The window that received the event.
;   @param[in] entered `GL_TRUE` if the cursor entered the window's client
;   area, or `GL_FALSE` if it left it.
; 
;   @sa glfwSetCursorEnterCallback
; 
;   @ingroup input
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
]]
#define GLFWscrollfun! [ function! [
;-  The function signature for scroll callbacks.
;   This is the function signature for scroll callback functions.
; 
;   @param[in] window The window that received the event.
;   @param[in] xoffset The scroll offset along the x-axis.
;   @param[in] yoffset The scroll offset along the y-axis.
; 
;   @sa glfwSetScrollCallback
; 
;   @ingroup input
	arg1	[ GLFWwindow! ]
	arg2	[ float! ]
	arg3	[ float! ]
]]
#define GLFWkeyfun! [ function! [
;-  The function signature for keyboard key callbacks.
;   This is the function signature for keyboard key callback functions.
; 
;   @param[in] window The window that received the event.
;   @param[in] key The [keyboard key](@ref keys) that was pressed or released.
;   @param[in] scancode The system-specific scancode of the key.
;   @param[in] action `GLFW_PRESS`, `GLFW_RELEASE` or `GLFW_REPEAT`.
;   @param[in] mods Bit field describing which [modifier keys](@ref mods) were
;   held down.
; 
;   @sa glfwSetKeyCallback
; 
;   @ingroup input
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
	arg3	[ integer! ]
	arg4	[ integer! ]
	arg5	[ integer! ]
]]
#define GLFWcharfun! [ function! [
;-  The function signature for Unicode character callbacks.
;   This is the function signature for Unicode character callback functions.
; 
;   @param[in] window The window that received the event.
;   @param[in] codepoint The Unicode code point of the character.
; 
;   @sa glfwSetCharCallback
; 
;   @ingroup input
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
]]
#define GLFWcharmodsfun! [ function! [
;-  The function signature for Unicode character with modifiers callbacks.
;   This is the function signature for Unicode character with modifiers callback
;   functions.  It is called for each input character, regardless of what
;   modifier keys are held down.
; 
;   @param[in] window The window that received the event.
;   @param[in] codepoint The Unicode code point of the character.
;   @param[in] mods Bit field describing which [modifier keys](@ref mods) were
;   held down.
; 
;   @sa glfwSetCharModsCallback
; 
;   @ingroup input
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
	arg3	[ integer! ]
]]
#define GLFWdropfun! [ function! [
;-  The function signature for file drop callbacks.
;   This is the function signature for file drop callbacks.
; 
;   @param[in] window The window that received the event.
;   @param[in] count The number of dropped files.
;   @param[in] paths The UTF-8 encoded file and/or directory path names.
; 
;   @sa glfwSetDropCallback
; 
;   @ingroup input
	arg1	[ GLFWwindow! ]
	arg2	[ integer! ]
	arg3	[ string-ref! ]
]]
#define GLFWmonitorfun! [ function! [
;-  The function signature for monitor configuration callbacks.
;   This is the function signature for monitor configuration callback functions.
; 
;   @param[in] monitor The monitor that was connected or disconnected.
;   @param[in] event One of `GLFW_CONNECTED` or `GLFW_DISCONNECTED`.
; 
;   @sa glfwSetMonitorCallback
; 
;   @ingroup monitor
	arg1	[ GLFWmonitor! ]
	arg2	[ integer! ]
]]

GLFWvidmode!: alias struct! [
;-  Video mode type.;   This describes a single video mode.
; 
;   @ingroup monitor
	; The width, in screen coordinates, of the video mode.
	 width [ integer! ]
	; The height, in screen coordinates, of the video mode.
	 height [ integer! ]
	; The bit depth of the red channel of the video mode.
	 redBits [ integer! ]
	; The bit depth of the green channel of the video mode.
	 greenBits [ integer! ]
	; The bit depth of the blue channel of the video mode.
	 blueBits [ integer! ]
	; The refresh rate, in Hz, of the video mode.
	 refreshRate [ integer! ]
]

GLFWgammaramp!: alias struct! [
;-  Gamma ramp.;   This describes the gamma ramp for a monitor.
; 
;   @sa glfwGetGammaRamp glfwSetGammaRamp
; 
;   @ingroup monitor
	; An array of value describing the response of the red channel.
	 red [ int-ptr! ]
	; An array of value describing the response of the green channel.
	 green [ int-ptr! ]
	; An array of value describing the response of the blue channel.
	 blue [ int-ptr! ]
	; The number of elements in each array.
	 size [ integer! ]
]

GLFWimage!: alias struct! [
;-  Image data.	; The width, in pixels, of this image.
	 width [ integer! ]
	; The height, in pixels, of this image.
	 height [ integer! ]
	; The pixel data of this image, arranged left-to-right, top-to-bottom.
	 pixels [ byte-ptr! ]
]


;-==================================================
;- GLFW API functions
;-==================================================



#import [ GLFW3_LIBRARY GLFW3_CALLING [
	;@@ int glfwInit(void)
	glfwInit: "glfwInit"[
	  ;-  Initializes the GLFW library.
	  ; This function initializes the GLFW library.  Before most GLFW functions can
	  ; be used, GLFW must be initialized, and before an application terminates GLFW
	  ; should be terminated in order to free any resources allocated during or
	  ; after initialization.
	  ; 
	  ; If this function fails, it calls @ref glfwTerminate before returning.  If it
	  ; succeeds, you should call @ref glfwTerminate before the application exits.
	  ; 
	  ; Additional calls to this function after successful initialization but before
	  ; termination will return `GL_TRUE` immediately.
	  ; 
	  ; @return `GL_TRUE` if successful, or `GL_FALSE` if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @remarks __OS X:__ This function will change the current directory of the
	  ; application to the `Contents/Resources` subdirectory of the application's
	  ; bundle, if present.  This can be disabled with a
	  ; [compile-time option](@ref compile_options_osx).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref intro_init
	  ; @sa glfwTerminate
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @ingroup init
		return: [ integer! ]
	]
	;@@ void glfwTerminate(void)
	glfwTerminate: "glfwTerminate"[
	  ;-  Terminates the GLFW library.
	  ; This function destroys all remaining windows and cursors, restores any
	  ; modified gamma ramps and frees any other allocated resources.  Once this
	  ; function is called, you must again call @ref glfwInit successfully before
	  ; you will be able to use most GLFW functions.
	  ; 
	  ; If GLFW has been successfully initialized, this function should be called
	  ; before the application exits.  If initialization fails, there is no need to
	  ; call this function, as it is called by @ref glfwInit before it returns
	  ; failure.
	  ; 
	  ; @remarks This function may be called before @ref glfwInit.
	  ; 
	  ; @warning No window's context may be current on another thread when this
	  ; function is called.
	  ; 
	  ; @par Reentrancy
	  ; This function may not be called from a callback.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref intro_init
	  ; @sa glfwInit
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @ingroup init
	]
	;@@ void glfwGetVersion(int* major, int* minor, int* rev)
	glfwGetVersion: "glfwGetVersion"[
	  ;-  Retrieves the version of the GLFW library.
	  ; This function retrieves the major, minor and revision numbers of the GLFW
	  ; library.  It is intended for when you are using GLFW as a shared library and
	  ; want to ensure that you are using the minimum required version.
	  ; 
	  ; Any or all of the version arguments may be `NULL`.  This function always
	  ; succeeds.
	  ; 
	  ; @param[out] major Where to store the major version number, or `NULL`.
	  ; @param[out] minor Where to store the minor version number, or `NULL`.
	  ; @param[out] rev Where to store the revision number, or `NULL`.
	  ; 
	  ; @remarks This function may be called before @ref glfwInit.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.
	  ; 
	  ; @sa @ref intro_version
	  ; @sa glfwGetVersionString
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @ingroup init
		major	[ int-ptr! ]
		minor	[ int-ptr! ]
		rev	[ int-ptr! ]
	]
	;@@ char* glfwGetVersionString(void)
	glfwGetVersionString: "glfwGetVersionString"[
	  ;-  Returns a string describing the compile-time configuration.
	  ; This function returns the compile-time generated
	  ; [version string](@ref intro_version_string) of the GLFW library binary.  It
	  ; describes the version, platform, compiler and any platform-specific
	  ; compile-time options.
	  ; 
	  ; __Do not use the version string__ to parse the GLFW library version.  The
	  ; @ref glfwGetVersion function already provides the version of the running
	  ; library binary.
	  ; 
	  ; This function always succeeds.
	  ; 
	  ; @return The GLFW version string.
	  ; 
	  ; @remarks This function may be called before @ref glfwInit.
	  ; 
	  ; @par Pointer Lifetime
	  ; The returned string is static and compile-time generated.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.
	  ; 
	  ; @sa @ref intro_version
	  ; @sa glfwGetVersion
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup init
		return: [ c-string! ]
	]
	;@@ GLFWerrorfun glfwSetErrorCallback(GLFWerrorfun cbfun)
	glfwSetErrorCallback: "glfwSetErrorCallback"[
	  ;-  Sets the error callback.
	  ; This function sets the error callback, which is called with an error code
	  ; and a human-readable description each time a GLFW error occurs.
	  ; 
	  ; The error callback is called on the thread where the error occurred.  If you
	  ; are using GLFW from multiple threads, your error callback needs to be
	  ; written accordingly.
	  ; 
	  ; Because the description string may have been generated specifically for that
	  ; error, it is not guaranteed to be valid after the callback has returned.  If
	  ; you wish to use it after the callback returns, you need to make a copy.
	  ; 
	  ; Once set, the error callback remains set even after the library has been
	  ; terminated.
	  ; 
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set.
	  ; 
	  ; @remarks This function may be called before @ref glfwInit.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref error_handling
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup init
		cbfun	[ GLFWerrorfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWmonitor** glfwGetMonitors(int* count)
	glfwGetMonitors: "glfwGetMonitors"[
	  ;-  Returns the currently connected monitors.
	  ; This function returns an array of handles for all currently connected
	  ; monitors.  The primary monitor is always first in the returned array.  If no
	  ; monitors were found, this function returns `NULL`.
	  ; 
	  ; @param[out] count Where to store the number of monitors in the returned
	  ; array.  This is set to zero if an error occurred.
	  ; @return An array of monitor handles, or `NULL` if no monitors were found or
	  ; if an [error](@ref error_handling) occurred.
	  ; 
	  ; @par Pointer Lifetime
	  ; The returned array is allocated and freed by GLFW.  You should not free it
	  ; yourself.  It is guaranteed to be valid only until the monitor configuration
	  ; changes or the library is terminated.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref monitor_monitors
	  ; @sa @ref monitor_event
	  ; @sa glfwGetPrimaryMonitor
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup monitor
		count	[ int-ptr! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWmonitor* glfwGetPrimaryMonitor(void)
	glfwGetPrimaryMonitor: "glfwGetPrimaryMonitor"[
	  ;-  Returns the primary monitor.
	  ; This function returns the primary monitor.  This is usually the monitor
	  ; where elements like the task bar or global menu bar are located.
	  ; 
	  ; @return The primary monitor, or `NULL` if no monitors were found or if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @remarks The primary monitor is always first in the array returned by @ref
	  ; glfwGetMonitors.
	  ; 
	  ; @sa @ref monitor_monitors
	  ; @sa glfwGetMonitors
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup monitor
		return: [ GLFWmonitor! ]
	]
	;@@ void glfwGetMonitorPos(GLFWmonitor* monitor, int* xpos, int* ypos)
	glfwGetMonitorPos: "glfwGetMonitorPos"[
	  ;-  Returns the position of the monitor's viewport on the virtual screen.
	  ; This function returns the position, in screen coordinates, of the upper-left
	  ; corner of the specified monitor.
	  ; 
	  ; Any or all of the position arguments may be `NULL`.  If an error occurs, all
	  ; non-`NULL` position arguments will be set to zero.
	  ; 
	  ; @param[in] monitor The monitor to query.
	  ; @param[out] xpos Where to store the monitor x-coordinate, or `NULL`.
	  ; @param[out] ypos Where to store the monitor y-coordinate, or `NULL`.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref monitor_properties
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup monitor
		monitor	[ GLFWmonitor! ]
		xpos	[ int-ptr! ]
		ypos	[ int-ptr! ]
	]
	;@@ void glfwGetMonitorPhysicalSize(GLFWmonitor* monitor, int* widthMM, int* heightMM)
	glfwGetMonitorPhysicalSize: "glfwGetMonitorPhysicalSize"[
	  ;-  Returns the physical size of the monitor.
	  ; This function returns the size, in millimetres, of the display area of the
	  ; specified monitor.
	  ; 
	  ; Some systems do not provide accurate monitor size information, either
	  ; because the monitor
	  ; [EDID](https://en.wikipedia.org/wiki/Extended_display_identification_data)
	  ; data is incorrect or because the driver does not report it accurately.
	  ; 
	  ; Any or all of the size arguments may be `NULL`.  If an error occurs, all
	  ; non-`NULL` size arguments will be set to zero.
	  ; 
	  ; @param[in] monitor The monitor to query.
	  ; @param[out] widthMM Where to store the width, in millimetres, of the
	  ; monitor's display area, or `NULL`.
	  ; @param[out] heightMM Where to store the height, in millimetres, of the
	  ; monitor's display area, or `NULL`.
	  ; 
	  ; @remarks __Windows:__ The OS calculates the returned physical size from the
	  ; current resolution and system DPI instead of querying the monitor EDID data.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref monitor_properties
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup monitor
		monitor	[ GLFWmonitor! ]
		widthMM	[ int-ptr! ]
		heightMM	[ int-ptr! ]
	]
	;@@ char* glfwGetMonitorName(GLFWmonitor* monitor)
	glfwGetMonitorName: "glfwGetMonitorName"[
	  ;-  Returns the name of the specified monitor.
	  ; This function returns a human-readable name, encoded as UTF-8, of the
	  ; specified monitor.  The name typically reflects the make and model of the
	  ; monitor and is not guaranteed to be unique among the connected monitors.
	  ; 
	  ; @param[in] monitor The monitor to query.
	  ; @return The UTF-8 encoded name of the monitor, or `NULL` if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @par Pointer Lifetime
	  ; The returned string is allocated and freed by GLFW.  You should not free it
	  ; yourself.  It is valid until the specified monitor is disconnected or the
	  ; library is terminated.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref monitor_properties
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup monitor
		monitor	[ GLFWmonitor! ]
		return: [ c-string! ]
	]
	;@@ GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun cbfun)
	glfwSetMonitorCallback: "glfwSetMonitorCallback"[
	  ;-  Sets the monitor configuration callback.
	  ; This function sets the monitor configuration callback, or removes the
	  ; currently set callback.  This is called when a monitor is connected to or
	  ; disconnected from the system.
	  ; 
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @bug __X11:__ This callback is not yet called on monitor configuration
	  ; changes.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref monitor_event
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup monitor
		cbfun	[ GLFWmonitorfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWvidmode* glfwGetVideoModes(GLFWmonitor* monitor, int* count)
	glfwGetVideoModes: "glfwGetVideoModes"[
	  ;-  Returns the available video modes for the specified monitor.
	  ; This function returns an array of all video modes supported by the specified
	  ; monitor.  The returned array is sorted in ascending order, first by color
	  ; bit depth (the sum of all channel depths) and then by resolution area (the
	  ; product of width and height).
	  ; 
	  ; @param[in] monitor The monitor to query.
	  ; @param[out] count Where to store the number of video modes in the returned
	  ; array.  This is set to zero if an error occurred.
	  ; @return An array of video modes, or `NULL` if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @par Pointer Lifetime
	  ; The returned array is allocated and freed by GLFW.  You should not free it
	  ; yourself.  It is valid until the specified monitor is disconnected, this
	  ; function is called again for that monitor or the library is terminated.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref monitor_modes
	  ; @sa glfwGetVideoMode
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Changed to return an array of modes for a specific monitor.
	  ; 
	  ; @ingroup monitor
		monitor	[ GLFWmonitor! ]
		count	[ int-ptr! ]
		return: [ GLFWvidmode! ]
	]
	;@@ GLFWvidmode* glfwGetVideoMode(GLFWmonitor* monitor)
	glfwGetVideoMode: "glfwGetVideoMode"[
	  ;-  Returns the current mode of the specified monitor.
	  ; This function returns the current video mode of the specified monitor.  If
	  ; you have created a full screen window for that monitor, the return value
	  ; will depend on whether that window is iconified.
	  ; 
	  ; @param[in] monitor The monitor to query.
	  ; @return The current mode of the monitor, or `NULL` if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @par Pointer Lifetime
	  ; The returned array is allocated and freed by GLFW.  You should not free it
	  ; yourself.  It is valid until the specified monitor is disconnected or the
	  ; library is terminated.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref monitor_modes
	  ; @sa glfwGetVideoModes
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwGetDesktopMode`.
	  ; 
	  ; @ingroup monitor
		monitor	[ GLFWmonitor! ]
		return: [ GLFWvidmode! ]
	]
	;@@ void glfwSetGamma(GLFWmonitor* monitor, float gamma)
	glfwSetGamma: "glfwSetGamma"[
	  ;-  Generates a gamma ramp and sets it for the specified monitor.
	  ; This function generates a 256-element gamma ramp from the specified exponent
	  ; and then calls @ref glfwSetGammaRamp with it.  The value must be a finite
	  ; number greater than zero.
	  ; 
	  ; @param[in] monitor The monitor whose gamma ramp to set.
	  ; @param[in] gamma The desired exponent.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref monitor_gamma
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup monitor
		monitor	[ GLFWmonitor! ]
		gamma	[ float32! ]
	]
	;@@ GLFWgammaramp* glfwGetGammaRamp(GLFWmonitor* monitor)
	glfwGetGammaRamp: "glfwGetGammaRamp"[
	  ;-  Returns the current gamma ramp for the specified monitor.
	  ; This function returns the current gamma ramp of the specified monitor.
	  ; 
	  ; @param[in] monitor The monitor to query.
	  ; @return The current gamma ramp, or `NULL` if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @par Pointer Lifetime
	  ; The returned structure and its arrays are allocated and freed by GLFW.  You
	  ; should not free them yourself.  They are valid until the specified monitor
	  ; is disconnected, this function is called again for that monitor or the
	  ; library is terminated.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref monitor_gamma
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup monitor
		monitor	[ GLFWmonitor! ]
		return: [ GLFWgammaramp! ]
	]
	;@@ void glfwSetGammaRamp(GLFWmonitor* monitor, const GLFWgammaramp* ramp)
	glfwSetGammaRamp: "glfwSetGammaRamp"[
	  ;-  Sets the current gamma ramp for the specified monitor.
	  ; This function sets the current gamma ramp for the specified monitor.  The
	  ; original gamma ramp for that monitor is saved by GLFW the first time this
	  ; function is called and is restored by @ref glfwTerminate.
	  ; 
	  ; @param[in] monitor The monitor whose gamma ramp to set.
	  ; @param[in] ramp The gamma ramp to use.
	  ; 
	  ; @remarks Gamma ramp sizes other than 256 are not supported by all platforms
	  ; or graphics hardware.
	  ; 
	  ; @remarks __Windows:__ The gamma ramp size must be 256.
	  ; 
	  ; @par Pointer Lifetime
	  ; The specified gamma ramp is copied before this function returns.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref monitor_gamma
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup monitor
		monitor	[ GLFWmonitor! ]
		ramp	[ int-ptr! ]
	]
	;@@ void glfwDefaultWindowHints(void)
	glfwDefaultWindowHints: "glfwDefaultWindowHints"[
	  ;-  Resets all window hints to their default values.
	  ; This function resets all window hints to their
	  ; [default values](@ref window_hints_values).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_hints
	  ; @sa glfwWindowHint
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
	]
	;@@ void glfwWindowHint(int target, int hint)
	glfwWindowHint: "glfwWindowHint"[
	  ;-  Sets the specified window hint to the desired value.
	  ; This function sets hints for the next call to @ref glfwCreateWindow.  The
	  ; hints, once set, retain their values until changed by a call to @ref
	  ; glfwWindowHint or @ref glfwDefaultWindowHints, or until the library is
	  ; terminated.
	  ; 
	  ; @param[in] target The [window hint](@ref window_hints) to set.
	  ; @param[in] hint The new value of the window hint.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_hints
	  ; @sa glfwDefaultWindowHints
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwOpenWindowHint`.
	  ; 
	  ; @ingroup window
		target	[ integer! ]
		hint	[ integer! ]
	]
	;@@ GLFWwindow* glfwCreateWindow(int width, int height, const char* title, GLFWmonitor* monitor, GLFWwindow* share)
	glfwCreateWindow: "glfwCreateWindow"[
	  ;-  Creates a window and its associated context.
	  ; This function creates a window and its associated OpenGL or OpenGL ES
	  ; context.  Most of the options controlling how the window and its context
	  ; should be created are specified with [window hints](@ref window_hints).
	  ; 
	  ; Successful creation does not change which context is current.  Before you
	  ; can use the newly created context, you need to
	  ; [make it current](@ref context_current).  For information about the `share`
	  ; parameter, see @ref context_sharing.
	  ; 
	  ; The created window, framebuffer and context may differ from what you
	  ; requested, as not all parameters and hints are
	  ; [hard constraints](@ref window_hints_hard).  This includes the size of the
	  ; window, especially for full screen windows.  To query the actual attributes
	  ; of the created window, framebuffer and context, see @ref
	  ; glfwGetWindowAttrib, @ref glfwGetWindowSize and @ref glfwGetFramebufferSize.
	  ; 
	  ; To create a full screen window, you need to specify the monitor the window
	  ; will cover.  If no monitor is specified, windowed mode will be used.  Unless
	  ; you have a way for the user to choose a specific monitor, it is recommended
	  ; that you pick the primary monitor.  For more information on how to query
	  ; connected monitors, see @ref monitor_monitors.
	  ; 
	  ; For full screen windows, the specified size becomes the resolution of the
	  ; window's _desired video mode_.  As long as a full screen window has input
	  ; focus, the supported video mode most closely matching the desired video mode
	  ; is set for the specified monitor.  For more information about full screen
	  ; windows, including the creation of so called _windowed full screen_ or
	  ; _borderless full screen_ windows, see @ref window_windowed_full_screen.
	  ; 
	  ; By default, newly created windows use the placement recommended by the
	  ; window system.  To create the window at a specific position, make it
	  ; initially invisible using the [GLFW_VISIBLE](@ref window_hints_wnd) window
	  ; hint, set its [position](@ref window_pos) and then [show](@ref window_hide)
	  ; it.
	  ; 
	  ; If a full screen window has input focus, the screensaver is prohibited from
	  ; starting.
	  ; 
	  ; Window systems put limits on window sizes.  Very large or very small window
	  ; dimensions may be overridden by the window system on creation.  Check the
	  ; actual [size](@ref window_size) after creation.
	  ; 
	  ; The [swap interval](@ref buffer_swap) is not set during window creation and
	  ; the initial value may vary depending on driver settings and defaults.
	  ; 
	  ; @param[in] width The desired width, in screen coordinates, of the window.
	  ; This must be greater than zero.
	  ; @param[in] height The desired height, in screen coordinates, of the window.
	  ; This must be greater than zero.
	  ; @param[in] title The initial, UTF-8 encoded window title.
	  ; @param[in] monitor The monitor to use for full screen mode, or `NULL` to use
	  ; windowed mode.
	  ; @param[in] share The window whose context to share resources with, or `NULL`
	  ; to not share resources.
	  ; @return The handle of the created window, or `NULL` if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @remarks __Windows:__ Window creation will fail if the Microsoft GDI
	  ; software OpenGL implementation is the only one available.
	  ; 
	  ; @remarks __Windows:__ If the executable has an icon resource named
	  ; `GLFW_ICON,` it will be set as the icon for the window.  If no such icon is
	  ; present, the `IDI_WINLOGO` icon will be used instead.
	  ; 
	  ; @remarks __Windows:__ The context to share resources with may not be current
	  ; on any other thread.
	  ; 
	  ; @remarks __OS X:__ The GLFW window has no icon, as it is not a document
	  ; window, but the dock icon will be the same as the application bundle's icon.
	  ; For more information on bundles, see the
	  ; [Bundle Programming Guide](https://developer.apple.com/library/mac/documentation/CoreFoundation/Conceptual/CFBundles/)
	  ; in the Mac Developer Library.
	  ; 
	  ; @remarks __OS X:__ The first time a window is created the menu bar is
	  ; populated with common commands like Hide, Quit and About.  The About entry
	  ; opens a minimal about dialog with information from the application's bundle.
	  ; The menu bar can be disabled with a
	  ; [compile-time option](@ref compile_options_osx).
	  ; 
	  ; @remarks __OS X:__ On OS X 10.10 and later the window frame will not be
	  ; rendered at full resolution on Retina displays unless the
	  ; `NSHighResolutionCapable` key is enabled in the application bundle's
	  ; `Info.plist`.  For more information, see
	  ; [High Resolution Guidelines for OS X](https://developer.apple.com/library/mac/documentation/GraphicsAnimation/Conceptual/HighResolutionOSX/Explained/Explained.html)
	  ; in the Mac Developer Library.  The GLFW test and example programs use
	  ; a custom `Info.plist` template for this, which can be found as
	  ; `CMake/MacOSXBundleInfo.plist.in` in the source tree.
	  ; 
	  ; @remarks __X11:__ There is no mechanism for setting the window icon yet.
	  ; 
	  ; @remarks __X11:__ Some window managers will not respect the placement of
	  ; initially hidden windows.
	  ; 
	  ; @remarks __X11:__ Due to the asynchronous nature of X11, it may take
	  ; a moment for a window to reach its requested state.  This means you may not
	  ; be able to query the final size, position or other attributes directly after
	  ; window creation.
	  ; 
	  ; @par Reentrancy
	  ; This function may not be called from a callback.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_creation
	  ; @sa glfwDestroyWindow
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwOpenWindow`.
	  ; 
	  ; @ingroup window
		width	[ integer! ]
		height	[ integer! ]
		title	[ c-string! ]
		monitor	[ GLFWmonitor! ]
		share	[ GLFWwindow! ]
		return: [ GLFWwindow! ]
	]
	;@@ void glfwDestroyWindow(GLFWwindow* window)
	glfwDestroyWindow: "glfwDestroyWindow"[
	  ;-  Destroys the specified window and its context.
	  ; This function destroys the specified window and its context.  On calling
	  ; this function, no further callbacks will be called for that window.
	  ; 
	  ; If the context of the specified window is current on the main thread, it is
	  ; detached before being destroyed.
	  ; 
	  ; @param[in] window The window to destroy.
	  ; 
	  ; @note The context of the specified window must not be current on any other
	  ; thread when this function is called.
	  ; 
	  ; @par Reentrancy
	  ; This function may not be called from a callback.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_creation
	  ; @sa glfwCreateWindow
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwCloseWindow`.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
	]
	;@@ int glfwWindowShouldClose(GLFWwindow* window)
	glfwWindowShouldClose: "glfwWindowShouldClose"[
	  ;-  Checks the close flag of the specified window.
	  ; This function returns the value of the close flag of the specified window.
	  ; 
	  ; @param[in] window The window to query.
	  ; @return The value of the close flag.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.  Access is not synchronized.
	  ; 
	  ; @sa @ref window_close
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		return: [ integer! ]
	]
	;@@ void glfwSetWindowShouldClose(GLFWwindow* window, int value)
	glfwSetWindowShouldClose: "glfwSetWindowShouldClose"[
	  ;-  Sets the close flag of the specified window.
	  ; This function sets the value of the close flag of the specified window.
	  ; This can be used to override the user's attempt to close the window, or
	  ; to signal that it should be closed.
	  ; 
	  ; @param[in] window The window whose flag to change.
	  ; @param[in] value The new value.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.  Access is not synchronized.
	  ; 
	  ; @sa @ref window_close
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		value	[ integer! ]
	]
	;@@ void glfwSetWindowTitle(GLFWwindow* window, const char* title)
	glfwSetWindowTitle: "glfwSetWindowTitle"[
	  ;-  Sets the title of the specified window.
	  ; This function sets the window title, encoded as UTF-8, of the specified
	  ; window.
	  ; 
	  ; @param[in] window The window whose title to change.
	  ; @param[in] title The UTF-8 encoded window title.
	  ; 
	  ; @remarks __OS X:__ The window title will not be updated until the next time
	  ; you process events.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_title
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		title	[ c-string! ]
	]
	;@@ void glfwGetWindowPos(GLFWwindow* window, int* xpos, int* ypos)
	glfwGetWindowPos: "glfwGetWindowPos"[
	  ;-  Retrieves the position of the client area of the specified window.
	  ; This function retrieves the position, in screen coordinates, of the
	  ; upper-left corner of the client area of the specified window.
	  ; 
	  ; Any or all of the position arguments may be `NULL`.  If an error occurs, all
	  ; non-`NULL` position arguments will be set to zero.
	  ; 
	  ; @param[in] window The window to query.
	  ; @param[out] xpos Where to store the x-coordinate of the upper-left corner of
	  ; the client area, or `NULL`.
	  ; @param[out] ypos Where to store the y-coordinate of the upper-left corner of
	  ; the client area, or `NULL`.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_pos
	  ; @sa glfwSetWindowPos
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		xpos	[ int-ptr! ]
		ypos	[ int-ptr! ]
	]
	;@@ void glfwSetWindowPos(GLFWwindow* window, int xpos, int ypos)
	glfwSetWindowPos: "glfwSetWindowPos"[
	  ;-  Sets the position of the client area of the specified window.
	  ; This function sets the position, in screen coordinates, of the upper-left
	  ; corner of the client area of the specified windowed mode window.  If the
	  ; window is a full screen window, this function does nothing.
	  ; 
	  ; __Do not use this function__ to move an already visible window unless you
	  ; have very good reasons for doing so, as it will confuse and annoy the user.
	  ; 
	  ; The window manager may put limits on what positions are allowed.  GLFW
	  ; cannot and should not override these limits.
	  ; 
	  ; @param[in] window The window to query.
	  ; @param[in] xpos The x-coordinate of the upper-left corner of the client area.
	  ; @param[in] ypos The y-coordinate of the upper-left corner of the client area.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_pos
	  ; @sa glfwGetWindowPos
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		xpos	[ integer! ]
		ypos	[ integer! ]
	]
	;@@ void glfwGetWindowSize(GLFWwindow* window, int* width, int* height)
	glfwGetWindowSize: "glfwGetWindowSize"[
	  ;-  Retrieves the size of the client area of the specified window.
	  ; This function retrieves the size, in screen coordinates, of the client area
	  ; of the specified window.  If you wish to retrieve the size of the
	  ; framebuffer of the window in pixels, see @ref glfwGetFramebufferSize.
	  ; 
	  ; Any or all of the size arguments may be `NULL`.  If an error occurs, all
	  ; non-`NULL` size arguments will be set to zero.
	  ; 
	  ; @param[in] window The window whose size to retrieve.
	  ; @param[out] width Where to store the width, in screen coordinates, of the
	  ; client area, or `NULL`.
	  ; @param[out] height Where to store the height, in screen coordinates, of the
	  ; client area, or `NULL`.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_size
	  ; @sa glfwSetWindowSize
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		width	[ int-ptr! ]
		height	[ int-ptr! ]
	]
	;@@ void glfwSetWindowSize(GLFWwindow* window, int width, int height)
	glfwSetWindowSize: "glfwSetWindowSize"[
	  ;-  Sets the size of the client area of the specified window.
	  ; This function sets the size, in screen coordinates, of the client area of
	  ; the specified window.
	  ; 
	  ; For full screen windows, this function selects and switches to the resolution
	  ; closest to the specified size, without affecting the window's context.  As
	  ; the context is unaffected, the bit depths of the framebuffer remain
	  ; unchanged.
	  ; 
	  ; The window manager may put limits on what sizes are allowed.  GLFW cannot
	  ; and should not override these limits.
	  ; 
	  ; @param[in] window The window to resize.
	  ; @param[in] width The desired width of the specified window.
	  ; @param[in] height The desired height of the specified window.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_size
	  ; @sa glfwGetWindowSize
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		width	[ integer! ]
		height	[ integer! ]
	]
	;@@ void glfwGetFramebufferSize(GLFWwindow* window, int* width, int* height)
	glfwGetFramebufferSize: "glfwGetFramebufferSize"[
	  ;-  Retrieves the size of the framebuffer of the specified window.
	  ; This function retrieves the size, in pixels, of the framebuffer of the
	  ; specified window.  If you wish to retrieve the size of the window in screen
	  ; coordinates, see @ref glfwGetWindowSize.
	  ; 
	  ; Any or all of the size arguments may be `NULL`.  If an error occurs, all
	  ; non-`NULL` size arguments will be set to zero.
	  ; 
	  ; @param[in] window The window whose framebuffer to query.
	  ; @param[out] width Where to store the width, in pixels, of the framebuffer,
	  ; or `NULL`.
	  ; @param[out] height Where to store the height, in pixels, of the framebuffer,
	  ; or `NULL`.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_fbsize
	  ; @sa glfwSetFramebufferSizeCallback
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		width	[ int-ptr! ]
		height	[ int-ptr! ]
	]
	;@@ void glfwGetWindowFrameSize(GLFWwindow* window, int* left, int* top, int* right, int* bottom)
	glfwGetWindowFrameSize: "glfwGetWindowFrameSize"[
	  ;-  Retrieves the size of the frame of the window.
	  ; This function retrieves the size, in screen coordinates, of each edge of the
	  ; frame of the specified window.  This size includes the title bar, if the
	  ; window has one.  The size of the frame may vary depending on the
	  ; [window-related hints](@ref window_hints_wnd) used to create it.
	  ; 
	  ; Because this function retrieves the size of each window frame edge and not
	  ; the offset along a particular coordinate axis, the retrieved values will
	  ; always be zero or positive.
	  ; 
	  ; Any or all of the size arguments may be `NULL`.  If an error occurs, all
	  ; non-`NULL` size arguments will be set to zero.
	  ; 
	  ; @param[in] window The window whose frame size to query.
	  ; @param[out] left Where to store the size, in screen coordinates, of the left
	  ; edge of the window frame, or `NULL`.
	  ; @param[out] top Where to store the size, in screen coordinates, of the top
	  ; edge of the window frame, or `NULL`.
	  ; @param[out] right Where to store the size, in screen coordinates, of the
	  ; right edge of the window frame, or `NULL`.
	  ; @param[out] bottom Where to store the size, in screen coordinates, of the
	  ; bottom edge of the window frame, or `NULL`.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_size
	  ; 
	  ; @since Added in GLFW 3.1.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		left	[ int-ptr! ]
		top	[ int-ptr! ]
		right	[ int-ptr! ]
		bottom	[ int-ptr! ]
	]
	;@@ void glfwIconifyWindow(GLFWwindow* window)
	glfwIconifyWindow: "glfwIconifyWindow"[
	  ;-  Iconifies the specified window.
	  ; This function iconifies (minimizes) the specified window if it was
	  ; previously restored.  If the window is already iconified, this function does
	  ; nothing.
	  ; 
	  ; If the specified window is a full screen window, the original monitor
	  ; resolution is restored until the window is restored.
	  ; 
	  ; @param[in] window The window to iconify.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_iconify
	  ; @sa glfwRestoreWindow
	  ; 
	  ; @since Added in GLFW 2.1.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
	]
	;@@ void glfwRestoreWindow(GLFWwindow* window)
	glfwRestoreWindow: "glfwRestoreWindow"[
	  ;-  Restores the specified window.
	  ; This function restores the specified window if it was previously iconified
	  ; (minimized).  If the window is already restored, this function does nothing.
	  ; 
	  ; If the specified window is a full screen window, the resolution chosen for
	  ; the window is restored on the selected monitor.
	  ; 
	  ; @param[in] window The window to restore.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_iconify
	  ; @sa glfwIconifyWindow
	  ; 
	  ; @since Added in GLFW 2.1.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
	]
	;@@ void glfwShowWindow(GLFWwindow* window)
	glfwShowWindow: "glfwShowWindow"[
	  ;-  Makes the specified window visible.
	  ; This function makes the specified window visible if it was previously
	  ; hidden.  If the window is already visible or is in full screen mode, this
	  ; function does nothing.
	  ; 
	  ; @param[in] window The window to make visible.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_hide
	  ; @sa glfwHideWindow
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
	]
	;@@ void glfwHideWindow(GLFWwindow* window)
	glfwHideWindow: "glfwHideWindow"[
	  ;-  Hides the specified window.
	  ; This function hides the specified window if it was previously visible.  If
	  ; the window is already hidden or is in full screen mode, this function does
	  ; nothing.
	  ; 
	  ; @param[in] window The window to hide.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_hide
	  ; @sa glfwShowWindow
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
	]
	;@@ GLFWmonitor* glfwGetWindowMonitor(GLFWwindow* window)
	glfwGetWindowMonitor: "glfwGetWindowMonitor"[
	  ;-  Returns the monitor that the window uses for full screen mode.
	  ; This function returns the handle of the monitor that the specified window is
	  ; in full screen on.
	  ; 
	  ; @param[in] window The window to query.
	  ; @return The monitor, or `NULL` if the window is in windowed mode or an error
	  ; occurred.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_monitor
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		return: [ GLFWmonitor! ]
	]
	;@@ int glfwGetWindowAttrib(GLFWwindow* window, int attrib)
	glfwGetWindowAttrib: "glfwGetWindowAttrib"[
	  ;-  Returns an attribute of the specified window.
	  ; This function returns the value of an attribute of the specified window or
	  ; its OpenGL or OpenGL ES context.
	  ; 
	  ; @param[in] window The window to query.
	  ; @param[in] attrib The [window attribute](@ref window_attribs) whose value to
	  ; return.
	  ; @return The value of the attribute, or zero if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @remarks Framebuffer related hints are not window attributes.  See @ref
	  ; window_attribs_fb for more information.
	  ; 
	  ; @remarks Zero is a valid value for many window and context related
	  ; attributes so you cannot use a return value of zero as an indication of
	  ; errors.  However, this function should not fail as long as it is passed
	  ; valid arguments and the library has been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_attribs
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwGetWindowParam` and
	  ; `glfwGetGLVersion`.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		attrib	[ integer! ]
		return: [ integer! ]
	]
	;@@ void glfwSetWindowUserPointer(GLFWwindow* window, void* pointer)
	glfwSetWindowUserPointer: "glfwSetWindowUserPointer"[
	  ;-  Sets the user pointer of the specified window.
	  ; This function sets the user-defined pointer of the specified window.  The
	  ; current value is retained until the window is destroyed.  The initial value
	  ; is `NULL`.
	  ; 
	  ; @param[in] window The window whose pointer to set.
	  ; @param[in] pointer The new value.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.  Access is not synchronized.
	  ; 
	  ; @sa @ref window_userptr
	  ; @sa glfwGetWindowUserPointer
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		pointer	[ int-ptr! ]
	]
	;@@ void* glfwGetWindowUserPointer(GLFWwindow* window)
	glfwGetWindowUserPointer: "glfwGetWindowUserPointer"[
	  ;-  Returns the user pointer of the specified window.
	  ; This function returns the current value of the user-defined pointer of the
	  ; specified window.  The initial value is `NULL`.
	  ; 
	  ; @param[in] window The window whose pointer to return.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.  Access is not synchronized.
	  ; 
	  ; @sa @ref window_userptr
	  ; @sa glfwSetWindowUserPointer
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow* window, GLFWwindowposfun cbfun)
	glfwSetWindowPosCallback: "glfwSetWindowPosCallback"[
	  ;-  Sets the position callback for the specified window.
	  ; This function sets the position callback of the specified window, which is
	  ; called when the window is moved.  The callback is provided with the screen
	  ; position of the upper-left corner of the client area of the window.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_pos
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		cbfun	[ GLFWwindowposfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow* window, GLFWwindowsizefun cbfun)
	glfwSetWindowSizeCallback: "glfwSetWindowSizeCallback"[
	  ;-  Sets the size callback for the specified window.
	  ; This function sets the size callback of the specified window, which is
	  ; called when the window is resized.  The callback is provided with the size,
	  ; in screen coordinates, of the client area of the window.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_size
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.  Updated callback signature.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		cbfun	[ GLFWwindowsizefun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow* window, GLFWwindowclosefun cbfun)
	glfwSetWindowCloseCallback: "glfwSetWindowCloseCallback"[
	  ;-  Sets the close callback for the specified window.
	  ; This function sets the close callback of the specified window, which is
	  ; called when the user attempts to close the window, for example by clicking
	  ; the close widget in the title bar.
	  ; 
	  ; The close flag is set before this callback is called, but you can modify it
	  ; at any time with @ref glfwSetWindowShouldClose.
	  ; 
	  ; The close callback is not triggered by @ref glfwDestroyWindow.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @remarks __OS X:__ Selecting Quit from the application menu will
	  ; trigger the close callback for all windows.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_close
	  ; 
	  ; @since Added in GLFW 2.5.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.  Updated callback signature.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		cbfun	[ GLFWwindowclosefun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow* window, GLFWwindowrefreshfun cbfun)
	glfwSetWindowRefreshCallback: "glfwSetWindowRefreshCallback"[
	  ;-  Sets the refresh callback for the specified window.
	  ; This function sets the refresh callback of the specified window, which is
	  ; called when the client area of the window needs to be redrawn, for example
	  ; if the window has been exposed after having been covered by another window.
	  ; 
	  ; On compositing window systems such as Aero, Compiz or Aqua, where the window
	  ; contents are saved off-screen, this callback may be called only very
	  ; infrequently or never at all.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_refresh
	  ; 
	  ; @since Added in GLFW 2.5.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.  Updated callback signature.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		cbfun	[ GLFWwindowrefreshfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow* window, GLFWwindowfocusfun cbfun)
	glfwSetWindowFocusCallback: "glfwSetWindowFocusCallback"[
	  ;-  Sets the focus callback for the specified window.
	  ; This function sets the focus callback of the specified window, which is
	  ; called when the window gains or loses input focus.
	  ; 
	  ; After the focus callback is called for a window that lost input focus,
	  ; synthetic key and mouse button release events will be generated for all such
	  ; that had been pressed.  For more information, see @ref glfwSetKeyCallback
	  ; and @ref glfwSetMouseButtonCallback.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_focus
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		cbfun	[ GLFWwindowfocusfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow* window, GLFWwindowiconifyfun cbfun)
	glfwSetWindowIconifyCallback: "glfwSetWindowIconifyCallback"[
	  ;-  Sets the iconify callback for the specified window.
	  ; This function sets the iconification callback of the specified window, which
	  ; is called when the window is iconified or restored.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_iconify
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		cbfun	[ GLFWwindowiconifyfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow* window, GLFWframebuffersizefun cbfun)
	glfwSetFramebufferSizeCallback: "glfwSetFramebufferSizeCallback"[
	  ;-  Sets the framebuffer resize callback for the specified window.
	  ; This function sets the framebuffer resize callback of the specified window,
	  ; which is called when the framebuffer of the specified window is resized.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref window_fbsize
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
		cbfun	[ GLFWframebuffersizefun! ]
		return: [ int-ptr! ]
	]
	;@@ void glfwPollEvents(void)
	glfwPollEvents: "glfwPollEvents"[
	  ;-  Processes all pending events.
	  ; This function processes only those events that are already in the event
	  ; queue and then returns immediately.  Processing events will cause the window
	  ; and input callbacks associated with those events to be called.
	  ; 
	  ; On some platforms, a window move, resize or menu operation will cause event
	  ; processing to block.  This is due to how event processing is designed on
	  ; those platforms.  You can use the
	  ; [window refresh callback](@ref window_refresh) to redraw the contents of
	  ; your window when necessary during such operations.
	  ; 
	  ; On some platforms, certain events are sent directly to the application
	  ; without going through the event queue, causing callbacks to be called
	  ; outside of a call to one of the event processing functions.
	  ; 
	  ; Event processing is not required for joystick input to work.
	  ; 
	  ; @par Reentrancy
	  ; This function may not be called from a callback.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref events
	  ; @sa glfwWaitEvents
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @ingroup window
	]
	;@@ void glfwWaitEvents(void)
	glfwWaitEvents: "glfwWaitEvents"[
	  ;-  Waits until events are queued and processes them.
	  ; This function puts the calling thread to sleep until at least one event is
	  ; available in the event queue.  Once one or more events are available,
	  ; it behaves exactly like @ref glfwPollEvents, i.e. the events in the queue
	  ; are processed and the function then returns immediately.  Processing events
	  ; will cause the window and input callbacks associated with those events to be
	  ; called.
	  ; 
	  ; Since not all events are associated with callbacks, this function may return
	  ; without a callback having been called even if you are monitoring all
	  ; callbacks.
	  ; 
	  ; On some platforms, a window move, resize or menu operation will cause event
	  ; processing to block.  This is due to how event processing is designed on
	  ; those platforms.  You can use the
	  ; [window refresh callback](@ref window_refresh) to redraw the contents of
	  ; your window when necessary during such operations.
	  ; 
	  ; On some platforms, certain callbacks may be called outside of a call to one
	  ; of the event processing functions.
	  ; 
	  ; If no windows exist, this function returns immediately.  For synchronization
	  ; of threads in applications that do not create windows, use your threading
	  ; library of choice.
	  ; 
	  ; Event processing is not required for joystick input to work.
	  ; 
	  ; @par Reentrancy
	  ; This function may not be called from a callback.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref events
	  ; @sa glfwPollEvents
	  ; 
	  ; @since Added in GLFW 2.5.
	  ; 
	  ; @ingroup window
	]
	;@@ void glfwPostEmptyEvent(void)
	glfwPostEmptyEvent: "glfwPostEmptyEvent"[
	  ;-  Posts an empty event to the event queue.
	  ; This function posts an empty event from the current thread to the event
	  ; queue, causing @ref glfwWaitEvents to return.
	  ; 
	  ; If no windows exist, this function returns immediately.  For synchronization
	  ; of threads in applications that do not create windows, use your threading
	  ; library of choice.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.
	  ; 
	  ; @sa @ref events
	  ; @sa glfwWaitEvents
	  ; 
	  ; @since Added in GLFW 3.1.
	  ; 
	  ; @ingroup window
	]
	;@@ int glfwGetInputMode(GLFWwindow* window, int mode)
	glfwGetInputMode: "glfwGetInputMode"[
	  ;-  Returns the value of an input option for the specified window.
	  ; This function returns the value of an input option for the specified window.
	  ; The mode must be one of `GLFW_CURSOR`, `GLFW_STICKY_KEYS` or
	  ; `GLFW_STICKY_MOUSE_BUTTONS`.
	  ; 
	  ; @param[in] window The window to query.
	  ; @param[in] mode One of `GLFW_CURSOR`, `GLFW_STICKY_KEYS` or
	  ; `GLFW_STICKY_MOUSE_BUTTONS`.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa glfwSetInputMode
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		mode	[ integer! ]
		return: [ integer! ]
	]
	;@@ void glfwSetInputMode(GLFWwindow* window, int mode, int value)
	glfwSetInputMode: "glfwSetInputMode"[
	  ;-  Sets an input option for the specified window.
	  ; This function sets an input mode option for the specified window.  The mode
	  ; must be one of `GLFW_CURSOR`, `GLFW_STICKY_KEYS` or
	  ; `GLFW_STICKY_MOUSE_BUTTONS`.
	  ; 
	  ; If the mode is `GLFW_CURSOR`, the value must be one of the following cursor
	  ; modes:
	  ; - `GLFW_CURSOR_NORMAL` makes the cursor visible and behaving normally.
	  ; - `GLFW_CURSOR_HIDDEN` makes the cursor invisible when it is over the client
	  ;   area of the window but does not restrict the cursor from leaving.
	  ; - `GLFW_CURSOR_DISABLED` hides and grabs the cursor, providing virtual
	  ;   and unlimited cursor movement.  This is useful for implementing for
	  ;   example 3D camera controls.
	  ; 
	  ; If the mode is `GLFW_STICKY_KEYS`, the value must be either `GL_TRUE` to
	  ; enable sticky keys, or `GL_FALSE` to disable it.  If sticky keys are
	  ; enabled, a key press will ensure that @ref glfwGetKey returns `GLFW_PRESS`
	  ; the next time it is called even if the key had been released before the
	  ; call.  This is useful when you are only interested in whether keys have been
	  ; pressed but not when or in which order.
	  ; 
	  ; If the mode is `GLFW_STICKY_MOUSE_BUTTONS`, the value must be either
	  ; `GL_TRUE` to enable sticky mouse buttons, or `GL_FALSE` to disable it.  If
	  ; sticky mouse buttons are enabled, a mouse button press will ensure that @ref
	  ; glfwGetMouseButton returns `GLFW_PRESS` the next time it is called even if
	  ; the mouse button had been released before the call.  This is useful when you
	  ; are only interested in whether mouse buttons have been pressed but not when
	  ; or in which order.
	  ; 
	  ; @param[in] window The window whose input mode to set.
	  ; @param[in] mode One of `GLFW_CURSOR`, `GLFW_STICKY_KEYS` or
	  ; `GLFW_STICKY_MOUSE_BUTTONS`.
	  ; @param[in] value The new value of the specified input mode.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa glfwGetInputMode
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwEnable` and `glfwDisable`.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		mode	[ integer! ]
		value	[ integer! ]
	]
	;@@ int glfwGetKey(GLFWwindow* window, int key)
	glfwGetKey: "glfwGetKey"[
	  ;-  Returns the last reported state of a keyboard key for the specified window.
	  ; This function returns the last state reported for the specified key to the
	  ; specified window.  The returned state is one of `GLFW_PRESS` or
	  ; `GLFW_RELEASE`.  The higher-level action `GLFW_REPEAT` is only reported to
	  ; the key callback.
	  ; 
	  ; If the `GLFW_STICKY_KEYS` input mode is enabled, this function returns
	  ; `GLFW_PRESS` the first time you call it for a key that was pressed, even if
	  ; that key has already been released.
	  ; 
	  ; The key functions deal with physical keys, with [key tokens](@ref keys)
	  ; named after their use on the standard US keyboard layout.  If you want to
	  ; input text, use the Unicode character callback instead.
	  ; 
	  ; The [modifier key bit masks](@ref mods) are not key tokens and cannot be
	  ; used with this function.
	  ; 
	  ; @param[in] window The desired window.
	  ; @param[in] key The desired [keyboard key](@ref keys).  `GLFW_KEY_UNKNOWN` is
	  ; not a valid key for this function.
	  ; @return One of `GLFW_PRESS` or `GLFW_RELEASE`.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref input_key
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		key	[ integer! ]
		return: [ integer! ]
	]
	;@@ int glfwGetMouseButton(GLFWwindow* window, int button)
	glfwGetMouseButton: "glfwGetMouseButton"[
	  ;-  Returns the last reported state of a mouse button for the specified window.
	  ; This function returns the last state reported for the specified mouse button
	  ; to the specified window.  The returned state is one of `GLFW_PRESS` or
	  ; `GLFW_RELEASE`.
	  ; 
	  ; If the `GLFW_STICKY_MOUSE_BUTTONS` input mode is enabled, this function
	  ; `GLFW_PRESS` the first time you call it for a mouse button that was pressed,
	  ; even if that mouse button has already been released.
	  ; 
	  ; @param[in] window The desired window.
	  ; @param[in] button The desired [mouse button](@ref buttons).
	  ; @return One of `GLFW_PRESS` or `GLFW_RELEASE`.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref input_mouse_button
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		button	[ integer! ]
		return: [ integer! ]
	]
	;@@ void glfwGetCursorPos(GLFWwindow* window, double* xpos, double* ypos)
	glfwGetCursorPos: "glfwGetCursorPos"[
	  ;-  Retrieves the position of the cursor relative to the client area of the window.
	  ; This function returns the position of the cursor, in screen coordinates,
	  ; relative to the upper-left corner of the client area of the specified
	  ; window.
	  ; 
	  ; If the cursor is disabled (with `GLFW_CURSOR_DISABLED`) then the cursor
	  ; position is unbounded and limited only by the minimum and maximum values of
	  ; a `double`.
	  ; 
	  ; The coordinate can be converted to their integer equivalents with the
	  ; `floor` function.  Casting directly to an integer type works for positive
	  ; coordinates, but fails for negative ones.
	  ; 
	  ; Any or all of the position arguments may be `NULL`.  If an error occurs, all
	  ; non-`NULL` position arguments will be set to zero.
	  ; 
	  ; @param[in] window The desired window.
	  ; @param[out] xpos Where to store the cursor x-coordinate, relative to the
	  ; left edge of the client area, or `NULL`.
	  ; @param[out] ypos Where to store the cursor y-coordinate, relative to the to
	  ; top edge of the client area, or `NULL`.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref cursor_pos
	  ; @sa glfwSetCursorPos
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwGetMousePos`.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		xpos	[ pointer! [float!] ]
		ypos	[ pointer! [float!] ]
	]
	;@@ void glfwSetCursorPos(GLFWwindow* window, double xpos, double ypos)
	glfwSetCursorPos: "glfwSetCursorPos"[
	  ;-  Sets the position of the cursor, relative to the client area of the window.
	  ; This function sets the position, in screen coordinates, of the cursor
	  ; relative to the upper-left corner of the client area of the specified
	  ; window.  The window must have input focus.  If the window does not have
	  ; input focus when this function is called, it fails silently.
	  ; 
	  ; __Do not use this function__ to implement things like camera controls.  GLFW
	  ; already provides the `GLFW_CURSOR_DISABLED` cursor mode that hides the
	  ; cursor, transparently re-centers it and provides unconstrained cursor
	  ; motion.  See @ref glfwSetInputMode for more information.
	  ; 
	  ; If the cursor mode is `GLFW_CURSOR_DISABLED` then the cursor position is
	  ; unconstrained and limited only by the minimum and maximum values of
	  ; a `double`.
	  ; 
	  ; @param[in] window The desired window.
	  ; @param[in] xpos The desired x-coordinate, relative to the left edge of the
	  ; client area.
	  ; @param[in] ypos The desired y-coordinate, relative to the top edge of the
	  ; client area.
	  ; 
	  ; @remarks __X11:__ Due to the asynchronous nature of X11, it may take
	  ; a moment for the window focus event to arrive.  This means you may not be
	  ; able to set the cursor position directly after window creation.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref cursor_pos
	  ; @sa glfwGetCursorPos
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwSetMousePos`.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		xpos	[ float! ]
		ypos	[ float! ]
	]
	;@@ GLFWcursor* glfwCreateCursor(const GLFWimage* image, int xhot, int yhot)
	glfwCreateCursor: "glfwCreateCursor"[
	  ;-  Creates a custom cursor.
	  ; Creates a new custom cursor image that can be set for a window with @ref
	  ; glfwSetCursor.  The cursor can be destroyed with @ref glfwDestroyCursor.
	  ; Any remaining cursors are destroyed by @ref glfwTerminate.
	  ; 
	  ; The pixels are 32-bit, little-endian, non-premultiplied RGBA, i.e. eight
	  ; bits per channel.  They are arranged canonically as packed sequential rows,
	  ; starting from the top-left corner.
	  ; 
	  ; The cursor hotspot is specified in pixels, relative to the upper-left corner
	  ; of the cursor image.  Like all other coordinate systems in GLFW, the X-axis
	  ; points to the right and the Y-axis points down.
	  ; 
	  ; @param[in] image The desired cursor image.
	  ; @param[in] xhot The desired x-coordinate, in pixels, of the cursor hotspot.
	  ; @param[in] yhot The desired y-coordinate, in pixels, of the cursor hotspot.
	  ; 
	  ; @return The handle of the created cursor, or `NULL` if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @par Pointer Lifetime
	  ; The specified image data is copied before this function returns.
	  ; 
	  ; @par Reentrancy
	  ; This function may not be called from a callback.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref cursor_object
	  ; @sa glfwDestroyCursor
	  ; @sa glfwCreateStandardCursor
	  ; 
	  ; @since Added in GLFW 3.1.
	  ; 
	  ; @ingroup input
		image	[ int-ptr! ]
		xhot	[ integer! ]
		yhot	[ integer! ]
		return: [ GLFWcursor! ]
	]
	;@@ GLFWcursor* glfwCreateStandardCursor(int shape)
	glfwCreateStandardCursor: "glfwCreateStandardCursor"[
	  ;-  Creates a cursor with a standard shape.
	  ; Returns a cursor with a [standard shape](@ref shapes), that can be set for
	  ; a window with @ref glfwSetCursor.
	  ; 
	  ; @param[in] shape One of the [standard shapes](@ref shapes).
	  ; 
	  ; @return A new cursor ready to use or `NULL` if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @par Reentrancy
	  ; This function may not be called from a callback.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref cursor_object
	  ; @sa glfwCreateCursor
	  ; 
	  ; @since Added in GLFW 3.1.
	  ; 
	  ; @ingroup input
		shape	[ integer! ]
		return: [ GLFWcursor! ]
	]
	;@@ void glfwDestroyCursor(GLFWcursor* cursor)
	glfwDestroyCursor: "glfwDestroyCursor"[
	  ;-  Destroys a cursor.
	  ; This function destroys a cursor previously created with @ref
	  ; glfwCreateCursor.  Any remaining cursors will be destroyed by @ref
	  ; glfwTerminate.
	  ; 
	  ; @param[in] cursor The cursor object to destroy.
	  ; 
	  ; @par Reentrancy
	  ; This function may not be called from a callback.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref cursor_object
	  ; @sa glfwCreateCursor
	  ; 
	  ; @since Added in GLFW 3.1.
	  ; 
	  ; @ingroup input
		cursor	[ GLFWcursor! ]
	]
	;@@ void glfwSetCursor(GLFWwindow* window, GLFWcursor* cursor)
	glfwSetCursor: "glfwSetCursor"[
	  ;-  Sets the cursor for the window.
	  ; This function sets the cursor image to be used when the cursor is over the
	  ; client area of the specified window.  The set cursor will only be visible
	  ; when the [cursor mode](@ref cursor_mode) of the window is
	  ; `GLFW_CURSOR_NORMAL`.
	  ; 
	  ; On some platforms, the set cursor may not be visible unless the window also
	  ; has input focus.
	  ; 
	  ; @param[in] window The window to set the cursor for.
	  ; @param[in] cursor The cursor to set, or `NULL` to switch back to the default
	  ; arrow cursor.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref cursor_object
	  ; 
	  ; @since Added in GLFW 3.1.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		cursor	[ GLFWcursor! ]
	]
	;@@ GLFWkeyfun glfwSetKeyCallback(GLFWwindow* window, GLFWkeyfun cbfun)
	glfwSetKeyCallback: "glfwSetKeyCallback"[
	  ;-  Sets the key callback.
	  ; This function sets the key callback of the specified window, which is called
	  ; when a key is pressed, repeated or released.
	  ; 
	  ; The key functions deal with physical keys, with layout independent
	  ; [key tokens](@ref keys) named after their values in the standard US keyboard
	  ; layout.  If you want to input text, use the
	  ; [character callback](@ref glfwSetCharCallback) instead.
	  ; 
	  ; When a window loses input focus, it will generate synthetic key release
	  ; events for all pressed keys.  You can tell these events from user-generated
	  ; events by the fact that the synthetic ones are generated after the focus
	  ; loss event has been processed, i.e. after the
	  ; [window focus callback](@ref glfwSetWindowFocusCallback) has been called.
	  ; 
	  ; The scancode of a key is specific to that platform or sometimes even to that
	  ; machine.  Scancodes are intended to allow users to bind keys that don't have
	  ; a GLFW key token.  Such keys have `key` set to `GLFW_KEY_UNKNOWN`, their
	  ; state is not saved and so it cannot be queried with @ref glfwGetKey.
	  ; 
	  ; Sometimes GLFW needs to generate synthetic key events, in which case the
	  ; scancode may be zero.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new key callback, or `NULL` to remove the currently
	  ; set callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref input_key
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.  Updated callback signature.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		cbfun	[ GLFWkeyfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWcharfun glfwSetCharCallback(GLFWwindow* window, GLFWcharfun cbfun)
	glfwSetCharCallback: "glfwSetCharCallback"[
	  ;-  Sets the Unicode character callback.
	  ; This function sets the character callback of the specified window, which is
	  ; called when a Unicode character is input.
	  ; 
	  ; The character callback is intended for Unicode text input.  As it deals with
	  ; characters, it is keyboard layout dependent, whereas the
	  ; [key callback](@ref glfwSetKeyCallback) is not.  Characters do not map 1:1
	  ; to physical keys, as a key may produce zero, one or more characters.  If you
	  ; want to know whether a specific physical key was pressed or released, see
	  ; the key callback instead.
	  ; 
	  ; The character callback behaves as system text input normally does and will
	  ; not be called if modifier keys are held down that would prevent normal text
	  ; input on that platform, for example a Super (Command) key on OS X or Alt key
	  ; on Windows.  There is a
	  ; [character with modifiers callback](@ref glfwSetCharModsCallback) that
	  ; receives these events.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref input_char
	  ; 
	  ; @since Added in GLFW 2.4.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.  Updated callback signature.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		cbfun	[ GLFWcharfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWcharmodsfun glfwSetCharModsCallback(GLFWwindow* window, GLFWcharmodsfun cbfun)
	glfwSetCharModsCallback: "glfwSetCharModsCallback"[
	  ;-  Sets the Unicode character with modifiers callback.
	  ; This function sets the character with modifiers callback of the specified
	  ; window, which is called when a Unicode character is input regardless of what
	  ; modifier keys are used.
	  ; 
	  ; The character with modifiers callback is intended for implementing custom
	  ; Unicode character input.  For regular Unicode text input, see the
	  ; [character callback](@ref glfwSetCharCallback).  Like the character
	  ; callback, the character with modifiers callback deals with characters and is
	  ; keyboard layout dependent.  Characters do not map 1:1 to physical keys, as
	  ; a key may produce zero, one or more characters.  If you want to know whether
	  ; a specific physical key was pressed or released, see the
	  ; [key callback](@ref glfwSetKeyCallback) instead.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or an
	  ; error occurred.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref input_char
	  ; 
	  ; @since Added in GLFW 3.1.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		cbfun	[ GLFWcharmodsfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow* window, GLFWmousebuttonfun cbfun)
	glfwSetMouseButtonCallback: "glfwSetMouseButtonCallback"[
	  ;-  Sets the mouse button callback.
	  ; This function sets the mouse button callback of the specified window, which
	  ; is called when a mouse button is pressed or released.
	  ; 
	  ; When a window loses input focus, it will generate synthetic mouse button
	  ; release events for all pressed mouse buttons.  You can tell these events
	  ; from user-generated events by the fact that the synthetic ones are generated
	  ; after the focus loss event has been processed, i.e. after the
	  ; [window focus callback](@ref glfwSetWindowFocusCallback) has been called.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref input_mouse_button
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.  Updated callback signature.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		cbfun	[ GLFWmousebuttonfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow* window, GLFWcursorposfun cbfun)
	glfwSetCursorPosCallback: "glfwSetCursorPosCallback"[
	  ;-  Sets the cursor position callback.
	  ; This function sets the cursor position callback of the specified window,
	  ; which is called when the cursor is moved.  The callback is provided with the
	  ; position, in screen coordinates, relative to the upper-left corner of the
	  ; client area of the window.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref cursor_pos
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwSetMousePosCallback`.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		cbfun	[ GLFWcursorposfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow* window, GLFWcursorenterfun cbfun)
	glfwSetCursorEnterCallback: "glfwSetCursorEnterCallback"[
	  ;-  Sets the cursor enter/exit callback.
	  ; This function sets the cursor boundary crossing callback of the specified
	  ; window, which is called when the cursor enters or leaves the client area of
	  ; the window.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new callback, or `NULL` to remove the currently set
	  ; callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref cursor_enter
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		cbfun	[ GLFWcursorenterfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWscrollfun glfwSetScrollCallback(GLFWwindow* window, GLFWscrollfun cbfun)
	glfwSetScrollCallback: "glfwSetScrollCallback"[
	  ;-  Sets the scroll callback.
	  ; This function sets the scroll callback of the specified window, which is
	  ; called when a scrolling device is used, such as a mouse wheel or scrolling
	  ; area of a touchpad.
	  ; 
	  ; The scroll callback receives all scrolling input, like that from a mouse
	  ; wheel or a touchpad scrolling area.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new scroll callback, or `NULL` to remove the currently
	  ; set callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref scrolling
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwSetMouseWheelCallback`.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		cbfun	[ GLFWscrollfun! ]
		return: [ int-ptr! ]
	]
	;@@ GLFWdropfun glfwSetDropCallback(GLFWwindow* window, GLFWdropfun cbfun)
	glfwSetDropCallback: "glfwSetDropCallback"[
	  ;-  Sets the file drop callback.
	  ; This function sets the file drop callback of the specified window, which is
	  ; called when one or more dragged files are dropped on the window.
	  ; 
	  ; Because the path array and its strings may have been generated specifically
	  ; for that event, they are not guaranteed to be valid after the callback has
	  ; returned.  If you wish to use them after the callback returns, you need to
	  ; make a deep copy.
	  ; 
	  ; @param[in] window The window whose callback to set.
	  ; @param[in] cbfun The new file drop callback, or `NULL` to remove the
	  ; currently set callback.
	  ; @return The previously set callback, or `NULL` if no callback was set or the
	  ; library had not been [initialized](@ref intro_init).
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref path_drop
	  ; 
	  ; @since Added in GLFW 3.1.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		cbfun	[ GLFWdropfun! ]
		return: [ int-ptr! ]
	]
	;@@ int glfwJoystickPresent(int joy)
	glfwJoystickPresent: "glfwJoystickPresent"[
	  ;-  Returns whether the specified joystick is present.
	  ; This function returns whether the specified joystick is present.
	  ; 
	  ; @param[in] joy The [joystick](@ref joysticks) to query.
	  ; @return `GL_TRUE` if the joystick is present, or `GL_FALSE` otherwise.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref joystick
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwGetJoystickParam`.
	  ; 
	  ; @ingroup input
		joy	[ integer! ]
		return: [ integer! ]
	]
	;@@ float* glfwGetJoystickAxes(int joy, int* count)
	glfwGetJoystickAxes: "glfwGetJoystickAxes"[
	  ;-  Returns the values of all axes of the specified joystick.
	  ; This function returns the values of all axes of the specified joystick.
	  ; Each element in the array is a value between -1.0 and 1.0.
	  ; 
	  ; @param[in] joy The [joystick](@ref joysticks) to query.
	  ; @param[out] count Where to store the number of axis values in the returned
	  ; array.  This is set to zero if an error occurred.
	  ; @return An array of axis values, or `NULL` if the joystick is not present.
	  ; 
	  ; @par Pointer Lifetime
	  ; The returned array is allocated and freed by GLFW.  You should not free it
	  ; yourself.  It is valid until the specified joystick is disconnected, this
	  ; function is called again for that joystick or the library is terminated.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref joystick_axis
	  ; 
	  ; @since Added in GLFW 3.0.  Replaces `glfwGetJoystickPos`.
	  ; 
	  ; @ingroup input
		joy	[ integer! ]
		count	[ int-ptr! ]
		return: [ pointer! [float32!] ]
	]
	;@@ char* glfwGetJoystickName(int joy)
	glfwGetJoystickName: "glfwGetJoystickName"[
	  ;-  Returns the name of the specified joystick.
	  ; This function returns the name, encoded as UTF-8, of the specified joystick.
	  ; The returned string is allocated and freed by GLFW.  You should not free it
	  ; yourself.
	  ; 
	  ; @param[in] joy The [joystick](@ref joysticks) to query.
	  ; @return The UTF-8 encoded name of the joystick, or `NULL` if the joystick
	  ; is not present.
	  ; 
	  ; @par Pointer Lifetime
	  ; The returned string is allocated and freed by GLFW.  You should not free it
	  ; yourself.  It is valid until the specified joystick is disconnected, this
	  ; function is called again for that joystick or the library is terminated.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref joystick_name
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup input
		joy	[ integer! ]
		return: [ c-string! ]
	]
	;@@ void glfwSetClipboardString(GLFWwindow* window, const char* string)
	glfwSetClipboardString: "glfwSetClipboardString"[
	  ;-  Sets the clipboard to the specified string.
	  ; This function sets the system clipboard to the specified, UTF-8 encoded
	  ; string.
	  ; 
	  ; @param[in] window The window that will own the clipboard contents.
	  ; @param[in] string A UTF-8 encoded string.
	  ; 
	  ; @par Pointer Lifetime
	  ; The specified string is copied before this function returns.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref clipboard
	  ; @sa glfwGetClipboardString
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		string	[ c-string! ]
	]
	;@@ char* glfwGetClipboardString(GLFWwindow* window)
	glfwGetClipboardString: "glfwGetClipboardString"[
	  ;-  Returns the contents of the clipboard as a string.
	  ; This function returns the contents of the system clipboard, if it contains
	  ; or is convertible to a UTF-8 encoded string.  If the clipboard is empty or
	  ; if its contents cannot be converted, `NULL` is returned and a @ref
	  ; GLFW_FORMAT_UNAVAILABLE error is generated.
	  ; 
	  ; @param[in] window The window that will request the clipboard contents.
	  ; @return The contents of the clipboard as a UTF-8 encoded string, or `NULL`
	  ; if an [error](@ref error_handling) occurred.
	  ; 
	  ; @par Pointer Lifetime
	  ; The returned string is allocated and freed by GLFW.  You should not free it
	  ; yourself.  It is valid until the next call to @ref
	  ; glfwGetClipboardString or @ref glfwSetClipboardString, or until the library
	  ; is terminated.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref clipboard
	  ; @sa glfwSetClipboardString
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup input
		window	[ GLFWwindow! ]
		return: [ c-string! ]
	]
	;@@ double glfwGetTime(void)
	glfwGetTime: "glfwGetTime"[
	  ;-  Returns the value of the GLFW timer.
	  ; This function returns the value of the GLFW timer.  Unless the timer has
	  ; been set using @ref glfwSetTime, the timer measures time elapsed since GLFW
	  ; was initialized.
	  ; 
	  ; The resolution of the timer is system dependent, but is usually on the order
	  ; of a few micro- or nanoseconds.  It uses the highest-resolution monotonic
	  ; time source on each supported platform.
	  ; 
	  ; @return The current value, in seconds, or zero if an
	  ; [error](@ref error_handling) occurred.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.  Access is not synchronized.
	  ; 
	  ; @sa @ref time
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @ingroup input
		return: [ float! ]
	]
	;@@ void glfwSetTime(double time)
	glfwSetTime: "glfwSetTime"[
	  ;-  Sets the GLFW timer.
	  ; This function sets the value of the GLFW timer.  It then continues to count
	  ; up from that value.  The value must be a positive finite number less than
	  ; or equal to 18446744073.0, which is approximately 584.5 years.
	  ; 
	  ; @param[in] time The new value, in seconds.
	  ; 
	  ; @remarks The upper limit of the timer is calculated as
	  ; floor((2<sup>64</sup> - 1) / 10<sup>9</sup>) and is due to implementations
	  ; storing nanoseconds in 64 bits.  The limit may be increased in the future.
	  ; 
	  ; @par Thread Safety
	  ; This function may only be called from the main thread.
	  ; 
	  ; @sa @ref time
	  ; 
	  ; @since Added in GLFW 2.2.
	  ; 
	  ; @ingroup input
		time	[ float! ]
	]
	;@@ void glfwMakeContextCurrent(GLFWwindow* window)
	glfwMakeContextCurrent: "glfwMakeContextCurrent"[
	  ;-  Makes the context of the specified window current for the calling thread.
	  ; This function makes the OpenGL or OpenGL ES context of the specified window
	  ; current on the calling thread.  A context can only be made current on
	  ; a single thread at a time and each thread can have only a single current
	  ; context at a time.
	  ; 
	  ; By default, making a context non-current implicitly forces a pipeline flush.
	  ; On machines that support `GL_KHR_context_flush_control`, you can control
	  ; whether a context performs this flush by setting the
	  ; [GLFW_CONTEXT_RELEASE_BEHAVIOR](@ref window_hints_ctx) window hint.
	  ; 
	  ; @param[in] window The window whose context to make current, or `NULL` to
	  ; detach the current context.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.
	  ; 
	  ; @sa @ref context_current
	  ; @sa glfwGetCurrentContext
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup context
		window	[ GLFWwindow! ]
	]
	;@@ GLFWwindow* glfwGetCurrentContext(void)
	glfwGetCurrentContext: "glfwGetCurrentContext"[
	  ;-  Returns the window whose context is current on the calling thread.
	  ; This function returns the window whose OpenGL or OpenGL ES context is
	  ; current on the calling thread.
	  ; 
	  ; @return The window whose context is current, or `NULL` if no window's
	  ; context is current.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.
	  ; 
	  ; @sa @ref context_current
	  ; @sa glfwMakeContextCurrent
	  ; 
	  ; @since Added in GLFW 3.0.
	  ; 
	  ; @ingroup context
		return: [ GLFWwindow! ]
	]
	;@@ void glfwSwapBuffers(GLFWwindow* window)
	glfwSwapBuffers: "glfwSwapBuffers"[
	  ;-  Swaps the front and back buffers of the specified window.
	  ; This function swaps the front and back buffers of the specified window.  If
	  ; the swap interval is greater than zero, the GPU driver waits the specified
	  ; number of screen updates before swapping the buffers.
	  ; 
	  ; @param[in] window The window whose buffers to swap.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.
	  ; 
	  ; @sa @ref buffer_swap
	  ; @sa glfwSwapInterval
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @par
	  ; __GLFW 3:__ Added window handle parameter.
	  ; 
	  ; @ingroup window
		window	[ GLFWwindow! ]
	]
	;@@ void glfwSwapInterval(int interval)
	glfwSwapInterval: "glfwSwapInterval"[
	  ;-  Sets the swap interval for the current context.
	  ; This function sets the swap interval for the current context, i.e. the
	  ; number of screen updates to wait from the time @ref glfwSwapBuffers was
	  ; called before swapping the buffers and returning.  This is sometimes called
	  ; _vertical synchronization_, _vertical retrace synchronization_ or just
	  ; _vsync_.
	  ; 
	  ; Contexts that support either of the `WGL_EXT_swap_control_tear` and
	  ; `GLX_EXT_swap_control_tear` extensions also accept negative swap intervals,
	  ; which allow the driver to swap even if a frame arrives a little bit late.
	  ; You can check for the presence of these extensions using @ref
	  ; glfwExtensionSupported.  For more information about swap tearing, see the
	  ; extension specifications.
	  ; 
	  ; A context must be current on the calling thread.  Calling this function
	  ; without a current context will cause a @ref GLFW_NO_CURRENT_CONTEXT error.
	  ; 
	  ; @param[in] interval The minimum number of screen updates to wait for
	  ; until the buffers are swapped by @ref glfwSwapBuffers.
	  ; 
	  ; @remarks This function is not called during context creation, leaving the
	  ; swap interval set to whatever is the default on that platform.  This is done
	  ; because some swap interval extensions used by GLFW do not allow the swap
	  ; interval to be reset to zero once it has been set to a non-zero value.
	  ; 
	  ; @remarks Some GPU drivers do not honor the requested swap interval, either
	  ; because of a user setting that overrides the application's request or due to
	  ; bugs in the driver.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.
	  ; 
	  ; @sa @ref buffer_swap
	  ; @sa glfwSwapBuffers
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @ingroup context
		interval	[ integer! ]
	]
	;@@ int glfwExtensionSupported(const char* extension)
	glfwExtensionSupported: "glfwExtensionSupported"[
	  ;-  Returns whether the specified extension is available.
	  ; This function returns whether the specified
	  ; [client API extension](@ref context_glext) is supported by the current
	  ; OpenGL or OpenGL ES context.  It searches both for OpenGL and OpenGL ES
	  ; extension and platform-specific context creation API extensions.
	  ; 
	  ; A context must be current on the calling thread.  Calling this function
	  ; without a current context will cause a @ref GLFW_NO_CURRENT_CONTEXT error.
	  ; 
	  ; As this functions retrieves and searches one or more extension strings each
	  ; call, it is recommended that you cache its results if it is going to be used
	  ; frequently.  The extension strings will not change during the lifetime of
	  ; a context, so there is no danger in doing this.
	  ; 
	  ; @param[in] extension The ASCII encoded name of the extension.
	  ; @return `GL_TRUE` if the extension is available, or `GL_FALSE` otherwise.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.
	  ; 
	  ; @sa @ref context_glext
	  ; @sa glfwGetProcAddress
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @ingroup context
		extension	[ c-string! ]
		return: [ integer! ]
	]
	;@@ GLFWglproc glfwGetProcAddress(const char* procname)
	glfwGetProcAddress: "glfwGetProcAddress"[
	  ;-  Returns the address of the specified function for the current context.
	  ; This function returns the address of the specified
	  ; [core or extension function](@ref context_glext), if it is supported
	  ; by the current context.
	  ; 
	  ; A context must be current on the calling thread.  Calling this function
	  ; without a current context will cause a @ref GLFW_NO_CURRENT_CONTEXT error.
	  ; 
	  ; @param[in] procname The ASCII encoded name of the function.
	  ; @return The address of the function, or `NULL` if an [error](@ref
	  ; error_handling) occurred.
	  ; 
	  ; @remarks The address of a given function is not guaranteed to be the same
	  ; between contexts.
	  ; 
	  ; @remarks This function may return a non-`NULL` address despite the
	  ; associated version or extension not being available.  Always check the
	  ; context version or extension string first.
	  ; 
	  ; @par Pointer Lifetime
	  ; The returned function pointer is valid until the context is destroyed or the
	  ; library is terminated.
	  ; 
	  ; @par Thread Safety
	  ; This function may be called from any thread.
	  ; 
	  ; @sa @ref context_glext
	  ; @sa glfwExtensionSupported
	  ; 
	  ; @since Added in GLFW 1.0.
	  ; 
	  ; @ingroup context
		procname	[ c-string! ]
		return: [ int-ptr! ]
	]
]]
