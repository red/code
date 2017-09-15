Red/System [
	Title:   "Red/System OpenGL ARB extension binding"
	Author:  "Oldes"
	File: 	 %gl-ARB.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_ARB_ES2_compatibility
;-------------------------------------------

#define  GL_ARB_ES2_compatibility                     1
#define  GL_FIXED                                     140Ch
#define  GL_IMPLEMENTATION_COLOR_READ_TYPE            8B9Ah
#define  GL_IMPLEMENTATION_COLOR_READ_FORMAT          8B9Bh
#define  GL_RGB565                                    8D62h
#define  GL_LOW_FLOAT                                 8DF0h
#define  GL_MEDIUM_FLOAT                              8DF1h
#define  GL_HIGH_FLOAT                                8DF2h
#define  GL_LOW_INT                                   8DF3h
#define  GL_MEDIUM_INT                                8DF4h
#define  GL_HIGH_INT                                  8DF5h
#define  GL_SHADER_BINARY_FORMATS                     8DF8h
#define  GL_NUM_SHADER_BINARY_FORMATS                 8DF9h
#define  GL_SHADER_COMPILER                           8DFAh
#define  GL_MAX_VERTEX_UNIFORM_VECTORS                8DFBh
#define  GL_MAX_VARYING_VECTORS                       8DFCh
#define  GL_MAX_FRAGMENT_UNIFORM_VECTORS              8DFDh
;@@ void ( GLclampf d );
glClearDepthf!: alias function! [
	d           [ GLclampf! ]
]
;@@ void ( GLclampf n, GLclampf f );
glDepthRangef!: alias function! [
	n           [ GLclampf! ]
	f           [ GLclampf! ]
]
;@@ void ( GLenum shadertype, GLenum precisiontype, GLint* range, GLint *precision );
glGetShaderPrecisionFormat!: alias function! [
	shadertype  [ GLenum! ]
	precisiontype [ GLenum! ]
	range       [ pointer! [GLint!] ]
	precision   [ pointer! [GLint!] ]
]
;@@ void ( void );
glReleaseShaderCompiler!: alias function! [
]
;@@ void ( GLsizei count, const GLuint* shaders, GLenum binaryformat, const void*binary, GLsizei length );
glShaderBinary!: alias function! [
	count       [ GLsizei! ]
	shaders     [ pointer! [GLuint!] ]
	binaryformat [ GLenum! ]
	binary      [ pointer! [byte!] ]
	length      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_ARB_ES3_1_compatibility
;-------------------------------------------

#define  GL_ARB_ES3_1_compatibility                   1
;@@ void ( GLbitfield barriers );
glMemoryBarrierByRegion!: alias function! [
	barriers    [ GLbitfield! ]
]


;-------------------------------------------
;-- GL_ARB_ES3_2_compatibility
;-------------------------------------------

#define  GL_ARB_ES3_2_compatibility                   1
#define  GL_PRIMITIVE_BOUNDING_BOX_ARB                92BEh
#define  GL_MULTISAMPLE_LINE_WIDTH_RANGE_ARB          9381h
#define  GL_MULTISAMPLE_LINE_WIDTH_GRANULARITY_ARB    9382h
;@@ void ( GLfloat minX, GLfloat minY, GLfloat minZ, GLfloat minW, GLfloat maxX, GLfloat maxY, GLfloat maxZ, GLfloat maxW );
glPrimitiveBoundingBoxARB!: alias function! [
	minX        [ GLfloat! ]
	minY        [ GLfloat! ]
	minZ        [ GLfloat! ]
	minW        [ GLfloat! ]
	maxX        [ GLfloat! ]
	maxY        [ GLfloat! ]
	maxZ        [ GLfloat! ]
	maxW        [ GLfloat! ]
]


;-------------------------------------------
;-- GL_ARB_ES3_compatibility
;-------------------------------------------

#define  GL_ARB_ES3_compatibility                     1
#define  GL_TEXTURE_IMMUTABLE_LEVELS                  82DFh
#define  GL_PRIMITIVE_RESTART_FIXED_INDEX             8D69h
#define  GL_ANY_SAMPLES_PASSED_CONSERVATIVE           8D6Ah
#define  GL_MAX_ELEMENT_INDEX                         8D6Bh
#define  GL_COMPRESSED_R11_EAC                        9270h
#define  GL_COMPRESSED_SIGNED_R11_EAC                 9271h
#define  GL_COMPRESSED_RG11_EAC                       9272h
#define  GL_COMPRESSED_SIGNED_RG11_EAC                9273h
#define  GL_COMPRESSED_RGB8_ETC2                      9274h
#define  GL_COMPRESSED_SRGB8_ETC2                     9275h
#define  GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2  9276h
#define  GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2  9277h
#define  GL_COMPRESSED_RGBA8_ETC2_EAC                 9278h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC          9279h


;-------------------------------------------
;-- GL_ARB_arrays_of_arrays
;-------------------------------------------

#define  GL_ARB_arrays_of_arrays                      1


;-------------------------------------------
;-- GL_ARB_base_instance
;-------------------------------------------

#define  GL_ARB_base_instance                         1
;@@ void ( GLenum mode, GLint first, GLsizei count, GLsizei primcount, GLuint baseinstance );
glDrawArraysInstancedBaseInstance!: alias function! [
	mode        [ GLenum! ]
	first       [ GLint! ]
	count       [ GLsizei! ]
	primcount   [ GLsizei! ]
	baseinstance [ GLuint! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount, GLuint baseinstance );
glDrawElementsInstancedBaseInstance!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
	baseinstance [ GLuint! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount, GLint basevertex, GLuint baseinstance );
glDrawElementsInstancedBaseVertexBaseInstance!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
	basevertex  [ GLint! ]
	baseinstance [ GLuint! ]
]


;-------------------------------------------
;-- GL_ARB_bindless_texture
;-------------------------------------------

#define  GL_ARB_bindless_texture                      1
#define  GL_UNSIGNED_INT64_ARB                        140Fh
;@@ GLuint64 ( GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum format );
glGetImageHandleARB!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	layered     [ GLboolean! ]
	layer       [ GLint! ]
	format      [ GLenum! ]
	return: [ GLuint64! ]

]
;@@ GLuint64 ( GLuint texture );
glGetTextureHandleARB!: alias function! [
	texture     [ GLuint! ]
	return: [ GLuint64! ]

]
;@@ GLuint64 ( GLuint texture, GLuint sampler );
glGetTextureSamplerHandleARB!: alias function! [
	texture     [ GLuint! ]
	sampler     [ GLuint! ]
	return: [ GLuint64! ]

]
;@@ void ( GLuint index, GLenum pname, GLuint64EXT* params );
glGetVertexAttribLui64vARB!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLuint64EXT-ptr! ]
]
;@@ GLboolean ( GLuint64 handle );
glIsImageHandleResidentARB!: alias function! [
	handle      [ GLuint64! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint64 handle );
glIsTextureHandleResidentARB!: alias function! [
	handle      [ GLuint64! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint64 handle );
glMakeImageHandleNonResidentARB!: alias function! [
	handle      [ GLuint64! ]
]
;@@ void ( GLuint64 handle, GLenum access );
glMakeImageHandleResidentARB!: alias function! [
	handle      [ GLuint64! ]
	access      [ GLenum! ]
]
;@@ void ( GLuint64 handle );
glMakeTextureHandleNonResidentARB!: alias function! [
	handle      [ GLuint64! ]
]
;@@ void ( GLuint64 handle );
glMakeTextureHandleResidentARB!: alias function! [
	handle      [ GLuint64! ]
]
;@@ void ( GLuint program, GLint location, GLuint64 value );
glProgramUniformHandleui64ARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	value       [ GLuint64! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64* values );
glProgramUniformHandleui64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	values      [ GLuint64-ptr! ]
]
;@@ void ( GLint location, GLuint64 value );
glUniformHandleui64ARB!: alias function! [
	location    [ GLint! ]
	value       [ GLuint64! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64* value );
glUniformHandleui64vARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64-ptr! ]
]
;@@ void ( GLuint index, GLuint64EXT x );
glVertexAttribL1ui64ARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLuint64EXT! ]
]
;@@ void ( GLuint index, const GLuint64EXT* v );
glVertexAttribL1ui64vARB!: alias function! [
	index       [ GLuint! ]
	v           [ GLuint64EXT-ptr! ]
]


;-------------------------------------------
;-- GL_ARB_blend_func_extended
;-------------------------------------------

