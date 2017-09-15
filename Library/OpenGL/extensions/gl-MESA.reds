Red/System [
	Title:   "Red/System OpenGL MESA extension binding"
	Author:  "Oldes"
	File: 	 %gl-MESA.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_MESA_pack_invert
;-------------------------------------------

#define  GL_MESA_pack_invert                          1
#define  GL_PACK_INVERT_MESA                          8758h


;-------------------------------------------
;-- GL_MESA_resize_buffers
;-------------------------------------------

#define  GL_MESA_resize_buffers                       1
;@@ void ( void );
glResizeBuffersMESA!: alias function! [
]


;-------------------------------------------
;-- GL_MESA_shader_integer_functions
;-------------------------------------------

#define  GL_MESA_shader_integer_functions             1


;-------------------------------------------
;-- GL_MESA_window_pos
;-------------------------------------------

#define  GL_MESA_window_pos                           1
;@@ void ( GLdouble x, GLdouble y );
glWindowPos2dMESA!: alias function! [
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( const GLdouble* p );
glWindowPos2dvMESA!: alias function! [
	p           [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat x, GLfloat y );
glWindowPos2fMESA!: alias function! [
	x           [ GLfloat! ]
	y           [ GLfloat! ]
]
;@@ void ( const GLfloat* p );
glWindowPos2fvMESA!: alias function! [
	p           [ pointer! [GLfloat!] ]
]
;@@ void ( GLint x, GLint y );
glWindowPos2iMESA!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
]
;@@ void ( const GLint* p );
glWindowPos2ivMESA!: alias function! [
	p           [ pointer! [GLint!] ]
]
;@@ void ( GLshort x, GLshort y );
glWindowPos2sMESA!: alias function! [
	x           [ GLshort! ]
	y           [ GLshort! ]
]
;@@ void ( const GLshort* p );
glWindowPos2svMESA!: alias function! [
	p           [ GLshort-ptr! ]
]
;@@ void ( GLdouble x, GLdouble y, GLdouble z );
glWindowPos3dMESA!: alias function! [
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( const GLdouble* p );
glWindowPos3dvMESA!: alias function! [
	p           [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat x, GLfloat y, GLfloat z );
glWindowPos3fMESA!: alias function! [
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat* p );
glWindowPos3fvMESA!: alias function! [
	p           [ pointer! [GLfloat!] ]
]
;@@ void ( GLint x, GLint y, GLint z );
glWindowPos3iMESA!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
]
;@@ void ( const GLint* p );
glWindowPos3ivMESA!: alias function! [
	p           [ pointer! [GLint!] ]
]
;@@ void ( GLshort x, GLshort y, GLshort z );
glWindowPos3sMESA!: alias function! [
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
]
;@@ void ( const GLshort* p );
glWindowPos3svMESA!: alias function! [
	p           [ GLshort-ptr! ]
]
;@@ void ( GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glWindowPos4dMESA!: alias function! [
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( const GLdouble* p );
glWindowPos4dvMESA!: alias function! [
	p           [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glWindowPos4fMESA!: alias function! [
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( const GLfloat* p );
glWindowPos4fvMESA!: alias function! [
	p           [ pointer! [GLfloat!] ]
]
;@@ void ( GLint x, GLint y, GLint z, GLint w );
glWindowPos4iMESA!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
	w           [ GLint! ]
]
;@@ void ( const GLint* p );
glWindowPos4ivMESA!: alias function! [
	p           [ pointer! [GLint!] ]
]
;@@ void ( GLshort x, GLshort y, GLshort z, GLshort w );
glWindowPos4sMESA!: alias function! [
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
	w           [ GLshort! ]
]
;@@ void ( const GLshort* p );
glWindowPos4svMESA!: alias function! [
	p           [ GLshort-ptr! ]
]


;-------------------------------------------
;-- GL_MESA_ycbcr_texture
;-------------------------------------------

#define  GL_MESA_ycbcr_texture                        1
#define  GL_UNSIGNED_SHORT_8_8_MESA                   85BAh
#define  GL_UNSIGNED_SHORT_8_8_REV_MESA               85BBh
#define  GL_YCBCR_MESA                                8757h
