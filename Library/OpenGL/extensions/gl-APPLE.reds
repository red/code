Red/System [
	Title:   "Red/System OpenGL APPLE extension binding"
	Author:  "Oldes"
	File: 	 %gl-APPLE.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_APPLE_aux_depth_stencil
;-------------------------------------------

#define  GL_APPLE_aux_depth_stencil                   1
#define  GL_AUX_DEPTH_STENCIL_APPLE                   8A14h


;-------------------------------------------
;-- GL_APPLE_client_storage
;-------------------------------------------

#define  GL_APPLE_client_storage                      1
#define  GL_UNPACK_CLIENT_STORAGE_APPLE               85B2h


;-------------------------------------------
;-- GL_APPLE_clip_distance
;-------------------------------------------

#define  GL_APPLE_clip_distance                       1
#define  GL_MAX_CLIP_DISTANCES_APPLE                  0D32h
#define  GL_CLIP_DISTANCE0_APPLE                      3000h
#define  GL_CLIP_DISTANCE1_APPLE                      3001h
#define  GL_CLIP_DISTANCE2_APPLE                      3002h
#define  GL_CLIP_DISTANCE3_APPLE                      3003h
#define  GL_CLIP_DISTANCE4_APPLE                      3004h
#define  GL_CLIP_DISTANCE5_APPLE                      3005h
#define  GL_CLIP_DISTANCE6_APPLE                      3006h
#define  GL_CLIP_DISTANCE7_APPLE                      3007h


;-------------------------------------------
;-- GL_APPLE_color_buffer_packed_float
;-------------------------------------------

#define  GL_APPLE_color_buffer_packed_float           1


;-------------------------------------------
;-- GL_APPLE_copy_texture_levels
;-------------------------------------------

#define  GL_APPLE_copy_texture_levels                 1
;@@ void ( GLuint destinationTexture, GLuint sourceTexture, GLint sourceBaseLevel, GLsizei sourceLevelCount );
glCopyTextureLevelsAPPLE!: alias function! [
	destinationTexture [ GLuint! ]
	sourceTexture [ GLuint! ]
	sourceBaseLevel [ GLint! ]
	sourceLevelCount [ GLsizei! ]
]


;-------------------------------------------
;-- GL_APPLE_element_array
;-------------------------------------------

#define  GL_APPLE_element_array                       1
#define  GL_ELEMENT_ARRAY_APPLE                       8A0Ch
#define  GL_ELEMENT_ARRAY_TYPE_APPLE                  8A0Dh
#define  GL_ELEMENT_ARRAY_POINTER_APPLE               8A0Eh
;@@ void ( GLenum mode, GLint first, GLsizei count );
glDrawElementArrayAPPLE!: alias function! [
	mode        [ GLenum! ]
	first       [ GLint! ]
	count       [ GLsizei! ]
]
;@@ void ( GLenum mode, GLuint start, GLuint end, GLint first, GLsizei count );
glDrawRangeElementArrayAPPLE!: alias function! [
	mode        [ GLenum! ]
	start       [ GLuint! ]
	end         [ GLuint! ]
	first       [ GLint! ]
	count       [ GLsizei! ]
]
;@@ void ( GLenum type, const void *pointer );
glElementPointerAPPLE!: alias function! [
	type        [ GLenum! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLenum mode, const GLint* first, const GLsizei *count, GLsizei primcount );
glMultiDrawElementArrayAPPLE!: alias function! [
	mode        [ GLenum! ]
	first       [ pointer! [GLint!] ]
	count       [ pointer! [GLsizei!] ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLenum mode, GLuint start, GLuint end, const GLint* first, const GLsizei *count, GLsizei primcount );
glMultiDrawRangeElementArrayAPPLE!: alias function! [
	mode        [ GLenum! ]
	start       [ GLuint! ]
	end         [ GLuint! ]
	first       [ pointer! [GLint!] ]
	count       [ pointer! [GLsizei!] ]
	primcount   [ GLsizei! ]
]


;-------------------------------------------
;-- GL_APPLE_fence
;-------------------------------------------

#define  GL_APPLE_fence                               1
#define  GL_DRAW_PIXELS_APPLE                         8A0Ah
#define  GL_FENCE_APPLE                               8A0Bh
;@@ void ( GLsizei n, const GLuint* fences );
glDeleteFencesAPPLE!: alias function! [
	n           [ GLsizei! ]
	fences      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint fence );
glFinishFenceAPPLE!: alias function! [
	fence       [ GLuint! ]
]
;@@ void ( GLenum object, GLint name );
glFinishObjectAPPLE!: alias function! [
	object      [ GLenum! ]
	name        [ GLint! ]
]
;@@ void ( GLsizei n, GLuint* fences );
glGenFencesAPPLE!: alias function! [
	n           [ GLsizei! ]
	fences      [ pointer! [GLuint!] ]
]
;@@ GLboolean ( GLuint fence );
glIsFenceAPPLE!: alias function! [
	fence       [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint fence );
glSetFenceAPPLE!: alias function! [
	fence       [ GLuint! ]
]
;@@ GLboolean ( GLuint fence );
glTestFenceAPPLE!: alias function! [
	fence       [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLenum object, GLuint name );
glTestObjectAPPLE!: alias function! [
	object      [ GLenum! ]
	name        [ GLuint! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_APPLE_float_pixels
;-------------------------------------------

#define  GL_APPLE_float_pixels                        1
#define  GL_HALF_APPLE                                140Bh
#define  GL_RGBA_FLOAT32_APPLE                        8814h
#define  GL_RGB_FLOAT32_APPLE                         8815h
#define  GL_ALPHA_FLOAT32_APPLE                       8816h
#define  GL_INTENSITY_FLOAT32_APPLE                   8817h
#define  GL_LUMINANCE_FLOAT32_APPLE                   8818h
#define  GL_LUMINANCE_ALPHA_FLOAT32_APPLE             8819h
#define  GL_RGBA_FLOAT16_APPLE                        881Ah
#define  GL_RGB_FLOAT16_APPLE                         881Bh
#define  GL_ALPHA_FLOAT16_APPLE                       881Ch
#define  GL_INTENSITY_FLOAT16_APPLE                   881Dh
#define  GL_LUMINANCE_FLOAT16_APPLE                   881Eh
#define  GL_LUMINANCE_ALPHA_FLOAT16_APPLE             881Fh
#define  GL_COLOR_FLOAT_APPLE                         8A0Fh


;-------------------------------------------
;-- GL_APPLE_flush_buffer_range
;-------------------------------------------

#define  GL_APPLE_flush_buffer_range                  1
#define  GL_BUFFER_SERIALIZED_MODIFY_APPLE            8A12h
#define  GL_BUFFER_FLUSHING_UNMAP_APPLE               8A13h
;@@ void ( GLenum target, GLenum pname, GLint param );
glBufferParameteriAPPLE!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum target, GLintptr offset, GLsizeiptr size );
glFlushMappedBufferRangeAPPLE!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
]


;-------------------------------------------
;-- GL_APPLE_framebuffer_multisample
;-------------------------------------------

#define  GL_APPLE_framebuffer_multisample             1
#define  GL_DRAW_FRAMEBUFFER_BINDING_APPLE            8CA6h
#define  GL_READ_FRAMEBUFFER_APPLE                    8CA8h
#define  GL_DRAW_FRAMEBUFFER_APPLE                    8CA9h
#define  GL_READ_FRAMEBUFFER_BINDING_APPLE            8CAAh
#define  GL_RENDERBUFFER_SAMPLES_APPLE                8CABh
#define  GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_APPLE  8D56h
#define  GL_MAX_SAMPLES_APPLE                         8D57h
;@@ void ( GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height );
glRenderbufferStorageMultisampleAPPLE!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( void );
glResolveMultisampleFramebufferAPPLE!: alias function! [
]


;-------------------------------------------
;-- GL_APPLE_object_purgeable
;-------------------------------------------

#define  GL_APPLE_object_purgeable                    1
#define  GL_BUFFER_OBJECT_APPLE                       85B3h
#define  GL_RELEASED_APPLE                            8A19h
#define  GL_VOLATILE_APPLE                            8A1Ah
#define  GL_RETAINED_APPLE                            8A1Bh
#define  GL_UNDEFINED_APPLE                           8A1Ch
#define  GL_PURGEABLE_APPLE                           8A1Dh
;@@ void ( GLenum objectType, GLuint name, GLenum pname, GLint* params );
glGetObjectParameterivAPPLE!: alias function! [
	objectType  [ GLenum! ]
	name        [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLenum ( GLenum objectType, GLuint name, GLenum option );
glObjectPurgeableAPPLE!: alias function! [
	objectType  [ GLenum! ]
	name        [ GLuint! ]
	option      [ GLenum! ]
	return: [ GLenum! ]

]
;@@ GLenum ( GLenum objectType, GLuint name, GLenum option );
glObjectUnpurgeableAPPLE!: alias function! [
	objectType  [ GLenum! ]
	name        [ GLuint! ]
	option      [ GLenum! ]
	return: [ GLenum! ]

]


;-------------------------------------------
;-- GL_APPLE_pixel_buffer
;-------------------------------------------

#define  GL_APPLE_pixel_buffer                        1
#define  GL_MIN_PBUFFER_VIEWPORT_DIMS_APPLE           8A10h


;-------------------------------------------
;-- GL_APPLE_rgb_422
;-------------------------------------------

#define  GL_APPLE_rgb_422                             1
#define  GL_UNSIGNED_SHORT_8_8_APPLE                  85BAh
#define  GL_UNSIGNED_SHORT_8_8_REV_APPLE              85BBh
#define  GL_RGB_422_APPLE                             8A1Fh
#define  GL_RGB_RAW_422_APPLE                         8A51h


;-------------------------------------------
;-- GL_APPLE_row_bytes
;-------------------------------------------

#define  GL_APPLE_row_bytes                           1
#define  GL_PACK_ROW_BYTES_APPLE                      8A15h
#define  GL_UNPACK_ROW_BYTES_APPLE                    8A16h


;-------------------------------------------
;-- GL_APPLE_specular_vector
;-------------------------------------------

#define  GL_APPLE_specular_vector                     1
#define  GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE         85B0h


;-------------------------------------------
;-- GL_APPLE_sync
;-------------------------------------------

#define  GL_APPLE_sync                                1
#define  GL_SYNC_FLUSH_COMMANDS_BIT_APPLE             00000001h
#define  GL_SYNC_OBJECT_APPLE                         8A53h
#define  GL_MAX_SERVER_WAIT_TIMEOUT_APPLE             9111h
#define  GL_OBJECT_TYPE_APPLE                         9112h
#define  GL_SYNC_CONDITION_APPLE                      9113h
#define  GL_SYNC_STATUS_APPLE                         9114h
#define  GL_SYNC_FLAGS_APPLE                          9115h
#define  GL_SYNC_FENCE_APPLE                          9116h
#define  GL_SYNC_GPU_COMMANDS_COMPLETE_APPLE          9117h
#define  GL_UNSIGNALED_APPLE                          9118h
#define  GL_SIGNALED_APPLE                            9119h
#define  GL_ALREADY_SIGNALED_APPLE                    911Ah
#define  GL_TIMEOUT_EXPIRED_APPLE                     911Bh
#define  GL_CONDITION_SATISFIED_APPLE                 911Ch
#define  GL_WAIT_FAILED_APPLE                         911Dh
#define  GL_TIMEOUT_IGNORED_APPLE                     FFFFFFFFFFFFFFFFhull
;@@ GLenum ( GLsync GLsync, GLbitfield flags, GLuint64 timeout );
glClientWaitSyncAPPLE!: alias function! [
	GLsync      [ GLsync! ]
	flags       [ GLbitfield! ]
	timeout     [ GLuint64! ]
	return: [ GLenum! ]

]
;@@ void ( GLsync GLsync );
glDeleteSyncAPPLE!: alias function! [
	GLsync      [ GLsync! ]
]
;@@ GLsync ( GLenum condition, GLbitfield flags );
glFenceSyncAPPLE!: alias function! [
	condition   [ GLenum! ]
	flags       [ GLbitfield! ]
	return: [ GLsync! ]

]
;@@ void ( GLenum pname, GLint64* params );
glGetInteger64vAPPLE!: alias function! [
	pname       [ GLenum! ]
	params      [ GLint64-ptr! ]
]
;@@ void ( GLsync GLsync, GLenum pname, GLsizei bufSize, GLsizei* length, GLint *values );
glGetSyncivAPPLE!: alias function! [
	GLsync      [ GLsync! ]
	pname       [ GLenum! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	values      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLsync GLsync );
glIsSyncAPPLE!: alias function! [
	GLsync      [ GLsync! ]
	return: [ GLboolean! ]

]
;@@ void ( GLsync GLsync, GLbitfield flags, GLuint64 timeout );
glWaitSyncAPPLE!: alias function! [
	GLsync      [ GLsync! ]
	flags       [ GLbitfield! ]
	timeout     [ GLuint64! ]
]


;-------------------------------------------
;-- GL_APPLE_texture_2D_limited_npot
;-------------------------------------------

#define  GL_APPLE_texture_2D_limited_npot             1


;-------------------------------------------
;-- GL_APPLE_texture_format_BGRA8888
;-------------------------------------------

#define  GL_APPLE_texture_format_BGRA8888             1
#define  GL_BGRA_EXT                                  80E1h
#define  GL_BGRA8_EXT                                 93A1h


;-------------------------------------------
;-- GL_APPLE_texture_max_level
;-------------------------------------------

#define  GL_APPLE_texture_max_level                   1
#define  GL_TEXTURE_MAX_LEVEL_APPLE                   813Dh


;-------------------------------------------
;-- GL_APPLE_texture_packed_float
;-------------------------------------------

#define  GL_APPLE_texture_packed_float                1
#define  GL_R11F_G11F_B10F_APPLE                      8C3Ah
#define  GL_UNSIGNED_INT_10F_11F_11F_REV_APPLE        8C3Bh
#define  GL_RGB9_E5_APPLE                             8C3Dh
#define  GL_UNSIGNED_INT_5_9_9_9_REV_APPLE            8C3Eh


;-------------------------------------------
;-- GL_APPLE_texture_range
;-------------------------------------------

#define  GL_APPLE_texture_range                       1
#define  GL_TEXTURE_RANGE_LENGTH_APPLE                85B7h
#define  GL_TEXTURE_RANGE_POINTER_APPLE               85B8h
#define  GL_TEXTURE_STORAGE_HINT_APPLE                85BCh
#define  GL_STORAGE_PRIVATE_APPLE                     85BDh
#define  GL_STORAGE_CACHED_APPLE                      85BEh
#define  GL_STORAGE_SHARED_APPLE                      85BFh
;@@ void ( GLenum target, GLenum pname, void **params );
glGetTexParameterPointervAPPLE!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ binary-ptr! ]
]
;@@ void ( GLenum target, GLsizei length, void *pointer );
glTextureRangeAPPLE!: alias function! [
	target      [ GLenum! ]
	length      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_APPLE_transform_hint
;-------------------------------------------

#define  GL_APPLE_transform_hint                      1
#define  GL_TRANSFORM_HINT_APPLE                      85B1h


;-------------------------------------------
;-- GL_APPLE_vertex_array_object
;-------------------------------------------

#define  GL_APPLE_vertex_array_object                 1
#define  GL_VERTEX_ARRAY_BINDING_APPLE                85B5h
;@@ void ( GLuint array );
glBindVertexArrayAPPLE!: alias function! [
	array       [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* arrays );
glDeleteVertexArraysAPPLE!: alias function! [
	n           [ GLsizei! ]
	arrays      [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, const GLuint* arrays );
glGenVertexArraysAPPLE!: alias function! [
	n           [ GLsizei! ]
	arrays      [ pointer! [GLuint!] ]
]
;@@ GLboolean ( GLuint array );
glIsVertexArrayAPPLE!: alias function! [
	array       [ GLuint! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_APPLE_vertex_array_range
;-------------------------------------------

#define  GL_APPLE_vertex_array_range                  1
#define  GL_VERTEX_ARRAY_RANGE_APPLE                  851Dh
#define  GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE           851Eh
#define  GL_VERTEX_ARRAY_STORAGE_HINT_APPLE           851Fh
#define  GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_APPLE      8520h
#define  GL_VERTEX_ARRAY_RANGE_POINTER_APPLE          8521h
#define  GL_STORAGE_CLIENT_APPLE                      85B4h
;#define  GL_STORAGE_CACHED_APPLE                      85BEh
;#define  GL_STORAGE_SHARED_APPLE                      85BFh
;@@ void ( GLsizei length, void *pointer );
glFlushVertexArrayRangeAPPLE!: alias function! [
	length      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLenum pname, GLint param );
glVertexArrayParameteriAPPLE!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLsizei length, void *pointer );
glVertexArrayRangeAPPLE!: alias function! [
	length      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_APPLE_vertex_program_evaluators
;-------------------------------------------

#define  GL_APPLE_vertex_program_evaluators           1
#define  GL_VERTEX_ATTRIB_MAP1_APPLE                  8A00h
#define  GL_VERTEX_ATTRIB_MAP2_APPLE                  8A01h
#define  GL_VERTEX_ATTRIB_MAP1_SIZE_APPLE             8A02h
#define  GL_VERTEX_ATTRIB_MAP1_COEFF_APPLE            8A03h
#define  GL_VERTEX_ATTRIB_MAP1_ORDER_APPLE            8A04h
#define  GL_VERTEX_ATTRIB_MAP1_DOMAIN_APPLE           8A05h
#define  GL_VERTEX_ATTRIB_MAP2_SIZE_APPLE             8A06h
#define  GL_VERTEX_ATTRIB_MAP2_COEFF_APPLE            8A07h
#define  GL_VERTEX_ATTRIB_MAP2_ORDER_APPLE            8A08h
#define  GL_VERTEX_ATTRIB_MAP2_DOMAIN_APPLE           8A09h
;@@ void ( GLuint index, GLenum pname );
glDisableVertexAttribAPPLE!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
]
;@@ void ( GLuint index, GLenum pname );
glEnableVertexAttribAPPLE!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
]
;@@ GLboolean ( GLuint index, GLenum pname );
glIsVertexAttribEnabledAPPLE!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint index, GLuint size, GLdouble u1, GLdouble u2, GLint stride, GLint order, const GLdouble* points );
glMapVertexAttrib1dAPPLE!: alias function! [
	index       [ GLuint! ]
	size        [ GLuint! ]
	u1          [ GLdouble! ]
	u2          [ GLdouble! ]
	stride      [ GLint! ]
	order       [ GLint! ]
	points      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLuint size, GLfloat u1, GLfloat u2, GLint stride, GLint order, const GLfloat* points );
glMapVertexAttrib1fAPPLE!: alias function! [
	index       [ GLuint! ]
	size        [ GLuint! ]
	u1          [ GLfloat! ]
	u2          [ GLfloat! ]
	stride      [ GLint! ]
	order       [ GLint! ]
	points      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLuint size, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, const GLdouble* points );
glMapVertexAttrib2dAPPLE!: alias function! [
	index       [ GLuint! ]
	size        [ GLuint! ]
	u1          [ GLdouble! ]
	u2          [ GLdouble! ]
	ustride     [ GLint! ]
	uorder      [ GLint! ]
	v1          [ GLdouble! ]
	v2          [ GLdouble! ]
	vstride     [ GLint! ]
	vorder      [ GLint! ]
	points      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLuint size, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, const GLfloat* points );
glMapVertexAttrib2fAPPLE!: alias function! [
	index       [ GLuint! ]
	size        [ GLuint! ]
	u1          [ GLfloat! ]
	u2          [ GLfloat! ]
	ustride     [ GLint! ]
	uorder      [ GLint! ]
	v1          [ GLfloat! ]
	v2          [ GLfloat! ]
	vstride     [ GLint! ]
	vorder      [ GLint! ]
	points      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_APPLE_ycbcr_422
;-------------------------------------------

#define  GL_APPLE_ycbcr_422                           1
#define  GL_YCBCR_422_APPLE                           85B9h