#define  GL_ARB_blend_func_extended                   1
#define  GL_SRC1_COLOR                                88F9h
#define  GL_ONE_MINUS_SRC1_COLOR                      88FAh
#define  GL_ONE_MINUS_SRC1_ALPHA                      88FBh
#define  GL_MAX_DUAL_SOURCE_DRAW_BUFFERS              88FCh
;@@ void ( GLuint program, GLuint colorNumber, GLuint index, const GLchar * name );
glBindFragDataLocationIndexed!: alias function! [
	program     [ GLuint! ]
	colorNumber [ GLuint! ]
	index       [ GLuint! ]
	name        [ GLstring! ]
]
;@@ GLint ( GLuint program, const GLchar * name );
glGetFragDataIndex!: alias function! [
	program     [ GLuint! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]


;-------------------------------------------
;-- GL_ARB_buffer_storage
;-------------------------------------------

#define  GL_ARB_buffer_storage                        1
#define  GL_MAP_READ_BIT                              0001h
#define  GL_MAP_WRITE_BIT                             0002h
#define  GL_MAP_PERSISTENT_BIT                        00000040h
#define  GL_MAP_COHERENT_BIT                          00000080h
#define  GL_DYNAMIC_STORAGE_BIT                       0100h
#define  GL_CLIENT_STORAGE_BIT                        0200h
#define  GL_CLIENT_MAPPED_BUFFER_BARRIER_BIT          00004000h
#define  GL_BUFFER_IMMUTABLE_STORAGE                  821Fh
#define  GL_BUFFER_STORAGE_FLAGS                      8220h
;@@ void ( GLenum target, GLsizeiptr size, const void *data, GLbitfield flags );
glBufferStorage!: alias function! [
	target      [ GLenum! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
	flags       [ GLbitfield! ]
]


;-------------------------------------------
;-- GL_ARB_cl_event
;-------------------------------------------

#define  GL_ARB_cl_event                              1
#define  GL_SYNC_CL_EVENT_ARB                         8240h
#define  GL_SYNC_CL_EVENT_COMPLETE_ARB                8241h
;@@ GLsync ( cl_context context, cl_event event, GLbitfield flags );
glCreateSyncFromCLeventARB!: alias function! [
	context     [ pointer! [integer!] ]
	event       [ pointer! [integer!] ]
	flags       [ GLbitfield! ]
	return: [ GLsync! ]

]


;-------------------------------------------
;-- GL_ARB_clear_buffer_object
;-------------------------------------------

#define  GL_ARB_clear_buffer_object                   1
;@@ void ( GLenum target, GLenum internalformat, GLenum format, GLenum type, const void *data );
glClearBufferData!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum internalformat, GLintptr offset, GLsizeiptr size, GLenum format, GLenum type, const void *data );
glClearBufferSubData!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint buffer, GLenum internalformat, GLenum format, GLenum type, const void *data );
glClearNamedBufferDataEXT!: alias function! [
	buffer      [ GLuint! ]
	internalformat [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint buffer, GLenum internalformat, GLintptr offset, GLsizeiptr size, GLenum format, GLenum type, const void *data );
glClearNamedBufferSubDataEXT!: alias function! [
	buffer      [ GLuint! ]
	internalformat [ GLenum! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_ARB_clear_texture
;-------------------------------------------

#define  GL_ARB_clear_texture                         1
#define  GL_CLEAR_TEXTURE                             9365h
;@@ void ( GLuint texture, GLint level, GLenum format, GLenum type, const void *data );
glClearTexImage!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *data );
glClearTexSubImage!: alias function! [
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
;-- GL_ARB_clip_control
;-------------------------------------------

#define  GL_ARB_clip_control                          1
;#define  GL_LOWER_LEFT                                8CA1h
;#define  GL_UPPER_LEFT                                8CA2h
#define  GL_CLIP_ORIGIN                               935Ch
#define  GL_CLIP_DEPTH_MODE                           935Dh
#define  GL_NEGATIVE_ONE_TO_ONE                       935Eh
#define  GL_ZERO_TO_ONE                               935Fh
;@@ void ( GLenum origin, GLenum depth );
glClipControl!: alias function! [
	origin      [ GLenum! ]
	depth       [ GLenum! ]
]


;-------------------------------------------
;-- GL_ARB_color_buffer_float
;-------------------------------------------

#define  GL_ARB_color_buffer_float                    1
#define  GL_RGBA_FLOAT_MODE_ARB                       8820h
#define  GL_CLAMP_VERTEX_COLOR_ARB                    891Ah
#define  GL_CLAMP_FRAGMENT_COLOR_ARB                  891Bh
#define  GL_CLAMP_READ_COLOR_ARB                      891Ch
#define  GL_FIXED_ONLY_ARB                            891Dh
;@@ void ( GLenum target, GLenum clamp );
glClampColorARB!: alias function! [
	target      [ GLenum! ]
	clamp       [ GLenum! ]
]


;-------------------------------------------
;-- GL_ARB_compatibility
;-------------------------------------------

#define  GL_ARB_compatibility                         1


;-------------------------------------------
;-- GL_ARB_compressed_texture_pixel_storage
;-------------------------------------------

#define  GL_ARB_compressed_texture_pixel_storage      1
#define  GL_UNPACK_COMPRESSED_BLOCK_WIDTH             9127h
#define  GL_UNPACK_COMPRESSED_BLOCK_HEIGHT            9128h
#define  GL_UNPACK_COMPRESSED_BLOCK_DEPTH             9129h
#define  GL_UNPACK_COMPRESSED_BLOCK_SIZE              912Ah
#define  GL_PACK_COMPRESSED_BLOCK_WIDTH               912Bh
#define  GL_PACK_COMPRESSED_BLOCK_HEIGHT              912Ch
#define  GL_PACK_COMPRESSED_BLOCK_DEPTH               912Dh
#define  GL_PACK_COMPRESSED_BLOCK_SIZE                912Eh


;-------------------------------------------
;-- GL_ARB_compute_shader
;-------------------------------------------

#define  GL_ARB_compute_shader                        1
#define  GL_COMPUTE_SHADER_BIT                        00000020h
#define  GL_MAX_COMPUTE_SHARED_MEMORY_SIZE            8262h
#define  GL_MAX_COMPUTE_UNIFORM_COMPONENTS            8263h
#define  GL_MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS        8264h
#define  GL_MAX_COMPUTE_ATOMIC_COUNTERS               8265h
#define  GL_MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS   8266h
#define  GL_COMPUTE_WORK_GROUP_SIZE                   8267h
#define  GL_MAX_COMPUTE_WORK_GROUP_INVOCATIONS        90EBh
#define  GL_UNIFORM_BLOCK_REFERENCED_BY_COMPUTE_SHADER  90ECh
#define  GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_COMPUTE_SHADER  90EDh
#define  GL_DISPATCH_INDIRECT_BUFFER                  90EEh
#define  GL_DISPATCH_INDIRECT_BUFFER_BINDING          90EFh
#define  GL_COMPUTE_SHADER                            91B9h
#define  GL_MAX_COMPUTE_UNIFORM_BLOCKS                91BBh
#define  GL_MAX_COMPUTE_TEXTURE_IMAGE_UNITS           91BCh
#define  GL_MAX_COMPUTE_IMAGE_UNIFORMS                91BDh
#define  GL_MAX_COMPUTE_WORK_GROUP_COUNT              91BEh
#define  GL_MAX_COMPUTE_WORK_GROUP_SIZE               91BFh
;@@ void ( GLuint num_groups_x, GLuint num_groups_y, GLuint num_groups_z );
glDispatchCompute!: alias function! [
	num_groups_x [ GLuint! ]
	num_groups_y [ GLuint! ]
	num_groups_z [ GLuint! ]
]
;@@ void ( GLintptr indirect );
glDispatchComputeIndirect!: alias function! [
	indirect    [ GLintptr! ]
]


;-------------------------------------------
;-- GL_ARB_compute_variable_group_size
;-------------------------------------------

#define  GL_ARB_compute_variable_group_size           1
#define  GL_MAX_COMPUTE_FIXED_GROUP_INVOCATIONS_ARB   90EBh
#define  GL_MAX_COMPUTE_FIXED_GROUP_SIZE_ARB          91BFh
#define  GL_MAX_COMPUTE_VARIABLE_GROUP_INVOCATIONS_ARB  9344h
#define  GL_MAX_COMPUTE_VARIABLE_GROUP_SIZE_ARB       9345h
;@@ void ( GLuint num_groups_x, GLuint num_groups_y, GLuint num_groups_z, GLuint group_size_x, GLuint group_size_y, GLuint group_size_z );
glDispatchComputeGroupSizeARB!: alias function! [
	num_groups_x [ GLuint! ]
	num_groups_y [ GLuint! ]
	num_groups_z [ GLuint! ]
	group_size_x [ GLuint! ]
	group_size_y [ GLuint! ]
	group_size_z [ GLuint! ]
]


;-------------------------------------------
;-- GL_ARB_conditional_render_inverted
;-------------------------------------------

#define  GL_ARB_conditional_render_inverted           1
#define  GL_QUERY_WAIT_INVERTED                       8E17h
#define  GL_QUERY_NO_WAIT_INVERTED                    8E18h
#define  GL_QUERY_BY_REGION_WAIT_INVERTED             8E19h
#define  GL_QUERY_BY_REGION_NO_WAIT_INVERTED          8E1Ah


;-------------------------------------------
;-- GL_ARB_conservative_depth
;-------------------------------------------

#define  GL_ARB_conservative_depth                    1


;-------------------------------------------
;-- GL_ARB_copy_buffer
;-------------------------------------------

#define  GL_ARB_copy_buffer                           1
#define  GL_COPY_READ_BUFFER                          8F36h
#define  GL_COPY_WRITE_BUFFER                         8F37h
;@@ void ( GLenum readtarget, GLenum writetarget, GLintptr readoffset, GLintptr writeoffset, GLsizeiptr size );
glCopyBufferSubData!: alias function! [
	readtarget  [ GLenum! ]
	writetarget [ GLenum! ]
	readoffset  [ GLintptr! ]
	writeoffset [ GLintptr! ]
	size        [ GLsizeiptr! ]
]


;-------------------------------------------
;-- GL_ARB_copy_image
;-------------------------------------------

#define  GL_ARB_copy_image                            1
;@@ void ( GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srcY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei srcWidth, GLsizei srcHeight, GLsizei srcDepth );
glCopyImageSubData!: alias function! [
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
;-- GL_ARB_cull_distance
;-------------------------------------------

#define  GL_ARB_cull_distance                         1
#define  GL_MAX_CULL_DISTANCES                        82F9h
#define  GL_MAX_COMBINED_CLIP_AND_CULL_DISTANCES      82FAh


;-------------------------------------------
;-- GL_ARB_debug_output
;-------------------------------------------

#define  GL_ARB_debug_output                          1
#define  GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB              8242h
#define  GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB      8243h
#define  GL_DEBUG_CALLBACK_FUNCTION_ARB               8244h
#define  GL_DEBUG_CALLBACK_USER_PARAM_ARB             8245h
#define  GL_DEBUG_SOURCE_API_ARB                      8246h
#define  GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB            8247h
#define  GL_DEBUG_SOURCE_SHADER_COMPILER_ARB          8248h
#define  GL_DEBUG_SOURCE_THIRD_PARTY_ARB              8249h
#define  GL_DEBUG_SOURCE_APPLICATION_ARB              824Ah
#define  GL_DEBUG_SOURCE_OTHER_ARB                    824Bh
#define  GL_DEBUG_TYPE_ERROR_ARB                      824Ch
#define  GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB        824Dh
#define  GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB         824Eh
#define  GL_DEBUG_TYPE_PORTABILITY_ARB                824Fh
#define  GL_DEBUG_TYPE_PERFORMANCE_ARB                8250h
#define  GL_DEBUG_TYPE_OTHER_ARB                      8251h
#define  GL_MAX_DEBUG_MESSAGE_LENGTH_ARB              9143h
#define  GL_MAX_DEBUG_LOGGED_MESSAGES_ARB             9144h
#define  GL_DEBUG_LOGGED_MESSAGES_ARB                 9145h
#define  GL_DEBUG_SEVERITY_HIGH_ARB                   9146h
#define  GL_DEBUG_SEVERITY_MEDIUM_ARB                 9147h
#define  GL_DEBUG_SEVERITY_LOW_ARB                    9148h
;@@ void ( GLDEBUGPROCARB callback, const void *userParam );
glDebugMessageCallbackARB!: alias function! [
	callback    [ GLDEBUGPROCARB! ]
	userParam   [ pointer! [byte!] ]
]
;@@ void ( GLenum source, GLenum type, GLenum severity, GLsizei count, const GLuint* ids, GLboolean enabled );
glDebugMessageControlARB!: alias function! [
	source      [ GLenum! ]
	type        [ GLenum! ]
	severity    [ GLenum! ]
	count       [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
	enabled     [ GLboolean! ]
]
;@@ void ( GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar* buf );
glDebugMessageInsertARB!: alias function! [
	source      [ GLenum! ]
	type        [ GLenum! ]
	id          [ GLuint! ]
	severity    [ GLenum! ]
	length      [ GLsizei! ]
	buf         [ GLstring! ]
]
;@@ GLuint ( GLuint count, GLsizei bufSize, GLenum* sources, GLenum* types, GLuint* ids, GLenum* severities, GLsizei* lengths, GLchar* messageLog );
glGetDebugMessageLogARB!: alias function! [
	count       [ GLuint! ]
	bufSize     [ GLsizei! ]
	sources     [ pointer! [GLenum!] ]
	types       [ pointer! [GLenum!] ]
	ids         [ pointer! [GLuint!] ]
	severities  [ pointer! [GLenum!] ]
	lengths     [ pointer! [GLsizei!] ]
	messageLog  [ GLstring! ]
	return: [ GLuint! ]

]


;-------------------------------------------
;-- GL_ARB_depth_buffer_float
;-------------------------------------------

#define  GL_ARB_depth_buffer_float                    1
#define  GL_DEPTH_COMPONENT32F                        8CACh
#define  GL_DEPTH32F_STENCIL8                         8CADh
#define  GL_FLOAT_32_UNSIGNED_INT_24_8_REV            8DADh


;-------------------------------------------
;-- GL_ARB_depth_clamp
;-------------------------------------------

#define  GL_ARB_depth_clamp                           1
#define  GL_DEPTH_CLAMP                               864Fh


;-------------------------------------------
;-- GL_ARB_depth_texture
;-------------------------------------------

#define  GL_ARB_depth_texture                         1
#define  GL_DEPTH_COMPONENT16_ARB                     81A5h
#define  GL_DEPTH_COMPONENT24_ARB                     81A6h
#define  GL_DEPTH_COMPONENT32_ARB                     81A7h
#define  GL_TEXTURE_DEPTH_SIZE_ARB                    884Ah
#define  GL_DEPTH_TEXTURE_MODE_ARB                    884Bh


;-------------------------------------------
;-- GL_ARB_derivative_control
;-------------------------------------------

#define  GL_ARB_derivative_control                    1


;-------------------------------------------
;-- GL_ARB_direct_state_access
;-------------------------------------------

#define  GL_ARB_direct_state_access                   1
#define  GL_TEXTURE_TARGET                            1006h
#define  GL_QUERY_TARGET                              82EAh
;@@ void ( GLuint unit, GLuint texture );
glBindTextureUnit!: alias function! [
	unit        [ GLuint! ]
	texture     [ GLuint! ]
]
;@@ void ( GLuint readFramebuffer, GLuint drawFramebuffer, GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter );
glBlitNamedFramebuffer!: alias function! [
	readFramebuffer [ GLuint! ]
	drawFramebuffer [ GLuint! ]
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
;@@ GLenum ( GLuint framebuffer, GLenum target );
glCheckNamedFramebufferStatus!: alias function! [
	framebuffer [ GLuint! ]
	target      [ GLenum! ]
	return: [ GLenum! ]

]
;@@ void ( GLuint buffer, GLenum internalformat, GLenum format, GLenum type, const void *data );
glClearNamedBufferData!: alias function! [
	buffer      [ GLuint! ]
	internalformat [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint buffer, GLenum internalformat, GLintptr offset, GLsizeiptr size, GLenum format, GLenum type, const void *data );
glClearNamedBufferSubData!: alias function! [
	buffer      [ GLuint! ]
	internalformat [ GLenum! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint framebuffer, GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil );
glClearNamedFramebufferfi!: alias function! [
	framebuffer [ GLuint! ]
	buffer      [ GLenum! ]
	drawbuffer  [ GLint! ]
	depth       [ GLfloat! ]
	stencil     [ GLint! ]
]
;@@ void ( GLuint framebuffer, GLenum buffer, GLint drawbuffer, GLfloat* value );
glClearNamedFramebufferfv!: alias function! [
	framebuffer [ GLuint! ]
	buffer      [ GLenum! ]
	drawbuffer  [ GLint! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint framebuffer, GLenum buffer, GLint drawbuffer, const GLint* value );
glClearNamedFramebufferiv!: alias function! [
	framebuffer [ GLuint! ]
	buffer      [ GLenum! ]
	drawbuffer  [ GLint! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint framebuffer, GLenum buffer, GLint drawbuffer, const GLuint* value );
glClearNamedFramebufferuiv!: alias function! [
	framebuffer [ GLuint! ]
	buffer      [ GLenum! ]
	drawbuffer  [ GLint! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *data );
glCompressedTextureSubImage1D!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data );
glCompressedTextureSubImage2D!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data );
glCompressedTextureSubImage3D!: alias function! [
	texture     [ GLuint! ]
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
;@@ void ( GLuint readBuffer, GLuint writeBuffer, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size );
glCopyNamedBufferSubData!: alias function! [
	readBuffer  [ GLuint! ]
	writeBuffer [ GLuint! ]
	readOffset  [ GLintptr! ]
	writeOffset [ GLintptr! ]
	size        [ GLsizeiptr! ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width );
glCopyTextureSubImage1D!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyTextureSubImage2D!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyTextureSubImage3D!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLsizei n, GLuint* buffers );
glCreateBuffers!: alias function! [
	n           [ GLsizei! ]
	buffers     [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* framebuffers );
glCreateFramebuffers!: alias function! [
	n           [ GLsizei! ]
	framebuffers [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* pipelines );
glCreateProgramPipelines!: alias function! [
	n           [ GLsizei! ]
	pipelines   [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLsizei n, GLuint* ids );
glCreateQueries!: alias function! [
	target      [ GLenum! ]
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* renderbuffers );
glCreateRenderbuffers!: alias function! [
	n           [ GLsizei! ]
	renderbuffers [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* samplers );
glCreateSamplers!: alias function! [
	n           [ GLsizei! ]
	samplers    [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLsizei n, GLuint* textures );
glCreateTextures!: alias function! [
	target      [ GLenum! ]
	n           [ GLsizei! ]
	textures    [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* ids );
glCreateTransformFeedbacks!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* arrays );
glCreateVertexArrays!: alias function! [
	n           [ GLsizei! ]
	arrays      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint vaobj, GLuint index );
glDisableVertexArrayAttrib!: alias function! [
	vaobj       [ GLuint! ]
	index       [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint index );
glEnableVertexArrayAttrib!: alias function! [
	vaobj       [ GLuint! ]
	index       [ GLuint! ]
]
;@@ void ( GLuint buffer, GLintptr offset, GLsizeiptr length );
glFlushMappedNamedBufferRange!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	length      [ GLsizeiptr! ]
]
;@@ void ( GLuint texture );
glGenerateTextureMipmap!: alias function! [
	texture     [ GLuint! ]
]
;@@ void ( GLuint texture, GLint level, GLsizei bufSize, void *pixels );
glGetCompressedTextureImage!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	bufSize     [ GLsizei! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint buffer, GLenum pname, GLint64* params );
glGetNamedBufferParameteri64v!: alias function! [
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLint64-ptr! ]
]
;@@ void ( GLuint buffer, GLenum pname, GLint* params );
glGetNamedBufferParameteriv!: alias function! [
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint buffer, GLenum pname, void** params );
glGetNamedBufferPointerv!: alias function! [
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ binary-ptr! ]
]
;@@ void ( GLuint buffer, GLintptr offset, GLsizeiptr size, void *data );
glGetNamedBufferSubData!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLenum pname, GLint* params );
glGetNamedFramebufferAttachmentParameteriv!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint framebuffer, GLenum pname, GLint* param );
glGetNamedFramebufferParameteriv!: alias function! [
	framebuffer [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLuint renderbuffer, GLenum pname, GLint* params );
glGetNamedRenderbufferParameteriv!: alias function! [
	renderbuffer [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint id, GLuint buffer, GLenum pname, GLintptr offset );
glGetQueryBufferObjecti64v!: alias function! [
	id          [ GLuint! ]
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint id, GLuint buffer, GLenum pname, GLintptr offset );
glGetQueryBufferObjectiv!: alias function! [
	id          [ GLuint! ]
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint id, GLuint buffer, GLenum pname, GLintptr offset );
glGetQueryBufferObjectui64v!: alias function! [
	id          [ GLuint! ]
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint id, GLuint buffer, GLenum pname, GLintptr offset );
glGetQueryBufferObjectuiv!: alias function! [
	id          [ GLuint! ]
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLuint texture, GLint level, GLenum format, GLenum type, GLsizei bufSize, void *pixels );
glGetTextureImage!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	bufSize     [ GLsizei! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLint level, GLenum pname, GLfloat* params );
glGetTextureLevelParameterfv!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint texture, GLint level, GLenum pname, GLint* params );
glGetTextureLevelParameteriv!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint texture, GLenum pname, GLint* params );
glGetTextureParameterIiv!: alias function! [
	texture     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint texture, GLenum pname, GLuint* params );
glGetTextureParameterIuiv!: alias function! [
	texture     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint texture, GLenum pname, GLfloat* params );
glGetTextureParameterfv!: alias function! [
	texture     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint texture, GLenum pname, GLint* params );
glGetTextureParameteriv!: alias function! [
	texture     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint xfb, GLenum pname, GLuint index, GLint64* param );
glGetTransformFeedbacki64_v!: alias function! [
	xfb         [ GLuint! ]
	pname       [ GLenum! ]
	index       [ GLuint! ]
	param       [ GLint64-ptr! ]
]
;@@ void ( GLuint xfb, GLenum pname, GLuint index, GLint* param );
glGetTransformFeedbacki_v!: alias function! [
	xfb         [ GLuint! ]
	pname       [ GLenum! ]
	index       [ GLuint! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLuint xfb, GLenum pname, GLint* param );
glGetTransformFeedbackiv!: alias function! [
	xfb         [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLuint vaobj, GLuint index, GLenum pname, GLint64* param );
glGetVertexArrayIndexed64iv!: alias function! [
	vaobj       [ GLuint! ]
	index       [ GLuint! ]
	pname       [ GLenum! ]
	param       [ GLint64-ptr! ]
]
;@@ void ( GLuint vaobj, GLuint index, GLenum pname, GLint* param );
glGetVertexArrayIndexediv!: alias function! [
	vaobj       [ GLuint! ]
	index       [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLuint vaobj, GLenum pname, GLint* param );
glGetVertexArrayiv!: alias function! [
	vaobj       [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLuint framebuffer, GLsizei numAttachments, const GLenum* attachments );
glInvalidateNamedFramebufferData!: alias function! [
	framebuffer [ GLuint! ]
	numAttachments [ GLsizei! ]
	attachments [ pointer! [GLenum!] ]
]
;@@ void ( GLuint framebuffer, GLsizei numAttachments, const GLenum* attachments, GLint x, GLint y, GLsizei width, GLsizei height );
glInvalidateNamedFramebufferSubData!: alias function! [
	framebuffer [ GLuint! ]
	numAttachments [ GLsizei! ]
	attachments [ pointer! [GLenum!] ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void * ( GLuint buffer, GLenum access );
glMapNamedBuffer!: alias function! [
	buffer      [ GLuint! ]
	access      [ GLenum! ]
	return: [ pointer! [byte!] ]

]
;@@ void * ( GLuint buffer, GLintptr offset, GLsizeiptr length, GLbitfield access );
glMapNamedBufferRange!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	length      [ GLsizeiptr! ]
	access      [ GLbitfield! ]
	return: [ pointer! [byte!] ]

]
;@@ void ( GLuint buffer, GLsizeiptr size, const void *data, GLenum usage );
glNamedBufferData!: alias function! [
	buffer      [ GLuint! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
	usage       [ GLenum! ]
]
;@@ void ( GLuint buffer, GLsizeiptr size, const void *data, GLbitfield flags );
glNamedBufferStorage!: alias function! [
	buffer      [ GLuint! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
	flags       [ GLbitfield! ]
]
;@@ void ( GLuint buffer, GLintptr offset, GLsizeiptr size, const void *data );
glNamedBufferSubData!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint framebuffer, GLenum mode );
glNamedFramebufferDrawBuffer!: alias function! [
	framebuffer [ GLuint! ]
	mode        [ GLenum! ]
]
;@@ void ( GLuint framebuffer, GLsizei n, const GLenum* bufs );
glNamedFramebufferDrawBuffers!: alias function! [
	framebuffer [ GLuint! ]
	n           [ GLsizei! ]
	bufs        [ pointer! [GLenum!] ]
]
;@@ void ( GLuint framebuffer, GLenum pname, GLint param );
glNamedFramebufferParameteri!: alias function! [
	framebuffer [ GLuint! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLuint framebuffer, GLenum mode );
glNamedFramebufferReadBuffer!: alias function! [
	framebuffer [ GLuint! ]
	mode        [ GLenum! ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer );
glNamedFramebufferRenderbuffer!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	renderbuffertarget [ GLenum! ]
	renderbuffer [ GLuint! ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLuint texture, GLint level );
glNamedFramebufferTexture!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLint layer );
glNamedFramebufferTextureLayer!: alias function! [
	framebuffer [ GLuint! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	layer       [ GLint! ]
]
;@@ void ( GLuint renderbuffer, GLenum internalformat, GLsizei width, GLsizei height );
glNamedRenderbufferStorage!: alias function! [
	renderbuffer [ GLuint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint renderbuffer, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height );
glNamedRenderbufferStorageMultisample!: alias function! [
	renderbuffer [ GLuint! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint texture, GLenum internalformat, GLuint buffer );
glTextureBuffer!: alias function! [
	texture     [ GLuint! ]
	internalformat [ GLenum! ]
	buffer      [ GLuint! ]
]
;@@ void ( GLuint texture, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size );
glTextureBufferRange!: alias function! [
	texture     [ GLuint! ]
	internalformat [ GLenum! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
]
;@@ void ( GLuint texture, GLenum pname, const GLint* params );
glTextureParameterIiv!: alias function! [
	texture     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint texture, GLenum pname, const GLuint* params );
glTextureParameterIuiv!: alias function! [
	texture     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint texture, GLenum pname, GLfloat param );
glTextureParameterf!: alias function! [
	texture     [ GLuint! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLuint texture, GLenum pname, const GLfloat* param );
glTextureParameterfv!: alias function! [
	texture     [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint texture, GLenum pname, GLint param );
glTextureParameteri!: alias function! [
	texture     [ GLuint! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLuint texture, GLenum pname, const GLint* param );
glTextureParameteriv!: alias function! [
	texture     [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLuint texture, GLsizei levels, GLenum internalformat, GLsizei width );
glTextureStorage1D!: alias function! [
	texture     [ GLuint! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
]
;@@ void ( GLuint texture, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height );
glTextureStorage2D!: alias function! [
	texture     [ GLuint! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint texture, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations );
glTextureStorage2DMultisample!: alias function! [
	texture     [ GLuint! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	fixedsamplelocations [ GLboolean! ]
]
;@@ void ( GLuint texture, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth );
glTextureStorage3D!: alias function! [
	texture     [ GLuint! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
]
;@@ void ( GLuint texture, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations );
glTextureStorage3DMultisample!: alias function! [
	texture     [ GLuint! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	fixedsamplelocations [ GLboolean! ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const void *pixels );
glTextureSubImage1D!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels );
glTextureSubImage2D!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels );
glTextureSubImage3D!: alias function! [
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
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint xfb, GLuint index, GLuint buffer );
glTransformFeedbackBufferBase!: alias function! [
	xfb         [ GLuint! ]
	index       [ GLuint! ]
	buffer      [ GLuint! ]
]
;@@ void ( GLuint xfb, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size );
glTransformFeedbackBufferRange!: alias function! [
	xfb         [ GLuint! ]
	index       [ GLuint! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
]
;@@ GLboolean ( GLuint buffer );
glUnmapNamedBuffer!: alias function! [
	buffer      [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint vaobj, GLuint attribindex, GLuint bindingindex );
glVertexArrayAttribBinding!: alias function! [
	vaobj       [ GLuint! ]
	attribindex [ GLuint! ]
	bindingindex [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset );
glVertexArrayAttribFormat!: alias function! [
	vaobj       [ GLuint! ]
	attribindex [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	relativeoffset [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset );
glVertexArrayAttribIFormat!: alias function! [
	vaobj       [ GLuint! ]
	attribindex [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	relativeoffset [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset );
glVertexArrayAttribLFormat!: alias function! [
	vaobj       [ GLuint! ]
	attribindex [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	relativeoffset [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint bindingindex, GLuint divisor );
glVertexArrayBindingDivisor!: alias function! [
	vaobj       [ GLuint! ]
	bindingindex [ GLuint! ]
	divisor     [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint buffer );
glVertexArrayElementBuffer!: alias function! [
	vaobj       [ GLuint! ]
	buffer      [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride );
glVertexArrayVertexBuffer!: alias function! [
	vaobj       [ GLuint! ]
	bindingindex [ GLuint! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLuint vaobj, GLuint first, GLsizei count, const GLuint* buffers, const GLintptr *offsets, const GLsizei *strides );
glVertexArrayVertexBuffers!: alias function! [
	vaobj       [ GLuint! ]
	first       [ GLuint! ]
	count       [ GLsizei! ]
	buffers     [ pointer! [GLuint!] ]
	offsets     [ pointer! [GLintptr!] ]
	strides     [ pointer! [GLsizei!] ]
]


;-------------------------------------------
;-- GL_ARB_draw_buffers
;-------------------------------------------

#define  GL_ARB_draw_buffers                          1
#define  GL_MAX_DRAW_BUFFERS_ARB                      8824h
#define  GL_DRAW_BUFFER0_ARB                          8825h
#define  GL_DRAW_BUFFER1_ARB                          8826h
#define  GL_DRAW_BUFFER2_ARB                          8827h
#define  GL_DRAW_BUFFER3_ARB                          8828h
#define  GL_DRAW_BUFFER4_ARB                          8829h
#define  GL_DRAW_BUFFER5_ARB                          882Ah
#define  GL_DRAW_BUFFER6_ARB                          882Bh
#define  GL_DRAW_BUFFER7_ARB                          882Ch
#define  GL_DRAW_BUFFER8_ARB                          882Dh
#define  GL_DRAW_BUFFER9_ARB                          882Eh
#define  GL_DRAW_BUFFER10_ARB                         882Fh
#define  GL_DRAW_BUFFER11_ARB                         8830h
#define  GL_DRAW_BUFFER12_ARB                         8831h
#define  GL_DRAW_BUFFER13_ARB                         8832h
#define  GL_DRAW_BUFFER14_ARB                         8833h
#define  GL_DRAW_BUFFER15_ARB                         8834h
;@@ void ( GLsizei n, const GLenum* bufs );
glDrawBuffersARB!: alias function! [
	n           [ GLsizei! ]
	bufs        [ pointer! [GLenum!] ]
]


;-------------------------------------------
;-- GL_ARB_draw_buffers_blend
;-------------------------------------------

#define  GL_ARB_draw_buffers_blend                    1
;@@ void ( GLuint buf, GLenum modeRGB, GLenum modeAlpha );
glBlendEquationSeparateiARB!: alias function! [
	buf         [ GLuint! ]
	modeRGB     [ GLenum! ]
	modeAlpha   [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum mode );
glBlendEquationiARB!: alias function! [
	buf         [ GLuint! ]
	mode        [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha );
glBlendFuncSeparateiARB!: alias function! [
	buf         [ GLuint! ]
	srcRGB      [ GLenum! ]
	dstRGB      [ GLenum! ]
	srcAlpha    [ GLenum! ]
	dstAlpha    [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum src, GLenum dst );
glBlendFunciARB!: alias function! [
	buf         [ GLuint! ]
	src         [ GLenum! ]
	dst         [ GLenum! ]
]


;-------------------------------------------
;-- GL_ARB_draw_elements_base_vertex
;-------------------------------------------

#define  GL_ARB_draw_elements_base_vertex             1
;@@ void ( GLenum mode, GLsizei count, GLenum type, void *indices, GLint basevertex );
glDrawElementsBaseVertex!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	basevertex  [ GLint! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount, GLint basevertex );
glDrawElementsInstancedBaseVertex!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
	basevertex  [ GLint! ]
]
;@@ void ( GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, void *indices, GLint basevertex );
glDrawRangeElementsBaseVertex!: alias function! [
	mode        [ GLenum! ]
	start       [ GLuint! ]
	end         [ GLuint! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	basevertex  [ GLint! ]
]
;@@ void ( GLenum mode, GLsizei* count, GLenum type, void**indices, GLsizei primcount, GLint *basevertex );
glMultiDrawElementsBaseVertex!: alias function! [
	mode        [ GLenum! ]
	count       [ pointer! [GLsizei!] ]
	type        [ GLenum! ]
	indices     [ binary-ptr! ]
	primcount   [ GLsizei! ]
	basevertex  [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_ARB_draw_indirect
;-------------------------------------------

#define  GL_ARB_draw_indirect                         1
#define  GL_DRAW_INDIRECT_BUFFER                      8F3Fh
#define  GL_DRAW_INDIRECT_BUFFER_BINDING              8F43h
;@@ void ( GLenum mode, const void *indirect );
glDrawArraysIndirect!: alias function! [
	mode        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
]
;@@ void ( GLenum mode, GLenum type, const void *indirect );
glDrawElementsIndirect!: alias function! [
	mode        [ GLenum! ]
	type        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_ARB_draw_instanced
;-------------------------------------------

#define  GL_ARB_draw_instanced                        1


;-------------------------------------------
;-- GL_ARB_enhanced_layouts
;-------------------------------------------

#define  GL_ARB_enhanced_layouts                      1
#define  GL_LOCATION_COMPONENT                        934Ah
#define  GL_TRANSFORM_FEEDBACK_BUFFER_INDEX           934Bh
#define  GL_TRANSFORM_FEEDBACK_BUFFER_STRIDE          934Ch


;-------------------------------------------
;-- GL_ARB_explicit_attrib_location
;-------------------------------------------

#define  GL_ARB_explicit_attrib_location              1


;-------------------------------------------
;-- GL_ARB_explicit_uniform_location
;-------------------------------------------

#define  GL_ARB_explicit_uniform_location             1
#define  GL_MAX_UNIFORM_LOCATIONS                     826Eh


;-------------------------------------------
;-- GL_ARB_fragment_coord_conventions
;-------------------------------------------

#define  GL_ARB_fragment_coord_conventions            1


;-------------------------------------------
;-- GL_ARB_fragment_layer_viewport
;-------------------------------------------

#define  GL_ARB_fragment_layer_viewport               1


;-------------------------------------------
;-- GL_ARB_fragment_program
;-------------------------------------------

#define  GL_ARB_fragment_program                      1
#define  GL_FRAGMENT_PROGRAM_ARB                      8804h
#define  GL_PROGRAM_ALU_INSTRUCTIONS_ARB              8805h
#define  GL_PROGRAM_TEX_INSTRUCTIONS_ARB              8806h
#define  GL_PROGRAM_TEX_INDIRECTIONS_ARB              8807h
#define  GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB       8808h
#define  GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB       8809h
#define  GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB       880Ah
#define  GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB          880Bh
#define  GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB          880Ch
#define  GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB          880Dh
#define  GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB   880Eh
#define  GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB   880Fh
#define  GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB   8810h
#define  GL_MAX_TEXTURE_COORDS_ARB                    8871h
#define  GL_MAX_TEXTURE_IMAGE_UNITS_ARB               8872h


;-------------------------------------------
;-- GL_ARB_fragment_program_shadow
;-------------------------------------------

#define  GL_ARB_fragment_program_shadow               1


;-------------------------------------------
;-- GL_ARB_fragment_shader
;-------------------------------------------

#define  GL_ARB_fragment_shader                       1
#define  GL_FRAGMENT_SHADER_ARB                       8B30h
#define  GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB       8B49h
#define  GL_FRAGMENT_SHADER_DERIVATIVE_HINT_ARB       8B8Bh


;-------------------------------------------
;-- GL_ARB_fragment_shader_interlock
;-------------------------------------------

#define  GL_ARB_fragment_shader_interlock             1


;-------------------------------------------
;-- GL_ARB_framebuffer_no_attachments
;-------------------------------------------

#define  GL_ARB_framebuffer_no_attachments            1
#define  GL_FRAMEBUFFER_DEFAULT_WIDTH                 9310h
#define  GL_FRAMEBUFFER_DEFAULT_HEIGHT                9311h
#define  GL_FRAMEBUFFER_DEFAULT_LAYERS                9312h
#define  GL_FRAMEBUFFER_DEFAULT_SAMPLES               9313h
#define  GL_FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS  9314h
#define  GL_MAX_FRAMEBUFFER_WIDTH                     9315h
#define  GL_MAX_FRAMEBUFFER_HEIGHT                    9316h
#define  GL_MAX_FRAMEBUFFER_LAYERS                    9317h
#define  GL_MAX_FRAMEBUFFER_SAMPLES                   9318h
;@@ void ( GLenum target, GLenum pname, GLint param );
glFramebufferParameteri!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetFramebufferParameteriv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint framebuffer, GLenum pname, GLint* params );
glGetNamedFramebufferParameterivEXT!: alias function! [
	framebuffer [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint framebuffer, GLenum pname, GLint param );
glNamedFramebufferParameteriEXT!: alias function! [
	framebuffer [ GLuint! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]


;-------------------------------------------
;-- GL_ARB_framebuffer_object
;-------------------------------------------

#define  GL_ARB_framebuffer_object                    1
#define  GL_INVALID_FRAMEBUFFER_OPERATION             0506h
#define  GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING     8210h
#define  GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE     8211h
#define  GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE           8212h
#define  GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE         8213h
#define  GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE          8214h
#define  GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE         8215h
#define  GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE         8216h
#define  GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE       8217h
#define  GL_FRAMEBUFFER_DEFAULT                       8218h
#define  GL_FRAMEBUFFER_UNDEFINED                     8219h
#define  GL_DEPTH_STENCIL_ATTACHMENT                  821Ah
#define  GL_INDEX                                     8222h
#define  GL_MAX_RENDERBUFFER_SIZE                     84E8h
#define  GL_DEPTH_STENCIL                             84F9h
#define  GL_UNSIGNED_INT_24_8                         84FAh
#define  GL_DEPTH24_STENCIL8                          88F0h
#define  GL_TEXTURE_STENCIL_SIZE                      88F1h
#define  GL_UNSIGNED_NORMALIZED                       8C17h
;#define  GL_SRGB                                      8C40h
#define  GL_DRAW_FRAMEBUFFER_BINDING                  8CA6h
#define  GL_FRAMEBUFFER_BINDING                       8CA6h
#define  GL_RENDERBUFFER_BINDING                      8CA7h
#define  GL_READ_FRAMEBUFFER                          8CA8h
#define  GL_DRAW_FRAMEBUFFER                          8CA9h
#define  GL_READ_FRAMEBUFFER_BINDING                  8CAAh
#define  GL_RENDERBUFFER_SAMPLES                      8CABh
#define  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE        8CD0h
#define  GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME        8CD1h
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL      8CD2h
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE  8CD3h
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER      8CD4h
#define  GL_FRAMEBUFFER_COMPLETE                      8CD5h
#define  GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT         8CD6h
#define  GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT  8CD7h
#define  GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER        8CDBh
#define  GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER        8CDCh
#define  GL_FRAMEBUFFER_UNSUPPORTED                   8CDDh
#define  GL_MAX_COLOR_ATTACHMENTS                     8CDFh
#define  GL_COLOR_ATTACHMENT0                         8CE0h
#define  GL_COLOR_ATTACHMENT1                         8CE1h
#define  GL_COLOR_ATTACHMENT2                         8CE2h
#define  GL_COLOR_ATTACHMENT3                         8CE3h
#define  GL_COLOR_ATTACHMENT4                         8CE4h
#define  GL_COLOR_ATTACHMENT5                         8CE5h
#define  GL_COLOR_ATTACHMENT6                         8CE6h
#define  GL_COLOR_ATTACHMENT7                         8CE7h
#define  GL_COLOR_ATTACHMENT8                         8CE8h
#define  GL_COLOR_ATTACHMENT9                         8CE9h
#define  GL_COLOR_ATTACHMENT10                        8CEAh
#define  GL_COLOR_ATTACHMENT11                        8CEBh
#define  GL_COLOR_ATTACHMENT12                        8CECh
#define  GL_COLOR_ATTACHMENT13                        8CEDh
#define  GL_COLOR_ATTACHMENT14                        8CEEh
#define  GL_COLOR_ATTACHMENT15                        8CEFh
#define  GL_DEPTH_ATTACHMENT                          8D00h
#define  GL_STENCIL_ATTACHMENT                        8D20h
#define  GL_FRAMEBUFFER                               8D40h
#define  GL_RENDERBUFFER                              8D41h
#define  GL_RENDERBUFFER_WIDTH                        8D42h
#define  GL_RENDERBUFFER_HEIGHT                       8D43h
#define  GL_RENDERBUFFER_INTERNAL_FORMAT              8D44h
#define  GL_STENCIL_INDEX1                            8D46h
#define  GL_STENCIL_INDEX4                            8D47h
#define  GL_STENCIL_INDEX8                            8D48h
#define  GL_STENCIL_INDEX16                           8D49h
#define  GL_RENDERBUFFER_RED_SIZE                     8D50h
#define  GL_RENDERBUFFER_GREEN_SIZE                   8D51h
#define  GL_RENDERBUFFER_BLUE_SIZE                    8D52h
#define  GL_RENDERBUFFER_ALPHA_SIZE                   8D53h
#define  GL_RENDERBUFFER_DEPTH_SIZE                   8D54h
#define  GL_RENDERBUFFER_STENCIL_SIZE                 8D55h
#define  GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE        8D56h
#define  GL_MAX_SAMPLES                               8D57h
;@@ void ( GLenum target, GLuint framebuffer );
glBindFramebuffer!: alias function! [
	target      [ GLenum! ]
	framebuffer [ GLuint! ]
]
;@@ void ( GLenum target, GLuint renderbuffer );
glBindRenderbuffer!: alias function! [
	target      [ GLenum! ]
	renderbuffer [ GLuint! ]
]
;@@ void ( GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter );
glBlitFramebuffer!: alias function! [
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
;@@ GLenum ( GLenum target );
glCheckFramebufferStatus!: alias function! [
	target      [ GLenum! ]
	return: [ GLenum! ]

]
;@@ void ( GLsizei n, const GLuint* framebuffers );
glDeleteFramebuffers!: alias function! [
	n           [ GLsizei! ]
	framebuffers [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, const GLuint* renderbuffers );
glDeleteRenderbuffers!: alias function! [
	n           [ GLsizei! ]
	renderbuffers [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer );
glFramebufferRenderbuffer!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	renderbuffertarget [ GLenum! ]
	renderbuffer [ GLuint! ]
]
;@@ void ( GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level );
glFramebufferTexture1D!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	textarget   [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level );
glFramebufferTexture2D!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	textarget   [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint layer );
glFramebufferTexture3D!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	textarget   [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	layer       [ GLint! ]
]
;@@ void ( GLenum target,GLenum attachment, GLuint texture,GLint level,GLint layer );
glFramebufferTextureLayer!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	layer       [ GLint! ]
]
;@@ void ( GLsizei n, GLuint* framebuffers );
glGenFramebuffers!: alias function! [
	n           [ GLsizei! ]
	framebuffers [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* renderbuffers );
glGenRenderbuffers!: alias function! [
	n           [ GLsizei! ]
	renderbuffers [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target );
glGenerateMipmap!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLenum target, GLenum attachment, GLenum pname, GLint* params );
glGetFramebufferAttachmentParameteriv!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetRenderbufferParameteriv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint framebuffer );
glIsFramebuffer!: alias function! [
	framebuffer [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint renderbuffer );
glIsRenderbuffer!: alias function! [
	renderbuffer [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum target, GLenum internalformat, GLsizei width, GLsizei height );
glRenderbufferStorage!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height );
glRenderbufferStorageMultisample!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_ARB_framebuffer_sRGB
;-------------------------------------------

#define  GL_ARB_framebuffer_sRGB                      1
#define  GL_FRAMEBUFFER_SRGB                          8DB9h


;-------------------------------------------
;-- GL_ARB_geometry_shader4
;-------------------------------------------

#define  GL_ARB_geometry_shader4                      1
#define  GL_LINES_ADJACENCY_ARB                       0Ah
#define  GL_LINE_STRIP_ADJACENCY_ARB                  0Bh
#define  GL_TRIANGLES_ADJACENCY_ARB                   0Ch
#define  GL_TRIANGLE_STRIP_ADJACENCY_ARB              0Dh
#define  GL_PROGRAM_POINT_SIZE_ARB                    8642h
#define  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB      8C29h
;#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER      8CD4h
#define  GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB        8DA7h
#define  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB  8DA8h
#define  GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB    8DA9h
#define  GL_GEOMETRY_SHADER_ARB                       8DD9h
#define  GL_GEOMETRY_VERTICES_OUT_ARB                 8DDAh
#define  GL_GEOMETRY_INPUT_TYPE_ARB                   8DDBh
#define  GL_GEOMETRY_OUTPUT_TYPE_ARB                  8DDCh
#define  GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB       8DDDh
#define  GL_MAX_VERTEX_VARYING_COMPONENTS_ARB         8DDEh
#define  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB       8DDFh
#define  GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB          8DE0h
#define  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB  8DE1h
;@@ void ( GLenum target, GLenum attachment, GLuint texture, GLint level );
glFramebufferTextureARB!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLenum target, GLenum attachment, GLuint texture, GLint level, GLenum face );
glFramebufferTextureFaceARB!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	face        [ GLenum! ]
]
;@@ void ( GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer );
glFramebufferTextureLayerARB!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	layer       [ GLint! ]
]
;@@ void ( GLuint program, GLenum pname, GLint value );
glProgramParameteriARB!: alias function! [
	program     [ GLuint! ]
	pname       [ GLenum! ]
	value       [ GLint! ]
]


;-------------------------------------------
;-- GL_ARB_get_program_binary
;-------------------------------------------

#define  GL_ARB_get_program_binary                    1
#define  GL_PROGRAM_BINARY_RETRIEVABLE_HINT           8257h
#define  GL_PROGRAM_BINARY_LENGTH                     8741h
#define  GL_NUM_PROGRAM_BINARY_FORMATS                87FEh
#define  GL_PROGRAM_BINARY_FORMATS                    87FFh
;@@ void ( GLuint program, GLsizei bufSize, GLsizei* length, GLenum *binaryFormat, void*binary );
glGetProgramBinary!: alias function! [
	program     [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	binaryFormat [ pointer! [GLenum!] ]
	binary      [ pointer! [byte!] ]
]
;@@ void ( GLuint program, GLenum binaryFormat, const void *binary, GLsizei length );
glProgramBinary!: alias function! [
	program     [ GLuint! ]
	binaryFormat [ GLenum! ]
	binary      [ pointer! [byte!] ]
	length      [ GLsizei! ]
]
;@@ void ( GLuint program, GLenum pname, GLint value );
glProgramParameteri!: alias function! [
	program     [ GLuint! ]
	pname       [ GLenum! ]
	value       [ GLint! ]
]


;-------------------------------------------
;-- GL_ARB_get_texture_sub_image
;-------------------------------------------

#define  GL_ARB_get_texture_sub_image                 1
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLsizei bufSize, void *pixels );
glGetCompressedTextureSubImage!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	bufSize     [ GLsizei! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLsizei bufSize, void *pixels );
glGetTextureSubImage!: alias function! [
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
	bufSize     [ GLsizei! ]
	pixels      [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_ARB_gl_spirv
;-------------------------------------------

#define  GL_ARB_gl_spirv                              1
#define  GL_SHADER_BINARY_FORMAT_SPIR_V_ARB           9551h
#define  GL_SPIR_V_BINARY_ARB                         9552h
;@@ void ( GLuint shader, const GLchar* pEntryPoint, GLuint numSpecializationConstants, const GLuint* pConstantIndex, const GLuint* pConstantValue );
glSpecializeShaderARB!: alias function! [
	shader      [ GLuint! ]
	pEntryPoint [ GLstring! ]
	numSpecializationConstants [ GLuint! ]
	pConstantIndex [ pointer! [GLuint!] ]
	pConstantValue [ pointer! [GLuint!] ]
]


;-------------------------------------------
;-- GL_ARB_gpu_shader5
;-------------------------------------------

#define  GL_ARB_gpu_shader5                           1
#define  GL_GEOMETRY_SHADER_INVOCATIONS               887Fh
#define  GL_MAX_GEOMETRY_SHADER_INVOCATIONS           8E5Ah
#define  GL_MIN_FRAGMENT_INTERPOLATION_OFFSET         8E5Bh
#define  GL_MAX_FRAGMENT_INTERPOLATION_OFFSET         8E5Ch
#define  GL_FRAGMENT_INTERPOLATION_OFFSET_BITS        8E5Dh
#define  GL_MAX_VERTEX_STREAMS                        8E71h


;-------------------------------------------
;-- GL_ARB_gpu_shader_fp64
;-------------------------------------------

#define  GL_ARB_gpu_shader_fp64                       1
#define  GL_DOUBLE_MAT2                               8F46h
#define  GL_DOUBLE_MAT3                               8F47h
#define  GL_DOUBLE_MAT4                               8F48h
#define  GL_DOUBLE_MAT2x3                             8F49h
#define  GL_DOUBLE_MAT2x4                             8F4Ah
#define  GL_DOUBLE_MAT3x2                             8F4Bh
#define  GL_DOUBLE_MAT3x4                             8F4Ch
#define  GL_DOUBLE_MAT4x2                             8F4Dh
#define  GL_DOUBLE_MAT4x3                             8F4Eh
#define  GL_DOUBLE_VEC2                               8FFCh
#define  GL_DOUBLE_VEC3                               8FFDh
#define  GL_DOUBLE_VEC4                               8FFEh
;@@ void ( GLuint program, GLint location, GLdouble* params );
glGetUniformdv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLdouble x );
glUniform1d!: alias function! [
	location    [ GLint! ]
	x           [ GLdouble! ]
]
;@@ void ( GLint location, GLsizei count, const GLdouble* value );
glUniform1dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLdouble x, GLdouble y );
glUniform2d!: alias function! [
	location    [ GLint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( GLint location, GLsizei count, const GLdouble* value );
glUniform2dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLdouble x, GLdouble y, GLdouble z );
glUniform3d!: alias function! [
	location    [ GLint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLint location, GLsizei count, const GLdouble* value );
glUniform3dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glUniform4d!: alias function! [
	location    [ GLint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLint location, GLsizei count, const GLdouble* value );
glUniform4dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glUniformMatrix2dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glUniformMatrix2x3dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glUniformMatrix2x4dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glUniformMatrix3dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glUniformMatrix3x2dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glUniformMatrix3x4dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glUniformMatrix4dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glUniformMatrix4x2dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glUniformMatrix4x3dv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]


;-------------------------------------------
;-- GL_ARB_gpu_shader_int64
;-------------------------------------------

#define  GL_ARB_gpu_shader_int64                      1
#define  GL_INT64_ARB                                 140Eh
;#define  GL_UNSIGNED_INT64_ARB                        140Fh
#define  GL_INT64_VEC2_ARB                            8FE9h
#define  GL_INT64_VEC3_ARB                            8FEAh
#define  GL_INT64_VEC4_ARB                            8FEBh
#define  GL_UNSIGNED_INT64_VEC2_ARB                   8FF5h
#define  GL_UNSIGNED_INT64_VEC3_ARB                   8FF6h
#define  GL_UNSIGNED_INT64_VEC4_ARB                   8FF7h
;@@ void ( GLuint program, GLint location, GLint64* params );
glGetUniformi64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	params      [ GLint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLuint64* params );
glGetUniformui64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	params      [ GLuint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLsizei bufSize, GLint64* params );
glGetnUniformi64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	bufSize     [ GLsizei! ]
	params      [ GLint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLsizei bufSize, GLuint64* params );
glGetnUniformui64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	bufSize     [ GLsizei! ]
	params      [ GLuint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLint64 x );
glProgramUniform1i64ARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint64! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint64* value );
glProgramUniform1i64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLuint64 x );
glProgramUniform1ui64ARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint64! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64* value );
glProgramUniform1ui64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLint64 x, GLint64 y );
glProgramUniform2i64ARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint64! ]
	y           [ GLint64! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint64* value );
glProgramUniform2i64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLuint64 x, GLuint64 y );
glProgramUniform2ui64ARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint64! ]
	y           [ GLuint64! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64* value );
glProgramUniform2ui64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLint64 x, GLint64 y, GLint64 z );
glProgramUniform3i64ARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint64! ]
	y           [ GLint64! ]
	z           [ GLint64! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint64* value );
glProgramUniform3i64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLuint64 x, GLuint64 y, GLuint64 z );
glProgramUniform3ui64ARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint64! ]
	y           [ GLuint64! ]
	z           [ GLuint64! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64* value );
glProgramUniform3ui64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLint64 x, GLint64 y, GLint64 z, GLint64 w );
glProgramUniform4i64ARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint64! ]
	y           [ GLint64! ]
	z           [ GLint64! ]
	w           [ GLint64! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint64* value );
glProgramUniform4i64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLuint64 x, GLuint64 y, GLuint64 z, GLuint64 w );
glProgramUniform4ui64ARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint64! ]
	y           [ GLuint64! ]
	z           [ GLuint64! ]
	w           [ GLuint64! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64* value );
glProgramUniform4ui64vARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64-ptr! ]
]
;@@ void ( GLint location, GLint64 x );
glUniform1i64ARB!: alias function! [
	location    [ GLint! ]
	x           [ GLint64! ]
]
;@@ void ( GLint location, GLsizei count, const GLint64* value );
glUniform1i64vARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64-ptr! ]
]
;@@ void ( GLint location, GLuint64 x );
glUniform1ui64ARB!: alias function! [
	location    [ GLint! ]
	x           [ GLuint64! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64* value );
glUniform1ui64vARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64-ptr! ]
]
;@@ void ( GLint location, GLint64 x, GLint64 y );
glUniform2i64ARB!: alias function! [
	location    [ GLint! ]
	x           [ GLint64! ]
	y           [ GLint64! ]
]
;@@ void ( GLint location, GLsizei count, const GLint64* value );
glUniform2i64vARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64-ptr! ]
]
;@@ void ( GLint location, GLuint64 x, GLuint64 y );
glUniform2ui64ARB!: alias function! [
	location    [ GLint! ]
	x           [ GLuint64! ]
	y           [ GLuint64! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64* value );
glUniform2ui64vARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64-ptr! ]
]
;@@ void ( GLint location, GLint64 x, GLint64 y, GLint64 z );
glUniform3i64ARB!: alias function! [
	location    [ GLint! ]
	x           [ GLint64! ]
	y           [ GLint64! ]
	z           [ GLint64! ]
]
;@@ void ( GLint location, GLsizei count, const GLint64* value );
glUniform3i64vARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64-ptr! ]
]
;@@ void ( GLint location, GLuint64 x, GLuint64 y, GLuint64 z );
glUniform3ui64ARB!: alias function! [
	location    [ GLint! ]
	x           [ GLuint64! ]
	y           [ GLuint64! ]
	z           [ GLuint64! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64* value );
glUniform3ui64vARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64-ptr! ]
]
;@@ void ( GLint location, GLint64 x, GLint64 y, GLint64 z, GLint64 w );
glUniform4i64ARB!: alias function! [
	location    [ GLint! ]
	x           [ GLint64! ]
	y           [ GLint64! ]
	z           [ GLint64! ]
	w           [ GLint64! ]
]
;@@ void ( GLint location, GLsizei count, const GLint64* value );
glUniform4i64vARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64-ptr! ]
]
;@@ void ( GLint location, GLuint64 x, GLuint64 y, GLuint64 z, GLuint64 w );
glUniform4ui64ARB!: alias function! [
	location    [ GLint! ]
	x           [ GLuint64! ]
	y           [ GLuint64! ]
	z           [ GLuint64! ]
	w           [ GLuint64! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64* value );
glUniform4ui64vARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64-ptr! ]
]


;-------------------------------------------
;-- GL_ARB_half_float_pixel
;-------------------------------------------

#define  GL_ARB_half_float_pixel                      1
#define  GL_HALF_FLOAT_ARB                            140Bh


;-------------------------------------------
;-- GL_ARB_half_float_vertex
;-------------------------------------------

#define  GL_ARB_half_float_vertex                     1
#define  GL_HALF_FLOAT                                140Bh


;-------------------------------------------
;-- GL_ARB_imaging
;-------------------------------------------

#define  GL_ARB_imaging                               1
#define  GL_CONSTANT_COLOR                            8001h
#define  GL_ONE_MINUS_CONSTANT_COLOR                  8002h
#define  GL_CONSTANT_ALPHA                            8003h
#define  GL_ONE_MINUS_CONSTANT_ALPHA                  8004h
#define  GL_BLEND_COLOR                               8005h
#define  GL_FUNC_ADD                                  8006h
#define  GL_MIN                                       8007h
#define  GL_MAX                                       8008h
#define  GL_BLEND_EQUATION                            8009h
#define  GL_FUNC_SUBTRACT                             800Ah
#define  GL_FUNC_REVERSE_SUBTRACT                     800Bh
#define  GL_CONVOLUTION_1D                            8010h
#define  GL_CONVOLUTION_2D                            8011h
#define  GL_SEPARABLE_2D                              8012h
#define  GL_CONVOLUTION_BORDER_MODE                   8013h
#define  GL_CONVOLUTION_FILTER_SCALE                  8014h
#define  GL_CONVOLUTION_FILTER_BIAS                   8015h
#define  GL_REDUCE                                    8016h
#define  GL_CONVOLUTION_FORMAT                        8017h
#define  GL_CONVOLUTION_WIDTH                         8018h
#define  GL_CONVOLUTION_HEIGHT                        8019h
#define  GL_MAX_CONVOLUTION_WIDTH                     801Ah
#define  GL_MAX_CONVOLUTION_HEIGHT                    801Bh
#define  GL_POST_CONVOLUTION_RED_SCALE                801Ch
#define  GL_POST_CONVOLUTION_GREEN_SCALE              801Dh
#define  GL_POST_CONVOLUTION_BLUE_SCALE               801Eh
#define  GL_POST_CONVOLUTION_ALPHA_SCALE              801Fh
#define  GL_POST_CONVOLUTION_RED_BIAS                 8020h
#define  GL_POST_CONVOLUTION_GREEN_BIAS               8021h
#define  GL_POST_CONVOLUTION_BLUE_BIAS                8022h
#define  GL_POST_CONVOLUTION_ALPHA_BIAS               8023h
#define  GL_HISTOGRAM                                 8024h
#define  GL_PROXY_HISTOGRAM                           8025h
#define  GL_HISTOGRAM_WIDTH                           8026h
#define  GL_HISTOGRAM_FORMAT                          8027h
#define  GL_HISTOGRAM_RED_SIZE                        8028h
#define  GL_HISTOGRAM_GREEN_SIZE                      8029h
#define  GL_HISTOGRAM_BLUE_SIZE                       802Ah
#define  GL_HISTOGRAM_ALPHA_SIZE                      802Bh
#define  GL_HISTOGRAM_LUMINANCE_SIZE                  802Ch
#define  GL_HISTOGRAM_SINK                            802Dh
#define  GL_MINMAX                                    802Eh
#define  GL_MINMAX_FORMAT                             802Fh
#define  GL_MINMAX_SINK                               8030h
#define  GL_TABLE_TOO_LARGE                           8031h
#define  GL_COLOR_MATRIX                              80B1h
#define  GL_COLOR_MATRIX_STACK_DEPTH                  80B2h
#define  GL_MAX_COLOR_MATRIX_STACK_DEPTH              80B3h
#define  GL_POST_COLOR_MATRIX_RED_SCALE               80B4h
#define  GL_POST_COLOR_MATRIX_GREEN_SCALE             80B5h
#define  GL_POST_COLOR_MATRIX_BLUE_SCALE              80B6h
#define  GL_POST_COLOR_MATRIX_ALPHA_SCALE             80B7h
#define  GL_POST_COLOR_MATRIX_RED_BIAS                80B8h
#define  GL_POST_COLOR_MATRIX_GREEN_BIAS              80B9h
#define  GL_POST_COLOR_MATRIX_BLUE_BIAS               80BAh
#define  GL_POST_COLOR_MATRIX_ALPHA_BIAS              80BBh
#define  GL_COLOR_TABLE                               80D0h
#define  GL_POST_CONVOLUTION_COLOR_TABLE              80D1h
#define  GL_POST_COLOR_MATRIX_COLOR_TABLE             80D2h
#define  GL_PROXY_COLOR_TABLE                         80D3h
#define  GL_PROXY_POST_CONVOLUTION_COLOR_TABLE        80D4h
#define  GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE       80D5h
#define  GL_COLOR_TABLE_SCALE                         80D6h
#define  GL_COLOR_TABLE_BIAS                          80D7h
#define  GL_COLOR_TABLE_FORMAT                        80D8h
#define  GL_COLOR_TABLE_WIDTH                         80D9h
#define  GL_COLOR_TABLE_RED_SIZE                      80DAh
#define  GL_COLOR_TABLE_GREEN_SIZE                    80DBh
#define  GL_COLOR_TABLE_BLUE_SIZE                     80DCh
#define  GL_COLOR_TABLE_ALPHA_SIZE                    80DDh
#define  GL_COLOR_TABLE_LUMINANCE_SIZE                80DEh
#define  GL_COLOR_TABLE_INTENSITY_SIZE                80DFh
#define  GL_IGNORE_BORDER                             8150h
#define  GL_CONSTANT_BORDER                           8151h
#define  GL_WRAP_BORDER                               8152h
#define  GL_REPLICATE_BORDER                          8153h
#define  GL_CONVOLUTION_BORDER_COLOR                  8154h
;@@ void ( GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, const void *data );
glColorSubTable!: alias function! [
	target      [ GLenum! ]
	start       [ GLsizei! ]
	count       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const void *table );
glColorTable!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	table       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLfloat *params );
glColorTableParameterfv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLint *params );
glColorTableParameteriv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const void *image );
glConvolutionFilter1D!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	image       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *image );
glConvolutionFilter2D!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	image       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat params );
glConvolutionParameterf!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ GLfloat! ]
]
;@@ void ( GLenum target, GLenum pname, const GLfloat *params );
glConvolutionParameterfv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint params );
glConvolutionParameteri!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ GLint! ]
]
;@@ void ( GLenum target, GLenum pname, const GLint *params );
glConvolutionParameteriv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLsizei start, GLint x, GLint y, GLsizei width );
glCopyColorSubTable!: alias function! [
	target      [ GLenum! ]
	start       [ GLsizei! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
]
;@@ void ( GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width );
glCopyColorTable!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
]
;@@ void ( GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width );
glCopyConvolutionFilter1D!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
]
;@@ void ( GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyConvolutionFilter2D!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLenum target, GLenum format, GLenum type, void *table );
glGetColorTable!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	table       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat *params );
glGetColorTableParameterfv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint *params );
glGetColorTableParameteriv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum format, GLenum type, void *image );
glGetConvolutionFilter!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	image       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat *params );
glGetConvolutionParameterfv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint *params );
glGetConvolutionParameteriv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLboolean reset, GLenum format, GLenum type, void *values );
glGetHistogram!: alias function! [
	target      [ GLenum! ]
	reset       [ GLboolean! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	values      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat *params );
glGetHistogramParameterfv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint *params );
glGetHistogramParameteriv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLboolean reset, GLenum format, GLenum types, void *values );
glGetMinmax!: alias function! [
	target      [ GLenum! ]
	reset       [ GLboolean! ]
	format      [ GLenum! ]
	types       [ GLenum! ]
	values      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat *params );
glGetMinmaxParameterfv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint *params );
glGetMinmaxParameteriv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum format, GLenum type, void *row, void *column, void *span );
glGetSeparableFilter!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	row         [ pointer! [byte!] ]
	column      [ pointer! [byte!] ]
	span        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLsizei width, GLenum internalformat, GLboolean sink );
