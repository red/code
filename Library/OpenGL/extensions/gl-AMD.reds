Red/System [
	Title:   "Red/System OpenGL AMD extension binding"
	Author:  "Oldes"
	File: 	 %gl-AMD.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_AMD_blend_minmax_factor
;-------------------------------------------

#define  GL_AMD_blend_minmax_factor                   1
#define  GL_FACTOR_MIN_AMD                            901Ch
#define  GL_FACTOR_MAX_AMD                            901Dh


;-------------------------------------------
;-- GL_AMD_compressed_3DC_texture
;-------------------------------------------

#define  GL_AMD_compressed_3DC_texture                1
#define  GL_3DC_X_AMD                                 87F9h
#define  GL_3DC_XY_AMD                                87FAh


;-------------------------------------------
;-- GL_AMD_compressed_ATC_texture
;-------------------------------------------

#define  GL_AMD_compressed_ATC_texture                1
#define  GL_ATC_RGBA_INTERPOLATED_ALPHA_AMD           87EEh
#define  GL_ATC_RGB_AMD                               8C92h
#define  GL_ATC_RGBA_EXPLICIT_ALPHA_AMD               8C93h


;-------------------------------------------
;-- GL_AMD_conservative_depth
;-------------------------------------------

#define  GL_AMD_conservative_depth                    1


;-------------------------------------------
;-- GL_AMD_debug_output
;-------------------------------------------

#define  GL_AMD_debug_output                          1
#define  GL_MAX_DEBUG_MESSAGE_LENGTH_AMD              9143h
#define  GL_MAX_DEBUG_LOGGED_MESSAGES_AMD             9144h
#define  GL_DEBUG_LOGGED_MESSAGES_AMD                 9145h
#define  GL_DEBUG_SEVERITY_HIGH_AMD                   9146h
#define  GL_DEBUG_SEVERITY_MEDIUM_AMD                 9147h
#define  GL_DEBUG_SEVERITY_LOW_AMD                    9148h
#define  GL_DEBUG_CATEGORY_API_ERROR_AMD              9149h
#define  GL_DEBUG_CATEGORY_WINDOW_SYSTEM_AMD          914Ah
#define  GL_DEBUG_CATEGORY_DEPRECATION_AMD            914Bh
#define  GL_DEBUG_CATEGORY_UNDEFINED_BEHAVIOR_AMD     914Ch
#define  GL_DEBUG_CATEGORY_PERFORMANCE_AMD            914Dh
#define  GL_DEBUG_CATEGORY_SHADER_COMPILER_AMD        914Eh
#define  GL_DEBUG_CATEGORY_APPLICATION_AMD            914Fh
#define  GL_DEBUG_CATEGORY_OTHER_AMD                  9150h
;@@ void ( GLDEBUGPROCAMD callback, void *userParam );
glDebugMessageCallbackAMD!: alias function! [
	callback    [ GLDEBUGPROCAMD! ]
	userParam   [ pointer! [byte!] ]
]
;@@ void ( GLenum category, GLenum severity, GLsizei count, const GLuint* ids, GLboolean enabled );
glDebugMessageEnableAMD!: alias function! [
	category    [ GLenum! ]
	severity    [ GLenum! ]
	count       [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
	enabled     [ GLboolean! ]
]
;@@ void ( GLenum category, GLenum severity, GLuint id, GLsizei length, const GLchar* buf );
glDebugMessageInsertAMD!: alias function! [
	category    [ GLenum! ]
	severity    [ GLenum! ]
	id          [ GLuint! ]
	length      [ GLsizei! ]
	buf         [ GLstring! ]
]
;@@ GLuint ( GLuint count, GLsizei bufsize, GLenum* categories, GLuint* severities, GLuint* ids, GLsizei* lengths, GLchar* message );
glGetDebugMessageLogAMD!: alias function! [
	count       [ GLuint! ]
	bufsize     [ GLsizei! ]
	categories  [ pointer! [GLenum!] ]
	severities  [ pointer! [GLuint!] ]
	ids         [ pointer! [GLuint!] ]
	lengths     [ pointer! [GLsizei!] ]
	message     [ GLstring! ]
	return: [ GLuint! ]

]


;-------------------------------------------
;-- GL_AMD_depth_clamp_separate
;-------------------------------------------

#define  GL_AMD_depth_clamp_separate                  1
#define  GL_DEPTH_CLAMP_NEAR_AMD                      901Eh
#define  GL_DEPTH_CLAMP_FAR_AMD                       901Fh


;-------------------------------------------
;-- GL_AMD_draw_buffers_blend
;-------------------------------------------

#define  GL_AMD_draw_buffers_blend                    1
;@@ void ( GLuint buf, GLenum mode );
glBlendEquationIndexedAMD!: alias function! [
	buf         [ GLuint! ]
	mode        [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum modeRGB, GLenum modeAlpha );
glBlendEquationSeparateIndexedAMD!: alias function! [
	buf         [ GLuint! ]
	modeRGB     [ GLenum! ]
	modeAlpha   [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum src, GLenum dst );
glBlendFuncIndexedAMD!: alias function! [
	buf         [ GLuint! ]
	src         [ GLenum! ]
	dst         [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha );
glBlendFuncSeparateIndexedAMD!: alias function! [
	buf         [ GLuint! ]
	srcRGB      [ GLenum! ]
	dstRGB      [ GLenum! ]
	srcAlpha    [ GLenum! ]
	dstAlpha    [ GLenum! ]
]


;-------------------------------------------
;-- GL_AMD_framebuffer_sample_positions
;-------------------------------------------

#define  GL_AMD_framebuffer_sample_positions          1
#define  GL_SUBSAMPLE_DISTANCE_AMD                    883Fh
#define  GL_PIXELS_PER_SAMPLE_PATTERN_X_AMD           91AEh
#define  GL_PIXELS_PER_SAMPLE_PATTERN_Y_AMD           91AFh
#define  GL_ALL_PIXELS_AMD                            FFFFFFFFh
;@@ void ( GLenum target, GLuint numsamples, GLuint pixelindex, const GLfloat* values );
glFramebufferSamplePositionsfvAMD!: alias function! [
	target      [ GLenum! ]
	numsamples  [ GLuint! ]
	pixelindex  [ GLuint! ]
	values      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLuint numsamples, GLuint pixelindex, GLsizei size, GLfloat* values );
glGetFramebufferParameterfvAMD!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	numsamples  [ GLuint! ]
	pixelindex  [ GLuint! ]
	size        [ GLsizei! ]
	values      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint framebuffer, GLenum pname, GLuint numsamples, GLuint pixelindex, GLsizei size, GLfloat* values );
glGetNamedFramebufferParameterfvAMD!: alias function! [
	framebuffer [ GLuint! ]
	pname       [ GLenum! ]
	numsamples  [ GLuint! ]
	pixelindex  [ GLuint! ]
	size        [ GLsizei! ]
	values      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint framebuffer, GLuint numsamples, GLuint pixelindex, const GLfloat* values );
glNamedFramebufferSamplePositionsfvAMD!: alias function! [
	framebuffer [ GLuint! ]
	numsamples  [ GLuint! ]
	pixelindex  [ GLuint! ]
	values      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_AMD_gcn_shader
;-------------------------------------------

#define  GL_AMD_gcn_shader                            1


;-------------------------------------------
;-- GL_AMD_gpu_shader_half_float
;-------------------------------------------

#define  GL_AMD_gpu_shader_half_float                 1
#define  GL_FLOAT16_NV                                8FF8h
#define  GL_FLOAT16_VEC2_NV                           8FF9h
#define  GL_FLOAT16_VEC3_NV                           8FFAh
#define  GL_FLOAT16_VEC4_NV                           8FFBh
#define  GL_FLOAT16_MAT2_AMD                          91C5h
#define  GL_FLOAT16_MAT3_AMD                          91C6h
#define  GL_FLOAT16_MAT4_AMD                          91C7h
#define  GL_FLOAT16_MAT2x3_AMD                        91C8h
#define  GL_FLOAT16_MAT2x4_AMD                        91C9h
#define  GL_FLOAT16_MAT3x2_AMD                        91CAh
#define  GL_FLOAT16_MAT3x4_AMD                        91CBh
#define  GL_FLOAT16_MAT4x2_AMD                        91CCh
#define  GL_FLOAT16_MAT4x3_AMD                        91CDh


;-------------------------------------------
;-- GL_AMD_gpu_shader_int16
;-------------------------------------------

#define  GL_AMD_gpu_shader_int16                      1


;-------------------------------------------
;-- GL_AMD_gpu_shader_int64
;-------------------------------------------

#define  GL_AMD_gpu_shader_int64                      1


;-------------------------------------------
;-- GL_AMD_interleaved_elements
;-------------------------------------------

#define  GL_AMD_interleaved_elements                  1
;#define  GL_RED                                       1903h
;#define  GL_GREEN                                     1904h
;#define  GL_BLUE                                      1905h
;#define  GL_ALPHA                                     1906h
#define  GL_RG8UI                                     8238h
#define  GL_RG16UI                                    823Ah
;#define  GL_RGBA8UI                                   8D7Ch
#define  GL_VERTEX_ELEMENT_SWIZZLE_AMD                91A4h
#define  GL_VERTEX_ID_SWIZZLE_AMD                     91A5h
;@@ void ( GLuint index, GLenum pname, GLint param );
glVertexAttribParameteriAMD!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]


;-------------------------------------------
;-- GL_AMD_multi_draw_indirect
;-------------------------------------------

#define  GL_AMD_multi_draw_indirect                   1
;@@ void ( GLenum mode, const void *indirect, GLsizei primcount, GLsizei stride );
glMultiDrawArraysIndirectAMD!: alias function! [
	mode        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLenum mode, GLenum type, const void *indirect, GLsizei primcount, GLsizei stride );
glMultiDrawElementsIndirectAMD!: alias function! [
	mode        [ GLenum! ]
	type        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
	stride      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_AMD_name_gen_delete
;-------------------------------------------

#define  GL_AMD_name_gen_delete                       1
#define  GL_DATA_BUFFER_AMD                           9151h
#define  GL_PERFORMANCE_MONITOR_AMD                   9152h
#define  GL_QUERY_OBJECT_AMD                          9153h
#define  GL_VERTEX_ARRAY_OBJECT_AMD                   9154h
#define  GL_SAMPLER_OBJECT_AMD                        9155h
;@@ void ( GLenum identifier, GLuint num, const GLuint* names );
glDeleteNamesAMD!: alias function! [
	identifier  [ GLenum! ]
	num         [ GLuint! ]
	names       [ pointer! [GLuint!] ]
]
;@@ void ( GLenum identifier, GLuint num, GLuint* names );
glGenNamesAMD!: alias function! [
	identifier  [ GLenum! ]
	num         [ GLuint! ]
	names       [ pointer! [GLuint!] ]
]
;@@ GLboolean ( GLenum identifier, GLuint name );
glIsNameAMD!: alias function! [
	identifier  [ GLenum! ]
	name        [ GLuint! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_AMD_occlusion_query_event
;-------------------------------------------

#define  GL_AMD_occlusion_query_event                 1
#define  GL_QUERY_DEPTH_PASS_EVENT_BIT_AMD            00000001h
#define  GL_QUERY_DEPTH_FAIL_EVENT_BIT_AMD            00000002h
#define  GL_QUERY_STENCIL_FAIL_EVENT_BIT_AMD          00000004h
#define  GL_QUERY_DEPTH_BOUNDS_FAIL_EVENT_BIT_AMD     00000008h
#define  GL_OCCLUSION_QUERY_EVENT_MASK_AMD            874Fh
#define  GL_QUERY_ALL_EVENT_BITS_AMD                  FFFFFFFFh
;@@ void ( GLenum target, GLuint id, GLenum pname, GLuint param );
glQueryObjectParameteruiAMD!: alias function! [
	target      [ GLenum! ]
	id          [ GLuint! ]
	pname       [ GLenum! ]
	param       [ GLuint! ]
]


;-------------------------------------------
;-- GL_AMD_performance_monitor
;-------------------------------------------

#define  GL_AMD_performance_monitor                   1
#define  GL_COUNTER_TYPE_AMD                          8BC0h
#define  GL_COUNTER_RANGE_AMD                         8BC1h
#define  GL_UNSIGNED_INT64_AMD                        8BC2h
#define  GL_PERCENTAGE_AMD                            8BC3h
#define  GL_PERFMON_RESULT_AVAILABLE_AMD              8BC4h
#define  GL_PERFMON_RESULT_SIZE_AMD                   8BC5h
#define  GL_PERFMON_RESULT_AMD                        8BC6h
;@@ void ( GLuint monitor );
glBeginPerfMonitorAMD!: alias function! [
	monitor     [ GLuint! ]
]
;@@ void ( GLsizei n, GLuint* monitors );
glDeletePerfMonitorsAMD!: alias function! [
	n           [ GLsizei! ]
	monitors    [ pointer! [GLuint!] ]
]
;@@ void ( GLuint monitor );
glEndPerfMonitorAMD!: alias function! [
	monitor     [ GLuint! ]
]
;@@ void ( GLsizei n, GLuint* monitors );
glGenPerfMonitorsAMD!: alias function! [
	n           [ GLsizei! ]
	monitors    [ pointer! [GLuint!] ]
]
;@@ void ( GLuint monitor, GLenum pname, GLsizei dataSize, GLuint* data, GLint *bytesWritten );
glGetPerfMonitorCounterDataAMD!: alias function! [
	monitor     [ GLuint! ]
	pname       [ GLenum! ]
	dataSize    [ GLsizei! ]
	data        [ pointer! [GLuint!] ]
	bytesWritten [ pointer! [GLint!] ]
]
;@@ void ( GLuint group, GLuint counter, GLenum pname, void *data );
glGetPerfMonitorCounterInfoAMD!: alias function! [
	group       [ GLuint! ]
	counter     [ GLuint! ]
	pname       [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint group, GLuint counter, GLsizei bufSize, GLsizei* length, GLchar *counterString );
glGetPerfMonitorCounterStringAMD!: alias function! [
	group       [ GLuint! ]
	counter     [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	counterString [ GLstring! ]
]
;@@ void ( GLuint group, GLint* numCounters, GLint *maxActiveCounters, GLsizei countersSize, GLuint *counters );
glGetPerfMonitorCountersAMD!: alias function! [
	group       [ GLuint! ]
	numCounters [ pointer! [GLint!] ]
	maxActiveCounters [ pointer! [GLint!] ]
	countersSize [ GLsizei! ]
	counters    [ pointer! [GLuint!] ]
]
;@@ void ( GLuint group, GLsizei bufSize, GLsizei* length, GLchar *groupString );
glGetPerfMonitorGroupStringAMD!: alias function! [
	group       [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	groupString [ GLstring! ]
]
;@@ void ( GLint* numGroups, GLsizei groupsSize, GLuint *groups );
glGetPerfMonitorGroupsAMD!: alias function! [
	numGroups   [ pointer! [GLint!] ]
	groupsSize  [ GLsizei! ]
	groups      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint monitor, GLboolean enable, GLuint group, GLint numCounters, GLuint* counterList );
glSelectPerfMonitorCountersAMD!: alias function! [
	monitor     [ GLuint! ]
	enable      [ GLboolean! ]
	group       [ GLuint! ]
	numCounters [ GLint! ]
	counterList [ pointer! [GLuint!] ]
]


;-------------------------------------------
;-- GL_AMD_pinned_memory
;-------------------------------------------

#define  GL_AMD_pinned_memory                         1
#define  GL_EXTERNAL_VIRTUAL_MEMORY_BUFFER_AMD        9160h


;-------------------------------------------
;-- GL_AMD_program_binary_Z400
;-------------------------------------------

#define  GL_AMD_program_binary_Z400                   1
#define  GL_Z400_BINARY_AMD                           8740h


;-------------------------------------------
;-- GL_AMD_query_buffer_object
;-------------------------------------------

#define  GL_AMD_query_buffer_object                   1
#define  GL_QUERY_BUFFER_AMD                          9192h
#define  GL_QUERY_BUFFER_BINDING_AMD                  9193h
#define  GL_QUERY_RESULT_NO_WAIT_AMD                  9194h


;-------------------------------------------
;-- GL_AMD_sample_positions
;-------------------------------------------

#define  GL_AMD_sample_positions                      1
;#define  GL_SUBSAMPLE_DISTANCE_AMD                    883Fh
;@@ void ( GLenum pname, GLuint index, const GLfloat* val );
glSetMultisamplefvAMD!: alias function! [
	pname       [ GLenum! ]
	index       [ GLuint! ]
	val         [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_AMD_seamless_cubemap_per_texture
;-------------------------------------------

#define  GL_AMD_seamless_cubemap_per_texture          1
#define  GL_TEXTURE_CUBE_MAP_SEAMLESS                 884Fh


;-------------------------------------------
;-- GL_AMD_shader_atomic_counter_ops
;-------------------------------------------

#define  GL_AMD_shader_atomic_counter_ops             1


;-------------------------------------------
;-- GL_AMD_shader_ballot
;-------------------------------------------

#define  GL_AMD_shader_ballot                         1


;-------------------------------------------
;-- GL_AMD_shader_explicit_vertex_parameter
;-------------------------------------------

#define  GL_AMD_shader_explicit_vertex_parameter      1


;-------------------------------------------
;-- GL_AMD_shader_stencil_export
;-------------------------------------------

#define  GL_AMD_shader_stencil_export                 1


;-------------------------------------------
;-- GL_AMD_shader_stencil_value_export
;-------------------------------------------

#define  GL_AMD_shader_stencil_value_export           1


;-------------------------------------------
;-- GL_AMD_shader_trinary_minmax
;-------------------------------------------

#define  GL_AMD_shader_trinary_minmax                 1


;-------------------------------------------
;-- GL_AMD_sparse_texture
;-------------------------------------------

#define  GL_AMD_sparse_texture                        1
#define  GL_TEXTURE_STORAGE_SPARSE_BIT_AMD            00000001h
#define  GL_VIRTUAL_PAGE_SIZE_X_AMD                   9195h
#define  GL_VIRTUAL_PAGE_SIZE_Y_AMD                   9196h
#define  GL_VIRTUAL_PAGE_SIZE_Z_AMD                   9197h
#define  GL_MAX_SPARSE_TEXTURE_SIZE_AMD               9198h
#define  GL_MAX_SPARSE_3D_TEXTURE_SIZE_AMD            9199h
#define  GL_MAX_SPARSE_ARRAY_TEXTURE_LAYERS           919Ah
#define  GL_MIN_SPARSE_LEVEL_AMD                      919Bh
#define  GL_MIN_LOD_WARNING_AMD                       919Ch
;@@ void ( GLenum target, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLsizei layers, GLbitfield flags );
glTexStorageSparseAMD!: alias function! [
	target      [ GLenum! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	layers      [ GLsizei! ]
	flags       [ GLbitfield! ]
]
;@@ void ( GLuint texture, GLenum target, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLsizei layers, GLbitfield flags );
glTextureStorageSparseAMD!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	layers      [ GLsizei! ]
	flags       [ GLbitfield! ]
]


;-------------------------------------------
;-- GL_AMD_stencil_operation_extended
;-------------------------------------------

#define  GL_AMD_stencil_operation_extended            1
#define  GL_SET_AMD                                   874Ah
#define  GL_REPLACE_VALUE_AMD                         874Bh
#define  GL_STENCIL_OP_VALUE_AMD                      874Ch
#define  GL_STENCIL_BACK_OP_VALUE_AMD                 874Dh
;@@ void ( GLenum face, GLuint value );
glStencilOpValueAMD!: alias function! [
	face        [ GLenum! ]
	value       [ GLuint! ]
]


;-------------------------------------------
;-- GL_AMD_texture_gather_bias_lod
;-------------------------------------------

#define  GL_AMD_texture_gather_bias_lod               1


;-------------------------------------------
;-- GL_AMD_texture_texture4
;-------------------------------------------

#define  GL_AMD_texture_texture4                      1


;-------------------------------------------
;-- GL_AMD_transform_feedback3_lines_triangles
;-------------------------------------------

#define  GL_AMD_transform_feedback3_lines_triangles   1


;-------------------------------------------
;-- GL_AMD_transform_feedback4
;-------------------------------------------

#define  GL_AMD_transform_feedback4                   1
#define  GL_STREAM_RASTERIZATION_AMD                  91A0h


;-------------------------------------------
;-- GL_AMD_vertex_shader_layer
;-------------------------------------------

#define  GL_AMD_vertex_shader_layer                   1


;-------------------------------------------
;-- GL_AMD_vertex_shader_tessellator
;-------------------------------------------

#define  GL_AMD_vertex_shader_tessellator             1
#define  GL_SAMPLER_BUFFER_AMD                        9001h
#define  GL_INT_SAMPLER_BUFFER_AMD                    9002h
#define  GL_UNSIGNED_INT_SAMPLER_BUFFER_AMD           9003h
#define  GL_TESSELLATION_MODE_AMD                     9004h
#define  GL_TESSELLATION_FACTOR_AMD                   9005h
#define  GL_DISCRETE_AMD                              9006h
#define  GL_CONTINUOUS_AMD                            9007h
;@@ void ( GLfloat factor );
glTessellationFactorAMD!: alias function! [
	factor      [ GLfloat! ]
]
;@@ void ( GLenum mode );
glTessellationModeAMD!: alias function! [
	mode        [ GLenum! ]
]


;-------------------------------------------
;-- GL_AMD_vertex_shader_viewport_index
;-------------------------------------------

#define  GL_AMD_vertex_shader_viewport_index          1
