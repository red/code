Red/System [
	Title:   "Red/System OpenGL SUN extension binding"
	Author:  "Oldes"
	File: 	 %gl-SUN.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_SUN_convolution_border_modes
;-------------------------------------------

#define  GL_SUN_convolution_border_modes              1
#define  GL_WRAP_BORDER_SUN                           81D4h


;-------------------------------------------
;-- GL_SUN_global_alpha
;-------------------------------------------

#define  GL_SUN_global_alpha                          1
#define  GL_GLOBAL_ALPHA_SUN                          81D9h
#define  GL_GLOBAL_ALPHA_FACTOR_SUN                   81DAh
;@@ void ( GLbyte factor );
glGlobalAlphaFactorbSUN!: alias function! [
	factor      [ GLbyte! ]
]
;@@ void ( GLdouble factor );
glGlobalAlphaFactordSUN!: alias function! [
	factor      [ GLdouble! ]
]
;@@ void ( GLfloat factor );
glGlobalAlphaFactorfSUN!: alias function! [
	factor      [ GLfloat! ]
]
;@@ void ( GLint factor );
glGlobalAlphaFactoriSUN!: alias function! [
	factor      [ GLint! ]
]
;@@ void ( GLshort factor );
glGlobalAlphaFactorsSUN!: alias function! [
	factor      [ GLshort! ]
]
;@@ void ( GLubyte factor );
glGlobalAlphaFactorubSUN!: alias function! [
	factor      [ GLubyte! ]
]
;@@ void ( GLuint factor );
glGlobalAlphaFactoruiSUN!: alias function! [
	factor      [ GLuint! ]
]
;@@ void ( GLushort factor );
glGlobalAlphaFactorusSUN!: alias function! [
	factor      [ GLushort! ]
]


;-------------------------------------------
;-- GL_SUN_mesh_array
;-------------------------------------------

#define  GL_SUN_mesh_array                            1
#define  GL_QUAD_MESH_SUN                             8614h
#define  GL_TRIANGLE_MESH_SUN                         8615h


;-------------------------------------------
;-- GL_SUN_read_video_pixels
;-------------------------------------------

#define  GL_SUN_read_video_pixels                     1
;@@ void ( GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, void* pixels );
glReadVideoPixelsSUN!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_SUN_slice_accum
;-------------------------------------------

#define  GL_SUN_slice_accum                           1
#define  GL_SLICE_ACCUM_SUN                           85CCh


;-------------------------------------------
;-- GL_SUN_triangle_list
;-------------------------------------------

#define  GL_SUN_triangle_list                         1
#define  GL_RESTART_SUN                               01h
#define  GL_REPLACE_MIDDLE_SUN                        02h
#define  GL_REPLACE_OLDEST_SUN                        03h
#define  GL_TRIANGLE_LIST_SUN                         81D7h
#define  GL_REPLACEMENT_CODE_SUN                      81D8h
#define  GL_REPLACEMENT_CODE_ARRAY_SUN                85C0h
#define  GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN           85C1h
#define  GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN         85C2h
#define  GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN        85C3h
#define  GL_R1UI_V3F_SUN                              85C4h
#define  GL_R1UI_C4UB_V3F_SUN                         85C5h
#define  GL_R1UI_C3F_V3F_SUN                          85C6h
#define  GL_R1UI_N3F_V3F_SUN                          85C7h
#define  GL_R1UI_C4F_N3F_V3F_SUN                      85C8h
#define  GL_R1UI_T2F_V3F_SUN                          85C9h
#define  GL_R1UI_T2F_N3F_V3F_SUN                      85CAh
#define  GL_R1UI_T2F_C4F_N3F_V3F_SUN                  85CBh
;@@ void ( GLenum type, GLsizei stride, const void *pointer );
glReplacementCodePointerSUN!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLubyte code );
glReplacementCodeubSUN!: alias function! [
	code        [ GLubyte! ]
]
;@@ void ( const GLubyte* code );
glReplacementCodeubvSUN!: alias function! [
	code        [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint code );
glReplacementCodeuiSUN!: alias function! [
	code        [ GLuint! ]
]
;@@ void ( const GLuint* code );
glReplacementCodeuivSUN!: alias function! [
	code        [ pointer! [GLuint!] ]
]
;@@ void ( GLushort code );
glReplacementCodeusSUN!: alias function! [
	code        [ GLushort! ]
]
;@@ void ( const GLushort* code );
glReplacementCodeusvSUN!: alias function! [
	code        [ GLushort-ptr! ]
]


;-------------------------------------------
;-- GL_SUN_vertex
;-------------------------------------------

#define  GL_SUN_vertex                                1
;@@ void ( GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z );
glColor3fVertex3fSUN!: alias function! [
	r           [ GLfloat! ]
	g           [ GLfloat! ]
	b           [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat* c, const GLfloat *v );
glColor3fVertex3fvSUN!: alias function! [
	c           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z );
glColor4fNormal3fVertex3fSUN!: alias function! [
	r           [ GLfloat! ]
	g           [ GLfloat! ]
	b           [ GLfloat! ]
	a           [ GLfloat! ]
	nx          [ GLfloat! ]
	ny          [ GLfloat! ]
	nz          [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat* c, const GLfloat *n, const GLfloat *v );
glColor4fNormal3fVertex3fvSUN!: alias function! [
	c           [ pointer! [GLfloat!] ]
	n           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y );
glColor4ubVertex2fSUN!: alias function! [
	r           [ GLubyte! ]
	g           [ GLubyte! ]
	b           [ GLubyte! ]
	a           [ GLubyte! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
]
;@@ void ( const GLubyte* c, const GLfloat *v );
glColor4ubVertex2fvSUN!: alias function! [
	c           [ pointer! [GLubyte!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z );
glColor4ubVertex3fSUN!: alias function! [
	r           [ GLubyte! ]
	g           [ GLubyte! ]
	b           [ GLubyte! ]
	a           [ GLubyte! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLubyte* c, const GLfloat *v );
glColor4ubVertex3fvSUN!: alias function! [
	c           [ pointer! [GLubyte!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z );
glNormal3fVertex3fSUN!: alias function! [
	nx          [ GLfloat! ]
	ny          [ GLfloat! ]
	nz          [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat* n, const GLfloat *v );
glNormal3fVertex3fvSUN!: alias function! [
	n           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z );
glReplacementCodeuiColor3fVertex3fSUN!: alias function! [
	rc          [ GLuint! ]
	r           [ GLfloat! ]
	g           [ GLfloat! ]
	b           [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLuint* rc, const GLfloat *c, const GLfloat *v );
glReplacementCodeuiColor3fVertex3fvSUN!: alias function! [
	rc          [ pointer! [GLuint!] ]
	c           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z );
glReplacementCodeuiColor4fNormal3fVertex3fSUN!: alias function! [
	rc          [ GLuint! ]
	r           [ GLfloat! ]
	g           [ GLfloat! ]
	b           [ GLfloat! ]
	a           [ GLfloat! ]
	nx          [ GLfloat! ]
	ny          [ GLfloat! ]
	nz          [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLuint* rc, const GLfloat *c, const GLfloat *n, const GLfloat *v );
glReplacementCodeuiColor4fNormal3fVertex3fvSUN!: alias function! [
	rc          [ pointer! [GLuint!] ]
	c           [ pointer! [GLfloat!] ]
	n           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint rc, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z );
glReplacementCodeuiColor4ubVertex3fSUN!: alias function! [
	rc          [ GLuint! ]
	r           [ GLubyte! ]
	g           [ GLubyte! ]
	b           [ GLubyte! ]
	a           [ GLubyte! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLuint* rc, const GLubyte *c, const GLfloat *v );
glReplacementCodeuiColor4ubVertex3fvSUN!: alias function! [
	rc          [ pointer! [GLuint!] ]
	c           [ pointer! [GLubyte!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint rc, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z );
glReplacementCodeuiNormal3fVertex3fSUN!: alias function! [
	rc          [ GLuint! ]
	nx          [ GLfloat! ]
	ny          [ GLfloat! ]
	nz          [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLuint* rc, const GLfloat *n, const GLfloat *v );
glReplacementCodeuiNormal3fVertex3fvSUN!: alias function! [
	rc          [ pointer! [GLuint!] ]
	n           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint rc, GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z );
glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN!: alias function! [
	rc          [ GLuint! ]
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	r           [ GLfloat! ]
	g           [ GLfloat! ]
	b           [ GLfloat! ]
	a           [ GLfloat! ]
	nx          [ GLfloat! ]
	ny          [ GLfloat! ]
	nz          [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLuint* rc, const GLfloat *tc, const GLfloat *c, const GLfloat *n, const GLfloat *v );
glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN!: alias function! [
	rc          [ pointer! [GLuint!] ]
	tc          [ pointer! [GLfloat!] ]
	c           [ pointer! [GLfloat!] ]
	n           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint rc, GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z );
glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN!: alias function! [
	rc          [ GLuint! ]
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	nx          [ GLfloat! ]
	ny          [ GLfloat! ]
	nz          [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLuint* rc, const GLfloat *tc, const GLfloat *n, const GLfloat *v );
glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN!: alias function! [
	rc          [ pointer! [GLuint!] ]
	tc          [ pointer! [GLfloat!] ]
	n           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint rc, GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z );
glReplacementCodeuiTexCoord2fVertex3fSUN!: alias function! [
	rc          [ GLuint! ]
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLuint* rc, const GLfloat *tc, const GLfloat *v );
glReplacementCodeuiTexCoord2fVertex3fvSUN!: alias function! [
	rc          [ pointer! [GLuint!] ]
	tc          [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint rc, GLfloat x, GLfloat y, GLfloat z );
glReplacementCodeuiVertex3fSUN!: alias function! [
	rc          [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLuint* rc, const GLfloat *v );
glReplacementCodeuiVertex3fvSUN!: alias function! [
	rc          [ pointer! [GLuint!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z );
glTexCoord2fColor3fVertex3fSUN!: alias function! [
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	r           [ GLfloat! ]
	g           [ GLfloat! ]
	b           [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat* tc, const GLfloat *c, const GLfloat *v );
glTexCoord2fColor3fVertex3fvSUN!: alias function! [
	tc          [ pointer! [GLfloat!] ]
	c           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z );
glTexCoord2fColor4fNormal3fVertex3fSUN!: alias function! [
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	r           [ GLfloat! ]
	g           [ GLfloat! ]
	b           [ GLfloat! ]
	a           [ GLfloat! ]
	nx          [ GLfloat! ]
	ny          [ GLfloat! ]
	nz          [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat* tc, const GLfloat *c, const GLfloat *n, const GLfloat *v );
glTexCoord2fColor4fNormal3fVertex3fvSUN!: alias function! [
	tc          [ pointer! [GLfloat!] ]
	c           [ pointer! [GLfloat!] ]
	n           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat s, GLfloat t, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z );
glTexCoord2fColor4ubVertex3fSUN!: alias function! [
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	r           [ GLubyte! ]
	g           [ GLubyte! ]
	b           [ GLubyte! ]
	a           [ GLubyte! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat* tc, const GLubyte *c, const GLfloat *v );
glTexCoord2fColor4ubVertex3fvSUN!: alias function! [
	tc          [ pointer! [GLfloat!] ]
	c           [ pointer! [GLubyte!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z );
glTexCoord2fNormal3fVertex3fSUN!: alias function! [
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	nx          [ GLfloat! ]
	ny          [ GLfloat! ]
	nz          [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat* tc, const GLfloat *n, const GLfloat *v );
glTexCoord2fNormal3fVertex3fvSUN!: alias function! [
	tc          [ pointer! [GLfloat!] ]
	n           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z );
glTexCoord2fVertex3fSUN!: alias function! [
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat* tc, const GLfloat *v );
glTexCoord2fVertex3fvSUN!: alias function! [
	tc          [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glTexCoord4fColor4fNormal3fVertex4fSUN!: alias function! [
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	p           [ GLfloat! ]
	q           [ GLfloat! ]
	r           [ GLfloat! ]
	g           [ GLfloat! ]
	b           [ GLfloat! ]
	a           [ GLfloat! ]
	nx          [ GLfloat! ]
	ny          [ GLfloat! ]
	nz          [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( const GLfloat* tc, const GLfloat *c, const GLfloat *n, const GLfloat *v );
glTexCoord4fColor4fNormal3fVertex4fvSUN!: alias function! [
	tc          [ pointer! [GLfloat!] ]
	c           [ pointer! [GLfloat!] ]
	n           [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glTexCoord4fVertex4fSUN!: alias function! [
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	p           [ GLfloat! ]
	q           [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( const GLfloat* tc, const GLfloat *v );
glTexCoord4fVertex4fvSUN!: alias function! [
	tc          [ pointer! [GLfloat!] ]
	v           [ pointer! [GLfloat!] ]
]