glHistogram!: alias function! [
	target      [ GLenum! ]
	width       [ GLsizei! ]
	internalformat [ GLenum! ]
	sink        [ GLboolean! ]
]
;@@ void ( GLenum target, GLenum internalformat, GLboolean sink );
glMinmax!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	sink        [ GLboolean! ]
]
;@@ void ( GLenum target );
glResetHistogram!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLenum target );
glResetMinmax!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *row, const void *column );
glSeparableFilter2D!: alias function! [
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
;-- GL_ARB_indirect_parameters
;-------------------------------------------

#define  GL_ARB_indirect_parameters                   1
#define  GL_PARAMETER_BUFFER_ARB                      80EEh
#define  GL_PARAMETER_BUFFER_BINDING_ARB              80EFh
;@@ void ( GLenum mode, const void *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride );
glMultiDrawArraysIndirectCountARB!: alias function! [
	mode        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	drawcount   [ GLintptr! ]
	maxdrawcount [ GLsizei! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLenum mode, GLenum type, const void *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride );
glMultiDrawElementsIndirectCountARB!: alias function! [
	mode        [ GLenum! ]
	type        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	drawcount   [ GLintptr! ]
	maxdrawcount [ GLsizei! ]
	stride      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_ARB_instanced_arrays
;-------------------------------------------

#define  GL_ARB_instanced_arrays                      1
#define  GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ARB           88FEh
;@@ void ( GLenum mode, GLint first, GLsizei count, GLsizei primcount );
glDrawArraysInstancedARB!: alias function! [
	mode        [ GLenum! ]
	first       [ GLint! ]
	count       [ GLsizei! ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void* indices, GLsizei primcount );
glDrawElementsInstancedARB!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLuint index, GLuint divisor );
glVertexAttribDivisorARB!: alias function! [
	index       [ GLuint! ]
	divisor     [ GLuint! ]
]


;-------------------------------------------
;-- GL_ARB_internalformat_query
;-------------------------------------------

#define  GL_ARB_internalformat_query                  1
#define  GL_NUM_SAMPLE_COUNTS                         9380h
;@@ void ( GLenum target, GLenum internalformat, GLenum pname, GLsizei bufSize, GLint* params );
glGetInternalformativ!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	pname       [ GLenum! ]
	bufSize     [ GLsizei! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_ARB_internalformat_query2
;-------------------------------------------

#define  GL_ARB_internalformat_query2                 1
#define  GL_INTERNALFORMAT_SUPPORTED                  826Fh
#define  GL_INTERNALFORMAT_PREFERRED                  8270h
#define  GL_INTERNALFORMAT_RED_SIZE                   8271h
#define  GL_INTERNALFORMAT_GREEN_SIZE                 8272h
#define  GL_INTERNALFORMAT_BLUE_SIZE                  8273h
#define  GL_INTERNALFORMAT_ALPHA_SIZE                 8274h
#define  GL_INTERNALFORMAT_DEPTH_SIZE                 8275h
#define  GL_INTERNALFORMAT_STENCIL_SIZE               8276h
#define  GL_INTERNALFORMAT_SHARED_SIZE                8277h
#define  GL_INTERNALFORMAT_RED_TYPE                   8278h
#define  GL_INTERNALFORMAT_GREEN_TYPE                 8279h
#define  GL_INTERNALFORMAT_BLUE_TYPE                  827Ah
#define  GL_INTERNALFORMAT_ALPHA_TYPE                 827Bh
#define  GL_INTERNALFORMAT_DEPTH_TYPE                 827Ch
#define  GL_INTERNALFORMAT_STENCIL_TYPE               827Dh
#define  GL_MAX_WIDTH                                 827Eh
#define  GL_MAX_HEIGHT                                827Fh
#define  GL_MAX_DEPTH                                 8280h
#define  GL_MAX_LAYERS                                8281h
#define  GL_MAX_COMBINED_DIMENSIONS                   8282h
#define  GL_COLOR_COMPONENTS                          8283h
#define  GL_DEPTH_COMPONENTS                          8284h
#define  GL_STENCIL_COMPONENTS                        8285h
#define  GL_COLOR_RENDERABLE                          8286h
#define  GL_DEPTH_RENDERABLE                          8287h
#define  GL_STENCIL_RENDERABLE                        8288h
#define  GL_FRAMEBUFFER_RENDERABLE                    8289h
#define  GL_FRAMEBUFFER_RENDERABLE_LAYERED            828Ah
#define  GL_FRAMEBUFFER_BLEND                         828Bh
#define  GL_READ_PIXELS                               828Ch
#define  GL_READ_PIXELS_FORMAT                        828Dh
#define  GL_READ_PIXELS_TYPE                          828Eh
#define  GL_TEXTURE_IMAGE_FORMAT                      828Fh
#define  GL_TEXTURE_IMAGE_TYPE                        8290h
#define  GL_GET_TEXTURE_IMAGE_FORMAT                  8291h
#define  GL_GET_TEXTURE_IMAGE_TYPE                    8292h
#define  GL_MIPMAP                                    8293h
#define  GL_MANUAL_GENERATE_MIPMAP                    8294h
#define  GL_AUTO_GENERATE_MIPMAP                      8295h
#define  GL_COLOR_ENCODING                            8296h
#define  GL_SRGB_READ                                 8297h
#define  GL_SRGB_WRITE                                8298h
#define  GL_SRGB_DECODE_ARB                           8299h
#define  GL_FILTER                                    829Ah
#define  GL_VERTEX_TEXTURE                            829Bh
#define  GL_TESS_CONTROL_TEXTURE                      829Ch
#define  GL_TESS_EVALUATION_TEXTURE                   829Dh
#define  GL_GEOMETRY_TEXTURE                          829Eh
#define  GL_FRAGMENT_TEXTURE                          829Fh
#define  GL_COMPUTE_TEXTURE                           82A0h
#define  GL_TEXTURE_SHADOW                            82A1h
#define  GL_TEXTURE_GATHER                            82A2h
#define  GL_TEXTURE_GATHER_SHADOW                     82A3h
#define  GL_SHADER_IMAGE_LOAD                         82A4h
#define  GL_SHADER_IMAGE_STORE                        82A5h
#define  GL_SHADER_IMAGE_ATOMIC                       82A6h
#define  GL_IMAGE_TEXEL_SIZE                          82A7h
#define  GL_IMAGE_COMPATIBILITY_CLASS                 82A8h
#define  GL_IMAGE_PIXEL_FORMAT                        82A9h
#define  GL_IMAGE_PIXEL_TYPE                          82AAh
#define  GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_TEST       82ACh
#define  GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_TEST     82ADh
#define  GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_WRITE      82AEh
#define  GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_WRITE    82AFh
#define  GL_TEXTURE_COMPRESSED_BLOCK_WIDTH            82B1h
#define  GL_TEXTURE_COMPRESSED_BLOCK_HEIGHT           82B2h
#define  GL_TEXTURE_COMPRESSED_BLOCK_SIZE             82B3h
#define  GL_CLEAR_BUFFER                              82B4h
#define  GL_TEXTURE_VIEW                              82B5h
#define  GL_VIEW_COMPATIBILITY_CLASS                  82B6h
#define  GL_FULL_SUPPORT                              82B7h
#define  GL_CAVEAT_SUPPORT                            82B8h
#define  GL_IMAGE_CLASS_4_X_32                        82B9h
#define  GL_IMAGE_CLASS_2_X_32                        82BAh
#define  GL_IMAGE_CLASS_1_X_32                        82BBh
#define  GL_IMAGE_CLASS_4_X_16                        82BCh
#define  GL_IMAGE_CLASS_2_X_16                        82BDh
#define  GL_IMAGE_CLASS_1_X_16                        82BEh
#define  GL_IMAGE_CLASS_4_X_8                         82BFh
#define  GL_IMAGE_CLASS_2_X_8                         82C0h
#define  GL_IMAGE_CLASS_1_X_8                         82C1h
#define  GL_IMAGE_CLASS_11_11_10                      82C2h
#define  GL_IMAGE_CLASS_10_10_10_2                    82C3h
#define  GL_VIEW_CLASS_128_BITS                       82C4h
#define  GL_VIEW_CLASS_96_BITS                        82C5h
#define  GL_VIEW_CLASS_64_BITS                        82C6h
#define  GL_VIEW_CLASS_48_BITS                        82C7h
#define  GL_VIEW_CLASS_32_BITS                        82C8h
#define  GL_VIEW_CLASS_24_BITS                        82C9h
#define  GL_VIEW_CLASS_16_BITS                        82CAh
#define  GL_VIEW_CLASS_8_BITS                         82CBh
#define  GL_VIEW_CLASS_S3TC_DXT1_RGB                  82CCh
#define  GL_VIEW_CLASS_S3TC_DXT1_RGBA                 82CDh
#define  GL_VIEW_CLASS_S3TC_DXT3_RGBA                 82CEh
#define  GL_VIEW_CLASS_S3TC_DXT5_RGBA                 82CFh
#define  GL_VIEW_CLASS_RGTC1_RED                      82D0h
#define  GL_VIEW_CLASS_RGTC2_RG                       82D1h
#define  GL_VIEW_CLASS_BPTC_UNORM                     82D2h
#define  GL_VIEW_CLASS_BPTC_FLOAT                     82D3h
;@@ void ( GLenum target, GLenum internalformat, GLenum pname, GLsizei bufSize, GLint64* params );
glGetInternalformati64v!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	pname       [ GLenum! ]
	bufSize     [ GLsizei! ]
	params      [ GLint64-ptr! ]
]


;-------------------------------------------
;-- GL_ARB_invalidate_subdata
;-------------------------------------------

#define  GL_ARB_invalidate_subdata                    1
;@@ void ( GLuint buffer );
glInvalidateBufferData!: alias function! [
	buffer      [ GLuint! ]
]
;@@ void ( GLuint buffer, GLintptr offset, GLsizeiptr length );
glInvalidateBufferSubData!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	length      [ GLsizeiptr! ]
]
;@@ void ( GLenum target, GLsizei numAttachments, const GLenum* attachments );
glInvalidateFramebuffer!: alias function! [
	target      [ GLenum! ]
	numAttachments [ GLsizei! ]
	attachments [ pointer! [GLenum!] ]
]
;@@ void ( GLenum target, GLsizei numAttachments, const GLenum* attachments, GLint x, GLint y, GLsizei width, GLsizei height );
glInvalidateSubFramebuffer!: alias function! [
	target      [ GLenum! ]
	numAttachments [ GLsizei! ]
	attachments [ pointer! [GLenum!] ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint texture, GLint level );
glInvalidateTexImage!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth );
glInvalidateTexSubImage!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
]


;-------------------------------------------
;-- GL_ARB_map_buffer_alignment
;-------------------------------------------

#define  GL_ARB_map_buffer_alignment                  1
#define  GL_MIN_MAP_BUFFER_ALIGNMENT                  90BCh


;-------------------------------------------
;-- GL_ARB_map_buffer_range
;-------------------------------------------

#define  GL_ARB_map_buffer_range                      1
;#define  GL_MAP_READ_BIT                              0001h
;#define  GL_MAP_WRITE_BIT                             0002h
#define  GL_MAP_INVALIDATE_RANGE_BIT                  0004h
#define  GL_MAP_INVALIDATE_BUFFER_BIT                 0008h
#define  GL_MAP_FLUSH_EXPLICIT_BIT                    0010h
#define  GL_MAP_UNSYNCHRONIZED_BIT                    0020h
;@@ void ( GLenum target, GLintptr offset, GLsizeiptr length );
glFlushMappedBufferRange!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptr! ]
	length      [ GLsizeiptr! ]
]
;@@ void * ( GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access );
glMapBufferRange!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptr! ]
	length      [ GLsizeiptr! ]
	access      [ GLbitfield! ]
	return: [ pointer! [byte!] ]

]


