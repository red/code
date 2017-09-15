Red/System [
	Title:   "Red/System OpenGL IBM extension binding"
	Author:  "Oldes"
	File: 	 %gl-IBM.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_IBM_cull_vertex
;-------------------------------------------

#define  GL_IBM_cull_vertex                           1
#define  GL_CULL_VERTEX_IBM                           103050


;-------------------------------------------
;-- GL_IBM_multimode_draw_arrays
;-------------------------------------------

#define  GL_IBM_multimode_draw_arrays                 1
;@@ void ( const GLenum* mode, const GLint *first, const GLsizei *count, GLsizei primcount, GLint modestride );
glMultiModeDrawArraysIBM!: alias function! [
	mode        [ pointer! [GLenum!] ]
	first       [ pointer! [GLint!] ]
	count       [ pointer! [GLsizei!] ]
	primcount   [ GLsizei! ]
	modestride  [ GLint! ]
]
;@@ void ( const GLenum* mode, const GLsizei *count, GLenum type, const void *const *indices, GLsizei primcount, GLint modestride );
glMultiModeDrawElementsIBM!: alias function! [
	mode        [ pointer! [GLenum!] ]
	count       [ pointer! [GLsizei!] ]
	type        [ GLenum! ]
	indices     [ binary-ptr! ]
	primcount   [ GLsizei! ]
	modestride  [ GLint! ]
]


;-------------------------------------------
;-- GL_IBM_rasterpos_clip
;-------------------------------------------

#define  GL_IBM_rasterpos_clip                        1
#define  GL_RASTER_POSITION_UNCLIPPED_IBM             103010


;-------------------------------------------
;-- GL_IBM_static_data
;-------------------------------------------

#define  GL_IBM_static_data                           1
#define  GL_ALL_STATIC_DATA_IBM                       103060
#define  GL_STATIC_VERTEX_ARRAY_IBM                   103061


;-------------------------------------------
;-- GL_IBM_texture_mirrored_repeat
;-------------------------------------------

#define  GL_IBM_texture_mirrored_repeat               1
#define  GL_MIRRORED_REPEAT_IBM                       8370h


;-------------------------------------------
;-- GL_IBM_vertex_array_lists
;-------------------------------------------

#define  GL_IBM_vertex_array_lists                    1
#define  GL_VERTEX_ARRAY_LIST_IBM                     103070
#define  GL_NORMAL_ARRAY_LIST_IBM                     103071
#define  GL_COLOR_ARRAY_LIST_IBM                      103072
#define  GL_INDEX_ARRAY_LIST_IBM                      103073
#define  GL_TEXTURE_COORD_ARRAY_LIST_IBM              103074
#define  GL_EDGE_FLAG_ARRAY_LIST_IBM                  103075
#define  GL_FOG_COORDINATE_ARRAY_LIST_IBM             103076
#define  GL_SECONDARY_COLOR_ARRAY_LIST_IBM            103077
#define  GL_VERTEX_ARRAY_LIST_STRIDE_IBM              103080
#define  GL_NORMAL_ARRAY_LIST_STRIDE_IBM              103081
#define  GL_COLOR_ARRAY_LIST_STRIDE_IBM               103082
#define  GL_INDEX_ARRAY_LIST_STRIDE_IBM               103083
#define  GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM       103084
#define  GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM           103085
#define  GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM      103086
#define  GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM     103087
;@@ void ( GLint size, GLenum type, GLint stride, const void** pointer, GLint ptrstride );
glColorPointerListIBM!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLint! ]
	pointer     [ binary-ptr! ]
	ptrstride   [ GLint! ]
]
;@@ void ( GLint stride, const GLboolean ** pointer, GLint ptrstride );
glEdgeFlagPointerListIBM!: alias function! [
	stride      [ GLint! ]
	pointer     [ GLboolean-ptr! ]
	ptrstride   [ GLint! ]
]
;@@ void ( GLenum type, GLint stride, const void** pointer, GLint ptrstride );
glFogCoordPointerListIBM!: alias function! [
	type        [ GLenum! ]
	stride      [ GLint! ]
	pointer     [ binary-ptr! ]
	ptrstride   [ GLint! ]
]
;@@ void ( GLenum type, GLint stride, const void** pointer, GLint ptrstride );
glIndexPointerListIBM!: alias function! [
	type        [ GLenum! ]
	stride      [ GLint! ]
	pointer     [ binary-ptr! ]
	ptrstride   [ GLint! ]
]
;@@ void ( GLenum type, GLint stride, const void** pointer, GLint ptrstride );
glNormalPointerListIBM!: alias function! [
	type        [ GLenum! ]
	stride      [ GLint! ]
	pointer     [ binary-ptr! ]
	ptrstride   [ GLint! ]
]
;@@ void ( GLint size, GLenum type, GLint stride, const void** pointer, GLint ptrstride );
glSecondaryColorPointerListIBM!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLint! ]
	pointer     [ binary-ptr! ]
	ptrstride   [ GLint! ]
]
;@@ void ( GLint size, GLenum type, GLint stride, const void** pointer, GLint ptrstride );
glTexCoordPointerListIBM!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLint! ]
	pointer     [ binary-ptr! ]
	ptrstride   [ GLint! ]
]
;@@ void ( GLint size, GLenum type, GLint stride, const void** pointer, GLint ptrstride );
glVertexPointerListIBM!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLint! ]
	pointer     [ binary-ptr! ]
	ptrstride   [ GLint! ]
]
