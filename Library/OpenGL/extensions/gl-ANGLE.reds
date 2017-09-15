Red/System [
	Title:   "Red/System OpenGL ANGLE extension binding"
	Author:  "Oldes"
	File: 	 %gl-ANGLE.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_ANGLE_depth_texture
;-------------------------------------------

#define  GL_ANGLE_depth_texture                       1


;-------------------------------------------
;-- GL_ANGLE_framebuffer_blit
;-------------------------------------------

#define  GL_ANGLE_framebuffer_blit                    1
#define  GL_DRAW_FRAMEBUFFER_BINDING_ANGLE            8CA6h
#define  GL_READ_FRAMEBUFFER_ANGLE                    8CA8h
#define  GL_DRAW_FRAMEBUFFER_ANGLE                    8CA9h
#define  GL_READ_FRAMEBUFFER_BINDING_ANGLE            8CAAh
;@@ void ( GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter );
glBlitFramebufferANGLE!: alias function! [
	srcX0       [ GLint! ]
	srcY0       [ GLint! ]
	srcX1       [ GLint! ]
	srcY1       [ GLint! ]
	dstX0       [ GLint! ]
	dstY0       [ GLint! ]
	dstX1       [ GLint! ]
	dstY1       [ GLint! ]
	mask        [ GLbitfield! ]
	filter      [ GLenum! ]
]


;-------------------------------------------
;-- GL_ANGLE_framebuffer_multisample
;-------------------------------------------

#define  GL_ANGLE_framebuffer_multisample             1
#define  GL_RENDERBUFFER_SAMPLES_ANGLE                8CABh
#define  GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_ANGLE  8D56h
#define  GL_MAX_SAMPLES_ANGLE                         8D57h
;@@ void ( GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height );
glRenderbufferStorageMultisampleANGLE!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_ANGLE_instanced_arrays
;-------------------------------------------

#define  GL_ANGLE_instanced_arrays                    1
#define  GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ANGLE         88FEh
;@@ void ( GLenum mode, GLint first, GLsizei count, GLsizei primcount );
glDrawArraysInstancedANGLE!: alias function! [
	mode        [ GLenum! ]
	first       [ GLint! ]
	count       [ GLsizei! ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount );
glDrawElementsInstancedANGLE!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLuint index, GLuint divisor );
glVertexAttribDivisorANGLE!: alias function! [
	index       [ GLuint! ]
	divisor     [ GLuint! ]
]


;-------------------------------------------
;-- GL_ANGLE_pack_reverse_row_order
;-------------------------------------------

#define  GL_ANGLE_pack_reverse_row_order              1
#define  GL_PACK_REVERSE_ROW_ORDER_ANGLE              93A4h


;-------------------------------------------
;-- GL_ANGLE_program_binary
;-------------------------------------------

#define  GL_ANGLE_program_binary                      1
#define  GL_PROGRAM_BINARY_ANGLE                      93A6h


;-------------------------------------------
;-- GL_ANGLE_texture_compression_dxt1
;-------------------------------------------

#define  GL_ANGLE_texture_compression_dxt1            1
#define  GL_COMPRESSED_RGB_S3TC_DXT1_ANGLE            83F0h
#define  GL_COMPRESSED_RGBA_S3TC_DXT1_ANGLE           83F1h
#define  GL_COMPRESSED_RGBA_S3TC_DXT3_ANGLE           83F2h
#define  GL_COMPRESSED_RGBA_S3TC_DXT5_ANGLE           83F3h


;-------------------------------------------
;-- GL_ANGLE_texture_compression_dxt3
;-------------------------------------------

#define  GL_ANGLE_texture_compression_dxt3            1
;#define  GL_COMPRESSED_RGB_S3TC_DXT1_ANGLE            83F0h
;#define  GL_COMPRESSED_RGBA_S3TC_DXT1_ANGLE           83F1h
;#define  GL_COMPRESSED_RGBA_S3TC_DXT3_ANGLE           83F2h
;#define  GL_COMPRESSED_RGBA_S3TC_DXT5_ANGLE           83F3h


;-------------------------------------------
;-- GL_ANGLE_texture_compression_dxt5
;-------------------------------------------

#define  GL_ANGLE_texture_compression_dxt5            1
;#define  GL_COMPRESSED_RGB_S3TC_DXT1_ANGLE            83F0h
;#define  GL_COMPRESSED_RGBA_S3TC_DXT1_ANGLE           83F1h
;#define  GL_COMPRESSED_RGBA_S3TC_DXT3_ANGLE           83F2h
;#define  GL_COMPRESSED_RGBA_S3TC_DXT5_ANGLE           83F3h


;-------------------------------------------
;-- GL_ANGLE_texture_usage
;-------------------------------------------

#define  GL_ANGLE_texture_usage                       1
#define  GL_TEXTURE_USAGE_ANGLE                       93A2h
#define  GL_FRAMEBUFFER_ATTACHMENT_ANGLE              93A3h


;-------------------------------------------
;-- GL_ANGLE_timer_query
;-------------------------------------------

#define  GL_ANGLE_timer_query                         1
#define  GL_QUERY_COUNTER_BITS_ANGLE                  8864h
#define  GL_CURRENT_QUERY_ANGLE                       8865h
#define  GL_QUERY_RESULT_ANGLE                        8866h
#define  GL_QUERY_RESULT_AVAILABLE_ANGLE              8867h
#define  GL_TIME_ELAPSED_ANGLE                        88BFh
#define  GL_TIMESTAMP_ANGLE                           8E28h
;@@ void ( GLenum target, GLuint id );
glBeginQueryANGLE!: alias function! [
	target      [ GLenum! ]
	id          [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* ids );
glDeleteQueriesANGLE!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target );
glEndQueryANGLE!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLsizei n, GLuint* ids );
glGenQueriesANGLE!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLuint id, GLenum pname, GLint64* params );
glGetQueryObjecti64vANGLE!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLint64-ptr! ]
]
;@@ void ( GLuint id, GLenum pname, GLint* params );
glGetQueryObjectivANGLE!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint id, GLenum pname, GLuint64* params );
glGetQueryObjectui64vANGLE!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLuint64-ptr! ]
]
;@@ void ( GLuint id, GLenum pname, GLuint* params );
glGetQueryObjectuivANGLE!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetQueryivANGLE!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint id );
glIsQueryANGLE!: alias function! [
	id          [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint id, GLenum target );
glQueryCounterANGLE!: alias function! [
	id          [ GLuint! ]
	target      [ GLenum! ]
]


;-------------------------------------------
;-- GL_ANGLE_translated_shader_source
;-------------------------------------------

#define  GL_ANGLE_translated_shader_source            1
#define  GL_TRANSLATED_SHADER_SOURCE_LENGTH_ANGLE     93A0h
;@@ void ( GLuint shader, GLsizei bufsize, GLsizei* length, GLchar* source );
glGetTranslatedShaderSourceANGLE!: alias function! [
	shader      [ GLuint! ]
	bufsize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	source      [ GLstring! ]
]