;-------------------------------------------
;-- GL_ARB_matrix_palette
;-------------------------------------------

#define  GL_ARB_matrix_palette                        1
#define  GL_MATRIX_PALETTE_ARB                        8840h
#define  GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB        8841h
#define  GL_MAX_PALETTE_MATRICES_ARB                  8842h
#define  GL_CURRENT_PALETTE_MATRIX_ARB                8843h
#define  GL_MATRIX_INDEX_ARRAY_ARB                    8844h
#define  GL_CURRENT_MATRIX_INDEX_ARB                  8845h
#define  GL_MATRIX_INDEX_ARRAY_SIZE_ARB               8846h
#define  GL_MATRIX_INDEX_ARRAY_TYPE_ARB               8847h
#define  GL_MATRIX_INDEX_ARRAY_STRIDE_ARB             8848h
#define  GL_MATRIX_INDEX_ARRAY_POINTER_ARB            8849h
;@@ void ( GLint index );
glCurrentPaletteMatrixARB!: alias function! [
	index       [ GLint! ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride, void *pointer );
glMatrixIndexPointerARB!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLint size, GLubyte *indices );
glMatrixIndexubvARB!: alias function! [
	size        [ GLint! ]
	indices     [ pointer! [GLubyte!] ]
]
;@@ void ( GLint size, GLuint *indices );
glMatrixIndexuivARB!: alias function! [
	size        [ GLint! ]
	indices     [ pointer! [GLuint!] ]
]
;@@ void ( GLint size, GLushort *indices );
glMatrixIndexusvARB!: alias function! [
	size        [ GLint! ]
	indices     [ GLushort-ptr! ]
]


;-------------------------------------------
;-- GL_ARB_multi_bind
;-------------------------------------------

#define  GL_ARB_multi_bind                            1
;@@ void ( GLenum target, GLuint first, GLsizei count, const GLuint* buffers );
glBindBuffersBase!: alias function! [
	target      [ GLenum! ]
	first       [ GLuint! ]
	count       [ GLsizei! ]
	buffers     [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLuint first, GLsizei count, const GLuint* buffers, const GLintptr *offsets, const GLsizeiptr *sizes );
glBindBuffersRange!: alias function! [
	target      [ GLenum! ]
	first       [ GLuint! ]
	count       [ GLsizei! ]
	buffers     [ pointer! [GLuint!] ]
	offsets     [ pointer! [GLintptr!] ]
	sizes       [ pointer! [GLsizeiptr!] ]
]
;@@ void ( GLuint first, GLsizei count, const GLuint* textures );
glBindImageTextures!: alias function! [
	first       [ GLuint! ]
	count       [ GLsizei! ]
	textures    [ pointer! [GLuint!] ]
]
;@@ void ( GLuint first, GLsizei count, const GLuint* samplers );
glBindSamplers!: alias function! [
	first       [ GLuint! ]
	count       [ GLsizei! ]
	samplers    [ pointer! [GLuint!] ]
]
;@@ void ( GLuint first, GLsizei count, const GLuint* textures );
glBindTextures!: alias function! [
	first       [ GLuint! ]
	count       [ GLsizei! ]
	textures    [ pointer! [GLuint!] ]
]
;@@ void ( GLuint first, GLsizei count, const GLuint* buffers, const GLintptr *offsets, const GLsizei *strides );
glBindVertexBuffers!: alias function! [
	first       [ GLuint! ]
	count       [ GLsizei! ]
	buffers     [ pointer! [GLuint!] ]
	offsets     [ pointer! [GLintptr!] ]
	strides     [ pointer! [GLsizei!] ]
]


;-------------------------------------------
;-- GL_ARB_multi_draw_indirect
;-------------------------------------------

#define  GL_ARB_multi_draw_indirect                   1
;@@ void ( GLenum mode, const void *indirect, GLsizei primcount, GLsizei stride );
glMultiDrawArraysIndirect!: alias function! [
	mode        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLenum mode, GLenum type, const void *indirect, GLsizei primcount, GLsizei stride );
glMultiDrawElementsIndirect!: alias function! [
	mode        [ GLenum! ]
	type        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
	stride      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_ARB_multisample
;-------------------------------------------

#define  GL_ARB_multisample                           1
#define  GL_MULTISAMPLE_ARB                           809Dh
#define  GL_SAMPLE_ALPHA_TO_COVERAGE_ARB              809Eh
#define  GL_SAMPLE_ALPHA_TO_ONE_ARB                   809Fh
#define  GL_SAMPLE_COVERAGE_ARB                       80A0h
#define  GL_SAMPLE_BUFFERS_ARB                        80A8h
#define  GL_SAMPLES_ARB                               80A9h
#define  GL_SAMPLE_COVERAGE_VALUE_ARB                 80AAh
#define  GL_SAMPLE_COVERAGE_INVERT_ARB                80ABh
#define  GL_MULTISAMPLE_BIT_ARB                       20000000h
;@@ void ( GLclampf value, GLboolean invert );
glSampleCoverageARB!: alias function! [
	value       [ GLclampf! ]
	invert      [ GLboolean! ]
]


;-------------------------------------------
;-- GL_ARB_multitexture
;-------------------------------------------

#define  GL_ARB_multitexture                          1
#define  GL_TEXTURE0_ARB                              84C0h
#define  GL_TEXTURE1_ARB                              84C1h
#define  GL_TEXTURE2_ARB                              84C2h
#define  GL_TEXTURE3_ARB                              84C3h
#define  GL_TEXTURE4_ARB                              84C4h
#define  GL_TEXTURE5_ARB                              84C5h
#define  GL_TEXTURE6_ARB                              84C6h
#define  GL_TEXTURE7_ARB                              84C7h
#define  GL_TEXTURE8_ARB                              84C8h
#define  GL_TEXTURE9_ARB                              84C9h
#define  GL_TEXTURE10_ARB                             84CAh
#define  GL_TEXTURE11_ARB                             84CBh
#define  GL_TEXTURE12_ARB                             84CCh
#define  GL_TEXTURE13_ARB                             84CDh
#define  GL_TEXTURE14_ARB                             84CEh
#define  GL_TEXTURE15_ARB                             84CFh
#define  GL_TEXTURE16_ARB                             84D0h
#define  GL_TEXTURE17_ARB                             84D1h
#define  GL_TEXTURE18_ARB                             84D2h
#define  GL_TEXTURE19_ARB                             84D3h
#define  GL_TEXTURE20_ARB                             84D4h
#define  GL_TEXTURE21_ARB                             84D5h
#define  GL_TEXTURE22_ARB                             84D6h
#define  GL_TEXTURE23_ARB                             84D7h
#define  GL_TEXTURE24_ARB                             84D8h
#define  GL_TEXTURE25_ARB                             84D9h
#define  GL_TEXTURE26_ARB                             84DAh
#define  GL_TEXTURE27_ARB                             84DBh
#define  GL_TEXTURE28_ARB                             84DCh
#define  GL_TEXTURE29_ARB                             84DDh
#define  GL_TEXTURE30_ARB                             84DEh
#define  GL_TEXTURE31_ARB                             84DFh
#define  GL_ACTIVE_TEXTURE_ARB                        84E0h
#define  GL_CLIENT_ACTIVE_TEXTURE_ARB                 84E1h
#define  GL_MAX_TEXTURE_UNITS_ARB                     84E2h
;@@ void ( GLenum texture );
glActiveTextureARB!: alias function! [
	texture     [ GLenum! ]
]
;@@ void ( GLenum texture );
glClientActiveTextureARB!: alias function! [
	texture     [ GLenum! ]
]
;@@ void ( GLenum target, GLdouble s );
glMultiTexCoord1dARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLdouble! ]
]
;@@ void ( GLenum target, const GLdouble *v );
glMultiTexCoord1dvARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLfloat s );
glMultiTexCoord1fARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLfloat! ]
]
;@@ void ( GLenum target, const GLfloat *v );
glMultiTexCoord1fvARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLint s );
glMultiTexCoord1iARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLint! ]
]
;@@ void ( GLenum target, const GLint *v );
glMultiTexCoord1ivARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLshort s );
glMultiTexCoord1sARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLshort! ]
]
;@@ void ( GLenum target, const GLshort *v );
glMultiTexCoord1svARB!: alias function! [
	target      [ GLenum! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLenum target, GLdouble s, GLdouble t );
glMultiTexCoord2dARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLdouble! ]
	t           [ GLdouble! ]
]
;@@ void ( GLenum target, const GLdouble *v );
glMultiTexCoord2dvARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLfloat s, GLfloat t );
glMultiTexCoord2fARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLfloat! ]
	t           [ GLfloat! ]
]
;@@ void ( GLenum target, const GLfloat *v );
glMultiTexCoord2fvARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLint s, GLint t );
glMultiTexCoord2iARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLint! ]
	t           [ GLint! ]
]
;@@ void ( GLenum target, const GLint *v );
glMultiTexCoord2ivARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLshort s, GLshort t );
glMultiTexCoord2sARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLshort! ]
	t           [ GLshort! ]
]
;@@ void ( GLenum target, const GLshort *v );
glMultiTexCoord2svARB!: alias function! [
	target      [ GLenum! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLenum target, GLdouble s, GLdouble t, GLdouble r );
glMultiTexCoord3dARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLdouble! ]
	t           [ GLdouble! ]
	r           [ GLdouble! ]
]
;@@ void ( GLenum target, const GLdouble *v );
glMultiTexCoord3dvARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLfloat s, GLfloat t, GLfloat r );
glMultiTexCoord3fARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	r           [ GLfloat! ]
]
;@@ void ( GLenum target, const GLfloat *v );
glMultiTexCoord3fvARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLint s, GLint t, GLint r );
glMultiTexCoord3iARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLint! ]
	t           [ GLint! ]
	r           [ GLint! ]
]
;@@ void ( GLenum target, const GLint *v );
glMultiTexCoord3ivARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLshort s, GLshort t, GLshort r );
glMultiTexCoord3sARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLshort! ]
	t           [ GLshort! ]
	r           [ GLshort! ]
]
;@@ void ( GLenum target, const GLshort *v );
glMultiTexCoord3svARB!: alias function! [
	target      [ GLenum! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q );
glMultiTexCoord4dARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLdouble! ]
	t           [ GLdouble! ]
	r           [ GLdouble! ]
	q           [ GLdouble! ]
]
;@@ void ( GLenum target, const GLdouble *v );
glMultiTexCoord4dvARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q );
glMultiTexCoord4fARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	r           [ GLfloat! ]
	q           [ GLfloat! ]
]
;@@ void ( GLenum target, const GLfloat *v );
glMultiTexCoord4fvARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLint s, GLint t, GLint r, GLint q );
glMultiTexCoord4iARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLint! ]
	t           [ GLint! ]
	r           [ GLint! ]
	q           [ GLint! ]
]
;@@ void ( GLenum target, const GLint *v );
glMultiTexCoord4ivARB!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLshort s, GLshort t, GLshort r, GLshort q );
glMultiTexCoord4sARB!: alias function! [
	target      [ GLenum! ]
	s           [ GLshort! ]
	t           [ GLshort! ]
	r           [ GLshort! ]
	q           [ GLshort! ]
]
;@@ void ( GLenum target, const GLshort *v );
glMultiTexCoord4svARB!: alias function! [
	target      [ GLenum! ]
	v           [ GLshort-ptr! ]
]


;-------------------------------------------
;-- GL_ARB_occlusion_query
;-------------------------------------------

