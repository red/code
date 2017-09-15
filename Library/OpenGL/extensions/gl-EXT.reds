Red/System [
	Title:   "Red/System OpenGL EXT extension binding"
	Author:  "Oldes"
	File: 	 %gl-EXT.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_EXT_422_pixels
;-------------------------------------------

#define  GL_EXT_422_pixels                            1
#define  GL_422_EXT                                   80CCh
#define  GL_422_REV_EXT                               80CDh
#define  GL_422_AVERAGE_EXT                           80CEh
#define  GL_422_REV_AVERAGE_EXT                       80CFh


;-------------------------------------------
;-- GL_EXT_Cg_shader
;-------------------------------------------

#define  GL_EXT_Cg_shader                             1
#define  GL_CG_VERTEX_SHADER_EXT                      890Eh
#define  GL_CG_FRAGMENT_SHADER_EXT                    890Fh


;-------------------------------------------
;-- GL_EXT_EGL_image_array
;-------------------------------------------

#define  GL_EXT_EGL_image_array                       1


;-------------------------------------------
;-- GL_EXT_YUV_target
;-------------------------------------------

#define  GL_EXT_YUV_target                            1
#define  GL_SAMPLER_EXTERNAL_2D_Y2Y_EXT               8BE7h


;-------------------------------------------
;-- GL_EXT_abgr
;-------------------------------------------

#define  GL_EXT_abgr                                  1
#define  GL_ABGR_EXT                                  8000h


;-------------------------------------------
;-- GL_EXT_base_instance
;-------------------------------------------

#define  GL_EXT_base_instance                         1
;@@ void ( GLenum mode, GLint first, GLsizei count, GLsizei instancecount, GLuint baseinstance );
glDrawArraysInstancedBaseInstanceEXT!: alias function! [
	mode        [ GLenum! ]
	first       [ GLint! ]
	count       [ GLsizei! ]
	instancecount [ GLsizei! ]
	baseinstance [ GLuint! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount, GLuint baseinstance );
glDrawElementsInstancedBaseInstanceEXT!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	instancecount [ GLsizei! ]
	baseinstance [ GLuint! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount, GLint basevertex, GLuint baseinstance );
glDrawElementsInstancedBaseVertexBaseInstanceEXT!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	instancecount [ GLsizei! ]
	basevertex  [ GLint! ]
	baseinstance [ GLuint! ]
]


;-------------------------------------------
;-- GL_EXT_bgra
;-------------------------------------------

#define  GL_EXT_bgra                                  1
#define  GL_BGR_EXT                                   80E0h
;#define  GL_BGRA_EXT                                  80E1h


;-------------------------------------------
;-- GL_EXT_bindable_uniform
;-------------------------------------------

#define  GL_EXT_bindable_uniform                      1
#define  GL_MAX_VERTEX_BINDABLE_UNIFORMS_EXT          8DE2h
#define  GL_MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT        8DE3h
#define  GL_MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT        8DE4h
#define  GL_MAX_BINDABLE_UNIFORM_SIZE_EXT             8DEDh
#define  GL_UNIFORM_BUFFER_EXT                        8DEEh
#define  GL_UNIFORM_BUFFER_BINDING_EXT                8DEFh
;@@ GLint ( GLuint program, GLint location );
glGetUniformBufferSizeEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	return: [ GLint! ]

]
;@@ GLintptr ( GLuint program, GLint location );
glGetUniformOffsetEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	return: [ GLintptr! ]

]
;@@ void ( GLuint program, GLint location, GLuint buffer );
glUniformBufferEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	buffer      [ GLuint! ]
]


;-------------------------------------------
;-- GL_EXT_blend_color
;-------------------------------------------

#define  GL_EXT_blend_color                           1
#define  GL_CONSTANT_COLOR_EXT                        8001h
#define  GL_ONE_MINUS_CONSTANT_COLOR_EXT              8002h
#define  GL_CONSTANT_ALPHA_EXT                        8003h
#define  GL_ONE_MINUS_CONSTANT_ALPHA_EXT              8004h
#define  GL_BLEND_COLOR_EXT                           8005h
;@@ void ( GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha );
glBlendColorEXT!: alias function! [
	red         [ GLclampf! ]
	green       [ GLclampf! ]
	blue        [ GLclampf! ]
	alpha       [ GLclampf! ]
]


;-------------------------------------------
;-- GL_EXT_blend_equation_separate
;-------------------------------------------

#define  GL_EXT_blend_equation_separate               1
#define  GL_BLEND_EQUATION_RGB_EXT                    8009h
#define  GL_BLEND_EQUATION_ALPHA_EXT                  883Dh
;@@ void ( GLenum modeRGB, GLenum modeAlpha );
glBlendEquationSeparateEXT!: alias function! [
	modeRGB     [ GLenum! ]
	modeAlpha   [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_blend_func_extended
;-------------------------------------------

#define  GL_EXT_blend_func_extended                   1
#define  GL_SRC_ALPHA_SATURATE_EXT                    0308h
#define  GL_SRC1_ALPHA_EXT                            8589h
#define  GL_SRC1_COLOR_EXT                            88F9h
#define  GL_ONE_MINUS_SRC1_COLOR_EXT                  88FAh
#define  GL_ONE_MINUS_SRC1_ALPHA_EXT                  88FBh
#define  GL_MAX_DUAL_SOURCE_DRAW_BUFFERS_EXT          88FCh
#define  GL_LOCATION_INDEX_EXT                        930Fh
;@@ void ( GLuint program, GLuint colorNumber, GLuint index, const GLchar * name );
glBindFragDataLocationIndexedEXT!: alias function! [
	program     [ GLuint! ]
	colorNumber [ GLuint! ]
	index       [ GLuint! ]
	name        [ GLstring! ]
]
;@@ GLint ( GLuint program, const GLchar * name );
glGetFragDataIndexEXT!: alias function! [
	program     [ GLuint! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]
;@@ GLint ( GLuint program, GLenum programInterface, const GLchar* name );
glGetProgramResourceLocationIndexEXT!: alias function! [
	program     [ GLuint! ]
	programInterface [ GLenum! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]


;-------------------------------------------
;-- GL_EXT_blend_func_separate
;-------------------------------------------

#define  GL_EXT_blend_func_separate                   1
#define  GL_BLEND_DST_RGB_EXT                         80C8h
#define  GL_BLEND_SRC_RGB_EXT                         80C9h
#define  GL_BLEND_DST_ALPHA_EXT                       80CAh
#define  GL_BLEND_SRC_ALPHA_EXT                       80CBh
;@@ void ( GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha );
glBlendFuncSeparateEXT!: alias function! [
	sfactorRGB  [ GLenum! ]
	dfactorRGB  [ GLenum! ]
	sfactorAlpha [ GLenum! ]
	dfactorAlpha [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_blend_logic_op
;-------------------------------------------

#define  GL_EXT_blend_logic_op                        1


;-------------------------------------------
;-- GL_EXT_blend_minmax
;-------------------------------------------

#define  GL_EXT_blend_minmax                          1
#define  GL_FUNC_ADD_EXT                              8006h
#define  GL_MIN_EXT                                   8007h
#define  GL_MAX_EXT                                   8008h
#define  GL_BLEND_EQUATION_EXT                        8009h
;@@ void ( GLenum mode );
glBlendEquationEXT!: alias function! [
	mode        [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_blend_subtract
;-------------------------------------------

#define  GL_EXT_blend_subtract                        1
#define  GL_FUNC_SUBTRACT_EXT                         800Ah
#define  GL_FUNC_REVERSE_SUBTRACT_EXT                 800Bh


;-------------------------------------------
;-- GL_EXT_buffer_storage
;-------------------------------------------

#define  GL_EXT_buffer_storage                        1
;#define  GL_MAP_READ_BIT                              0001h
;#define  GL_MAP_WRITE_BIT                             0002h
#define  GL_MAP_PERSISTENT_BIT_EXT                    0040h
#define  GL_MAP_COHERENT_BIT_EXT                      0080h
#define  GL_DYNAMIC_STORAGE_BIT_EXT                   0100h
#define  GL_CLIENT_STORAGE_BIT_EXT                    0200h
#define  GL_CLIENT_MAPPED_BUFFER_BARRIER_BIT_EXT      00004000h
#define  GL_BUFFER_IMMUTABLE_STORAGE_EXT              821Fh
#define  GL_BUFFER_STORAGE_FLAGS_EXT                  8220h
;@@ void ( GLenum target, GLsizeiptr size, const void *data, GLbitfield flags );
glBufferStorageEXT!: alias function! [
	target      [ GLenum! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
	flags       [ GLbitfield! ]
]
;@@ void ( GLuint buffer, GLsizeiptr size, const void *data, GLbitfield flags );
glNamedBufferStorageEXT!: alias function! [
	buffer      [ GLuint! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
	flags       [ GLbitfield! ]
]


;-------------------------------------------
;-- GL_EXT_clear_texture
;-------------------------------------------

#define  GL_EXT_clear_texture                         1
;@@ void ( GLuint texture, GLint level, GLenum format, GLenum type, const void *data );
glClearTexImageEXT!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *data );
glClearTexSubImageEXT!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_clip_cull_distance
;-------------------------------------------

#define  GL_EXT_clip_cull_distance                    1
#define  GL_MAX_CLIP_DISTANCES_EXT                    0D32h
#define  GL_CLIP_DISTANCE0_EXT                        3000h
#define  GL_CLIP_DISTANCE1_EXT                        3001h
#define  GL_CLIP_DISTANCE2_EXT                        3002h
#define  GL_CLIP_DISTANCE3_EXT                        3003h
#define  GL_CLIP_DISTANCE4_EXT                        3004h
#define  GL_CLIP_DISTANCE5_EXT                        3005h
#define  GL_CLIP_DISTANCE6_EXT                        3006h
#define  GL_CLIP_DISTANCE7_EXT                        3007h
#define  GL_MAX_CULL_DISTANCES_EXT                    82F9h
#define  GL_MAX_COMBINED_CLIP_AND_CULL_DISTANCES_EXT  82FAh


;-------------------------------------------
;-- GL_EXT_clip_volume_hint
;-------------------------------------------

#define  GL_EXT_clip_volume_hint                      1
#define  GL_CLIP_VOLUME_CLIPPING_HINT_EXT             80F0h


;-------------------------------------------
;-- GL_EXT_cmyka
;-------------------------------------------

#define  GL_EXT_cmyka                                 1
#define  GL_CMYK_EXT                                  800Ch
#define  GL_CMYKA_EXT                                 800Dh
#define  GL_PACK_CMYK_HINT_EXT                        800Eh
#define  GL_UNPACK_CMYK_HINT_EXT                      800Fh


;-------------------------------------------
;-- GL_EXT_color_buffer_float
;-------------------------------------------

#define  GL_EXT_color_buffer_float                    1


;-------------------------------------------
;-- GL_EXT_color_buffer_half_float
;-------------------------------------------

#define  GL_EXT_color_buffer_half_float               1
#define  GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT  8211h
#define  GL_R16F_EXT                                  822Dh
#define  GL_RG16F_EXT                                 822Fh
#define  GL_RGBA16F_EXT                               881Ah
#define  GL_RGB16F_EXT                                881Bh
#define  GL_UNSIGNED_NORMALIZED_EXT                   8C17h


;-------------------------------------------
;-- GL_EXT_color_subtable
;-------------------------------------------

#define  GL_EXT_color_subtable                        1
;@@ void ( GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, const void *data );
glColorSubTableEXT!: alias function! [
	target      [ GLenum! ]
	start       [ GLsizei! ]
	count       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLsizei start, GLint x, GLint y, GLsizei width );
glCopyColorSubTableEXT!: alias function! [
	target      [ GLenum! ]
	start       [ GLsizei! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
]


;-------------------------------------------
;-- GL_EXT_compiled_vertex_array
;-------------------------------------------

#define  GL_EXT_compiled_vertex_array                 1
#define  GL_ARRAY_ELEMENT_LOCK_FIRST_EXT              81A8h
#define  GL_ARRAY_ELEMENT_LOCK_COUNT_EXT              81A9h
;@@ void ( GLint first, GLsizei count );
glLockArraysEXT!: alias function! [
	first       [ GLint! ]
	count       [ GLsizei! ]
]
;@@ void ( void );
glUnlockArraysEXT!: alias function! [
]


;-------------------------------------------
;-- GL_EXT_compressed_ETC1_RGB8_sub_texture
;-------------------------------------------

#define  GL_EXT_compressed_ETC1_RGB8_sub_texture      1


;-------------------------------------------
;-- GL_EXT_conservative_depth
;-------------------------------------------

#define  GL_EXT_conservative_depth                    1


;-------------------------------------------
;-- GL_EXT_convolution
;-------------------------------------------

#define  GL_EXT_convolution                           1
#define  GL_CONVOLUTION_1D_EXT                        8010h
#define  GL_CONVOLUTION_2D_EXT                        8011h
#define  GL_SEPARABLE_2D_EXT                          8012h
#define  GL_CONVOLUTION_BORDER_MODE_EXT               8013h
#define  GL_CONVOLUTION_FILTER_SCALE_EXT              8014h
#define  GL_CONVOLUTION_FILTER_BIAS_EXT               8015h
#define  GL_REDUCE_EXT                                8016h
#define  GL_CONVOLUTION_FORMAT_EXT                    8017h
#define  GL_CONVOLUTION_WIDTH_EXT                     8018h
#define  GL_CONVOLUTION_HEIGHT_EXT                    8019h
#define  GL_MAX_CONVOLUTION_WIDTH_EXT                 801Ah
#define  GL_MAX_CONVOLUTION_HEIGHT_EXT                801Bh
#define  GL_POST_CONVOLUTION_RED_SCALE_EXT            801Ch
#define  GL_POST_CONVOLUTION_GREEN_SCALE_EXT          801Dh
#define  GL_POST_CONVOLUTION_BLUE_SCALE_EXT           801Eh
#define  GL_POST_CONVOLUTION_ALPHA_SCALE_EXT          801Fh
#define  GL_POST_CONVOLUTION_RED_BIAS_EXT             8020h
#define  GL_POST_CONVOLUTION_GREEN_BIAS_EXT           8021h
#define  GL_POST_CONVOLUTION_BLUE_BIAS_EXT            8022h
#define  GL_POST_CONVOLUTION_ALPHA_BIAS_EXT           8023h
;@@ void ( GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const void *image );
glConvolutionFilter1DEXT!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	image       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *image );
glConvolutionFilter2DEXT!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	image       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat param );
glConvolutionParameterfEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum target, GLenum pname, const GLfloat* params );
glConvolutionParameterfvEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint param );
glConvolutionParameteriEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum target, GLenum pname, const GLint* params );
glConvolutionParameterivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width );
glCopyConvolutionFilter1DEXT!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
]
;@@ void ( GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyConvolutionFilter2DEXT!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLenum target, GLenum format, GLenum type, void *image );
glGetConvolutionFilterEXT!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	image       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat* params );
glGetConvolutionParameterfvEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetConvolutionParameterivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum format, GLenum type, void *row, void *column, void *span );
glGetSeparableFilterEXT!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	row         [ pointer! [byte!] ]
	column      [ pointer! [byte!] ]
	span        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *row, const void *column );
glSeparableFilter2DEXT!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	row         [ pointer! [byte!] ]
	column      [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_coordinate_frame
;-------------------------------------------

#define  GL_EXT_coordinate_frame                      1
#define  GL_TANGENT_ARRAY_EXT                         8439h
#define  GL_BINORMAL_ARRAY_EXT                        843Ah
#define  GL_CURRENT_TANGENT_EXT                       843Bh
#define  GL_CURRENT_BINORMAL_EXT                      843Ch
#define  GL_TANGENT_ARRAY_TYPE_EXT                    843Eh
#define  GL_TANGENT_ARRAY_STRIDE_EXT                  843Fh
#define  GL_BINORMAL_ARRAY_TYPE_EXT                   8440h
#define  GL_BINORMAL_ARRAY_STRIDE_EXT                 8441h
#define  GL_TANGENT_ARRAY_POINTER_EXT                 8442h
#define  GL_BINORMAL_ARRAY_POINTER_EXT                8443h
#define  GL_MAP1_TANGENT_EXT                          8444h
#define  GL_MAP2_TANGENT_EXT                          8445h
#define  GL_MAP1_BINORMAL_EXT                         8446h
#define  GL_MAP2_BINORMAL_EXT                         8447h
;@@ void ( GLenum type, GLsizei stride, void *pointer );
glBinormalPointerEXT!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLenum type, GLsizei stride, void *pointer );
glTangentPointerEXT!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_copy_image
;-------------------------------------------

#define  GL_EXT_copy_image                            1
;@@ void ( GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srcY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei srcWidth, GLsizei srcHeight, GLsizei srcDepth );
glCopyImageSubDataEXT!: alias function! [
	srcName     [ GLuint! ]
	srcTarget   [ GLenum! ]
	srcLevel    [ GLint! ]
	srcX        [ GLint! ]
	srcY        [ GLint! ]
	srcZ        [ GLint! ]
	dstName     [ GLuint! ]
	dstTarget   [ GLenum! ]
	dstLevel    [ GLint! ]
	dstX        [ GLint! ]
	dstY        [ GLint! ]
	dstZ        [ GLint! ]
	srcWidth    [ GLsizei! ]
	srcHeight   [ GLsizei! ]
	srcDepth    [ GLsizei! ]
]


;-------------------------------------------
;-- GL_EXT_copy_texture
;-------------------------------------------

#define  GL_EXT_copy_texture                          1
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border );
glCopyTexImage1DEXT!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	border      [ GLint! ]
]
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border );
glCopyTexImage2DEXT!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	border      [ GLint! ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width );
glCopyTexSubImage1DEXT!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyTexSubImage2DEXT!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyTexSubImage3DEXT!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_EXT_cull_vertex
;-------------------------------------------

#define  GL_EXT_cull_vertex                           1
#define  GL_CULL_VERTEX_EXT                           81AAh
#define  GL_CULL_VERTEX_EYE_POSITION_EXT              81ABh
#define  GL_CULL_VERTEX_OBJECT_POSITION_EXT           81ACh
;@@ void ( GLenum pname, GLdouble* params );
glCullParameterdvEXT!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum pname, GLfloat* params );
glCullParameterfvEXT!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_EXT_debug_label
;-------------------------------------------

