Red/System [
	Title:   "Red/System OpenGL binding - Windows extensions"
	Author:  "Oldes"
	File: 	 %wgl.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
This source was made from wglew.h file, which contains these copyrights:

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

;--> content of this file makes sense only on Windows <--

#if OS = 'Windows  [




;-------------------------------------------
;-- WGL_3DFX_multisample
;-------------------------------------------

#define  WGL_3DFX_multisample                         1
#define  WGL_SAMPLE_BUFFERS_3DFX                      2060h
#define  WGL_SAMPLES_3DFX                             2061h


;-------------------------------------------
;-- WGL_3DL_stereo_control
;-------------------------------------------

#define  WGL_3DL_stereo_control                       1
#define  WGL_STEREO_EMITTER_ENABLE_3DL                2055h
#define  WGL_STEREO_EMITTER_DISABLE_3DL               2056h
#define  WGL_STEREO_POLARITY_NORMAL_3DL               2057h
#define  WGL_STEREO_POLARITY_INVERT_3DL               2058h
wglSetStereoEmitterState3DL!: alias function! [
	hDC     [ HDC! ]
	uState  [ integer! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_AMD_gpu_association
;-------------------------------------------

#define  WGL_AMD_gpu_association                      1
#define  WGL_GPU_VENDOR_AMD                           1F00h
#define  WGL_GPU_RENDERER_STRING_AMD                  1F01h
#define  WGL_GPU_OPENGL_VERSION_STRING_AMD            1F02h
#define  WGL_GPU_FASTEST_TARGET_GPUS_AMD              21A2h
#define  WGL_GPU_RAM_AMD                              21A3h
#define  WGL_GPU_CLOCK_AMD                            21A4h
#define  WGL_GPU_NUM_PIPES_AMD                        21A5h
#define  WGL_GPU_NUM_SIMD_AMD                         21A6h
#define  WGL_GPU_NUM_RB_AMD                           21A7h
#define  WGL_GPU_NUM_SPI_AMD                          21A8h
wglBlitContextFramebufferAMD!: alias function! [
	dstCtx  [ HGLRC! ]
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
wglCreateAssociatedContextAMD!: alias function! [
	id      [ integer! ]
	return: [ HGLRC! ]
]
wglCreateAssociatedContextAttribsAMD!: alias function! [
	id            [ integer! ]
	hShareContext [ HGLRC! ]
	attribList    [ pointer! [integer!] ]
	return: [ HGLRC! ]
]
wglDeleteAssociatedContextAMD!: alias function! [
	hglrc   [ HGLRC! ]
	return: [ logic! ]
]
wglGetContextGPUIDAMD!: alias function! [
	hglrc   [ HGLRC! ]
	return: [ integer! ]
]
wglGetCurrentAssociatedContextAMD!: alias function! [
	return: [ HGLRC! ]
]
wglGetGPUIDsAMD!: alias function! [
	maxCount [ integer! ]
	ids      [ pointer! [integer!] ]
	return: [ integer! ]
]
wglGetGPUInfoAMD!: alias function! [
	id       [ integer! ]
	property [ integer! ]
	dataType [ GLenum! ]
	size     [ integer! ]
	data     [ pointer! [byte!] ]
	return: [ integer! ]
]
wglMakeAssociatedContextCurrentAMD!: alias function! [
	hglrc   [ HGLRC! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_ARB_buffer_region
;-------------------------------------------

#define  WGL_ARB_buffer_region                        1
#define  WGL_FRONT_COLOR_BUFFER_BIT_ARB               00000001h
#define  WGL_BACK_COLOR_BUFFER_BIT_ARB                00000002h
#define  WGL_DEPTH_BUFFER_BIT_ARB                     00000004h
#define  WGL_STENCIL_BUFFER_BIT_ARB                   00000008h
wglCreateBufferRegionARB!: alias function! [
	hDC         [ HDC! ]
	iLayerPlane [ integer! ]
	uType       [ integer! ]
	return: [ handle! ]
]
wglDeleteBufferRegionARB!: alias function! [
	hRegion [ handle! ]
]
wglRestoreBufferRegionARB!: alias function! [
	hRegion [ handle! ]
	x       [ integer! ]
	y       [ integer! ]
	width   [ integer! ]
	height  [ integer! ]
	xSrc    [ integer! ]
	ySrc    [ integer! ]
	return: [ logic! ]
]
wglSaveBufferRegionARB!: alias function! [
	hRegion [ handle! ]
	x       [ integer! ]
	y       [ integer! ]
	width   [ integer! ]
	height  [ integer! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_ARB_context_flush_control
;-------------------------------------------

#define  WGL_ARB_context_flush_control                1


;-------------------------------------------
;-- WGL_ARB_create_context
;-------------------------------------------

#define  WGL_ARB_create_context                       1
#define  WGL_CONTEXT_DEBUG_BIT_ARB                    0001h
#define  WGL_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB       0002h
#define  WGL_CONTEXT_MAJOR_VERSION_ARB                2091h
#define  WGL_CONTEXT_MINOR_VERSION_ARB                2092h
#define  WGL_CONTEXT_LAYER_PLANE_ARB                  2093h
#define  WGL_CONTEXT_FLAGS_ARB                        2094h
#define  ERROR_INVALID_VERSION_ARB                    2095h
#define  ERROR_INVALID_PROFILE_ARB                    2096h
wglCreateContextAttribsARB!: alias function! [
	hDC           [ HDC! ]
	hShareContext [ HGLRC! ]
	attribList    [ pointer! [integer!] ]
	return: [ HGLRC! ]
]


;-------------------------------------------
;-- WGL_ARB_create_context_no_error
;-------------------------------------------

#define  WGL_ARB_create_context_no_error              1


;-------------------------------------------
;-- WGL_ARB_create_context_profile
;-------------------------------------------

#define  WGL_ARB_create_context_profile               1
#define  WGL_CONTEXT_CORE_PROFILE_BIT_ARB             00000001h
#define  WGL_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB    00000002h
#define  WGL_CONTEXT_PROFILE_MASK_ARB                 9126h


;-------------------------------------------
;-- WGL_ARB_create_context_robustness
;-------------------------------------------

#define  WGL_ARB_create_context_robustness            1
#define  WGL_CONTEXT_ROBUST_ACCESS_BIT_ARB            00000004h
#define  WGL_LOSE_CONTEXT_ON_RESET_ARB                8252h
#define  WGL_CONTEXT_RESET_NOTIFICATION_STRATEGY_ARB  8256h
#define  WGL_NO_RESET_NOTIFICATION_ARB                8261h


;-------------------------------------------
;-- WGL_ARB_extensions_string
;-------------------------------------------

#define  WGL_ARB_extensions_string                    1
wglGetExtensionsStringARB!: alias function! [
	hdc     [ HDC! ]
	return: [ c-string! ]
]


;-------------------------------------------
;-- WGL_ARB_framebuffer_sRGB
;-------------------------------------------

#define  WGL_ARB_framebuffer_sRGB                     1
#define  WGL_FRAMEBUFFER_SRGB_CAPABLE_ARB             20A9h


;-------------------------------------------
;-- WGL_ARB_make_current_read
;-------------------------------------------

#define  WGL_ARB_make_current_read                    1
#define  ERROR_INVALID_PIXEL_TYPE_ARB                 2043h
#define  ERROR_INCOMPATIBLE_DEVICE_CONTEXTS_ARB       2054h
wglGetCurrentReadDCARB!: alias function! [
	return: [ HDC! ]
]
wglMakeContextCurrentARB!: alias function! [
	hDrawDC [ HDC! ]
	hReadDC [ HDC! ]
	hglrc   [ HGLRC! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_ARB_multisample
;-------------------------------------------

#define  WGL_ARB_multisample                          1
#define  WGL_SAMPLE_BUFFERS_ARB                       2041h
#define  WGL_SAMPLES_ARB                              2042h


;-------------------------------------------
;-- WGL_ARB_pbuffer
;-------------------------------------------

#define  WGL_ARB_pbuffer                              1
#define  WGL_DRAW_TO_PBUFFER_ARB                      202Dh
#define  WGL_MAX_PBUFFER_PIXELS_ARB                   202Eh
#define  WGL_MAX_PBUFFER_WIDTH_ARB                    202Fh
#define  WGL_MAX_PBUFFER_HEIGHT_ARB                   2030h
#define  WGL_PBUFFER_LARGEST_ARB                      2033h
#define  WGL_PBUFFER_WIDTH_ARB                        2034h
#define  WGL_PBUFFER_HEIGHT_ARB                       2035h
#define  WGL_PBUFFER_LOST_ARB                         2036h
wglCreatePbufferARB!: alias function! [
	hDC          [ HDC! ]
	iPixelFormat [ integer! ]
	iWidth       [ integer! ]
	iHeight      [ integer! ]
	piAttribList [ pointer! [integer!] ]
	return: [ HPBUFFERARB! ]
]
wglDestroyPbufferARB!: alias function! [
	hPbuffer [ HPBUFFERARB! ]
	return: [ logic! ]
]
wglGetPbufferDCARB!: alias function! [
	hPbuffer [ HPBUFFERARB! ]
	return: [ HDC! ]
]
wglQueryPbufferARB!: alias function! [
	hPbuffer   [ HPBUFFERARB! ]
	iAttribute [ integer! ]
	piValue    [ pointer! [integer!] ]
	return: [ logic! ]
]
wglReleasePbufferDCARB!: alias function! [
	hPbuffer [ HPBUFFERARB! ]
	hDC      [ HDC! ]
	return: [ integer! ]
]


;-------------------------------------------
;-- WGL_ARB_pixel_format
;-------------------------------------------

#define  WGL_ARB_pixel_format                         1
#define  WGL_NUMBER_PIXEL_FORMATS_ARB                 2000h
#define  WGL_DRAW_TO_WINDOW_ARB                       2001h
#define  WGL_DRAW_TO_BITMAP_ARB                       2002h
#define  WGL_ACCELERATION_ARB                         2003h
#define  WGL_NEED_PALETTE_ARB                         2004h
#define  WGL_NEED_SYSTEM_PALETTE_ARB                  2005h
#define  WGL_SWAP_LAYER_BUFFERS_ARB                   2006h
#define  WGL_SWAP_METHOD_ARB                          2007h
#define  WGL_NUMBER_OVERLAYS_ARB                      2008h
#define  WGL_NUMBER_UNDERLAYS_ARB                     2009h
#define  WGL_TRANSPARENT_ARB                          200Ah
#define  WGL_SHARE_DEPTH_ARB                          200Ch
#define  WGL_SHARE_STENCIL_ARB                        200Dh
#define  WGL_SHARE_ACCUM_ARB                          200Eh
#define  WGL_SUPPORT_GDI_ARB                          200Fh
#define  WGL_SUPPORT_OPENGL_ARB                       2010h
#define  WGL_DOUBLE_BUFFER_ARB                        2011h
#define  WGL_STEREO_ARB                               2012h
#define  WGL_PIXEL_TYPE_ARB                           2013h
#define  WGL_COLOR_BITS_ARB                           2014h
#define  WGL_RED_BITS_ARB                             2015h
#define  WGL_RED_SHIFT_ARB                            2016h
#define  WGL_GREEN_BITS_ARB                           2017h
#define  WGL_GREEN_SHIFT_ARB                          2018h
#define  WGL_BLUE_BITS_ARB                            2019h
#define  WGL_BLUE_SHIFT_ARB                           201Ah
#define  WGL_ALPHA_BITS_ARB                           201Bh
#define  WGL_ALPHA_SHIFT_ARB                          201Ch
#define  WGL_ACCUM_BITS_ARB                           201Dh
#define  WGL_ACCUM_RED_BITS_ARB                       201Eh
#define  WGL_ACCUM_GREEN_BITS_ARB                     201Fh
#define  WGL_ACCUM_BLUE_BITS_ARB                      2020h
#define  WGL_ACCUM_ALPHA_BITS_ARB                     2021h
#define  WGL_DEPTH_BITS_ARB                           2022h
#define  WGL_STENCIL_BITS_ARB                         2023h
#define  WGL_AUX_BUFFERS_ARB                          2024h
#define  WGL_NO_ACCELERATION_ARB                      2025h
#define  WGL_GENERIC_ACCELERATION_ARB                 2026h
#define  WGL_FULL_ACCELERATION_ARB                    2027h
#define  WGL_SWAP_EXCHANGE_ARB                        2028h
#define  WGL_SWAP_COPY_ARB                            2029h
#define  WGL_SWAP_UNDEFINED_ARB                       202Ah
#define  WGL_TYPE_RGBA_ARB                            202Bh
#define  WGL_TYPE_COLORINDEX_ARB                      202Ch
#define  WGL_TRANSPARENT_RED_VALUE_ARB                2037h
#define  WGL_TRANSPARENT_GREEN_VALUE_ARB              2038h
#define  WGL_TRANSPARENT_BLUE_VALUE_ARB               2039h
#define  WGL_TRANSPARENT_ALPHA_VALUE_ARB              203Ah
#define  WGL_TRANSPARENT_INDEX_VALUE_ARB              203Bh
wglChoosePixelFormatARB!: alias function! [
	hdc           [ HDC! ]
	piAttribIList [ pointer! [integer!] ]
	pfAttribFList [ pointer! [float32!] ]
	nMaxFormats   [ integer! ]
	piFormats     [ pointer! [integer!] ]
	nNumFormats   [ pointer! [integer!] ]
	return: [ logic! ]
]
wglGetPixelFormatAttribfvARB!: alias function! [
	hdc          [ HDC! ]
	iPixelFormat [ integer! ]
	iLayerPlane  [ integer! ]
	nAttributes  [ integer! ]
	piAttributes [ pointer! [integer!] ]
	pfValues     [ pointer! [float32!] ]
	return: [ logic! ]
]
wglGetPixelFormatAttribivARB!: alias function! [
	hdc          [ HDC! ]
	iPixelFormat [ integer! ]
	iLayerPlane  [ integer! ]
	nAttributes  [ integer! ]
	piAttributes [ pointer! [integer!] ]
	piValues     [ pointer! [integer!] ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_ARB_pixel_format_float
;-------------------------------------------

#define  WGL_ARB_pixel_format_float                   1
#define  WGL_TYPE_RGBA_FLOAT_ARB                      21A0h


;-------------------------------------------
;-- WGL_ARB_render_texture
;-------------------------------------------

#define  WGL_ARB_render_texture                       1
#define  WGL_BIND_TO_TEXTURE_RGB_ARB                  2070h
#define  WGL_BIND_TO_TEXTURE_RGBA_ARB                 2071h
#define  WGL_TEXTURE_FORMAT_ARB                       2072h
#define  WGL_TEXTURE_TARGET_ARB                       2073h
#define  WGL_MIPMAP_TEXTURE_ARB                       2074h
#define  WGL_TEXTURE_RGB_ARB                          2075h
#define  WGL_TEXTURE_RGBA_ARB                         2076h
#define  WGL_NO_TEXTURE_ARB                           2077h
#define  WGL_TEXTURE_CUBE_MAP_ARB                     2078h
#define  WGL_TEXTURE_1D_ARB                           2079h
#define  WGL_TEXTURE_2D_ARB                           207Ah
#define  WGL_MIPMAP_LEVEL_ARB                         207Bh
#define  WGL_CUBE_MAP_FACE_ARB                        207Ch
#define  WGL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB          207Dh
#define  WGL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB          207Eh
#define  WGL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB          207Fh
#define  WGL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB          2080h
#define  WGL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB          2081h
#define  WGL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB          2082h
#define  WGL_FRONT_LEFT_ARB                           2083h
#define  WGL_FRONT_RIGHT_ARB                          2084h
#define  WGL_BACK_LEFT_ARB                            2085h
#define  WGL_BACK_RIGHT_ARB                           2086h
#define  WGL_AUX0_ARB                                 2087h
#define  WGL_AUX1_ARB                                 2088h
#define  WGL_AUX2_ARB                                 2089h
#define  WGL_AUX3_ARB                                 208Ah
#define  WGL_AUX4_ARB                                 208Bh
#define  WGL_AUX5_ARB                                 208Ch
#define  WGL_AUX6_ARB                                 208Dh
#define  WGL_AUX7_ARB                                 208Eh
#define  WGL_AUX8_ARB                                 208Fh
#define  WGL_AUX9_ARB                                 2090h
wglBindTexImageARB!: alias function! [
	hPbuffer [ HPBUFFERARB! ]
	iBuffer  [ integer! ]
	return: [ logic! ]
]
wglReleaseTexImageARB!: alias function! [
	hPbuffer [ HPBUFFERARB! ]
	iBuffer  [ integer! ]
	return: [ logic! ]
]
wglSetPbufferAttribARB!: alias function! [
	hPbuffer     [ HPBUFFERARB! ]
	piAttribList [ pointer! [integer!] ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_ARB_robustness_application_isolation
;-------------------------------------------

#define  WGL_ARB_robustness_application_isolation     1
#define  WGL_CONTEXT_RESET_ISOLATION_BIT_ARB          00000008h


;-------------------------------------------
;-- WGL_ARB_robustness_share_group_isolation
;-------------------------------------------

#define  WGL_ARB_robustness_share_group_isolation     1
;#define  WGL_CONTEXT_RESET_ISOLATION_BIT_ARB          00000008h


;-------------------------------------------
;-- WGL_ATI_pixel_format_float
;-------------------------------------------

#define  WGL_ATI_pixel_format_float                   1
#define  WGL_TYPE_RGBA_FLOAT_ATI                      21A0h
#define  GL_RGBA_FLOAT_MODE_ATI                       8820h
#define  GL_COLOR_CLEAR_UNCLAMPED_VALUE_ATI           8835h


;-------------------------------------------
;-- WGL_ATI_render_texture_rectangle
;-------------------------------------------

#define  WGL_ATI_render_texture_rectangle             1
#define  WGL_TEXTURE_RECTANGLE_ATI                    21A5h


;-------------------------------------------
;-- WGL_EXT_colorspace
;-------------------------------------------

#define  WGL_EXT_colorspace                           1
#define  WGL_COLORSPACE_SRGB_EXT                      3089h
#define  WGL_COLORSPACE_LINEAR_EXT                    308Ah
#define  WGL_COLORSPACE_EXT                           309Dh


;-------------------------------------------
;-- WGL_EXT_create_context_es2_profile
;-------------------------------------------

#define  WGL_EXT_create_context_es2_profile           1
#define  WGL_CONTEXT_ES2_PROFILE_BIT_EXT              00000004h


;-------------------------------------------
;-- WGL_EXT_create_context_es_profile
;-------------------------------------------

#define  WGL_EXT_create_context_es_profile            1
#define  WGL_CONTEXT_ES_PROFILE_BIT_EXT               00000004h


;-------------------------------------------
;-- WGL_EXT_depth_float
;-------------------------------------------

#define  WGL_EXT_depth_float                          1
#define  WGL_DEPTH_FLOAT_EXT                          2040h


;-------------------------------------------
;-- WGL_EXT_display_color_table
;-------------------------------------------

#define  WGL_EXT_display_color_table                  1
wglBindDisplayColorTableEXT!: alias function! [
	id      [ GLushort! ]
	return: [ GLboolean! ]
]
wglCreateDisplayColorTableEXT!: alias function! [
	id      [ GLushort! ]
	return: [ GLboolean! ]
]
wglDestroyDisplayColorTableEXT!: alias function! [
	id      [ GLushort! ]
]
wglLoadDisplayColorTableEXT!: alias function! [
	table   [ GLushort-ptr! ]
	length  [ GLuint! ]
	return: [ GLboolean! ]
]


;-------------------------------------------
;-- WGL_EXT_extensions_string
;-------------------------------------------

#define  WGL_EXT_extensions_string                    1
wglGetExtensionsStringEXT!: alias function! [
	return: [ c-string! ]
]


;-------------------------------------------
;-- WGL_EXT_framebuffer_sRGB
;-------------------------------------------

#define  WGL_EXT_framebuffer_sRGB                     1
#define  WGL_FRAMEBUFFER_SRGB_CAPABLE_EXT             20A9h


;-------------------------------------------
;-- WGL_EXT_make_current_read
;-------------------------------------------

#define  WGL_EXT_make_current_read                    1
#define  ERROR_INVALID_PIXEL_TYPE_EXT                 2043h
wglGetCurrentReadDCEXT!: alias function! [
	return: [ HDC! ]
]
wglMakeContextCurrentEXT!: alias function! [
	hDrawDC [ HDC! ]
	hReadDC [ HDC! ]
	hglrc   [ HGLRC! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_EXT_multisample
;-------------------------------------------

#define  WGL_EXT_multisample                          1
#define  WGL_SAMPLE_BUFFERS_EXT                       2041h
#define  WGL_SAMPLES_EXT                              2042h


;-------------------------------------------
;-- WGL_EXT_pbuffer
;-------------------------------------------

#define  WGL_EXT_pbuffer                              1
#define  WGL_DRAW_TO_PBUFFER_EXT                      202Dh
#define  WGL_MAX_PBUFFER_PIXELS_EXT                   202Eh
#define  WGL_MAX_PBUFFER_WIDTH_EXT                    202Fh
#define  WGL_MAX_PBUFFER_HEIGHT_EXT                   2030h
#define  WGL_OPTIMAL_PBUFFER_WIDTH_EXT                2031h
#define  WGL_OPTIMAL_PBUFFER_HEIGHT_EXT               2032h
#define  WGL_PBUFFER_LARGEST_EXT                      2033h
#define  WGL_PBUFFER_WIDTH_EXT                        2034h
#define  WGL_PBUFFER_HEIGHT_EXT                       2035h
wglCreatePbufferEXT!: alias function! [
	hDC          [ HDC! ]
	iPixelFormat [ integer! ]
	iWidth       [ integer! ]
	iHeight      [ integer! ]
	piAttribList [ pointer! [integer!] ]
	return: [ HPBUFFEREXT! ]
]
wglDestroyPbufferEXT!: alias function! [
	hPbuffer [ HPBUFFEREXT! ]
	return: [ logic! ]
]
wglGetPbufferDCEXT!: alias function! [
	hPbuffer [ HPBUFFEREXT! ]
	return: [ HDC! ]
]
wglQueryPbufferEXT!: alias function! [
	hPbuffer   [ HPBUFFEREXT! ]
	iAttribute [ integer! ]
	piValue    [ pointer! [integer!] ]
	return: [ logic! ]
]
wglReleasePbufferDCEXT!: alias function! [
	hPbuffer [ HPBUFFEREXT! ]
	hDC      [ HDC! ]
	return: [ integer! ]
]


;-------------------------------------------
;-- WGL_EXT_pixel_format
;-------------------------------------------

#define  WGL_EXT_pixel_format                         1
#define  WGL_NUMBER_PIXEL_FORMATS_EXT                 2000h
#define  WGL_DRAW_TO_WINDOW_EXT                       2001h
#define  WGL_DRAW_TO_BITMAP_EXT                       2002h
#define  WGL_ACCELERATION_EXT                         2003h
#define  WGL_NEED_PALETTE_EXT                         2004h
#define  WGL_NEED_SYSTEM_PALETTE_EXT                  2005h
#define  WGL_SWAP_LAYER_BUFFERS_EXT                   2006h
#define  WGL_SWAP_METHOD_EXT                          2007h
#define  WGL_NUMBER_OVERLAYS_EXT                      2008h
#define  WGL_NUMBER_UNDERLAYS_EXT                     2009h
#define  WGL_TRANSPARENT_EXT                          200Ah
#define  WGL_TRANSPARENT_VALUE_EXT                    200Bh
#define  WGL_SHARE_DEPTH_EXT                          200Ch
#define  WGL_SHARE_STENCIL_EXT                        200Dh
#define  WGL_SHARE_ACCUM_EXT                          200Eh
#define  WGL_SUPPORT_GDI_EXT                          200Fh
#define  WGL_SUPPORT_OPENGL_EXT                       2010h
#define  WGL_DOUBLE_BUFFER_EXT                        2011h
#define  WGL_STEREO_EXT                               2012h
#define  WGL_PIXEL_TYPE_EXT                           2013h
#define  WGL_COLOR_BITS_EXT                           2014h
#define  WGL_RED_BITS_EXT                             2015h
#define  WGL_RED_SHIFT_EXT                            2016h
#define  WGL_GREEN_BITS_EXT                           2017h
#define  WGL_GREEN_SHIFT_EXT                          2018h
#define  WGL_BLUE_BITS_EXT                            2019h
#define  WGL_BLUE_SHIFT_EXT                           201Ah
#define  WGL_ALPHA_BITS_EXT                           201Bh
#define  WGL_ALPHA_SHIFT_EXT                          201Ch
#define  WGL_ACCUM_BITS_EXT                           201Dh
#define  WGL_ACCUM_RED_BITS_EXT                       201Eh
#define  WGL_ACCUM_GREEN_BITS_EXT                     201Fh
#define  WGL_ACCUM_BLUE_BITS_EXT                      2020h
#define  WGL_ACCUM_ALPHA_BITS_EXT                     2021h
#define  WGL_DEPTH_BITS_EXT                           2022h
#define  WGL_STENCIL_BITS_EXT                         2023h
#define  WGL_AUX_BUFFERS_EXT                          2024h
#define  WGL_NO_ACCELERATION_EXT                      2025h
#define  WGL_GENERIC_ACCELERATION_EXT                 2026h
#define  WGL_FULL_ACCELERATION_EXT                    2027h
#define  WGL_SWAP_EXCHANGE_EXT                        2028h
#define  WGL_SWAP_COPY_EXT                            2029h
#define  WGL_SWAP_UNDEFINED_EXT                       202Ah
#define  WGL_TYPE_RGBA_EXT                            202Bh
#define  WGL_TYPE_COLORINDEX_EXT                      202Ch
wglChoosePixelFormatEXT!: alias function! [
	hdc           [ HDC! ]
	piAttribIList [ pointer! [integer!] ]
	pfAttribFList [ pointer! [float32!] ]
	nMaxFormats   [ integer! ]
	piFormats     [ pointer! [integer!] ]
	nNumFormats   [ pointer! [integer!] ]
	return: [ logic! ]
]
wglGetPixelFormatAttribfvEXT!: alias function! [
	hdc          [ HDC! ]
	iPixelFormat [ integer! ]
	iLayerPlane  [ integer! ]
	nAttributes  [ integer! ]
	piAttributes [ pointer! [integer!] ]
	pfValues     [ pointer! [float32!] ]
	return: [ logic! ]
]
wglGetPixelFormatAttribivEXT!: alias function! [
	hdc          [ HDC! ]
	iPixelFormat [ integer! ]
	iLayerPlane  [ integer! ]
	nAttributes  [ integer! ]
	piAttributes [ pointer! [integer!] ]
	piValues     [ pointer! [integer!] ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_EXT_pixel_format_packed_float
;-------------------------------------------

#define  WGL_EXT_pixel_format_packed_float            1
#define  WGL_TYPE_RGBA_UNSIGNED_FLOAT_EXT             20A8h


;-------------------------------------------
;-- WGL_EXT_swap_control
;-------------------------------------------

#define  WGL_EXT_swap_control                         1
wglGetSwapIntervalEXT!: alias function! [
	return: [ integer! ]
]
wglSwapIntervalEXT!: alias function! [
	interval [ integer! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_EXT_swap_control_tear
;-------------------------------------------

#define  WGL_EXT_swap_control_tear                    1


;-------------------------------------------
;-- WGL_I3D_digital_video_control
;-------------------------------------------

#define  WGL_I3D_digital_video_control                1
#define  WGL_DIGITAL_VIDEO_CURSOR_ALPHA_FRAMEBUFFER_I3D  2050h
#define  WGL_DIGITAL_VIDEO_CURSOR_ALPHA_VALUE_I3D     2051h
#define  WGL_DIGITAL_VIDEO_CURSOR_INCLUDED_I3D        2052h
#define  WGL_DIGITAL_VIDEO_GAMMA_CORRECTED_I3D        2053h
wglGetDigitalVideoParametersI3D!: alias function! [
	hDC        [ HDC! ]
	iAttribute [ integer! ]
	piValue    [ pointer! [integer!] ]
	return: [ logic! ]
]
wglSetDigitalVideoParametersI3D!: alias function! [
	hDC        [ HDC! ]
	iAttribute [ integer! ]
	piValue    [ pointer! [integer!] ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_I3D_gamma
;-------------------------------------------

#define  WGL_I3D_gamma                                1
#define  WGL_GAMMA_TABLE_SIZE_I3D                     204Eh
#define  WGL_GAMMA_EXCLUDE_DESKTOP_I3D                204Fh
wglGetGammaTableI3D!: alias function! [
	hDC      [ HDC! ]
	iEntries [ integer! ]
	puRed    [ uint16-ptr! ]
	puGreen  [ uint16-ptr! ]
	puBlue   [ uint16-ptr! ]
	return: [ logic! ]
]
wglGetGammaTableParametersI3D!: alias function! [
	hDC        [ HDC! ]
	iAttribute [ integer! ]
	piValue    [ pointer! [integer!] ]
	return: [ logic! ]
]
wglSetGammaTableI3D!: alias function! [
	hDC      [ HDC! ]
	iEntries [ integer! ]
	puRed    [ uint16-ptr! ]
	puGreen  [ uint16-ptr! ]
	puBlue   [ uint16-ptr! ]
	return: [ logic! ]
]
wglSetGammaTableParametersI3D!: alias function! [
	hDC        [ HDC! ]
	iAttribute [ integer! ]
	piValue    [ pointer! [integer!] ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_I3D_genlock
;-------------------------------------------

#define  WGL_I3D_genlock                              1
#define  WGL_GENLOCK_SOURCE_MULTIVIEW_I3D             2044h
#define  WGL_GENLOCK_SOURCE_EXTERNAL_SYNC_I3D         2045h
#define  WGL_GENLOCK_SOURCE_EXTERNAL_FIELD_I3D        2046h
#define  WGL_GENLOCK_SOURCE_EXTERNAL_TTL_I3D          2047h
#define  WGL_GENLOCK_SOURCE_DIGITAL_SYNC_I3D          2048h
#define  WGL_GENLOCK_SOURCE_DIGITAL_FIELD_I3D         2049h
#define  WGL_GENLOCK_SOURCE_EDGE_FALLING_I3D          204Ah
#define  WGL_GENLOCK_SOURCE_EDGE_RISING_I3D           204Bh
#define  WGL_GENLOCK_SOURCE_EDGE_BOTH_I3D             204Ch
wglDisableGenlockI3D!: alias function! [
	hDC     [ HDC! ]
	return: [ logic! ]
]
wglEnableGenlockI3D!: alias function! [
	hDC     [ HDC! ]
	return: [ logic! ]
]
wglGenlockSampleRateI3D!: alias function! [
	hDC     [ HDC! ]
	uRate   [ integer! ]
	return: [ logic! ]
]
wglGenlockSourceDelayI3D!: alias function! [
	hDC     [ HDC! ]
	uDelay  [ integer! ]
	return: [ logic! ]
]
wglGenlockSourceEdgeI3D!: alias function! [
	hDC     [ HDC! ]
	uEdge   [ integer! ]
	return: [ logic! ]
]
wglGenlockSourceI3D!: alias function! [
	hDC     [ HDC! ]
	uSource [ integer! ]
	return: [ logic! ]
]
wglGetGenlockSampleRateI3D!: alias function! [
	hDC     [ HDC! ]
	uRate   [ pointer! [integer!] ]
	return: [ logic! ]
]
wglGetGenlockSourceDelayI3D!: alias function! [
	hDC     [ HDC! ]
	uDelay  [ pointer! [integer!] ]
	return: [ logic! ]
]
wglGetGenlockSourceEdgeI3D!: alias function! [
	hDC     [ HDC! ]
	uEdge   [ pointer! [integer!] ]
	return: [ logic! ]
]
wglGetGenlockSourceI3D!: alias function! [
	hDC     [ HDC! ]
	uSource [ pointer! [integer!] ]
	return: [ logic! ]
]
wglIsEnabledGenlockI3D!: alias function! [
	hDC     [ HDC! ]
	pFlag   [ logic-ptr! ]
	return: [ logic! ]
]
wglQueryGenlockMaxSourceDelayI3D!: alias function! [
	hDC            [ HDC! ]
	uMaxLineDelay  [ pointer! [integer!] ]
	uMaxPixelDelay [ pointer! [integer!] ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_I3D_image_buffer
;-------------------------------------------

#define  WGL_I3D_image_buffer                         1
#define  WGL_IMAGE_BUFFER_MIN_ACCESS_I3D              00000001h
#define  WGL_IMAGE_BUFFER_LOCK_I3D                    00000002h
wglAssociateImageBufferEventsI3D!: alias function! [
	hdc      [ HDC! ]
	pEvent   [ handle-ptr! ]
	pAddress [ pointer! [integer!] ]
	pSize    [ pointer! [integer!] ]
	count    [ integer! ]
	return: [ logic! ]
]
wglCreateImageBufferI3D!: alias function! [
	hDC     [ HDC! ]
	dwSize  [ integer! ]
	uFlags  [ integer! ]
	return: [ pointer! [integer!] ]
]
wglDestroyImageBufferI3D!: alias function! [
	hDC      [ HDC! ]
	pAddress [ pointer! [integer!] ]
	return: [ logic! ]
]
wglReleaseImageBufferEventsI3D!: alias function! [
	hdc      [ HDC! ]
	pAddress [ pointer! [integer!] ]
	count    [ integer! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_I3D_swap_frame_lock
;-------------------------------------------

#define  WGL_I3D_swap_frame_lock                      1
wglDisableFrameLockI3D!: alias function! [
	return: [ logic! ]
]
wglEnableFrameLockI3D!: alias function! [
	return: [ logic! ]
]
wglIsEnabledFrameLockI3D!: alias function! [
	pFlag   [ logic-ptr! ]
	return: [ logic! ]
]
wglQueryFrameLockMasterI3D!: alias function! [
	pFlag   [ logic-ptr! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_I3D_swap_frame_usage
;-------------------------------------------

#define  WGL_I3D_swap_frame_usage                     1
wglBeginFrameTrackingI3D!: alias function! [
	return: [ logic! ]
]
wglEndFrameTrackingI3D!: alias function! [
	return: [ logic! ]
]
wglGetFrameUsageI3D!: alias function! [
	pUsage  [ pointer! [float32!] ]
	return: [ logic! ]
]
wglQueryFrameTrackingI3D!: alias function! [
	pFrameCount      [ pointer! [integer!] ]
	pMissedFrames    [ pointer! [integer!] ]
	pLastMissedUsage [ pointer! [float32!] ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_NV_DX_interop
;-------------------------------------------

#define  WGL_NV_DX_interop                            1
#define  WGL_ACCESS_READ_ONLY_NV                      0000h
#define  WGL_ACCESS_READ_WRITE_NV                     0001h
#define  WGL_ACCESS_WRITE_DISCARD_NV                  0002h
wglDXCloseDeviceNV!: alias function! [
	hDevice [ handle! ]
	return: [ logic! ]
]
wglDXLockObjectsNV!: alias function! [
	hDevice  [ handle! ]
	count    [ GLint! ]
	hObjects [ handle-ptr! ]
	return: [ logic! ]
]
wglDXObjectAccessNV!: alias function! [
	hObject [ handle! ]
	access  [ GLenum! ]
	return: [ logic! ]
]
wglDXOpenDeviceNV!: alias function! [
	dxDevice [ pointer! [byte!] ]
	return: [ handle! ]
]
wglDXRegisterObjectNV!: alias function! [
	hDevice  [ handle! ]
	dxObject [ pointer! [byte!] ]
	name     [ GLuint! ]
	type     [ GLenum! ]
	access   [ GLenum! ]
	return: [ handle! ]
]
wglDXSetResourceShareHandleNV!: alias function! [
	dxObject    [ pointer! [byte!] ]
	shareHandle [ handle! ]
	return: [ logic! ]
]
wglDXUnlockObjectsNV!: alias function! [
	hDevice  [ handle! ]
	count    [ GLint! ]
	hObjects [ handle-ptr! ]
	return: [ logic! ]
]
wglDXUnregisterObjectNV!: alias function! [
	hDevice [ handle! ]
	hObject [ handle! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_NV_DX_interop2
;-------------------------------------------

#define  WGL_NV_DX_interop2                           1


;-------------------------------------------
;-- WGL_NV_copy_image
;-------------------------------------------

#define  WGL_NV_copy_image                            1
wglCopyImageSubDataNV!: alias function! [
	hSrcRC    [ HGLRC! ]
	srcName   [ GLuint! ]
	srcTarget [ GLenum! ]
	srcLevel  [ GLint! ]
	srcX      [ GLint! ]
	srcY      [ GLint! ]
	srcZ      [ GLint! ]
	hDstRC    [ HGLRC! ]
	dstName   [ GLuint! ]
	dstTarget [ GLenum! ]
	dstLevel  [ GLint! ]
	dstX      [ GLint! ]
	dstY      [ GLint! ]
	dstZ      [ GLint! ]
	width     [ GLsizei! ]
	height    [ GLsizei! ]
	depth     [ GLsizei! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_NV_delay_before_swap
;-------------------------------------------

#define  WGL_NV_delay_before_swap                     1
wglDelayBeforeSwapNV!: alias function! [
	hDC     [ HDC! ]
	seconds [ GLfloat! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_NV_float_buffer
;-------------------------------------------

#define  WGL_NV_float_buffer                          1
#define  WGL_FLOAT_COMPONENTS_NV                      20B0h
#define  WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_R_NV     20B1h
#define  WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RG_NV    20B2h
#define  WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGB_NV   20B3h
#define  WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGBA_NV  20B4h
#define  WGL_TEXTURE_FLOAT_R_NV                       20B5h
#define  WGL_TEXTURE_FLOAT_RG_NV                      20B6h
#define  WGL_TEXTURE_FLOAT_RGB_NV                     20B7h
#define  WGL_TEXTURE_FLOAT_RGBA_NV                    20B8h


;-------------------------------------------
;-- WGL_NV_gpu_affinity
;-------------------------------------------

#define  WGL_NV_gpu_affinity                          1
#define  WGL_ERROR_INCOMPATIBLE_AFFINITY_MASKS_NV     20D0h
#define  WGL_ERROR_MISSING_AFFINITY_MASK_NV           20D1h
wglCreateAffinityDCNV!: alias function! [
	phGpuList [ HGPUNV-ptr! ]
	return: [ HDC! ]
]
wglDeleteDCNV!: alias function! [
	hdc     [ HDC! ]
	return: [ logic! ]
]
wglEnumGpuDevicesNV!: alias function! [
	hGpu         [ HGPUNV! ]
	iDeviceIndex [ integer! ]
	lpGpuDevice  [ PGPU_DEVICE! ]
	return: [ logic! ]
]
wglEnumGpusFromAffinityDCNV!: alias function! [
	hAffinityDC [ HDC! ]
	iGpuIndex   [ integer! ]
	hGpu        [ HGPUNV-ptr! ]
	return: [ logic! ]
]
wglEnumGpusNV!: alias function! [
	iGpuIndex [ integer! ]
	phGpu     [ HGPUNV-ptr! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_NV_multisample_coverage
;-------------------------------------------

#define  WGL_NV_multisample_coverage                  1
#define  WGL_COVERAGE_SAMPLES_NV                      2042h
#define  WGL_COLOR_SAMPLES_NV                         20B9h


;-------------------------------------------
;-- WGL_NV_present_video
;-------------------------------------------

#define  WGL_NV_present_video                         1
#define  WGL_NUM_VIDEO_SLOTS_NV                       20F0h
wglBindVideoDeviceNV!: alias function! [
	hDc          [ HDC! ]
	uVideoSlot   [ integer! ]
	hVideoDevice [ HVIDEOOUTPUTDEVICENV! ]
	piAttribList [ pointer! [integer!] ]
	return: [ logic! ]
]
wglEnumerateVideoDevicesNV!: alias function! [
	hDc          [ HDC! ]
	phDeviceList [ HVIDEOOUTPUTDEVICENV-ptr! ]
	return: [ integer! ]
]
wglQueryCurrentContextNV!: alias function! [
	iAttribute [ integer! ]
	piValue    [ pointer! [integer!] ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_NV_render_depth_texture
;-------------------------------------------

#define  WGL_NV_render_depth_texture                  1
;#define  WGL_NO_TEXTURE_ARB                           2077h
#define  WGL_BIND_TO_TEXTURE_DEPTH_NV                 20A3h
#define  WGL_BIND_TO_TEXTURE_RECTANGLE_DEPTH_NV       20A4h
#define  WGL_DEPTH_TEXTURE_FORMAT_NV                  20A5h
#define  WGL_TEXTURE_DEPTH_COMPONENT_NV               20A6h
#define  WGL_DEPTH_COMPONENT_NV                       20A7h


;-------------------------------------------
;-- WGL_NV_render_texture_rectangle
;-------------------------------------------

#define  WGL_NV_render_texture_rectangle              1
#define  WGL_BIND_TO_TEXTURE_RECTANGLE_RGB_NV         20A0h
#define  WGL_BIND_TO_TEXTURE_RECTANGLE_RGBA_NV        20A1h
#define  WGL_TEXTURE_RECTANGLE_NV                     20A2h


;-------------------------------------------
;-- WGL_NV_swap_group
;-------------------------------------------

#define  WGL_NV_swap_group                            1
wglBindSwapBarrierNV!: alias function! [
	group   [ GLuint! ]
	barrier [ GLuint! ]
	return: [ logic! ]
]
wglJoinSwapGroupNV!: alias function! [
	hDC     [ HDC! ]
	group   [ GLuint! ]
	return: [ logic! ]
]
wglQueryFrameCountNV!: alias function! [
	hDC     [ HDC! ]
	count   [ pointer! [GLuint!] ]
	return: [ logic! ]
]
wglQueryMaxSwapGroupsNV!: alias function! [
	hDC         [ HDC! ]
	maxGroups   [ pointer! [GLuint!] ]
	maxBarriers [ pointer! [GLuint!] ]
	return: [ logic! ]
]
wglQuerySwapGroupNV!: alias function! [
	hDC     [ HDC! ]
	group   [ pointer! [GLuint!] ]
	barrier [ pointer! [GLuint!] ]
	return: [ logic! ]
]
wglResetFrameCountNV!: alias function! [
	hDC     [ HDC! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_NV_vertex_array_range
;-------------------------------------------

#define  WGL_NV_vertex_array_range                    1
wglAllocateMemoryNV!: alias function! [
	size           [ GLsizei! ]
	readFrequency  [ GLfloat! ]
	writeFrequency [ GLfloat! ]
	priority       [ GLfloat! ]
	return: [ pointer! [byte!] ]
]
wglFreeMemoryNV!: alias function! [
	pointer [ pointer! [byte!] ]
]


;-------------------------------------------
;-- WGL_NV_video_capture
;-------------------------------------------

#define  WGL_NV_video_capture                         1
#define  WGL_UNIQUE_ID_NV                             20CEh
#define  WGL_NUM_VIDEO_CAPTURE_SLOTS_NV               20CFh
wglBindVideoCaptureDeviceNV!: alias function! [
	uVideoSlot [ integer! ]
	hDevice    [ HVIDEOINPUTDEVICENV! ]
	return: [ logic! ]
]
wglEnumerateVideoCaptureDevicesNV!: alias function! [
	hDc          [ HDC! ]
	phDeviceList [ HVIDEOINPUTDEVICENV-ptr! ]
	return: [ integer! ]
]
wglLockVideoCaptureDeviceNV!: alias function! [
	hDc     [ HDC! ]
	hDevice [ HVIDEOINPUTDEVICENV! ]
	return: [ logic! ]
]
wglQueryVideoCaptureDeviceNV!: alias function! [
	hDc        [ HDC! ]
	hDevice    [ HVIDEOINPUTDEVICENV! ]
	iAttribute [ integer! ]
	piValue    [ pointer! [integer!] ]
	return: [ logic! ]
]
wglReleaseVideoCaptureDeviceNV!: alias function! [
	hDc     [ HDC! ]
	hDevice [ HVIDEOINPUTDEVICENV! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_NV_video_output
;-------------------------------------------

#define  WGL_NV_video_output                          1
#define  WGL_BIND_TO_VIDEO_RGB_NV                     20C0h
#define  WGL_BIND_TO_VIDEO_RGBA_NV                    20C1h
#define  WGL_BIND_TO_VIDEO_RGB_AND_DEPTH_NV           20C2h
#define  WGL_VIDEO_OUT_COLOR_NV                       20C3h
#define  WGL_VIDEO_OUT_ALPHA_NV                       20C4h
#define  WGL_VIDEO_OUT_DEPTH_NV                       20C5h
#define  WGL_VIDEO_OUT_COLOR_AND_ALPHA_NV             20C6h
#define  WGL_VIDEO_OUT_COLOR_AND_DEPTH_NV             20C7h
#define  WGL_VIDEO_OUT_FRAME                          20C8h
#define  WGL_VIDEO_OUT_FIELD_1                        20C9h
#define  WGL_VIDEO_OUT_FIELD_2                        20CAh
#define  WGL_VIDEO_OUT_STACKED_FIELDS_1_2             20CBh
#define  WGL_VIDEO_OUT_STACKED_FIELDS_2_1             20CCh
wglBindVideoImageNV!: alias function! [
	hVideoDevice [ HPVIDEODEV! ]
	hPbuffer     [ HPBUFFERARB! ]
	iVideoBuffer [ integer! ]
	return: [ logic! ]
]
wglGetVideoDeviceNV!: alias function! [
	hDC          [ HDC! ]
	numDevices   [ integer! ]
	hVideoDevice [ HPVIDEODEV-ptr! ]
	return: [ logic! ]
]
wglGetVideoInfoNV!: alias function! [
	hpVideoDevice           [ HPVIDEODEV! ]
	pulCounterOutputPbuffer [ pointer! [integer!] ]
	pulCounterOutputVideo   [ pointer! [integer!] ]
	return: [ logic! ]
]
wglReleaseVideoDeviceNV!: alias function! [
	hVideoDevice [ HPVIDEODEV! ]
	return: [ logic! ]
]
wglReleaseVideoImageNV!: alias function! [
	hPbuffer     [ HPBUFFERARB! ]
	iVideoBuffer [ integer! ]
	return: [ logic! ]
]
wglSendPbufferToVideoNV!: alias function! [
	hPbuffer          [ HPBUFFERARB! ]
	iBufferType       [ integer! ]
	pulCounterPbuffer [ pointer! [integer!] ]
	bBlock            [ logic! ]
	return: [ logic! ]
]


;-------------------------------------------
;-- WGL_OML_sync_control
;-------------------------------------------

#define  WGL_OML_sync_control                         1
wglGetMscRateOML!: alias function! [
	hdc         [ HDC! ]
	numerator   [ pointer! [integer!] ]
	denominator [ pointer! [integer!] ]
	return: [ logic! ]
]
wglGetSyncValuesOML!: alias function! [
	hdc     [ HDC! ]
	ust     [ int64-ptr! ]
	msc     [ int64-ptr! ]
	sbc     [ int64-ptr! ]
	return: [ logic! ]
]
wglSwapBuffersMscOML!: alias function! [
	hdc        [ HDC! ]
	target_msc [ int64! ]
	divisor    [ int64! ]
	remainder  [ int64! ]
	return: [ int64! ]
]
wglSwapLayerBuffersMscOML!: alias function! [
	hdc        [ HDC! ]
	fuPlanes   [ integer! ]
	target_msc [ int64! ]
	divisor    [ int64! ]
	remainder  [ int64! ]
	return: [ int64! ]
]
wglWaitForMscOML!: alias function! [
	hdc        [ HDC! ]
	target_msc [ int64! ]
	divisor    [ int64! ]
	remainder  [ int64! ]
	ust        [ int64-ptr! ]
	msc        [ int64-ptr! ]
	sbc        [ int64-ptr! ]
	return: [ logic! ]
]
wglWaitForSbcOML!: alias function! [
	hdc        [ HDC! ]
	target_sbc [ int64! ]
	ust        [ int64-ptr! ]
	msc        [ int64-ptr! ]
	sbc        [ int64-ptr! ]
	return: [ logic! ]
]

] ;end of #if OS = 'Windows