#define  GL_ARB_occlusion_query                       1
#define  GL_QUERY_COUNTER_BITS_ARB                    8864h
#define  GL_CURRENT_QUERY_ARB                         8865h
#define  GL_QUERY_RESULT_ARB                          8866h
#define  GL_QUERY_RESULT_AVAILABLE_ARB                8867h
#define  GL_SAMPLES_PASSED_ARB                        8914h
;@@ void ( GLenum target, GLuint id );
glBeginQueryARB!: alias function! [
	target      [ GLenum! ]
	id          [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* ids );
glDeleteQueriesARB!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target );
glEndQueryARB!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLsizei n, GLuint* ids );
glGenQueriesARB!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLuint id, GLenum pname, GLint* params );
glGetQueryObjectivARB!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint id, GLenum pname, GLuint* params );
glGetQueryObjectuivARB!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetQueryivARB!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint id );
glIsQueryARB!: alias function! [
	id          [ GLuint! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_ARB_occlusion_query2
;-------------------------------------------

#define  GL_ARB_occlusion_query2                      1
#define  GL_ANY_SAMPLES_PASSED                        8C2Fh


;-------------------------------------------
;-- GL_ARB_parallel_shader_compile
;-------------------------------------------

#define  GL_ARB_parallel_shader_compile               1
#define  GL_MAX_SHADER_COMPILER_THREADS_ARB           91B0h
#define  GL_COMPLETION_STATUS_ARB                     91B1h
;@@ void ( GLuint count );
glMaxShaderCompilerThreadsARB!: alias function! [
	count       [ GLuint! ]
]


;-------------------------------------------
;-- GL_ARB_pipeline_statistics_query
;-------------------------------------------

#define  GL_ARB_pipeline_statistics_query             1
#define  GL_VERTICES_SUBMITTED_ARB                    82EEh
#define  GL_PRIMITIVES_SUBMITTED_ARB                  82EFh
#define  GL_VERTEX_SHADER_INVOCATIONS_ARB             82F0h
#define  GL_TESS_CONTROL_SHADER_PATCHES_ARB           82F1h
#define  GL_TESS_EVALUATION_SHADER_INVOCATIONS_ARB    82F2h
#define  GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED_ARB    82F3h
#define  GL_FRAGMENT_SHADER_INVOCATIONS_ARB           82F4h
#define  GL_COMPUTE_SHADER_INVOCATIONS_ARB            82F5h
#define  GL_CLIPPING_INPUT_PRIMITIVES_ARB             82F6h
#define  GL_CLIPPING_OUTPUT_PRIMITIVES_ARB            82F7h
;#define  GL_GEOMETRY_SHADER_INVOCATIONS               887Fh


;-------------------------------------------
;-- GL_ARB_pixel_buffer_object
;-------------------------------------------

#define  GL_ARB_pixel_buffer_object                   1
#define  GL_PIXEL_PACK_BUFFER_ARB                     88EBh
#define  GL_PIXEL_UNPACK_BUFFER_ARB                   88ECh
#define  GL_PIXEL_PACK_BUFFER_BINDING_ARB             88EDh
#define  GL_PIXEL_UNPACK_BUFFER_BINDING_ARB           88EFh


;-------------------------------------------
;-- GL_ARB_point_parameters
;-------------------------------------------

#define  GL_ARB_point_parameters                      1
#define  GL_POINT_SIZE_MIN_ARB                        8126h
#define  GL_POINT_SIZE_MAX_ARB                        8127h
#define  GL_POINT_FADE_THRESHOLD_SIZE_ARB             8128h
#define  GL_POINT_DISTANCE_ATTENUATION_ARB            8129h
;@@ void ( GLenum pname, GLfloat param );
glPointParameterfARB!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum pname, const GLfloat* params );
glPointParameterfvARB!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_ARB_point_sprite
;-------------------------------------------

#define  GL_ARB_point_sprite                          1
#define  GL_POINT_SPRITE_ARB                          8861h
#define  GL_COORD_REPLACE_ARB                         8862h


;-------------------------------------------
;-- GL_ARB_polygon_offset_clamp
;-------------------------------------------

#define  GL_ARB_polygon_offset_clamp                  1
;#define  GL_POLYGON_OFFSET_CLAMP                      8E1Bh
;@@ void ( GLfloat factor, GLfloat units, GLfloat clamp );
glPolygonOffsetClamp!: alias function! [
	factor      [ GLfloat! ]
	units       [ GLfloat! ]
	clamp       [ GLfloat! ]
]


;-------------------------------------------
;-- GL_ARB_post_depth_coverage
;-------------------------------------------

#define  GL_ARB_post_depth_coverage                   1


;-------------------------------------------
;-- GL_ARB_program_interface_query
;-------------------------------------------

#define  GL_ARB_program_interface_query               1
#define  GL_UNIFORM                                   92E1h
#define  GL_UNIFORM_BLOCK                             92E2h
#define  GL_PROGRAM_INPUT                             92E3h
#define  GL_PROGRAM_OUTPUT                            92E4h
#define  GL_BUFFER_VARIABLE                           92E5h
#define  GL_SHADER_STORAGE_BLOCK                      92E6h
#define  GL_IS_PER_PATCH                              92E7h
#define  GL_VERTEX_SUBROUTINE                         92E8h
#define  GL_TESS_CONTROL_SUBROUTINE                   92E9h
#define  GL_TESS_EVALUATION_SUBROUTINE                92EAh
#define  GL_GEOMETRY_SUBROUTINE                       92EBh
#define  GL_FRAGMENT_SUBROUTINE                       92ECh
#define  GL_COMPUTE_SUBROUTINE                        92EDh
#define  GL_VERTEX_SUBROUTINE_UNIFORM                 92EEh
#define  GL_TESS_CONTROL_SUBROUTINE_UNIFORM           92EFh
#define  GL_TESS_EVALUATION_SUBROUTINE_UNIFORM        92F0h
#define  GL_GEOMETRY_SUBROUTINE_UNIFORM               92F1h
#define  GL_FRAGMENT_SUBROUTINE_UNIFORM               92F2h
#define  GL_COMPUTE_SUBROUTINE_UNIFORM                92F3h
#define  GL_TRANSFORM_FEEDBACK_VARYING                92F4h
#define  GL_ACTIVE_RESOURCES                          92F5h
#define  GL_MAX_NAME_LENGTH                           92F6h
#define  GL_MAX_NUM_ACTIVE_VARIABLES                  92F7h
#define  GL_MAX_NUM_COMPATIBLE_SUBROUTINES            92F8h
#define  GL_NAME_LENGTH                               92F9h
#define  GL_TYPE                                      92FAh
#define  GL_ARRAY_SIZE                                92FBh
#define  GL_OFFSET                                    92FCh
#define  GL_BLOCK_INDEX                               92FDh
#define  GL_ARRAY_STRIDE                              92FEh
#define  GL_MATRIX_STRIDE                             92FFh
#define  GL_IS_ROW_MAJOR                              9300h
#define  GL_ATOMIC_COUNTER_BUFFER_INDEX               9301h
#define  GL_BUFFER_BINDING                            9302h
#define  GL_BUFFER_DATA_SIZE                          9303h
#define  GL_NUM_ACTIVE_VARIABLES                      9304h
#define  GL_ACTIVE_VARIABLES                          9305h
#define  GL_REFERENCED_BY_VERTEX_SHADER               9306h
#define  GL_REFERENCED_BY_TESS_CONTROL_SHADER         9307h
#define  GL_REFERENCED_BY_TESS_EVALUATION_SHADER      9308h
#define  GL_REFERENCED_BY_GEOMETRY_SHADER             9309h
#define  GL_REFERENCED_BY_FRAGMENT_SHADER             930Ah
#define  GL_REFERENCED_BY_COMPUTE_SHADER              930Bh
#define  GL_TOP_LEVEL_ARRAY_SIZE                      930Ch
#define  GL_TOP_LEVEL_ARRAY_STRIDE                    930Dh
#define  GL_LOCATION                                  930Eh
#define  GL_LOCATION_INDEX                            930Fh
;@@ void ( GLuint program, GLenum programInterface, GLenum pname, GLint* params );
glGetProgramInterfaceiv!: alias function! [
	program     [ GLuint! ]
	programInterface [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLuint ( GLuint program, GLenum programInterface, const GLchar* name );
glGetProgramResourceIndex!: alias function! [
	program     [ GLuint! ]
	programInterface [ GLenum! ]
	name        [ GLstring! ]
	return: [ GLuint! ]

]
;@@ GLint ( GLuint program, GLenum programInterface, const GLchar* name );
glGetProgramResourceLocation!: alias function! [
	program     [ GLuint! ]
	programInterface [ GLenum! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]
;@@ GLint ( GLuint program, GLenum programInterface, const GLchar* name );
glGetProgramResourceLocationIndex!: alias function! [
	program     [ GLuint! ]
	programInterface [ GLenum! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]
;@@ void ( GLuint program, GLenum programInterface, GLuint index, GLsizei bufSize, GLsizei* length, GLchar *name );
glGetProgramResourceName!: alias function! [
	program     [ GLuint! ]
	programInterface [ GLenum! ]
	index       [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	name        [ GLstring! ]
]
;@@ void ( GLuint program, GLenum programInterface, GLuint index, GLsizei propCount, const GLenum* props, GLsizei bufSize, GLsizei *length, GLint *params );
glGetProgramResourceiv!: alias function! [
	program     [ GLuint! ]
	programInterface [ GLenum! ]
	index       [ GLuint! ]
	propCount   [ GLsizei! ]
	props       [ pointer! [GLenum!] ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_ARB_provoking_vertex
;-------------------------------------------

#define  GL_ARB_provoking_vertex                      1
#define  GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION  8E4Ch
#define  GL_FIRST_VERTEX_CONVENTION                   8E4Dh
#define  GL_LAST_VERTEX_CONVENTION                    8E4Eh
#define  GL_PROVOKING_VERTEX                          8E4Fh
;@@ void ( GLenum mode );
glProvokingVertex!: alias function! [
	mode        [ GLenum! ]
]


;-------------------------------------------
;-- GL_ARB_query_buffer_object
;-------------------------------------------

#define  GL_ARB_query_buffer_object                   1
#define  GL_QUERY_BUFFER_BARRIER_BIT                  00008000h
#define  GL_QUERY_BUFFER                              9192h
#define  GL_QUERY_BUFFER_BINDING                      9193h
#define  GL_QUERY_RESULT_NO_WAIT                      9194h


;-------------------------------------------
;-- GL_ARB_robust_buffer_access_behavior
;-------------------------------------------

#define  GL_ARB_robust_buffer_access_behavior         1


;-------------------------------------------
;-- GL_ARB_robustness
;-------------------------------------------

#define  GL_ARB_robustness                            1
#define  GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB        00000004h
#define  GL_LOSE_CONTEXT_ON_RESET_ARB                 8252h
#define  GL_GUILTY_CONTEXT_RESET_ARB                  8253h
#define  GL_INNOCENT_CONTEXT_RESET_ARB                8254h
#define  GL_UNKNOWN_CONTEXT_RESET_ARB                 8255h
#define  GL_RESET_NOTIFICATION_STRATEGY_ARB           8256h
#define  GL_NO_RESET_NOTIFICATION_ARB                 8261h
;@@ GLenum ( void );
glGetGraphicsResetStatusARB!: alias function! [
	return: [ GLenum! ]

]
;@@ void ( GLenum target, GLenum format, GLenum type, GLsizei bufSize, void* table );
glGetnColorTableARB!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	bufSize     [ GLsizei! ]
	table       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint lod, GLsizei bufSize, void* img );
glGetnCompressedTexImageARB!: alias function! [
	target      [ GLenum! ]
	lod         [ GLint! ]
	bufSize     [ GLsizei! ]
	img         [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum format, GLenum type, GLsizei bufSize, void* image );
glGetnConvolutionFilterARB!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	bufSize     [ GLsizei! ]
	image       [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLboolean reset, GLenum format, GLenum type, GLsizei bufSize, void* values );
glGetnHistogramARB!: alias function! [
	target      [ GLenum! ]
	reset       [ GLboolean! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	bufSize     [ GLsizei! ]
	values      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum query, GLsizei bufSize, GLdouble* v );
glGetnMapdvARB!: alias function! [
	target      [ GLenum! ]
	query       [ GLenum! ]
	bufSize     [ GLsizei! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLenum query, GLsizei bufSize, GLfloat* v );
glGetnMapfvARB!: alias function! [
	target      [ GLenum! ]
	query       [ GLenum! ]
	bufSize     [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum query, GLsizei bufSize, GLint* v );
glGetnMapivARB!: alias function! [
	target      [ GLenum! ]
	query       [ GLenum! ]
	bufSize     [ GLsizei! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLboolean reset, GLenum format, GLenum type, GLsizei bufSize, void* values );
glGetnMinmaxARB!: alias function! [
	target      [ GLenum! ]
	reset       [ GLboolean! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	bufSize     [ GLsizei! ]
	values      [ pointer! [byte!] ]
]
;@@ void ( GLenum map, GLsizei bufSize, GLfloat* values );
glGetnPixelMapfvARB!: alias function! [
	map         [ GLenum! ]
	bufSize     [ GLsizei! ]
	values      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum map, GLsizei bufSize, GLuint* values );
glGetnPixelMapuivARB!: alias function! [
	map         [ GLenum! ]
	bufSize     [ GLsizei! ]
	values      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum map, GLsizei bufSize, GLushort* values );
glGetnPixelMapusvARB!: alias function! [
	map         [ GLenum! ]
	bufSize     [ GLsizei! ]
	values      [ GLushort-ptr! ]
]
;@@ void ( GLsizei bufSize, GLubyte* pattern );
glGetnPolygonStippleARB!: alias function! [
	bufSize     [ GLsizei! ]
	pattern     [ pointer! [GLubyte!] ]
]
;@@ void ( GLenum target, GLenum format, GLenum type, GLsizei rowBufSize, void* row, GLsizei columnBufSize, void*column, void*span );
glGetnSeparableFilterARB!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	rowBufSize  [ GLsizei! ]
	row         [ pointer! [byte!] ]
	columnBufSize [ GLsizei! ]
	column      [ pointer! [byte!] ]
	span        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLenum format, GLenum type, GLsizei bufSize, void* img );
glGetnTexImageARB!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	bufSize     [ GLsizei! ]
	img         [ pointer! [byte!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei bufSize, GLdouble* params );
glGetnUniformdvARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	bufSize     [ GLsizei! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei bufSize, GLfloat* params );
glGetnUniformfvARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	bufSize     [ GLsizei! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei bufSize, GLint* params );
glGetnUniformivARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	bufSize     [ GLsizei! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei bufSize, GLuint* params );
glGetnUniformuivARB!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	bufSize     [ GLsizei! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, void* data );
glReadnPixelsARB!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	bufSize     [ GLsizei! ]
	data        [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_ARB_robustness_application_isolation
;-------------------------------------------

#define  GL_ARB_robustness_application_isolation      1


;-------------------------------------------
;-- GL_ARB_robustness_share_group_isolation
;-------------------------------------------

#define  GL_ARB_robustness_share_group_isolation      1


;-------------------------------------------
;-- GL_ARB_sample_locations
;-------------------------------------------

#define  GL_ARB_sample_locations                      1
#define  GL_SAMPLE_LOCATION_ARB                       8E50h
#define  GL_SAMPLE_LOCATION_SUBPIXEL_BITS_ARB         933Dh
#define  GL_SAMPLE_LOCATION_PIXEL_GRID_WIDTH_ARB      933Eh
#define  GL_SAMPLE_LOCATION_PIXEL_GRID_HEIGHT_ARB     933Fh
#define  GL_PROGRAMMABLE_SAMPLE_LOCATION_TABLE_SIZE_ARB  9340h
#define  GL_PROGRAMMABLE_SAMPLE_LOCATION_ARB          9341h
#define  GL_FRAMEBUFFER_PROGRAMMABLE_SAMPLE_LOCATIONS_ARB  9342h
#define  GL_FRAMEBUFFER_SAMPLE_LOCATION_PIXEL_GRID_ARB  9343h
;@@ void ( GLenum target, GLuint start, GLsizei count, const GLfloat* v );
glFramebufferSampleLocationsfvARB!: alias function! [
	target      [ GLenum! ]
	start       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint framebuffer, GLuint start, GLsizei count, const GLfloat* v );
glNamedFramebufferSampleLocationsfvARB!: alias function! [
	framebuffer [ GLuint! ]
	start       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_ARB_sample_shading
;-------------------------------------------

#define  GL_ARB_sample_shading                        1
#define  GL_SAMPLE_SHADING_ARB                        8C36h
#define  GL_MIN_SAMPLE_SHADING_VALUE_ARB              8C37h
;@@ void ( GLclampf value );
glMinSampleShadingARB!: alias function! [
	value       [ GLclampf! ]
]


;-------------------------------------------
;-- GL_ARB_sampler_objects
;-------------------------------------------

#define  GL_ARB_sampler_objects                       1
#define  GL_SAMPLER_BINDING                           8919h
;@@ void ( GLuint unit, GLuint sampler );
glBindSampler!: alias function! [
	unit        [ GLuint! ]
	sampler     [ GLuint! ]
]
;@@ void ( GLsizei count, const GLuint * samplers );
glDeleteSamplers!: alias function! [
	count       [ GLsizei! ]
	samplers    [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei count, GLuint* samplers );
glGenSamplers!: alias function! [
	count       [ GLsizei! ]
	samplers    [ pointer! [GLuint!] ]
]
;@@ void ( GLuint sampler, GLenum pname, GLint* params );
glGetSamplerParameterIiv!: alias function! [
	sampler     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint sampler, GLenum pname, GLuint* params );
glGetSamplerParameterIuiv!: alias function! [
	sampler     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint sampler, GLenum pname, GLfloat* params );
glGetSamplerParameterfv!: alias function! [
	sampler     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint sampler, GLenum pname, GLint* params );
glGetSamplerParameteriv!: alias function! [
	sampler     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint sampler );
glIsSampler!: alias function! [
	sampler     [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint sampler, GLenum pname, const GLint* params );
glSamplerParameterIiv!: alias function! [
	sampler     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint sampler, GLenum pname, const GLuint* params );
glSamplerParameterIuiv!: alias function! [
	sampler     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint sampler, GLenum pname, GLfloat param );
glSamplerParameterf!: alias function! [
	sampler     [ GLuint! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLuint sampler, GLenum pname, const GLfloat* params );
glSamplerParameterfv!: alias function! [
	sampler     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint sampler, GLenum pname, GLint param );
glSamplerParameteri!: alias function! [
	sampler     [ GLuint! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLuint sampler, GLenum pname, const GLint* params );
glSamplerParameteriv!: alias function! [
	sampler     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_ARB_seamless_cube_map
;-------------------------------------------

#define  GL_ARB_seamless_cube_map                     1
;#define  GL_TEXTURE_CUBE_MAP_SEAMLESS                 884Fh


;-------------------------------------------
;-- GL_ARB_seamless_cubemap_per_texture
;-------------------------------------------

#define  GL_ARB_seamless_cubemap_per_texture          1
;#define  GL_TEXTURE_CUBE_MAP_SEAMLESS                 884Fh


;-------------------------------------------
;-- GL_ARB_separate_shader_objects
;-------------------------------------------

#define  GL_ARB_separate_shader_objects               1
#define  GL_VERTEX_SHADER_BIT                         00000001h
#define  GL_FRAGMENT_SHADER_BIT                       00000002h
#define  GL_GEOMETRY_SHADER_BIT                       00000004h
#define  GL_TESS_CONTROL_SHADER_BIT                   00000008h
#define  GL_TESS_EVALUATION_SHADER_BIT                00000010h
#define  GL_PROGRAM_SEPARABLE                         8258h
#define  GL_ACTIVE_PROGRAM                            8259h
#define  GL_PROGRAM_PIPELINE_BINDING                  825Ah
#define  GL_ALL_SHADER_BITS                           FFFFFFFFh
;@@ void ( GLuint pipeline, GLuint program );
glActiveShaderProgram!: alias function! [
	pipeline    [ GLuint! ]
	program     [ GLuint! ]
]
;@@ void ( GLuint pipeline );
glBindProgramPipeline!: alias function! [
	pipeline    [ GLuint! ]
]
;@@ GLuint ( GLenum type, GLsizei count, const GLchar * const * strings );
glCreateShaderProgramv!: alias function! [
	type        [ GLenum! ]
	count       [ GLsizei! ]
	strings     [ GLstring-ptr! ]
	return: [ GLuint! ]

]
;@@ void ( GLsizei n, const GLuint* pipelines );
glDeleteProgramPipelines!: alias function! [
	n           [ GLsizei! ]
	pipelines   [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* pipelines );
glGenProgramPipelines!: alias function! [
	n           [ GLsizei! ]
	pipelines   [ pointer! [GLuint!] ]
]
;@@ void ( GLuint pipeline, GLsizei bufSize, GLsizei* length, GLchar *infoLog );
glGetProgramPipelineInfoLog!: alias function! [
	pipeline    [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	infoLog     [ GLstring! ]
]
;@@ void ( GLuint pipeline, GLenum pname, GLint* params );
glGetProgramPipelineiv!: alias function! [
	pipeline    [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint pipeline );
glIsProgramPipeline!: alias function! [
	pipeline    [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint program, GLint location, GLdouble x );
glProgramUniform1d!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLdouble! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLdouble* value );
glProgramUniform1dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLfloat x );
glProgramUniform1f!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLfloat! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLfloat* value );
glProgramUniform1fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLint x );
glProgramUniform1i!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint* value );
glProgramUniform1iv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLint location, GLuint x );
glProgramUniform1ui!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint* value );
glProgramUniform1uiv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLint location, GLdouble x, GLdouble y );
glProgramUniform2d!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLdouble* value );
glProgramUniform2dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLfloat x, GLfloat y );
glProgramUniform2f!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLfloat* value );
glProgramUniform2fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLint x, GLint y );
glProgramUniform2i!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint* value );
glProgramUniform2iv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLint location, GLuint x, GLuint y );
glProgramUniform2ui!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint! ]
	y           [ GLuint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint* value );
glProgramUniform2uiv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLint location, GLdouble x, GLdouble y, GLdouble z );
glProgramUniform3d!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLdouble* value );
glProgramUniform3dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLfloat x, GLfloat y, GLfloat z );
glProgramUniform3f!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLfloat* value );
glProgramUniform3fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLint x, GLint y, GLint z );
glProgramUniform3i!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint* value );
glProgramUniform3iv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLint location, GLuint x, GLuint y, GLuint z );
glProgramUniform3ui!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint! ]
	y           [ GLuint! ]
	z           [ GLuint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint* value );
glProgramUniform3uiv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glProgramUniform4d!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLdouble* value );
glProgramUniform4dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glProgramUniform4f!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLfloat* value );
glProgramUniform4fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLint x, GLint y, GLint z, GLint w );
glProgramUniform4i!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
	w           [ GLint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint* value );
glProgramUniform4iv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLint location, GLuint x, GLuint y, GLuint z, GLuint w );
glProgramUniform4ui!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint! ]
	y           [ GLuint! ]
	z           [ GLuint! ]
	w           [ GLuint! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint* value );
glProgramUniform4uiv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glProgramUniformMatrix2dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix2fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glProgramUniformMatrix2x3dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix2x3fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glProgramUniformMatrix2x4dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix2x4fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glProgramUniformMatrix3dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix3fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glProgramUniformMatrix3x2dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix3x2fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glProgramUniformMatrix3x4dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix3x4fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glProgramUniformMatrix4dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix4fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glProgramUniformMatrix4x2dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix4x2fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble* value );
glProgramUniformMatrix4x3dv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glProgramUniformMatrix4x3fv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint pipeline, GLbitfield stages, GLuint program );
glUseProgramStages!: alias function! [
	pipeline    [ GLuint! ]
	stages      [ GLbitfield! ]
	program     [ GLuint! ]
]
;@@ void ( GLuint pipeline );
glValidateProgramPipeline!: alias function! [
	pipeline    [ GLuint! ]
]


;-------------------------------------------
;-- GL_ARB_shader_atomic_counter_ops
;-------------------------------------------

#define  GL_ARB_shader_atomic_counter_ops             1


;-------------------------------------------
;-- GL_ARB_shader_atomic_counters
;-------------------------------------------

