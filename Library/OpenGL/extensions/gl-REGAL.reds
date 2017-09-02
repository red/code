Red/System [
	Title:   "Red/System OpenGL REGAL extension binding"
	Author:  "Oldes"
	File: 	 %gl-REGAL.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_REGAL_ES1_0_compatibility
;-------------------------------------------

#define  GL_REGAL_ES1_0_compatibility                 1
;@@ void ( GLenum func, GLclampx ref );
glAlphaFuncx!: alias function! [
	func        [ GLenum! ]
	ref         [ GLclampx! ]
]
;@@ void ( GLclampx red, GLclampx green, GLclampx blue, GLclampx alpha );
glClearColorx!: alias function! [
	red         [ GLclampx! ]
	green       [ GLclampx! ]
	blue        [ GLclampx! ]
	alpha       [ GLclampx! ]
]
;@@ void ( GLclampx depth );
glClearDepthx!: alias function! [
	depth       [ GLclampx! ]
]
;@@ void ( GLfixed red, GLfixed green, GLfixed blue, GLfixed alpha );
glColor4x!: alias function! [
	red         [ GLfixed! ]
	green       [ GLfixed! ]
	blue        [ GLfixed! ]
	alpha       [ GLfixed! ]
]
;@@ void ( GLclampx zNear, GLclampx zFar );
glDepthRangex!: alias function! [
	zNear       [ GLclampx! ]
	zFar        [ GLclampx! ]
]
;@@ void ( GLenum pname, GLfixed param );
glFogx!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfixed! ]
]
;@@ void ( GLenum pname, const GLfixed* params );
glFogxv!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( GLfloat left, GLfloat right, GLfloat bottom, GLfloat top, GLfloat zNear, GLfloat zFar );
glFrustumf!: alias function! [
	left        [ GLfloat! ]
	right       [ GLfloat! ]
	bottom      [ GLfloat! ]
	top         [ GLfloat! ]
	zNear       [ GLfloat! ]
	zFar        [ GLfloat! ]
]
;@@ void ( GLfixed left, GLfixed right, GLfixed bottom, GLfixed top, GLfixed zNear, GLfixed zFar );
glFrustumx!: alias function! [
	left        [ GLfixed! ]
	right       [ GLfixed! ]
	bottom      [ GLfixed! ]
	top         [ GLfixed! ]
	zNear       [ GLfixed! ]
	zFar        [ GLfixed! ]
]
;@@ void ( GLenum pname, GLfixed param );
glLightModelx!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfixed! ]
]
;@@ void ( GLenum pname, const GLfixed* params );
glLightModelxv!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum light, GLenum pname, GLfixed param );
glLightx!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfixed! ]
]
;@@ void ( GLenum light, GLenum pname, const GLfixed* params );
glLightxv!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( GLfixed width );
glLineWidthx!: alias function! [
	width       [ GLfixed! ]
]
;@@ void ( const GLfixed* m );
glLoadMatrixx!: alias function! [
	m           [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum face, GLenum pname, GLfixed param );
glMaterialx!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfixed! ]
]
;@@ void ( GLenum face, GLenum pname, const GLfixed* params );
glMaterialxv!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( const GLfixed* m );
glMultMatrixx!: alias function! [
	m           [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum target, GLfixed s, GLfixed t, GLfixed r, GLfixed q );
glMultiTexCoord4x!: alias function! [
	target      [ GLenum! ]
	s           [ GLfixed! ]
	t           [ GLfixed! ]
	r           [ GLfixed! ]
	q           [ GLfixed! ]
]
;@@ void ( GLfixed nx, GLfixed ny, GLfixed nz );
glNormal3x!: alias function! [
	nx          [ GLfixed! ]
	ny          [ GLfixed! ]
	nz          [ GLfixed! ]
]
;@@ void ( GLfloat left, GLfloat right, GLfloat bottom, GLfloat top, GLfloat zNear, GLfloat zFar );
glOrthof!: alias function! [
	left        [ GLfloat! ]
	right       [ GLfloat! ]
	bottom      [ GLfloat! ]
	top         [ GLfloat! ]
	zNear       [ GLfloat! ]
	zFar        [ GLfloat! ]
]
;@@ void ( GLfixed left, GLfixed right, GLfixed bottom, GLfixed top, GLfixed zNear, GLfixed zFar );
glOrthox!: alias function! [
	left        [ GLfixed! ]
	right       [ GLfixed! ]
	bottom      [ GLfixed! ]
	top         [ GLfixed! ]
	zNear       [ GLfixed! ]
	zFar        [ GLfixed! ]
]
;@@ void ( GLfixed size );
glPointSizex!: alias function! [
	size        [ GLfixed! ]
]
;@@ void ( GLfixed factor, GLfixed units );
glPolygonOffsetx!: alias function! [
	factor      [ GLfixed! ]
	units       [ GLfixed! ]
]
;@@ void ( GLfixed angle, GLfixed x, GLfixed y, GLfixed z );
glRotatex!: alias function! [
	angle       [ GLfixed! ]
	x           [ GLfixed! ]
	y           [ GLfixed! ]
	z           [ GLfixed! ]
]
;@@ void ( GLclampx value, GLboolean invert );
glSampleCoveragex!: alias function! [
	value       [ GLclampx! ]
	invert      [ GLboolean! ]
]
;@@ void ( GLfixed x, GLfixed y, GLfixed z );
glScalex!: alias function! [
	x           [ GLfixed! ]
	y           [ GLfixed! ]
	z           [ GLfixed! ]
]
;@@ void ( GLenum target, GLenum pname, GLfixed param );
glTexEnvx!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfixed! ]
]
;@@ void ( GLenum target, GLenum pname, const GLfixed* params );
glTexEnvxv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfixed param );
glTexParameterx!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfixed! ]
]
;@@ void ( GLfixed x, GLfixed y, GLfixed z );
glTranslatex!: alias function! [
	x           [ GLfixed! ]
	y           [ GLfixed! ]
	z           [ GLfixed! ]
]


