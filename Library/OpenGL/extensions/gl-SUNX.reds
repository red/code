Red/System [
	Title:   "Red/System OpenGL SUNX extension binding"
	Author:  "Oldes"
	File: 	 %gl-SUNX.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_SUNX_constant_data
;-------------------------------------------

#define  GL_SUNX_constant_data                        1
#define  GL_UNPACK_CONSTANT_DATA_SUNX                 81D5h
#define  GL_TEXTURE_CONSTANT_DATA_SUNX                81D6h
;@@ void ( void );
glFinishTextureSUNX!: alias function! [
]
