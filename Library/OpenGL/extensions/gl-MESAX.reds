Red/System [
	Title:   "Red/System OpenGL MESAX extension binding"
	Author:  "Oldes"
	File: 	 %gl-MESAX.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_MESAX_texture_stack
;-------------------------------------------

#define  GL_MESAX_texture_stack                       1
#define  GL_TEXTURE_1D_STACK_MESAX                    8759h
#define  GL_TEXTURE_2D_STACK_MESAX                    875Ah
#define  GL_PROXY_TEXTURE_1D_STACK_MESAX              875Bh
#define  GL_PROXY_TEXTURE_2D_STACK_MESAX              875Ch
#define  GL_TEXTURE_1D_STACK_BINDING_MESAX            875Dh
#define  GL_TEXTURE_2D_STACK_BINDING_MESAX            875Eh