#define  GL_ARB_shader_atomic_counters                1
#define  GL_ATOMIC_COUNTER_BUFFER                     92C0h
#define  GL_ATOMIC_COUNTER_BUFFER_BINDING             92C1h
#define  GL_ATOMIC_COUNTER_BUFFER_START               92C2h
#define  GL_ATOMIC_COUNTER_BUFFER_SIZE                92C3h
#define  GL_ATOMIC_COUNTER_BUFFER_DATA_SIZE           92C4h
#define  GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTERS  92C5h
#define  GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTER_INDICES  92C6h
#define  GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_VERTEX_SHADER  92C7h
#define  GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_CONTROL_SHADER  92C8h
#define  GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_EVALUATION_SHADER  92C9h
#define  GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_GEOMETRY_SHADER  92CAh
#define  GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_FRAGMENT_SHADER  92CBh
#define  GL_MAX_VERTEX_ATOMIC_COUNTER_BUFFERS         92CCh
#define  GL_MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS   92CDh
#define  GL_MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS  92CEh
#define  GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS       92CFh
#define  GL_MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS       92D0h
#define  GL_MAX_COMBINED_ATOMIC_COUNTER_BUFFERS       92D1h
#define  GL_MAX_VERTEX_ATOMIC_COUNTERS                92D2h
#define  GL_MAX_TESS_CONTROL_ATOMIC_COUNTERS          92D3h
#define  GL_MAX_TESS_EVALUATION_ATOMIC_COUNTERS       92D4h
#define  GL_MAX_GEOMETRY_ATOMIC_COUNTERS              92D5h
#define  GL_MAX_FRAGMENT_ATOMIC_COUNTERS              92D6h
#define  GL_MAX_COMBINED_ATOMIC_COUNTERS              92D7h
#define  GL_MAX_ATOMIC_COUNTER_BUFFER_SIZE            92D8h
#define  GL_ACTIVE_ATOMIC_COUNTER_BUFFERS             92D9h
#define  GL_UNIFORM_ATOMIC_COUNTER_BUFFER_INDEX       92DAh
#define  GL_UNSIGNED_INT_ATOMIC_COUNTER               92DBh
#define  GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS        92DCh
;@@ void ( GLuint program, GLuint bufferIndex, GLenum pname, GLint* params );
glGetActiveAtomicCounterBufferiv!: alias function! [
	program     [ GLuint! ]
	bufferIndex [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_ARB_shader_ballot
;-------------------------------------------

#define  GL_ARB_shader_ballot                         1


;-------------------------------------------
;-- GL_ARB_shader_bit_encoding
;-------------------------------------------

#define  GL_ARB_shader_bit_encoding                   1


;-------------------------------------------
;-- GL_ARB_shader_clock
;-------------------------------------------

#define  GL_ARB_shader_clock                          1


;-------------------------------------------
;-- GL_ARB_shader_draw_parameters
;-------------------------------------------

#define  GL_ARB_shader_draw_parameters                1


;-------------------------------------------
;-- GL_ARB_shader_group_vote
;-------------------------------------------

#define  GL_ARB_shader_group_vote                     1


;-------------------------------------------
;-- GL_ARB_shader_image_load_store
;-------------------------------------------

#define  GL_ARB_shader_image_load_store               1
#define  GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT           00000001h
#define  GL_ELEMENT_ARRAY_BARRIER_BIT                 00000002h
#define  GL_UNIFORM_BARRIER_BIT                       00000004h
#define  GL_TEXTURE_FETCH_BARRIER_BIT                 00000008h
#define  GL_SHADER_IMAGE_ACCESS_BARRIER_BIT           00000020h
#define  GL_COMMAND_BARRIER_BIT                       00000040h
#define  GL_PIXEL_BUFFER_BARRIER_BIT                  00000080h
#define  GL_TEXTURE_UPDATE_BARRIER_BIT                00000100h
#define  GL_BUFFER_UPDATE_BARRIER_BIT                 00000200h
#define  GL_FRAMEBUFFER_BARRIER_BIT                   00000400h
#define  GL_TRANSFORM_FEEDBACK_BARRIER_BIT            00000800h
#define  GL_ATOMIC_COUNTER_BARRIER_BIT                00001000h
#define  GL_MAX_IMAGE_UNITS                           8F38h
#define  GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS  8F39h
#define  GL_IMAGE_BINDING_NAME                        8F3Ah
#define  GL_IMAGE_BINDING_LEVEL                       8F3Bh
#define  GL_IMAGE_BINDING_LAYERED                     8F3Ch
#define  GL_IMAGE_BINDING_LAYER                       8F3Dh
#define  GL_IMAGE_BINDING_ACCESS                      8F3Eh
#define  GL_IMAGE_1D                                  904Ch
#define  GL_IMAGE_2D                                  904Dh
#define  GL_IMAGE_3D                                  904Eh
#define  GL_IMAGE_2D_RECT                             904Fh
#define  GL_IMAGE_CUBE                                9050h
#define  GL_IMAGE_BUFFER                              9051h
#define  GL_IMAGE_1D_ARRAY                            9052h
#define  GL_IMAGE_2D_ARRAY                            9053h
#define  GL_IMAGE_CUBE_MAP_ARRAY                      9054h
#define  GL_IMAGE_2D_MULTISAMPLE                      9055h
#define  GL_IMAGE_2D_MULTISAMPLE_ARRAY                9056h
#define  GL_INT_IMAGE_1D                              9057h
#define  GL_INT_IMAGE_2D                              9058h
#define  GL_INT_IMAGE_3D                              9059h
#define  GL_INT_IMAGE_2D_RECT                         905Ah
#define  GL_INT_IMAGE_CUBE                            905Bh
#define  GL_INT_IMAGE_BUFFER                          905Ch
#define  GL_INT_IMAGE_1D_ARRAY                        905Dh
#define  GL_INT_IMAGE_2D_ARRAY                        905Eh
#define  GL_INT_IMAGE_CUBE_MAP_ARRAY                  905Fh
#define  GL_INT_IMAGE_2D_MULTISAMPLE                  9060h
#define  GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY            9061h
#define  GL_UNSIGNED_INT_IMAGE_1D                     9062h
#define  GL_UNSIGNED_INT_IMAGE_2D                     9063h
#define  GL_UNSIGNED_INT_IMAGE_3D                     9064h
#define  GL_UNSIGNED_INT_IMAGE_2D_RECT                9065h
#define  GL_UNSIGNED_INT_IMAGE_CUBE                   9066h
#define  GL_UNSIGNED_INT_IMAGE_BUFFER                 9067h
#define  GL_UNSIGNED_INT_IMAGE_1D_ARRAY               9068h
#define  GL_UNSIGNED_INT_IMAGE_2D_ARRAY               9069h
#define  GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY         906Ah
#define  GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE         906Bh
#define  GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY   906Ch
#define  GL_MAX_IMAGE_SAMPLES                         906Dh
#define  GL_IMAGE_BINDING_FORMAT                      906Eh
#define  GL_IMAGE_FORMAT_COMPATIBILITY_TYPE           90C7h
#define  GL_IMAGE_FORMAT_COMPATIBILITY_BY_SIZE        90C8h
#define  GL_IMAGE_FORMAT_COMPATIBILITY_BY_CLASS       90C9h
#define  GL_MAX_VERTEX_IMAGE_UNIFORMS                 90CAh
#define  GL_MAX_TESS_CONTROL_IMAGE_UNIFORMS           90CBh
#define  GL_MAX_TESS_EVALUATION_IMAGE_UNIFORMS        90CCh
#define  GL_MAX_GEOMETRY_IMAGE_UNIFORMS               90CDh
#define  GL_MAX_FRAGMENT_IMAGE_UNIFORMS               90CEh
#define  GL_MAX_COMBINED_IMAGE_UNIFORMS               90CFh
#define  GL_ALL_BARRIER_BITS                          FFFFFFFFh
;@@ void ( GLuint unit, GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum access, GLenum format );
glBindImageTexture!: alias function! [
	unit        [ GLuint! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	layered     [ GLboolean! ]
	layer       [ GLint! ]
	access      [ GLenum! ]
	format      [ GLenum! ]
]
;@@ void ( GLbitfield barriers );
glMemoryBarrier!: alias function! [
	barriers    [ GLbitfield! ]
]


;-------------------------------------------
;-- GL_ARB_shader_image_size
;-------------------------------------------

#define  GL_ARB_shader_image_size                     1


;-------------------------------------------
;-- GL_ARB_shader_objects
;-------------------------------------------

#define  GL_ARB_shader_objects                        1
#define  GL_PROGRAM_OBJECT_ARB                        8B40h
#define  GL_SHADER_OBJECT_ARB                         8B48h
#define  GL_OBJECT_TYPE_ARB                           8B4Eh
#define  GL_OBJECT_SUBTYPE_ARB                        8B4Fh
#define  GL_FLOAT_VEC2_ARB                            8B50h
#define  GL_FLOAT_VEC3_ARB                            8B51h
#define  GL_FLOAT_VEC4_ARB                            8B52h
#define  GL_INT_VEC2_ARB                              8B53h
#define  GL_INT_VEC3_ARB                              8B54h
#define  GL_INT_VEC4_ARB                              8B55h
#define  GL_BOOL_ARB                                  8B56h
#define  GL_BOOL_VEC2_ARB                             8B57h
#define  GL_BOOL_VEC3_ARB                             8B58h
#define  GL_BOOL_VEC4_ARB                             8B59h
#define  GL_FLOAT_MAT2_ARB                            8B5Ah
#define  GL_FLOAT_MAT3_ARB                            8B5Bh
#define  GL_FLOAT_MAT4_ARB                            8B5Ch
#define  GL_SAMPLER_1D_ARB                            8B5Dh
#define  GL_SAMPLER_2D_ARB                            8B5Eh
#define  GL_SAMPLER_3D_ARB                            8B5Fh
#define  GL_SAMPLER_CUBE_ARB                          8B60h
#define  GL_SAMPLER_1D_SHADOW_ARB                     8B61h
#define  GL_SAMPLER_2D_SHADOW_ARB                     8B62h
#define  GL_SAMPLER_2D_RECT_ARB                       8B63h
#define  GL_SAMPLER_2D_RECT_SHADOW_ARB                8B64h
#define  GL_OBJECT_DELETE_STATUS_ARB                  8B80h
#define  GL_OBJECT_COMPILE_STATUS_ARB                 8B81h
#define  GL_OBJECT_LINK_STATUS_ARB                    8B82h
#define  GL_OBJECT_VALIDATE_STATUS_ARB                8B83h
#define  GL_OBJECT_INFO_LOG_LENGTH_ARB                8B84h
#define  GL_OBJECT_ATTACHED_OBJECTS_ARB               8B85h
#define  GL_OBJECT_ACTIVE_UNIFORMS_ARB                8B86h
#define  GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB      8B87h
#define  GL_OBJECT_SHADER_SOURCE_LENGTH_ARB           8B88h
;@@ void ( GLhandleARB containerObj, GLhandleARB obj );
glAttachObjectARB!: alias function! [
	containerObj [ GLhandleARB! ]
	obj         [ GLhandleARB! ]
]
;@@ void ( GLhandleARB shaderObj );
glCompileShaderARB!: alias function! [
	shaderObj   [ GLhandleARB! ]
]
;@@ GLhandleARB ( void );
glCreateProgramObjectARB!: alias function! [
	return: [ GLhandleARB! ]

]
;@@ GLhandleARB ( GLenum shaderType );
glCreateShaderObjectARB!: alias function! [
	shaderType  [ GLenum! ]
	return: [ GLhandleARB! ]

]
;@@ void ( GLhandleARB obj );
glDeleteObjectARB!: alias function! [
	obj         [ GLhandleARB! ]
]
;@@ void ( GLhandleARB containerObj, GLhandleARB attachedObj );
glDetachObjectARB!: alias function! [
	containerObj [ GLhandleARB! ]
	attachedObj [ GLhandleARB! ]
]
;@@ void ( GLhandleARB programObj, GLuint index, GLsizei maxLength, GLsizei* length, GLint *size, GLenum *type, GLcharARB *name );
glGetActiveUniformARB!: alias function! [
	programObj  [ GLhandleARB! ]
	index       [ GLuint! ]
	maxLength   [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	size        [ pointer! [GLint!] ]
	type        [ pointer! [GLenum!] ]
	name        [ GLcharARB-ptr! ]
]
;@@ void ( GLhandleARB containerObj, GLsizei maxCount, GLsizei* count, GLhandleARB *obj );
glGetAttachedObjectsARB!: alias function! [
	containerObj [ GLhandleARB! ]
	maxCount    [ GLsizei! ]
	count       [ pointer! [GLsizei!] ]
	obj         [ pointer! [GLhandleARB!] ]
]
;@@ GLhandleARB ( GLenum pname );
glGetHandleARB!: alias function! [
	pname       [ GLenum! ]
	return: [ GLhandleARB! ]

]
;@@ void ( GLhandleARB obj, GLsizei maxLength, GLsizei* length, GLcharARB *infoLog );
glGetInfoLogARB!: alias function! [
	obj         [ GLhandleARB! ]
	maxLength   [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	infoLog     [ GLcharARB-ptr! ]
]
;@@ void ( GLhandleARB obj, GLenum pname, GLfloat* params );
glGetObjectParameterfvARB!: alias function! [
	obj         [ GLhandleARB! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLhandleARB obj, GLenum pname, GLint* params );
glGetObjectParameterivARB!: alias function! [
	obj         [ GLhandleARB! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLhandleARB obj, GLsizei maxLength, GLsizei* length, GLcharARB *source );
glGetShaderSourceARB!: alias function! [
	obj         [ GLhandleARB! ]
	maxLength   [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	source      [ GLcharARB-ptr! ]
]
;@@ GLint ( GLhandleARB programObj, const GLcharARB* name );
glGetUniformLocationARB!: alias function! [
	programObj  [ GLhandleARB! ]
	name        [ GLcharARB-ptr! ]
	return: [ GLint! ]

]
;@@ void ( GLhandleARB programObj, GLint location, GLfloat* params );
glGetUniformfvARB!: alias function! [
	programObj  [ GLhandleARB! ]
	location    [ GLint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLhandleARB programObj, GLint location, GLint* params );
glGetUniformivARB!: alias function! [
	programObj  [ GLhandleARB! ]
	location    [ GLint! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLhandleARB programObj );
glLinkProgramARB!: alias function! [
	programObj  [ GLhandleARB! ]
]
;@@ void ( GLhandleARB shaderObj, GLsizei count, const GLcharARB ** string, const GLint *length );
glShaderSourceARB!: alias function! [
	shaderObj   [ GLhandleARB! ]
	count       [ GLsizei! ]
	string      [ GLcharARB-ptr-ptr! ]
	length      [ pointer! [GLint!] ]
]
;@@ void ( GLint location, GLfloat v0 );
glUniform1fARB!: alias function! [
	location    [ GLint! ]
	v0          [ GLfloat! ]
]
;@@ void ( GLint location, GLsizei count, const GLfloat* value );
glUniform1fvARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLint v0 );
glUniform1iARB!: alias function! [
	location    [ GLint! ]
	v0          [ GLint! ]
]
;@@ void ( GLint location, GLsizei count, const GLint* value );
glUniform1ivARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLint location, GLfloat v0, GLfloat v1 );
glUniform2fARB!: alias function! [
	location    [ GLint! ]
	v0          [ GLfloat! ]
	v1          [ GLfloat! ]
]
;@@ void ( GLint location, GLsizei count, const GLfloat* value );
glUniform2fvARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLint v0, GLint v1 );
glUniform2iARB!: alias function! [
	location    [ GLint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
]
;@@ void ( GLint location, GLsizei count, const GLint* value );
glUniform2ivARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLint location, GLfloat v0, GLfloat v1, GLfloat v2 );
glUniform3fARB!: alias function! [
	location    [ GLint! ]
	v0          [ GLfloat! ]
	v1          [ GLfloat! ]
	v2          [ GLfloat! ]
]
;@@ void ( GLint location, GLsizei count, const GLfloat* value );
glUniform3fvARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLint v0, GLint v1, GLint v2 );
glUniform3iARB!: alias function! [
	location    [ GLint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
	v2          [ GLint! ]
]
;@@ void ( GLint location, GLsizei count, const GLint* value );
glUniform3ivARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3 );
glUniform4fARB!: alias function! [
	location    [ GLint! ]
	v0          [ GLfloat! ]
	v1          [ GLfloat! ]
	v2          [ GLfloat! ]
	v3          [ GLfloat! ]
]
;@@ void ( GLint location, GLsizei count, const GLfloat* value );
glUniform4fvARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLint v0, GLint v1, GLint v2, GLint v3 );
glUniform4iARB!: alias function! [
	location    [ GLint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
	v2          [ GLint! ]
	v3          [ GLint! ]
]
;@@ void ( GLint location, GLsizei count, const GLint* value );
glUniform4ivARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix2fvARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix3fvARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix4fvARB!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLhandleARB programObj );
glUseProgramObjectARB!: alias function! [
	programObj  [ GLhandleARB! ]
]
;@@ void ( GLhandleARB programObj );
glValidateProgramARB!: alias function! [
	programObj  [ GLhandleARB! ]
]


;-------------------------------------------
;-- GL_ARB_shader_precision
;-------------------------------------------

#define  GL_ARB_shader_precision                      1


;-------------------------------------------
;-- GL_ARB_shader_stencil_export
;-------------------------------------------

#define  GL_ARB_shader_stencil_export                 1


;-------------------------------------------
;-- GL_ARB_shader_storage_buffer_object
;-------------------------------------------

#define  GL_ARB_shader_storage_buffer_object          1
#define  GL_SHADER_STORAGE_BARRIER_BIT                2000h
#define  GL_MAX_COMBINED_SHADER_OUTPUT_RESOURCES      8F39h
#define  GL_SHADER_STORAGE_BUFFER                     90D2h
#define  GL_SHADER_STORAGE_BUFFER_BINDING             90D3h
#define  GL_SHADER_STORAGE_BUFFER_START               90D4h
#define  GL_SHADER_STORAGE_BUFFER_SIZE                90D5h
#define  GL_MAX_VERTEX_SHADER_STORAGE_BLOCKS          90D6h
#define  GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS        90D7h
#define  GL_MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS    90D8h
#define  GL_MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS  90D9h
#define  GL_MAX_FRAGMENT_SHADER_STORAGE_BLOCKS        90DAh
#define  GL_MAX_COMPUTE_SHADER_STORAGE_BLOCKS         90DBh
#define  GL_MAX_COMBINED_SHADER_STORAGE_BLOCKS        90DCh
#define  GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS        90DDh
#define  GL_MAX_SHADER_STORAGE_BLOCK_SIZE             90DEh
#define  GL_SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT    90DFh
;@@ void ( GLuint program, GLuint storageBlockIndex, GLuint storageBlockBinding );
glShaderStorageBlockBinding!: alias function! [
	program     [ GLuint! ]
	storageBlockIndex [ GLuint! ]
	storageBlockBinding [ GLuint! ]
]


;-------------------------------------------
;-- GL_ARB_shader_subroutine
;-------------------------------------------

#define  GL_ARB_shader_subroutine                     1
#define  GL_ACTIVE_SUBROUTINES                        8DE5h
#define  GL_ACTIVE_SUBROUTINE_UNIFORMS                8DE6h
#define  GL_MAX_SUBROUTINES                           8DE7h
#define  GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS          8DE8h
#define  GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS       8E47h
#define  GL_ACTIVE_SUBROUTINE_MAX_LENGTH              8E48h
#define  GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH      8E49h
#define  GL_NUM_COMPATIBLE_SUBROUTINES                8E4Ah
#define  GL_COMPATIBLE_SUBROUTINES                    8E4Bh
;@@ void ( GLuint program, GLenum shadertype, GLuint index, GLsizei bufsize, GLsizei* length, GLchar *name );
glGetActiveSubroutineName!: alias function! [
	program     [ GLuint! ]
	shadertype  [ GLenum! ]
	index       [ GLuint! ]
	bufsize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	name        [ GLstring! ]
]
;@@ void ( GLuint program, GLenum shadertype, GLuint index, GLsizei bufsize, GLsizei* length, GLchar *name );
glGetActiveSubroutineUniformName!: alias function! [
	program     [ GLuint! ]
	shadertype  [ GLenum! ]
	index       [ GLuint! ]
	bufsize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	name        [ GLstring! ]
]
;@@ void ( GLuint program, GLenum shadertype, GLuint index, GLenum pname, GLint* values );
glGetActiveSubroutineUniformiv!: alias function! [
	program     [ GLuint! ]
	shadertype  [ GLenum! ]
	index       [ GLuint! ]
	pname       [ GLenum! ]
	values      [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLenum shadertype, GLenum pname, GLint* values );
glGetProgramStageiv!: alias function! [
	program     [ GLuint! ]
	shadertype  [ GLenum! ]
	pname       [ GLenum! ]
	values      [ pointer! [GLint!] ]
]
;@@ GLuint ( GLuint program, GLenum shadertype, const GLchar* name );
glGetSubroutineIndex!: alias function! [
	program     [ GLuint! ]
	shadertype  [ GLenum! ]
	name        [ GLstring! ]
	return: [ GLuint! ]

]
;@@ GLint ( GLuint program, GLenum shadertype, const GLchar* name );
glGetSubroutineUniformLocation!: alias function! [
	program     [ GLuint! ]
	shadertype  [ GLenum! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]
;@@ void ( GLenum shadertype, GLint location, GLuint* params );
glGetUniformSubroutineuiv!: alias function! [
	shadertype  [ GLenum! ]
	location    [ GLint! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum shadertype, GLsizei count, const GLuint* indices );
glUniformSubroutinesuiv!: alias function! [
	shadertype  [ GLenum! ]
	count       [ GLsizei! ]
	indices     [ pointer! [GLuint!] ]
]


;-------------------------------------------
;-- GL_ARB_shader_texture_image_samples
;-------------------------------------------

#define  GL_ARB_shader_texture_image_samples          1


;-------------------------------------------
;-- GL_ARB_shader_texture_lod
;-------------------------------------------

#define  GL_ARB_shader_texture_lod                    1


;-------------------------------------------
;-- GL_ARB_shader_viewport_layer_array
;-------------------------------------------

#define  GL_ARB_shader_viewport_layer_array           1


;-------------------------------------------
;-- GL_ARB_shading_language_100
;-------------------------------------------

#define  GL_ARB_shading_language_100                  1
#define  GL_SHADING_LANGUAGE_VERSION_ARB              8B8Ch


;-------------------------------------------
;-- GL_ARB_shading_language_420pack
;-------------------------------------------

#define  GL_ARB_shading_language_420pack              1


;-------------------------------------------
;-- GL_ARB_shading_language_include
;-------------------------------------------

#define  GL_ARB_shading_language_include              1
#define  GL_SHADER_INCLUDE_ARB                        8DAEh
#define  GL_NAMED_STRING_LENGTH_ARB                   8DE9h
#define  GL_NAMED_STRING_TYPE_ARB                     8DEAh
;@@ void ( GLuint shader, GLsizei count, const GLchar* const *path, const GLint *length );
glCompileShaderIncludeARB!: alias function! [
	shader      [ GLuint! ]
	count       [ GLsizei! ]
	path        [ GLstring-ptr! ]
	length      [ pointer! [GLint!] ]
]
;@@ void ( GLint namelen, const GLchar* name );
glDeleteNamedStringARB!: alias function! [
	namelen     [ GLint! ]
	name        [ GLstring! ]
]
;@@ void ( GLint namelen, const GLchar* name, GLsizei bufSize, GLint *stringlen, GLchar *string );
glGetNamedStringARB!: alias function! [
	namelen     [ GLint! ]
	name        [ GLstring! ]
	bufSize     [ GLsizei! ]
	stringlen   [ pointer! [GLint!] ]
	string      [ GLstring! ]
]
;@@ void ( GLint namelen, const GLchar* name, GLenum pname, GLint *params );
glGetNamedStringivARB!: alias function! [
	namelen     [ GLint! ]
	name        [ GLstring! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLint namelen, const GLchar* name );
glIsNamedStringARB!: alias function! [
	namelen     [ GLint! ]
	name        [ GLstring! ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum type, GLint namelen, const GLchar* name, GLint stringlen, const GLchar *string );
glNamedStringARB!: alias function! [
	type        [ GLenum! ]
	namelen     [ GLint! ]
	name        [ GLstring! ]
	stringlen   [ GLint! ]
	string      [ GLstring! ]
]


;-------------------------------------------
;-- GL_ARB_shading_language_packing
;-------------------------------------------

#define  GL_ARB_shading_language_packing              1


;-------------------------------------------
;-- GL_ARB_shadow
;-------------------------------------------

#define  GL_ARB_shadow                                1
#define  GL_TEXTURE_COMPARE_MODE_ARB                  884Ch
#define  GL_TEXTURE_COMPARE_FUNC_ARB                  884Dh
#define  GL_COMPARE_R_TO_TEXTURE_ARB                  884Eh


;-------------------------------------------
;-- GL_ARB_shadow_ambient
;-------------------------------------------

#define  GL_ARB_shadow_ambient                        1
#define  GL_TEXTURE_COMPARE_FAIL_VALUE_ARB            80BFh


;-------------------------------------------
;-- GL_ARB_sparse_buffer
;-------------------------------------------

#define  GL_ARB_sparse_buffer                         1
#define  GL_SPARSE_STORAGE_BIT_ARB                    0400h
#define  GL_SPARSE_BUFFER_PAGE_SIZE_ARB               82F8h
;@@ void ( GLenum target, GLintptr offset, GLsizeiptr size, GLboolean commit );
glBufferPageCommitmentARB!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	commit      [ GLboolean! ]
]


;-------------------------------------------
;-- GL_ARB_sparse_texture
;-------------------------------------------

#define  GL_ARB_sparse_texture                        1
#define  GL_VIRTUAL_PAGE_SIZE_X_ARB                   9195h
#define  GL_VIRTUAL_PAGE_SIZE_Y_ARB                   9196h
#define  GL_VIRTUAL_PAGE_SIZE_Z_ARB                   9197h
#define  GL_MAX_SPARSE_TEXTURE_SIZE_ARB               9198h
#define  GL_MAX_SPARSE_3D_TEXTURE_SIZE_ARB            9199h
#define  GL_MAX_SPARSE_ARRAY_TEXTURE_LAYERS_ARB       919Ah
#define  GL_TEXTURE_SPARSE_ARB                        91A6h
#define  GL_VIRTUAL_PAGE_SIZE_INDEX_ARB               91A7h
#define  GL_NUM_VIRTUAL_PAGE_SIZES_ARB                91A8h
#define  GL_SPARSE_TEXTURE_FULL_ARRAY_CUBE_MIPMAPS_ARB  91A9h
#define  GL_NUM_SPARSE_LEVELS_ARB                     91AAh
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLboolean commit );
glTexPageCommitmentARB!: alias function! [
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


;-------------------------------------------
;-- GL_ARB_sparse_texture2
;-------------------------------------------

#define  GL_ARB_sparse_texture2                       1


;-------------------------------------------
;-- GL_ARB_sparse_texture_clamp
;-------------------------------------------

#define  GL_ARB_sparse_texture_clamp                  1


;-------------------------------------------
;-- GL_ARB_spirv_extensions
;-------------------------------------------

#define  GL_ARB_spirv_extensions                      1
;#define  GL_SPIR_V_EXTENSIONS                         9553h
;#define  GL_NUM_SPIR_V_EXTENSIONS                     9554h


;-------------------------------------------
;-- GL_ARB_stencil_texturing
;-------------------------------------------

#define  GL_ARB_stencil_texturing                     1
#define  GL_DEPTH_STENCIL_TEXTURE_MODE                90EAh


;-------------------------------------------
;-- GL_ARB_sync
;-------------------------------------------

#define  GL_ARB_sync                                  1
#define  GL_SYNC_FLUSH_COMMANDS_BIT                   00000001h
#define  GL_MAX_SERVER_WAIT_TIMEOUT                   9111h
#define  GL_OBJECT_TYPE                               9112h
#define  GL_SYNC_CONDITION                            9113h
#define  GL_SYNC_STATUS                               9114h
#define  GL_SYNC_FLAGS                                9115h
#define  GL_SYNC_FENCE                                9116h
#define  GL_SYNC_GPU_COMMANDS_COMPLETE                9117h
#define  GL_UNSIGNALED                                9118h
#define  GL_SIGNALED                                  9119h
#define  GL_ALREADY_SIGNALED                          911Ah
#define  GL_TIMEOUT_EXPIRED                           911Bh
#define  GL_CONDITION_SATISFIED                       911Ch
#define  GL_WAIT_FAILED                               911Dh
#define  GL_TIMEOUT_IGNORED                           FFFFFFFFFFFFFFFFhull
;@@ GLenum ( GLsync GLsync,GLbitfield flags,GLuint64 timeout );
glClientWaitSync!: alias function! [
	GLsync      [ GLsync! ]
	flags       [ GLbitfield! ]
	timeout     [ GLuint64! ]
	return: [ GLenum! ]

]
;@@ void ( GLsync GLsync );
glDeleteSync!: alias function! [
	GLsync      [ GLsync! ]
]
;@@ GLsync ( GLenum condition,GLbitfield flags );
glFenceSync!: alias function! [
	condition   [ GLenum! ]
	flags       [ GLbitfield! ]
	return: [ GLsync! ]

]
;@@ void ( GLenum pname, GLint64* params );
glGetInteger64v!: alias function! [
	pname       [ GLenum! ]
	params      [ GLint64-ptr! ]
]
;@@ void ( GLsync GLsync,GLenum pname,GLsizei bufSize,GLsizei* length, GLint *values );
glGetSynciv!: alias function! [
	GLsync      [ GLsync! ]
	pname       [ GLenum! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	values      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLsync GLsync );
glIsSync!: alias function! [
	GLsync      [ GLsync! ]
	return: [ GLboolean! ]

]
;@@ void ( GLsync GLsync,GLbitfield flags,GLuint64 timeout );
glWaitSync!: alias function! [
	GLsync      [ GLsync! ]
	flags       [ GLbitfield! ]
	timeout     [ GLuint64! ]
]


;-------------------------------------------
;-- GL_ARB_tessellation_shader
;-------------------------------------------

#define  GL_ARB_tessellation_shader                   1
#define  GL_PATCHES                                   0Eh
#define  GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER  84F0h
#define  GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER  84F1h
#define  GL_MAX_TESS_CONTROL_INPUT_COMPONENTS         886Ch
#define  GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS      886Dh
#define  GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS  8E1Eh
#define  GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS  8E1Fh
#define  GL_PATCH_VERTICES                            8E72h
#define  GL_PATCH_DEFAULT_INNER_LEVEL                 8E73h
#define  GL_PATCH_DEFAULT_OUTER_LEVEL                 8E74h
#define  GL_TESS_CONTROL_OUTPUT_VERTICES              8E75h
#define  GL_TESS_GEN_MODE                             8E76h
#define  GL_TESS_GEN_SPACING                          8E77h
#define  GL_TESS_GEN_VERTEX_ORDER                     8E78h
#define  GL_TESS_GEN_POINT_MODE                       8E79h
#define  GL_ISOLINES                                  8E7Ah
#define  GL_FRACTIONAL_ODD                            8E7Bh
#define  GL_FRACTIONAL_EVEN                           8E7Ch
#define  GL_MAX_PATCH_VERTICES                        8E7Dh
#define  GL_MAX_TESS_GEN_LEVEL                        8E7Eh
#define  GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS       8E7Fh
#define  GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS    8E80h
#define  GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS      8E81h
#define  GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS   8E82h
#define  GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS        8E83h
#define  GL_MAX_TESS_PATCH_COMPONENTS                 8E84h
#define  GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS  8E85h
#define  GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS     8E86h
#define  GL_TESS_EVALUATION_SHADER                    8E87h
#define  GL_TESS_CONTROL_SHADER                       8E88h
#define  GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS           8E89h
#define  GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS        8E8Ah
;@@ void ( GLenum pname, const GLfloat* values );
glPatchParameterfv!: alias function! [
	pname       [ GLenum! ]
	values      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum pname, GLint value );
glPatchParameteri!: alias function! [
	pname       [ GLenum! ]
	value       [ GLint! ]
]


;-------------------------------------------
;-- GL_ARB_texture_barrier
;-------------------------------------------

#define  GL_ARB_texture_barrier                       1
;@@ void ( void );
glTextureBarrier!: alias function! [
]


;-------------------------------------------
;-- GL_ARB_texture_border_clamp
;-------------------------------------------

#define  GL_ARB_texture_border_clamp                  1
#define  GL_CLAMP_TO_BORDER_ARB                       812Dh


;-------------------------------------------
;-- GL_ARB_texture_buffer_object
;-------------------------------------------

#define  GL_ARB_texture_buffer_object                 1
#define  GL_TEXTURE_BUFFER_ARB                        8C2Ah
#define  GL_MAX_TEXTURE_BUFFER_SIZE_ARB               8C2Bh
#define  GL_TEXTURE_BINDING_BUFFER_ARB                8C2Ch
#define  GL_TEXTURE_BUFFER_DATA_STORE_BINDING_ARB     8C2Dh
#define  GL_TEXTURE_BUFFER_FORMAT_ARB                 8C2Eh
;@@ void ( GLenum target, GLenum internalformat, GLuint buffer );
glTexBufferARB!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	buffer      [ GLuint! ]
]


;-------------------------------------------
;-- GL_ARB_texture_buffer_object_rgb32
;-------------------------------------------

#define  GL_ARB_texture_buffer_object_rgb32           1


;-------------------------------------------
;-- GL_ARB_texture_buffer_range
;-------------------------------------------

#define  GL_ARB_texture_buffer_range                  1
#define  GL_TEXTURE_BUFFER_OFFSET                     919Dh
#define  GL_TEXTURE_BUFFER_SIZE                       919Eh
#define  GL_TEXTURE_BUFFER_OFFSET_ALIGNMENT           919Fh
;@@ void ( GLenum target, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size );
glTexBufferRange!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
]
;@@ void ( GLuint texture, GLenum target, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size );
glTextureBufferRangeEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
]


;-------------------------------------------
;-- GL_ARB_texture_compression
;-------------------------------------------

#define  GL_ARB_texture_compression                   1
#define  GL_COMPRESSED_ALPHA_ARB                      84E9h
#define  GL_COMPRESSED_LUMINANCE_ARB                  84EAh
#define  GL_COMPRESSED_LUMINANCE_ALPHA_ARB            84EBh
#define  GL_COMPRESSED_INTENSITY_ARB                  84ECh
#define  GL_COMPRESSED_RGB_ARB                        84EDh
#define  GL_COMPRESSED_RGBA_ARB                       84EEh
#define  GL_TEXTURE_COMPRESSION_HINT_ARB              84EFh
#define  GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB         86A0h
#define  GL_TEXTURE_COMPRESSED_ARB                    86A1h
#define  GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB        86A2h
#define  GL_COMPRESSED_TEXTURE_FORMATS_ARB            86A3h
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const void *data );
glCompressedTexImage1DARB!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *data );
glCompressedTexImage2DARB!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *data );
glCompressedTexImage3DARB!: alias function! [
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
;@@ void ( GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *data );
glCompressedTexSubImage1DARB!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data );
glCompressedTexSubImage2DARB!: alias function! [
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
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data );
glCompressedTexSubImage3DARB!: alias function! [
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
;@@ void ( GLenum target, GLint lod, void *img );
glGetCompressedTexImageARB!: alias function! [
	target      [ GLenum! ]
	lod         [ GLint! ]
	img         [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_ARB_texture_compression_bptc
;-------------------------------------------

#define  GL_ARB_texture_compression_bptc              1
#define  GL_COMPRESSED_RGBA_BPTC_UNORM_ARB            8E8Ch
#define  GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB      8E8Dh
#define  GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB      8E8Eh
#define  GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB    8E8Fh


;-------------------------------------------
;-- GL_ARB_texture_compression_rgtc
;-------------------------------------------

#define  GL_ARB_texture_compression_rgtc              1
#define  GL_COMPRESSED_RED_RGTC1                      8DBBh
#define  GL_COMPRESSED_SIGNED_RED_RGTC1               8DBCh
#define  GL_COMPRESSED_RG_RGTC2                       8DBDh
#define  GL_COMPRESSED_SIGNED_RG_RGTC2                8DBEh


;-------------------------------------------
;-- GL_ARB_texture_cube_map
;-------------------------------------------

#define  GL_ARB_texture_cube_map                      1
#define  GL_NORMAL_MAP_ARB                            8511h
#define  GL_REFLECTION_MAP_ARB                        8512h
#define  GL_TEXTURE_CUBE_MAP_ARB                      8513h
#define  GL_TEXTURE_BINDING_CUBE_MAP_ARB              8514h
#define  GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB           8515h
#define  GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB           8516h
#define  GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB           8517h
#define  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB           8518h
#define  GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB           8519h
#define  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB           851Ah
#define  GL_PROXY_TEXTURE_CUBE_MAP_ARB                851Bh
#define  GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB             851Ch


;-------------------------------------------
;-- GL_ARB_texture_cube_map_array
;-------------------------------------------

#define  GL_ARB_texture_cube_map_array                1
#define  GL_TEXTURE_CUBE_MAP_ARRAY_ARB                9009h
#define  GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB        900Ah
#define  GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB          900Bh
#define  GL_SAMPLER_CUBE_MAP_ARRAY_ARB                900Ch
#define  GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB         900Dh
#define  GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB            900Eh
#define  GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB   900Fh


;-------------------------------------------
;-- GL_ARB_texture_env_add
;-------------------------------------------

#define  GL_ARB_texture_env_add                       1


;-------------------------------------------
;-- GL_ARB_texture_env_combine
;-------------------------------------------

#define  GL_ARB_texture_env_combine                   1
#define  GL_SUBTRACT_ARB                              84E7h
#define  GL_COMBINE_ARB                               8570h
#define  GL_COMBINE_RGB_ARB                           8571h
#define  GL_COMBINE_ALPHA_ARB                         8572h
#define  GL_RGB_SCALE_ARB                             8573h
#define  GL_ADD_SIGNED_ARB                            8574h
#define  GL_INTERPOLATE_ARB                           8575h
#define  GL_CONSTANT_ARB                              8576h
#define  GL_PRIMARY_COLOR_ARB                         8577h
#define  GL_PREVIOUS_ARB                              8578h
#define  GL_SOURCE0_RGB_ARB                           8580h
#define  GL_SOURCE1_RGB_ARB                           8581h
#define  GL_SOURCE2_RGB_ARB                           8582h
#define  GL_SOURCE0_ALPHA_ARB                         8588h
#define  GL_SOURCE1_ALPHA_ARB                         8589h
#define  GL_SOURCE2_ALPHA_ARB                         858Ah
#define  GL_OPERAND0_RGB_ARB                          8590h
#define  GL_OPERAND1_RGB_ARB                          8591h
#define  GL_OPERAND2_RGB_ARB                          8592h
#define  GL_OPERAND0_ALPHA_ARB                        8598h
#define  GL_OPERAND1_ALPHA_ARB                        8599h
#define  GL_OPERAND2_ALPHA_ARB                        859Ah


;-------------------------------------------
;-- GL_ARB_texture_env_crossbar
;-------------------------------------------

#define  GL_ARB_texture_env_crossbar                  1


;-------------------------------------------
;-- GL_ARB_texture_env_dot3
;-------------------------------------------

#define  GL_ARB_texture_env_dot3                      1
#define  GL_DOT3_RGB_ARB                              86AEh
#define  GL_DOT3_RGBA_ARB                             86AFh


;-------------------------------------------
;-- GL_ARB_texture_filter_anisotropic
;-------------------------------------------

#define  GL_ARB_texture_filter_anisotropic            1
;#define  GL_TEXTURE_MAX_ANISOTROPY                    84FEh
;#define  GL_MAX_TEXTURE_MAX_ANISOTROPY                84FFh


;-------------------------------------------
;-- GL_ARB_texture_filter_minmax
;-------------------------------------------

#define  GL_ARB_texture_filter_minmax                 1
#define  GL_TEXTURE_REDUCTION_MODE_ARB                9366h
#define  GL_WEIGHTED_AVERAGE_ARB                      9367h


;-------------------------------------------
;-- GL_ARB_texture_float
;-------------------------------------------

#define  GL_ARB_texture_float                         1
#define  GL_RGBA32F_ARB                               8814h
#define  GL_RGB32F_ARB                                8815h
#define  GL_ALPHA32F_ARB                              8816h
#define  GL_INTENSITY32F_ARB                          8817h
#define  GL_LUMINANCE32F_ARB                          8818h
#define  GL_LUMINANCE_ALPHA32F_ARB                    8819h
#define  GL_RGBA16F_ARB                               881Ah
#define  GL_RGB16F_ARB                                881Bh
#define  GL_ALPHA16F_ARB                              881Ch
#define  GL_INTENSITY16F_ARB                          881Dh
#define  GL_LUMINANCE16F_ARB                          881Eh
#define  GL_LUMINANCE_ALPHA16F_ARB                    881Fh
#define  GL_TEXTURE_RED_TYPE_ARB                      8C10h
#define  GL_TEXTURE_GREEN_TYPE_ARB                    8C11h
#define  GL_TEXTURE_BLUE_TYPE_ARB                     8C12h
#define  GL_TEXTURE_ALPHA_TYPE_ARB                    8C13h
#define  GL_TEXTURE_LUMINANCE_TYPE_ARB                8C14h
#define  GL_TEXTURE_INTENSITY_TYPE_ARB                8C15h
#define  GL_TEXTURE_DEPTH_TYPE_ARB                    8C16h
#define  GL_UNSIGNED_NORMALIZED_ARB                   8C17h


;-------------------------------------------
;-- GL_ARB_texture_gather
;-------------------------------------------

#define  GL_ARB_texture_gather                        1
#define  GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB     8E5Eh
#define  GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB     8E5Fh
#define  GL_MAX_PROGRAM_TEXTURE_GATHER_COMPONENTS_ARB  8F9Fh


;-------------------------------------------
;-- GL_ARB_texture_mirror_clamp_to_edge
;-------------------------------------------

#define  GL_ARB_texture_mirror_clamp_to_edge          1
#define  GL_MIRROR_CLAMP_TO_EDGE                      8743h


;-------------------------------------------
;-- GL_ARB_texture_mirrored_repeat
;-------------------------------------------

#define  GL_ARB_texture_mirrored_repeat               1
#define  GL_MIRRORED_REPEAT_ARB                       8370h


;-------------------------------------------
;-- GL_ARB_texture_multisample
;-------------------------------------------

#define  GL_ARB_texture_multisample                   1
#define  GL_SAMPLE_POSITION                           8E50h
#define  GL_SAMPLE_MASK                               8E51h
#define  GL_SAMPLE_MASK_VALUE                         8E52h
#define  GL_MAX_SAMPLE_MASK_WORDS                     8E59h
#define  GL_TEXTURE_2D_MULTISAMPLE                    9100h
#define  GL_PROXY_TEXTURE_2D_MULTISAMPLE              9101h
#define  GL_TEXTURE_2D_MULTISAMPLE_ARRAY              9102h
#define  GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY        9103h
#define  GL_TEXTURE_BINDING_2D_MULTISAMPLE            9104h
#define  GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY      9105h
#define  GL_TEXTURE_SAMPLES                           9106h
#define  GL_TEXTURE_FIXED_SAMPLE_LOCATIONS            9107h
#define  GL_SAMPLER_2D_MULTISAMPLE                    9108h
#define  GL_INT_SAMPLER_2D_MULTISAMPLE                9109h
#define  GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE       910Ah
#define  GL_SAMPLER_2D_MULTISAMPLE_ARRAY              910Bh
#define  GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY          910Ch
#define  GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY  910Dh
#define  GL_MAX_COLOR_TEXTURE_SAMPLES                 910Eh
#define  GL_MAX_DEPTH_TEXTURE_SAMPLES                 910Fh
#define  GL_MAX_INTEGER_SAMPLES                       9110h
;@@ void ( GLenum pname, GLuint index, GLfloat* val );
glGetMultisamplefv!: alias function! [
	pname       [ GLenum! ]
	index       [ GLuint! ]
	val         [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLbitfield mask );
glSampleMaski!: alias function! [
	index       [ GLuint! ]
	mask        [ GLbitfield! ]
]
;@@ void ( GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations );
glTexImage2DMultisample!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	fixedsamplelocations [ GLboolean! ]
]
;@@ void ( GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations );
glTexImage3DMultisample!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	fixedsamplelocations [ GLboolean! ]
]


;-------------------------------------------
;-- GL_ARB_texture_non_power_of_two
;-------------------------------------------

#define  GL_ARB_texture_non_power_of_two              1


;-------------------------------------------
;-- GL_ARB_texture_query_levels
;-------------------------------------------

#define  GL_ARB_texture_query_levels                  1


;-------------------------------------------
;-- GL_ARB_texture_query_lod
;-------------------------------------------

#define  GL_ARB_texture_query_lod                     1


;-------------------------------------------
;-- GL_ARB_texture_rectangle
;-------------------------------------------

#define  GL_ARB_texture_rectangle                     1
#define  GL_TEXTURE_RECTANGLE_ARB                     84F5h
#define  GL_TEXTURE_BINDING_RECTANGLE_ARB             84F6h
#define  GL_PROXY_TEXTURE_RECTANGLE_ARB               84F7h
#define  GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB            84F8h
;#define  GL_SAMPLER_2D_RECT_ARB                       8B63h
;#define  GL_SAMPLER_2D_RECT_SHADOW_ARB                8B64h


;-------------------------------------------
;-- GL_ARB_texture_rg
;-------------------------------------------

#define  GL_ARB_texture_rg                            1
#define  GL_COMPRESSED_RED                            8225h
#define  GL_COMPRESSED_RG                             8226h
#define  GL_RG                                        8227h
#define  GL_RG_INTEGER                                8228h
#define  GL_R8                                        8229h
#define  GL_R16                                       822Ah
#define  GL_RG8                                       822Bh
#define  GL_RG16                                      822Ch
#define  GL_R16F                                      822Dh
#define  GL_R32F                                      822Eh
#define  GL_RG16F                                     822Fh
#define  GL_RG32F                                     8230h
#define  GL_R8I                                       8231h
#define  GL_R8UI                                      8232h
#define  GL_R16I                                      8233h
#define  GL_R16UI                                     8234h
#define  GL_R32I                                      8235h
#define  GL_R32UI                                     8236h
#define  GL_RG8I                                      8237h
;#define  GL_RG8UI                                     8238h
#define  GL_RG16I                                     8239h
;#define  GL_RG16UI                                    823Ah
#define  GL_RG32I                                     823Bh
#define  GL_RG32UI                                    823Ch


;-------------------------------------------
;-- GL_ARB_texture_rgb10_a2ui
;-------------------------------------------

#define  GL_ARB_texture_rgb10_a2ui                    1
;#define  GL_RGB10_A2UI                                906Fh


;-------------------------------------------
;-- GL_ARB_texture_stencil8
;-------------------------------------------

#define  GL_ARB_texture_stencil8                      1
;#define  GL_STENCIL_INDEX                             1901h
;#define  GL_STENCIL_INDEX8                            8D48h


;-------------------------------------------
;-- GL_ARB_texture_storage
;-------------------------------------------

#define  GL_ARB_texture_storage                       1
#define  GL_TEXTURE_IMMUTABLE_FORMAT                  912Fh
;@@ void ( GLenum target, GLsizei levels, GLenum internalformat, GLsizei width );
glTexStorage1D!: alias function! [
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
]
;@@ void ( GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height );
glTexStorage2D!: alias function! [
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth );
glTexStorage3D!: alias function! [
	target      [ GLenum! ]
	levels      [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
]


;-------------------------------------------
;-- GL_ARB_texture_storage_multisample
;-------------------------------------------

#define  GL_ARB_texture_storage_multisample           1
;@@ void ( GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations );
glTexStorage2DMultisample!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	fixedsamplelocations [ GLboolean! ]
]
;@@ void ( GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations );
glTexStorage3DMultisample!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	fixedsamplelocations [ GLboolean! ]
]
;@@ void ( GLuint texture, GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations );
glTextureStorage2DMultisampleEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	fixedsamplelocations [ GLboolean! ]
]
;@@ void ( GLuint texture, GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations );
glTextureStorage3DMultisampleEXT!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	fixedsamplelocations [ GLboolean! ]
]


;-------------------------------------------
;-- GL_ARB_texture_swizzle
;-------------------------------------------

#define  GL_ARB_texture_swizzle                       1
#define  GL_TEXTURE_SWIZZLE_R                         8E42h
#define  GL_TEXTURE_SWIZZLE_G                         8E43h
#define  GL_TEXTURE_SWIZZLE_B                         8E44h
#define  GL_TEXTURE_SWIZZLE_A                         8E45h
#define  GL_TEXTURE_SWIZZLE_RGBA                      8E46h


;-------------------------------------------
;-- GL_ARB_texture_view
;-------------------------------------------

#define  GL_ARB_texture_view                          1
#define  GL_TEXTURE_VIEW_MIN_LEVEL                    82DBh
#define  GL_TEXTURE_VIEW_NUM_LEVELS                   82DCh
#define  GL_TEXTURE_VIEW_MIN_LAYER                    82DDh
#define  GL_TEXTURE_VIEW_NUM_LAYERS                   82DEh
;#define  GL_TEXTURE_IMMUTABLE_LEVELS                  82DFh
;@@ void ( GLuint texture, GLenum target, GLuint origtexture, GLenum internalformat, GLuint minlevel, GLuint numlevels, GLuint minlayer, GLuint numlayers );
glTextureView!: alias function! [
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
;-- GL_ARB_timer_query
;-------------------------------------------

#define  GL_ARB_timer_query                           1
#define  GL_TIME_ELAPSED                              88BFh
#define  GL_TIMESTAMP                                 8E28h
;@@ void ( GLuint id, GLenum pname, GLint64* params );
glGetQueryObjecti64v!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLint64-ptr! ]
]
;@@ void ( GLuint id, GLenum pname, GLuint64* params );
glGetQueryObjectui64v!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLuint64-ptr! ]
]
;@@ void ( GLuint id, GLenum target );
glQueryCounter!: alias function! [
	id          [ GLuint! ]
	target      [ GLenum! ]
]