#define  GL_EXT_debug_label                           1
#define  GL_PROGRAM_PIPELINE_OBJECT_EXT               8A4Fh
#define  GL_PROGRAM_OBJECT_EXT                        8B40h
#define  GL_SHADER_OBJECT_EXT                         8B48h
#define  GL_BUFFER_OBJECT_EXT                         9151h
#define  GL_QUERY_OBJECT_EXT                          9153h
#define  GL_VERTEX_ARRAY_OBJECT_EXT                   9154h
;@@ void ( GLenum type, GLuint object, GLsizei bufSize, GLsizei* length, GLchar *label );
glGetObjectLabelEXT!: alias function! [
	type        [ GLenum! ]
	object      [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	label       [ GLstring! ]
]
;@@ void ( GLenum type, GLuint object, GLsizei length, const GLchar* label );
glLabelObjectEXT!: alias function! [
	type        [ GLenum! ]
	object      [ GLuint! ]
	length      [ GLsizei! ]
	label       [ GLstring! ]
]


;-------------------------------------------
;-- GL_EXT_debug_marker
;-------------------------------------------

#define  GL_EXT_debug_marker                          1
;@@ void ( GLsizei length, const GLchar* marker );
glInsertEventMarkerEXT!: alias function! [
	length      [ GLsizei! ]
	marker      [ GLstring! ]
]
;@@ void ( void );
glPopGroupMarkerEXT!: alias function! [
]
;@@ void ( GLsizei length, const GLchar* marker );
glPushGroupMarkerEXT!: alias function! [
	length      [ GLsizei! ]
	marker      [ GLstring! ]
]


;-------------------------------------------
;-- GL_EXT_depth_bounds_test
;-------------------------------------------

#define  GL_EXT_depth_bounds_test                     1
#define  GL_DEPTH_BOUNDS_TEST_EXT                     8890h
#define  GL_DEPTH_BOUNDS_EXT                          8891h
;@@ void ( GLclampd zmin, GLclampd zmax );
glDepthBoundsEXT!: alias function! [
	zmin        [ GLclampd! ]
	zmax        [ GLclampd! ]
]


;-------------------------------------------
;-- GL_EXT_direct_state_access
;-------------------------------------------

#define  GL_EXT_direct_state_access                   1
#define  GL_PROGRAM_MATRIX_EXT                        8E2Dh
#define  GL_TRANSPOSE_PROGRAM_MATRIX_EXT              8E2Eh
#define  GL_PROGRAM_MATRIX_STACK_DEPTH_EXT            8E2Fh
;@@ void ( GLenum texunit, GLenum target, GLuint texture );
glBindMultiTextureEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	texture     [ GLuint! ]
]
;@@ GLenum ( GLuint framebuffer, GLenum target );
glCheckNamedFramebufferStatusEXT!: alias function! [
	framebuffer [ GLuint! ]
	target      [ GLenum! ]
	return: [ GLenum! ]

]
;@@ void ( GLbitfield mask );
glClientAttribDefaultEXT!: alias function! [
	mask        [ GLbitfield! ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const void *data );
glCompressedMultiTexImage1DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *data );
glCompressedMultiTexImage2DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *data );
glCompressedMultiTexImage3DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *data );
glCompressedMultiTexSubImage1DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data );
glCompressedMultiTexSubImage2DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data );
glCompressedMultiTexSubImage3DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const void *data );
glCompressedTextureImage1DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *data );
glCompressedTextureImage2DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *data );
glCompressedTextureImage3DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *data );
glCompressedTextureSubImage1DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data );
glCompressedTextureSubImage2DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data );
glCompressedTextureSubImage3DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border );
glCopyMultiTexImage1DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	border      [ GLint! ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border );
glCopyMultiTexImage2DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	border      [ GLint! ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width );
glCopyMultiTexSubImage1DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyMultiTexSubImage2DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyMultiTexSubImage3DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border );
glCopyTextureImage1DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	border      [ GLint! ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border );
glCopyTextureImage2DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	border      [ GLint! ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width );
glCopyTextureSubImage1DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyTextureSubImage2DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyTextureSubImage3DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLenum array, GLuint index );
glDisableClientStateIndexedEXT!: alias function! [
	array       [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLenum array, GLuint index );
glDisableClientStateiEXT!: alias function! [
	array       [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint index );
glDisableVertexArrayAttribEXT!: alias function! [
	vaobj       [ GLuint! ]
	index       [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLenum array );
glDisableVertexArrayEXT!: alias function! [
	vaobj       [ GLuint! ]
	array       [ GLenum! ]
]
;@@ void ( GLenum array, GLuint index );
glEnableClientStateIndexedEXT!: alias function! [
	array       [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLenum array, GLuint index );
glEnableClientStateiEXT!: alias function! [
	array       [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint index );
glEnableVertexArrayAttribEXT!: alias function! [
	vaobj       [ GLuint! ]
	index       [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLenum array );
glEnableVertexArrayEXT!: alias function! [
	vaobj       [ GLuint! ]
	array       [ GLenum! ]
]
;@@ void ( GLuint buffer, GLintptr offset, GLsizeiptr length );
glFlushMappedNamedBufferRangeEXT!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	length      [ GLsizeiptr! ]
]
;@@ void ( GLuint framebuffer, GLenum mode );
glFramebufferDrawBufferEXT!: alias function! [
	framebuffer [ GLuint! ]
	mode        [ GLenum! ]
]
;@@ void ( GLuint framebuffer, GLsizei n, const GLenum* bufs );
glFramebufferDrawBuffersEXT!: alias function! [
	framebuffer [ GLuint! ]
	n           [ GLsizei! ]
	bufs        [ pointer! [GLenum!] ]
]
;@@ void ( GLuint framebuffer, GLenum mode );
glFramebufferReadBufferEXT!: alias function! [
	framebuffer [ GLuint! ]
	mode        [ GLenum! ]
]
;@@ void ( GLenum texunit, GLenum target );
glGenerateMultiTexMipmapEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
]
;@@ void ( GLuint texture, GLenum target );
glGenerateTextureMipmapEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, void *img );
glGetCompressedMultiTexImageEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	img         [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, void *img );
glGetCompressedTextureImageEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	img         [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLuint index, GLdouble* params );
glGetDoubleIndexedvEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum pname, GLuint index, GLdouble* params );
glGetDoublei_vEXT!: alias function! [
	pname       [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLuint index, GLfloat* params );
glGetFloatIndexedvEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum pname, GLuint index, GLfloat* params );
glGetFloati_vEXT!: alias function! [
	pname       [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint framebuffer, GLenum pname, GLint* param );
glGetFramebufferParameterivEXT!: alias function! [
	framebuffer [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, GLfloat* params );
glGetMultiTexEnvfvEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, GLint* params );
glGetMultiTexEnvivEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum texunit, GLenum coord, GLenum pname, GLdouble* params );
glGetMultiTexGendvEXT!: alias function! [
	texunit     [ GLenum! ]
	coord       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum texunit, GLenum coord, GLenum pname, GLfloat* params );
glGetMultiTexGenfvEXT!: alias function! [
	texunit     [ GLenum! ]
	coord       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum texunit, GLenum coord, GLenum pname, GLint* params );
glGetMultiTexGenivEXT!: alias function! [
	texunit     [ GLenum! ]
	coord       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLenum format, GLenum type, void *pixels );
glGetMultiTexImageEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLenum pname, GLfloat* params );
glGetMultiTexLevelParameterfvEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLenum pname, GLint* params );
glGetMultiTexLevelParameterivEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, GLint* params );
glGetMultiTexParameterIivEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, GLuint* params );
glGetMultiTexParameterIuivEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, GLfloat* params );
glGetMultiTexParameterfvEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, GLint* params );
glGetMultiTexParameterivEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint buffer, GLenum pname, GLint* params );
glGetNamedBufferParameterivEXT!: alias function! [
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint buffer, GLenum pname, void** params );
glGetNamedBufferPointervEXT!: alias function! [
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ binary-ptr! ]
]
;@@ void ( GLuint buffer, GLintptr offset, GLsizeiptr size, void *data );
glGetNamedBufferSubDataEXT!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLenum pname, GLint* params );
glGetNamedFramebufferAttachmentParameterivEXT!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLint* params );
glGetNamedProgramLocalParameterIivEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLuint* params );
glGetNamedProgramLocalParameterIuivEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLdouble* params );
glGetNamedProgramLocalParameterdvEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLfloat* params );
glGetNamedProgramLocalParameterfvEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLenum target, GLenum pname, void *string );
glGetNamedProgramStringEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	string      [ pointer! [byte!] ]
]
;@@ void ( GLuint program, GLenum target, GLenum pname, GLint* params );
glGetNamedProgramivEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint renderbuffer, GLenum pname, GLint* params );
glGetNamedRenderbufferParameterivEXT!: alias function! [
	renderbuffer [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint index, void** params );
glGetPointerIndexedvEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ binary-ptr! ]
]
;@@ void ( GLenum pname, GLuint index, void** params );
glGetPointeri_vEXT!: alias function! [
	pname       [ GLenum! ]
	index       [ GLuint! ]
	params      [ binary-ptr! ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLenum format, GLenum type, void *pixels );
glGetTextureImageEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLenum pname, GLfloat* params );
glGetTextureLevelParameterfvEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLenum pname, GLint* params );
glGetTextureLevelParameterivEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint texture, GLenum target, GLenum pname, GLint* params );
glGetTextureParameterIivEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint texture, GLenum target, GLenum pname, GLuint* params );
glGetTextureParameterIuivEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint texture, GLenum target, GLenum pname, GLfloat* params );
glGetTextureParameterfvEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint texture, GLenum target, GLenum pname, GLint* params );
glGetTextureParameterivEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint vaobj, GLuint index, GLenum pname, GLint* param );
glGetVertexArrayIntegeri_vEXT!: alias function! [
	vaobj       [ GLuint! ]
	index       [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLuint vaobj, GLenum pname, GLint* param );
glGetVertexArrayIntegervEXT!: alias function! [
	vaobj       [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLuint vaobj, GLuint index, GLenum pname, void** param );
glGetVertexArrayPointeri_vEXT!: alias function! [
	vaobj       [ GLuint! ]
	index       [ GLuint! ]
	pname       [ GLenum! ]
	param       [ binary-ptr! ]
]
;@@ void ( GLuint vaobj, GLenum pname, void** param );
glGetVertexArrayPointervEXT!: alias function! [
	vaobj       [ GLuint! ]
	pname       [ GLenum! ]
	param       [ binary-ptr! ]
]
;@@ void * ( GLuint buffer, GLenum access );
glMapNamedBufferEXT!: alias function! [
	buffer      [ GLuint! ]
	access      [ GLenum! ]
	return: [ pointer! [byte!] ]

]
;@@ void * ( GLuint buffer, GLintptr offset, GLsizeiptr length, GLbitfield access );
glMapNamedBufferRangeEXT!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	length      [ GLsizeiptr! ]
	access      [ GLbitfield! ]
	return: [ pointer! [byte!] ]

]
;@@ void ( GLenum matrixMode, GLdouble l, GLdouble r, GLdouble b, GLdouble t, GLdouble n, GLdouble f );
glMatrixFrustumEXT!: alias function! [
	matrixMode  [ GLenum! ]
	l           [ GLdouble! ]
	r           [ GLdouble! ]
	b           [ GLdouble! ]
	t           [ GLdouble! ]
	n           [ GLdouble! ]
	f           [ GLdouble! ]
]
;@@ void ( GLenum matrixMode );
glMatrixLoadIdentityEXT!: alias function! [
	matrixMode  [ GLenum! ]
]
;@@ void ( GLenum matrixMode, const GLdouble* m );
glMatrixLoadTransposedEXT!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum matrixMode, const GLfloat* m );
glMatrixLoadTransposefEXT!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum matrixMode, const GLdouble* m );
glMatrixLoaddEXT!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum matrixMode, const GLfloat* m );
glMatrixLoadfEXT!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum matrixMode, const GLdouble* m );
glMatrixMultTransposedEXT!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum matrixMode, const GLfloat* m );
glMatrixMultTransposefEXT!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum matrixMode, const GLdouble* m );
glMatrixMultdEXT!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum matrixMode, const GLfloat* m );
glMatrixMultfEXT!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum matrixMode, GLdouble l, GLdouble r, GLdouble b, GLdouble t, GLdouble n, GLdouble f );
glMatrixOrthoEXT!: alias function! [
	matrixMode  [ GLenum! ]
	l           [ GLdouble! ]
	r           [ GLdouble! ]
	b           [ GLdouble! ]
	t           [ GLdouble! ]
	n           [ GLdouble! ]
	f           [ GLdouble! ]
]
;@@ void ( GLenum matrixMode );
glMatrixPopEXT!: alias function! [
	matrixMode  [ GLenum! ]
]
;@@ void ( GLenum matrixMode );
glMatrixPushEXT!: alias function! [
	matrixMode  [ GLenum! ]
]
;@@ void ( GLenum matrixMode, GLdouble angle, GLdouble x, GLdouble y, GLdouble z );
glMatrixRotatedEXT!: alias function! [
	matrixMode  [ GLenum! ]
	angle       [ GLdouble! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLenum matrixMode, GLfloat angle, GLfloat x, GLfloat y, GLfloat z );
glMatrixRotatefEXT!: alias function! [
	matrixMode  [ GLenum! ]
	angle       [ GLfloat! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( GLenum matrixMode, GLdouble x, GLdouble y, GLdouble z );
glMatrixScaledEXT!: alias function! [
	matrixMode  [ GLenum! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLenum matrixMode, GLfloat x, GLfloat y, GLfloat z );
glMatrixScalefEXT!: alias function! [
	matrixMode  [ GLenum! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( GLenum matrixMode, GLdouble x, GLdouble y, GLdouble z );
glMatrixTranslatedEXT!: alias function! [
	matrixMode  [ GLenum! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLenum matrixMode, GLfloat x, GLfloat y, GLfloat z );
glMatrixTranslatefEXT!: alias function! [
	matrixMode  [ GLenum! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum internalformat, GLuint buffer );
glMultiTexBufferEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	buffer      [ GLuint! ]
]
;@@ void ( GLenum texunit, GLint size, GLenum type, GLsizei stride, const void *pointer );
glMultiTexCoordPointerEXT!: alias function! [
	texunit     [ GLenum! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, GLfloat param );
glMultiTexEnvfEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, const GLfloat* params );
glMultiTexEnvfvEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, GLint param );
glMultiTexEnviEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, const GLint* params );
glMultiTexEnvivEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum texunit, GLenum coord, GLenum pname, GLdouble param );
glMultiTexGendEXT!: alias function! [
	texunit     [ GLenum! ]
	coord       [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLdouble! ]
]
;@@ void ( GLenum texunit, GLenum coord, GLenum pname, const GLdouble* params );
glMultiTexGendvEXT!: alias function! [
	texunit     [ GLenum! ]
	coord       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum texunit, GLenum coord, GLenum pname, GLfloat param );
glMultiTexGenfEXT!: alias function! [
	texunit     [ GLenum! ]
	coord       [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum texunit, GLenum coord, GLenum pname, const GLfloat* params );
glMultiTexGenfvEXT!: alias function! [
	texunit     [ GLenum! ]
	coord       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum texunit, GLenum coord, GLenum pname, GLint param );
glMultiTexGeniEXT!: alias function! [
	texunit     [ GLenum! ]
	coord       [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum texunit, GLenum coord, GLenum pname, const GLint* params );
glMultiTexGenivEXT!: alias function! [
	texunit     [ GLenum! ]
	coord       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const void *pixels );
glMultiTexImage1DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLint! ]
	width       [ GLsizei! ]
	border      [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void *pixels );
glMultiTexImage2DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	border      [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels );
glMultiTexImage3DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	border      [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, const GLint* params );
glMultiTexParameterIivEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, const GLuint* params );
glMultiTexParameterIuivEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, GLfloat param );
glMultiTexParameterfEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, const GLfloat* param );
glMultiTexParameterfvEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, GLint param );
glMultiTexParameteriEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum texunit, GLenum target, GLenum pname, const GLint* param );
glMultiTexParameterivEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLuint renderbuffer );
glMultiTexRenderbufferEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	renderbuffer [ GLuint! ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const void *pixels );
glMultiTexSubImage1DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels );
glMultiTexSubImage2DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels );
glMultiTexSubImage3DEXT!: alias function! [
	texunit     [ GLenum! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint buffer, GLsizeiptr size, const void *data, GLenum usage );
glNamedBufferDataEXT!: alias function! [
	buffer      [ GLuint! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
	usage       [ GLenum! ]
]
;@@ void ( GLuint buffer, GLintptr offset, GLsizeiptr size, const void *data );
glNamedBufferSubDataEXT!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint readBuffer, GLuint writeBuffer, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size );
glNamedCopyBufferSubDataEXT!: alias function! [
	readBuffer  [ GLuint! ]
	writeBuffer [ GLuint! ]
	readOffset  [ GLintptr! ]
	writeOffset [ GLintptr! ]
	size        [ GLsizeiptr! ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer );
glNamedFramebufferRenderbufferEXT!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	renderbuffertarget [ GLenum! ]
	renderbuffer [ GLuint! ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level );
glNamedFramebufferTexture1DEXT!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	textarget   [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level );
glNamedFramebufferTexture2DEXT!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	textarget   [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset );
glNamedFramebufferTexture3DEXT!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	textarget   [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	zoffset     [ GLint! ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLuint texture, GLint level );
glNamedFramebufferTextureEXT!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLenum face );
glNamedFramebufferTextureFaceEXT!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	face        [ GLenum! ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLint layer );
glNamedFramebufferTextureLayerEXT!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	layer       [ GLint! ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glNamedProgramLocalParameter4dEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, const GLdouble* params );
glNamedProgramLocalParameter4dvEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glNamedProgramLocalParameter4fEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, const GLfloat* params );
glNamedProgramLocalParameter4fvEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w );
glNamedProgramLocalParameterI4iEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
	w           [ GLint! ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, const GLint* params );
glNamedProgramLocalParameterI4ivEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w );
glNamedProgramLocalParameterI4uiEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLuint! ]
	y           [ GLuint! ]
	z           [ GLuint! ]
	w           [ GLuint! ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, const GLuint* params );
glNamedProgramLocalParameterI4uivEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLsizei count, const GLfloat* params );
glNamedProgramLocalParameters4fvEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLsizei count, const GLint* params );
glNamedProgramLocalParametersI4ivEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLenum target, GLuint index, GLsizei count, const GLuint* params );
glNamedProgramLocalParametersI4uivEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLenum target, GLenum format, GLsizei len, const void *string );
glNamedProgramStringEXT!: alias function! [
	program     [ GLuint! ]
	target      [ GLenum! ]
	format      [ GLenum! ]
	len         [ GLsizei! ]
	string      [ pointer! [byte!] ]
]
;@@ void ( GLuint renderbuffer, GLenum internalformat, GLsizei width, GLsizei height );
glNamedRenderbufferStorageEXT!: alias function! [
	renderbuffer [ GLuint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint renderbuffer, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height );
glNamedRenderbufferStorageMultisampleCoverageEXT!: alias function! [
	renderbuffer [ GLuint! ]
	coverageSamples [ GLsizei! ]
	colorSamples [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint renderbuffer, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height );
glNamedRenderbufferStorageMultisampleEXT!: alias function! [
	renderbuffer [ GLuint! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint program, GLint location, GLfloat v0 );
glProgramUniform1fEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLfloat! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLfloat* value );
glProgramUniform1fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLint v0 );
glProgramUniform1iEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint* value );
glProgramUniform1ivEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLint location, GLuint v0 );
glProgramUniform1uiEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLuint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint* value );
glProgramUniform1uivEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLint location, GLfloat v0, GLfloat v1 );
glProgramUniform2fEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLfloat! ]
	v1          [ GLfloat! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLfloat* value );
glProgramUniform2fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLint v0, GLint v1 );
glProgramUniform2iEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint* value );
glProgramUniform2ivEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLint location, GLuint v0, GLuint v1 );
glProgramUniform2uiEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint* value );
glProgramUniform2uivEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2 );
glProgramUniform3fEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLfloat! ]
	v1          [ GLfloat! ]
	v2          [ GLfloat! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLfloat* value );
glProgramUniform3fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLint v0, GLint v1, GLint v2 );
glProgramUniform3iEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
	v2          [ GLint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint* value );
glProgramUniform3ivEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2 );
glProgramUniform3uiEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
	v2          [ GLuint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint* value );
glProgramUniform3uivEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3 );
glProgramUniform4fEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLfloat! ]
	v1          [ GLfloat! ]
	v2          [ GLfloat! ]
	v3          [ GLfloat! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLfloat* value );
glProgramUniform4fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3 );
glProgramUniform4iEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
	v2          [ GLint! ]
	v3          [ GLint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint* value );
glProgramUniform4ivEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3 );
glProgramUniform4uiEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
	v2          [ GLuint! ]
	v3          [ GLuint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint* value );
glProgramUniform4uivEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix2fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix2x3fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix2x4fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix3fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix3x2fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix3x4fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix4fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix4x2fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix4x3fvEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLbitfield mask );
glPushClientAttribDefaultEXT!: alias function! [
	mask        [ GLbitfield! ]
]
;@@ void ( GLuint texture, GLenum target, GLenum internalformat, GLuint buffer );
glTextureBufferEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	buffer      [ GLuint! ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const void *pixels );
glTextureImage1DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLint! ]
	width       [ GLsizei! ]
	border      [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void *pixels );
glTextureImage2DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	border      [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels );
glTextureImage3DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	border      [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLenum pname, const GLint* params );
glTextureParameterIivEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint texture, GLenum target, GLenum pname, const GLuint* params );
glTextureParameterIuivEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint texture, GLenum target, GLenum pname, GLfloat param );
glTextureParameterfEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLuint texture, GLenum target, GLenum pname, const GLfloat* param );
glTextureParameterfvEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint texture, GLenum target, GLenum pname, GLint param );
glTextureParameteriEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLuint texture, GLenum target, GLenum pname, const GLint* param );
glTextureParameterivEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLuint texture, GLenum target, GLuint renderbuffer );
glTextureRenderbufferEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	renderbuffer [ GLuint! ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const void *pixels );
glTextureSubImage1DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels );
glTextureSubImage2DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels );
glTextureSubImage3DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ GLboolean ( GLuint buffer );
glUnmapNamedBufferEXT!: alias function! [
	buffer      [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset );
glVertexArrayColorOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLsizei stride, GLintptr offset );
glVertexArrayEdgeFlagOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLenum type, GLsizei stride, GLintptr offset );
glVertexArrayFogCoordOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLenum type, GLsizei stride, GLintptr offset );
glVertexArrayIndexOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLenum texunit, GLint size, GLenum type, GLsizei stride, GLintptr offset );
glVertexArrayMultiTexCoordOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	texunit     [ GLenum! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLenum type, GLsizei stride, GLintptr offset );
glVertexArrayNormalOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset );
glVertexArraySecondaryColorOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset );
glVertexArrayTexCoordOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint vaobj, GLuint index, GLuint divisor );
glVertexArrayVertexAttribDivisorEXT!: alias function! [
	vaobj       [ GLuint! ]
	index       [ GLuint! ]
	divisor     [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLsizei stride, GLintptr offset );
glVertexArrayVertexAttribIOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, GLintptr offset );
glVertexArrayVertexAttribOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset );
glVertexArrayVertexOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]


;-------------------------------------------
;-- GL_EXT_discard_framebuffer
;-------------------------------------------

#define  GL_EXT_discard_framebuffer                   1
#define  GL_COLOR_EXT                                 1800h
#define  GL_DEPTH_EXT                                 1801h
#define  GL_STENCIL_EXT                               1802h
;@@ void ( GLenum target, GLsizei numAttachments, const GLenum* attachments );
glDiscardFramebufferEXT!: alias function! [
	target      [ GLenum! ]
	numAttachments [ GLsizei! ]
	attachments [ pointer! [GLenum!] ]
]


;-------------------------------------------
;-- GL_EXT_draw_buffers
;-------------------------------------------

#define  GL_EXT_draw_buffers                          1
#define  GL_MAX_DRAW_BUFFERS_EXT                      8824h
#define  GL_DRAW_BUFFER0_EXT                          8825h
#define  GL_DRAW_BUFFER1_EXT                          8826h
#define  GL_DRAW_BUFFER2_EXT                          8827h
#define  GL_DRAW_BUFFER3_EXT                          8828h
#define  GL_DRAW_BUFFER4_EXT                          8829h
#define  GL_DRAW_BUFFER5_EXT                          882Ah
#define  GL_DRAW_BUFFER6_EXT                          882Bh
#define  GL_DRAW_BUFFER7_EXT                          882Ch
#define  GL_DRAW_BUFFER8_EXT                          882Dh
#define  GL_DRAW_BUFFER9_EXT                          882Eh
#define  GL_DRAW_BUFFER10_EXT                         882Fh
#define  GL_DRAW_BUFFER11_EXT                         8830h
#define  GL_DRAW_BUFFER12_EXT                         8831h
#define  GL_DRAW_BUFFER13_EXT                         8832h
#define  GL_DRAW_BUFFER14_EXT                         8833h
#define  GL_DRAW_BUFFER15_EXT                         8834h
#define  GL_MAX_COLOR_ATTACHMENTS_EXT                 8CDFh
#define  GL_COLOR_ATTACHMENT0_EXT                     8CE0h
#define  GL_COLOR_ATTACHMENT1_EXT                     8CE1h
#define  GL_COLOR_ATTACHMENT2_EXT                     8CE2h
#define  GL_COLOR_ATTACHMENT3_EXT                     8CE3h
#define  GL_COLOR_ATTACHMENT4_EXT                     8CE4h
#define  GL_COLOR_ATTACHMENT5_EXT                     8CE5h
#define  GL_COLOR_ATTACHMENT6_EXT                     8CE6h
#define  GL_COLOR_ATTACHMENT7_EXT                     8CE7h
#define  GL_COLOR_ATTACHMENT8_EXT                     8CE8h
#define  GL_COLOR_ATTACHMENT9_EXT                     8CE9h
#define  GL_COLOR_ATTACHMENT10_EXT                    8CEAh
#define  GL_COLOR_ATTACHMENT11_EXT                    8CEBh
#define  GL_COLOR_ATTACHMENT12_EXT                    8CECh
#define  GL_COLOR_ATTACHMENT13_EXT                    8CEDh
#define  GL_COLOR_ATTACHMENT14_EXT                    8CEEh
#define  GL_COLOR_ATTACHMENT15_EXT                    8CEFh
;@@ void ( GLsizei n, const GLenum* bufs );
glDrawBuffersEXT!: alias function! [
	n           [ GLsizei! ]
	bufs        [ pointer! [GLenum!] ]
]


