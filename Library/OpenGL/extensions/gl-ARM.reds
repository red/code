Red/System [
	Title:   "Red/System OpenGL ARM extension binding"
	Author:  "Oldes"
	File: 	 %gl-ARM.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_ARM_mali_program_binary
;-------------------------------------------

#define  GL_ARM_mali_program_binary                   1
#define  GL_MALI_PROGRAM_BINARY_ARM                   8F61h


;-------------------------------------------
;-- GL_ARM_mali_shader_binary
;-------------------------------------------

#define  GL_ARM_mali_shader_binary                    1
#define  GL_MALI_SHADER_BINARY_ARM                    8F60h


;-------------------------------------------
;-- GL_ARM_rgba8
;-------------------------------------------

#define  GL_ARM_rgba8                                 1
#define  GL_RGBA8_OES                                 8058h


;-------------------------------------------
;-- GL_ARM_shader_framebuffer_fetch
;-------------------------------------------

#define  GL_ARM_shader_framebuffer_fetch              1
#define  GL_FETCH_PER_SAMPLE_ARM                      8F65h
#define  GL_FRAGMENT_SHADER_FRAMEBUFFER_FETCH_MRT_ARM  8F66h


;-------------------------------------------
;-- GL_ARM_shader_framebuffer_fetch_depth_stencil
;-------------------------------------------

#define  GL_ARM_shader_framebuffer_fetch_depth_stencil  1