;-------------------------------------------
;-- GL_ARB_transform_feedback2
;-------------------------------------------

#define  GL_ARB_transform_feedback2                   1
#define  GL_TRANSFORM_FEEDBACK                        8E22h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED          8E23h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE          8E24h
#define  GL_TRANSFORM_FEEDBACK_BINDING                8E25h
;@@ void ( GLenum target, GLuint id );
glBindTransformFeedback!: alias function! [
	target      [ GLenum! ]
	id          [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* ids );
glDeleteTransformFeedbacks!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLenum mode, GLuint id );
glDrawTransformFeedback!: alias function! [
	mode        [ GLenum! ]
	id          [ GLuint! ]
]
;@@ void ( GLsizei n, GLuint* ids );
glGenTransformFeedbacks!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ GLboolean ( GLuint id );
glIsTransformFeedback!: alias function! [
	id          [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( void );
glPauseTransformFeedback!: alias function! [
]
;@@ void ( void );
glResumeTransformFeedback!: alias function! [
]


;-------------------------------------------
;-- GL_ARB_transform_feedback3
;-------------------------------------------

#define  GL_ARB_transform_feedback3                   1
#define  GL_MAX_TRANSFORM_FEEDBACK_BUFFERS            8E70h
;#define  GL_MAX_VERTEX_STREAMS                        8E71h
;@@ void ( GLenum target, GLuint index, GLuint id );
glBeginQueryIndexed!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	id          [ GLuint! ]
]
;@@ void ( GLenum mode, GLuint id, GLuint stream );
glDrawTransformFeedbackStream!: alias function! [
	mode        [ GLenum! ]
	id          [ GLuint! ]
	stream      [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index );
glEndQueryIndexed!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index, GLenum pname, GLint* params );
glGetQueryIndexediv!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_ARB_transform_feedback_instanced
;-------------------------------------------

#define  GL_ARB_transform_feedback_instanced          1
;@@ void ( GLenum mode, GLuint id, GLsizei primcount );
glDrawTransformFeedbackInstanced!: alias function! [
	mode        [ GLenum! ]
	id          [ GLuint! ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLenum mode, GLuint id, GLuint stream, GLsizei primcount );
glDrawTransformFeedbackStreamInstanced!: alias function! [
	mode        [ GLenum! ]
	id          [ GLuint! ]
	stream      [ GLuint! ]
	primcount   [ GLsizei! ]
]


;-------------------------------------------
;-- GL_ARB_transform_feedback_overflow_query
;-------------------------------------------

#define  GL_ARB_transform_feedback_overflow_query     1
#define  GL_TRANSFORM_FEEDBACK_OVERFLOW_ARB           82ECh
#define  GL_TRANSFORM_FEEDBACK_STREAM_OVERFLOW_ARB    82EDh


;-------------------------------------------
;-- GL_ARB_transpose_matrix
;-------------------------------------------

#define  GL_ARB_transpose_matrix                      1
#define  GL_TRANSPOSE_MODELVIEW_MATRIX_ARB            84E3h
#define  GL_TRANSPOSE_PROJECTION_MATRIX_ARB           84E4h
#define  GL_TRANSPOSE_TEXTURE_MATRIX_ARB              84E5h
#define  GL_TRANSPOSE_COLOR_MATRIX_ARB                84E6h
;@@ void ( GLdouble m[16] );
glLoadTransposeMatrixdARB!: alias function! [
	m           [ pointer! [GLdouble!] ] ;@@[16]
]
;@@ void ( GLfloat m[16] );
glLoadTransposeMatrixfARB!: alias function! [
	m           [ pointer! [GLfloat!] ] ;@@[16]
]
;@@ void ( GLdouble m[16] );
glMultTransposeMatrixdARB!: alias function! [
	m           [ pointer! [GLdouble!] ] ;@@[16]
]
;@@ void ( GLfloat m[16] );
glMultTransposeMatrixfARB!: alias function! [
	m           [ pointer! [GLfloat!] ] ;@@[16]
]


;-------------------------------------------
;-- GL_ARB_uniform_buffer_object
;-------------------------------------------

#define  GL_ARB_uniform_buffer_object                 1
#define  GL_UNIFORM_BUFFER                            8A11h
#define  GL_UNIFORM_BUFFER_BINDING                    8A28h
#define  GL_UNIFORM_BUFFER_START                      8A29h
#define  GL_UNIFORM_BUFFER_SIZE                       8A2Ah
#define  GL_MAX_VERTEX_UNIFORM_BLOCKS                 8A2Bh
#define  GL_MAX_GEOMETRY_UNIFORM_BLOCKS               8A2Ch
#define  GL_MAX_FRAGMENT_UNIFORM_BLOCKS               8A2Dh
#define  GL_MAX_COMBINED_UNIFORM_BLOCKS               8A2Eh
#define  GL_MAX_UNIFORM_BUFFER_BINDINGS               8A2Fh
#define  GL_MAX_UNIFORM_BLOCK_SIZE                    8A30h
#define  GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS    8A31h
#define  GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS  8A32h
#define  GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS  8A33h
#define  GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT           8A34h
#define  GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH      8A35h
#define  GL_ACTIVE_UNIFORM_BLOCKS                     8A36h
#define  GL_UNIFORM_TYPE                              8A37h
#define  GL_UNIFORM_SIZE                              8A38h
#define  GL_UNIFORM_NAME_LENGTH                       8A39h
#define  GL_UNIFORM_BLOCK_INDEX                       8A3Ah
#define  GL_UNIFORM_OFFSET                            8A3Bh
#define  GL_UNIFORM_ARRAY_STRIDE                      8A3Ch
#define  GL_UNIFORM_MATRIX_STRIDE                     8A3Dh
#define  GL_UNIFORM_IS_ROW_MAJOR                      8A3Eh
#define  GL_UNIFORM_BLOCK_BINDING                     8A3Fh
#define  GL_UNIFORM_BLOCK_DATA_SIZE                   8A40h
#define  GL_UNIFORM_BLOCK_NAME_LENGTH                 8A41h
#define  GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS             8A42h
#define  GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES      8A43h
#define  GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER  8A44h
#define  GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER  8A45h
#define  GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER  8A46h
#define  GL_INVALID_INDEX                             FFFFFFFFhu
;@@ void ( GLenum target, GLuint index, GLuint buffer );
glBindBufferBase!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	buffer      [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size );
glBindBufferRange!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
]
;@@ void ( GLuint program, GLuint uniformBlockIndex, GLsizei bufSize, GLsizei* length, GLchar* uniformBlockName );
glGetActiveUniformBlockName!: alias function! [
	program     [ GLuint! ]
	uniformBlockIndex [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	uniformBlockName [ GLstring! ]
]
;@@ void ( GLuint program, GLuint uniformBlockIndex, GLenum pname, GLint* params );
glGetActiveUniformBlockiv!: alias function! [
	program     [ GLuint! ]
	uniformBlockIndex [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLuint uniformIndex, GLsizei bufSize, GLsizei* length, GLchar* uniformName );
glGetActiveUniformName!: alias function! [
	program     [ GLuint! ]
	uniformIndex [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	uniformName [ GLstring! ]
]
;@@ void ( GLuint program, GLsizei uniformCount, const GLuint* uniformIndices, GLenum pname, GLint* params );
glGetActiveUniformsiv!: alias function! [
	program     [ GLuint! ]
	uniformCount [ GLsizei! ]
	uniformIndices [ pointer! [GLuint!] ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint index, GLint* data );
glGetIntegeri_v!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	data        [ pointer! [GLint!] ]
]
;@@ GLuint ( GLuint program, const GLchar* uniformBlockName );
glGetUniformBlockIndex!: alias function! [
	program     [ GLuint! ]
	uniformBlockName [ GLstring! ]
	return: [ GLuint! ]

]
;@@ void ( GLuint program, GLsizei uniformCount, const GLchar* const * uniformNames, GLuint* uniformIndices );
glGetUniformIndices!: alias function! [
	program     [ GLuint! ]
	uniformCount [ GLsizei! ]
	uniformNames [ GLstring-ptr! ]
	uniformIndices [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLuint uniformBlockIndex, GLuint uniformBlockBinding );
glUniformBlockBinding!: alias function! [
	program     [ GLuint! ]
	uniformBlockIndex [ GLuint! ]
	uniformBlockBinding [ GLuint! ]
]


;-------------------------------------------
;-- GL_ARB_vertex_array_bgra
;-------------------------------------------

#define  GL_ARB_vertex_array_bgra                     1
;#define  GL_BGRA                                      80E1h


;-------------------------------------------
;-- GL_ARB_vertex_array_object
;-------------------------------------------

#define  GL_ARB_vertex_array_object                   1
#define  GL_VERTEX_ARRAY_BINDING                      85B5h
;@@ void ( GLuint array );
glBindVertexArray!: alias function! [
	array       [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* arrays );
glDeleteVertexArrays!: alias function! [
	n           [ GLsizei! ]
	arrays      [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* arrays );
glGenVertexArrays!: alias function! [
	n           [ GLsizei! ]
	arrays      [ pointer! [GLuint!] ]
]
;@@ GLboolean ( GLuint array );
glIsVertexArray!: alias function! [
	array       [ GLuint! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_ARB_vertex_attrib_64bit
;-------------------------------------------

#define  GL_ARB_vertex_attrib_64bit                   1
;@@ void ( GLuint index, GLenum pname, GLdouble* params );
glGetVertexAttribLdv!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLdouble x );
glVertexAttribL1d!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttribL1dv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y );
glVertexAttribL2d!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttribL2dv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y, GLdouble z );
glVertexAttribL3d!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttribL3dv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glVertexAttribL4d!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttribL4dv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLsizei stride, const void* pointer );
glVertexAttribLPointer!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_ARB_vertex_attrib_binding
;-------------------------------------------

#define  GL_ARB_vertex_attrib_binding                 1
#define  GL_VERTEX_ATTRIB_BINDING                     82D4h
#define  GL_VERTEX_ATTRIB_RELATIVE_OFFSET             82D5h
#define  GL_VERTEX_BINDING_DIVISOR                    82D6h
#define  GL_VERTEX_BINDING_OFFSET                     82D7h
#define  GL_VERTEX_BINDING_STRIDE                     82D8h
#define  GL_MAX_VERTEX_ATTRIB_RELATIVE_OFFSET         82D9h
#define  GL_MAX_VERTEX_ATTRIB_BINDINGS                82DAh
#define  GL_VERTEX_BINDING_BUFFER                     8F4Fh
;@@ void ( GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride );
glBindVertexBuffer!: alias function! [
	bindingindex [ GLuint! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLuint vaobj, GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride );
glVertexArrayBindVertexBufferEXT!: alias function! [
	vaobj       [ GLuint! ]
	bindingindex [ GLuint! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLuint vaobj, GLuint attribindex, GLuint bindingindex );
glVertexArrayVertexAttribBindingEXT!: alias function! [
	vaobj       [ GLuint! ]
	attribindex [ GLuint! ]
	bindingindex [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset );
glVertexArrayVertexAttribFormatEXT!: alias function! [
	vaobj       [ GLuint! ]
	attribindex [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	relativeoffset [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset );
glVertexArrayVertexAttribIFormatEXT!: alias function! [
	vaobj       [ GLuint! ]
	attribindex [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	relativeoffset [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset );
glVertexArrayVertexAttribLFormatEXT!: alias function! [
	vaobj       [ GLuint! ]
	attribindex [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	relativeoffset [ GLuint! ]
]
;@@ void ( GLuint vaobj, GLuint bindingindex, GLuint divisor );
glVertexArrayVertexBindingDivisorEXT!: alias function! [
	vaobj       [ GLuint! ]
	bindingindex [ GLuint! ]
	divisor     [ GLuint! ]
]
;@@ void ( GLuint attribindex, GLuint bindingindex );
glVertexAttribBinding!: alias function! [
	attribindex [ GLuint! ]
	bindingindex [ GLuint! ]
]
;@@ void ( GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset );
glVertexAttribFormat!: alias function! [
	attribindex [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	relativeoffset [ GLuint! ]
]
;@@ void ( GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset );
glVertexAttribIFormat!: alias function! [
	attribindex [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	relativeoffset [ GLuint! ]
]
;@@ void ( GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset );
glVertexAttribLFormat!: alias function! [
	attribindex [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	relativeoffset [ GLuint! ]
]
;@@ void ( GLuint bindingindex, GLuint divisor );
glVertexBindingDivisor!: alias function! [
	bindingindex [ GLuint! ]
	divisor     [ GLuint! ]
]


;-------------------------------------------
;-- GL_ARB_vertex_blend
;-------------------------------------------

#define  GL_ARB_vertex_blend                          1
#define  GL_MODELVIEW0_ARB                            1700h
#define  GL_MODELVIEW1_ARB                            850Ah
#define  GL_MAX_VERTEX_UNITS_ARB                      86A4h
#define  GL_ACTIVE_VERTEX_UNITS_ARB                   86A5h
#define  GL_WEIGHT_SUM_UNITY_ARB                      86A6h
#define  GL_VERTEX_BLEND_ARB                          86A7h
#define  GL_CURRENT_WEIGHT_ARB                        86A8h
#define  GL_WEIGHT_ARRAY_TYPE_ARB                     86A9h
#define  GL_WEIGHT_ARRAY_STRIDE_ARB                   86AAh
#define  GL_WEIGHT_ARRAY_SIZE_ARB                     86ABh
#define  GL_WEIGHT_ARRAY_POINTER_ARB                  86ACh
#define  GL_WEIGHT_ARRAY_ARB                          86ADh
#define  GL_MODELVIEW2_ARB                            8722h
#define  GL_MODELVIEW3_ARB                            8723h
#define  GL_MODELVIEW4_ARB                            8724h
#define  GL_MODELVIEW5_ARB                            8725h
#define  GL_MODELVIEW6_ARB                            8726h
#define  GL_MODELVIEW7_ARB                            8727h
#define  GL_MODELVIEW8_ARB                            8728h
#define  GL_MODELVIEW9_ARB                            8729h
#define  GL_MODELVIEW10_ARB                           872Ah
#define  GL_MODELVIEW11_ARB                           872Bh
#define  GL_MODELVIEW12_ARB                           872Ch
#define  GL_MODELVIEW13_ARB                           872Dh
#define  GL_MODELVIEW14_ARB                           872Eh
#define  GL_MODELVIEW15_ARB                           872Fh
#define  GL_MODELVIEW16_ARB                           8730h
#define  GL_MODELVIEW17_ARB                           8731h
#define  GL_MODELVIEW18_ARB                           8732h
#define  GL_MODELVIEW19_ARB                           8733h
#define  GL_MODELVIEW20_ARB                           8734h
#define  GL_MODELVIEW21_ARB                           8735h
#define  GL_MODELVIEW22_ARB                           8736h
#define  GL_MODELVIEW23_ARB                           8737h
#define  GL_MODELVIEW24_ARB                           8738h
#define  GL_MODELVIEW25_ARB                           8739h
#define  GL_MODELVIEW26_ARB                           873Ah
#define  GL_MODELVIEW27_ARB                           873Bh
#define  GL_MODELVIEW28_ARB                           873Ch
#define  GL_MODELVIEW29_ARB                           873Dh
#define  GL_MODELVIEW30_ARB                           873Eh
#define  GL_MODELVIEW31_ARB                           873Fh
;@@ void ( GLint count );
glVertexBlendARB!: alias function! [
	count       [ GLint! ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride, void *pointer );
glWeightPointerARB!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLint size, GLbyte *weights );
glWeightbvARB!: alias function! [
	size        [ GLint! ]
	weights     [ pointer! [GLbyte!] ]
]
;@@ void ( GLint size, GLdouble *weights );
glWeightdvARB!: alias function! [
	size        [ GLint! ]
	weights     [ pointer! [GLdouble!] ]
]
;@@ void ( GLint size, GLfloat *weights );
glWeightfvARB!: alias function! [
	size        [ GLint! ]
	weights     [ pointer! [GLfloat!] ]
]
;@@ void ( GLint size, GLint *weights );
glWeightivARB!: alias function! [
	size        [ GLint! ]
	weights     [ pointer! [GLint!] ]
]
;@@ void ( GLint size, GLshort *weights );
glWeightsvARB!: alias function! [
	size        [ GLint! ]
	weights     [ GLshort-ptr! ]
]
;@@ void ( GLint size, GLubyte *weights );
glWeightubvARB!: alias function! [
	size        [ GLint! ]
	weights     [ pointer! [GLubyte!] ]
]
;@@ void ( GLint size, GLuint *weights );
glWeightuivARB!: alias function! [
	size        [ GLint! ]
	weights     [ pointer! [GLuint!] ]
]
;@@ void ( GLint size, GLushort *weights );
glWeightusvARB!: alias function! [
	size        [ GLint! ]
	weights     [ GLushort-ptr! ]
]


;-------------------------------------------
;-- GL_ARB_vertex_buffer_object
;-------------------------------------------

#define  GL_ARB_vertex_buffer_object                  1
#define  GL_BUFFER_SIZE_ARB                           8764h
#define  GL_BUFFER_USAGE_ARB                          8765h
#define  GL_ARRAY_BUFFER_ARB                          8892h
#define  GL_ELEMENT_ARRAY_BUFFER_ARB                  8893h
#define  GL_ARRAY_BUFFER_BINDING_ARB                  8894h
#define  GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB          8895h
#define  GL_VERTEX_ARRAY_BUFFER_BINDING_ARB           8896h
#define  GL_NORMAL_ARRAY_BUFFER_BINDING_ARB           8897h
#define  GL_COLOR_ARRAY_BUFFER_BINDING_ARB            8898h
#define  GL_INDEX_ARRAY_BUFFER_BINDING_ARB            8899h
#define  GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB    889Ah
#define  GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB        889Bh
#define  GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB  889Ch
#define  GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB   889Dh
#define  GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB           889Eh
#define  GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB    889Fh
#define  GL_READ_ONLY_ARB                             88B8h
#define  GL_WRITE_ONLY_ARB                            88B9h
#define  GL_READ_WRITE_ARB                            88BAh
#define  GL_BUFFER_ACCESS_ARB                         88BBh
#define  GL_BUFFER_MAPPED_ARB                         88BCh
#define  GL_BUFFER_MAP_POINTER_ARB                    88BDh
#define  GL_STREAM_DRAW_ARB                           88E0h
#define  GL_STREAM_READ_ARB                           88E1h
#define  GL_STREAM_COPY_ARB                           88E2h
#define  GL_STATIC_DRAW_ARB                           88E4h
#define  GL_STATIC_READ_ARB                           88E5h
#define  GL_STATIC_COPY_ARB                           88E6h
#define  GL_DYNAMIC_DRAW_ARB                          88E8h
#define  GL_DYNAMIC_READ_ARB                          88E9h
#define  GL_DYNAMIC_COPY_ARB                          88EAh
;@@ void ( GLenum target, GLuint buffer );
glBindBufferARB!: alias function! [
	target      [ GLenum! ]
	buffer      [ GLuint! ]
]
;@@ void ( GLenum target, GLsizeiptrARB size, const void *data, GLenum usage );
glBufferDataARB!: alias function! [
	target      [ GLenum! ]
	size        [ GLsizeiptrARB! ]
	data        [ pointer! [byte!] ]
	usage       [ GLenum! ]
]
;@@ void ( GLenum target, GLintptrARB offset, GLsizeiptrARB size, const void *data );
glBufferSubDataARB!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptrARB! ]
	size        [ GLsizeiptrARB! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLsizei n, const GLuint* buffers );
glDeleteBuffersARB!: alias function! [
	n           [ GLsizei! ]
	buffers     [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* buffers );
glGenBuffersARB!: alias function! [
	n           [ GLsizei! ]
	buffers     [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetBufferParameterivARB!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, void** params );
glGetBufferPointervARB!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ binary-ptr! ]
]
;@@ void ( GLenum target, GLintptrARB offset, GLsizeiptrARB size, void *data );
glGetBufferSubDataARB!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptrARB! ]
	size        [ GLsizeiptrARB! ]
	data        [ pointer! [byte!] ]
]
;@@ GLboolean ( GLuint buffer );
glIsBufferARB!: alias function! [
	buffer      [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void * ( GLenum target, GLenum access );
glMapBufferARB!: alias function! [
	target      [ GLenum! ]
	access      [ GLenum! ]
	return: [ pointer! [byte!] ]

]
;@@ GLboolean ( GLenum target );
glUnmapBufferARB!: alias function! [
	target      [ GLenum! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_ARB_vertex_program
;-------------------------------------------

#define  GL_ARB_vertex_program                        1
#define  GL_COLOR_SUM_ARB                             8458h
#define  GL_VERTEX_PROGRAM_ARB                        8620h
#define  GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB           8622h
#define  GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB              8623h
#define  GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB            8624h
#define  GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB              8625h
#define  GL_CURRENT_VERTEX_ATTRIB_ARB                 8626h
#define  GL_PROGRAM_LENGTH_ARB                        8627h
#define  GL_PROGRAM_STRING_ARB                        8628h
#define  GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB        862Eh
#define  GL_MAX_PROGRAM_MATRICES_ARB                  862Fh
#define  GL_CURRENT_MATRIX_STACK_DEPTH_ARB            8640h
#define  GL_CURRENT_MATRIX_ARB                        8641h
#define  GL_VERTEX_PROGRAM_POINT_SIZE_ARB             8642h
#define  GL_VERTEX_PROGRAM_TWO_SIDE_ARB               8643h
#define  GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB           8645h
#define  GL_PROGRAM_ERROR_POSITION_ARB                864Bh
#define  GL_PROGRAM_BINDING_ARB                       8677h
#define  GL_MAX_VERTEX_ATTRIBS_ARB                    8869h
#define  GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB        886Ah
#define  GL_PROGRAM_ERROR_STRING_ARB                  8874h
#define  GL_PROGRAM_FORMAT_ASCII_ARB                  8875h
#define  GL_PROGRAM_FORMAT_ARB                        8876h
#define  GL_PROGRAM_INSTRUCTIONS_ARB                  88A0h
#define  GL_MAX_PROGRAM_INSTRUCTIONS_ARB              88A1h
#define  GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB           88A2h
#define  GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB       88A3h
#define  GL_PROGRAM_TEMPORARIES_ARB                   88A4h
#define  GL_MAX_PROGRAM_TEMPORARIES_ARB               88A5h
#define  GL_PROGRAM_NATIVE_TEMPORARIES_ARB            88A6h
#define  GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB        88A7h
#define  GL_PROGRAM_PARAMETERS_ARB                    88A8h
#define  GL_MAX_PROGRAM_PARAMETERS_ARB                88A9h
#define  GL_PROGRAM_NATIVE_PARAMETERS_ARB             88AAh
#define  GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB         88ABh
#define  GL_PROGRAM_ATTRIBS_ARB                       88ACh
#define  GL_MAX_PROGRAM_ATTRIBS_ARB                   88ADh
#define  GL_PROGRAM_NATIVE_ATTRIBS_ARB                88AEh
#define  GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB            88AFh
#define  GL_PROGRAM_ADDRESS_REGISTERS_ARB             88B0h
#define  GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB         88B1h
#define  GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB      88B2h
#define  GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB  88B3h
#define  GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB          88B4h
#define  GL_MAX_PROGRAM_ENV_PARAMETERS_ARB            88B5h
#define  GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB           88B6h
#define  GL_TRANSPOSE_CURRENT_MATRIX_ARB              88B7h
#define  GL_MATRIX0_ARB                               88C0h
#define  GL_MATRIX1_ARB                               88C1h
#define  GL_MATRIX2_ARB                               88C2h
#define  GL_MATRIX3_ARB                               88C3h
#define  GL_MATRIX4_ARB                               88C4h
#define  GL_MATRIX5_ARB                               88C5h
#define  GL_MATRIX6_ARB                               88C6h
#define  GL_MATRIX7_ARB                               88C7h
#define  GL_MATRIX8_ARB                               88C8h
#define  GL_MATRIX9_ARB                               88C9h
#define  GL_MATRIX10_ARB                              88CAh
#define  GL_MATRIX11_ARB                              88CBh
#define  GL_MATRIX12_ARB                              88CCh
#define  GL_MATRIX13_ARB                              88CDh
#define  GL_MATRIX14_ARB                              88CEh
#define  GL_MATRIX15_ARB                              88CFh
#define  GL_MATRIX16_ARB                              88D0h
#define  GL_MATRIX17_ARB                              88D1h
#define  GL_MATRIX18_ARB                              88D2h
#define  GL_MATRIX19_ARB                              88D3h
#define  GL_MATRIX20_ARB                              88D4h
#define  GL_MATRIX21_ARB                              88D5h
#define  GL_MATRIX22_ARB                              88D6h
#define  GL_MATRIX23_ARB                              88D7h
#define  GL_MATRIX24_ARB                              88D8h
#define  GL_MATRIX25_ARB                              88D9h
#define  GL_MATRIX26_ARB                              88DAh
#define  GL_MATRIX27_ARB                              88DBh
#define  GL_MATRIX28_ARB                              88DCh
#define  GL_MATRIX29_ARB                              88DDh
#define  GL_MATRIX30_ARB                              88DEh
#define  GL_MATRIX31_ARB                              88DFh
;@@ void ( GLenum target, GLuint program );
glBindProgramARB!: alias function! [
	target      [ GLenum! ]
	program     [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* programs );
glDeleteProgramsARB!: alias function! [
	n           [ GLsizei! ]
	programs    [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index );
glDisableVertexAttribArrayARB!: alias function! [
	index       [ GLuint! ]
]
;@@ void ( GLuint index );
glEnableVertexAttribArrayARB!: alias function! [
	index       [ GLuint! ]
]
;@@ void ( GLsizei n, GLuint* programs );
glGenProgramsARB!: alias function! [
	n           [ GLsizei! ]
	programs    [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLuint index, GLdouble* params );
glGetProgramEnvParameterdvARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLuint index, GLfloat* params );
glGetProgramEnvParameterfvARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLuint index, GLdouble* params );
glGetProgramLocalParameterdvARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLuint index, GLfloat* params );
glGetProgramLocalParameterfvARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, void *string );
glGetProgramStringARB!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	string      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetProgramivARB!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLenum pname, void** pointer );
glGetVertexAttribPointervARB!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	pointer     [ binary-ptr! ]
]
;@@ void ( GLuint index, GLenum pname, GLdouble* params );
glGetVertexAttribdvARB!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLenum pname, GLfloat* params );
glGetVertexAttribfvARB!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLenum pname, GLint* params );
glGetVertexAttribivARB!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint program );
glIsProgramARB!: alias function! [
	program     [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glProgramEnvParameter4dARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLenum target, GLuint index, const GLdouble* params );
glProgramEnvParameter4dvARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glProgramEnvParameter4fARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( GLenum target, GLuint index, const GLfloat* params );
glProgramEnvParameter4fvARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glProgramLocalParameter4dARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLenum target, GLuint index, const GLdouble* params );
glProgramLocalParameter4dvARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glProgramLocalParameter4fARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( GLenum target, GLuint index, const GLfloat* params );
glProgramLocalParameter4fvARB!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum format, GLsizei len, const void *string );
glProgramStringARB!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	len         [ GLsizei! ]
	string      [ pointer! [byte!] ]
]
;@@ void ( GLuint index, GLdouble x );
glVertexAttrib1dARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib1dvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x );
glVertexAttrib1fARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib1fvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLshort x );
glVertexAttrib1sARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib1svARB!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y );
glVertexAttrib2dARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib2dvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y );
glVertexAttrib2fARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib2fvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLshort x, GLshort y );
glVertexAttrib2sARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib2svARB!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y, GLdouble z );
glVertexAttrib3dARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib3dvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y, GLfloat z );
glVertexAttrib3fARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib3fvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLshort x, GLshort y, GLshort z );
glVertexAttrib3sARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib3svARB!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, const GLbyte* v );
glVertexAttrib4NbvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLbyte!] ]
]
;@@ void ( GLuint index, const GLint* v );
glVertexAttrib4NivARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib4NsvARB!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w );
glVertexAttrib4NubARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLubyte! ]
	y           [ GLubyte! ]
	z           [ GLubyte! ]
	w           [ GLubyte! ]
]
;@@ void ( GLuint index, const GLubyte* v );
glVertexAttrib4NubvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint index, const GLuint* v );
glVertexAttrib4NuivARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, const GLushort* v );
glVertexAttrib4NusvARB!: alias function! [
	index       [ GLuint! ]
	v           [ GLushort-ptr! ]
]
;@@ void ( GLuint index, const GLbyte* v );
glVertexAttrib4bvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLbyte!] ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glVertexAttrib4dARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib4dvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glVertexAttrib4fARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib4fvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, const GLint* v );
glVertexAttrib4ivARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLshort x, GLshort y, GLshort z, GLshort w );
glVertexAttrib4sARB!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
	w           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib4svARB!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, const GLubyte* v );