;-------------------------------------------
;-- GL_EXT_draw_buffers2
;-------------------------------------------

#define  GL_EXT_draw_buffers2                         1
;@@ void ( GLuint buf, GLboolean r, GLboolean g, GLboolean b, GLboolean a );
glColorMaskIndexedEXT!: alias function! [
	buf         [ GLuint! ]
	r           [ GLboolean! ]
	g           [ GLboolean! ]
	b           [ GLboolean! ]
	a           [ GLboolean! ]
]
;@@ void ( GLenum target, GLuint index );
glDisableIndexedEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index );
glEnableIndexedEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLenum value, GLuint index, GLboolean* data );
glGetBooleanIndexedvEXT!: alias function! [
	value       [ GLenum! ]
	index       [ GLuint! ]
	data        [ pointer! [integer!] ]
]
;@@ void ( GLenum value, GLuint index, GLint* data );
glGetIntegerIndexedvEXT!: alias function! [
	value       [ GLenum! ]
	index       [ GLuint! ]
	data        [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLenum target, GLuint index );
glIsEnabledIndexedEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_EXT_draw_buffers_indexed
;-------------------------------------------

#define  GL_EXT_draw_buffers_indexed                  1
;@@ void ( GLuint buf, GLenum modeRGB, GLenum modeAlpha );
glBlendEquationSeparateiEXT!: alias function! [
	buf         [ GLuint! ]
	modeRGB     [ GLenum! ]
	modeAlpha   [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum mode );
glBlendEquationiEXT!: alias function! [
	buf         [ GLuint! ]
	mode        [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha );
glBlendFuncSeparateiEXT!: alias function! [
	buf         [ GLuint! ]
	srcRGB      [ GLenum! ]
	dstRGB      [ GLenum! ]
	srcAlpha    [ GLenum! ]
	dstAlpha    [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum src, GLenum dst );
glBlendFunciEXT!: alias function! [
	buf         [ GLuint! ]
	src         [ GLenum! ]
	dst         [ GLenum! ]
]
;@@ void ( GLuint buf, GLboolean r, GLboolean g, GLboolean b, GLboolean a );
glColorMaskiEXT!: alias function! [
	buf         [ GLuint! ]
	r           [ GLboolean! ]
	g           [ GLboolean! ]
	b           [ GLboolean! ]
	a           [ GLboolean! ]
]
;@@ void ( GLenum target, GLuint index );
glDisableiEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index );
glEnableiEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
]
;@@ GLboolean ( GLenum target, GLuint index );
glIsEnablediEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_EXT_draw_elements_base_vertex
;-------------------------------------------

#define  GL_EXT_draw_elements_base_vertex             1
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void *indices, GLint basevertex );
glDrawElementsBaseVertexEXT!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	basevertex  [ GLint! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount, GLint basevertex );
glDrawElementsInstancedBaseVertexEXT!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	instancecount [ GLsizei! ]
	basevertex  [ GLint! ]
]
;@@ void ( GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const void *indices, GLint basevertex );
glDrawRangeElementsBaseVertexEXT!: alias function! [
	mode        [ GLenum! ]
	start       [ GLuint! ]
	end         [ GLuint! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	basevertex  [ GLint! ]
]
;@@ void ( GLenum mode, const GLsizei* count, GLenum type, const void *const *indices, GLsizei primcount, const GLint *basevertex );
glMultiDrawElementsBaseVertexEXT!: alias function! [
	mode        [ GLenum! ]
	count       [ pointer! [GLsizei!] ]
	type        [ GLenum! ]
	indices     [ binary-ptr! ]
	primcount   [ GLsizei! ]
	basevertex  [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_EXT_draw_instanced
;-------------------------------------------

#define  GL_EXT_draw_instanced                        1
;@@ void ( GLenum mode, GLint start, GLsizei count, GLsizei primcount );
glDrawArraysInstancedEXT!: alias function! [
	mode        [ GLenum! ]
	start       [ GLint! ]
	count       [ GLsizei! ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount );
glDrawElementsInstancedEXT!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
]


;-------------------------------------------
;-- GL_EXT_draw_range_elements
;-------------------------------------------

#define  GL_EXT_draw_range_elements                   1
#define  GL_MAX_ELEMENTS_VERTICES_EXT                 80E8h
#define  GL_MAX_ELEMENTS_INDICES_EXT                  80E9h
;@@ void ( GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const void *indices );
glDrawRangeElementsEXT!: alias function! [
	mode        [ GLenum! ]
	start       [ GLuint! ]
	end         [ GLuint! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_external_buffer
;-------------------------------------------

#define  GL_EXT_external_buffer                       1
;@@ void ( GLenum target, GLintptr offset, GLsizeiptr size, GLeglClientBufferEXT clientBuffer, GLbitfield flags );
glBufferStorageExternalEXT!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	clientBuffer [ GLeglClientBufferEXT! ]
	flags       [ GLbitfield! ]
]
;@@ void ( GLuint buffer, GLintptr offset, GLsizeiptr size, GLeglClientBufferEXT clientBuffer, GLbitfield flags );
glNamedBufferStorageExternalEXT!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	clientBuffer [ GLeglClientBufferEXT! ]
	flags       [ GLbitfield! ]
]


;-------------------------------------------
;-- GL_EXT_float_blend
;-------------------------------------------

#define  GL_EXT_float_blend                           1


;-------------------------------------------
;-- GL_EXT_fog_coord
;-------------------------------------------

#define  GL_EXT_fog_coord                             1
#define  GL_FOG_COORDINATE_SOURCE_EXT                 8450h
#define  GL_FOG_COORDINATE_EXT                        8451h
#define  GL_FRAGMENT_DEPTH_EXT                        8452h
#define  GL_CURRENT_FOG_COORDINATE_EXT                8453h
#define  GL_FOG_COORDINATE_ARRAY_TYPE_EXT             8454h
#define  GL_FOG_COORDINATE_ARRAY_STRIDE_EXT           8455h
#define  GL_FOG_COORDINATE_ARRAY_POINTER_EXT          8456h
#define  GL_FOG_COORDINATE_ARRAY_EXT                  8457h
;@@ void ( GLenum type, GLsizei stride, const void *pointer );
glFogCoordPointerEXT!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLdouble coord );
glFogCoorddEXT!: alias function! [
	coord       [ GLdouble! ]
]
;@@ void ( const GLdouble *coord );
glFogCoorddvEXT!: alias function! [
	coord       [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat coord );
glFogCoordfEXT!: alias function! [
	coord       [ GLfloat! ]
]
;@@ void ( const GLfloat *coord );
glFogCoordfvEXT!: alias function! [
	coord       [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_EXT_frag_depth
;-------------------------------------------

#define  GL_EXT_frag_depth                            1


;-------------------------------------------
;-- GL_EXT_fragment_lighting
;-------------------------------------------

#define  GL_EXT_fragment_lighting                     1
#define  GL_FRAGMENT_LIGHTING_EXT                     8400h
#define  GL_FRAGMENT_COLOR_MATERIAL_EXT               8401h
#define  GL_FRAGMENT_COLOR_MATERIAL_FACE_EXT          8402h
#define  GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_EXT     8403h
#define  GL_MAX_FRAGMENT_LIGHTS_EXT                   8404h
#define  GL_MAX_ACTIVE_LIGHTS_EXT                     8405h
#define  GL_CURRENT_RASTER_NORMAL_EXT                 8406h
#define  GL_LIGHT_ENV_MODE_EXT                        8407h
#define  GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_EXT     8408h
#define  GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_EXT         8409h
#define  GL_FRAGMENT_LIGHT_MODEL_AMBIENT_EXT          840Ah
#define  GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_EXT  840Bh
#define  GL_FRAGMENT_LIGHT0_EXT                       840Ch
#define  GL_FRAGMENT_LIGHT7_EXT                       8413h
;@@ void ( GLenum face, GLenum mode );
glFragmentColorMaterialEXT!: alias function! [
	face        [ GLenum! ]
	mode        [ GLenum! ]
]
;@@ void ( GLenum pname, GLfloat param );
glFragmentLightModelfEXT!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum pname, GLfloat* params );
glFragmentLightModelfvEXT!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum pname, GLint param );
glFragmentLightModeliEXT!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum pname, GLint* params );
glFragmentLightModelivEXT!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum light, GLenum pname, GLfloat param );
glFragmentLightfEXT!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum light, GLenum pname, GLfloat* params );
glFragmentLightfvEXT!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum light, GLenum pname, GLint param );
glFragmentLightiEXT!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum light, GLenum pname, GLint* params );
glFragmentLightivEXT!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum face, GLenum pname, const GLfloat param );
glFragmentMaterialfEXT!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum face, GLenum pname, const GLfloat* params );
glFragmentMaterialfvEXT!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum face, GLenum pname, const GLint param );
glFragmentMaterialiEXT!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum face, GLenum pname, const GLint* params );
glFragmentMaterialivEXT!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum light, GLenum pname, GLfloat* params );
glGetFragmentLightfvEXT!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum light, GLenum pname, GLint* params );
glGetFragmentLightivEXT!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum face, GLenum pname, const GLfloat* params );
glGetFragmentMaterialfvEXT!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum face, GLenum pname, const GLint* params );
glGetFragmentMaterialivEXT!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum pname, GLint param );
glLightEnviEXT!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]


;-------------------------------------------
;-- GL_EXT_framebuffer_blit
;-------------------------------------------

