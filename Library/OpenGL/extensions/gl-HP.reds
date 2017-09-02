Red/System [
	Title:   "Red/System OpenGL HP extension binding"
	Author:  "Oldes"
	File: 	 %gl-HP.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_HP_convolution_border_modes
;-------------------------------------------

#define  GL_HP_convolution_border_modes               1


;-------------------------------------------
;-- GL_HP_image_transform
;-------------------------------------------

#define  GL_HP_image_transform                        1
;@@ void ( GLenum target, GLenum pname, const GLfloat* params );
glGetImageTransformParameterfvHP!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLint* params );
glGetImageTransformParameterivHP!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLfloat param );
glImageTransformParameterfHP!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum target, GLenum pname, const GLfloat* params );
glImageTransformParameterfvHP!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLint param );
glImageTransformParameteriHP!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum target, GLenum pname, const GLint* params );
glImageTransformParameterivHP!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_HP_occlusion_test
;-------------------------------------------

#define  GL_HP_occlusion_test                         1


;-------------------------------------------
;-- GL_HP_texture_lighting
;-------------------------------------------

#define  GL_HP_texture_lighting                       1
