Red/System [
	Title:   "Red/System OpenGL 3DFX extension binding"
	Author:  "Oldes"
	File: 	 %gl-3DFX.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_3DFX_multisample
;-------------------------------------------

#define  GL_3DFX_multisample                          1
#define  GL_MULTISAMPLE_3DFX                          86B2h
#define  GL_SAMPLE_BUFFERS_3DFX                       86B3h
#define  GL_SAMPLES_3DFX                              86B4h
#define  GL_MULTISAMPLE_BIT_3DFX                      20000000h


;-------------------------------------------
;-- GL_3DFX_tbuffer
;-------------------------------------------

#define  GL_3DFX_tbuffer                              1
;@@ void ( GLuint mask );
glTbufferMask3DFX!: alias function! [
	mask        [ GLuint! ]
]


;-------------------------------------------
;-- GL_3DFX_texture_compression_FXT1
;-------------------------------------------

#define  GL_3DFX_texture_compression_FXT1             1
#define  GL_COMPRESSED_RGB_FXT1_3DFX                  86B0h
#define  GL_COMPRESSED_RGBA_FXT1_3DFX                 86B1h