#define  GL_EXT_framebuffer_blit                      1
#define  GL_DRAW_FRAMEBUFFER_BINDING_EXT              8CA6h
#define  GL_READ_FRAMEBUFFER_EXT                      8CA8h
#define  GL_DRAW_FRAMEBUFFER_EXT                      8CA9h
#define  GL_READ_FRAMEBUFFER_BINDING_EXT              8CAAh
;@@ void ( GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter );
glBlitFramebufferEXT!: alias function! [
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
;-- GL_EXT_framebuffer_multisample
;-------------------------------------------

#define  GL_EXT_framebuffer_multisample               1
#define  GL_RENDERBUFFER_SAMPLES_EXT                  8CABh
#define  GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT    8D56h
#define  GL_MAX_SAMPLES_EXT                           8D57h
;@@ void ( GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height );
glRenderbufferStorageMultisampleEXT!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_EXT_framebuffer_multisample_blit_scaled
;-------------------------------------------

#define  GL_EXT_framebuffer_multisample_blit_scaled   1
#define  GL_SCALED_RESOLVE_FASTEST_EXT                90BAh
#define  GL_SCALED_RESOLVE_NICEST_EXT                 90BBh


;-------------------------------------------
;-- GL_EXT_framebuffer_object
;-------------------------------------------

#define  GL_EXT_framebuffer_object                    1
#define  GL_INVALID_FRAMEBUFFER_OPERATION_EXT         0506h
#define  GL_MAX_RENDERBUFFER_SIZE_EXT                 84E8h
#define  GL_FRAMEBUFFER_BINDING_EXT                   8CA6h
#define  GL_RENDERBUFFER_BINDING_EXT                  8CA7h
#define  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT    8CD0h
#define  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT    8CD1h
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT  8CD2h
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT  8CD3h
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT  8CD4h
#define  GL_FRAMEBUFFER_COMPLETE_EXT                  8CD5h
#define  GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT     8CD6h
#define  GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT  8CD7h
#define  GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT     8CD9h
#define  GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT        8CDAh
#define  GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT    8CDBh
#define  GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT    8CDCh
#define  GL_FRAMEBUFFER_UNSUPPORTED_EXT               8CDDh
;#define  GL_MAX_COLOR_ATTACHMENTS_EXT                 8CDFh
;#define  GL_COLOR_ATTACHMENT0_EXT                     8CE0h
;#define  GL_COLOR_ATTACHMENT1_EXT                     8CE1h
;#define  GL_COLOR_ATTACHMENT2_EXT                     8CE2h
;#define  GL_COLOR_ATTACHMENT3_EXT                     8CE3h
;#define  GL_COLOR_ATTACHMENT4_EXT                     8CE4h
;#define  GL_COLOR_ATTACHMENT5_EXT                     8CE5h
;#define  GL_COLOR_ATTACHMENT6_EXT                     8CE6h
;#define  GL_COLOR_ATTACHMENT7_EXT                     8CE7h
;#define  GL_COLOR_ATTACHMENT8_EXT                     8CE8h
;#define  GL_COLOR_ATTACHMENT9_EXT                     8CE9h
;#define  GL_COLOR_ATTACHMENT10_EXT                    8CEAh
;#define  GL_COLOR_ATTACHMENT11_EXT                    8CEBh
;#define  GL_COLOR_ATTACHMENT12_EXT                    8CECh
;#define  GL_COLOR_ATTACHMENT13_EXT                    8CEDh
;#define  GL_COLOR_ATTACHMENT14_EXT                    8CEEh
;#define  GL_COLOR_ATTACHMENT15_EXT                    8CEFh
#define  GL_DEPTH_ATTACHMENT_EXT                      8D00h
#define  GL_STENCIL_ATTACHMENT_EXT                    8D20h
#define  GL_FRAMEBUFFER_EXT                           8D40h
#define  GL_RENDERBUFFER_EXT                          8D41h
#define  GL_RENDERBUFFER_WIDTH_EXT                    8D42h
#define  GL_RENDERBUFFER_HEIGHT_EXT                   8D43h
#define  GL_RENDERBUFFER_INTERNAL_FORMAT_EXT          8D44h
#define  GL_STENCIL_INDEX1_EXT                        8D46h
#define  GL_STENCIL_INDEX4_EXT                        8D47h
#define  GL_STENCIL_INDEX8_EXT                        8D48h
#define  GL_STENCIL_INDEX16_EXT                       8D49h
#define  GL_RENDERBUFFER_RED_SIZE_EXT                 8D50h
#define  GL_RENDERBUFFER_GREEN_SIZE_EXT               8D51h
#define  GL_RENDERBUFFER_BLUE_SIZE_EXT                8D52h
#define  GL_RENDERBUFFER_ALPHA_SIZE_EXT               8D53h
#define  GL_RENDERBUFFER_DEPTH_SIZE_EXT               8D54h
#define  GL_RENDERBUFFER_STENCIL_SIZE_EXT             8D55h
;@@ void ( GLenum target, GLuint framebuffer );
glBindFramebufferEXT!: alias function! [
	target      [ GLenum! ]
	framebuffer [ GLuint! ]
]
;@@ void ( GLenum target, GLuint renderbuffer );
glBindRenderbufferEXT!: alias function! [
	target      [ GLenum! ]
	renderbuffer [ GLuint! ]
]
;@@ GLenum ( GLenum target );
glCheckFramebufferStatusEXT!: alias function! [
	target      [ GLenum! ]
	return: [ GLenum! ]

]
;@@ void ( GLsizei n, const GLuint* framebuffers );
glDeleteFramebuffersEXT!: alias function! [
	n           [ GLsizei! ]
	framebuffers [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, const GLuint* renderbuffers );
glDeleteRenderbuffersEXT!: alias function! [
	n           [ GLsizei! ]
	renderbuffers [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer );
glFramebufferRenderbufferEXT!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	renderbuffertarget [ GLenum! ]
	renderbuffer [ GLuint! ]
]
;@@ void ( GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level );
glFramebufferTexture1DEXT!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	textarget   [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level );
glFramebufferTexture2DEXT!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	textarget   [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset );
glFramebufferTexture3DEXT!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	textarget   [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	zoffset     [ GLint! ]
]
;@@ void ( GLsizei n, GLuint* framebuffers );
glGenFramebuffersEXT!: alias function! [
	n           [ GLsizei! ]
	framebuffers [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* renderbuffers );
glGenRenderbuffersEXT!: alias function! [
	n           [ GLsizei! ]
	renderbuffers [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target );
glGenerateMipmapEXT!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLenum target, GLenum attachment, GLenum pname, GLint* params );
glGetFramebufferAttachmentParameterivEXT!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetRenderbufferParameterivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint framebuffer );
glIsFramebufferEXT!: alias function! [
	framebuffer [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint renderbuffer );
glIsRenderbufferEXT!: alias function! [
	renderbuffer [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum target, GLenum internalformat, GLsizei width, GLsizei height );
glRenderbufferStorageEXT!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_EXT_framebuffer_sRGB
;-------------------------------------------

#define  GL_EXT_framebuffer_sRGB                      1
#define  GL_FRAMEBUFFER_SRGB_EXT                      8DB9h
#define  GL_FRAMEBUFFER_SRGB_CAPABLE_EXT              8DBAh


;-------------------------------------------
;-- GL_EXT_geometry_point_size
;-------------------------------------------

#define  GL_EXT_geometry_point_size                   1
#define  GL_GEOMETRY_SHADER_BIT_EXT                   00000004h
#define  GL_LINES_ADJACENCY_EXT                       0Ah
#define  GL_LINE_STRIP_ADJACENCY_EXT                  0Bh
#define  GL_TRIANGLES_ADJACENCY_EXT                   0Ch
#define  GL_TRIANGLE_STRIP_ADJACENCY_EXT              0Dh
#define  GL_LAYER_PROVOKING_VERTEX_EXT                825Eh
#define  GL_UNDEFINED_VERTEX_EXT                      8260h
#define  GL_GEOMETRY_SHADER_INVOCATIONS_EXT           887Fh
#define  GL_GEOMETRY_LINKED_VERTICES_OUT_EXT          8916h
#define  GL_GEOMETRY_LINKED_INPUT_TYPE_EXT            8917h
#define  GL_GEOMETRY_LINKED_OUTPUT_TYPE_EXT           8918h
#define  GL_MAX_GEOMETRY_UNIFORM_BLOCKS_EXT           8A2Ch
#define  GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS_EXT  8A32h
#define  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT      8C29h
#define  GL_PRIMITIVES_GENERATED_EXT                  8C87h
#define  GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT        8DA7h
#define  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT  8DA8h
#define  GL_GEOMETRY_SHADER_EXT                       8DD9h
#define  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT       8DDFh
#define  GL_MAX_GEOMETRY_OUTPUT_VERTICES_EXT          8DE0h
#define  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT  8DE1h
#define  GL_FIRST_VERTEX_CONVENTION_EXT               8E4Dh
#define  GL_LAST_VERTEX_CONVENTION_EXT                8E4Eh
#define  GL_MAX_GEOMETRY_SHADER_INVOCATIONS_EXT       8E5Ah
#define  GL_MAX_GEOMETRY_IMAGE_UNIFORMS_EXT           90CDh
#define  GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS_EXT    90D7h
#define  GL_MAX_GEOMETRY_INPUT_COMPONENTS_EXT         9123h
#define  GL_MAX_GEOMETRY_OUTPUT_COMPONENTS_EXT        9124h
#define  GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS_EXT   92CFh
#define  GL_MAX_GEOMETRY_ATOMIC_COUNTERS_EXT          92D5h
#define  GL_REFERENCED_BY_GEOMETRY_SHADER_EXT         9309h
#define  GL_FRAMEBUFFER_DEFAULT_LAYERS_EXT            9312h
#define  GL_MAX_FRAMEBUFFER_LAYERS_EXT                9317h


;-------------------------------------------
;-- GL_EXT_geometry_shader
;-------------------------------------------

#define  GL_EXT_geometry_shader                       1
;#define  GL_GEOMETRY_SHADER_BIT_EXT                   00000004h
;#define  GL_LINES_ADJACENCY_EXT                       0Ah
;#define  GL_LINE_STRIP_ADJACENCY_EXT                  0Bh
;#define  GL_TRIANGLES_ADJACENCY_EXT                   0Ch
;#define  GL_TRIANGLE_STRIP_ADJACENCY_EXT              0Dh
;#define  GL_LAYER_PROVOKING_VERTEX_EXT                825Eh
;#define  GL_UNDEFINED_VERTEX_EXT                      8260h
;#define  GL_GEOMETRY_SHADER_INVOCATIONS_EXT           887Fh
;#define  GL_GEOMETRY_LINKED_VERTICES_OUT_EXT          8916h
;#define  GL_GEOMETRY_LINKED_INPUT_TYPE_EXT            8917h
;#define  GL_GEOMETRY_LINKED_OUTPUT_TYPE_EXT           8918h
;#define  GL_MAX_GEOMETRY_UNIFORM_BLOCKS_EXT           8A2Ch
;#define  GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS_EXT  8A32h
;#define  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT      8C29h
;#define  GL_PRIMITIVES_GENERATED_EXT                  8C87h
;#define  GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT        8DA7h
;#define  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT  8DA8h
;#define  GL_GEOMETRY_SHADER_EXT                       8DD9h
;#define  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT       8DDFh
;#define  GL_MAX_GEOMETRY_OUTPUT_VERTICES_EXT          8DE0h
;#define  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT  8DE1h
;#define  GL_FIRST_VERTEX_CONVENTION_EXT               8E4Dh
;#define  GL_LAST_VERTEX_CONVENTION_EXT                8E4Eh
;#define  GL_MAX_GEOMETRY_SHADER_INVOCATIONS_EXT       8E5Ah
;#define  GL_MAX_GEOMETRY_IMAGE_UNIFORMS_EXT           90CDh
;#define  GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS_EXT    90D7h
;#define  GL_MAX_GEOMETRY_INPUT_COMPONENTS_EXT         9123h
;#define  GL_MAX_GEOMETRY_OUTPUT_COMPONENTS_EXT        9124h
;#define  GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS_EXT   92CFh
;#define  GL_MAX_GEOMETRY_ATOMIC_COUNTERS_EXT          92D5h
;#define  GL_REFERENCED_BY_GEOMETRY_SHADER_EXT         9309h
;#define  GL_FRAMEBUFFER_DEFAULT_LAYERS_EXT            9312h
;#define  GL_MAX_FRAMEBUFFER_LAYERS_EXT                9317h


;-------------------------------------------
;-- GL_EXT_geometry_shader4
;-------------------------------------------

#define  GL_EXT_geometry_shader4                      1
;#define  GL_LINES_ADJACENCY_EXT                       0Ah
;#define  GL_LINE_STRIP_ADJACENCY_EXT                  0Bh
;#define  GL_TRIANGLES_ADJACENCY_EXT                   0Ch
;#define  GL_TRIANGLE_STRIP_ADJACENCY_EXT              0Dh
#define  GL_PROGRAM_POINT_SIZE_EXT                    8642h
#define  GL_MAX_VARYING_COMPONENTS_EXT                8B4Bh
;#define  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT      8C29h
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT  8CD4h
;#define  GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT        8DA7h
;#define  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT  8DA8h
#define  GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT    8DA9h
;#define  GL_GEOMETRY_SHADER_EXT                       8DD9h
#define  GL_GEOMETRY_VERTICES_OUT_EXT                 8DDAh
#define  GL_GEOMETRY_INPUT_TYPE_EXT                   8DDBh
#define  GL_GEOMETRY_OUTPUT_TYPE_EXT                  8DDCh
#define  GL_MAX_GEOMETRY_VARYING_COMPONENTS_EXT       8DDDh
#define  GL_MAX_VERTEX_VARYING_COMPONENTS_EXT         8DDEh
;#define  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT       8DDFh
;#define  GL_MAX_GEOMETRY_OUTPUT_VERTICES_EXT          8DE0h
;#define  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT  8DE1h
;@@ void ( GLenum target, GLenum attachment, GLuint texture, GLint level );
glFramebufferTextureEXT!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLenum target, GLenum attachment, GLuint texture, GLint level, GLenum face );
glFramebufferTextureFaceEXT!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	face        [ GLenum! ]
]
;@@ void ( GLuint program, GLenum pname, GLint value );
glProgramParameteriEXT!: alias function! [
	program     [ GLuint! ]
	pname       [ GLenum! ]
	value       [ GLint! ]
]


;-------------------------------------------
;-- GL_EXT_gpu_program_parameters
;-------------------------------------------

#define  GL_EXT_gpu_program_parameters                1
;@@ void ( GLenum target, GLuint index, GLsizei count, const GLfloat* params );
glProgramEnvParameters4fvEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLuint index, GLsizei count, const GLfloat* params );
glProgramLocalParameters4fvEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_EXT_gpu_shader4
;-------------------------------------------

#define  GL_EXT_gpu_shader4                           1
#define  GL_VERTEX_ATTRIB_ARRAY_INTEGER_EXT           88FDh
#define  GL_SAMPLER_1D_ARRAY_EXT                      8DC0h
#define  GL_SAMPLER_2D_ARRAY_EXT                      8DC1h
#define  GL_SAMPLER_BUFFER_EXT                        8DC2h
#define  GL_SAMPLER_1D_ARRAY_SHADOW_EXT               8DC3h
#define  GL_SAMPLER_2D_ARRAY_SHADOW_EXT               8DC4h
#define  GL_SAMPLER_CUBE_SHADOW_EXT                   8DC5h
#define  GL_UNSIGNED_INT_VEC2_EXT                     8DC6h
#define  GL_UNSIGNED_INT_VEC3_EXT                     8DC7h
#define  GL_UNSIGNED_INT_VEC4_EXT                     8DC8h
#define  GL_INT_SAMPLER_1D_EXT                        8DC9h
#define  GL_INT_SAMPLER_2D_EXT                        8DCAh
#define  GL_INT_SAMPLER_3D_EXT                        8DCBh
#define  GL_INT_SAMPLER_CUBE_EXT                      8DCCh
#define  GL_INT_SAMPLER_2D_RECT_EXT                   8DCDh
#define  GL_INT_SAMPLER_1D_ARRAY_EXT                  8DCEh
#define  GL_INT_SAMPLER_2D_ARRAY_EXT                  8DCFh
#define  GL_INT_SAMPLER_BUFFER_EXT                    8DD0h
#define  GL_UNSIGNED_INT_SAMPLER_1D_EXT               8DD1h
#define  GL_UNSIGNED_INT_SAMPLER_2D_EXT               8DD2h
#define  GL_UNSIGNED_INT_SAMPLER_3D_EXT               8DD3h
#define  GL_UNSIGNED_INT_SAMPLER_CUBE_EXT             8DD4h
#define  GL_UNSIGNED_INT_SAMPLER_2D_RECT_EXT          8DD5h
#define  GL_UNSIGNED_INT_SAMPLER_1D_ARRAY_EXT         8DD6h
#define  GL_UNSIGNED_INT_SAMPLER_2D_ARRAY_EXT         8DD7h
#define  GL_UNSIGNED_INT_SAMPLER_BUFFER_EXT           8DD8h
;@@ void ( GLuint program, GLuint color, const GLchar *name );
glBindFragDataLocationEXT!: alias function! [
	program     [ GLuint! ]
	color       [ GLuint! ]
	name        [ GLstring! ]
]
;@@ GLint ( GLuint program, const GLchar *name );
glGetFragDataLocationEXT!: alias function! [
	program     [ GLuint! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]
;@@ void ( GLuint program, GLint location, GLuint *params );
glGetUniformuivEXT!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLenum pname, GLint *params );
glGetVertexAttribIivEXT!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLenum pname, GLuint *params );
glGetVertexAttribIuivEXT!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLint location, GLuint v0 );
glUniform1uiEXT!: alias function! [
	location    [ GLint! ]
	v0          [ GLuint! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint *value );
glUniform1uivEXT!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLint location, GLuint v0, GLuint v1 );
glUniform2uiEXT!: alias function! [
	location    [ GLint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint *value );
glUniform2uivEXT!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLint location, GLuint v0, GLuint v1, GLuint v2 );
glUniform3uiEXT!: alias function! [
	location    [ GLint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
	v2          [ GLuint! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint *value );
glUniform3uivEXT!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3 );
glUniform4uiEXT!: alias function! [
	location    [ GLint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
	v2          [ GLuint! ]
	v3          [ GLuint! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint *value );
glUniform4uivEXT!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLint x );
glVertexAttribI1iEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLint! ]
]
;@@ void ( GLuint index, const GLint *v );
glVertexAttribI1ivEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLuint x );
glVertexAttribI1uiEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLuint! ]
]
;@@ void ( GLuint index, const GLuint *v );
glVertexAttribI1uivEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLint x, GLint y );
glVertexAttribI2iEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLint! ]
	y           [ GLint! ]
]
;@@ void ( GLuint index, const GLint *v );
glVertexAttribI2ivEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLuint x, GLuint y );
glVertexAttribI2uiEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLuint! ]
	y           [ GLuint! ]
]
;@@ void ( GLuint index, const GLuint *v );
glVertexAttribI2uivEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLint x, GLint y, GLint z );
glVertexAttribI3iEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
]
;@@ void ( GLuint index, const GLint *v );
glVertexAttribI3ivEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLuint x, GLuint y, GLuint z );
glVertexAttribI3uiEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLuint! ]
	y           [ GLuint! ]
	z           [ GLuint! ]
]
;@@ void ( GLuint index, const GLuint *v );
glVertexAttribI3uivEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, const GLbyte *v );
glVertexAttribI4bvEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLbyte!] ]
]
;@@ void ( GLuint index, GLint x, GLint y, GLint z, GLint w );
glVertexAttribI4iEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
	w           [ GLint! ]
]
;@@ void ( GLuint index, const GLint *v );
glVertexAttribI4ivEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, const GLshort *v );
glVertexAttribI4svEXT!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, const GLubyte *v );
glVertexAttribI4ubvEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint index, GLuint x, GLuint y, GLuint z, GLuint w );
glVertexAttribI4uiEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLuint! ]
	y           [ GLuint! ]
	z           [ GLuint! ]
	w           [ GLuint! ]
]
;@@ void ( GLuint index, const GLuint *v );
glVertexAttribI4uivEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, const GLushort *v );
glVertexAttribI4usvEXT!: alias function! [
	index       [ GLuint! ]
	v           [ GLushort-ptr! ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLsizei stride, const void *pointer );
glVertexAttribIPointerEXT!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_gpu_shader5
;-------------------------------------------

#define  GL_EXT_gpu_shader5                           1


;-------------------------------------------
;-- GL_EXT_histogram
;-------------------------------------------

#define  GL_EXT_histogram                             1
#define  GL_HISTOGRAM_EXT                             8024h
#define  GL_PROXY_HISTOGRAM_EXT                       8025h
#define  GL_HISTOGRAM_WIDTH_EXT                       8026h
#define  GL_HISTOGRAM_FORMAT_EXT                      8027h
#define  GL_HISTOGRAM_RED_SIZE_EXT                    8028h
#define  GL_HISTOGRAM_GREEN_SIZE_EXT                  8029h
#define  GL_HISTOGRAM_BLUE_SIZE_EXT                   802Ah
#define  GL_HISTOGRAM_ALPHA_SIZE_EXT                  802Bh
#define  GL_HISTOGRAM_LUMINANCE_SIZE_EXT              802Ch
#define  GL_HISTOGRAM_SINK_EXT                        802Dh
#define  GL_MINMAX_EXT                                802Eh
#define  GL_MINMAX_FORMAT_EXT                         802Fh
#define  GL_MINMAX_SINK_EXT                           8030h
;@@ void ( GLenum target, GLboolean reset, GLenum format, GLenum type, void *values );
glGetHistogramEXT!: alias function! [
	target      [ GLenum! ]
	reset       [ GLboolean! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	values      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat* params );
glGetHistogramParameterfvEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetHistogramParameterivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLboolean reset, GLenum format, GLenum type, void *values );
glGetMinmaxEXT!: alias function! [
	target      [ GLenum! ]
	reset       [ GLboolean! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	values      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat* params );
glGetMinmaxParameterfvEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetMinmaxParameterivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLsizei width, GLenum internalformat, GLboolean sink );
glHistogramEXT!: alias function! [
	target      [ GLenum! ]
	width       [ GLsizei! ]
	internalformat [ GLenum! ]
	sink        [ GLboolean! ]
]
;@@ void ( GLenum target, GLenum internalformat, GLboolean sink );
glMinmaxEXT!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	sink        [ GLboolean! ]
]
;@@ void ( GLenum target );
glResetHistogramEXT!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLenum target );
glResetMinmaxEXT!: alias function! [
	target      [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_index_array_formats
;-------------------------------------------

#define  GL_EXT_index_array_formats                   1


;-------------------------------------------
;-- GL_EXT_index_func
;-------------------------------------------

#define  GL_EXT_index_func                            1
;@@ void ( GLenum func, GLfloat ref );
glIndexFuncEXT!: alias function! [
	func        [ GLenum! ]
	ref         [ GLfloat! ]
]


;-------------------------------------------
;-- GL_EXT_index_material
;-------------------------------------------

#define  GL_EXT_index_material                        1
;@@ void ( GLenum face, GLenum mode );
glIndexMaterialEXT!: alias function! [
	face        [ GLenum! ]
	mode        [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_index_texture
;-------------------------------------------

#define  GL_EXT_index_texture                         1


;-------------------------------------------
;-- GL_EXT_instanced_arrays
;-------------------------------------------

#define  GL_EXT_instanced_arrays                      1
#define  GL_VERTEX_ATTRIB_ARRAY_DIVISOR_EXT           88FEh
;@@ void ( GLuint index, GLuint divisor );
glVertexAttribDivisorEXT!: alias function! [
	index       [ GLuint! ]
	divisor     [ GLuint! ]
]


;-------------------------------------------
;-- GL_EXT_light_texture
;-------------------------------------------

#define  GL_EXT_light_texture                         1
#define  GL_FRAGMENT_MATERIAL_EXT                     8349h
#define  GL_FRAGMENT_NORMAL_EXT                       834Ah
#define  GL_FRAGMENT_COLOR_EXT                        834Ch
#define  GL_ATTENUATION_EXT                           834Dh
#define  GL_SHADOW_ATTENUATION_EXT                    834Eh
#define  GL_TEXTURE_APPLICATION_MODE_EXT              834Fh
#define  GL_TEXTURE_LIGHT_EXT                         8350h
#define  GL_TEXTURE_MATERIAL_FACE_EXT                 8351h
#define  GL_TEXTURE_MATERIAL_PARAMETER_EXT            8352h
;@@ void ( GLenum mode );
glApplyTextureEXT!: alias function! [
	mode        [ GLenum! ]
]
;@@ void ( GLenum pname );
glTextureLightEXT!: alias function! [
	pname       [ GLenum! ]
]
;@@ void ( GLenum face, GLenum mode );
glTextureMaterialEXT!: alias function! [
	face        [ GLenum! ]
	mode        [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_map_buffer_range
;-------------------------------------------

#define  GL_EXT_map_buffer_range                      1
#define  GL_MAP_READ_BIT_EXT                          0001h
#define  GL_MAP_WRITE_BIT_EXT                         0002h
#define  GL_MAP_INVALIDATE_RANGE_BIT_EXT              0004h
#define  GL_MAP_INVALIDATE_BUFFER_BIT_EXT             0008h
#define  GL_MAP_FLUSH_EXPLICIT_BIT_EXT                0010h
#define  GL_MAP_UNSYNCHRONIZED_BIT_EXT                0020h
;@@ void ( GLenum target, GLintptr offset, GLsizeiptr length );
glFlushMappedBufferRangeEXT!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptr! ]
	length      [ GLsizeiptr! ]
]
;@@ void * ( GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access );
glMapBufferRangeEXT!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptr! ]
	length      [ GLsizeiptr! ]
	access      [ GLbitfield! ]
	return: [ pointer! [byte!] ]

]


;-------------------------------------------
;-- GL_EXT_memory_object
;-------------------------------------------

#define  GL_EXT_memory_object                         1
#define  GL_UUID_SIZE_EXT                             16
#define  GL_TEXTURE_TILING_EXT                        9580h
#define  GL_DEDICATED_MEMORY_OBJECT_EXT               9581h
#define  GL_NUM_TILING_TYPES_EXT                      9582h
#define  GL_TILING_TYPES_EXT                          9583h
#define  GL_OPTIMAL_TILING_EXT                        9584h
#define  GL_LINEAR_TILING_EXT                         9585h
#define  GL_LAYOUT_GENERAL_EXT                        958Dh
#define  GL_LAYOUT_COLOR_ATTACHMENT_EXT               958Eh
#define  GL_LAYOUT_DEPTH_STENCIL_ATTACHMENT_EXT       958Fh
#define  GL_LAYOUT_DEPTH_STENCIL_READ_ONLY_EXT        9590h
#define  GL_LAYOUT_SHADER_READ_ONLY_EXT               9591h
#define  GL_LAYOUT_TRANSFER_SRC_EXT                   9592h
#define  GL_LAYOUT_TRANSFER_DST_EXT                   9593h
#define  GL_NUM_DEVICE_UUIDS_EXT                      9596h
#define  GL_DEVICE_UUID_EXT                           9597h
#define  GL_DRIVER_UUID_EXT                           9598h
#define  GL_PROTECTED_MEMORY_OBJECT_EXT               959Bh
;@@ void ( GLenum target, GLsizeiptr size, GLuint memory, GLuint64 offset );
glBufferStorageMemEXT!: alias function! [
	target      [ GLenum! ]
	size        [ GLsizeiptr! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLsizei n, GLuint* memoryObjects );
glCreateMemoryObjectsEXT!: alias function! [
	n           [ GLsizei! ]
	memoryObjects [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, const GLuint* memoryObjects );
glDeleteMemoryObjectsEXT!: alias function! [
	n           [ GLsizei! ]
	memoryObjects [ pointer! [GLuint!] ]
]
;@@ void ( GLuint memoryObject, GLenum pname, GLint* params );
glGetMemoryObjectParameterivEXT!: alias function! [
	memoryObject [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint index, GLubyte* data );
glGetUnsignedBytei_vEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	data        [ pointer! [GLubyte!] ]
]
;@@ void ( GLenum pname, GLubyte* data );
glGetUnsignedBytevEXT!: alias function! [
	pname       [ GLenum! ]
	data        [ pointer! [GLubyte!] ]
]
;@@ GLboolean ( GLuint memoryObject );
glIsMemoryObjectEXT!: alias function! [
	memoryObject [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint memoryObject, GLenum pname, const GLint* params );
glMemoryObjectParameterivEXT!: alias function! [
	memoryObject [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint buffer, GLsizeiptr size, GLuint memory, GLuint64 offset );
glNamedBufferStorageMemEXT!: alias function! [
	buffer      [ GLuint! ]
	size        [ GLsizeiptr! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLenum target, GLsizei levels, GLenum internalFormat, GLsizei width, GLuint memory, GLuint64 offset );
glTexStorageMem1DEXT!: alias function! [
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLenum target, GLsizei levels, GLenum internalFormat, GLsizei width, GLsizei height, GLuint memory, GLuint64 offset );
glTexStorageMem2DEXT!: alias function! [
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLenum target, GLsizei samples, GLenum internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations, GLuint memory, GLuint64 offset );
glTexStorageMem2DMultisampleEXT!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	fixedSampleLocations [ GLboolean! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLenum target, GLsizei levels, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLuint memory, GLuint64 offset );
glTexStorageMem3DEXT!: alias function! [
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLenum target, GLsizei samples, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations, GLuint memory, GLuint64 offset );
glTexStorageMem3DMultisampleEXT!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	fixedSampleLocations [ GLboolean! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLuint texture, GLsizei levels, GLenum internalFormat, GLsizei width, GLuint memory, GLuint64 offset );
glTextureStorageMem1DEXT!: alias function! [
	texture     [ GLuint! ]
	levels      [ GLsizei! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLuint texture, GLsizei levels, GLenum internalFormat, GLsizei width, GLsizei height, GLuint memory, GLuint64 offset );
glTextureStorageMem2DEXT!: alias function! [
	texture     [ GLuint! ]
	levels      [ GLsizei! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLuint texture, GLsizei samples, GLenum internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations, GLuint memory, GLuint64 offset );
glTextureStorageMem2DMultisampleEXT!: alias function! [
	texture     [ GLuint! ]
	samples     [ GLsizei! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	fixedSampleLocations [ GLboolean! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLuint texture, GLsizei levels, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLuint memory, GLuint64 offset );
glTextureStorageMem3DEXT!: alias function! [
	texture     [ GLuint! ]
	levels      [ GLsizei! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]
;@@ void ( GLuint texture, GLsizei samples, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations, GLuint memory, GLuint64 offset );
glTextureStorageMem3DMultisampleEXT!: alias function! [
	texture     [ GLuint! ]
	samples     [ GLsizei! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	fixedSampleLocations [ GLboolean! ]
	memory      [ GLuint! ]
	offset      [ GLuint64! ]
]


;-------------------------------------------
;-- GL_EXT_memory_object_fd
;-------------------------------------------

#define  GL_EXT_memory_object_fd                      1
#define  GL_HANDLE_TYPE_OPAQUE_FD_EXT                 9586h
;@@ void ( GLuint memory, GLuint64 size, GLenum handleType, GLint fd );
glImportMemoryFdEXT!: alias function! [
	memory      [ GLuint! ]
	size        [ GLuint64! ]
	handleType  [ GLenum! ]
	fd          [ GLint! ]
]


;-------------------------------------------
;-- GL_EXT_memory_object_win32
;-------------------------------------------

#define  GL_EXT_memory_object_win32                   1
#define  GL_LUID_SIZE_EXT                             8
#define  GL_HANDLE_TYPE_OPAQUE_WIN32_EXT              9587h
#define  GL_HANDLE_TYPE_OPAQUE_WIN32_KMT_EXT          9588h
#define  GL_HANDLE_TYPE_D3D12_TILEPOOL_EXT            9589h
#define  GL_HANDLE_TYPE_D3D12_RESOURCE_EXT            958Ah
#define  GL_HANDLE_TYPE_D3D11_IMAGE_EXT               958Bh
#define  GL_HANDLE_TYPE_D3D11_IMAGE_KMT_EXT           958Ch
#define  GL_HANDLE_TYPE_D3D12_FENCE_EXT               9594h
#define  GL_D3D12_FENCE_VALUE_EXT                     9595h
#define  GL_DEVICE_LUID_EXT                           9599h
#define  GL_DEVICE_NODE_MASK_EXT                      959Ah
;@@ void ( GLuint memory, GLuint64 size, GLenum handleType, void *handle );
glImportMemoryWin32HandleEXT!: alias function! [
	memory      [ GLuint! ]
	size        [ GLuint64! ]
	handleType  [ GLenum! ]
	handle      [ pointer! [byte!] ]
]
;@@ void ( GLuint memory, GLuint64 size, GLenum handleType, const void *name );
glImportMemoryWin32NameEXT!: alias function! [
	memory      [ GLuint! ]
	size        [ GLuint64! ]
	handleType  [ GLenum! ]
	name        [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_misc_attribute
;-------------------------------------------

#define  GL_EXT_misc_attribute                        1


;-------------------------------------------
;-- GL_EXT_multi_draw_arrays
;-------------------------------------------

#define  GL_EXT_multi_draw_arrays                     1
;@@ void ( GLenum mode, const GLint* first, const GLsizei *count, GLsizei primcount );
glMultiDrawArraysEXT!: alias function! [
	mode        [ GLenum! ]
	first       [ pointer! [GLint!] ]
	count       [ pointer! [GLsizei!] ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLenum mode, GLsizei* count, GLenum type, const void *const *indices, GLsizei primcount );
glMultiDrawElementsEXT!: alias function! [
	mode        [ GLenum! ]
	count       [ pointer! [GLsizei!] ]
	type        [ GLenum! ]
	indices     [ binary-ptr! ]
	primcount   [ GLsizei! ]
]


;-------------------------------------------
;-- GL_EXT_multi_draw_indirect
;-------------------------------------------

#define  GL_EXT_multi_draw_indirect                   1
;@@ void ( GLenum mode, const void *indirect, GLsizei drawcount, GLsizei stride );
glMultiDrawArraysIndirectEXT!: alias function! [
	mode        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	drawcount   [ GLsizei! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLenum mode, GLenum type, const void *indirect, GLsizei drawcount, GLsizei stride );
glMultiDrawElementsIndirectEXT!: alias function! [
	mode        [ GLenum! ]
	type        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	drawcount   [ GLsizei! ]
	stride      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_EXT_multiple_textures
;-------------------------------------------

#define  GL_EXT_multiple_textures                     1


;-------------------------------------------
;-- GL_EXT_multisample
;-------------------------------------------

#define  GL_EXT_multisample                           1
#define  GL_MULTISAMPLE_EXT                           809Dh
#define  GL_SAMPLE_ALPHA_TO_MASK_EXT                  809Eh
#define  GL_SAMPLE_ALPHA_TO_ONE_EXT                   809Fh
#define  GL_SAMPLE_MASK_EXT                           80A0h
#define  GL_1PASS_EXT                                 80A1h
#define  GL_2PASS_0_EXT                               80A2h
#define  GL_2PASS_1_EXT                               80A3h
#define  GL_4PASS_0_EXT                               80A4h
#define  GL_4PASS_1_EXT                               80A5h
#define  GL_4PASS_2_EXT                               80A6h
#define  GL_4PASS_3_EXT                               80A7h
#define  GL_SAMPLE_BUFFERS_EXT                        80A8h
#define  GL_SAMPLES_EXT                               80A9h
#define  GL_SAMPLE_MASK_VALUE_EXT                     80AAh
#define  GL_SAMPLE_MASK_INVERT_EXT                    80ABh
#define  GL_SAMPLE_PATTERN_EXT                        80ACh
#define  GL_MULTISAMPLE_BIT_EXT                       20000000h
;@@ void ( GLclampf value, GLboolean invert );
glSampleMaskEXT!: alias function! [
	value       [ GLclampf! ]
	invert      [ GLboolean! ]
]
;@@ void ( GLenum pattern );
glSamplePatternEXT!: alias function! [
	pattern     [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_multisample_compatibility
;-------------------------------------------

#define  GL_EXT_multisample_compatibility             1
;#define  GL_MULTISAMPLE_EXT                           809Dh
;#define  GL_SAMPLE_ALPHA_TO_ONE_EXT                   809Fh


;-------------------------------------------
;-- GL_EXT_multisampled_render_to_texture
;-------------------------------------------

#define  GL_EXT_multisampled_render_to_texture        1
;#define  GL_RENDERBUFFER_SAMPLES_EXT                  8CABh
;#define  GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT    8D56h
;#define  GL_MAX_SAMPLES_EXT                           8D57h
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_SAMPLES_EXT  8D6Ch
;@@ void ( GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLsizei samples );
glFramebufferTexture2DMultisampleEXT!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	textarget   [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	samples     [ GLsizei! ]
]


;-------------------------------------------
;-- GL_EXT_multisampled_render_to_texture2
;-------------------------------------------

#define  GL_EXT_multisampled_render_to_texture2       1


;-------------------------------------------
;-- GL_EXT_multiview_draw_buffers
;-------------------------------------------

#define  GL_EXT_multiview_draw_buffers                1
#define  GL_DRAW_BUFFER_EXT                           0C01h
#define  GL_READ_BUFFER_EXT                           0C02h
#define  GL_COLOR_ATTACHMENT_EXT                      90F0h
#define  GL_MULTIVIEW_EXT                             90F1h
#define  GL_MAX_MULTIVIEW_BUFFERS_EXT                 90F2h
;@@ void ( GLint n, const GLenum* location, const GLint *indices );
glDrawBuffersIndexedEXT!: alias function! [
	n           [ GLint! ]
	location    [ pointer! [GLenum!] ]
	indices     [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint index, GLint* data );
glGetIntegeri_vEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	data        [ pointer! [GLint!] ]
]
;@@ void ( GLenum src, GLint index );
glReadBufferIndexedEXT!: alias function! [
	src         [ GLenum! ]
	index       [ GLint! ]
]


;-------------------------------------------
;-- GL_EXT_packed_depth_stencil
;-------------------------------------------

#define  GL_EXT_packed_depth_stencil                  1
#define  GL_DEPTH_STENCIL_EXT                         84F9h
#define  GL_UNSIGNED_INT_24_8_EXT                     84FAh
#define  GL_DEPTH24_STENCIL8_EXT                      88F0h
#define  GL_TEXTURE_STENCIL_SIZE_EXT                  88F1h


;-------------------------------------------
;-- GL_EXT_packed_float
;-------------------------------------------

#define  GL_EXT_packed_float                          1
#define  GL_R11F_G11F_B10F_EXT                        8C3Ah
#define  GL_UNSIGNED_INT_10F_11F_11F_REV_EXT          8C3Bh
#define  GL_RGBA_SIGNED_COMPONENTS_EXT                8C3Ch


;-------------------------------------------
;-- GL_EXT_packed_pixels
;-------------------------------------------

#define  GL_EXT_packed_pixels                         1
#define  GL_UNSIGNED_BYTE_3_3_2_EXT                   8032h
#define  GL_UNSIGNED_SHORT_4_4_4_4_EXT                8033h
#define  GL_UNSIGNED_SHORT_5_5_5_1_EXT                8034h
#define  GL_UNSIGNED_INT_8_8_8_8_EXT                  8035h
#define  GL_UNSIGNED_INT_10_10_10_2_EXT               8036h


;-------------------------------------------
;-- GL_EXT_paletted_texture
;-------------------------------------------

#define  GL_EXT_paletted_texture                      1
;#define  GL_TEXTURE_1D                                0DE0h
;#define  GL_TEXTURE_2D                                0DE1h
;#define  GL_PROXY_TEXTURE_1D                          8063h
;#define  GL_PROXY_TEXTURE_2D                          8064h
#define  GL_COLOR_TABLE_FORMAT_EXT                    80D8h
#define  GL_COLOR_TABLE_WIDTH_EXT                     80D9h
#define  GL_COLOR_TABLE_RED_SIZE_EXT                  80DAh
#define  GL_COLOR_TABLE_GREEN_SIZE_EXT                80DBh
#define  GL_COLOR_TABLE_BLUE_SIZE_EXT                 80DCh
#define  GL_COLOR_TABLE_ALPHA_SIZE_EXT                80DDh
#define  GL_COLOR_TABLE_LUMINANCE_SIZE_EXT            80DEh
#define  GL_COLOR_TABLE_INTENSITY_SIZE_EXT            80DFh
;#define  GL_COLOR_INDEX1_EXT                          80E2h
;#define  GL_COLOR_INDEX2_EXT                          80E3h
;#define  GL_COLOR_INDEX4_EXT                          80E4h
;#define  GL_COLOR_INDEX8_EXT                          80E5h
;#define  GL_COLOR_INDEX12_EXT                         80E6h
;#define  GL_COLOR_INDEX16_EXT                         80E7h
#define  GL_TEXTURE_INDEX_SIZE_EXT                    80EDh
;#define  GL_TEXTURE_CUBE_MAP_ARB                      8513h
;#define  GL_PROXY_TEXTURE_CUBE_MAP_ARB                851Bh
;@@ void ( GLenum target, GLenum internalFormat, GLsizei width, GLenum format, GLenum type, const void *data );
glColorTableEXT!: alias function! [
	target      [ GLenum! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum format, GLenum type, void *data );
glGetColorTableEXT!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat* params );
glGetColorTableParameterfvEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetColorTableParameterivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_EXT_pixel_buffer_object
;-------------------------------------------

#define  GL_EXT_pixel_buffer_object                   1
#define  GL_PIXEL_PACK_BUFFER_EXT                     88EBh
#define  GL_PIXEL_UNPACK_BUFFER_EXT                   88ECh
#define  GL_PIXEL_PACK_BUFFER_BINDING_EXT             88EDh
#define  GL_PIXEL_UNPACK_BUFFER_BINDING_EXT           88EFh


;-------------------------------------------
;-- GL_EXT_pixel_transform
;-------------------------------------------

#define  GL_EXT_pixel_transform                       1
#define  GL_PIXEL_TRANSFORM_2D_EXT                    8330h
#define  GL_PIXEL_MAG_FILTER_EXT                      8331h
#define  GL_PIXEL_MIN_FILTER_EXT                      8332h
#define  GL_PIXEL_CUBIC_WEIGHT_EXT                    8333h
#define  GL_CUBIC_EXT                                 8334h
#define  GL_AVERAGE_EXT                               8335h
#define  GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT        8336h
#define  GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT    8337h
#define  GL_PIXEL_TRANSFORM_2D_MATRIX_EXT             8338h
;@@ void ( GLenum target, GLenum pname, const GLfloat* params );
glGetPixelTransformParameterfvEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLint* params );
glGetPixelTransformParameterivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLfloat param );
glPixelTransformParameterfEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum target, GLenum pname, const GLfloat* params );
glPixelTransformParameterfvEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLint param );
glPixelTransformParameteriEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum target, GLenum pname, const GLint* params );
glPixelTransformParameterivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_EXT_pixel_transform_color_table
;-------------------------------------------

#define  GL_EXT_pixel_transform_color_table           1


;-------------------------------------------
;-- GL_EXT_point_parameters
;-------------------------------------------

#define  GL_EXT_point_parameters                      1
#define  GL_POINT_SIZE_MIN_EXT                        8126h
#define  GL_POINT_SIZE_MAX_EXT                        8127h
#define  GL_POINT_FADE_THRESHOLD_SIZE_EXT             8128h
#define  GL_DISTANCE_ATTENUATION_EXT                  8129h
;@@ void ( GLenum pname, GLfloat param );
glPointParameterfEXT!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum pname, const GLfloat* params );
glPointParameterfvEXT!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_EXT_polygon_offset
;-------------------------------------------

#define  GL_EXT_polygon_offset                        1
#define  GL_POLYGON_OFFSET_EXT                        8037h
#define  GL_POLYGON_OFFSET_FACTOR_EXT                 8038h
#define  GL_POLYGON_OFFSET_BIAS_EXT                   8039h
;@@ void ( GLfloat factor, GLfloat bias );
glPolygonOffsetEXT!: alias function! [
	factor      [ GLfloat! ]
	bias        [ GLfloat! ]
]


;-------------------------------------------
;-- GL_EXT_polygon_offset_clamp
;-------------------------------------------

#define  GL_EXT_polygon_offset_clamp                  1
#define  GL_POLYGON_OFFSET_CLAMP_EXT                  8E1Bh
;@@ void ( GLfloat factor, GLfloat units, GLfloat clamp );
glPolygonOffsetClampEXT!: alias function! [
	factor      [ GLfloat! ]
	units       [ GLfloat! ]
	clamp       [ GLfloat! ]
]


;-------------------------------------------
;-- GL_EXT_post_depth_coverage
;-------------------------------------------

#define  GL_EXT_post_depth_coverage                   1


;-------------------------------------------
;-- GL_EXT_provoking_vertex
;-------------------------------------------

#define  GL_EXT_provoking_vertex                      1
#define  GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION_EXT  8E4Ch
;#define  GL_FIRST_VERTEX_CONVENTION_EXT               8E4Dh
;#define  GL_LAST_VERTEX_CONVENTION_EXT                8E4Eh
#define  GL_PROVOKING_VERTEX_EXT                      8E4Fh
;@@ void ( GLenum mode );
glProvokingVertexEXT!: alias function! [
	mode        [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_pvrtc_sRGB
;-------------------------------------------

#define  GL_EXT_pvrtc_sRGB                            1
#define  GL_COMPRESSED_SRGB_PVRTC_2BPPV1_EXT          8A54h
#define  GL_COMPRESSED_SRGB_PVRTC_4BPPV1_EXT          8A55h
#define  GL_COMPRESSED_SRGB_ALPHA_PVRTC_2BPPV1_EXT    8A56h
#define  GL_COMPRESSED_SRGB_ALPHA_PVRTC_4BPPV1_EXT    8A57h


;-------------------------------------------
;-- GL_EXT_raster_multisample
;-------------------------------------------

#define  GL_EXT_raster_multisample                    1
#define  GL_COLOR_SAMPLES_NV                          8E20h
#define  GL_RASTER_MULTISAMPLE_EXT                    9327h
#define  GL_RASTER_SAMPLES_EXT                        9328h
#define  GL_MAX_RASTER_SAMPLES_EXT                    9329h
#define  GL_RASTER_FIXED_SAMPLE_LOCATIONS_EXT         932Ah
#define  GL_MULTISAMPLE_RASTERIZATION_ALLOWED_EXT     932Bh
#define  GL_EFFECTIVE_RASTER_SAMPLES_EXT              932Ch
#define  GL_DEPTH_SAMPLES_NV                          932Dh
#define  GL_STENCIL_SAMPLES_NV                        932Eh
#define  GL_MIXED_DEPTH_SAMPLES_SUPPORTED_NV          932Fh
#define  GL_MIXED_STENCIL_SAMPLES_SUPPORTED_NV        9330h
#define  GL_COVERAGE_MODULATION_TABLE_NV              9331h
#define  GL_COVERAGE_MODULATION_NV                    9332h
#define  GL_COVERAGE_MODULATION_TABLE_SIZE_NV         9333h
;@@ void ( GLenum components );
glCoverageModulationNV!: alias function! [
	components  [ GLenum! ]
]
;@@ void ( GLsizei n, const GLfloat* v );
glCoverageModulationTableNV!: alias function! [
	n           [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLsizei bufsize, GLfloat* v );
glGetCoverageModulationTableNV!: alias function! [
	bufsize     [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint samples, GLboolean fixedsamplelocations );
glRasterSamplesEXT!: alias function! [
	samples     [ GLuint! ]
	fixedsamplelocations [ GLboolean! ]
]


;-------------------------------------------
;-- GL_EXT_read_format_bgra
;-------------------------------------------

#define  GL_EXT_read_format_bgra                      1
;#define  GL_BGRA_EXT                                  80E1h
#define  GL_UNSIGNED_SHORT_4_4_4_4_REV_EXT            8365h
#define  GL_UNSIGNED_SHORT_1_5_5_5_REV_EXT            8366h


;-------------------------------------------
;-- GL_EXT_render_snorm
;-------------------------------------------

#define  GL_EXT_render_snorm                          1
;#define  GL_BYTE                                      1400h
;#define  GL_SHORT                                     1402h
;#define  GL_R8_SNORM                                  8F94h
;#define  GL_RG8_SNORM                                 8F95h
;#define  GL_RGBA8_SNORM                               8F97h
#define  GL_R16_SNORM_EXT                             8F98h
#define  GL_RG16_SNORM_EXT                            8F99h
#define  GL_RGBA16_SNORM_EXT                          8F9Bh


;-------------------------------------------
;-- GL_EXT_rescale_normal
;-------------------------------------------

#define  GL_EXT_rescale_normal                        1
#define  GL_RESCALE_NORMAL_EXT                        803Ah


;-------------------------------------------
;-- GL_EXT_sRGB
;-------------------------------------------

#define  GL_EXT_sRGB                                  1
#define  GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT  8210h
#define  GL_SRGB_EXT                                  8C40h
#define  GL_SRGB_ALPHA_EXT                            8C42h
#define  GL_SRGB8_ALPHA8_EXT                          8C43h


;-------------------------------------------
;-- GL_EXT_sRGB_write_control
;-------------------------------------------

#define  GL_EXT_sRGB_write_control                    1
;#define  GL_FRAMEBUFFER_SRGB_EXT                      8DB9h


;-------------------------------------------
;-- GL_EXT_scene_marker
;-------------------------------------------

#define  GL_EXT_scene_marker                          1
;@@ void ( void );
glBeginSceneEXT!: alias function! [
]
;@@ void ( void );
glEndSceneEXT!: alias function! [
]


;-------------------------------------------
;-- GL_EXT_secondary_color
;-------------------------------------------

#define  GL_EXT_secondary_color                       1
#define  GL_COLOR_SUM_EXT                             8458h
#define  GL_CURRENT_SECONDARY_COLOR_EXT               8459h
#define  GL_SECONDARY_COLOR_ARRAY_SIZE_EXT            845Ah
#define  GL_SECONDARY_COLOR_ARRAY_TYPE_EXT            845Bh
#define  GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT          845Ch
#define  GL_SECONDARY_COLOR_ARRAY_POINTER_EXT         845Dh
#define  GL_SECONDARY_COLOR_ARRAY_EXT                 845Eh
;@@ void ( GLbyte red, GLbyte green, GLbyte blue );
glSecondaryColor3bEXT!: alias function! [
	red         [ GLbyte! ]
	green       [ GLbyte! ]
	blue        [ GLbyte! ]
]
;@@ void ( const GLbyte *v );
glSecondaryColor3bvEXT!: alias function! [
	v           [ pointer! [GLbyte!] ]
]
;@@ void ( GLdouble red, GLdouble green, GLdouble blue );
glSecondaryColor3dEXT!: alias function! [
	red         [ GLdouble! ]
	green       [ GLdouble! ]
	blue        [ GLdouble! ]
]
;@@ void ( const GLdouble *v );
glSecondaryColor3dvEXT!: alias function! [
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat red, GLfloat green, GLfloat blue );
glSecondaryColor3fEXT!: alias function! [
	red         [ GLfloat! ]
	green       [ GLfloat! ]
	blue        [ GLfloat! ]
]
;@@ void ( const GLfloat *v );
glSecondaryColor3fvEXT!: alias function! [
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLint red, GLint green, GLint blue );
glSecondaryColor3iEXT!: alias function! [
	red         [ GLint! ]
	green       [ GLint! ]
	blue        [ GLint! ]
]
;@@ void ( const GLint *v );
glSecondaryColor3ivEXT!: alias function! [
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLshort red, GLshort green, GLshort blue );
glSecondaryColor3sEXT!: alias function! [
	red         [ GLshort! ]
	green       [ GLshort! ]
	blue        [ GLshort! ]
]
;@@ void ( const GLshort *v );
glSecondaryColor3svEXT!: alias function! [
	v           [ GLshort-ptr! ]
]
;@@ void ( GLubyte red, GLubyte green, GLubyte blue );
glSecondaryColor3ubEXT!: alias function! [
	red         [ GLubyte! ]
	green       [ GLubyte! ]
	blue        [ GLubyte! ]
]
;@@ void ( const GLubyte *v );
glSecondaryColor3ubvEXT!: alias function! [
	v           [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint red, GLuint green, GLuint blue );
glSecondaryColor3uiEXT!: alias function! [
	red         [ GLuint! ]
	green       [ GLuint! ]
	blue        [ GLuint! ]
]
;@@ void ( const GLuint *v );
glSecondaryColor3uivEXT!: alias function! [
	v           [ pointer! [GLuint!] ]
]
;@@ void ( GLushort red, GLushort green, GLushort blue );
glSecondaryColor3usEXT!: alias function! [
	red         [ GLushort! ]
	green       [ GLushort! ]
	blue        [ GLushort! ]
]
;@@ void ( const GLushort *v );
glSecondaryColor3usvEXT!: alias function! [
	v           [ GLushort-ptr! ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride, const void *pointer );
glSecondaryColorPointerEXT!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_semaphore
;-------------------------------------------

#define  GL_EXT_semaphore                             1
;@@ void ( GLsizei n, const GLuint* semaphores );
glDeleteSemaphoresEXT!: alias function! [
	n           [ GLsizei! ]
	semaphores  [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* semaphores );
glGenSemaphoresEXT!: alias function! [
	n           [ GLsizei! ]
	semaphores  [ pointer! [GLuint!] ]
]
;@@ void ( GLuint semaphore, GLenum pname, GLuint64* params );
glGetSemaphoreParameterui64vEXT!: alias function! [
	semaphore   [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLuint64-ptr! ]
]
;@@ GLboolean ( GLuint semaphore );
glIsSemaphoreEXT!: alias function! [
	semaphore   [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint semaphore, GLenum pname, const GLuint64* params );
glSemaphoreParameterui64vEXT!: alias function! [
	semaphore   [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLuint64-ptr! ]
]
;@@ void ( GLuint semaphore, GLuint numBufferBarriers, const GLuint* buffers, GLuint numTextureBarriers, const GLuint *textures, const GLenum *dstLayouts );
glSignalSemaphoreEXT!: alias function! [
	semaphore   [ GLuint! ]
	numBufferBarriers [ GLuint! ]
	buffers     [ pointer! [GLuint!] ]
	numTextureBarriers [ GLuint! ]
	textures    [ pointer! [GLuint!] ]
	dstLayouts  [ pointer! [GLenum!] ]
]
;@@ void ( GLuint semaphore, GLuint numBufferBarriers, const GLuint* buffers, GLuint numTextureBarriers, const GLuint *textures, const GLenum *srcLayouts );
glWaitSemaphoreEXT!: alias function! [
	semaphore   [ GLuint! ]
	numBufferBarriers [ GLuint! ]
	buffers     [ pointer! [GLuint!] ]
	numTextureBarriers [ GLuint! ]
	textures    [ pointer! [GLuint!] ]
	srcLayouts  [ pointer! [GLenum!] ]
]


;-------------------------------------------
;-- GL_EXT_semaphore_fd
;-------------------------------------------

#define  GL_EXT_semaphore_fd                          1
;@@ void ( GLuint semaphore, GLenum handleType, GLint fd );
glImportSemaphoreFdEXT!: alias function! [
	semaphore   [ GLuint! ]
	handleType  [ GLenum! ]
	fd          [ GLint! ]
]


;-------------------------------------------
;-- GL_EXT_semaphore_win32
;-------------------------------------------

#define  GL_EXT_semaphore_win32                       1
;@@ void ( GLuint semaphore, GLenum handleType, void *handle );
glImportSemaphoreWin32HandleEXT!: alias function! [
	semaphore   [ GLuint! ]
	handleType  [ GLenum! ]
	handle      [ pointer! [byte!] ]
]
;@@ void ( GLuint semaphore, GLenum handleType, const void *name );
glImportSemaphoreWin32NameEXT!: alias function! [
	semaphore   [ GLuint! ]
	handleType  [ GLenum! ]
	name        [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_separate_shader_objects
;-------------------------------------------

#define  GL_EXT_separate_shader_objects               1
#define  GL_ACTIVE_PROGRAM_EXT                        8B8Dh
;@@ void ( GLuint program );
glActiveProgramEXT!: alias function! [
	program     [ GLuint! ]
]
;@@ GLuint ( GLenum type, const GLchar* string );
glCreateShaderProgramEXT!: alias function! [
	type        [ GLenum! ]
	string      [ GLstring! ]
	return: [ GLuint! ]

]
;@@ void ( GLenum type, GLuint program );
glUseShaderProgramEXT!: alias function! [
	type        [ GLenum! ]
	program     [ GLuint! ]
]


;-------------------------------------------
;-- GL_EXT_separate_specular_color
;-------------------------------------------

#define  GL_EXT_separate_specular_color               1
#define  GL_LIGHT_MODEL_COLOR_CONTROL_EXT             81F8h
#define  GL_SINGLE_COLOR_EXT                          81F9h
#define  GL_SEPARATE_SPECULAR_COLOR_EXT               81FAh


;-------------------------------------------
;-- GL_EXT_shader_framebuffer_fetch
;-------------------------------------------

#define  GL_EXT_shader_framebuffer_fetch              1
#define  GL_FRAGMENT_SHADER_DISCARDS_SAMPLES_EXT      8A52h


;-------------------------------------------
;-- GL_EXT_shader_group_vote
;-------------------------------------------

#define  GL_EXT_shader_group_vote                     1


;-------------------------------------------
;-- GL_EXT_shader_image_load_formatted
;-------------------------------------------

#define  GL_EXT_shader_image_load_formatted           1


;-------------------------------------------
;-- GL_EXT_shader_image_load_store
;-------------------------------------------

#define  GL_EXT_shader_image_load_store               1
#define  GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT_EXT       00000001h
#define  GL_ELEMENT_ARRAY_BARRIER_BIT_EXT             00000002h
#define  GL_UNIFORM_BARRIER_BIT_EXT                   00000004h
#define  GL_TEXTURE_FETCH_BARRIER_BIT_EXT             00000008h
#define  GL_SHADER_IMAGE_ACCESS_BARRIER_BIT_EXT       00000020h
#define  GL_COMMAND_BARRIER_BIT_EXT                   00000040h
#define  GL_PIXEL_BUFFER_BARRIER_BIT_EXT              00000080h
#define  GL_TEXTURE_UPDATE_BARRIER_BIT_EXT            00000100h
#define  GL_BUFFER_UPDATE_BARRIER_BIT_EXT             00000200h
#define  GL_FRAMEBUFFER_BARRIER_BIT_EXT               00000400h
#define  GL_TRANSFORM_FEEDBACK_BARRIER_BIT_EXT        00000800h
#define  GL_ATOMIC_COUNTER_BARRIER_BIT_EXT            00001000h
#define  GL_MAX_IMAGE_UNITS_EXT                       8F38h
#define  GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS_EXT  8F39h
#define  GL_IMAGE_BINDING_NAME_EXT                    8F3Ah
#define  GL_IMAGE_BINDING_LEVEL_EXT                   8F3Bh
#define  GL_IMAGE_BINDING_LAYERED_EXT                 8F3Ch
#define  GL_IMAGE_BINDING_LAYER_EXT                   8F3Dh
#define  GL_IMAGE_BINDING_ACCESS_EXT                  8F3Eh
#define  GL_IMAGE_1D_EXT                              904Ch
#define  GL_IMAGE_2D_EXT                              904Dh
#define  GL_IMAGE_3D_EXT                              904Eh
#define  GL_IMAGE_2D_RECT_EXT                         904Fh
#define  GL_IMAGE_CUBE_EXT                            9050h
#define  GL_IMAGE_BUFFER_EXT                          9051h
#define  GL_IMAGE_1D_ARRAY_EXT                        9052h
#define  GL_IMAGE_2D_ARRAY_EXT                        9053h
#define  GL_IMAGE_CUBE_MAP_ARRAY_EXT                  9054h
#define  GL_IMAGE_2D_MULTISAMPLE_EXT                  9055h
#define  GL_IMAGE_2D_MULTISAMPLE_ARRAY_EXT            9056h
#define  GL_INT_IMAGE_1D_EXT                          9057h
#define  GL_INT_IMAGE_2D_EXT                          9058h
#define  GL_INT_IMAGE_3D_EXT                          9059h
#define  GL_INT_IMAGE_2D_RECT_EXT                     905Ah
#define  GL_INT_IMAGE_CUBE_EXT                        905Bh
#define  GL_INT_IMAGE_BUFFER_EXT                      905Ch
#define  GL_INT_IMAGE_1D_ARRAY_EXT                    905Dh
#define  GL_INT_IMAGE_2D_ARRAY_EXT                    905Eh
#define  GL_INT_IMAGE_CUBE_MAP_ARRAY_EXT              905Fh
#define  GL_INT_IMAGE_2D_MULTISAMPLE_EXT              9060h
#define  GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT        9061h
#define  GL_UNSIGNED_INT_IMAGE_1D_EXT                 9062h
#define  GL_UNSIGNED_INT_IMAGE_2D_EXT                 9063h
#define  GL_UNSIGNED_INT_IMAGE_3D_EXT                 9064h
#define  GL_UNSIGNED_INT_IMAGE_2D_RECT_EXT            9065h
#define  GL_UNSIGNED_INT_IMAGE_CUBE_EXT               9066h
#define  GL_UNSIGNED_INT_IMAGE_BUFFER_EXT             9067h
#define  GL_UNSIGNED_INT_IMAGE_1D_ARRAY_EXT           9068h
#define  GL_UNSIGNED_INT_IMAGE_2D_ARRAY_EXT           9069h
#define  GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY_EXT     906Ah
#define  GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_EXT     906Bh
#define  GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT  906Ch
#define  GL_MAX_IMAGE_SAMPLES_EXT                     906Dh
#define  GL_IMAGE_BINDING_FORMAT_EXT                  906Eh
#define  GL_ALL_BARRIER_BITS_EXT                      FFFFFFFFh
;@@ void ( GLuint index, GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum access, GLint format );
glBindImageTextureEXT!: alias function! [
	index       [ GLuint! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	layered     [ GLboolean! ]
	layer       [ GLint! ]
	access      [ GLenum! ]
	format      [ GLint! ]
]
;@@ void ( GLbitfield barriers );
glMemoryBarrierEXT!: alias function! [
	barriers    [ GLbitfield! ]
]


;-------------------------------------------
;-- GL_EXT_shader_implicit_conversions
;-------------------------------------------

#define  GL_EXT_shader_implicit_conversions           1


;-------------------------------------------
;-- GL_EXT_shader_integer_mix
;-------------------------------------------

#define  GL_EXT_shader_integer_mix                    1


;-------------------------------------------
;-- GL_EXT_shader_io_blocks
;-------------------------------------------

#define  GL_EXT_shader_io_blocks                      1


;-------------------------------------------
;-- GL_EXT_shader_non_constant_global_initializers
;-------------------------------------------

#define  GL_EXT_shader_non_constant_global_initializers  1


;-------------------------------------------
;-- GL_EXT_shader_pixel_local_storage
;-------------------------------------------

#define  GL_EXT_shader_pixel_local_storage            1
#define  GL_MAX_SHADER_PIXEL_LOCAL_STORAGE_FAST_SIZE_EXT  8F63h
#define  GL_SHADER_PIXEL_LOCAL_STORAGE_EXT            8F64h
#define  GL_MAX_SHADER_PIXEL_LOCAL_STORAGE_SIZE_EXT   8F67h


;-------------------------------------------
;-- GL_EXT_shader_pixel_local_storage2
;-------------------------------------------

#define  GL_EXT_shader_pixel_local_storage2           1
#define  GL_MAX_SHADER_COMBINED_LOCAL_STORAGE_FAST_SIZE_EXT  9650h
#define  GL_MAX_SHADER_COMBINED_LOCAL_STORAGE_SIZE_EXT  9651h
#define  GL_FRAMEBUFFER_INCOMPLETE_INSUFFICIENT_SHADER_COMBINED_LOCAL_STORAGE_EXT  9652h
;@@ void ( GLsizei offset, GLsizei n, const GLuint* values );
glClearPixelLocalStorageuiEXT!: alias function! [
	offset      [ GLsizei! ]
	n           [ GLsizei! ]
	values      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint target, GLsizei size );
glFramebufferPixelLocalStorageSizeEXT!: alias function! [
	target      [ GLuint! ]
	size        [ GLsizei! ]
]
;@@ GLsizei ( GLuint target );
glGetFramebufferPixelLocalStorageSizeEXT!: alias function! [
	target      [ GLuint! ]
	return: [ GLsizei! ]

]


;-------------------------------------------
;-- GL_EXT_shader_texture_lod
;-------------------------------------------

#define  GL_EXT_shader_texture_lod                    1


;-------------------------------------------
;-- GL_EXT_shadow_funcs
;-------------------------------------------

#define  GL_EXT_shadow_funcs                          1


;-------------------------------------------
;-- GL_EXT_shadow_samplers
;-------------------------------------------

#define  GL_EXT_shadow_samplers                       1
#define  GL_TEXTURE_COMPARE_MODE_EXT                  884Ch
#define  GL_TEXTURE_COMPARE_FUNC_EXT                  884Dh
#define  GL_COMPARE_REF_TO_TEXTURE_EXT                884Eh
#define  GL_SAMPLER_2D_SHADOW_EXT                     8B62h


;-------------------------------------------
;-- GL_EXT_shared_texture_palette
;-------------------------------------------

#define  GL_EXT_shared_texture_palette                1
#define  GL_SHARED_TEXTURE_PALETTE_EXT                81FBh


;-------------------------------------------
;-- GL_EXT_sparse_texture
;-------------------------------------------

#define  GL_EXT_sparse_texture                        1
;#define  GL_TEXTURE_2D                                0DE1h
;#define  GL_TEXTURE_3D                                806Fh
;#define  GL_TEXTURE_CUBE_MAP                          8513h
;#define  GL_TEXTURE_2D_ARRAY                          8C1Ah
#define  GL_TEXTURE_CUBE_MAP_ARRAY_OES                9009h
#define  GL_VIRTUAL_PAGE_SIZE_X_EXT                   9195h
#define  GL_VIRTUAL_PAGE_SIZE_Y_EXT                   9196h
#define  GL_VIRTUAL_PAGE_SIZE_Z_EXT                   9197h
#define  GL_MAX_SPARSE_TEXTURE_SIZE_EXT               9198h
#define  GL_MAX_SPARSE_3D_TEXTURE_SIZE_EXT            9199h
#define  GL_MAX_SPARSE_ARRAY_TEXTURE_LAYERS_EXT       919Ah
#define  GL_TEXTURE_SPARSE_EXT                        91A6h
#define  GL_VIRTUAL_PAGE_SIZE_INDEX_EXT               91A7h
#define  GL_NUM_VIRTUAL_PAGE_SIZES_EXT                91A8h
#define  GL_SPARSE_TEXTURE_FULL_ARRAY_CUBE_MIPMAPS_EXT  91A9h
#define  GL_NUM_SPARSE_LEVELS_EXT                     91AAh
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLboolean commit );
glTexPageCommitmentEXT!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	commit      [ GLboolean! ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLboolean commit );
glTexturePageCommitmentEXT!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	commit      [ GLboolean! ]
]


;-------------------------------------------
;-- GL_EXT_sparse_texture2
;-------------------------------------------

#define  GL_EXT_sparse_texture2                       1


;-------------------------------------------
;-- GL_EXT_stencil_clear_tag
;-------------------------------------------

#define  GL_EXT_stencil_clear_tag                     1
#define  GL_STENCIL_TAG_BITS_EXT                      88F2h
#define  GL_STENCIL_CLEAR_TAG_VALUE_EXT               88F3h


;-------------------------------------------
;-- GL_EXT_stencil_two_side
;-------------------------------------------

#define  GL_EXT_stencil_two_side                      1
#define  GL_STENCIL_TEST_TWO_SIDE_EXT                 8910h
#define  GL_ACTIVE_STENCIL_FACE_EXT                   8911h
;@@ void ( GLenum face );
glActiveStencilFaceEXT!: alias function! [
	face        [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_stencil_wrap
;-------------------------------------------

#define  GL_EXT_stencil_wrap                          1
#define  GL_INCR_WRAP_EXT                             8507h
#define  GL_DECR_WRAP_EXT                             8508h


;-------------------------------------------
;-- GL_EXT_subtexture
;-------------------------------------------

#define  GL_EXT_subtexture                            1
;@@ void ( GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const void *pixels );
glTexSubImage1DEXT!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels );
glTexSubImage2DEXT!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels );
glTexSubImage3DEXT!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_texture
;-------------------------------------------

#define  GL_EXT_texture                               1
#define  GL_ALPHA4_EXT                                803Bh
#define  GL_ALPHA8_EXT                                803Ch
#define  GL_ALPHA12_EXT                               803Dh
#define  GL_ALPHA16_EXT                               803Eh
#define  GL_LUMINANCE4_EXT                            803Fh
#define  GL_LUMINANCE8_EXT                            8040h
#define  GL_LUMINANCE12_EXT                           8041h
#define  GL_LUMINANCE16_EXT                           8042h
#define  GL_LUMINANCE4_ALPHA4_EXT                     8043h
#define  GL_LUMINANCE6_ALPHA2_EXT                     8044h
#define  GL_LUMINANCE8_ALPHA8_EXT                     8045h
#define  GL_LUMINANCE12_ALPHA4_EXT                    8046h
#define  GL_LUMINANCE12_ALPHA12_EXT                   8047h
#define  GL_LUMINANCE16_ALPHA16_EXT                   8048h
#define  GL_INTENSITY_EXT                             8049h
#define  GL_INTENSITY4_EXT                            804Ah
#define  GL_INTENSITY8_EXT                            804Bh
#define  GL_INTENSITY12_EXT                           804Ch
#define  GL_INTENSITY16_EXT                           804Dh
#define  GL_RGB2_EXT                                  804Eh
#define  GL_RGB4_EXT                                  804Fh
#define  GL_RGB5_EXT                                  8050h
#define  GL_RGB8_EXT                                  8051h
#define  GL_RGB10_EXT                                 8052h
#define  GL_RGB12_EXT                                 8053h
#define  GL_RGB16_EXT                                 8054h
#define  GL_RGBA2_EXT                                 8055h
#define  GL_RGBA4_EXT                                 8056h
#define  GL_RGB5_A1_EXT                               8057h
#define  GL_RGBA8_EXT                                 8058h
#define  GL_RGB10_A2_EXT                              8059h
#define  GL_RGBA12_EXT                                805Ah
#define  GL_RGBA16_EXT                                805Bh
#define  GL_TEXTURE_RED_SIZE_EXT                      805Ch
#define  GL_TEXTURE_GREEN_SIZE_EXT                    805Dh
#define  GL_TEXTURE_BLUE_SIZE_EXT                     805Eh
#define  GL_TEXTURE_ALPHA_SIZE_EXT                    805Fh
#define  GL_TEXTURE_LUMINANCE_SIZE_EXT                8060h
#define  GL_TEXTURE_INTENSITY_SIZE_EXT                8061h
#define  GL_REPLACE_EXT                               8062h
#define  GL_PROXY_TEXTURE_1D_EXT                      8063h
#define  GL_PROXY_TEXTURE_2D_EXT                      8064h


;-------------------------------------------
;-- GL_EXT_texture3D
;-------------------------------------------

#define  GL_EXT_texture3D                             1
#define  GL_PACK_SKIP_IMAGES_EXT                      806Bh
#define  GL_PACK_IMAGE_HEIGHT_EXT                     806Ch
#define  GL_UNPACK_SKIP_IMAGES_EXT                    806Dh
#define  GL_UNPACK_IMAGE_HEIGHT_EXT                   806Eh
#define  GL_TEXTURE_3D_EXT                            806Fh
#define  GL_PROXY_TEXTURE_3D_EXT                      8070h
#define  GL_TEXTURE_DEPTH_EXT                         8071h
#define  GL_TEXTURE_WRAP_R_EXT                        8072h
#define  GL_MAX_3D_TEXTURE_SIZE_EXT                   8073h
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels );
glTexImage3DEXT!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	border      [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_texture_array
;-------------------------------------------

#define  GL_EXT_texture_array                         1
#define  GL_COMPARE_REF_DEPTH_TO_TEXTURE_EXT          884Eh
#define  GL_MAX_ARRAY_TEXTURE_LAYERS_EXT              88FFh
#define  GL_TEXTURE_1D_ARRAY_EXT                      8C18h
#define  GL_PROXY_TEXTURE_1D_ARRAY_EXT                8C19h
#define  GL_TEXTURE_2D_ARRAY_EXT                      8C1Ah
#define  GL_PROXY_TEXTURE_2D_ARRAY_EXT                8C1Bh
#define  GL_TEXTURE_BINDING_1D_ARRAY_EXT              8C1Ch
#define  GL_TEXTURE_BINDING_2D_ARRAY_EXT              8C1Dh
;@@ void ( GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer );
glFramebufferTextureLayerEXT!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	layer       [ GLint! ]
]


;-------------------------------------------
;-- GL_EXT_texture_buffer_object
;-------------------------------------------

#define  GL_EXT_texture_buffer_object                 1
#define  GL_TEXTURE_BUFFER_EXT                        8C2Ah
#define  GL_MAX_TEXTURE_BUFFER_SIZE_EXT               8C2Bh
#define  GL_TEXTURE_BINDING_BUFFER_EXT                8C2Ch
#define  GL_TEXTURE_BUFFER_DATA_STORE_BINDING_EXT     8C2Dh
#define  GL_TEXTURE_BUFFER_FORMAT_EXT                 8C2Eh
;@@ void ( GLenum target, GLenum internalformat, GLuint buffer );
glTexBufferEXT!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	buffer      [ GLuint! ]
]


;-------------------------------------------
;-- GL_EXT_texture_compression_astc_decode_mode
;-------------------------------------------

#define  GL_EXT_texture_compression_astc_decode_mode  1
#define  GL_TEXTURE_ASTC_DECODE_PRECISION_EXT         8F69h


;-------------------------------------------
;-- GL_EXT_texture_compression_astc_decode_mode_rgb9e5
;-------------------------------------------

#define  GL_EXT_texture_compression_astc_decode_mode_rgb9e5  1
;#define  GL_TEXTURE_ASTC_DECODE_PRECISION_EXT         8F69h


;-------------------------------------------
;-- GL_EXT_texture_compression_bptc
;-------------------------------------------

#define  GL_EXT_texture_compression_bptc              1
#define  GL_COMPRESSED_RGBA_BPTC_UNORM_EXT            8E8Ch
#define  GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_EXT      8E8Dh
#define  GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_EXT      8E8Eh
#define  GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_EXT    8E8Fh


;-------------------------------------------
;-- GL_EXT_texture_compression_dxt1
;-------------------------------------------

#define  GL_EXT_texture_compression_dxt1              1


;-------------------------------------------
;-- GL_EXT_texture_compression_latc
;-------------------------------------------

#define  GL_EXT_texture_compression_latc              1
#define  GL_COMPRESSED_LUMINANCE_LATC1_EXT            8C70h
#define  GL_COMPRESSED_SIGNED_LUMINANCE_LATC1_EXT     8C71h
#define  GL_COMPRESSED_LUMINANCE_ALPHA_LATC2_EXT      8C72h
#define  GL_COMPRESSED_SIGNED_LUMINANCE_ALPHA_LATC2_EXT  8C73h


;-------------------------------------------
;-- GL_EXT_texture_compression_rgtc
;-------------------------------------------

#define  GL_EXT_texture_compression_rgtc              1
#define  GL_COMPRESSED_RED_RGTC1_EXT                  8DBBh
#define  GL_COMPRESSED_SIGNED_RED_RGTC1_EXT           8DBCh
#define  GL_COMPRESSED_RED_GREEN_RGTC2_EXT            8DBDh
#define  GL_COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT     8DBEh


;-------------------------------------------
;-- GL_EXT_texture_compression_s3tc
;-------------------------------------------

#define  GL_EXT_texture_compression_s3tc              1
#define  GL_COMPRESSED_RGB_S3TC_DXT1_EXT              83F0h
#define  GL_COMPRESSED_RGBA_S3TC_DXT1_EXT             83F1h
#define  GL_COMPRESSED_RGBA_S3TC_DXT3_EXT             83F2h
#define  GL_COMPRESSED_RGBA_S3TC_DXT5_EXT             83F3h


;-------------------------------------------
;-- GL_EXT_texture_cube_map
;-------------------------------------------

#define  GL_EXT_texture_cube_map                      1
#define  GL_NORMAL_MAP_EXT                            8511h
#define  GL_REFLECTION_MAP_EXT                        8512h
#define  GL_TEXTURE_CUBE_MAP_EXT                      8513h
#define  GL_TEXTURE_BINDING_CUBE_MAP_EXT              8514h
#define  GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT           8515h
#define  GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT           8516h
#define  GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT           8517h
#define  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT           8518h
#define  GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT           8519h
#define  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT           851Ah
#define  GL_PROXY_TEXTURE_CUBE_MAP_EXT                851Bh
#define  GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT             851Ch


;-------------------------------------------
;-- GL_EXT_texture_cube_map_array
;-------------------------------------------

#define  GL_EXT_texture_cube_map_array                1
#define  GL_TEXTURE_CUBE_MAP_ARRAY_EXT                9009h
#define  GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_EXT        900Ah
#define  GL_SAMPLER_CUBE_MAP_ARRAY_EXT                900Ch
#define  GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_EXT         900Dh
#define  GL_INT_SAMPLER_CUBE_MAP_ARRAY_EXT            900Eh
#define  GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_EXT   900Fh
;#define  GL_IMAGE_CUBE_MAP_ARRAY_EXT                  9054h
;#define  GL_INT_IMAGE_CUBE_MAP_ARRAY_EXT              905Fh
;#define  GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY_EXT     906Ah


;-------------------------------------------
;-- GL_EXT_texture_edge_clamp
;-------------------------------------------

#define  GL_EXT_texture_edge_clamp                    1
#define  GL_CLAMP_TO_EDGE_EXT                         812Fh


;-------------------------------------------
;-- GL_EXT_texture_env
;-------------------------------------------

#define  GL_EXT_texture_env                           1


;-------------------------------------------
;-- GL_EXT_texture_env_add
;-------------------------------------------

#define  GL_EXT_texture_env_add                       1


;-------------------------------------------
;-- GL_EXT_texture_env_combine
;-------------------------------------------

#define  GL_EXT_texture_env_combine                   1
#define  GL_COMBINE_EXT                               8570h
#define  GL_COMBINE_RGB_EXT                           8571h
#define  GL_COMBINE_ALPHA_EXT                         8572h
#define  GL_RGB_SCALE_EXT                             8573h
#define  GL_ADD_SIGNED_EXT                            8574h
#define  GL_INTERPOLATE_EXT                           8575h
#define  GL_CONSTANT_EXT                              8576h
#define  GL_PRIMARY_COLOR_EXT                         8577h
#define  GL_PREVIOUS_EXT                              8578h
#define  GL_SOURCE0_RGB_EXT                           8580h
#define  GL_SOURCE1_RGB_EXT                           8581h
#define  GL_SOURCE2_RGB_EXT                           8582h
#define  GL_SOURCE0_ALPHA_EXT                         8588h
#define  GL_SOURCE1_ALPHA_EXT                         8589h
#define  GL_SOURCE2_ALPHA_EXT                         858Ah
#define  GL_OPERAND0_RGB_EXT                          8590h
#define  GL_OPERAND1_RGB_EXT                          8591h
#define  GL_OPERAND2_RGB_EXT                          8592h
#define  GL_OPERAND0_ALPHA_EXT                        8598h
#define  GL_OPERAND1_ALPHA_EXT                        8599h
#define  GL_OPERAND2_ALPHA_EXT                        859Ah


;-------------------------------------------
;-- GL_EXT_texture_env_dot3
;-------------------------------------------

#define  GL_EXT_texture_env_dot3                      1
#define  GL_DOT3_RGB_EXT                              8740h
#define  GL_DOT3_RGBA_EXT                             8741h


;-------------------------------------------
;-- GL_EXT_texture_filter_anisotropic
;-------------------------------------------

#define  GL_EXT_texture_filter_anisotropic            1
#define  GL_TEXTURE_MAX_ANISOTROPY_EXT                84FEh
#define  GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT            84FFh


;-------------------------------------------
;-- GL_EXT_texture_filter_minmax
;-------------------------------------------

#define  GL_EXT_texture_filter_minmax                 1
#define  GL_TEXTURE_REDUCTION_MODE_EXT                9366h
#define  GL_WEIGHTED_AVERAGE_EXT                      9367h


;-------------------------------------------
;-- GL_EXT_texture_format_BGRA8888
;-------------------------------------------

#define  GL_EXT_texture_format_BGRA8888               1
;#define  GL_BGRA_EXT                                  80E1h


;-------------------------------------------
;-- GL_EXT_texture_integer
;-------------------------------------------

#define  GL_EXT_texture_integer                       1
#define  GL_RGBA32UI_EXT                              8D70h
#define  GL_RGB32UI_EXT                               8D71h
#define  GL_ALPHA32UI_EXT                             8D72h
#define  GL_INTENSITY32UI_EXT                         8D73h
#define  GL_LUMINANCE32UI_EXT                         8D74h
#define  GL_LUMINANCE_ALPHA32UI_EXT                   8D75h
#define  GL_RGBA16UI_EXT                              8D76h
#define  GL_RGB16UI_EXT                               8D77h
#define  GL_ALPHA16UI_EXT                             8D78h
#define  GL_INTENSITY16UI_EXT                         8D79h
#define  GL_LUMINANCE16UI_EXT                         8D7Ah
#define  GL_LUMINANCE_ALPHA16UI_EXT                   8D7Bh
#define  GL_RGBA8UI_EXT                               8D7Ch
#define  GL_RGB8UI_EXT                                8D7Dh
#define  GL_ALPHA8UI_EXT                              8D7Eh
#define  GL_INTENSITY8UI_EXT                          8D7Fh
#define  GL_LUMINANCE8UI_EXT                          8D80h
#define  GL_LUMINANCE_ALPHA8UI_EXT                    8D81h
#define  GL_RGBA32I_EXT                               8D82h
#define  GL_RGB32I_EXT                                8D83h
#define  GL_ALPHA32I_EXT                              8D84h
#define  GL_INTENSITY32I_EXT                          8D85h
#define  GL_LUMINANCE32I_EXT                          8D86h
#define  GL_LUMINANCE_ALPHA32I_EXT                    8D87h
#define  GL_RGBA16I_EXT                               8D88h
#define  GL_RGB16I_EXT                                8D89h
#define  GL_ALPHA16I_EXT                              8D8Ah
#define  GL_INTENSITY16I_EXT                          8D8Bh
#define  GL_LUMINANCE16I_EXT                          8D8Ch
#define  GL_LUMINANCE_ALPHA16I_EXT                    8D8Dh
#define  GL_RGBA8I_EXT                                8D8Eh
#define  GL_RGB8I_EXT                                 8D8Fh
#define  GL_ALPHA8I_EXT                               8D90h
#define  GL_INTENSITY8I_EXT                           8D91h
#define  GL_LUMINANCE8I_EXT                           8D92h
#define  GL_LUMINANCE_ALPHA8I_EXT                     8D93h
#define  GL_RED_INTEGER_EXT                           8D94h
#define  GL_GREEN_INTEGER_EXT                         8D95h
#define  GL_BLUE_INTEGER_EXT                          8D96h
#define  GL_ALPHA_INTEGER_EXT                         8D97h
#define  GL_RGB_INTEGER_EXT                           8D98h
#define  GL_RGBA_INTEGER_EXT                          8D99h
#define  GL_BGR_INTEGER_EXT                           8D9Ah
#define  GL_BGRA_INTEGER_EXT                          8D9Bh
#define  GL_LUMINANCE_INTEGER_EXT                     8D9Ch
#define  GL_LUMINANCE_ALPHA_INTEGER_EXT               8D9Dh
#define  GL_RGBA_INTEGER_MODE_EXT                     8D9Eh
;@@ void ( GLint red, GLint green, GLint blue, GLint alpha );
glClearColorIiEXT!: alias function! [
	red         [ GLint! ]
	green       [ GLint! ]
	blue        [ GLint! ]
	alpha       [ GLint! ]
]
;@@ void ( GLuint red, GLuint green, GLuint blue, GLuint alpha );
glClearColorIuiEXT!: alias function! [
	red         [ GLuint! ]
	green       [ GLuint! ]
	blue        [ GLuint! ]
	alpha       [ GLuint! ]
]
;@@ void ( GLenum target, GLenum pname, GLint *params );
glGetTexParameterIivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLuint *params );
glGetTexParameterIuivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLint *params );
glTexParameterIivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLuint *params );
glTexParameterIuivEXT!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]


;-------------------------------------------
;-- GL_EXT_texture_lod_bias
;-------------------------------------------

#define  GL_EXT_texture_lod_bias                      1
#define  GL_MAX_TEXTURE_LOD_BIAS_EXT                  84FDh
#define  GL_TEXTURE_FILTER_CONTROL_EXT                8500h
#define  GL_TEXTURE_LOD_BIAS_EXT                      8501h


;-------------------------------------------
;-- GL_EXT_texture_mirror_clamp
;-------------------------------------------

#define  GL_EXT_texture_mirror_clamp                  1
#define  GL_MIRROR_CLAMP_EXT                          8742h
#define  GL_MIRROR_CLAMP_TO_EDGE_EXT                  8743h
#define  GL_MIRROR_CLAMP_TO_BORDER_EXT                8912h


;-------------------------------------------
;-- GL_EXT_texture_norm16
;-------------------------------------------

#define  GL_EXT_texture_norm16                        1
;#define  GL_RGB16_EXT                                 8054h
;#define  GL_RGBA16_EXT                                805Bh
#define  GL_R16_EXT                                   822Ah
#define  GL_RG16_EXT                                  822Ch
;#define  GL_R16_SNORM_EXT                             8F98h
;#define  GL_RG16_SNORM_EXT                            8F99h
#define  GL_RGB16_SNORM_EXT                           8F9Ah
;#define  GL_RGBA16_SNORM_EXT                          8F9Bh


;-------------------------------------------
;-- GL_EXT_texture_object
;-------------------------------------------

#define  GL_EXT_texture_object                        1
#define  GL_TEXTURE_PRIORITY_EXT                      8066h
#define  GL_TEXTURE_RESIDENT_EXT                      8067h
#define  GL_TEXTURE_1D_BINDING_EXT                    8068h
#define  GL_TEXTURE_2D_BINDING_EXT                    8069h
#define  GL_TEXTURE_3D_BINDING_EXT                    806Ah
;@@ GLboolean ( GLsizei n, const GLuint* textures, GLboolean* residences );
glAreTexturesResidentEXT!: alias function! [
	n           [ GLsizei! ]
	textures    [ pointer! [GLuint!] ]
	residences  [ pointer! [integer!] ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum target, GLuint texture );
glBindTextureEXT!: alias function! [
	target      [ GLenum! ]
	texture     [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* textures );
glDeleteTexturesEXT!: alias function! [
	n           [ GLsizei! ]
	textures    [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* textures );
glGenTexturesEXT!: alias function! [
	n           [ GLsizei! ]
	textures    [ pointer! [GLuint!] ]
]
;@@ GLboolean ( GLuint texture );
glIsTextureEXT!: alias function! [
	texture     [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLsizei n, const GLuint* textures, const GLclampf* priorities );
glPrioritizeTexturesEXT!: alias function! [
	n           [ GLsizei! ]
	textures    [ pointer! [GLuint!] ]
	priorities  [ pointer! [GLclampf!] ]
]


;-------------------------------------------
;-- GL_EXT_texture_perturb_normal
;-------------------------------------------

#define  GL_EXT_texture_perturb_normal                1
#define  GL_PERTURB_EXT                               85AEh
#define  GL_TEXTURE_NORMAL_EXT                        85AFh
;@@ void ( GLenum mode );
glTextureNormalEXT!: alias function! [
	mode        [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_texture_rectangle
;-------------------------------------------

#define  GL_EXT_texture_rectangle                     1
#define  GL_TEXTURE_RECTANGLE_EXT                     84F5h
#define  GL_TEXTURE_BINDING_RECTANGLE_EXT             84F6h
#define  GL_PROXY_TEXTURE_RECTANGLE_EXT               84F7h
#define  GL_MAX_RECTANGLE_TEXTURE_SIZE_EXT            84F8h


;-------------------------------------------
;-- GL_EXT_texture_rg
;-------------------------------------------

#define  GL_EXT_texture_rg                            1
#define  GL_RED_EXT                                   1903h
#define  GL_RG_EXT                                    8227h
#define  GL_R8_EXT                                    8229h
#define  GL_RG8_EXT                                   822Bh


;-------------------------------------------
;-- GL_EXT_texture_sRGB
;-------------------------------------------

#define  GL_EXT_texture_sRGB                          1
;#define  GL_SRGB_EXT                                  8C40h
#define  GL_SRGB8_EXT                                 8C41h
;#define  GL_SRGB_ALPHA_EXT                            8C42h
;#define  GL_SRGB8_ALPHA8_EXT                          8C43h
#define  GL_SLUMINANCE_ALPHA_EXT                      8C44h
#define  GL_SLUMINANCE8_ALPHA8_EXT                    8C45h
#define  GL_SLUMINANCE_EXT                            8C46h
#define  GL_SLUMINANCE8_EXT                           8C47h
#define  GL_COMPRESSED_SRGB_EXT                       8C48h
#define  GL_COMPRESSED_SRGB_ALPHA_EXT                 8C49h
#define  GL_COMPRESSED_SLUMINANCE_EXT                 8C4Ah
#define  GL_COMPRESSED_SLUMINANCE_ALPHA_EXT           8C4Bh
#define  GL_COMPRESSED_SRGB_S3TC_DXT1_EXT             8C4Ch
#define  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT       8C4Dh
#define  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT       8C4Eh
#define  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT       8C4Fh


;-------------------------------------------
;-- GL_EXT_texture_sRGB_R8
;-------------------------------------------

#define  GL_EXT_texture_sRGB_R8                       1
#define  GL_SR8_EXT                                   8FBDh


;-------------------------------------------
;-- GL_EXT_texture_sRGB_RG8
;-------------------------------------------

#define  GL_EXT_texture_sRGB_RG8                      1
#define  GL_SRG8_EXT                                  8FBEh


;-------------------------------------------
;-- GL_EXT_texture_sRGB_decode
;-------------------------------------------

#define  GL_EXT_texture_sRGB_decode                   1
#define  GL_TEXTURE_SRGB_DECODE_EXT                   8A48h
#define  GL_DECODE_EXT                                8A49h
#define  GL_SKIP_DECODE_EXT                           8A4Ah


;-------------------------------------------
;-- GL_EXT_texture_shared_exponent
;-------------------------------------------

#define  GL_EXT_texture_shared_exponent               1
#define  GL_RGB9_E5_EXT                               8C3Dh
#define  GL_UNSIGNED_INT_5_9_9_9_REV_EXT              8C3Eh
#define  GL_TEXTURE_SHARED_SIZE_EXT                   8C3Fh


;-------------------------------------------
;-- GL_EXT_texture_snorm
;-------------------------------------------

#define  GL_EXT_texture_snorm                         1
;#define  GL_RED_SNORM                                 8F90h
;#define  GL_RG_SNORM                                  8F91h
;#define  GL_RGB_SNORM                                 8F92h
;#define  GL_RGBA_SNORM                                8F93h
;#define  GL_R8_SNORM                                  8F94h
;#define  GL_RG8_SNORM                                 8F95h
;#define  GL_RGB8_SNORM                                8F96h
;#define  GL_RGBA8_SNORM                               8F97h
;#define  GL_R16_SNORM                                 8F98h
;#define  GL_RG16_SNORM                                8F99h
;#define  GL_RGB16_SNORM                               8F9Ah
;#define  GL_RGBA16_SNORM                              8F9Bh
;#define  GL_SIGNED_NORMALIZED                         8F9Ch
#define  GL_ALPHA_SNORM                               9010h
#define  GL_LUMINANCE_SNORM                           9011h
#define  GL_LUMINANCE_ALPHA_SNORM                     9012h
#define  GL_INTENSITY_SNORM                           9013h
#define  GL_ALPHA8_SNORM                              9014h
#define  GL_LUMINANCE8_SNORM                          9015h
#define  GL_LUMINANCE8_ALPHA8_SNORM                   9016h
#define  GL_INTENSITY8_SNORM                          9017h
#define  GL_ALPHA16_SNORM                             9018h
#define  GL_LUMINANCE16_SNORM                         9019h
#define  GL_LUMINANCE16_ALPHA16_SNORM                 901Ah
#define  GL_INTENSITY16_SNORM                         901Bh


;-------------------------------------------
;-- GL_EXT_texture_storage
;-------------------------------------------

#define  GL_EXT_texture_storage                       1
;#define  GL_ALPHA8_EXT                                803Ch
;#define  GL_LUMINANCE8_EXT                            8040h
;#define  GL_LUMINANCE8_ALPHA8_EXT                     8045h
;#define  GL_RGB10_EXT                                 8052h
;#define  GL_RGB10_A2_EXT                              8059h
;#define  GL_R8_EXT                                    8229h
;#define  GL_RG8_EXT                                   822Bh
;#define  GL_R16F_EXT                                  822Dh
#define  GL_R32F_EXT                                  822Eh
;#define  GL_RG16F_EXT                                 822Fh
#define  GL_RG32F_EXT                                 8230h
#define  GL_RGBA32F_EXT                               8814h
#define  GL_RGB32F_EXT                                8815h
#define  GL_ALPHA32F_EXT                              8816h
#define  GL_LUMINANCE32F_EXT                          8818h
#define  GL_LUMINANCE_ALPHA32F_EXT                    8819h
;#define  GL_RGBA16F_EXT                               881Ah
;#define  GL_RGB16F_EXT                                881Bh
#define  GL_ALPHA16F_EXT                              881Ch
#define  GL_LUMINANCE16F_EXT                          881Eh
#define  GL_LUMINANCE_ALPHA16F_EXT                    881Fh
;#define  GL_RGB_RAW_422_APPLE                         8A51h
#define  GL_TEXTURE_IMMUTABLE_FORMAT_EXT              912Fh
;#define  GL_BGRA8_EXT                                 93A1h
;@@ void ( GLenum target, GLsizei levels, GLenum internalformat, GLsizei width );
glTexStorage1DEXT!: alias function! [
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
]
;@@ void ( GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height );
glTexStorage2DEXT!: alias function! [
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth );
glTexStorage3DEXT!: alias function! [
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
]
;@@ void ( GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width );
glTextureStorage1DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
]
;@@ void ( GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height );
glTextureStorage2DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth );
glTextureStorage3DEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
]


;-------------------------------------------
;-- GL_EXT_texture_swizzle
;-------------------------------------------

#define  GL_EXT_texture_swizzle                       1
#define  GL_TEXTURE_SWIZZLE_R_EXT                     8E42h
#define  GL_TEXTURE_SWIZZLE_G_EXT                     8E43h
#define  GL_TEXTURE_SWIZZLE_B_EXT                     8E44h
#define  GL_TEXTURE_SWIZZLE_A_EXT                     8E45h
#define  GL_TEXTURE_SWIZZLE_RGBA_EXT                  8E46h


;-------------------------------------------
;-- GL_EXT_texture_type_2_10_10_10_REV
;-------------------------------------------

#define  GL_EXT_texture_type_2_10_10_10_REV           1
#define  GL_UNSIGNED_INT_2_10_10_10_REV_EXT           8368h


;-------------------------------------------
;-- GL_EXT_texture_view
;-------------------------------------------

#define  GL_EXT_texture_view                          1
#define  GL_TEXTURE_VIEW_MIN_LEVEL_EXT                82DBh
#define  GL_TEXTURE_VIEW_NUM_LEVELS_EXT               82DCh
#define  GL_TEXTURE_VIEW_MIN_LAYER_EXT                82DDh
#define  GL_TEXTURE_VIEW_NUM_LAYERS_EXT               82DEh
;#define  GL_TEXTURE_IMMUTABLE_LEVELS                  82DFh
;@@ void ( GLuint texture, GLenum target, GLuint origtexture, GLenum internalformat, GLuint minlevel, GLuint numlevels, GLuint minlayer, GLuint numlayers );
glTextureViewEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	origtexture [ GLuint! ]
	internalformat [ GLenum! ]
	minlevel    [ GLuint! ]
	numlevels   [ GLuint! ]
	minlayer    [ GLuint! ]
	numlayers   [ GLuint! ]
]


;-------------------------------------------
;-- GL_EXT_timer_query
;-------------------------------------------

#define  GL_EXT_timer_query                           1
#define  GL_TIME_ELAPSED_EXT                          88BFh
;@@ void ( GLuint id, GLenum pname, GLint64EXT *params );
glGetQueryObjecti64vEXT!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint id, GLenum pname, GLuint64EXT *params );
glGetQueryObjectui64vEXT!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLuint64EXT-ptr! ]
]


;-------------------------------------------
;-- GL_EXT_transform_feedback
;-------------------------------------------

#define  GL_EXT_transform_feedback                    1
#define  GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH_EXT  8C76h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_MODE_EXT        8C7Fh
#define  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_EXT  8C80h
#define  GL_TRANSFORM_FEEDBACK_VARYINGS_EXT           8C83h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_START_EXT       8C84h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_EXT        8C85h
;#define  GL_PRIMITIVES_GENERATED_EXT                  8C87h
#define  GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_EXT  8C88h
#define  GL_RASTERIZER_DISCARD_EXT                    8C89h
#define  GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_EXT  8C8Ah
#define  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_EXT  8C8Bh
#define  GL_INTERLEAVED_ATTRIBS_EXT                   8C8Ch
#define  GL_SEPARATE_ATTRIBS_EXT                      8C8Dh
#define  GL_TRANSFORM_FEEDBACK_BUFFER_EXT             8C8Eh
#define  GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_EXT     8C8Fh
;@@ void ( GLenum primitiveMode );
glBeginTransformFeedbackEXT!: alias function! [
	primitiveMode [ GLenum! ]
]
;@@ void ( GLenum target, GLuint index, GLuint buffer );
glBindBufferBaseEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	buffer      [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index, GLuint buffer, GLintptr offset );
glBindBufferOffsetEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size );
glBindBufferRangeEXT!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
]
;@@ void ( void );
glEndTransformFeedbackEXT!: alias function! [
]
;@@ void ( GLuint program, GLuint index, GLsizei bufSize, GLsizei* length, GLsizei *size, GLenum *type, GLchar *name );
glGetTransformFeedbackVaryingEXT!: alias function! [
	program     [ GLuint! ]
	index       [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	size        [ pointer! [GLsizei!] ]
	type        [ pointer! [GLenum!] ]
	name        [ GLstring! ]
]
;@@ void ( GLuint program, GLsizei count, const GLchar * const* varyings, GLenum bufferMode );
glTransformFeedbackVaryingsEXT!: alias function! [
	program     [ GLuint! ]
	count       [ GLsizei! ]
	varyings    [ GLstring-ptr! ]
	bufferMode  [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_unpack_subimage
;-------------------------------------------

#define  GL_EXT_unpack_subimage                       1
#define  GL_UNPACK_ROW_LENGTH_EXT                     0CF2h
#define  GL_UNPACK_SKIP_ROWS_EXT                      0CF3h
#define  GL_UNPACK_SKIP_PIXELS_EXT                    0CF4h


;-------------------------------------------
;-- GL_EXT_vertex_array
;-------------------------------------------

#define  GL_EXT_vertex_array                          1
#define  GL_DOUBLE_EXT                                140Ah
#define  GL_VERTEX_ARRAY_EXT                          8074h
#define  GL_NORMAL_ARRAY_EXT                          8075h
#define  GL_COLOR_ARRAY_EXT                           8076h
#define  GL_INDEX_ARRAY_EXT                           8077h
#define  GL_TEXTURE_COORD_ARRAY_EXT                   8078h
#define  GL_EDGE_FLAG_ARRAY_EXT                       8079h
#define  GL_VERTEX_ARRAY_SIZE_EXT                     807Ah
#define  GL_VERTEX_ARRAY_TYPE_EXT                     807Bh
#define  GL_VERTEX_ARRAY_STRIDE_EXT                   807Ch
#define  GL_VERTEX_ARRAY_COUNT_EXT                    807Dh
#define  GL_NORMAL_ARRAY_TYPE_EXT                     807Eh
#define  GL_NORMAL_ARRAY_STRIDE_EXT                   807Fh
#define  GL_NORMAL_ARRAY_COUNT_EXT                    8080h
#define  GL_COLOR_ARRAY_SIZE_EXT                      8081h
#define  GL_COLOR_ARRAY_TYPE_EXT                      8082h
#define  GL_COLOR_ARRAY_STRIDE_EXT                    8083h
#define  GL_COLOR_ARRAY_COUNT_EXT                     8084h
#define  GL_INDEX_ARRAY_TYPE_EXT                      8085h
#define  GL_INDEX_ARRAY_STRIDE_EXT                    8086h
#define  GL_INDEX_ARRAY_COUNT_EXT                     8087h
#define  GL_TEXTURE_COORD_ARRAY_SIZE_EXT              8088h
#define  GL_TEXTURE_COORD_ARRAY_TYPE_EXT              8089h
#define  GL_TEXTURE_COORD_ARRAY_STRIDE_EXT            808Ah
#define  GL_TEXTURE_COORD_ARRAY_COUNT_EXT             808Bh
#define  GL_EDGE_FLAG_ARRAY_STRIDE_EXT                808Ch
#define  GL_EDGE_FLAG_ARRAY_COUNT_EXT                 808Dh
#define  GL_VERTEX_ARRAY_POINTER_EXT                  808Eh
#define  GL_NORMAL_ARRAY_POINTER_EXT                  808Fh
#define  GL_COLOR_ARRAY_POINTER_EXT                   8090h
#define  GL_INDEX_ARRAY_POINTER_EXT                   8091h
#define  GL_TEXTURE_COORD_ARRAY_POINTER_EXT           8092h
#define  GL_EDGE_FLAG_ARRAY_POINTER_EXT               8093h
;@@ void ( GLint i );
glArrayElementEXT!: alias function! [
	i           [ GLint! ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride, GLsizei count, const void *pointer );
glColorPointerEXT!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	count       [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLenum mode, GLint first, GLsizei count );
glDrawArraysEXT!: alias function! [
	mode        [ GLenum! ]
	first       [ GLint! ]
	count       [ GLsizei! ]
]
;@@ void ( GLsizei stride, GLsizei count, const GLboolean* pointer );
glEdgeFlagPointerEXT!: alias function! [
	stride      [ GLsizei! ]
	count       [ GLsizei! ]
	pointer     [ pointer! [integer!] ]
]
;@@ void ( GLenum type, GLsizei stride, GLsizei count, const void *pointer );
glIndexPointerEXT!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	count       [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLenum type, GLsizei stride, GLsizei count, const void *pointer );
glNormalPointerEXT!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	count       [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride, GLsizei count, const void *pointer );
glTexCoordPointerEXT!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	count       [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride, GLsizei count, const void *pointer );
glVertexPointerEXT!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	count       [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_vertex_array_bgra
;-------------------------------------------

#define  GL_EXT_vertex_array_bgra                     1
;#define  GL_BGRA                                      80E1h


;-------------------------------------------
;-- GL_EXT_vertex_array_setXXX
;-------------------------------------------

#define  GL_EXT_vertex_array_setXXX                   1
;@@ void ( const void *arrayset );
glBindArraySetEXT!: alias function! [
	arrayset    [ pointer! [byte!] ]
]
;@@ const void * ( void );
glCreateArraySetExt!: alias function! [
	return: [ pointer! [byte!] ]

]
;@@ void ( GLsizei n, const void *arrayset[] );
glDeleteArraySetsEXT!: alias function! [
	n           [ GLsizei! ]
	arrayset    [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_vertex_attrib_64bit
;-------------------------------------------

#define  GL_EXT_vertex_attrib_64bit                   1
#define  GL_DOUBLE_MAT2_EXT                           8F46h
#define  GL_DOUBLE_MAT3_EXT                           8F47h
#define  GL_DOUBLE_MAT4_EXT                           8F48h
#define  GL_DOUBLE_MAT2x3_EXT                         8F49h
#define  GL_DOUBLE_MAT2x4_EXT                         8F4Ah
#define  GL_DOUBLE_MAT3x2_EXT                         8F4Bh
#define  GL_DOUBLE_MAT3x4_EXT                         8F4Ch
#define  GL_DOUBLE_MAT4x2_EXT                         8F4Dh
#define  GL_DOUBLE_MAT4x3_EXT                         8F4Eh
#define  GL_DOUBLE_VEC2_EXT                           8FFCh
#define  GL_DOUBLE_VEC3_EXT                           8FFDh
#define  GL_DOUBLE_VEC4_EXT                           8FFEh
;@@ void ( GLuint index, GLenum pname, GLdouble* params );
glGetVertexAttribLdvEXT!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLsizei stride, GLintptr offset );
glVertexArrayVertexAttribLOffsetEXT!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint index, GLdouble x );
glVertexAttribL1dEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttribL1dvEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y );
glVertexAttribL2dEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttribL2dvEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y, GLdouble z );
glVertexAttribL3dEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttribL3dvEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glVertexAttribL4dEXT!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttribL4dvEXT!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLsizei stride, const void *pointer );
glVertexAttribLPointerEXT!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_EXT_vertex_shader
;-------------------------------------------

#define  GL_EXT_vertex_shader                         1
#define  GL_VERTEX_SHADER_EXT                         8780h
#define  GL_VERTEX_SHADER_BINDING_EXT                 8781h
#define  GL_OP_INDEX_EXT                              8782h
#define  GL_OP_NEGATE_EXT                             8783h
#define  GL_OP_DOT3_EXT                               8784h
#define  GL_OP_DOT4_EXT                               8785h
#define  GL_OP_MUL_EXT                                8786h
#define  GL_OP_ADD_EXT                                8787h
#define  GL_OP_MADD_EXT                               8788h
#define  GL_OP_FRAC_EXT                               8789h
#define  GL_OP_MAX_EXT                                878Ah
#define  GL_OP_MIN_EXT                                878Bh
#define  GL_OP_SET_GE_EXT                             878Ch
#define  GL_OP_SET_LT_EXT                             878Dh
#define  GL_OP_CLAMP_EXT                              878Eh
#define  GL_OP_FLOOR_EXT                              878Fh
#define  GL_OP_ROUND_EXT                              8790h
#define  GL_OP_EXP_BASE_2_EXT                         8791h
#define  GL_OP_LOG_BASE_2_EXT                         8792h
#define  GL_OP_POWER_EXT                              8793h
#define  GL_OP_RECIP_EXT                              8794h
#define  GL_OP_RECIP_SQRT_EXT                         8795h
#define  GL_OP_SUB_EXT                                8796h
#define  GL_OP_CROSS_PRODUCT_EXT                      8797h
#define  GL_OP_MULTIPLY_MATRIX_EXT                    8798h
#define  GL_OP_MOV_EXT                                8799h
#define  GL_OUTPUT_VERTEX_EXT                         879Ah
#define  GL_OUTPUT_COLOR0_EXT                         879Bh
#define  GL_OUTPUT_COLOR1_EXT                         879Ch
#define  GL_OUTPUT_TEXTURE_COORD0_EXT                 879Dh
#define  GL_OUTPUT_TEXTURE_COORD1_EXT                 879Eh
#define  GL_OUTPUT_TEXTURE_COORD2_EXT                 879Fh
#define  GL_OUTPUT_TEXTURE_COORD3_EXT                 87A0h
#define  GL_OUTPUT_TEXTURE_COORD4_EXT                 87A1h
#define  GL_OUTPUT_TEXTURE_COORD5_EXT                 87A2h
#define  GL_OUTPUT_TEXTURE_COORD6_EXT                 87A3h
#define  GL_OUTPUT_TEXTURE_COORD7_EXT                 87A4h
#define  GL_OUTPUT_TEXTURE_COORD8_EXT                 87A5h
#define  GL_OUTPUT_TEXTURE_COORD9_EXT                 87A6h
#define  GL_OUTPUT_TEXTURE_COORD10_EXT                87A7h
#define  GL_OUTPUT_TEXTURE_COORD11_EXT                87A8h
#define  GL_OUTPUT_TEXTURE_COORD12_EXT                87A9h
#define  GL_OUTPUT_TEXTURE_COORD13_EXT                87AAh
#define  GL_OUTPUT_TEXTURE_COORD14_EXT                87ABh
#define  GL_OUTPUT_TEXTURE_COORD15_EXT                87ACh
#define  GL_OUTPUT_TEXTURE_COORD16_EXT                87ADh
#define  GL_OUTPUT_TEXTURE_COORD17_EXT                87AEh
#define  GL_OUTPUT_TEXTURE_COORD18_EXT                87AFh
#define  GL_OUTPUT_TEXTURE_COORD19_EXT                87B0h
#define  GL_OUTPUT_TEXTURE_COORD20_EXT                87B1h
#define  GL_OUTPUT_TEXTURE_COORD21_EXT                87B2h
#define  GL_OUTPUT_TEXTURE_COORD22_EXT                87B3h
#define  GL_OUTPUT_TEXTURE_COORD23_EXT                87B4h
#define  GL_OUTPUT_TEXTURE_COORD24_EXT                87B5h
#define  GL_OUTPUT_TEXTURE_COORD25_EXT                87B6h
#define  GL_OUTPUT_TEXTURE_COORD26_EXT                87B7h
#define  GL_OUTPUT_TEXTURE_COORD27_EXT                87B8h
#define  GL_OUTPUT_TEXTURE_COORD28_EXT                87B9h
#define  GL_OUTPUT_TEXTURE_COORD29_EXT                87BAh
#define  GL_OUTPUT_TEXTURE_COORD30_EXT                87BBh
#define  GL_OUTPUT_TEXTURE_COORD31_EXT                87BCh
#define  GL_OUTPUT_FOG_EXT                            87BDh
#define  GL_SCALAR_EXT                                87BEh
#define  GL_VECTOR_EXT                                87BFh
#define  GL_MATRIX_EXT                                87C0h
#define  GL_VARIANT_EXT                               87C1h
#define  GL_INVARIANT_EXT                             87C2h
#define  GL_LOCAL_CONSTANT_EXT                        87C3h
#define  GL_LOCAL_EXT                                 87C4h
#define  GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT        87C5h
#define  GL_MAX_VERTEX_SHADER_VARIANTS_EXT            87C6h
#define  GL_MAX_VERTEX_SHADER_INVARIANTS_EXT          87C7h
#define  GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT     87C8h
#define  GL_MAX_VERTEX_SHADER_LOCALS_EXT              87C9h
#define  GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT  87CAh
#define  GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT  87CBh
#define  GL_MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT  87CCh
#define  GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT  87CDh
#define  GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT    87CEh
#define  GL_VERTEX_SHADER_INSTRUCTIONS_EXT            87CFh
#define  GL_VERTEX_SHADER_VARIANTS_EXT                87D0h
#define  GL_VERTEX_SHADER_INVARIANTS_EXT              87D1h
#define  GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT         87D2h
#define  GL_VERTEX_SHADER_LOCALS_EXT                  87D3h
#define  GL_VERTEX_SHADER_OPTIMIZED_EXT               87D4h
#define  GL_X_EXT                                     87D5h
#define  GL_Y_EXT                                     87D6h
#define  GL_Z_EXT                                     87D7h
#define  GL_W_EXT                                     87D8h
#define  GL_NEGATIVE_X_EXT                            87D9h
#define  GL_NEGATIVE_Y_EXT                            87DAh
#define  GL_NEGATIVE_Z_EXT                            87DBh
#define  GL_NEGATIVE_W_EXT                            87DCh
#define  GL_ZERO_EXT                                  87DDh
#define  GL_ONE_EXT                                   87DEh
#define  GL_NEGATIVE_ONE_EXT                          87DFh
#define  GL_NORMALIZED_RANGE_EXT                      87E0h
#define  GL_FULL_RANGE_EXT                            87E1h
#define  GL_CURRENT_VERTEX_EXT                        87E2h
#define  GL_MVP_MATRIX_EXT                            87E3h
#define  GL_VARIANT_VALUE_EXT                         87E4h
#define  GL_VARIANT_DATATYPE_EXT                      87E5h
#define  GL_VARIANT_ARRAY_STRIDE_EXT                  87E6h
#define  GL_VARIANT_ARRAY_TYPE_EXT                    87E7h
#define  GL_VARIANT_ARRAY_EXT                         87E8h
#define  GL_VARIANT_ARRAY_POINTER_EXT                 87E9h
#define  GL_INVARIANT_VALUE_EXT                       87EAh
#define  GL_INVARIANT_DATATYPE_EXT                    87EBh
#define  GL_LOCAL_CONSTANT_VALUE_EXT                  87ECh
#define  GL_LOCAL_CONSTANT_DATATYPE_EXT               87EDh
;@@ void ( void );
glBeginVertexShaderEXT!: alias function! [
]
;@@ GLuint ( GLenum light, GLenum value );
glBindLightParameterEXT!: alias function! [
	light       [ GLenum! ]
	value       [ GLenum! ]
	return: [ GLuint! ]

]
;@@ GLuint ( GLenum face, GLenum value );
glBindMaterialParameterEXT!: alias function! [
	face        [ GLenum! ]
	value       [ GLenum! ]
	return: [ GLuint! ]

]
;@@ GLuint ( GLenum value );
glBindParameterEXT!: alias function! [
	value       [ GLenum! ]
	return: [ GLuint! ]

]
;@@ GLuint ( GLenum unit, GLenum coord, GLenum value );
glBindTexGenParameterEXT!: alias function! [
	unit        [ GLenum! ]
	coord       [ GLenum! ]
	value       [ GLenum! ]
	return: [ GLuint! ]

]
;@@ GLuint ( GLenum unit, GLenum value );
glBindTextureUnitParameterEXT!: alias function! [
	unit        [ GLenum! ]
	value       [ GLenum! ]
	return: [ GLuint! ]

]
;@@ void ( GLuint id );
glBindVertexShaderEXT!: alias function! [
	id          [ GLuint! ]
]
;@@ void ( GLuint id );
glDeleteVertexShaderEXT!: alias function! [
	id          [ GLuint! ]
]
;@@ void ( GLuint id );
glDisableVariantClientStateEXT!: alias function! [
	id          [ GLuint! ]
]
;@@ void ( GLuint id );
glEnableVariantClientStateEXT!: alias function! [
	id          [ GLuint! ]
]
;@@ void ( void );
glEndVertexShaderEXT!: alias function! [
]
;@@ void ( GLuint res, GLuint src, GLuint num );
glExtractComponentEXT!: alias function! [
	res         [ GLuint! ]
	src         [ GLuint! ]
	num         [ GLuint! ]
]
;@@ GLuint ( GLenum dataType, GLenum storageType, GLenum range, GLuint components );
glGenSymbolsEXT!: alias function! [
	dataType    [ GLenum! ]
	storageType [ GLenum! ]
	range       [ GLenum! ]
	components  [ GLuint! ]
	return: [ GLuint! ]

]
;@@ GLuint ( GLuint range );
glGenVertexShadersEXT!: alias function! [
	range       [ GLuint! ]
	return: [ GLuint! ]

]
;@@ void ( GLuint id, GLenum value, GLboolean *data );
glGetInvariantBooleanvEXT!: alias function! [
	id          [ GLuint! ]
	value       [ GLenum! ]
	data        [ pointer! [integer!] ]
]
;@@ void ( GLuint id, GLenum value, GLfloat *data );
glGetInvariantFloatvEXT!: alias function! [
	id          [ GLuint! ]
	value       [ GLenum! ]
	data        [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint id, GLenum value, GLint *data );
glGetInvariantIntegervEXT!: alias function! [
	id          [ GLuint! ]
	value       [ GLenum! ]
	data        [ pointer! [GLint!] ]
]
;@@ void ( GLuint id, GLenum value, GLboolean *data );
glGetLocalConstantBooleanvEXT!: alias function! [
	id          [ GLuint! ]
	value       [ GLenum! ]
	data        [ pointer! [integer!] ]
]
;@@ void ( GLuint id, GLenum value, GLfloat *data );
glGetLocalConstantFloatvEXT!: alias function! [
	id          [ GLuint! ]
	value       [ GLenum! ]
	data        [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint id, GLenum value, GLint *data );
glGetLocalConstantIntegervEXT!: alias function! [
	id          [ GLuint! ]
	value       [ GLenum! ]
	data        [ pointer! [GLint!] ]
]
;@@ void ( GLuint id, GLenum value, GLboolean *data );
glGetVariantBooleanvEXT!: alias function! [
	id          [ GLuint! ]
	value       [ GLenum! ]
	data        [ pointer! [integer!] ]
]
;@@ void ( GLuint id, GLenum value, GLfloat *data );
glGetVariantFloatvEXT!: alias function! [
	id          [ GLuint! ]
	value       [ GLenum! ]
	data        [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint id, GLenum value, GLint *data );
glGetVariantIntegervEXT!: alias function! [
	id          [ GLuint! ]
	value       [ GLenum! ]
	data        [ pointer! [GLint!] ]
]
;@@ void ( GLuint id, GLenum value, void **data );
glGetVariantPointervEXT!: alias function! [
	id          [ GLuint! ]
	value       [ GLenum! ]
	data        [ binary-ptr! ]
]
;@@ void ( GLuint res, GLuint src, GLuint num );
glInsertComponentEXT!: alias function! [
	res         [ GLuint! ]
	src         [ GLuint! ]
	num         [ GLuint! ]
]
;@@ GLboolean ( GLuint id, GLenum cap );
glIsVariantEnabledEXT!: alias function! [
	id          [ GLuint! ]
	cap         [ GLenum! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint id, GLenum type, void *addr );
glSetInvariantEXT!: alias function! [
	id          [ GLuint! ]
	type        [ GLenum! ]
	addr        [ pointer! [byte!] ]
]
;@@ void ( GLuint id, GLenum type, void *addr );
glSetLocalConstantEXT!: alias function! [
	id          [ GLuint! ]
	type        [ GLenum! ]
	addr        [ pointer! [byte!] ]
]
;@@ void ( GLenum op, GLuint res, GLuint arg1 );
glShaderOp1EXT!: alias function! [
	op          [ GLenum! ]
	res         [ GLuint! ]
	arg1        [ GLuint! ]
]
;@@ void ( GLenum op, GLuint res, GLuint arg1, GLuint arg2 );
glShaderOp2EXT!: alias function! [
	op          [ GLenum! ]
	res         [ GLuint! ]
	arg1        [ GLuint! ]
	arg2        [ GLuint! ]
]
;@@ void ( GLenum op, GLuint res, GLuint arg1, GLuint arg2, GLuint arg3 );
glShaderOp3EXT!: alias function! [
	op          [ GLenum! ]
	res         [ GLuint! ]
	arg1        [ GLuint! ]
	arg2        [ GLuint! ]
	arg3        [ GLuint! ]
]
;@@ void ( GLuint res, GLuint in, GLenum outX, GLenum outY, GLenum outZ, GLenum outW );
glSwizzleEXT!: alias function! [
	res         [ GLuint! ]
	in          [ GLuint! ]
	outX        [ GLenum! ]
	outY        [ GLenum! ]
	outZ        [ GLenum! ]
	outW        [ GLenum! ]
]
;@@ void ( GLuint id, GLenum type, GLuint stride, void *addr );
glVariantPointerEXT!: alias function! [
	id          [ GLuint! ]
	type        [ GLenum! ]
	stride      [ GLuint! ]
	addr        [ pointer! [byte!] ]
]
;@@ void ( GLuint id, GLbyte *addr );
glVariantbvEXT!: alias function! [
	id          [ GLuint! ]
	addr        [ pointer! [GLbyte!] ]
]
;@@ void ( GLuint id, GLdouble *addr );
glVariantdvEXT!: alias function! [
	id          [ GLuint! ]
	addr        [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint id, GLfloat *addr );
glVariantfvEXT!: alias function! [
	id          [ GLuint! ]
	addr        [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint id, GLint *addr );
glVariantivEXT!: alias function! [
	id          [ GLuint! ]
	addr        [ pointer! [GLint!] ]
]
;@@ void ( GLuint id, GLshort *addr );
glVariantsvEXT!: alias function! [
	id          [ GLuint! ]
	addr        [ GLshort-ptr! ]
]
;@@ void ( GLuint id, GLubyte *addr );
glVariantubvEXT!: alias function! [
	id          [ GLuint! ]
	addr        [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint id, GLuint *addr );
glVariantuivEXT!: alias function! [
	id          [ GLuint! ]
	addr        [ pointer! [GLuint!] ]
]
;@@ void ( GLuint id, GLushort *addr );
glVariantusvEXT!: alias function! [
	id          [ GLuint! ]
	addr        [ GLushort-ptr! ]
]
;@@ void ( GLuint res, GLuint in, GLenum outX, GLenum outY, GLenum outZ, GLenum outW );
glWriteMaskEXT!: alias function! [
	res         [ GLuint! ]
	in          [ GLuint! ]
	outX        [ GLenum! ]
	outY        [ GLenum! ]
	outZ        [ GLenum! ]
	outW        [ GLenum! ]
]


;-------------------------------------------
;-- GL_EXT_vertex_weighting
;-------------------------------------------

#define  GL_EXT_vertex_weighting                      1
#define  GL_MODELVIEW0_STACK_DEPTH_EXT                0BA3h
#define  GL_MODELVIEW0_MATRIX_EXT                     0BA6h
#define  GL_MODELVIEW0_EXT                            1700h
#define  GL_MODELVIEW1_STACK_DEPTH_EXT                8502h
#define  GL_MODELVIEW1_MATRIX_EXT                     8506h
#define  GL_VERTEX_WEIGHTING_EXT                      8509h
#define  GL_MODELVIEW1_EXT                            850Ah
#define  GL_CURRENT_VERTEX_WEIGHT_EXT                 850Bh
#define  GL_VERTEX_WEIGHT_ARRAY_EXT                   850Ch
#define  GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT              850Dh
#define  GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT              850Eh
#define  GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT            850Fh
#define  GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT           8510h
;@@ void ( GLint size, GLenum type, GLsizei stride, void *pointer );
glVertexWeightPointerEXT!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLfloat weight );
glVertexWeightfEXT!: alias function! [
	weight      [ GLfloat! ]
]
;@@ void ( GLfloat* weight );
glVertexWeightfvEXT!: alias function! [
	weight      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_EXT_win32_keyed_mutex
;-------------------------------------------

#define  GL_EXT_win32_keyed_mutex                     1
;@@ GLboolean ( GLuint memory, GLuint64 key, GLuint timeout );
glAcquireKeyedMutexWin32EXT!: alias function! [
	memory      [ GLuint! ]
	key         [ GLuint64! ]
	timeout     [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint memory, GLuint64 key );
glReleaseKeyedMutexWin32EXT!: alias function! [
	memory      [ GLuint! ]
	key         [ GLuint64! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_EXT_window_rectangles
;-------------------------------------------

#define  GL_EXT_window_rectangles                     1
#define  GL_INCLUSIVE_EXT                             8F10h
#define  GL_EXCLUSIVE_EXT                             8F11h
#define  GL_WINDOW_RECTANGLE_EXT                      8F12h
#define  GL_WINDOW_RECTANGLE_MODE_EXT                 8F13h
#define  GL_MAX_WINDOW_RECTANGLES_EXT                 8F14h
#define  GL_NUM_WINDOW_RECTANGLES_EXT                 8F15h
;@@ void ( GLenum mode, GLsizei count, const GLint box[] );
glWindowRectanglesEXT!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	box         [ pointer! [GLint!] ] ;@@[]
]


;-------------------------------------------
;-- GL_EXT_x11_sync_object
;-------------------------------------------

#define  GL_EXT_x11_sync_object                       1
#define  GL_SYNC_X11_FENCE_EXT                        90E1h
;@@ GLsync ( GLenum external_sync_type, GLintptr external_sync, GLbitfield flags );
glImportSyncEXT!: alias function! [
	external_sync_type [ GLenum! ]
	external_sync [ GLintptr! ]
	flags       [ GLbitfield! ]
	return: [ GLsync! ]

]
