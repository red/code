Red/System [
	Title:   "Red/System OpenGL SGIS extension binding"
	Author:  "Oldes"
	File: 	 %gl-SGIS.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_SGIS_clip_band_hint
;-------------------------------------------

#define  GL_SGIS_clip_band_hint                       1


;-------------------------------------------
;-- GL_SGIS_color_range
;-------------------------------------------

#define  GL_SGIS_color_range                          1
#define  GL_EXTENDED_RANGE_SGIS                       85A5h
#define  GL_MIN_RED_SGIS                              85A6h
#define  GL_MAX_RED_SGIS                              85A7h
#define  GL_MIN_GREEN_SGIS                            85A8h
#define  GL_MAX_GREEN_SGIS                            85A9h
#define  GL_MIN_BLUE_SGIS                             85AAh
#define  GL_MAX_BLUE_SGIS                             85ABh
#define  GL_MIN_ALPHA_SGIS                            85ACh
#define  GL_MAX_ALPHA_SGIS                            85ADh


;-------------------------------------------
;-- GL_SGIS_detail_texture
;-------------------------------------------

#define  GL_SGIS_detail_texture                       1
;@@ void ( GLenum target, GLsizei n, const GLfloat* points );
glDetailTexFuncSGIS!: alias function! [
	target      [ GLenum! ]
	n           [ GLsizei! ]
	points      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLfloat* points );
glGetDetailTexFuncSGIS!: alias function! [
	target      [ GLenum! ]
	points      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_SGIS_fog_function
;-------------------------------------------

#define  GL_SGIS_fog_function                         1
;@@ void ( GLsizei n, const GLfloat* points );
glFogFuncSGIS!: alias function! [
	n           [ GLsizei! ]
	points      [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat* points );
glGetFogFuncSGIS!: alias function! [
	points      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_SGIS_generate_mipmap
;-------------------------------------------

#define  GL_SGIS_generate_mipmap                      1
#define  GL_GENERATE_MIPMAP_SGIS                      8191h
#define  GL_GENERATE_MIPMAP_HINT_SGIS                 8192h


;-------------------------------------------
;-- GL_SGIS_line_texgen
;-------------------------------------------

#define  GL_SGIS_line_texgen                          1


;-------------------------------------------
;-- GL_SGIS_multisample
;-------------------------------------------

#define  GL_SGIS_multisample                          1
#define  GL_MULTISAMPLE_SGIS                          809Dh
#define  GL_SAMPLE_ALPHA_TO_MASK_SGIS                 809Eh
#define  GL_SAMPLE_ALPHA_TO_ONE_SGIS                  809Fh
#define  GL_SAMPLE_MASK_SGIS                          80A0h
#define  GL_1PASS_SGIS                                80A1h
#define  GL_2PASS_0_SGIS                              80A2h
#define  GL_2PASS_1_SGIS                              80A3h
#define  GL_4PASS_0_SGIS                              80A4h
#define  GL_4PASS_1_SGIS                              80A5h
#define  GL_4PASS_2_SGIS                              80A6h
#define  GL_4PASS_3_SGIS                              80A7h
#define  GL_SAMPLE_BUFFERS_SGIS                       80A8h
#define  GL_SAMPLES_SGIS                              80A9h
#define  GL_SAMPLE_MASK_VALUE_SGIS                    80AAh
#define  GL_SAMPLE_MASK_INVERT_SGIS                   80ABh
#define  GL_SAMPLE_PATTERN_SGIS                       80ACh
;@@ void ( GLclampf value, GLboolean invert );
glSampleMaskSGIS!: alias function! [
	value       [ GLclampf! ]
	invert      [ GLboolean! ]
]
;@@ void ( GLenum pattern );
glSamplePatternSGIS!: alias function! [
	pattern     [ GLenum! ]
]


;-------------------------------------------
;-- GL_SGIS_multitexture
;-------------------------------------------

#define  GL_SGIS_multitexture                         1
#define  GL_SELECTED_TEXTURE_SGIS                     83C0h
#define  GL_SELECTED_TEXTURE_COORD_SET_SGIS           83C1h
#define  GL_SELECTED_TEXTURE_TRANSFORM_SGIS           83C2h
#define  GL_MAX_TEXTURES_SGIS                         83C3h
#define  GL_MAX_TEXTURE_COORD_SETS_SGIS               83C4h
#define  GL_TEXTURE_COORD_SET_INTERLEAVE_FACTOR_SGIS  83C5h
#define  GL_TEXTURE_ENV_COORD_SET_SGIS                83C6h
#define  GL_TEXTURE0_SGIS                             83C7h
#define  GL_TEXTURE1_SGIS                             83C8h
#define  GL_TEXTURE2_SGIS                             83C9h
#define  GL_TEXTURE3_SGIS                             83CAh
;@@ void ( GLint factor );
glInterleavedTextureCoordSetsSGIS!: alias function! [
	factor      [ GLint! ]
]
;@@ void ( GLenum target );
glSelectTextureCoordSetSGIS!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLenum target );
glSelectTextureSGIS!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLenum target );
glSelectTextureTransformSGIS!: alias function! [
	target      [ GLenum! ]
]


;-------------------------------------------
;-- GL_SGIS_pixel_texture
;-------------------------------------------

#define  GL_SGIS_pixel_texture                        1


;-------------------------------------------
;-- GL_SGIS_point_line_texgen
;-------------------------------------------

#define  GL_SGIS_point_line_texgen                    1
#define  GL_EYE_DISTANCE_TO_POINT_SGIS                81F0h
#define  GL_OBJECT_DISTANCE_TO_POINT_SGIS             81F1h
#define  GL_EYE_DISTANCE_TO_LINE_SGIS                 81F2h
#define  GL_OBJECT_DISTANCE_TO_LINE_SGIS              81F3h
#define  GL_EYE_POINT_SGIS                            81F4h
#define  GL_OBJECT_POINT_SGIS                         81F5h
#define  GL_EYE_LINE_SGIS                             81F6h
#define  GL_OBJECT_LINE_SGIS                          81F7h


;-------------------------------------------
;-- GL_SGIS_shared_multisample
;-------------------------------------------

#define  GL_SGIS_shared_multisample                   1
;@@ void ( GLint x, GLint y );
glMultisampleSubRectPosSGIS!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
]


;-------------------------------------------
;-- GL_SGIS_sharpen_texture
;-------------------------------------------

#define  GL_SGIS_sharpen_texture                      1
;@@ void ( GLenum target, GLfloat* points );
glGetSharpenTexFuncSGIS!: alias function! [
	target      [ GLenum! ]
	points      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLsizei n, const GLfloat* points );
glSharpenTexFuncSGIS!: alias function! [
	target      [ GLenum! ]
	n           [ GLsizei! ]
	points      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_SGIS_texture4D
;-------------------------------------------

#define  GL_SGIS_texture4D                            1
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLsizei extent, GLint border, GLenum format, GLenum type, const void *pixels );
glTexImage4DSGIS!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	extent      [ GLsizei! ]
	border      [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint woffset, GLsizei width, GLsizei height, GLsizei depth, GLsizei extent, GLenum format, GLenum type, const void *pixels );
glTexSubImage4DSGIS!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	woffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	extent      [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_SGIS_texture_border_clamp
;-------------------------------------------

#define  GL_SGIS_texture_border_clamp                 1
#define  GL_CLAMP_TO_BORDER_SGIS                      812Dh


;-------------------------------------------
;-- GL_SGIS_texture_edge_clamp
;-------------------------------------------

#define  GL_SGIS_texture_edge_clamp                   1
#define  GL_CLAMP_TO_EDGE_SGIS                        812Fh


;-------------------------------------------
;-- GL_SGIS_texture_filter4
;-------------------------------------------

#define  GL_SGIS_texture_filter4                      1
;@@ void ( GLenum target, GLenum filter, GLfloat* weights );
glGetTexFilterFuncSGIS!: alias function! [
	target      [ GLenum! ]
	filter      [ GLenum! ]
	weights     [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum filter, GLsizei n, const GLfloat* weights );
glTexFilterFuncSGIS!: alias function! [
	target      [ GLenum! ]
	filter      [ GLenum! ]
	n           [ GLsizei! ]
	weights     [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_SGIS_texture_lod
;-------------------------------------------

#define  GL_SGIS_texture_lod                          1
#define  GL_TEXTURE_MIN_LOD_SGIS                      813Ah
#define  GL_TEXTURE_MAX_LOD_SGIS                      813Bh
#define  GL_TEXTURE_BASE_LEVEL_SGIS                   813Ch
#define  GL_TEXTURE_MAX_LEVEL_SGIS                    813Dh


;-------------------------------------------
;-- GL_SGIS_texture_select
;-------------------------------------------

#define  GL_SGIS_texture_select                       1