glVertexAttrib4ubvARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint index, const GLuint* v );
glVertexAttrib4uivARB!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, const GLushort* v );
glVertexAttrib4usvARB!: alias function! [
	index       [ GLuint! ]
	v           [ GLushort-ptr! ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const void *pointer );
glVertexAttribPointerARB!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_ARB_vertex_shader
;-------------------------------------------

#define  GL_ARB_vertex_shader                         1
#define  GL_VERTEX_SHADER_ARB                         8B31h
#define  GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB         8B4Ah
#define  GL_MAX_VARYING_FLOATS_ARB                    8B4Bh
#define  GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB        8B4Ch
#define  GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB      8B4Dh
#define  GL_OBJECT_ACTIVE_ATTRIBUTES_ARB              8B89h
#define  GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB    8B8Ah
;@@ void ( GLhandleARB programObj, GLuint index, const GLcharARB* name );
glBindAttribLocationARB!: alias function! [
	programObj  [ GLhandleARB! ]
	index       [ GLuint! ]
	name        [ GLcharARB-ptr! ]
]
;@@ void ( GLhandleARB programObj, GLuint index, GLsizei maxLength, GLsizei* length, GLint *size, GLenum *type, GLcharARB *name );
glGetActiveAttribARB!: alias function! [
	programObj  [ GLhandleARB! ]
	index       [ GLuint! ]
	maxLength   [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	size        [ pointer! [GLint!] ]
	type        [ pointer! [GLenum!] ]
	name        [ GLcharARB-ptr! ]
]
;@@ GLint ( GLhandleARB programObj, const GLcharARB* name );
glGetAttribLocationARB!: alias function! [
	programObj  [ GLhandleARB! ]
	name        [ GLcharARB-ptr! ]
	return: [ GLint! ]

]


;-------------------------------------------
;-- GL_ARB_vertex_type_10f_11f_11f_rev
;-------------------------------------------

#define  GL_ARB_vertex_type_10f_11f_11f_rev           1
;#define  GL_UNSIGNED_INT_10F_11F_11F_REV              8C3Bh


;-------------------------------------------
;-- GL_ARB_vertex_type_2_10_10_10_rev
;-------------------------------------------

#define  GL_ARB_vertex_type_2_10_10_10_rev            1
#define  GL_UNSIGNED_INT_2_10_10_10_REV               8368h
#define  GL_INT_2_10_10_10_REV                        8D9Fh
;@@ void ( GLenum type, GLuint color );
glColorP3ui!: alias function! [
	type        [ GLenum! ]
	color       [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* color );
glColorP3uiv!: alias function! [
	type        [ GLenum! ]
	color       [ pointer! [GLuint!] ]
]
;@@ void ( GLenum type, GLuint color );
glColorP4ui!: alias function! [
	type        [ GLenum! ]
	color       [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* color );
glColorP4uiv!: alias function! [
	type        [ GLenum! ]
	color       [ pointer! [GLuint!] ]
]
;@@ void ( GLenum texture, GLenum type, GLuint coords );
glMultiTexCoordP1ui!: alias function! [
	texture     [ GLenum! ]
	type        [ GLenum! ]
	coords      [ GLuint! ]
]
;@@ void ( GLenum texture, GLenum type, const GLuint* coords );
glMultiTexCoordP1uiv!: alias function! [
	texture     [ GLenum! ]
	type        [ GLenum! ]
	coords      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum texture, GLenum type, GLuint coords );
glMultiTexCoordP2ui!: alias function! [
	texture     [ GLenum! ]
	type        [ GLenum! ]
	coords      [ GLuint! ]
]
;@@ void ( GLenum texture, GLenum type, const GLuint* coords );
glMultiTexCoordP2uiv!: alias function! [
	texture     [ GLenum! ]
	type        [ GLenum! ]
	coords      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum texture, GLenum type, GLuint coords );
glMultiTexCoordP3ui!: alias function! [
	texture     [ GLenum! ]
	type        [ GLenum! ]
	coords      [ GLuint! ]
]
;@@ void ( GLenum texture, GLenum type, const GLuint* coords );
glMultiTexCoordP3uiv!: alias function! [
	texture     [ GLenum! ]
	type        [ GLenum! ]
	coords      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum texture, GLenum type, GLuint coords );
glMultiTexCoordP4ui!: alias function! [
	texture     [ GLenum! ]
	type        [ GLenum! ]
	coords      [ GLuint! ]
]
;@@ void ( GLenum texture, GLenum type, const GLuint* coords );
glMultiTexCoordP4uiv!: alias function! [
	texture     [ GLenum! ]
	type        [ GLenum! ]
	coords      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum type, GLuint coords );
glNormalP3ui!: alias function! [
	type        [ GLenum! ]
	coords      [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* coords );
glNormalP3uiv!: alias function! [
	type        [ GLenum! ]
	coords      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum type, GLuint color );
glSecondaryColorP3ui!: alias function! [
	type        [ GLenum! ]
	color       [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* color );
glSecondaryColorP3uiv!: alias function! [
	type        [ GLenum! ]
	color       [ pointer! [GLuint!] ]
]
;@@ void ( GLenum type, GLuint coords );
glTexCoordP1ui!: alias function! [
	type        [ GLenum! ]
	coords      [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* coords );
glTexCoordP1uiv!: alias function! [
	type        [ GLenum! ]
	coords      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum type, GLuint coords );
glTexCoordP2ui!: alias function! [
	type        [ GLenum! ]
	coords      [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* coords );
glTexCoordP2uiv!: alias function! [
	type        [ GLenum! ]
	coords      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum type, GLuint coords );
glTexCoordP3ui!: alias function! [
	type        [ GLenum! ]
	coords      [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* coords );
glTexCoordP3uiv!: alias function! [
	type        [ GLenum! ]
	coords      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum type, GLuint coords );
glTexCoordP4ui!: alias function! [
	type        [ GLenum! ]
	coords      [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* coords );
glTexCoordP4uiv!: alias function! [
	type        [ GLenum! ]
	coords      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLenum type, GLboolean normalized, GLuint value );
glVertexAttribP1ui!: alias function! [
	index       [ GLuint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	value       [ GLuint! ]
]
;@@ void ( GLuint index, GLenum type, GLboolean normalized, const GLuint* value );
glVertexAttribP1uiv!: alias function! [
	index       [ GLuint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLenum type, GLboolean normalized, GLuint value );
glVertexAttribP2ui!: alias function! [
	index       [ GLuint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	value       [ GLuint! ]
]
;@@ void ( GLuint index, GLenum type, GLboolean normalized, const GLuint* value );
glVertexAttribP2uiv!: alias function! [
	index       [ GLuint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLenum type, GLboolean normalized, GLuint value );
glVertexAttribP3ui!: alias function! [
	index       [ GLuint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	value       [ GLuint! ]
]
;@@ void ( GLuint index, GLenum type, GLboolean normalized, const GLuint* value );
glVertexAttribP3uiv!: alias function! [
	index       [ GLuint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLenum type, GLboolean normalized, GLuint value );
glVertexAttribP4ui!: alias function! [
	index       [ GLuint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	value       [ GLuint! ]
]
;@@ void ( GLuint index, GLenum type, GLboolean normalized, const GLuint* value );
glVertexAttribP4uiv!: alias function! [
	index       [ GLuint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLenum type, GLuint value );
glVertexP2ui!: alias function! [
	type        [ GLenum! ]
	value       [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* value );
glVertexP2uiv!: alias function! [
	type        [ GLenum! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLenum type, GLuint value );
glVertexP3ui!: alias function! [
	type        [ GLenum! ]
	value       [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* value );
glVertexP3uiv!: alias function! [
	type        [ GLenum! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLenum type, GLuint value );
glVertexP4ui!: alias function! [
	type        [ GLenum! ]
	value       [ GLuint! ]
]
;@@ void ( GLenum type, const GLuint* value );
glVertexP4uiv!: alias function! [
	type        [ GLenum! ]
	value       [ pointer! [GLuint!] ]
]


;-------------------------------------------
;-- GL_ARB_viewport_array
;-------------------------------------------

#define  GL_ARB_viewport_array                        1
;#define  GL_DEPTH_RANGE                               0B70h
;#define  GL_VIEWPORT                                  0BA2h
;#define  GL_SCISSOR_BOX                               0C10h
;#define  GL_SCISSOR_TEST                              0C11h
#define  GL_MAX_VIEWPORTS                             825Bh
#define  GL_VIEWPORT_SUBPIXEL_BITS                    825Ch
#define  GL_VIEWPORT_BOUNDS_RANGE                     825Dh
#define  GL_LAYER_PROVOKING_VERTEX                    825Eh
#define  GL_VIEWPORT_INDEX_PROVOKING_VERTEX           825Fh
#define  GL_UNDEFINED_VERTEX                          8260h
;#define  GL_FIRST_VERTEX_CONVENTION                   8E4Dh
;#define  GL_LAST_VERTEX_CONVENTION                    8E4Eh
;#define  GL_PROVOKING_VERTEX                          8E4Fh
;@@ void ( GLuint first, GLsizei count, const GLclampd * v );
glDepthRangeArrayv!: alias function! [
	first       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLclampd!] ]
]
;@@ void ( GLuint index, GLclampd n, GLclampd f );
glDepthRangeIndexed!: alias function! [
	index       [ GLuint! ]
	n           [ GLclampd! ]
	f           [ GLclampd! ]
]
;@@ void ( GLenum target, GLuint index, GLdouble* data );
glGetDoublei_v!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	data        [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLuint index, GLfloat* data );
glGetFloati_v!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	data        [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint first, GLsizei count, const GLint * v );
glScissorArrayv!: alias function! [
	first       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLint left, GLint bottom, GLsizei width, GLsizei height );
glScissorIndexed!: alias function! [
	index       [ GLuint! ]
	left        [ GLint! ]
	bottom      [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint index, const GLint * v );
glScissorIndexedv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint first, GLsizei count, const GLfloat * v );
glViewportArrayv!: alias function! [
	first       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y, GLfloat w, GLfloat h );
glViewportIndexedf!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	w           [ GLfloat! ]
	h           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat * v );
glViewportIndexedfv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_ARB_window_pos
;-------------------------------------------

#define  GL_ARB_window_pos                            1
;@@ void ( GLdouble x, GLdouble y );
glWindowPos2dARB!: alias function! [
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( const GLdouble* p );
glWindowPos2dvARB!: alias function! [
	p           [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat x, GLfloat y );
glWindowPos2fARB!: alias function! [
	x           [ GLfloat! ]
	y           [ GLfloat! ]
]
;@@ void ( const GLfloat* p );
glWindowPos2fvARB!: alias function! [
	p           [ pointer! [GLfloat!] ]
]
;@@ void ( GLint x, GLint y );
glWindowPos2iARB!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
]
;@@ void ( const GLint* p );
glWindowPos2ivARB!: alias function! [
	p           [ pointer! [GLint!] ]
]
;@@ void ( GLshort x, GLshort y );
glWindowPos2sARB!: alias function! [
	x           [ GLshort! ]
	y           [ GLshort! ]
]
;@@ void ( const GLshort* p );
glWindowPos2svARB!: alias function! [
	p           [ GLshort-ptr! ]
]
;@@ void ( GLdouble x, GLdouble y, GLdouble z );
glWindowPos3dARB!: alias function! [
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( const GLdouble* p );
glWindowPos3dvARB!: alias function! [
	p           [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat x, GLfloat y, GLfloat z );
glWindowPos3fARB!: alias function! [
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat* p );
glWindowPos3fvARB!: alias function! [
	p           [ pointer! [GLfloat!] ]
]
;@@ void ( GLint x, GLint y, GLint z );
glWindowPos3iARB!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
]
;@@ void ( const GLint* p );
glWindowPos3ivARB!: alias function! [
	p           [ pointer! [GLint!] ]
]
;@@ void ( GLshort x, GLshort y, GLshort z );
glWindowPos3sARB!: alias function! [
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
]
;@@ void ( const GLshort* p );
glWindowPos3svARB!: alias function! [
	p           [ GLshort-ptr! ]
]
