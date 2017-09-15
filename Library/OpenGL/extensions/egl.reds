Red/System [
	Title:   "Red/System OpenGL binding - EGL - Khronos Native Platform Graphics Interface"
	Author:  "Oldes"
	File: 	 %egl.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
This source was made from eglew.h file, which contains these copyrights:

/*
** The OpenGL Extension Wrangler Library
** Copyright (C) 2008-2017, Nigel Stewart <nigels[]users sourceforge net>
** Copyright (C) 2002-2008, Milan Ikits <milan ikits[]ieee org>
** Copyright (C) 2002-2008, Marcelo E. Magallon <mmagallo[]debian org>
** Copyright (C) 2002, Lev Povalahev
** All rights reserved.
** 
** Redistribution and use in source and binary forms, with or without 
** modification, are permitted provided that the following conditions are met:
** 
** * Redistributions of source code must retain the above copyright notice, 
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice, 
**   this list of conditions and the following disclaimer in the documentation 
**   and/or other materials provided with the distribution.
** * The name of the author may be used to endorse or promote products 
**   derived from this software without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
** IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
** ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
** LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
** CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
** SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
** INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
** CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
** THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
 * Mesa 3-D graphics library
 * Version:  7.0
 *
 * Copyright (C) 1999-2007  Brian Paul   All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * BRIAN PAUL BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/*
** Copyright (c) 2007 The Khronos Group Inc.
** 
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
** 
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
** 
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*/
	}
]

;--> content of this file makes sense only on Android (or something else too?) <--

#if OS = 'Android  [

#define EGLAttrib!                      handle!
#define EGLAttrib-ptr!                  handle-ptr!
#define EGLAttribKHR-ptr!               handle-ptr!
#define EGLBoolean!                     logic!
#define EGLBoolean-ptr!                 logic-ptr!
#define EGLClientBuffer!                handle!
#define EGLConfig!                      handle!
#define EGLConfig-ptr!                  handle-ptr!
#define EGLContext!                     handle!
#define EGLDEBUGPROCKHR!                handle!
#define EGLDeviceEXT!                   handle!
#define EGLDeviceEXT-ptr!               handle-ptr!
#define EGLDisplay!                     handle!
#define EGLenum!                        integer!
#define EGLGetBlobFuncANDROID!          handle!
#define EGLImage!                       handle!
#define EGLImageKHR!                    handle!
#define EGLint!                         integer!
#define EGLint-ptr!                     int-ptr!
#define EGLLabelKHR!                    handle!
#define EGLNativeDisplayType!           handle!
#define EGLNativeDisplayType-ptr!       handle-ptr!
#define EGLNativeFileDescriptorKHR!     handle!
#define EGLNativePixmapType!            handle!
#define EGLNativePixmapType-ptr!        handle-ptr!
#define EGLNativeWindowType!            handle!
#define EGLNativeWindowType-ptr!        handle-ptr!
#define EGLnsecsANDROID!                handle!
#define EGLObjectKHR!                   handle!
#define EGLOutputLayerEXT!              handle!
#define EGLOutputLayerEXT-ptr!          handle-ptr!
#define EGLOutputPortEXT!               handle!
#define EGLOutputPortEXT-ptr!           handle-ptr!
#define EGLSetBlobFuncANDROID!          handle!
#define EGLStreamKHR!                   handle!
#define EGLSurface!                     handle!
#define EGLSync!                        handle!
#define EGLSyncKHR!                     handle!
#define EGLSyncNV!                      handle!
#define EGLTime!                        uint64-value!
#define EGLTimeKHR!                     uint64-value!
#define EGLTimeKHR-ptr!                 uint64-ptr!
#define EGLTimeNV!                      uint64-value!
#define EGLuint64KHR-ptr!               uint64-ptr!
#define EGLuint64NV!                    uint64-value!

EGLClientPixmapHI!: alias struct! [
    data   [byte-ptr!]
    width  [integer!]
    height [integer!]
    stride [integer!]
]



#define  EGL_DONT_CARE                                              -1
#define  EGL_NO_CONTEXT                                             [as EGLContext! 0]
#define  EGL_NO_DISPLAY                                             [as EGLDisplay! 0]
#define  EGL_NO_IMAGE                                               [as EGLImage!   0]
#define  EGL_NO_SURFACE                                             [as EGLSurface! 0]
#define  EGL_NO_SYNC                                                [as EGLSync!    0]
#define  EGL_UNKNOWN                                                [as EGLint!    -1]
#define  EGL_DEFAULT_DISPLAY                                        [as EGLNativeDisplayType! 0]
		;-------------------------------------------
;-- EGL_VERSION_1_0
;-------------------------------------------

