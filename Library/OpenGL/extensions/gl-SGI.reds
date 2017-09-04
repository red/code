Red/System [
	Title:   "Red/System OpenGL SGI extension binding"
	Author:  "Oldes"
	File: 	 %gl-SGI.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_SGI_color_matrix
;-------------------------------------------

#define  GL_SGI_color_matrix                          1
#define  GL_COLOR_MATRIX_SGI                          80B1h
#define  GL_COLOR_MATRIX_STACK_DEPTH_SGI              80B2h
#define  GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI          80B3h
#define  GL_POST_COLOR_MATRIX_RED_SCALE_SGI           80B4h
#define  GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI         80B5h
#define  GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI          80B6h
#define  GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI         80B7h
#define  GL_POST_COLOR_MATRIX_RED_BIAS_SGI            80B8h
#define  GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI          80B9h
#define  GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI           80BAh
#define  GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI          80BBh


;-------------------------------------------
;-- GL_SGI_color_table
;-------------------------------------------

#define  GL_SGI_color_table                           1
#define  GL_COLOR_TABLE_SGI                           80D0h
#define  GL_POST_CONVOLUTION_COLOR_TABLE_SGI          80D1h
#define  GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI         80D2h
#define  GL_PROXY_COLOR_TABLE_SGI                     80D3h
#define  GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI    80D4h
#define  GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI   80D5h
#define  GL_COLOR_TABLE_SCALE_SGI                     80D6h
#define  GL_COLOR_TABLE_BIAS_SGI                      80D7h
#define  GL_COLOR_TABLE_FORMAT_SGI                    80D8h
#define  GL_COLOR_TABLE_WIDTH_SGI                     80D9h
#define  GL_COLOR_TABLE_RED_SIZE_SGI                  80DAh
#define  GL_COLOR_TABLE_GREEN_SIZE_SGI                80DBh
#define  GL_COLOR_TABLE_BLUE_SIZE_SGI                 80DCh
#define  GL_COLOR_TABLE_ALPHA_SIZE_SGI                80DDh
#define  GL_COLOR_TABLE_LUMINANCE_SIZE_SGI            80DEh
#define  GL_COLOR_TABLE_INTENSITY_SIZE_SGI            80DFh
;@@ void ( GLenum target, GLenum pname, const GLfloat* params );
glColorTableParameterfvSGI!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLint* params );
glColorTableParameterivSGI!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const void *table );
glColorTableSGI!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	table       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width );
glCopyColorTableSGI!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat* params );
glGetColorTableParameterfvSGI!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetColorTableParameterivSGI!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum format, GLenum type, void *table );
glGetColorTableSGI!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	table       [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_SGI_complex
;-------------------------------------------

#define  GL_SGI_complex                               1


;-------------------------------------------
;-- GL_SGI_complex_type
;-------------------------------------------

#define  GL_SGI_complex_type                          1
#define  GL_COMPLEX_UNSIGNED_BYTE_SGI                 81BDh
#define  GL_COMPLEX_BYTE_SGI                          81BEh
#define  GL_COMPLEX_UNSIGNED_SHORT_SGI                81BFh
#define  GL_COMPLEX_SHORT_SGI                         81C0h
#define  GL_COMPLEX_UNSIGNED_INT_SGI                  81C1h
#define  GL_COMPLEX_INT_SGI                           81C2h
#define  GL_COMPLEX_FLOAT_SGI                         81C3h


;-------------------------------------------
;-- GL_SGI_fft
;-------------------------------------------

#define  GL_SGI_fft                                   1
#define  GL_PIXEL_TRANSFORM_OPERATOR_SGI              81C4h
#define  GL_CONVOLUTION_SGI                           81C5h
#define  GL_FFT_1D_SGI                                81C6h
#define  GL_PIXEL_TRANSFORM_SGI                       81C7h
#define  GL_MAX_FFT_WIDTH_SGI                         81C8h
;@@ void ( GLenum target, GLenum pname, GLfloat* params );
glGetPixelTransformParameterfvSGI!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetPixelTransformParameterivSGI!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat param );
glPixelTransformParameterfSGI!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum target, GLenum pname, const GLfloat* params );
glPixelTransformParameterfvSGI!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint param );
glPixelTransformParameteriSGI!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum target, GLenum pname, const GLint* params );
glPixelTransformParameterivSGI!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target );
glPixelTransformSGI!: alias function! [
	target      [ GLenum! ]
]


;-------------------------------------------
;-- GL_SGI_texture_color_table
;-------------------------------------------

#define  GL_SGI_texture_color_table                   1
#define  GL_TEXTURE_COLOR_TABLE_SGI                   80BCh
#define  GL_PROXY_TEXTURE_COLOR_TABLE_SGI             80BDh
