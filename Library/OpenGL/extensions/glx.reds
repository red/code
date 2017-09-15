Red/System [
	Title:   "Red/System OpenGL binding - GLX 1.3 and above API and GLX extension interfaces"
	Author:  "Oldes"
	File: 	 %glx.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
This source was made from glxew.h file, which contains these copyrights:

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

;--> content of this file makes sense only on Linux <--

#if OS = 'Linux  [

;@@ some of these should be in shared definitions for Linux

#define Colormap!                    handle!
#define GLXContext!                  handle!
#define GLXContextID!                handle!
#define GLXDrawable!                 handle!
#define GLXFBConfig!                 handle!
#define GLXFBConfigSGIX!             handle!
#define GLXPbuffer!                  handle!
#define GLXPixmap!                   handle!
#define GLXVideoCaptureDeviceNV!     handle!
#define GLXVideoDeviceNV!            handle!
#define GLXWindow!                   handle!
#define Pixmap!                      handle!
#define Status!                      handle!
#define Window!                      handle!

#define Display-ptr!                 handle-ptr!
#define GLXFBConfig-ptr!             handle-ptr!
#define GLXFBConfigSGIX-ptr!         handle-ptr!
#define GLXHyperpipeConfigSGIX-ptr!  handle-ptr!
#define GLXHyperpipeNetworkSGIX-ptr! handle-ptr!
#define GLXVideoCaptureDeviceNV-ptr! handle-ptr!
#define GLXVideoDeviceNV-ptr!        handle-ptr!
#define XVisualInfo-ptr!             handle-ptr!




;-------------------------------------------
;-- GLX_VERSION_1_0
;-------------------------------------------

#define  GLX_VERSION_1_0                              1
#define  GLX_USE_GL                                   1
#define  GLX_BUFFER_SIZE                              2
#define  GLX_LEVEL                                    3
#define  GLX_RGBA                                     4
#define  GLX_DOUBLEBUFFER                             5
#define  GLX_STEREO                                   6
#define  GLX_AUX_BUFFERS                              7
#define  GLX_RED_SIZE                                 8
#define  GLX_GREEN_SIZE                               9
#define  GLX_BLUE_SIZE                                10
#define  GLX_ALPHA_SIZE                               11
#define  GLX_DEPTH_SIZE                               12
#define  GLX_STENCIL_SIZE                             13
#define  GLX_ACCUM_RED_SIZE                           14
#define  GLX_ACCUM_GREEN_SIZE                         15
#define  GLX_ACCUM_BLUE_SIZE                          16
#define  GLX_ACCUM_ALPHA_SIZE                         17
#define  GLX_BAD_SCREEN                               1
#define  GLX_BAD_ATTRIBUTE                            2
#define  GLX_NO_EXTENSION                             3
#define  GLX_BAD_VISUAL                               4
#define  GLX_BAD_CONTEXT                              5
#define  GLX_BAD_VALUE                                6
#define  GLX_BAD_ENUM                                 7


;-------------------------------------------
;-- GLX_VERSION_1_1
;-------------------------------------------

#define  GLXEW_VERSION_1_0                           GLX_VERSION_1_1
#define  GLX_VENDOR                                   01h
#define  GLX_VERSION                                  02h
#define  GLX_EXTENSIONS                               03h


;-------------------------------------------
;-- GLX_VERSION_1_2
;-------------------------------------------

#define  GLX_VERSION_1_2                              1
glXGetCurrentDisplay!: alias function! [
	return: [ Display-ptr! ]
]


;-------------------------------------------
;-- GLX_VERSION_1_3
;-------------------------------------------

#define  GLX_VERSION_1_3                              1
#define  GLX_FRONT_LEFT_BUFFER_BIT                    00000001h
#define  GLX_RGBA_BIT                                 00000001h
#define  GLX_WINDOW_BIT                               00000001h
#define  GLX_COLOR_INDEX_BIT                          00000002h
#define  GLX_FRONT_RIGHT_BUFFER_BIT                   00000002h
#define  GLX_PIXMAP_BIT                               00000002h
#define  GLX_BACK_LEFT_BUFFER_BIT                     00000004h
#define  GLX_PBUFFER_BIT                              00000004h
#define  GLX_BACK_RIGHT_BUFFER_BIT                    00000008h
#define  GLX_AUX_BUFFERS_BIT                          00000010h
#define  GLX_CONFIG_CAVEAT                            20h
#define  GLX_DEPTH_BUFFER_BIT                         00000020h
#define  GLX_X_VISUAL_TYPE                            22h
#define  GLX_TRANSPARENT_TYPE                         23h
#define  GLX_TRANSPARENT_INDEX_VALUE                  24h
#define  GLX_TRANSPARENT_RED_VALUE                    25h
#define  GLX_TRANSPARENT_GREEN_VALUE                  26h
#define  GLX_TRANSPARENT_BLUE_VALUE                   27h
#define  GLX_TRANSPARENT_ALPHA_VALUE                  28h
#define  GLX_STENCIL_BUFFER_BIT                       00000040h
#define  GLX_ACCUM_BUFFER_BIT                         00000080h
#define  GLX_NONE                                     8000h
#define  GLX_SLOW_CONFIG                              8001h
#define  GLX_TRUE_COLOR                               8002h
#define  GLX_DIRECT_COLOR                             8003h
#define  GLX_PSEUDO_COLOR                             8004h
#define  GLX_STATIC_COLOR                             8005h
#define  GLX_GRAY_SCALE                               8006h
#define  GLX_STATIC_GRAY                              8007h
#define  GLX_TRANSPARENT_RGB                          8008h
#define  GLX_TRANSPARENT_INDEX                        8009h
#define  GLX_VISUAL_ID                                800Bh
#define  GLX_SCREEN                                   800Ch
#define  GLX_NON_CONFORMANT_CONFIG                    800Dh
#define  GLX_DRAWABLE_TYPE                            8010h
#define  GLX_RENDER_TYPE                              8011h
#define  GLX_X_RENDERABLE                             8012h
#define  GLX_FBCONFIG_ID                              8013h
#define  GLX_RGBA_TYPE                                8014h
#define  GLX_COLOR_INDEX_TYPE                         8015h
#define  GLX_MAX_PBUFFER_WIDTH                        8016h
#define  GLX_MAX_PBUFFER_HEIGHT                       8017h
#define  GLX_MAX_PBUFFER_PIXELS                       8018h
#define  GLX_PRESERVED_CONTENTS                       801Bh
#define  GLX_LARGEST_PBUFFER                          801Ch
#define  GLX_WIDTH                                    801Dh
#define  GLX_HEIGHT                                   801Eh
#define  GLX_EVENT_MASK                               801Fh
#define  GLX_DAMAGED                                  8020h
#define  GLX_SAVED                                    8021h
#define  GLX_WINDOW                                   8022h
#define  GLX_PBUFFER                                  8023h
#define  GLX_PBUFFER_HEIGHT                           8040h
#define  GLX_PBUFFER_WIDTH                            8041h
#define  GLX_PBUFFER_CLOBBER_MASK                     08000000h
#define  GLX_DONT_CARE                                FFFFFFFFh
glXChooseFBConfig!: alias function! [
	dpy         [ Display-ptr! ]
	screen      [ integer! ]
	attrib_list [ pointer! [integer!] ]
	nelements   [ pointer! [integer!] ]
	return: [ GLXFBConfig-ptr! ]
]
glXCreateNewContext!: alias function! [
	dpy         [ Display-ptr! ]
	config      [ GLXFBConfig! ]
	render_type [ integer! ]
	share_list  [ GLXContext! ]
	direct      [ logic! ]
	return: [ GLXContext! ]
]
glXCreatePbuffer!: alias function! [
	dpy         [ Display-ptr! ]
	config      [ GLXFBConfig! ]
	attrib_list [ pointer! [integer!] ]
	return: [ GLXPbuffer! ]
]
glXCreatePixmap!: alias function! [
	dpy         [ Display-ptr! ]
	config      [ GLXFBConfig! ]
	pixmap      [ Pixmap! ]
	attrib_list [ pointer! [integer!] ]
	return: [ GLXPixmap! ]
]
glXCreateWindow!: alias function! [
	dpy         [ Display-ptr! ]
	config      [ GLXFBConfig! ]
	win         [ Window! ]
	attrib_list [ pointer! [integer!] ]
	return: [ GLXWindow! ]
]
glXDestroyPbuffer!: alias function! [
	dpy     [ Display-ptr! ]
	pbuf    [ GLXPbuffer! ]
]
glXDestroyPixmap!: alias function! [
	dpy     [ Display-ptr! ]
	pixmap  [ GLXPixmap! ]
]
glXDestroyWindow!: alias function! [
	dpy     [ Display-ptr! ]
	win     [ GLXWindow! ]
]
glXGetCurrentReadDrawable!: alias function! [
	return: [ GLXDrawable! ]
]
glXGetFBConfigAttrib!: alias function! [
	dpy       [ Display-ptr! ]
	config    [ GLXFBConfig! ]
	attribute [ integer! ]
	value     [ pointer! [integer!] ]
	return: [ integer! ]
]
glXGetFBConfigs!: alias function! [
	dpy       [ Display-ptr! ]
	screen    [ integer! ]
	nelements [ pointer! [integer!] ]
	return: [ GLXFBConfig-ptr! ]
]
glXGetSelectedEvent!: alias function! [
	dpy        [ Display-ptr! ]
	draw       [ GLXDrawable! ]
	event_mask [ pointer! [integer!] ]
]
glXGetVisualFromFBConfig!: alias function! [
	dpy     [ Display-ptr! ]
	config  [ GLXFBConfig! ]
	return: [ XVisualInfo-ptr! ]
]
glXMakeContextCurrent!: alias function! [
	display [ Display-ptr! ]
	draw    [ GLXDrawable! ]
	read    [ GLXDrawable! ]
	ctx     [ GLXContext! ]
	return: [ logic! ]
]
glXQueryContext!: alias function! [
	dpy       [ Display-ptr! ]
	ctx       [ GLXContext! ]
	attribute [ integer! ]
	value     [ pointer! [integer!] ]
	return: [ integer! ]
]
glXQueryDrawable!: alias function! [
	dpy       [ Display-ptr! ]
	draw      [ GLXDrawable! ]
	attribute [ integer! ]
	value     [ pointer! [integer!] ]
]
glXSelectEvent!: alias function! [
	dpy        [ Display-ptr! ]
	draw       [ GLXDrawable! ]
	event_mask [ integer! ]
]


;-------------------------------------------
;-- GLX_VERSION_1_4
;-------------------------------------------

#define  GLX_VERSION_1_4                              1
#define  GLX_SAMPLE_BUFFERS                           100000
#define  GLX_SAMPLES                                  100001


;-------------------------------------------
;-- GLX_3DFX_multisample
;-------------------------------------------

#define  GLX_3DFX_multisample                         1
#define  GLX_SAMPLE_BUFFERS_3DFX                      8050h
#define  GLX_SAMPLES_3DFX                             8051h


;-------------------------------------------
;-- GLX_AMD_gpu_association
;-------------------------------------------

#define  GLX_AMD_gpu_association                      1
#define  GLX_GPU_VENDOR_AMD                           1F00h
#define  GLX_GPU_RENDERER_STRING_AMD                  1F01h
#define  GLX_GPU_OPENGL_VERSION_STRING_AMD            1F02h
#define  GLX_GPU_FASTEST_TARGET_GPUS_AMD              21A2h
#define  GLX_GPU_RAM_AMD                              21A3h
#define  GLX_GPU_CLOCK_AMD                            21A4h
#define  GLX_GPU_NUM_PIPES_AMD                        21A5h
#define  GLX_GPU_NUM_SIMD_AMD                         21A6h
#define  GLX_GPU_NUM_RB_AMD                           21A7h
#define  GLX_GPU_NUM_SPI_AMD                          21A8h
glXBlitContextFramebufferAMD!: alias function! [
	dstCtx  [ GLXContext! ]
	srcX0   [ GLint! ]
	srcY0   [ GLint! ]
	srcX1   [ GLint! ]
	srcY1   [ GLint! ]
	dstX0   [ GLint! ]
	dstY0   [ GLint! ]
	dstX1   [ GLint! ]
	dstY1   [ GLint! ]
	mask    [ GLbitfield! ]
	filter  [ GLenum! ]
]
glXCreateAssociatedContextAMD!: alias function! [
	id         [ integer! ]
	share_list [ GLXContext! ]
	return: [ GLXContext! ]
]
glXCreateAssociatedContextAttribsAMD!: alias function! [
	id            [ integer! ]
	share_context [ GLXContext! ]
	attribList    [ pointer! [integer!] ]
	return: [ GLXContext! ]
]
glXDeleteAssociatedContextAMD!: alias function! [
	ctx     [ GLXContext! ]
	return: [ logic! ]
]
glXGetContextGPUIDAMD!: alias function! [
	ctx     [ GLXContext! ]
	return: [ integer! ]
]
glXGetCurrentAssociatedContextAMD!: alias function! [
	return: [ GLXContext! ]
]
glXGetGPUIDsAMD!: alias function! [
	maxCount [ integer! ]
	ids      [ pointer! [integer!] ]
	return: [ integer! ]
]
glXGetGPUInfoAMD!: alias function! [
	id       [ integer! ]
	property [ integer! ]
	dataType [ GLenum! ]
	size     [ integer! ]
	data     [ pointer! [byte!] ]
	return: [ integer! ]
]
glXMakeAssociatedContextCurrentAMD!: alias function! [
	ctx     [ GLXContext! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- GLX_ARB_context_flush_control
;-------------------------------------------

#define  GLX_ARB_context_flush_control                1


;-------------------------------------------
;-- GLX_ARB_create_context
;-------------------------------------------

#define  GLX_ARB_create_context                       1
#define  GLX_CONTEXT_DEBUG_BIT_ARB                    0001h
#define  GLX_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB       0002h
#define  GLX_CONTEXT_MAJOR_VERSION_ARB                2091h
#define  GLX_CONTEXT_MINOR_VERSION_ARB                2092h
#define  GLX_CONTEXT_FLAGS_ARB                        2094h
glXCreateContextAttribsARB!: alias function! [
	dpy           [ Display-ptr! ]
	config        [ GLXFBConfig! ]
	share_context [ GLXContext! ]
	direct        [ logic! ]
	attrib_list   [ pointer! [integer!] ]
	return: [ GLXContext! ]
]


;-------------------------------------------
;-- GLX_ARB_create_context_no_error
;-------------------------------------------

#define  GLX_ARB_create_context_no_error              1


;-------------------------------------------
;-- GLX_ARB_create_context_profile
;-------------------------------------------

#define  GLX_ARB_create_context_profile               1
#define  GLX_CONTEXT_CORE_PROFILE_BIT_ARB             00000001h
#define  GLX_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB    00000002h
#define  GLX_CONTEXT_PROFILE_MASK_ARB                 9126h


;-------------------------------------------
;-- GLX_ARB_create_context_robustness
;-------------------------------------------

#define  GLX_ARB_create_context_robustness            1
#define  GLX_CONTEXT_ROBUST_ACCESS_BIT_ARB            00000004h
#define  GLX_LOSE_CONTEXT_ON_RESET_ARB                8252h
#define  GLX_CONTEXT_RESET_NOTIFICATION_STRATEGY_ARB  8256h
#define  GLX_NO_RESET_NOTIFICATION_ARB                8261h


;-------------------------------------------
;-- GLX_ARB_fbconfig_float
;-------------------------------------------

#define  GLX_ARB_fbconfig_float                       1
#define  GLX_RGBA_FLOAT_BIT_ARB                       00000004h
#define  GLX_RGBA_FLOAT_TYPE_ARB                      20B9h


;-------------------------------------------
;-- GLX_ARB_framebuffer_sRGB
;-------------------------------------------

#define  GLX_ARB_framebuffer_sRGB                     1
#define  GLX_FRAMEBUFFER_SRGB_CAPABLE_ARB             20B2h


;-------------------------------------------
;-- GLX_ARB_get_proc_address
;-------------------------------------------

#define  GLX_ARB_get_proc_address                     1


;-------------------------------------------
;-- GLX_ARB_multisample
;-------------------------------------------

#define  GLX_ARB_multisample                          1
#define  GLX_SAMPLE_BUFFERS_ARB                       100000
#define  GLX_SAMPLES_ARB                              100001


;-------------------------------------------
;-- GLX_ARB_robustness_application_isolation
;-------------------------------------------

#define  GLX_ARB_robustness_application_isolation     1
#define  GLX_CONTEXT_RESET_ISOLATION_BIT_ARB          00000008h


;-------------------------------------------
;-- GLX_ARB_robustness_share_group_isolation
;-------------------------------------------

#define  GLX_ARB_robustness_share_group_isolation     1
;#define  GLX_CONTEXT_RESET_ISOLATION_BIT_ARB          00000008h


;-------------------------------------------
;-- GLX_ARB_vertex_buffer_object
;-------------------------------------------

#define  GLX_ARB_vertex_buffer_object                 1
#define  GLX_CONTEXT_ALLOW_BUFFER_BYTE_ORDER_MISMATCH_ARB  2095h


;-------------------------------------------
;-- GLX_ATI_pixel_format_float
;-------------------------------------------

#define  GLX_ATI_pixel_format_float                   1
#define  GLX_RGBA_FLOAT_ATI_BIT                       00000100h


;-------------------------------------------
;-- GLX_ATI_render_texture
;-------------------------------------------

#define  GLX_ATI_render_texture                       1
#define  GLX_BIND_TO_TEXTURE_RGB_ATI                  9800h
#define  GLX_BIND_TO_TEXTURE_RGBA_ATI                 9801h
#define  GLX_TEXTURE_FORMAT_ATI                       9802h
#define  GLX_TEXTURE_TARGET_ATI                       9803h
#define  GLX_MIPMAP_TEXTURE_ATI                       9804h
#define  GLX_TEXTURE_RGB_ATI                          9805h
#define  GLX_TEXTURE_RGBA_ATI                         9806h
#define  GLX_NO_TEXTURE_ATI                           9807h
#define  GLX_TEXTURE_CUBE_MAP_ATI                     9808h
#define  GLX_TEXTURE_1D_ATI                           9809h
#define  GLX_TEXTURE_2D_ATI                           980Ah
#define  GLX_MIPMAP_LEVEL_ATI                         980Bh
#define  GLX_CUBE_MAP_FACE_ATI                        980Ch
#define  GLX_TEXTURE_CUBE_MAP_POSITIVE_X_ATI          980Dh
#define  GLX_TEXTURE_CUBE_MAP_NEGATIVE_X_ATI          980Eh
#define  GLX_TEXTURE_CUBE_MAP_POSITIVE_Y_ATI          980Fh
#define  GLX_TEXTURE_CUBE_MAP_NEGATIVE_Y_ATI          9810h
#define  GLX_TEXTURE_CUBE_MAP_POSITIVE_Z_ATI          9811h
#define  GLX_TEXTURE_CUBE_MAP_NEGATIVE_Z_ATI          9812h
#define  GLX_FRONT_LEFT_ATI                           9813h
#define  GLX_FRONT_RIGHT_ATI                          9814h
#define  GLX_BACK_LEFT_ATI                            9815h
#define  GLX_BACK_RIGHT_ATI                           9816h
#define  GLX_AUX0_ATI                                 9817h
#define  GLX_AUX1_ATI                                 9818h
#define  GLX_AUX2_ATI                                 9819h
#define  GLX_AUX3_ATI                                 981Ah
#define  GLX_AUX4_ATI                                 981Bh
#define  GLX_AUX5_ATI                                 981Ch
#define  GLX_AUX6_ATI                                 981Dh
#define  GLX_AUX7_ATI                                 981Eh
#define  GLX_AUX8_ATI                                 981Fh
#define  GLX_AUX9_ATI                                 9820h
#define  GLX_BIND_TO_TEXTURE_LUMINANCE_ATI            9821h
#define  GLX_BIND_TO_TEXTURE_INTENSITY_ATI            9822h
glXBindTexImageATI!: alias function! [
	dpy     [ Display-ptr! ]
	pbuf    [ GLXPbuffer! ]
	buffer  [ integer! ]
]
glXDrawableAttribATI!: alias function! [
	dpy         [ Display-ptr! ]
	draw        [ GLXDrawable! ]
	attrib_list [ pointer! [integer!] ]
]
glXReleaseTexImageATI!: alias function! [
	dpy     [ Display-ptr! ]
	pbuf    [ GLXPbuffer! ]
	buffer  [ integer! ]
]


;-------------------------------------------
;-- GLX_EXT_buffer_age
;-------------------------------------------

#define  GLX_EXT_buffer_age                           1
#define  GLX_BACK_BUFFER_AGE_EXT                      20F4h


;-------------------------------------------
;-- GLX_EXT_create_context_es2_profile
;-------------------------------------------

#define  GLX_EXT_create_context_es2_profile           1
#define  GLX_CONTEXT_ES2_PROFILE_BIT_EXT              00000004h


;-------------------------------------------
;-- GLX_EXT_create_context_es_profile
;-------------------------------------------

#define  GLX_EXT_create_context_es_profile            1
#define  GLX_CONTEXT_ES_PROFILE_BIT_EXT               00000004h


;-------------------------------------------
;-- GLX_EXT_fbconfig_packed_float
;-------------------------------------------

#define  GLX_EXT_fbconfig_packed_float                1
#define  GLX_RGBA_UNSIGNED_FLOAT_BIT_EXT              00000008h
#define  GLX_RGBA_UNSIGNED_FLOAT_TYPE_EXT             20B1h


;-------------------------------------------
;-- GLX_EXT_framebuffer_sRGB
;-------------------------------------------

#define  GLX_EXT_framebuffer_sRGB                     1
#define  GLX_FRAMEBUFFER_SRGB_CAPABLE_EXT             20B2h


;-------------------------------------------
;-- GLX_EXT_import_context
;-------------------------------------------

#define  GLX_EXT_import_context                       1
#define  GLX_SHARE_CONTEXT_EXT                        800Ah
#define  GLX_VISUAL_ID_EXT                            800Bh
#define  GLX_SCREEN_EXT                               800Ch
glXFreeContextEXT!: alias function! [
	dpy     [ Display-ptr! ]
	context [ GLXContext! ]
]
glXGetContextIDEXT!: alias function! [
	context [ GLXContext! ]
	return: [ GLXContextID! ]
]
glXImportContextEXT!: alias function! [
	dpy       [ Display-ptr! ]
	contextID [ GLXContextID! ]
	return: [ GLXContext! ]
]
glXQueryContextInfoEXT!: alias function! [
	dpy       [ Display-ptr! ]
	context   [ GLXContext! ]
	attribute [ integer! ]
	value     [ pointer! [integer!] ]
	return: [ integer! ]
]


;-------------------------------------------
;-- GLX_EXT_libglvnd
;-------------------------------------------

#define  GLX_EXT_libglvnd                             1
#define  GLX_VENDOR_NAMES_EXT                         20F6h


;-------------------------------------------
;-- GLX_EXT_scene_marker
;-------------------------------------------

#define  GLX_EXT_scene_marker                         1


;-------------------------------------------
;-- GLX_EXT_stereo_tree
;-------------------------------------------

#define  GLX_EXT_stereo_tree                          1
#define  GLX_STEREO_NOTIFY_EXT                        00000000h
#define  GLX_STEREO_NOTIFY_MASK_EXT                   00000001h
#define  GLX_STEREO_TREE_EXT                          20F5h


;-------------------------------------------
;-- GLX_EXT_swap_control
;-------------------------------------------

#define  GLX_EXT_swap_control                         1
#define  GLX_SWAP_INTERVAL_EXT                        20F1h
#define  GLX_MAX_SWAP_INTERVAL_EXT                    20F2h
glXSwapIntervalEXT!: alias function! [
	dpy      [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	interval [ integer! ]
]


;-------------------------------------------
;-- GLX_EXT_swap_control_tear
;-------------------------------------------

#define  GLX_EXT_swap_control_tear                    1
#define  GLX_LATE_SWAPS_TEAR_EXT                      20F3h


;-------------------------------------------
;-- GLX_EXT_texture_from_pixmap
;-------------------------------------------

#define  GLX_EXT_texture_from_pixmap                  1
#define  GLX_TEXTURE_1D_BIT_EXT                       00000001h
#define  GLX_TEXTURE_2D_BIT_EXT                       00000002h
#define  GLX_TEXTURE_RECTANGLE_BIT_EXT                00000004h
#define  GLX_BIND_TO_TEXTURE_RGB_EXT                  20D0h
#define  GLX_BIND_TO_TEXTURE_RGBA_EXT                 20D1h
#define  GLX_BIND_TO_MIPMAP_TEXTURE_EXT               20D2h
#define  GLX_BIND_TO_TEXTURE_TARGETS_EXT              20D3h
#define  GLX_Y_INVERTED_EXT                           20D4h
#define  GLX_TEXTURE_FORMAT_EXT                       20D5h
#define  GLX_TEXTURE_TARGET_EXT                       20D6h
#define  GLX_MIPMAP_TEXTURE_EXT                       20D7h
#define  GLX_TEXTURE_FORMAT_NONE_EXT                  20D8h
#define  GLX_TEXTURE_FORMAT_RGB_EXT                   20D9h
#define  GLX_TEXTURE_FORMAT_RGBA_EXT                  20DAh
#define  GLX_TEXTURE_1D_EXT                           20DBh
#define  GLX_TEXTURE_2D_EXT                           20DCh
#define  GLX_TEXTURE_RECTANGLE_EXT                    20DDh
#define  GLX_FRONT_LEFT_EXT                           20DEh
#define  GLX_FRONT_RIGHT_EXT                          20DFh
#define  GLX_BACK_LEFT_EXT                            20E0h
#define  GLX_BACK_RIGHT_EXT                           20E1h
#define  GLX_AUX0_EXT                                 20E2h
#define  GLX_AUX1_EXT                                 20E3h
#define  GLX_AUX2_EXT                                 20E4h
#define  GLX_AUX3_EXT                                 20E5h
#define  GLX_AUX4_EXT                                 20E6h
#define  GLX_AUX5_EXT                                 20E7h
#define  GLX_AUX6_EXT                                 20E8h
#define  GLX_AUX7_EXT                                 20E9h
#define  GLX_AUX8_EXT                                 20EAh
#define  GLX_AUX9_EXT                                 20EBh
glXBindTexImageEXT!: alias function! [
	display     [ Display-ptr! ]
	drawable    [ GLXDrawable! ]
	buffer      [ integer! ]
	attrib_list [ pointer! [integer!] ]
]
glXReleaseTexImageEXT!: alias function! [
	display  [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	buffer   [ integer! ]
]


;-------------------------------------------
;-- GLX_EXT_visual_info
;-------------------------------------------

#define  GLX_EXT_visual_info                          1
#define  GLX_X_VISUAL_TYPE_EXT                        22h
#define  GLX_TRANSPARENT_TYPE_EXT                     23h
#define  GLX_TRANSPARENT_INDEX_VALUE_EXT              24h
#define  GLX_TRANSPARENT_RED_VALUE_EXT                25h
#define  GLX_TRANSPARENT_GREEN_VALUE_EXT              26h
#define  GLX_TRANSPARENT_BLUE_VALUE_EXT               27h
#define  GLX_TRANSPARENT_ALPHA_VALUE_EXT              28h
#define  GLX_NONE_EXT                                 8000h
#define  GLX_TRUE_COLOR_EXT                           8002h
#define  GLX_DIRECT_COLOR_EXT                         8003h
#define  GLX_PSEUDO_COLOR_EXT                         8004h
#define  GLX_STATIC_COLOR_EXT                         8005h
#define  GLX_GRAY_SCALE_EXT                           8006h
#define  GLX_STATIC_GRAY_EXT                          8007h
#define  GLX_TRANSPARENT_RGB_EXT                      8008h
#define  GLX_TRANSPARENT_INDEX_EXT                    8009h


;-------------------------------------------
;-- GLX_EXT_visual_rating
;-------------------------------------------

#define  GLX_EXT_visual_rating                        1
#define  GLX_VISUAL_CAVEAT_EXT                        20h
#define  GLX_SLOW_VISUAL_EXT                          8001h
#define  GLX_NON_CONFORMANT_VISUAL_EXT                800Dh


;-------------------------------------------
;-- GLX_INTEL_swap_event
;-------------------------------------------

#define  GLX_INTEL_swap_event                         1
#define  GLX_EXCHANGE_COMPLETE_INTEL                  8180h
#define  GLX_COPY_COMPLETE_INTEL                      8181h
#define  GLX_FLIP_COMPLETE_INTEL                      8182h
#define  GLX_BUFFER_SWAP_COMPLETE_INTEL_MASK          04000000h


;-------------------------------------------
;-- GLX_MESA_agp_offset
;-------------------------------------------

#define  GLX_MESA_agp_offset                          1
glXGetAGPOffsetMESA!: alias function! [
	pointer [ pointer! [byte!] ]
	return: [ integer! ]
]


;-------------------------------------------
;-- GLX_MESA_copy_sub_buffer
;-------------------------------------------

#define  GLX_MESA_copy_sub_buffer                     1
glXCopySubBufferMESA!: alias function! [
	dpy      [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	x        [ integer! ]
	y        [ integer! ]
	width    [ integer! ]
	height   [ integer! ]
]


;-------------------------------------------
;-- GLX_MESA_pixmap_colormap
;-------------------------------------------

#define  GLX_MESA_pixmap_colormap                     1
glXCreateGLXPixmapMESA!: alias function! [
	dpy     [ Display-ptr! ]
	visual  [ XVisualInfo-ptr! ]
	pixmap  [ Pixmap! ]
	cmap    [ Colormap! ]
	return: [ GLXPixmap! ]
]


;-------------------------------------------
;-- GLX_MESA_query_renderer
;-------------------------------------------

#define  GLX_MESA_query_renderer                      1
#define  GLX_RENDERER_VENDOR_ID_MESA                  8183h
#define  GLX_RENDERER_DEVICE_ID_MESA                  8184h
#define  GLX_RENDERER_VERSION_MESA                    8185h
#define  GLX_RENDERER_ACCELERATED_MESA                8186h
#define  GLX_RENDERER_VIDEO_MEMORY_MESA               8187h
#define  GLX_RENDERER_UNIFIED_MEMORY_ARCHITECTURE_MESA  8188h
#define  GLX_RENDERER_PREFERRED_PROFILE_MESA          8189h
#define  GLX_RENDERER_OPENGL_CORE_PROFILE_VERSION_MESA  818Ah
#define  GLX_RENDERER_OPENGL_COMPATIBILITY_PROFILE_VERSION_MESA  818Bh
#define  GLX_RENDERER_OPENGL_ES_PROFILE_VERSION_MESA  818Ch
#define  GLX_RENDERER_OPENGL_ES2_PROFILE_VERSION_MESA  818Dh
#define  GLX_RENDERER_ID_MESA                         818Eh
glXQueryCurrentRendererIntegerMESA!: alias function! [
	attribute [ integer! ]
	value     [ pointer! [integer!] ]
	return: [ logic! ]
]
glXQueryCurrentRendererStringMESA!: alias function! [
	attribute [ integer! ]
	return: [ c-string! ]
]
glXQueryRendererIntegerMESA!: alias function! [
	dpy       [ Display-ptr! ]
	screen    [ integer! ]
	renderer  [ integer! ]
	attribute [ integer! ]
	value     [ pointer! [integer!] ]
	return: [ logic! ]
]
glXQueryRendererStringMESA!: alias function! [
	dpy       [ Display-ptr! ]
	screen    [ integer! ]
	renderer  [ integer! ]
	attribute [ integer! ]
	return: [ c-string! ]
]


;-------------------------------------------
;-- GLX_MESA_release_buffers
;-------------------------------------------

#define  GLX_MESA_release_buffers                     1
glXReleaseBuffersMESA!: alias function! [
	dpy     [ Display-ptr! ]
	d       [ GLXDrawable! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- GLX_MESA_set_3dfx_mode
;-------------------------------------------

#define  GLX_MESA_set_3dfx_mode                       1
#define  GLX_3DFX_WINDOW_MODE_MESA                    01h
#define  GLX_3DFX_FULLSCREEN_MODE_MESA                02h
glXSet3DfxModeMESA!: alias function! [
	mode    [ GLint! ]
	return: [ GLboolean! ]
]


;-------------------------------------------
;-- GLX_MESA_swap_control
;-------------------------------------------

#define  GLX_MESA_swap_control                        1
glXGetSwapIntervalMESA!: alias function! [
	return: [ integer! ]
]
glXSwapIntervalMESA!: alias function! [
	interval [ integer! ]
	return: [ integer! ]
]


;-------------------------------------------
;-- GLX_NV_copy_buffer
;-------------------------------------------

#define  GLX_NV_copy_buffer                           1
glXCopyBufferSubDataNV!: alias function! [
	dpy         [ Display-ptr! ]
	readCtx     [ GLXContext! ]
	writeCtx    [ GLXContext! ]
	readTarget  [ GLenum! ]
	writeTarget [ GLenum! ]
	readOffset  [ GLintptr! ]
	writeOffset [ GLintptr! ]
	size        [ GLsizeiptr! ]
]
glXNamedCopyBufferSubDataNV!: alias function! [
	dpy         [ Display-ptr! ]
	readCtx     [ GLXContext! ]
	writeCtx    [ GLXContext! ]
	readBuffer  [ GLuint! ]
	writeBuffer [ GLuint! ]
	readOffset  [ GLintptr! ]
	writeOffset [ GLintptr! ]
	size        [ GLsizeiptr! ]
]


;-------------------------------------------
;-- GLX_NV_copy_image
;-------------------------------------------

#define  GLX_NV_copy_image                            1
glXCopyImageSubDataNV!: alias function! [
	dpy       [ Display-ptr! ]
	srcCtx    [ GLXContext! ]
	srcName   [ GLuint! ]
	srcTarget [ GLenum! ]
	srcLevel  [ GLint! ]
	srcX      [ GLint! ]
	srcY      [ GLint! ]
	srcZ      [ GLint! ]
	dstCtx    [ GLXContext! ]
	dstName   [ GLuint! ]
	dstTarget [ GLenum! ]
	dstLevel  [ GLint! ]
	dstX      [ GLint! ]
	dstY      [ GLint! ]
	dstZ      [ GLint! ]
	width     [ GLsizei! ]
	height    [ GLsizei! ]
	depth     [ GLsizei! ]
]


;-------------------------------------------
;-- GLX_NV_delay_before_swap
;-------------------------------------------

#define  GLX_NV_delay_before_swap                     1
glXDelayBeforeSwapNV!: alias function! [
	dpy      [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	seconds  [ GLfloat! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- GLX_NV_float_buffer
;-------------------------------------------

#define  GLX_NV_float_buffer                          1
#define  GLX_FLOAT_COMPONENTS_NV                      20B0h


;-------------------------------------------
;-- GLX_NV_multisample_coverage
;-------------------------------------------

#define  GLX_NV_multisample_coverage                  1
#define  GLX_COLOR_SAMPLES_NV                         20B3h
#define  GLX_COVERAGE_SAMPLES_NV                      100001


;-------------------------------------------
;-- GLX_NV_present_video
;-------------------------------------------

#define  GLX_NV_present_video                         1
#define  GLX_NUM_VIDEO_SLOTS_NV                       20F0h
glXBindVideoDeviceNV!: alias function! [
	dpy          [ Display-ptr! ]
	video_slot   [ integer! ]
	video_device [ integer! ]
	attrib_list  [ pointer! [integer!] ]
	return: [ integer! ]
]
glXEnumerateVideoDevicesNV!: alias function! [
	dpy       [ Display-ptr! ]
	screen    [ integer! ]
	nelements [ pointer! [integer!] ]
	return: [ pointer! [integer!] ]
]


;-------------------------------------------
;-- GLX_NV_robustness_video_memory_purge
;-------------------------------------------

#define  GLX_NV_robustness_video_memory_purge         1
#define  GLX_GENERATE_RESET_ON_VIDEO_MEMORY_PURGE_NV  20F7h


;-------------------------------------------
;-- GLX_NV_swap_group
;-------------------------------------------

#define  GLX_NV_swap_group                            1
glXBindSwapBarrierNV!: alias function! [
	dpy     [ Display-ptr! ]
	group   [ GLuint! ]
	barrier [ GLuint! ]
	return: [ logic! ]
]
glXJoinSwapGroupNV!: alias function! [
	dpy      [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	group    [ GLuint! ]
	return: [ logic! ]
]
glXQueryFrameCountNV!: alias function! [
	dpy     [ Display-ptr! ]
	screen  [ integer! ]
	count   [ pointer! [GLuint!] ]
	return: [ logic! ]
]
glXQueryMaxSwapGroupsNV!: alias function! [
	dpy         [ Display-ptr! ]
	screen      [ integer! ]
	maxGroups   [ pointer! [GLuint!] ]
	maxBarriers [ pointer! [GLuint!] ]
	return: [ logic! ]
]
glXQuerySwapGroupNV!: alias function! [
	dpy      [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	group    [ pointer! [GLuint!] ]
	barrier  [ pointer! [GLuint!] ]
	return: [ logic! ]
]
glXResetFrameCountNV!: alias function! [
	dpy     [ Display-ptr! ]
	screen  [ integer! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- GLX_NV_vertex_array_range
;-------------------------------------------

#define  GLX_NV_vertex_array_range                    1
glXAllocateMemoryNV!: alias function! [
	size           [ GLsizei! ]
	readFrequency  [ GLfloat! ]
	writeFrequency [ GLfloat! ]
	priority       [ GLfloat! ]
	return: [ pointer! [byte!] ]
]
glXFreeMemoryNV!: alias function! [
	pointer [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GLX_NV_video_capture
;-------------------------------------------

#define  GLX_NV_video_capture                         1
#define  GLX_DEVICE_ID_NV                             20CDh
#define  GLX_UNIQUE_ID_NV                             20CEh
#define  GLX_NUM_VIDEO_CAPTURE_SLOTS_NV               20CFh
glXBindVideoCaptureDeviceNV!: alias function! [
	dpy                [ Display-ptr! ]
	video_capture_slot [ integer! ]
	device             [ GLXVideoCaptureDeviceNV! ]
	return: [ integer! ]
]
glXEnumerateVideoCaptureDevicesNV!: alias function! [
	dpy       [ Display-ptr! ]
	screen    [ integer! ]
	nelements [ pointer! [integer!] ]
	return: [ GLXVideoCaptureDeviceNV-ptr! ]
]
glXLockVideoCaptureDeviceNV!: alias function! [
	dpy     [ Display-ptr! ]
	device  [ GLXVideoCaptureDeviceNV! ]
]
glXQueryVideoCaptureDeviceNV!: alias function! [
	dpy       [ Display-ptr! ]
	device    [ GLXVideoCaptureDeviceNV! ]
	attribute [ integer! ]
	value     [ pointer! [integer!] ]
	return: [ integer! ]
]
glXReleaseVideoCaptureDeviceNV!: alias function! [
	dpy     [ Display-ptr! ]
	device  [ GLXVideoCaptureDeviceNV! ]
]


;-------------------------------------------
;-- GLX_NV_video_out
;-------------------------------------------

#define  GLX_NV_video_out                             1
#define  GLX_VIDEO_OUT_COLOR_NV                       20C3h
#define  GLX_VIDEO_OUT_ALPHA_NV                       20C4h
#define  GLX_VIDEO_OUT_DEPTH_NV                       20C5h
#define  GLX_VIDEO_OUT_COLOR_AND_ALPHA_NV             20C6h
#define  GLX_VIDEO_OUT_COLOR_AND_DEPTH_NV             20C7h
#define  GLX_VIDEO_OUT_FRAME_NV                       20C8h
#define  GLX_VIDEO_OUT_FIELD_1_NV                     20C9h
#define  GLX_VIDEO_OUT_FIELD_2_NV                     20CAh
#define  GLX_VIDEO_OUT_STACKED_FIELDS_1_2_NV          20CBh
#define  GLX_VIDEO_OUT_STACKED_FIELDS_2_1_NV          20CCh
glXBindVideoImageNV!: alias function! [
	dpy          [ Display-ptr! ]
	VideoDevice  [ GLXVideoDeviceNV! ]
	pbuf         [ GLXPbuffer! ]
	iVideoBuffer [ integer! ]
	return: [ integer! ]
]
glXGetVideoDeviceNV!: alias function! [
	dpy             [ Display-ptr! ]
	screen          [ integer! ]
	numVideoDevices [ integer! ]
	pVideoDevice    [ GLXVideoDeviceNV-ptr! ]
	return: [ integer! ]
]
glXGetVideoInfoNV!: alias function! [
	dpy                     [ Display-ptr! ]
	screen                  [ integer! ]
	VideoDevice             [ GLXVideoDeviceNV! ]
	pulCounterOutputPbuffer [ pointer! [integer!] ]
	pulCounterOutputVideo   [ pointer! [integer!] ]
	return: [ integer! ]
]
glXReleaseVideoDeviceNV!: alias function! [
	dpy         [ Display-ptr! ]
	screen      [ integer! ]
	VideoDevice [ GLXVideoDeviceNV! ]
	return: [ integer! ]
]
glXReleaseVideoImageNV!: alias function! [
	dpy     [ Display-ptr! ]
	pbuf    [ GLXPbuffer! ]
	return: [ integer! ]
]
glXSendPbufferToVideoNV!: alias function! [
	dpy               [ Display-ptr! ]
	pbuf              [ GLXPbuffer! ]
	iBufferType       [ integer! ]
	pulCounterPbuffer [ pointer! [integer!] ]
	bBlock            [ GLboolean! ]
	return: [ integer! ]
]


;-------------------------------------------
;-- GLX_OML_swap_method
;-------------------------------------------

#define  GLX_OML_swap_method                          1
#define  GLX_SWAP_METHOD_OML                          8060h
#define  GLX_SWAP_EXCHANGE_OML                        8061h
#define  GLX_SWAP_COPY_OML                            8062h
#define  GLX_SWAP_UNDEFINED_OML                       8063h


;-------------------------------------------
;-- GLX_OML_sync_control
;-------------------------------------------

#define  GLX_OML_sync_control                         1
glXGetMscRateOML!: alias function! [
	dpy         [ Display-ptr! ]
	drawable    [ GLXDrawable! ]
	numerator   [ pointer! [integer!] ]
	denominator [ pointer! [integer!] ]
	return: [ logic! ]
]
glXGetSyncValuesOML!: alias function! [
	dpy      [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	ust      [ int64-ptr! ]
	msc      [ int64-ptr! ]
	sbc      [ int64-ptr! ]
	return: [ logic! ]
]
glXSwapBuffersMscOML!: alias function! [
	dpy        [ Display-ptr! ]
	drawable   [ GLXDrawable! ]
	target_msc [ int64-value! ]
	divisor    [ int64-value! ]
	remainder  [ int64-value! ]
	return: [ int64-value! ]
]
glXWaitForMscOML!: alias function! [
	dpy        [ Display-ptr! ]
	drawable   [ GLXDrawable! ]
	target_msc [ int64-value! ]
	divisor    [ int64-value! ]
	remainder  [ int64-value! ]
	ust        [ int64-ptr! ]
	msc        [ int64-ptr! ]
	sbc        [ int64-ptr! ]
	return: [ logic! ]
]
glXWaitForSbcOML!: alias function! [
	dpy        [ Display-ptr! ]
	drawable   [ GLXDrawable! ]
	target_sbc [ int64-value! ]
	ust        [ int64-ptr! ]
	msc        [ int64-ptr! ]
	sbc        [ int64-ptr! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- GLX_SGIS_blended_overlay
;-------------------------------------------

#define  GLX_SGIS_blended_overlay                     1
#define  GLX_BLENDED_RGBA_SGIS                        8025h


;-------------------------------------------
;-- GLX_SGIS_color_range
;-------------------------------------------

#define  GLX_SGIS_color_range                         1


;-------------------------------------------
;-- GLX_SGIS_multisample
;-------------------------------------------

#define  GLX_SGIS_multisample                         1
#define  GLX_SAMPLE_BUFFERS_SGIS                      100000
#define  GLX_SAMPLES_SGIS                             100001


;-------------------------------------------
;-- GLX_SGIS_shared_multisample
;-------------------------------------------

#define  GLX_SGIS_shared_multisample                  1
#define  GLX_MULTISAMPLE_SUB_RECT_WIDTH_SGIS          8026h
#define  GLX_MULTISAMPLE_SUB_RECT_HEIGHT_SGIS         8027h


;-------------------------------------------
;-- GLX_SGIX_fbconfig
;-------------------------------------------

#define  GLX_SGIX_fbconfig                            1
#define  GLX_RGBA_BIT_SGIX                            00000001h
#define  GLX_WINDOW_BIT_SGIX                          00000001h
#define  GLX_COLOR_INDEX_BIT_SGIX                     00000002h
#define  GLX_PIXMAP_BIT_SGIX                          00000002h
;#define  GLX_SCREEN_EXT                               800Ch
#define  GLX_DRAWABLE_TYPE_SGIX                       8010h
#define  GLX_RENDER_TYPE_SGIX                         8011h
#define  GLX_X_RENDERABLE_SGIX                        8012h
#define  GLX_FBCONFIG_ID_SGIX                         8013h
#define  GLX_RGBA_TYPE_SGIX                           8014h
#define  GLX_COLOR_INDEX_TYPE_SGIX                    8015h
glXChooseFBConfigSGIX!: alias function! [
	dpy         [ Display-ptr! ]
	screen      [ integer! ]
	attrib_list [ pointer! [integer!] ]
	nelements   [ pointer! [integer!] ]
	return: [ GLXFBConfigSGIX-ptr! ]
]
glXCreateContextWithConfigSGIX!: alias function! [
	dpy         [ Display-ptr! ]
	config      [ GLXFBConfig! ]
	render_type [ integer! ]
	share_list  [ GLXContext! ]
	direct      [ logic! ]
	return: [ GLXContext! ]
]
glXCreateGLXPixmapWithConfigSGIX!: alias function! [
	dpy     [ Display-ptr! ]
	config  [ GLXFBConfig! ]
	pixmap  [ Pixmap! ]
	return: [ GLXPixmap! ]
]
glXGetFBConfigAttribSGIX!: alias function! [
	dpy       [ Display-ptr! ]
	config    [ GLXFBConfigSGIX! ]
	attribute [ integer! ]
	value     [ pointer! [integer!] ]
	return: [ integer! ]
]
glXGetFBConfigFromVisualSGIX!: alias function! [
	dpy     [ Display-ptr! ]
	vis     [ XVisualInfo-ptr! ]
	return: [ GLXFBConfigSGIX! ]
]
glXGetVisualFromFBConfigSGIX!: alias function! [
	dpy     [ Display-ptr! ]
	config  [ GLXFBConfig! ]
	return: [ XVisualInfo-ptr! ]
]


;-------------------------------------------
;-- GLX_SGIX_hyperpipe
;-------------------------------------------

#define  GLX_SGIX_hyperpipe                           1
#define  GLX_HYPERPIPE_DISPLAY_PIPE_SGIX              00000001h
#define  GLX_PIPE_RECT_SGIX                           00000001h
#define  GLX_HYPERPIPE_RENDER_PIPE_SGIX               00000002h
#define  GLX_PIPE_RECT_LIMITS_SGIX                    00000002h
#define  GLX_HYPERPIPE_STEREO_SGIX                    00000003h
#define  GLX_HYPERPIPE_PIXEL_AVERAGE_SGIX             00000004h
#define  GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX          80
#define  GLX_BAD_HYPERPIPE_CONFIG_SGIX                91
#define  GLX_BAD_HYPERPIPE_SGIX                       92
#define  GLX_HYPERPIPE_ID_SGIX                        8030h
glXBindHyperpipeSGIX!: alias function! [
	dpy     [ Display-ptr! ]
	hpId    [ integer! ]
	return: [ integer! ]
]
glXDestroyHyperpipeConfigSGIX!: alias function! [
	dpy     [ Display-ptr! ]
	hpId    [ integer! ]
	return: [ integer! ]
]
glXHyperpipeAttribSGIX!: alias function! [
	dpy        [ Display-ptr! ]
	timeSlice  [ integer! ]
	attrib     [ integer! ]
	size       [ integer! ]
	attribList [ pointer! [byte!] ]
	return: [ integer! ]
]
glXHyperpipeConfigSGIX!: alias function! [
	dpy       [ Display-ptr! ]
	networkId [ integer! ]
	npipes    [ integer! ]
	cfg       [ GLXHyperpipeConfigSGIX-ptr! ]
	hpId      [ pointer! [integer!] ]
	return: [ integer! ]
]
glXQueryHyperpipeAttribSGIX!: alias function! [
	dpy              [ Display-ptr! ]
	timeSlice        [ integer! ]
	attrib           [ integer! ]
	size             [ integer! ]
	returnAttribList [ pointer! [byte!] ]
	return: [ integer! ]
]
glXQueryHyperpipeBestAttribSGIX!: alias function! [
	dpy              [ Display-ptr! ]
	timeSlice        [ integer! ]
	attrib           [ integer! ]
	size             [ integer! ]
	attribList       [ pointer! [byte!] ]
	returnAttribList [ pointer! [byte!] ]
	return: [ integer! ]
]
glXQueryHyperpipeConfigSGIX!: alias function! [
	dpy     [ Display-ptr! ]
	hpId    [ integer! ]
	npipes  [ pointer! [integer!] ]
	return: [ GLXHyperpipeConfigSGIX-ptr! ]
]
glXQueryHyperpipeNetworkSGIX!: alias function! [
	dpy     [ Display-ptr! ]
	npipes  [ pointer! [integer!] ]
	return: [ GLXHyperpipeNetworkSGIX-ptr! ]
]


;-------------------------------------------
;-- GLX_SGIX_pbuffer
;-------------------------------------------

#define  GLX_SGIX_pbuffer                             1
#define  GLX_FRONT_LEFT_BUFFER_BIT_SGIX               00000001h
#define  GLX_FRONT_RIGHT_BUFFER_BIT_SGIX              00000002h
#define  GLX_BACK_LEFT_BUFFER_BIT_SGIX                00000004h
#define  GLX_PBUFFER_BIT_SGIX                         00000004h
#define  GLX_BACK_RIGHT_BUFFER_BIT_SGIX               00000008h
#define  GLX_AUX_BUFFERS_BIT_SGIX                     00000010h
#define  GLX_DEPTH_BUFFER_BIT_SGIX                    00000020h
#define  GLX_STENCIL_BUFFER_BIT_SGIX                  00000040h
#define  GLX_ACCUM_BUFFER_BIT_SGIX                    00000080h
#define  GLX_SAMPLE_BUFFERS_BIT_SGIX                  00000100h
#define  GLX_MAX_PBUFFER_WIDTH_SGIX                   8016h
#define  GLX_MAX_PBUFFER_HEIGHT_SGIX                  8017h
#define  GLX_MAX_PBUFFER_PIXELS_SGIX                  8018h
#define  GLX_OPTIMAL_PBUFFER_WIDTH_SGIX               8019h
#define  GLX_OPTIMAL_PBUFFER_HEIGHT_SGIX              801Ah
#define  GLX_PRESERVED_CONTENTS_SGIX                  801Bh
#define  GLX_LARGEST_PBUFFER_SGIX                     801Ch
#define  GLX_WIDTH_SGIX                               801Dh
#define  GLX_HEIGHT_SGIX                              801Eh
#define  GLX_EVENT_MASK_SGIX                          801Fh
#define  GLX_DAMAGED_SGIX                             8020h
#define  GLX_SAVED_SGIX                               8021h
#define  GLX_WINDOW_SGIX                              8022h
#define  GLX_PBUFFER_SGIX                             8023h
#define  GLX_BUFFER_CLOBBER_MASK_SGIX                 08000000h
glXCreateGLXPbufferSGIX!: alias function! [
	dpy         [ Display-ptr! ]
	config      [ GLXFBConfig! ]
	width       [ integer! ]
	height      [ integer! ]
	attrib_list [ pointer! [integer!] ]
	return: [ GLXPbuffer! ]
]
glXDestroyGLXPbufferSGIX!: alias function! [
	dpy     [ Display-ptr! ]
	pbuf    [ GLXPbuffer! ]
]
glXGetSelectedEventSGIX!: alias function! [
	dpy      [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	mask     [ pointer! [integer!] ]
]
glXQueryGLXPbufferSGIX!: alias function! [
	dpy       [ Display-ptr! ]
	pbuf      [ GLXPbuffer! ]
	attribute [ integer! ]
	value     [ pointer! [integer!] ]
]
glXSelectEventSGIX!: alias function! [
	dpy      [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	mask     [ integer! ]
]


;-------------------------------------------
;-- GLX_SGIX_swap_barrier
;-------------------------------------------

#define  GLX_SGIX_swap_barrier                        1
glXBindSwapBarrierSGIX!: alias function! [
	dpy      [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	barrier  [ integer! ]
]
glXQueryMaxSwapBarriersSGIX!: alias function! [
	dpy     [ Display-ptr! ]
	screen  [ integer! ]
	max     [ pointer! [integer!] ]
	return: [ logic! ]
]


;-------------------------------------------
;-- GLX_SGIX_swap_group
;-------------------------------------------

#define  GLX_SGIX_swap_group                          1
glXJoinSwapGroupSGIX!: alias function! [
	dpy      [ Display-ptr! ]
	drawable [ GLXDrawable! ]
	member   [ GLXDrawable! ]
]


;-------------------------------------------
;-- GLX_SGIX_video_resize
;-------------------------------------------

#define  GLX_SGIX_video_resize                        1
#define  GLX_SYNC_FRAME_SGIX                          00000000h
#define  GLX_SYNC_SWAP_SGIX                           00000001h
glXBindChannelToWindowSGIX!: alias function! [
	display [ Display-ptr! ]
	screen  [ integer! ]
	channel [ integer! ]
	window  [ Window! ]
	return: [ integer! ]
]
glXChannelRectSGIX!: alias function! [
	display [ Display-ptr! ]
	screen  [ integer! ]
	channel [ integer! ]
	x       [ integer! ]
	y       [ integer! ]
	w       [ integer! ]
	h       [ integer! ]
	return: [ integer! ]
]
glXChannelRectSyncSGIX!: alias function! [
	display  [ Display-ptr! ]
	screen   [ integer! ]
	channel  [ integer! ]
	synctype [ GLenum! ]
	return: [ integer! ]
]
glXQueryChannelDeltasSGIX!: alias function! [
	display [ Display-ptr! ]
	screen  [ integer! ]
	channel [ integer! ]
	x       [ pointer! [integer!] ]
	y       [ pointer! [integer!] ]
	w       [ pointer! [integer!] ]
	h       [ pointer! [integer!] ]
	return: [ integer! ]
]
glXQueryChannelRectSGIX!: alias function! [
	display [ Display-ptr! ]
	screen  [ integer! ]
	channel [ integer! ]
	dx      [ pointer! [integer!] ]
	dy      [ pointer! [integer!] ]
	dw      [ pointer! [integer!] ]
	dh      [ pointer! [integer!] ]
	return: [ integer! ]
]


;-------------------------------------------
;-- GLX_SGIX_visual_select_group
;-------------------------------------------

#define  GLX_SGIX_visual_select_group                 1
#define  GLX_VISUAL_SELECT_GROUP_SGIX                 8028h


;-------------------------------------------
;-- GLX_SGI_cushion
;-------------------------------------------

#define  GLX_SGI_cushion                              1
glXCushionSGI!: alias function! [
	dpy     [ Display-ptr! ]
	window  [ Window! ]
	cushion [ float32! ]
]


;-------------------------------------------
;-- GLX_SGI_make_current_read
;-------------------------------------------

#define  GLX_SGI_make_current_read                    1
glXGetCurrentReadDrawableSGI!: alias function! [
	return: [ GLXDrawable! ]
]
glXMakeCurrentReadSGI!: alias function! [
	dpy     [ Display-ptr! ]
	draw    [ GLXDrawable! ]
	read    [ GLXDrawable! ]
	ctx     [ GLXContext! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- GLX_SGI_swap_control
;-------------------------------------------

#define  GLX_SGI_swap_control                         1
glXSwapIntervalSGI!: alias function! [
	interval [ integer! ]
	return: [ integer! ]
]


;-------------------------------------------
;-- GLX_SGI_video_sync
;-------------------------------------------

#define  GLX_SGI_video_sync                           1
glXGetVideoSyncSGI!: alias function! [
	count   [ pointer! [integer!] ]
	return: [ integer! ]
]
glXWaitVideoSyncSGI!: alias function! [
	divisor   [ integer! ]
	remainder [ integer! ]
	count     [ pointer! [integer!] ]
	return: [ integer! ]
]


;-------------------------------------------
;-- GLX_SUN_get_transparent_index
;-------------------------------------------

#define  GLX_SUN_get_transparent_index                1
glXGetTransparentIndexSUN!: alias function! [
	dpy               [ Display-ptr! ]
	overlay           [ Window! ]
	underlay          [ Window! ]
	pTransparentIndex [ pointer! [integer!] ]
	return: [ Status! ]
]


;-------------------------------------------
;-- GLX_SUN_video_resize
;-------------------------------------------

#define  GLX_SUN_video_resize                         1
#define  GLX_VIDEO_RESIZE_SUN                         8171h
#define  GL_VIDEO_RESIZE_COMPENSATION_SUN             85CDh
glXGetVideoResizeSUN!: alias function! [
	display [ Display-ptr! ]
	window  [ GLXDrawable! ]
	factor  [ pointer! [float32!] ]
	return: [ integer! ]
]
glXVideoResizeSUN!: alias function! [
	display [ Display-ptr! ]
	window  [ GLXDrawable! ]
	factor  [ float32! ]
	return: [ integer! ]
]

] ;end of #if OS = 'Linux