#define  EGL_VERSION_1_0                              1
#define  EGL_FALSE                                    0
#define  EGL_PBUFFER_BIT                              0001h
#define  EGL_TRUE                                     1
#define  EGL_PIXMAP_BIT                               0002h
#define  EGL_WINDOW_BIT                               0004h
#define  EGL_SUCCESS                                  3000h
#define  EGL_NOT_INITIALIZED                          3001h
#define  EGL_BAD_ACCESS                               3002h
#define  EGL_BAD_ALLOC                                3003h
#define  EGL_BAD_ATTRIBUTE                            3004h
#define  EGL_BAD_CONFIG                               3005h
#define  EGL_BAD_CONTEXT                              3006h
#define  EGL_BAD_CURRENT_SURFACE                      3007h
#define  EGL_BAD_DISPLAY                              3008h
#define  EGL_BAD_MATCH                                3009h
#define  EGL_BAD_NATIVE_PIXMAP                        300Ah
#define  EGL_BAD_NATIVE_WINDOW                        300Bh
#define  EGL_BAD_PARAMETER                            300Ch
#define  EGL_BAD_SURFACE                              300Dh
#define  EGL_BUFFER_SIZE                              3020h
#define  EGL_ALPHA_SIZE                               3021h
#define  EGL_BLUE_SIZE                                3022h
#define  EGL_GREEN_SIZE                               3023h
#define  EGL_RED_SIZE                                 3024h
#define  EGL_DEPTH_SIZE                               3025h
#define  EGL_STENCIL_SIZE                             3026h
#define  EGL_CONFIG_CAVEAT                            3027h
#define  EGL_CONFIG_ID                                3028h
#define  EGL_LEVEL                                    3029h
#define  EGL_MAX_PBUFFER_HEIGHT                       302Ah
#define  EGL_MAX_PBUFFER_PIXELS                       302Bh
#define  EGL_MAX_PBUFFER_WIDTH                        302Ch
#define  EGL_NATIVE_RENDERABLE                        302Dh
#define  EGL_NATIVE_VISUAL_ID                         302Eh
#define  EGL_NATIVE_VISUAL_TYPE                       302Fh
#define  EGL_SAMPLES                                  3031h
#define  EGL_SAMPLE_BUFFERS                           3032h
#define  EGL_SURFACE_TYPE                             3033h
#define  EGL_TRANSPARENT_TYPE                         3034h
#define  EGL_TRANSPARENT_BLUE_VALUE                   3035h
#define  EGL_TRANSPARENT_GREEN_VALUE                  3036h
#define  EGL_TRANSPARENT_RED_VALUE                    3037h
#define  EGL_NONE                                     3038h
#define  EGL_SLOW_CONFIG                              3050h
#define  EGL_NON_CONFORMANT_CONFIG                    3051h
#define  EGL_TRANSPARENT_RGB                          3052h
#define  EGL_VENDOR                                   3053h
#define  EGL_VERSION                                  3054h
#define  EGL_EXTENSIONS                               3055h
#define  EGL_HEIGHT                                   3056h
#define  EGL_WIDTH                                    3057h
#define  EGL_LARGEST_PBUFFER                          3058h
#define  EGL_DRAW                                     3059h
#define  EGL_READ                                     305Ah
#define  EGL_CORE_NATIVE_ENGINE                       305Bh
eglChooseConfig!: alias function! [
	dpy         [ EGLDisplay! ]
	attrib_list [ EGLint-ptr! ]
	configs     [ EGLConfig-ptr! ]
	config_size [ EGLint! ]
	num_config  [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglCopyBuffers!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	target  [ EGLNativePixmapType! ]
	return: [ EGLBoolean! ]
]
eglCreateContext!: alias function! [
	dpy           [ EGLDisplay! ]
	config        [ EGLConfig! ]
	share_context [ EGLContext! ]
	attrib_list   [ EGLint-ptr! ]
	return: [ EGLContext! ]
]
eglCreatePbufferSurface!: alias function! [
	dpy         [ EGLDisplay! ]
	config      [ EGLConfig! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLSurface! ]
]
eglCreatePixmapSurface!: alias function! [
	dpy         [ EGLDisplay! ]
	config      [ EGLConfig! ]
	pixmap      [ EGLNativePixmapType! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLSurface! ]
]
eglCreateWindowSurface!: alias function! [
	dpy         [ EGLDisplay! ]
	config      [ EGLConfig! ]
	win         [ EGLNativeWindowType! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLSurface! ]
]
eglDestroyContext!: alias function! [
	dpy     [ EGLDisplay! ]
	ctx     [ EGLContext! ]
	return: [ EGLBoolean! ]
]
eglDestroySurface!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	return: [ EGLBoolean! ]
]
eglGetConfigAttrib!: alias function! [
	dpy       [ EGLDisplay! ]
	config    [ EGLConfig! ]
	attribute [ EGLint! ]
	value     [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglGetConfigs!: alias function! [
	dpy         [ EGLDisplay! ]
	configs     [ EGLConfig-ptr! ]
	config_size [ EGLint! ]
	num_config  [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglGetCurrentDisplay!: alias function! [
	return: [ EGLDisplay! ]
]
eglGetCurrentSurface!: alias function! [
	readdraw [ EGLint! ]
	return: [ EGLSurface! ]
]
eglGetDisplay!: alias function! [
	display_id [ EGLNativeDisplayType! ]
	return: [ EGLDisplay! ]
]
eglGetError!: alias function! [
	return: [ EGLint! ]
]
eglInitialize!: alias function! [
	dpy     [ EGLDisplay! ]
	major   [ EGLint-ptr! ]
	minor   [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglMakeCurrent!: alias function! [
	dpy     [ EGLDisplay! ]
	draw    [ EGLSurface! ]
	read    [ EGLSurface! ]
	ctx     [ EGLContext! ]
	return: [ EGLBoolean! ]
]
eglQueryContext!: alias function! [
	dpy       [ EGLDisplay! ]
	ctx       [ EGLContext! ]
	attribute [ EGLint! ]
	value     [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglQueryString!: alias function! [
	dpy     [ EGLDisplay! ]
	name    [ EGLint! ]
	return: [ c-string! ]
]
eglQuerySurface!: alias function! [
	dpy       [ EGLDisplay! ]
	surface   [ EGLSurface! ]
	attribute [ EGLint! ]
	value     [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglSwapBuffers!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	return: [ EGLBoolean! ]
]
eglTerminate!: alias function! [
	dpy     [ EGLDisplay! ]
	return: [ EGLBoolean! ]
]
eglWaitGL!: alias function! [
	return: [ EGLBoolean! ]
]
eglWaitNative!: alias function! [
	engine  [ EGLint! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_VERSION_1_1
;-------------------------------------------

#define  EGL_VERSION_1_1                              1
#define  EGL_CONTEXT_LOST                             300Eh
#define  EGL_BIND_TO_TEXTURE_RGB                      3039h
#define  EGL_BIND_TO_TEXTURE_RGBA                     303Ah
#define  EGL_MIN_SWAP_INTERVAL                        303Bh
#define  EGL_MAX_SWAP_INTERVAL                        303Ch
#define  EGL_NO_TEXTURE                               305Ch
#define  EGL_TEXTURE_RGB                              305Dh
#define  EGL_TEXTURE_RGBA                             305Eh
#define  EGL_TEXTURE_2D                               305Fh
#define  EGL_TEXTURE_FORMAT                           3080h
#define  EGL_TEXTURE_TARGET                           3081h
#define  EGL_MIPMAP_TEXTURE                           3082h
#define  EGL_MIPMAP_LEVEL                             3083h
#define  EGL_BACK_BUFFER                              3084h
eglBindTexImage!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	buffer  [ EGLint! ]
	return: [ EGLBoolean! ]
]
eglReleaseTexImage!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	buffer  [ EGLint! ]
	return: [ EGLBoolean! ]
]
eglSurfaceAttrib!: alias function! [
	dpy       [ EGLDisplay! ]
	surface   [ EGLSurface! ]
	attribute [ EGLint! ]
	value     [ EGLint! ]
	return: [ EGLBoolean! ]
]
eglSwapInterval!: alias function! [
	dpy      [ EGLDisplay! ]
	interval [ EGLint! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_VERSION_1_2
;-------------------------------------------

#define  EGL_VERSION_1_2                              1
#define  EGL_OPENGL_ES_BIT                            0001h
#define  EGL_OPENVG_BIT                               0002h
#define  EGL_LUMINANCE_SIZE                           303Dh
#define  EGL_ALPHA_MASK_SIZE                          303Eh
#define  EGL_COLOR_BUFFER_TYPE                        303Fh
#define  EGL_RENDERABLE_TYPE                          3040h
#define  EGL_SINGLE_BUFFER                            3085h
#define  EGL_RENDER_BUFFER                            3086h
#define  EGL_COLORSPACE                               3087h
#define  EGL_ALPHA_FORMAT                             3088h
#define  EGL_COLORSPACE_LINEAR                        308Ah
#define  EGL_ALPHA_FORMAT_NONPRE                      308Bh
#define  EGL_ALPHA_FORMAT_PRE                         308Ch
#define  EGL_CLIENT_APIS                              308Dh
#define  EGL_RGB_BUFFER                               308Eh
#define  EGL_LUMINANCE_BUFFER                         308Fh
#define  EGL_HORIZONTAL_RESOLUTION                    3090h
#define  EGL_VERTICAL_RESOLUTION                      3091h
#define  EGL_PIXEL_ASPECT_RATIO                       3092h
#define  EGL_SWAP_BEHAVIOR                            3093h
#define  EGL_BUFFER_PRESERVED                         3094h
#define  EGL_BUFFER_DESTROYED                         3095h
#define  EGL_OPENVG_IMAGE                             3096h
#define  EGL_CONTEXT_CLIENT_TYPE                      3097h
#define  EGL_OPENGL_ES_API                            30A0h
#define  EGL_OPENVG_API                               30A1h
#define  EGL_DISPLAY_SCALING                          10000
eglBindAPI!: alias function! [
	api     [ EGLenum! ]
	return: [ EGLBoolean! ]
]
eglCreatePbufferFromClientBuffer!: alias function! [
	dpy         [ EGLDisplay! ]
	buftype     [ EGLenum! ]
	buffer      [ EGLClientBuffer! ]
	config      [ EGLConfig! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLSurface! ]
]
eglQueryAPI!: alias function! [
	return: [ EGLenum! ]
]
eglReleaseThread!: alias function! [
	return: [ EGLBoolean! ]
]
eglWaitClient!: alias function! [
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_VERSION_1_3
;-------------------------------------------

#define  EGL_VERSION_1_3                              1
#define  EGL_OPENGL_ES2_BIT                           0004h
#define  EGL_VG_COLORSPACE_LINEAR_BIT                 0020h
#define  EGL_VG_ALPHA_FORMAT_PRE_BIT                  0040h
#define  EGL_MATCH_NATIVE_PIXMAP                      3041h
#define  EGL_CONFORMANT                               3042h
#define  EGL_VG_COLORSPACE                            3087h
#define  EGL_VG_ALPHA_FORMAT                          3088h
#define  EGL_VG_COLORSPACE_LINEAR                     308Ah
#define  EGL_VG_ALPHA_FORMAT_NONPRE                   308Bh
#define  EGL_VG_ALPHA_FORMAT_PRE                      308Ch
#define  EGL_CONTEXT_CLIENT_VERSION                   3098h


;-------------------------------------------
;-- EGL_VERSION_1_4
;-------------------------------------------

#define  EGL_VERSION_1_4                              1
#define  EGL_OPENGL_BIT                               0008h
#define  EGL_MULTISAMPLE_RESOLVE_BOX_BIT              0200h
#define  EGL_SWAP_BEHAVIOR_PRESERVED_BIT              0400h
#define  EGL_MULTISAMPLE_RESOLVE                      3099h
#define  EGL_MULTISAMPLE_RESOLVE_DEFAULT              309Ah
#define  EGL_MULTISAMPLE_RESOLVE_BOX                  309Bh
#define  EGL_OPENGL_API                               30A2h
eglGetCurrentContext!: alias function! [
	return: [ EGLContext! ]
]


;-------------------------------------------
;-- EGL_VERSION_1_5
;-------------------------------------------

#define  EGL_VERSION_1_5                              1
#define  EGL_CONTEXT_OPENGL_CORE_PROFILE_BIT          00000001h
#define  EGL_SYNC_FLUSH_COMMANDS_BIT                  0001h
#define  EGL_CONTEXT_OPENGL_COMPATIBILITY_PROFILE_BIT  00000002h
#define  EGL_OPENGL_ES3_BIT                           00000040h
#define  EGL_GL_COLORSPACE_SRGB                       3089h
#define  EGL_GL_COLORSPACE_LINEAR                     308Ah
#define  EGL_CONTEXT_MAJOR_VERSION                    3098h
#define  EGL_CL_EVENT_HANDLE                          309Ch
#define  EGL_GL_COLORSPACE                            309Dh
#define  EGL_GL_TEXTURE_2D                            30B1h
#define  EGL_GL_TEXTURE_3D                            30B2h
#define  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_X           30B3h
#define  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_X           30B4h
#define  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Y           30B5h
#define  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Y           30B6h
#define  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Z           30B7h
#define  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Z           30B8h
#define  EGL_GL_RENDERBUFFER                          30B9h
#define  EGL_GL_TEXTURE_LEVEL                         30BCh
#define  EGL_GL_TEXTURE_ZOFFSET                       30BDh
#define  EGL_IMAGE_PRESERVED                          30D2h
#define  EGL_SYNC_PRIOR_COMMANDS_COMPLETE             30F0h
#define  EGL_SYNC_STATUS                              30F1h
#define  EGL_SIGNALED                                 30F2h
#define  EGL_UNSIGNALED                               30F3h
#define  EGL_TIMEOUT_EXPIRED                          30F5h
#define  EGL_CONDITION_SATISFIED                      30F6h
#define  EGL_SYNC_TYPE                                30F7h
#define  EGL_SYNC_CONDITION                           30F8h
#define  EGL_SYNC_FENCE                               30F9h
#define  EGL_CONTEXT_MINOR_VERSION                    30FBh
#define  EGL_CONTEXT_OPENGL_PROFILE_MASK              30FDh
#define  EGL_SYNC_CL_EVENT                            30FEh
#define  EGL_SYNC_CL_EVENT_COMPLETE                   30FFh
#define  EGL_CONTEXT_OPENGL_DEBUG                     31B0h
#define  EGL_CONTEXT_OPENGL_FORWARD_COMPATIBLE        31B1h
#define  EGL_CONTEXT_OPENGL_ROBUST_ACCESS             31B2h
#define  EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY  31BDh
#define  EGL_NO_RESET_NOTIFICATION                    31BEh
#define  EGL_LOSE_CONTEXT_ON_RESET                    31BFh
#define  EGL_FOREVER                                  FFFFFFFFFFFFFFFFh
eglClientWaitSync!: alias function! [
	dpy     [ EGLDisplay! ]
	sync    [ EGLSync! ]
	flags   [ EGLint! ]
	timeout [ EGLTime! ]
	return: [ EGLint! ]
]
eglCreateImage!: alias function! [
	dpy         [ EGLDisplay! ]
	ctx         [ EGLContext! ]
	target      [ EGLenum! ]
	buffer      [ EGLClientBuffer! ]
	attrib_list [ EGLAttrib-ptr! ]
	return: [ EGLImage! ]
]
eglCreatePlatformPixmapSurface!: alias function! [
	dpy           [ EGLDisplay! ]
	config        [ EGLConfig! ]
	native_pixmap [ pointer! [byte!] ]
	attrib_list   [ EGLAttrib-ptr! ]
	return: [ EGLSurface! ]
]
eglCreatePlatformWindowSurface!: alias function! [
	dpy           [ EGLDisplay! ]
	config        [ EGLConfig! ]
	native_window [ pointer! [byte!] ]
	attrib_list   [ EGLAttrib-ptr! ]
	return: [ EGLSurface! ]
]
eglCreateSync!: alias function! [
	dpy         [ EGLDisplay! ]
	type        [ EGLenum! ]
	attrib_list [ EGLAttrib-ptr! ]
	return: [ EGLSync! ]
]
eglDestroyImage!: alias function! [
	dpy     [ EGLDisplay! ]
	image   [ EGLImage! ]
	return: [ EGLBoolean! ]
]
eglDestroySync!: alias function! [
	dpy     [ EGLDisplay! ]
	sync    [ EGLSync! ]
	return: [ EGLBoolean! ]
]
eglGetPlatformDisplay!: alias function! [
	platform       [ EGLenum! ]
	native_display [ pointer! [byte!] ]
	attrib_list    [ EGLAttrib-ptr! ]
	return: [ EGLDisplay! ]
]
eglGetSyncAttrib!: alias function! [
	dpy       [ EGLDisplay! ]
	sync      [ EGLSync! ]
	attribute [ EGLint! ]
	value     [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]
eglWaitSync!: alias function! [
	dpy     [ EGLDisplay! ]
	sync    [ EGLSync! ]
	flags   [ EGLint! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_ANDROID_blob_cache
;-------------------------------------------

#define  EGL_ANDROID_blob_cache                       1
eglSetBlobCacheFuncsANDROID!: alias function! [
	dpy     [ EGLDisplay! ]
	set     [ EGLSetBlobFuncANDROID! ]
	get     [ EGLGetBlobFuncANDROID! ]
]


;-------------------------------------------
;-- EGL_ANDROID_create_native_client_buffer
;-------------------------------------------

#define  EGL_ANDROID_create_native_client_buffer      1
#define  EGL_NATIVE_BUFFER_USAGE_PROTECTED_BIT_ANDROID  00000001h
#define  EGL_NATIVE_BUFFER_USAGE_RENDERBUFFER_BIT_ANDROID  00000002h
#define  EGL_NATIVE_BUFFER_USAGE_TEXTURE_BIT_ANDROID  00000004h
#define  EGL_NATIVE_BUFFER_USAGE_ANDROID              3143h
eglCreateNativeClientBufferANDROID!: alias function! [
	attrib_list [ EGLint-ptr! ]
	return: [ EGLClientBuffer! ]
]


;-------------------------------------------
;-- EGL_ANDROID_framebuffer_target
;-------------------------------------------

#define  EGL_ANDROID_framebuffer_target               1
#define  EGL_FRAMEBUFFER_TARGET_ANDROID               3147h


;-------------------------------------------
;-- EGL_ANDROID_front_buffer_auto_refresh
;-------------------------------------------

#define  EGL_ANDROID_front_buffer_auto_refresh        1
#define  EGL_FRONT_BUFFER_AUTO_REFRESH_ANDROID        314Ch


;-------------------------------------------
;-- EGL_ANDROID_image_native_buffer
;-------------------------------------------

#define  EGL_ANDROID_image_native_buffer              1
#define  EGL_NATIVE_BUFFER_ANDROID                    3140h


;-------------------------------------------
;-- EGL_ANDROID_native_fence_sync
;-------------------------------------------

#define  EGL_ANDROID_native_fence_sync                1
#define  EGL_SYNC_NATIVE_FENCE_ANDROID                3144h
#define  EGL_SYNC_NATIVE_FENCE_FD_ANDROID             3145h
#define  EGL_SYNC_NATIVE_FENCE_SIGNALED_ANDROID       3146h
eglDupNativeFenceFDANDROID!: alias function! [
	dpy     [ EGLDisplay! ]
	sync    [ EGLSyncKHR! ]
	return: [ EGLint! ]
]


;-------------------------------------------
;-- EGL_ANDROID_presentation_time
;-------------------------------------------

#define  EGL_ANDROID_presentation_time                1
eglPresentationTimeANDROID!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	time    [ EGLnsecsANDROID! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_ANDROID_recordable
;-------------------------------------------

#define  EGL_ANDROID_recordable                       1
#define  EGL_RECORDABLE_ANDROID                       3142h


;-------------------------------------------
;-- EGL_ANGLE_d3d_share_handle_client_buffer
;-------------------------------------------

#define  EGL_ANGLE_d3d_share_handle_client_buffer     1
#define  EGL_D3D_TEXTURE_2D_SHARE_HANDLE_ANGLE        3200h


;-------------------------------------------
;-- EGL_ANGLE_device_d3d
;-------------------------------------------

#define  EGL_ANGLE_device_d3d                         1
#define  EGL_D3D9_DEVICE_ANGLE                        33A0h
#define  EGL_D3D11_DEVICE_ANGLE                       33A1h


;-------------------------------------------
;-- EGL_ANGLE_query_surface_pointer
;-------------------------------------------

#define  EGL_ANGLE_query_surface_pointer              1
eglQuerySurfacePointerANGLE!: alias function! [
	dpy       [ EGLDisplay! ]
	surface   [ EGLSurface! ]
	attribute [ EGLint! ]
	value     [ binary-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_ANGLE_surface_d3d_texture_2d_share_handle
;-------------------------------------------

#define  EGL_ANGLE_surface_d3d_texture_2d_share_handle  1
;#define  EGL_D3D_TEXTURE_2D_SHARE_HANDLE_ANGLE        3200h


;-------------------------------------------
;-- EGL_ANGLE_window_fixed_size
;-------------------------------------------

#define  EGL_ANGLE_window_fixed_size                  1
#define  EGL_FIXED_SIZE_ANGLE                         3201h


;-------------------------------------------
;-- EGL_ARM_implicit_external_sync
;-------------------------------------------

#define  EGL_ARM_implicit_external_sync               1
#define  EGL_SYNC_PRIOR_COMMANDS_IMPLICIT_EXTERNAL_ARM  328Ah


;-------------------------------------------
;-- EGL_ARM_pixmap_multisample_discard
;-------------------------------------------

#define  EGL_ARM_pixmap_multisample_discard           1
#define  EGL_DISCARD_SAMPLES_ARM                      3286h


;-------------------------------------------
;-- EGL_EXT_buffer_age
;-------------------------------------------

#define  EGL_EXT_buffer_age                           1
#define  EGL_BUFFER_AGE_EXT                           313Dh


;-------------------------------------------
;-- EGL_EXT_client_extensions
;-------------------------------------------

#define  EGL_EXT_client_extensions                    1


;-------------------------------------------
;-- EGL_EXT_create_context_robustness
;-------------------------------------------

#define  EGL_EXT_create_context_robustness            1
#define  EGL_CONTEXT_OPENGL_ROBUST_ACCESS_EXT         30BFh
#define  EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_EXT  3138h
#define  EGL_NO_RESET_NOTIFICATION_EXT                31BEh
#define  EGL_LOSE_CONTEXT_ON_RESET_EXT                31BFh


;-------------------------------------------
;-- EGL_EXT_device_base
;-------------------------------------------

#define  EGL_EXT_device_base                          1
#define  EGL_BAD_DEVICE_EXT                           322Bh
#define  EGL_DEVICE_EXT                               322Ch


;-------------------------------------------
;-- EGL_EXT_device_drm
;-------------------------------------------

#define  EGL_EXT_device_drm                           1
#define  EGL_DRM_DEVICE_FILE_EXT                      3233h


;-------------------------------------------
;-- EGL_EXT_device_enumeration
;-------------------------------------------

#define  EGL_EXT_device_enumeration                   1
eglQueryDevicesEXT!: alias function! [
	max_devices [ EGLint! ]
	devices     [ EGLDeviceEXT-ptr! ]
	num_devices [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_EXT_device_openwf
;-------------------------------------------

#define  EGL_EXT_device_openwf                        1
#define  EGL_OPENWF_DEVICE_ID_EXT                     3237h


;-------------------------------------------
;-- EGL_EXT_device_query
;-------------------------------------------

#define  EGL_EXT_device_query                         1
;#define  EGL_BAD_DEVICE_EXT                           322Bh
;#define  EGL_DEVICE_EXT                               322Ch
eglQueryDeviceAttribEXT!: alias function! [
	device    [ EGLDeviceEXT! ]
	attribute [ EGLint! ]
	value     [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]
eglQueryDeviceStringEXT!: alias function! [
	device  [ EGLDeviceEXT! ]
	name    [ EGLint! ]
	return: [ c-string! ]
]
eglQueryDisplayAttribEXT!: alias function! [
	dpy       [ EGLDisplay! ]
	attribute [ EGLint! ]
	value     [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_EXT_gl_colorspace_bt2020_linear
;-------------------------------------------

#define  EGL_EXT_gl_colorspace_bt2020_linear          1
#define  EGL_GL_COLORSPACE_BT2020_LINEAR_EXT          333Fh


;-------------------------------------------
;-- EGL_EXT_gl_colorspace_bt2020_pq
;-------------------------------------------

#define  EGL_EXT_gl_colorspace_bt2020_pq              1
#define  EGL_GL_COLORSPACE_BT2020_PQ_EXT              3340h


;-------------------------------------------
;-- EGL_EXT_gl_colorspace_scrgb_linear
;-------------------------------------------

#define  EGL_EXT_gl_colorspace_scrgb_linear           1
#define  EGL_GL_COLORSPACE_SCRGB_LINEAR_EXT           3350h


;-------------------------------------------
;-- EGL_EXT_image_dma_buf_import
;-------------------------------------------

#define  EGL_EXT_image_dma_buf_import                 1
#define  EGL_LINUX_DMA_BUF_EXT                        3270h
#define  EGL_LINUX_DRM_FOURCC_EXT                     3271h
#define  EGL_DMA_BUF_PLANE0_FD_EXT                    3272h
#define  EGL_DMA_BUF_PLANE0_OFFSET_EXT                3273h
#define  EGL_DMA_BUF_PLANE0_PITCH_EXT                 3274h
#define  EGL_DMA_BUF_PLANE1_FD_EXT                    3275h
#define  EGL_DMA_BUF_PLANE1_OFFSET_EXT                3276h
#define  EGL_DMA_BUF_PLANE1_PITCH_EXT                 3277h
#define  EGL_DMA_BUF_PLANE2_FD_EXT                    3278h
#define  EGL_DMA_BUF_PLANE2_OFFSET_EXT                3279h
#define  EGL_DMA_BUF_PLANE2_PITCH_EXT                 327Ah
#define  EGL_YUV_COLOR_SPACE_HINT_EXT                 327Bh
#define  EGL_SAMPLE_RANGE_HINT_EXT                    327Ch
#define  EGL_YUV_CHROMA_HORIZONTAL_SITING_HINT_EXT    327Dh
#define  EGL_YUV_CHROMA_VERTICAL_SITING_HINT_EXT      327Eh
#define  EGL_ITU_REC601_EXT                           327Fh
#define  EGL_ITU_REC709_EXT                           3280h
#define  EGL_ITU_REC2020_EXT                          3281h
#define  EGL_YUV_FULL_RANGE_EXT                       3282h
#define  EGL_YUV_NARROW_RANGE_EXT                     3283h
#define  EGL_YUV_CHROMA_SITING_0_EXT                  3284h
#define  EGL_YUV_CHROMA_SITING_0_5_EXT                3285h


;-------------------------------------------
;-- EGL_EXT_image_dma_buf_import_modifiers
;-------------------------------------------

#define  EGL_EXT_image_dma_buf_import_modifiers       1
#define  EGL_DMA_BUF_PLANE3_FD_EXT                    3440h
#define  EGL_DMA_BUF_PLANE3_OFFSET_EXT                3441h
#define  EGL_DMA_BUF_PLANE3_PITCH_EXT                 3442h
#define  EGL_DMA_BUF_PLANE0_MODIFIER_LO_EXT           3443h
#define  EGL_DMA_BUF_PLANE0_MODIFIER_HI_EXT           3444h
#define  EGL_DMA_BUF_PLANE1_MODIFIER_LO_EXT           3445h
#define  EGL_DMA_BUF_PLANE1_MODIFIER_HI_EXT           3446h
#define  EGL_DMA_BUF_PLANE2_MODIFIER_LO_EXT           3447h
#define  EGL_DMA_BUF_PLANE2_MODIFIER_HI_EXT           3448h
#define  EGL_DMA_BUF_PLANE3_MODIFIER_LO_EXT           3449h
#define  EGL_DMA_BUF_PLANE3_MODIFIER_HI_EXT           344Ah
eglQueryDmaBufFormatsEXT!: alias function! [
	dpy         [ EGLDisplay! ]
	max_formats [ EGLint! ]
	formats     [ EGLint-ptr! ]
	num_formats [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglQueryDmaBufModifiersEXT!: alias function! [
	dpy           [ EGLDisplay! ]
	format        [ EGLint! ]
	max_modifiers [ EGLint! ]
	modifiers     [ EGLuint64KHR-ptr! ]
	external_only [ EGLBoolean-ptr! ]
	num_modifiers [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_EXT_multiview_window
;-------------------------------------------

#define  EGL_EXT_multiview_window                     1
#define  EGL_MULTIVIEW_VIEW_COUNT_EXT                 3134h


;-------------------------------------------
;-- EGL_EXT_output_base
;-------------------------------------------

#define  EGL_EXT_output_base                          1
#define  EGL_BAD_OUTPUT_LAYER_EXT                     322Dh
#define  EGL_BAD_OUTPUT_PORT_EXT                      322Eh
#define  EGL_SWAP_INTERVAL_EXT                        322Fh
eglGetOutputLayersEXT!: alias function! [
	dpy         [ EGLDisplay! ]
	attrib_list [ EGLAttrib-ptr! ]
	layers      [ EGLOutputLayerEXT-ptr! ]
	max_layers  [ EGLint! ]
	num_layers  [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglGetOutputPortsEXT!: alias function! [
	dpy         [ EGLDisplay! ]
	attrib_list [ EGLAttrib-ptr! ]
	ports       [ EGLOutputPortEXT-ptr! ]
	max_ports   [ EGLint! ]
	num_ports   [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglOutputLayerAttribEXT!: alias function! [
	dpy       [ EGLDisplay! ]
	layer     [ EGLOutputLayerEXT! ]
	attribute [ EGLint! ]
	value     [ EGLAttrib! ]
	return: [ EGLBoolean! ]
]
eglOutputPortAttribEXT!: alias function! [
	dpy       [ EGLDisplay! ]
	port      [ EGLOutputPortEXT! ]
	attribute [ EGLint! ]
	value     [ EGLAttrib! ]
	return: [ EGLBoolean! ]
]
eglQueryOutputLayerAttribEXT!: alias function! [
	dpy       [ EGLDisplay! ]
	layer     [ EGLOutputLayerEXT! ]
	attribute [ EGLint! ]
	value     [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]
eglQueryOutputLayerStringEXT!: alias function! [
	dpy     [ EGLDisplay! ]
	layer   [ EGLOutputLayerEXT! ]
	name    [ EGLint! ]
	return: [ c-string! ]
]
eglQueryOutputPortAttribEXT!: alias function! [
	dpy       [ EGLDisplay! ]
	port      [ EGLOutputPortEXT! ]
	attribute [ EGLint! ]
	value     [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]
eglQueryOutputPortStringEXT!: alias function! [
	dpy     [ EGLDisplay! ]
	port    [ EGLOutputPortEXT! ]
	name    [ EGLint! ]
	return: [ c-string! ]
]


;-------------------------------------------
;-- EGL_EXT_output_drm
;-------------------------------------------

#define  EGL_EXT_output_drm                           1
#define  EGL_DRM_CRTC_EXT                             3234h
#define  EGL_DRM_PLANE_EXT                            3235h
#define  EGL_DRM_CONNECTOR_EXT                        3236h


;-------------------------------------------
;-- EGL_EXT_output_openwf
;-------------------------------------------

#define  EGL_EXT_output_openwf                        1
#define  EGL_OPENWF_PIPELINE_ID_EXT                   3238h
#define  EGL_OPENWF_PORT_ID_EXT                       3239h


;-------------------------------------------
;-- EGL_EXT_pixel_format_float
;-------------------------------------------

#define  EGL_EXT_pixel_format_float                   1
#define  EGL_COLOR_COMPONENT_TYPE_EXT                 3339h
#define  EGL_COLOR_COMPONENT_TYPE_FIXED_EXT           333Ah
#define  EGL_COLOR_COMPONENT_TYPE_FLOAT_EXT           333Bh


;-------------------------------------------
;-- EGL_EXT_platform_base
;-------------------------------------------

#define  EGL_EXT_platform_base                        1
eglCreatePlatformPixmapSurfaceEXT!: alias function! [
	dpy           [ EGLDisplay! ]
	config        [ EGLConfig! ]
	native_pixmap [ pointer! [byte!] ]
	attrib_list   [ EGLint-ptr! ]
	return: [ EGLSurface! ]
]
eglCreatePlatformWindowSurfaceEXT!: alias function! [
	dpy           [ EGLDisplay! ]
	config        [ EGLConfig! ]
	native_window [ pointer! [byte!] ]
	attrib_list   [ EGLint-ptr! ]
	return: [ EGLSurface! ]
]
eglGetPlatformDisplayEXT!: alias function! [
	platform       [ EGLenum! ]
	native_display [ pointer! [byte!] ]
	attrib_list    [ EGLint-ptr! ]
	return: [ EGLDisplay! ]
]


;-------------------------------------------
;-- EGL_EXT_platform_device
;-------------------------------------------

#define  EGL_EXT_platform_device                      1
#define  EGL_PLATFORM_DEVICE_EXT                      313Fh


;-------------------------------------------
;-- EGL_EXT_platform_wayland
;-------------------------------------------

#define  EGL_EXT_platform_wayland                     1
#define  EGL_PLATFORM_WAYLAND_EXT                     31D8h


;-------------------------------------------
;-- EGL_EXT_platform_x11
;-------------------------------------------

#define  EGL_EXT_platform_x11                         1
#define  EGL_PLATFORM_X11_EXT                         31D5h
#define  EGL_PLATFORM_X11_SCREEN_EXT                  31D6h


;-------------------------------------------
;-- EGL_EXT_protected_content
;-------------------------------------------

#define  EGL_EXT_protected_content                    1
#define  EGL_PROTECTED_CONTENT_EXT                    32C0h


;-------------------------------------------
;-- EGL_EXT_protected_surface
;-------------------------------------------

#define  EGL_EXT_protected_surface                    1
;#define  EGL_PROTECTED_CONTENT_EXT                    32C0h


;-------------------------------------------
;-- EGL_EXT_stream_consumer_egloutput
;-------------------------------------------

#define  EGL_EXT_stream_consumer_egloutput            1
eglStreamConsumerOutputEXT!: alias function! [
	dpy     [ EGLDisplay! ]
	stream  [ EGLStreamKHR! ]
	layer   [ EGLOutputLayerEXT! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_EXT_surface_SMPTE2086_metadata
;-------------------------------------------

#define  EGL_EXT_surface_SMPTE2086_metadata           1
#define  EGL_SMPTE2086_DISPLAY_PRIMARY_RX_EXT         3341h
#define  EGL_SMPTE2086_DISPLAY_PRIMARY_RY_EXT         3342h
#define  EGL_SMPTE2086_DISPLAY_PRIMARY_GX_EXT         3343h
#define  EGL_SMPTE2086_DISPLAY_PRIMARY_GY_EXT         3344h
#define  EGL_SMPTE2086_DISPLAY_PRIMARY_BX_EXT         3345h
#define  EGL_SMPTE2086_DISPLAY_PRIMARY_BY_EXT         3346h
#define  EGL_SMPTE2086_WHITE_POINT_X_EXT              3347h
#define  EGL_SMPTE2086_WHITE_POINT_Y_EXT              3348h
#define  EGL_SMPTE2086_MAX_LUMINANCE_EXT              3349h
#define  EGL_SMPTE2086_MIN_LUMINANCE_EXT              334Ah


;-------------------------------------------
;-- EGL_EXT_swap_buffers_with_damage
;-------------------------------------------

#define  EGL_EXT_swap_buffers_with_damage             1
eglSwapBuffersWithDamageEXT!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	rects   [ EGLint-ptr! ]
	n_rects [ EGLint! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_EXT_yuv_surface
;-------------------------------------------

#define  EGL_EXT_yuv_surface                          1
#define  EGL_YUV_BUFFER_EXT                           3300h
#define  EGL_YUV_ORDER_EXT                            3301h
#define  EGL_YUV_ORDER_YUV_EXT                        3302h
#define  EGL_YUV_ORDER_YVU_EXT                        3303h
#define  EGL_YUV_ORDER_YUYV_EXT                       3304h
#define  EGL_YUV_ORDER_UYVY_EXT                       3305h
#define  EGL_YUV_ORDER_YVYU_EXT                       3306h
#define  EGL_YUV_ORDER_VYUY_EXT                       3307h
#define  EGL_YUV_ORDER_AYUV_EXT                       3308h
#define  EGL_YUV_CSC_STANDARD_EXT                     330Ah
#define  EGL_YUV_CSC_STANDARD_601_EXT                 330Bh
#define  EGL_YUV_CSC_STANDARD_709_EXT                 330Ch
#define  EGL_YUV_CSC_STANDARD_2020_EXT                330Dh
#define  EGL_YUV_NUMBER_OF_PLANES_EXT                 3311h
#define  EGL_YUV_SUBSAMPLE_EXT                        3312h
#define  EGL_YUV_SUBSAMPLE_4_2_0_EXT                  3313h
#define  EGL_YUV_SUBSAMPLE_4_2_2_EXT                  3314h
#define  EGL_YUV_SUBSAMPLE_4_4_4_EXT                  3315h
#define  EGL_YUV_DEPTH_RANGE_EXT                      3317h
#define  EGL_YUV_DEPTH_RANGE_LIMITED_EXT              3318h
#define  EGL_YUV_DEPTH_RANGE_FULL_EXT                 3319h
#define  EGL_YUV_PLANE_BPP_EXT                        331Ah
#define  EGL_YUV_PLANE_BPP_0_EXT                      331Bh
#define  EGL_YUV_PLANE_BPP_8_EXT                      331Ch
#define  EGL_YUV_PLANE_BPP_10_EXT                     331Dh


;-------------------------------------------
;-- EGL_HI_clientpixmap
;-------------------------------------------

#define  EGL_HI_clientpixmap                          1
#define  EGL_CLIENT_PIXMAP_POINTER_HI                 8F74h
eglCreatePixmapSurfaceHI!: alias function! [
	dpy     [ EGLDisplay! ]
	config  [ EGLConfig! ]
	pixmap  [ EGLClientPixmapHI! ]
	return: [ EGLSurface! ]
]


;-------------------------------------------
;-- EGL_HI_colorformats
;-------------------------------------------

#define  EGL_HI_colorformats                          1
#define  EGL_COLOR_FORMAT_HI                          8F70h
#define  EGL_COLOR_RGB_HI                             8F71h
#define  EGL_COLOR_RGBA_HI                            8F72h
#define  EGL_COLOR_ARGB_HI                            8F73h


;-------------------------------------------
;-- EGL_IMG_context_priority
;-------------------------------------------

#define  EGL_IMG_context_priority                     1
#define  EGL_CONTEXT_PRIORITY_LEVEL_IMG               3100h
#define  EGL_CONTEXT_PRIORITY_HIGH_IMG                3101h
#define  EGL_CONTEXT_PRIORITY_MEDIUM_IMG              3102h
#define  EGL_CONTEXT_PRIORITY_LOW_IMG                 3103h


;-------------------------------------------
;-- EGL_IMG_image_plane_attribs
;-------------------------------------------

#define  EGL_IMG_image_plane_attribs                  1
#define  EGL_NATIVE_BUFFER_MULTIPLANE_SEPARATE_IMG    3105h
#define  EGL_NATIVE_BUFFER_PLANE_OFFSET_IMG           3106h


;-------------------------------------------
;-- EGL_KHR_cl_event
;-------------------------------------------

#define  EGL_KHR_cl_event                             1
#define  EGL_CL_EVENT_HANDLE_KHR                      309Ch
#define  EGL_SYNC_CL_EVENT_KHR                        30FEh
#define  EGL_SYNC_CL_EVENT_COMPLETE_KHR               30FFh


;-------------------------------------------
;-- EGL_KHR_cl_event2
;-------------------------------------------

#define  EGL_KHR_cl_event2                            1
;#define  EGL_CL_EVENT_HANDLE_KHR                      309Ch
;#define  EGL_SYNC_CL_EVENT_KHR                        30FEh
;#define  EGL_SYNC_CL_EVENT_COMPLETE_KHR               30FFh
eglCreateSync64KHR!: alias function! [
	dpy         [ EGLDisplay! ]
	type        [ EGLenum! ]
	attrib_list [ EGLAttribKHR-ptr! ]
	return: [ EGLSyncKHR! ]
]


;-------------------------------------------
;-- EGL_KHR_client_get_all_proc_addresses
;-------------------------------------------

#define  EGL_KHR_client_get_all_proc_addresses        1


;-------------------------------------------
;-- EGL_KHR_config_attribs
;-------------------------------------------

#define  EGL_KHR_config_attribs                       1
#define  EGL_VG_COLORSPACE_LINEAR_BIT_KHR             0020h
#define  EGL_VG_ALPHA_FORMAT_PRE_BIT_KHR              0040h
#define  EGL_CONFORMANT_KHR                           3042h


;-------------------------------------------
;-- EGL_KHR_context_flush_control
;-------------------------------------------

#define  EGL_KHR_context_flush_control                1
#define  EGL_CONTEXT_RELEASE_BEHAVIOR_NONE_KHR        0
#define  EGL_CONTEXT_RELEASE_BEHAVIOR_KHR             2097h
#define  EGL_CONTEXT_RELEASE_BEHAVIOR_FLUSH_KHR       2098h


;-------------------------------------------
;-- EGL_KHR_create_context
;-------------------------------------------

#define  EGL_KHR_create_context                       1
#define  EGL_CONTEXT_OPENGL_CORE_PROFILE_BIT_KHR      00000001h
#define  EGL_CONTEXT_OPENGL_DEBUG_BIT_KHR             00000001h
#define  EGL_CONTEXT_OPENGL_COMPATIBILITY_PROFILE_BIT_KHR  00000002h
#define  EGL_CONTEXT_OPENGL_FORWARD_COMPATIBLE_BIT_KHR  00000002h
#define  EGL_CONTEXT_OPENGL_ROBUST_ACCESS_BIT_KHR     00000004h
;#define  EGL_OPENGL_ES3_BIT                           00000040h
#define  EGL_OPENGL_ES3_BIT_KHR                       00000040h
#define  EGL_CONTEXT_MAJOR_VERSION_KHR                3098h
#define  EGL_CONTEXT_MINOR_VERSION_KHR                30FBh
#define  EGL_CONTEXT_FLAGS_KHR                        30FCh
#define  EGL_CONTEXT_OPENGL_PROFILE_MASK_KHR          30FDh
#define  EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_KHR  31BDh
#define  EGL_NO_RESET_NOTIFICATION_KHR                31BEh
#define  EGL_LOSE_CONTEXT_ON_RESET_KHR                31BFh


;-------------------------------------------
;-- EGL_KHR_create_context_no_error
;-------------------------------------------

#define  EGL_KHR_create_context_no_error              1
#define  EGL_CONTEXT_OPENGL_NO_ERROR_KHR              31B3h


;-------------------------------------------
;-- EGL_KHR_debug
;-------------------------------------------

#define  EGL_KHR_debug                                1
#define  EGL_OBJECT_THREAD_KHR                        33B0h
#define  EGL_OBJECT_DISPLAY_KHR                       33B1h
#define  EGL_OBJECT_CONTEXT_KHR                       33B2h
#define  EGL_OBJECT_SURFACE_KHR                       33B3h
#define  EGL_OBJECT_IMAGE_KHR                         33B4h
#define  EGL_OBJECT_SYNC_KHR                          33B5h
#define  EGL_OBJECT_STREAM_KHR                        33B6h
#define  EGL_DEBUG_CALLBACK_KHR                       33B8h
#define  EGL_DEBUG_MSG_CRITICAL_KHR                   33B9h
#define  EGL_DEBUG_MSG_ERROR_KHR                      33BAh
#define  EGL_DEBUG_MSG_WARN_KHR                       33BBh
#define  EGL_DEBUG_MSG_INFO_KHR                       33BCh
eglDebugMessageControlKHR!: alias function! [
	callback    [ EGLDEBUGPROCKHR! ]
	attrib_list [ EGLAttrib-ptr! ]
	return: [ EGLint! ]
]
eglLabelObjectKHR!: alias function! [
	display    [ EGLDisplay! ]
	objectType [ EGLenum! ]
	object     [ EGLObjectKHR! ]
	label      [ EGLLabelKHR! ]
	return: [ EGLint! ]
]
eglQueryDebugKHR!: alias function! [
	attribute [ EGLint! ]
	value     [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_fence_sync
;-------------------------------------------

#define  EGL_KHR_fence_sync                           1
#define  EGL_SYNC_PRIOR_COMMANDS_COMPLETE_KHR         30F0h
#define  EGL_SYNC_CONDITION_KHR                       30F8h
#define  EGL_SYNC_FENCE_KHR                           30F9h


;-------------------------------------------
;-- EGL_KHR_get_all_proc_addresses
;-------------------------------------------

#define  EGL_KHR_get_all_proc_addresses               1


;-------------------------------------------
;-- EGL_KHR_gl_colorspace
;-------------------------------------------

#define  EGL_KHR_gl_colorspace                        1
#define  EGL_GL_COLORSPACE_SRGB_KHR                   3089h
#define  EGL_GL_COLORSPACE_LINEAR_KHR                 308Ah
#define  EGL_GL_COLORSPACE_KHR                        309Dh


;-------------------------------------------
;-- EGL_KHR_gl_renderbuffer_image
;-------------------------------------------

#define  EGL_KHR_gl_renderbuffer_image                1
#define  EGL_GL_RENDERBUFFER_KHR                      30B9h


;-------------------------------------------
;-- EGL_KHR_gl_texture_2D_image
;-------------------------------------------

#define  EGL_KHR_gl_texture_2D_image                  1
#define  EGL_GL_TEXTURE_2D_KHR                        30B1h
#define  EGL_GL_TEXTURE_LEVEL_KHR                     30BCh


;-------------------------------------------
;-- EGL_KHR_gl_texture_3D_image
;-------------------------------------------

#define  EGL_KHR_gl_texture_3D_image                  1
#define  EGL_GL_TEXTURE_3D_KHR                        30B2h
#define  EGL_GL_TEXTURE_ZOFFSET_KHR                   30BDh


;-------------------------------------------
;-- EGL_KHR_gl_texture_cubemap_image
;-------------------------------------------

#define  EGL_KHR_gl_texture_cubemap_image             1
#define  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_X_KHR       30B3h
#define  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_X_KHR       30B4h
#define  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Y_KHR       30B5h
#define  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_KHR       30B6h
#define  EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Z_KHR       30B7h
#define  EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_KHR       30B8h


;-------------------------------------------
;-- EGL_KHR_image
;-------------------------------------------

#define  EGL_KHR_image                                1
#define  EGL_NATIVE_PIXMAP_KHR                        30B0h
eglCreateImageKHR!: alias function! [
	dpy         [ EGLDisplay! ]
	ctx         [ EGLContext! ]
	target      [ EGLenum! ]
	buffer      [ EGLClientBuffer! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLImageKHR! ]
]
eglDestroyImageKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	image   [ EGLImageKHR! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_image_base
;-------------------------------------------

#define  EGL_KHR_image_base                           1
#define  EGL_IMAGE_PRESERVED_KHR                      30D2h


;-------------------------------------------
;-- EGL_KHR_image_pixmap
;-------------------------------------------

#define  EGL_KHR_image_pixmap                         1
;#define  EGL_NATIVE_PIXMAP_KHR                        30B0h


;-------------------------------------------
;-- EGL_KHR_lock_surface
;-------------------------------------------

#define  EGL_KHR_lock_surface                         1
#define  EGL_READ_SURFACE_BIT_KHR                     0001h
#define  EGL_WRITE_SURFACE_BIT_KHR                    0002h
#define  EGL_LOCK_SURFACE_BIT_KHR                     0080h
#define  EGL_OPTIMAL_FORMAT_BIT_KHR                   0100h
#define  EGL_MATCH_FORMAT_KHR                         3043h
#define  EGL_FORMAT_RGB_565_EXACT_KHR                 30C0h
#define  EGL_FORMAT_RGB_565_KHR                       30C1h
#define  EGL_FORMAT_RGBA_8888_EXACT_KHR               30C2h
#define  EGL_FORMAT_RGBA_8888_KHR                     30C3h
#define  EGL_MAP_PRESERVE_PIXELS_KHR                  30C4h
#define  EGL_LOCK_USAGE_HINT_KHR                      30C5h
#define  EGL_BITMAP_POINTER_KHR                       30C6h
#define  EGL_BITMAP_PITCH_KHR                         30C7h
#define  EGL_BITMAP_ORIGIN_KHR                        30C8h
#define  EGL_BITMAP_PIXEL_RED_OFFSET_KHR              30C9h
#define  EGL_BITMAP_PIXEL_GREEN_OFFSET_KHR            30CAh
#define  EGL_BITMAP_PIXEL_BLUE_OFFSET_KHR             30CBh
#define  EGL_BITMAP_PIXEL_ALPHA_OFFSET_KHR            30CCh
#define  EGL_BITMAP_PIXEL_LUMINANCE_OFFSET_KHR        30CDh
#define  EGL_LOWER_LEFT_KHR                           30CEh
#define  EGL_UPPER_LEFT_KHR                           30CFh
eglLockSurfaceKHR!: alias function! [
	dpy         [ EGLDisplay! ]
	surface     [ EGLSurface! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglUnlockSurfaceKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_lock_surface2
;-------------------------------------------

#define  EGL_KHR_lock_surface2                        1
#define  EGL_BITMAP_PIXEL_SIZE_KHR                    3110h


;-------------------------------------------
;-- EGL_KHR_lock_surface3
;-------------------------------------------

#define  EGL_KHR_lock_surface3                        1
;#define  EGL_READ_SURFACE_BIT_KHR                     0001h
;#define  EGL_WRITE_SURFACE_BIT_KHR                    0002h
;#define  EGL_LOCK_SURFACE_BIT_KHR                     0080h
;#define  EGL_OPTIMAL_FORMAT_BIT_KHR                   0100h
;#define  EGL_MATCH_FORMAT_KHR                         3043h
;#define  EGL_FORMAT_RGB_565_EXACT_KHR                 30C0h
;#define  EGL_FORMAT_RGB_565_KHR                       30C1h
;#define  EGL_FORMAT_RGBA_8888_EXACT_KHR               30C2h
;#define  EGL_FORMAT_RGBA_8888_KHR                     30C3h
;#define  EGL_MAP_PRESERVE_PIXELS_KHR                  30C4h
;#define  EGL_LOCK_USAGE_HINT_KHR                      30C5h
;#define  EGL_BITMAP_POINTER_KHR                       30C6h
;#define  EGL_BITMAP_PITCH_KHR                         30C7h
;#define  EGL_BITMAP_ORIGIN_KHR                        30C8h
;#define  EGL_BITMAP_PIXEL_RED_OFFSET_KHR              30C9h
;#define  EGL_BITMAP_PIXEL_GREEN_OFFSET_KHR            30CAh
;#define  EGL_BITMAP_PIXEL_BLUE_OFFSET_KHR             30CBh
;#define  EGL_BITMAP_PIXEL_ALPHA_OFFSET_KHR            30CCh
;#define  EGL_BITMAP_PIXEL_LUMINANCE_OFFSET_KHR        30CDh
;#define  EGL_LOWER_LEFT_KHR                           30CEh
;#define  EGL_UPPER_LEFT_KHR                           30CFh
;#define  EGL_BITMAP_PIXEL_SIZE_KHR                    3110h
eglQuerySurface64KHR!: alias function! [
	dpy       [ EGLDisplay! ]
	surface   [ EGLSurface! ]
	attribute [ EGLint! ]
	value     [ EGLAttribKHR-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_mutable_render_buffer
;-------------------------------------------

#define  EGL_KHR_mutable_render_buffer                1
#define  EGL_MUTABLE_RENDER_BUFFER_BIT_KHR            1000h


;-------------------------------------------
;-- EGL_KHR_no_config_context
;-------------------------------------------

#define  EGL_KHR_no_config_context                    1


;-------------------------------------------
;-- EGL_KHR_partial_update
;-------------------------------------------

#define  EGL_KHR_partial_update                       1
#define  EGL_BUFFER_AGE_KHR                           313Dh
eglSetDamageRegionKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	rects   [ EGLint-ptr! ]
	n_rects [ EGLint! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_platform_android
;-------------------------------------------

#define  EGL_KHR_platform_android                     1
#define  EGL_PLATFORM_ANDROID_KHR                     3141h


;-------------------------------------------
;-- EGL_KHR_platform_gbm
;-------------------------------------------

#define  EGL_KHR_platform_gbm                         1
#define  EGL_PLATFORM_GBM_KHR                         31D7h


;-------------------------------------------
;-- EGL_KHR_platform_wayland
;-------------------------------------------

#define  EGL_KHR_platform_wayland                     1
#define  EGL_PLATFORM_WAYLAND_KHR                     31D8h


;-------------------------------------------
;-- EGL_KHR_platform_x11
;-------------------------------------------

#define  EGL_KHR_platform_x11                         1
#define  EGL_PLATFORM_X11_KHR                         31D5h
#define  EGL_PLATFORM_X11_SCREEN_KHR                  31D6h


;-------------------------------------------
;-- EGL_KHR_reusable_sync
;-------------------------------------------

#define  EGL_KHR_reusable_sync                        1
#define  EGL_SYNC_FLUSH_COMMANDS_BIT_KHR              0001h
#define  EGL_SYNC_STATUS_KHR                          30F1h
#define  EGL_SIGNALED_KHR                             30F2h
#define  EGL_UNSIGNALED_KHR                           30F3h
#define  EGL_TIMEOUT_EXPIRED_KHR                      30F5h
#define  EGL_CONDITION_SATISFIED_KHR                  30F6h
#define  EGL_SYNC_TYPE_KHR                            30F7h
#define  EGL_SYNC_REUSABLE_KHR                        30FAh
#define  EGL_FOREVER_KHR                              FFFFFFFFFFFFFFFFh
eglClientWaitSyncKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	sync    [ EGLSyncKHR! ]
	flags   [ EGLint! ]
	timeout [ EGLTimeKHR! ]
	return: [ EGLint! ]
]
eglCreateSyncKHR!: alias function! [
	dpy         [ EGLDisplay! ]
	type        [ EGLenum! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLSyncKHR! ]
]
eglDestroySyncKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	sync    [ EGLSyncKHR! ]
	return: [ EGLBoolean! ]
]
eglGetSyncAttribKHR!: alias function! [
	dpy       [ EGLDisplay! ]
	sync      [ EGLSyncKHR! ]
	attribute [ EGLint! ]
	value     [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglSignalSyncKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	sync    [ EGLSyncKHR! ]
	mode    [ EGLenum! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_stream
;-------------------------------------------

#define  EGL_KHR_stream                               1
#define  EGL_CONSUMER_LATENCY_USEC_KHR                3210h
#define  EGL_PRODUCER_FRAME_KHR                       3212h
#define  EGL_CONSUMER_FRAME_KHR                       3213h
#define  EGL_STREAM_STATE_KHR                         3214h
#define  EGL_STREAM_STATE_CREATED_KHR                 3215h
#define  EGL_STREAM_STATE_CONNECTING_KHR              3216h
#define  EGL_STREAM_STATE_EMPTY_KHR                   3217h
#define  EGL_STREAM_STATE_NEW_FRAME_AVAILABLE_KHR     3218h
#define  EGL_STREAM_STATE_OLD_FRAME_AVAILABLE_KHR     3219h
#define  EGL_STREAM_STATE_DISCONNECTED_KHR            321Ah
#define  EGL_BAD_STREAM_KHR                           321Bh
#define  EGL_BAD_STATE_KHR                            321Ch
eglCreateStreamKHR!: alias function! [
	dpy         [ EGLDisplay! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLStreamKHR! ]
]
eglDestroyStreamKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	stream  [ EGLStreamKHR! ]
	return: [ EGLBoolean! ]
]
eglQueryStreamKHR!: alias function! [
	dpy       [ EGLDisplay! ]
	stream    [ EGLStreamKHR! ]
	attribute [ EGLenum! ]
	value     [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglQueryStreamu64KHR!: alias function! [
	dpy       [ EGLDisplay! ]
	stream    [ EGLStreamKHR! ]
	attribute [ EGLenum! ]
	value     [ EGLuint64KHR-ptr! ]
	return: [ EGLBoolean! ]
]
eglStreamAttribKHR!: alias function! [
	dpy       [ EGLDisplay! ]
	stream    [ EGLStreamKHR! ]
	attribute [ EGLenum! ]
	value     [ EGLint! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_stream_attrib
;-------------------------------------------

#define  EGL_KHR_stream_attrib                        1
;#define  EGL_CONSUMER_LATENCY_USEC_KHR                3210h
;#define  EGL_STREAM_STATE_KHR                         3214h
;#define  EGL_STREAM_STATE_CREATED_KHR                 3215h
;#define  EGL_STREAM_STATE_CONNECTING_KHR              3216h
eglCreateStreamAttribKHR!: alias function! [
	dpy         [ EGLDisplay! ]
	attrib_list [ EGLAttrib-ptr! ]
	return: [ EGLStreamKHR! ]
]
eglQueryStreamAttribKHR!: alias function! [
	dpy       [ EGLDisplay! ]
	stream    [ EGLStreamKHR! ]
	attribute [ EGLenum! ]
	value     [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]
eglSetStreamAttribKHR!: alias function! [
	dpy       [ EGLDisplay! ]
	stream    [ EGLStreamKHR! ]
	attribute [ EGLenum! ]
	value     [ EGLAttrib! ]
	return: [ EGLBoolean! ]
]
eglStreamConsumerAcquireAttribKHR!: alias function! [
	dpy         [ EGLDisplay! ]
	stream      [ EGLStreamKHR! ]
	attrib_list [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]
eglStreamConsumerReleaseAttribKHR!: alias function! [
	dpy         [ EGLDisplay! ]
	stream      [ EGLStreamKHR! ]
	attrib_list [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_stream_consumer_gltexture
;-------------------------------------------

#define  EGL_KHR_stream_consumer_gltexture            1
#define  EGL_CONSUMER_ACQUIRE_TIMEOUT_USEC_KHR        321Eh
eglStreamConsumerAcquireKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	stream  [ EGLStreamKHR! ]
	return: [ EGLBoolean! ]
]
eglStreamConsumerGLTextureExternalKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	stream  [ EGLStreamKHR! ]
	return: [ EGLBoolean! ]
]
eglStreamConsumerReleaseKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	stream  [ EGLStreamKHR! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_stream_cross_process_fd
;-------------------------------------------

#define  EGL_KHR_stream_cross_process_fd              1
eglCreateStreamFromFileDescriptorKHR!: alias function! [
	dpy             [ EGLDisplay! ]
	file_descriptor [ EGLNativeFileDescriptorKHR! ]
	return: [ EGLStreamKHR! ]
]
eglGetStreamFileDescriptorKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	stream  [ EGLStreamKHR! ]
	return: [ EGLNativeFileDescriptorKHR! ]
]


;-------------------------------------------
;-- EGL_KHR_stream_fifo
;-------------------------------------------

#define  EGL_KHR_stream_fifo                          1
#define  EGL_STREAM_FIFO_LENGTH_KHR                   31FCh
#define  EGL_STREAM_TIME_NOW_KHR                      31FDh
#define  EGL_STREAM_TIME_CONSUMER_KHR                 31FEh
#define  EGL_STREAM_TIME_PRODUCER_KHR                 31FFh
eglQueryStreamTimeKHR!: alias function! [
	dpy       [ EGLDisplay! ]
	stream    [ EGLStreamKHR! ]
	attribute [ EGLenum! ]
	value     [ EGLTimeKHR-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_stream_producer_aldatalocator
;-------------------------------------------

#define  EGL_KHR_stream_producer_aldatalocator        1


;-------------------------------------------
;-- EGL_KHR_stream_producer_eglsurface
;-------------------------------------------

#define  EGL_KHR_stream_producer_eglsurface           1
#define  EGL_STREAM_BIT_KHR                           0800h
eglCreateStreamProducerSurfaceKHR!: alias function! [
	dpy         [ EGLDisplay! ]
	config      [ EGLConfig! ]
	stream      [ EGLStreamKHR! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLSurface! ]
]


;-------------------------------------------
;-- EGL_KHR_surfaceless_context
;-------------------------------------------

#define  EGL_KHR_surfaceless_context                  1


;-------------------------------------------
;-- EGL_KHR_swap_buffers_with_damage
;-------------------------------------------

#define  EGL_KHR_swap_buffers_with_damage             1
eglSwapBuffersWithDamageKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	rects   [ EGLint-ptr! ]
	n_rects [ EGLint! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_KHR_vg_parent_image
;-------------------------------------------

#define  EGL_KHR_vg_parent_image                      1
#define  EGL_VG_PARENT_IMAGE_KHR                      30BAh


;-------------------------------------------
;-- EGL_KHR_wait_sync
;-------------------------------------------

#define  EGL_KHR_wait_sync                            1
eglWaitSyncKHR!: alias function! [
	dpy     [ EGLDisplay! ]
	sync    [ EGLSyncKHR! ]
	flags   [ EGLint! ]
	return: [ EGLint! ]
]


;-------------------------------------------
;-- EGL_MESA_drm_image
;-------------------------------------------

#define  EGL_MESA_drm_image                           1
#define  EGL_DRM_BUFFER_USE_SCANOUT_MESA              00000001h
#define  EGL_DRM_BUFFER_USE_SHARE_MESA                00000002h
#define  EGL_DRM_BUFFER_FORMAT_MESA                   31D0h
#define  EGL_DRM_BUFFER_USE_MESA                      31D1h
#define  EGL_DRM_BUFFER_FORMAT_ARGB32_MESA            31D2h
#define  EGL_DRM_BUFFER_MESA                          31D3h
#define  EGL_DRM_BUFFER_STRIDE_MESA                   31D4h
eglCreateDRMImageMESA!: alias function! [
	dpy         [ EGLDisplay! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLImageKHR! ]
]
eglExportDRMImageMESA!: alias function! [
	dpy     [ EGLDisplay! ]
	image   [ EGLImageKHR! ]
	name    [ EGLint-ptr! ]
	handle  [ EGLint-ptr! ]
	stride  [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_MESA_image_dma_buf_export
;-------------------------------------------

#define  EGL_MESA_image_dma_buf_export                1
eglExportDMABUFImageMESA!: alias function! [
	dpy     [ EGLDisplay! ]
	image   [ EGLImageKHR! ]
	fds     [ pointer! [integer!] ]
	strides [ EGLint-ptr! ]
	offsets [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglExportDMABUFImageQueryMESA!: alias function! [
	dpy        [ EGLDisplay! ]
	image      [ EGLImageKHR! ]
	fourcc     [ pointer! [integer!] ]
	num_planes [ pointer! [integer!] ]
	modifiers  [ EGLuint64KHR-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_MESA_platform_gbm
;-------------------------------------------

#define  EGL_MESA_platform_gbm                        1
#define  EGL_PLATFORM_GBM_MESA                        31D7h


;-------------------------------------------
;-- EGL_MESA_platform_surfaceless
;-------------------------------------------

#define  EGL_MESA_platform_surfaceless                1
#define  EGL_PLATFORM_SURFACELESS_MESA                31DDh


;-------------------------------------------
;-- EGL_NOK_swap_region
;-------------------------------------------

#define  EGL_NOK_swap_region                          1
eglSwapBuffersRegionNOK!: alias function! [
	dpy      [ EGLDisplay! ]
	surface  [ EGLSurface! ]
	numRects [ EGLint! ]
	rects    [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_NOK_swap_region2
;-------------------------------------------

#define  EGL_NOK_swap_region2                         1
eglSwapBuffersRegion2NOK!: alias function! [
	dpy      [ EGLDisplay! ]
	surface  [ EGLSurface! ]
	numRects [ EGLint! ]
	rects    [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_NOK_texture_from_pixmap
;-------------------------------------------

#define  EGL_NOK_texture_from_pixmap                  1
#define  EGL_Y_INVERTED_NOK                           307Fh


;-------------------------------------------
;-- EGL_NV_3dvision_surface
;-------------------------------------------

#define  EGL_NV_3dvision_surface                      1
#define  EGL_AUTO_STEREO_NV                           3136h


;-------------------------------------------
;-- EGL_NV_coverage_sample
;-------------------------------------------

#define  EGL_NV_coverage_sample                       1
#define  EGL_COVERAGE_BUFFERS_NV                      30E0h
#define  EGL_COVERAGE_SAMPLES_NV                      30E1h


;-------------------------------------------
;-- EGL_NV_coverage_sample_resolve
;-------------------------------------------

#define  EGL_NV_coverage_sample_resolve               1
#define  EGL_COVERAGE_SAMPLE_RESOLVE_NV               3131h
#define  EGL_COVERAGE_SAMPLE_RESOLVE_DEFAULT_NV       3132h
#define  EGL_COVERAGE_SAMPLE_RESOLVE_NONE_NV          3133h


;-------------------------------------------
;-- EGL_NV_cuda_event
;-------------------------------------------

#define  EGL_NV_cuda_event                            1
#define  EGL_CUDA_EVENT_HANDLE_NV                     323Bh
#define  EGL_SYNC_CUDA_EVENT_NV                       323Ch
#define  EGL_SYNC_CUDA_EVENT_COMPLETE_NV              323Dh


;-------------------------------------------
;-- EGL_NV_depth_nonlinear
;-------------------------------------------

#define  EGL_NV_depth_nonlinear                       1
#define  EGL_DEPTH_ENCODING_NONE_NV                   0
#define  EGL_DEPTH_ENCODING_NV                        30E2h
#define  EGL_DEPTH_ENCODING_NONLINEAR_NV              30E3h


;-------------------------------------------
;-- EGL_NV_device_cuda
;-------------------------------------------

#define  EGL_NV_device_cuda                           1
#define  EGL_CUDA_DEVICE_NV                           323Ah


;-------------------------------------------
;-- EGL_NV_native_query
;-------------------------------------------

#define  EGL_NV_native_query                          1
eglQueryNativeDisplayNV!: alias function! [
	dpy        [ EGLDisplay! ]
	display_id [ EGLNativeDisplayType-ptr! ]
	return: [ EGLBoolean! ]
]
eglQueryNativePixmapNV!: alias function! [
	dpy     [ EGLDisplay! ]
	surf    [ EGLSurface! ]
	pixmap  [ EGLNativePixmapType-ptr! ]
	return: [ EGLBoolean! ]
]
eglQueryNativeWindowNV!: alias function! [
	dpy     [ EGLDisplay! ]
	surf    [ EGLSurface! ]
	window  [ EGLNativeWindowType-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_NV_post_convert_rounding
;-------------------------------------------

#define  EGL_NV_post_convert_rounding                 1


;-------------------------------------------
;-- EGL_NV_post_sub_buffer
;-------------------------------------------

#define  EGL_NV_post_sub_buffer                       1
#define  EGL_POST_SUB_BUFFER_SUPPORTED_NV             30BEh
eglPostSubBufferNV!: alias function! [
	dpy     [ EGLDisplay! ]
	surface [ EGLSurface! ]
	x       [ EGLint! ]
	y       [ EGLint! ]
	width   [ EGLint! ]
	height  [ EGLint! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_NV_robustness_video_memory_purge
;-------------------------------------------

#define  EGL_NV_robustness_video_memory_purge         1
#define  EGL_GENERATE_RESET_ON_VIDEO_MEMORY_PURGE_NV  334Ch


;-------------------------------------------
;-- EGL_NV_stream_consumer_gltexture_yuv
;-------------------------------------------

#define  EGL_NV_stream_consumer_gltexture_yuv         1
;#define  EGL_YUV_BUFFER_EXT                           3300h
;#define  EGL_YUV_NUMBER_OF_PLANES_EXT                 3311h
#define  EGL_YUV_PLANE0_TEXTURE_UNIT_NV               332Ch
#define  EGL_YUV_PLANE1_TEXTURE_UNIT_NV               332Dh
#define  EGL_YUV_PLANE2_TEXTURE_UNIT_NV               332Eh
eglStreamConsumerGLTextureExternalAttribsNV!: alias function! [
	dpy         [ EGLDisplay! ]
	stream      [ EGLStreamKHR! ]
	attrib_list [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_NV_stream_cross_display
;-------------------------------------------

#define  EGL_NV_stream_cross_display                  1
#define  EGL_STREAM_CROSS_DISPLAY_NV                  334Eh


;-------------------------------------------
;-- EGL_NV_stream_cross_object
;-------------------------------------------

#define  EGL_NV_stream_cross_object                   1
#define  EGL_STREAM_CROSS_OBJECT_NV                   334Dh


;-------------------------------------------
;-- EGL_NV_stream_cross_partition
;-------------------------------------------

#define  EGL_NV_stream_cross_partition                1
#define  EGL_STREAM_CROSS_PARTITION_NV                323Fh


;-------------------------------------------
;-- EGL_NV_stream_cross_process
;-------------------------------------------

#define  EGL_NV_stream_cross_process                  1
#define  EGL_STREAM_CROSS_PROCESS_NV                  3245h


;-------------------------------------------
;-- EGL_NV_stream_cross_system
;-------------------------------------------

#define  EGL_NV_stream_cross_system                   1
#define  EGL_STREAM_CROSS_SYSTEM_NV                   334Fh


;-------------------------------------------
;-- EGL_NV_stream_fifo_next
;-------------------------------------------

#define  EGL_NV_stream_fifo_next                      1
#define  EGL_PENDING_FRAME_NV                         3329h
#define  EGL_STREAM_TIME_PENDING_NV                   332Ah


;-------------------------------------------
;-- EGL_NV_stream_fifo_synchronous
;-------------------------------------------

#define  EGL_NV_stream_fifo_synchronous               1
#define  EGL_STREAM_FIFO_SYNCHRONOUS_NV               3336h


;-------------------------------------------
;-- EGL_NV_stream_frame_limits
;-------------------------------------------

#define  EGL_NV_stream_frame_limits                   1
#define  EGL_PRODUCER_MAX_FRAME_HINT_NV               3337h
#define  EGL_CONSUMER_MAX_FRAME_HINT_NV               3338h


;-------------------------------------------
;-- EGL_NV_stream_metadata
;-------------------------------------------

#define  EGL_NV_stream_metadata                       1
#define  EGL_MAX_STREAM_METADATA_BLOCKS_NV            3250h
#define  EGL_MAX_STREAM_METADATA_BLOCK_SIZE_NV        3251h
#define  EGL_MAX_STREAM_METADATA_TOTAL_SIZE_NV        3252h
#define  EGL_PRODUCER_METADATA_NV                     3253h
#define  EGL_CONSUMER_METADATA_NV                     3254h
#define  EGL_METADATA0_SIZE_NV                        3255h
#define  EGL_METADATA1_SIZE_NV                        3256h
#define  EGL_METADATA2_SIZE_NV                        3257h
#define  EGL_METADATA3_SIZE_NV                        3258h
#define  EGL_METADATA0_TYPE_NV                        3259h
#define  EGL_METADATA1_TYPE_NV                        325Ah
#define  EGL_METADATA2_TYPE_NV                        325Bh
#define  EGL_METADATA3_TYPE_NV                        325Ch
#define  EGL_PENDING_METADATA_NV                      3328h
eglQueryDisplayAttribNV!: alias function! [
	dpy       [ EGLDisplay! ]
	attribute [ EGLint! ]
	value     [ EGLAttrib-ptr! ]
	return: [ EGLBoolean! ]
]
eglQueryStreamMetadataNV!: alias function! [
	dpy     [ EGLDisplay! ]
	stream  [ EGLStreamKHR! ]
	name    [ EGLenum! ]
	n       [ EGLint! ]
	offset  [ EGLint! ]
	size    [ EGLint! ]
	data    [ pointer! [byte!] ]
	return: [ EGLBoolean! ]
]
eglSetStreamMetadataNV!: alias function! [
	dpy     [ EGLDisplay! ]
	stream  [ EGLStreamKHR! ]
	n       [ EGLint! ]
	offset  [ EGLint! ]
	size    [ EGLint! ]
	data    [ pointer! [byte!] ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_NV_stream_remote
;-------------------------------------------

#define  EGL_NV_stream_remote                         1
#define  EGL_STREAM_STATE_INITIALIZING_NV             3240h
#define  EGL_STREAM_TYPE_NV                           3241h
#define  EGL_STREAM_PROTOCOL_NV                       3242h
#define  EGL_STREAM_ENDPOINT_NV                       3243h
#define  EGL_STREAM_LOCAL_NV                          3244h
#define  EGL_STREAM_PROTOCOL_FD_NV                    3246h
#define  EGL_STREAM_PRODUCER_NV                       3247h
#define  EGL_STREAM_CONSUMER_NV                       3248h


;-------------------------------------------
;-- EGL_NV_stream_reset
;-------------------------------------------

#define  EGL_NV_stream_reset                          1
#define  EGL_SUPPORT_RESET_NV                         3334h
#define  EGL_SUPPORT_REUSE_NV                         3335h
eglResetStreamNV!: alias function! [
	dpy     [ EGLDisplay! ]
	stream  [ EGLStreamKHR! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_NV_stream_socket
;-------------------------------------------

#define  EGL_NV_stream_socket                         1
#define  EGL_STREAM_PROTOCOL_SOCKET_NV                324Bh
#define  EGL_SOCKET_HANDLE_NV                         324Ch
#define  EGL_SOCKET_TYPE_NV                           324Dh


;-------------------------------------------
;-- EGL_NV_stream_socket_inet
;-------------------------------------------

#define  EGL_NV_stream_socket_inet                    1
#define  EGL_SOCKET_TYPE_INET_NV                      324Fh


;-------------------------------------------
;-- EGL_NV_stream_socket_unix
;-------------------------------------------

#define  EGL_NV_stream_socket_unix                    1
#define  EGL_SOCKET_TYPE_UNIX_NV                      324Eh


;-------------------------------------------
;-- EGL_NV_stream_sync
;-------------------------------------------

#define  EGL_NV_stream_sync                           1
;#define  EGL_SYNC_TYPE_KHR                            30F7h
#define  EGL_SYNC_NEW_FRAME_NV                        321Fh
eglCreateStreamSyncNV!: alias function! [
	dpy         [ EGLDisplay! ]
	stream      [ EGLStreamKHR! ]
	type        [ EGLenum! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLSyncKHR! ]
]


;-------------------------------------------
;-- EGL_NV_sync
;-------------------------------------------

#define  EGL_NV_sync                                  1
#define  EGL_SYNC_FLUSH_COMMANDS_BIT_NV               0001h
#define  EGL_SYNC_PRIOR_COMMANDS_COMPLETE_NV          30E6h
#define  EGL_SYNC_STATUS_NV                           30E7h
#define  EGL_SIGNALED_NV                              30E8h
#define  EGL_UNSIGNALED_NV                            30E9h
#define  EGL_ALREADY_SIGNALED_NV                      30EAh
#define  EGL_TIMEOUT_EXPIRED_NV                       30EBh
#define  EGL_CONDITION_SATISFIED_NV                   30ECh
#define  EGL_SYNC_TYPE_NV                             30EDh
#define  EGL_SYNC_CONDITION_NV                        30EEh
#define  EGL_SYNC_FENCE_NV                            30EFh
#define  EGL_FOREVER_NV                               FFFFFFFFFFFFFFFFh
eglClientWaitSyncNV!: alias function! [
	sync    [ EGLSyncNV! ]
	flags   [ EGLint! ]
	timeout [ EGLTimeNV! ]
	return: [ EGLint! ]
]
eglCreateFenceSyncNV!: alias function! [
	dpy         [ EGLDisplay! ]
	condition   [ EGLenum! ]
	attrib_list [ EGLint-ptr! ]
	return: [ EGLSyncNV! ]
]
eglDestroySyncNV!: alias function! [
	sync    [ EGLSyncNV! ]
	return: [ EGLBoolean! ]
]
eglFenceNV!: alias function! [
	sync    [ EGLSyncNV! ]
	return: [ EGLBoolean! ]
]
eglGetSyncAttribNV!: alias function! [
	sync      [ EGLSyncNV! ]
	attribute [ EGLint! ]
	value     [ EGLint-ptr! ]
	return: [ EGLBoolean! ]
]
eglSignalSyncNV!: alias function! [
	sync    [ EGLSyncNV! ]
	mode    [ EGLenum! ]
	return: [ EGLBoolean! ]
]


;-------------------------------------------
;-- EGL_NV_system_time
;-------------------------------------------

#define  EGL_NV_system_time                           1
eglGetSystemTimeFrequencyNV!: alias function! [
	return: [ EGLuint64NV! ]
]
eglGetSystemTimeNV!: alias function! [
	return: [ EGLuint64NV! ]
]


;-------------------------------------------
;-- EGL_TIZEN_image_native_buffer
;-------------------------------------------

#define  EGL_TIZEN_image_native_buffer                1
#define  EGL_NATIVE_BUFFER_TIZEN                      32A0h


;-------------------------------------------
;-- EGL_TIZEN_image_native_surface
;-------------------------------------------

#define  EGL_TIZEN_image_native_surface               1
#define  EGL_NATIVE_SURFACE_TIZEN                     32A1h
] ;end of #if OS = 'Android