;-------------------------------------------
;-- GL_REGAL_ES1_1_compatibility
;-------------------------------------------

#define  GL_REGAL_ES1_1_compatibility                 1
;@@ void ( GLenum plane, const GLfloat* equation );
glClipPlanef!: alias function! [
	plane       [ GLenum! ]
	equation    [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum plane, const GLfixed* equation );
glClipPlanex!: alias function! [
	plane       [ GLenum! ]
	equation    [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum pname, GLfloat eqn[4] );
glGetClipPlanef!: alias function! [
	pname       [ GLenum! ]
	eqn         [ pointer! [GLfloat!] ] ;@@[4]
]
;@@ void ( GLenum pname, GLfixed eqn[4] );
glGetClipPlanex!: alias function! [
	pname       [ GLenum! ]
	eqn         [ pointer! [GLfixed!] ] ;@@[4]
]
;@@ void ( GLenum pname, GLfixed* params );
glGetFixedv!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum light, GLenum pname, GLfixed* params );
glGetLightxv!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum face, GLenum pname, GLfixed* params );
glGetMaterialxv!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum env, GLenum pname, GLfixed* params );
glGetTexEnvxv!: alias function! [
	env         [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfixed* params );
glGetTexParameterxv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum pname, GLfixed param );
glPointParameterx!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfixed! ]
]
;@@ void ( GLenum pname, const GLfixed* params );
glPointParameterxv!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]
;@@ void ( GLenum type, GLsizei stride, const void *pointer );
glPointSizePointerOES!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLfixed* params );
glTexParameterxv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfixed!] ]
]


;-------------------------------------------
;-- GL_REGAL_enable
;-------------------------------------------

#define  GL_REGAL_enable                              1
#define  GL_ERROR_REGAL                               9322h
#define  GL_DEBUG_REGAL                               9323h
#define  GL_LOG_REGAL                                 9324h
#define  GL_EMULATION_REGAL                           9325h
#define  GL_DRIVER_REGAL                              9326h
#define  GL_MISSING_REGAL                             9360h
#define  GL_TRACE_REGAL                               9361h
#define  GL_CACHE_REGAL                               9362h
#define  GL_CODE_REGAL                                9363h
#define  GL_STATISTICS_REGAL                          9364h


;-------------------------------------------
;-- GL_REGAL_error_string
;-------------------------------------------

#define  GL_REGAL_error_string                        1
;@@ const GLchar* ( GLenum error );
glErrorStringREGAL!: alias function! [
	error       [ GLenum! ]
	return: [ GLstring! ]

]


;-------------------------------------------
;-- GL_REGAL_extension_query
;-------------------------------------------

#define  GL_REGAL_extension_query                     1
;@@ GLboolean ( const GLchar* ext );
glGetExtensionREGAL!: alias function! [
	ext         [ GLstring! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( const GLchar* ext );
glIsSupportedREGAL!: alias function! [
	ext         [ GLstring! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_REGAL_log
;-------------------------------------------

#define  GL_REGAL_log                                 1
#define  GL_LOG_ERROR_REGAL                           9319h
#define  GL_LOG_WARNING_REGAL                         931Ah
#define  GL_LOG_INFO_REGAL                            931Bh
#define  GL_LOG_APP_REGAL                             931Ch
#define  GL_LOG_DRIVER_REGAL                          931Dh
#define  GL_LOG_INTERNAL_REGAL                        931Eh
#define  GL_LOG_DEBUG_REGAL                           931Fh
#define  GL_LOG_STATUS_REGAL                          9320h
#define  GL_LOG_HTTP_REGAL                            9321h
;@@ void ( GLLOGPROCREGAL callback );
glLogMessageCallbackREGAL!: alias function! [
	callback    [ GLLOGPROCREGAL! ]
]


;-------------------------------------------
;-- GL_REGAL_proc_address
;-------------------------------------------

#define  GL_REGAL_proc_address                        1
;@@ void * ( const GLchar *name );
glGetProcAddressREGAL!: alias function! [
	name        [ GLstring! ]
	return: [ pointer! [byte!] ]

]
