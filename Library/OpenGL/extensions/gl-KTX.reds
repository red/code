Red/System [
	Title:   "Red/System OpenGL KTX extension binding"
	Author:  "Oldes"
	File: 	 %gl-KTX.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_KTX_buffer_region
;-------------------------------------------

#define  GL_KTX_buffer_region                         1
#define  GL_KTX_FRONT_REGION                          00h
#define  GL_KTX_BACK_REGION                           01h
#define  GL_KTX_Z_REGION                              02h
#define  GL_KTX_STENCIL_REGION                        03h
;@@ GLuint ( void );
glBufferRegionEnabled!: alias function! [
	return: [ GLuint! ]

]
;@@ void ( GLenum region );
glDeleteBufferRegion!: alias function! [
	region      [ GLenum! ]
]
;@@ void ( GLuint region, GLint x, GLint y, GLsizei width, GLsizei height, GLint xDest, GLint yDest );
glDrawBufferRegion!: alias function! [
	region      [ GLuint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	xDest       [ GLint! ]
	yDest       [ GLint! ]
]
;@@ GLuint ( GLenum region );
glNewBufferRegion!: alias function! [
	region      [ GLenum! ]
	return: [ GLuint! ]

]
;@@ void ( GLuint region, GLint x, GLint y, GLsizei width, GLsizei height );
glReadBufferRegion!: alias function! [
	region      [ GLuint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
