Red/System [
	Title:   "Red/System OpenGL KHR extension binding"
	Author:  "Oldes"
	File: 	 %gl-KHR.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_KHR_blend_equation_advanced
;-------------------------------------------

#define  GL_KHR_blend_equation_advanced               1
#define  GL_BLEND_ADVANCED_COHERENT_KHR               9285h
#define  GL_MULTIPLY_KHR                              9294h
#define  GL_SCREEN_KHR                                9295h
#define  GL_OVERLAY_KHR                               9296h
#define  GL_DARKEN_KHR                                9297h
#define  GL_LIGHTEN_KHR                               9298h
#define  GL_COLORDODGE_KHR                            9299h
#define  GL_COLORBURN_KHR                             929Ah
#define  GL_HARDLIGHT_KHR                             929Bh
#define  GL_SOFTLIGHT_KHR                             929Ch
#define  GL_DIFFERENCE_KHR                            929Eh
#define  GL_EXCLUSION_KHR                             92A0h
#define  GL_HSL_HUE_KHR                               92ADh
#define  GL_HSL_SATURATION_KHR                        92AEh
#define  GL_HSL_COLOR_KHR                             92AFh
#define  GL_HSL_LUMINOSITY_KHR                        92B0h
;@@ void ( void );
glBlendBarrierKHR!: alias function! [
]


;-------------------------------------------
;-- GL_KHR_blend_equation_advanced_coherent
;-------------------------------------------

#define  GL_KHR_blend_equation_advanced_coherent      1


;-------------------------------------------
;-- GL_KHR_context_flush_control
;-------------------------------------------

#define  GL_KHR_context_flush_control                 1


;-------------------------------------------
;-- GL_KHR_debug
;-------------------------------------------

#define  GL_KHR_debug                                 1
#define  GL_CONTEXT_FLAG_DEBUG_BIT                    00000002h
;#define  GL_STACK_OVERFLOW                            0503h
;#define  GL_STACK_UNDERFLOW                           0504h
#define  GL_DEBUG_OUTPUT_SYNCHRONOUS                  8242h
#define  GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH          8243h
#define  GL_DEBUG_CALLBACK_FUNCTION                   8244h
#define  GL_DEBUG_CALLBACK_USER_PARAM                 8245h
#define  GL_DEBUG_SOURCE_API                          8246h
#define  GL_DEBUG_SOURCE_WINDOW_SYSTEM                8247h
#define  GL_DEBUG_SOURCE_SHADER_COMPILER              8248h
#define  GL_DEBUG_SOURCE_THIRD_PARTY                  8249h
#define  GL_DEBUG_SOURCE_APPLICATION                  824Ah
#define  GL_DEBUG_SOURCE_OTHER                        824Bh
#define  GL_DEBUG_TYPE_ERROR                          824Ch
#define  GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR            824Dh
#define  GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR             824Eh
#define  GL_DEBUG_TYPE_PORTABILITY                    824Fh
#define  GL_DEBUG_TYPE_PERFORMANCE                    8250h
#define  GL_DEBUG_TYPE_OTHER                          8251h
#define  GL_DEBUG_TYPE_MARKER                         8268h
#define  GL_DEBUG_TYPE_PUSH_GROUP                     8269h
#define  GL_DEBUG_TYPE_POP_GROUP                      826Ah
#define  GL_DEBUG_SEVERITY_NOTIFICATION               826Bh
#define  GL_MAX_DEBUG_GROUP_STACK_DEPTH               826Ch
#define  GL_DEBUG_GROUP_STACK_DEPTH                   826Dh
#define  GL_BUFFER                                    82E0h
#define  GL_SHADER                                    82E1h
#define  GL_PROGRAM                                   82E2h
#define  GL_QUERY                                     82E3h
#define  GL_PROGRAM_PIPELINE                          82E4h
#define  GL_SAMPLER                                   82E6h
#define  GL_DISPLAY_LIST                              82E7h
#define  GL_MAX_LABEL_LENGTH                          82E8h
#define  GL_MAX_DEBUG_MESSAGE_LENGTH                  9143h
#define  GL_MAX_DEBUG_LOGGED_MESSAGES                 9144h
#define  GL_DEBUG_LOGGED_MESSAGES                     9145h
#define  GL_DEBUG_SEVERITY_HIGH                       9146h
#define  GL_DEBUG_SEVERITY_MEDIUM                     9147h
#define  GL_DEBUG_SEVERITY_LOW                        9148h
#define  GL_DEBUG_OUTPUT                              92E0h
;@@ void ( GLDEBUGPROC callback, const void *userParam );
glDebugMessageCallback!: alias function! [
	callback    [ GLDEBUGPROC! ]
	userParam   [ pointer! [byte!] ]
]
;@@ void ( GLenum source, GLenum type, GLenum severity, GLsizei count, const GLuint* ids, GLboolean enabled );
glDebugMessageControl!: alias function! [
	source      [ GLenum! ]
	type        [ GLenum! ]
	severity    [ GLenum! ]
	count       [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
	enabled     [ GLboolean! ]
]
;@@ void ( GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar* buf );
glDebugMessageInsert!: alias function! [
	source      [ GLenum! ]
	type        [ GLenum! ]
	id          [ GLuint! ]
	severity    [ GLenum! ]
	length      [ GLsizei! ]
	buf         [ GLstring! ]
]
;@@ GLuint ( GLuint count, GLsizei bufSize, GLenum* sources, GLenum* types, GLuint* ids, GLenum* severities, GLsizei* lengths, GLchar* messageLog );
glGetDebugMessageLog!: alias function! [
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
;@@ void ( GLenum identifier, GLuint name, GLsizei bufSize, GLsizei* length, GLchar *label );
glGetObjectLabel!: alias function! [
	identifier  [ GLenum! ]
	name        [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	label       [ GLstring! ]
]
;@@ void ( void* ptr, GLsizei bufSize, GLsizei* length, GLchar *label );
glGetObjectPtrLabel!: alias function! [
	ptr         [ pointer! [byte!] ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	label       [ GLstring! ]
]
;@@ void ( GLenum identifier, GLuint name, GLsizei length, const GLchar* label );
glObjectLabel!: alias function! [
	identifier  [ GLenum! ]
	name        [ GLuint! ]
	length      [ GLsizei! ]
	label       [ GLstring! ]
]
;@@ void ( void* ptr, GLsizei length, const GLchar* label );
glObjectPtrLabel!: alias function! [
	ptr         [ pointer! [byte!] ]
	length      [ GLsizei! ]
	label       [ GLstring! ]
]
;@@ void ( void );
glPopDebugGroup!: alias function! [
]
;@@ void ( GLenum source, GLuint id, GLsizei length, const GLchar * message );
glPushDebugGroup!: alias function! [
	source      [ GLenum! ]
	id          [ GLuint! ]
	length      [ GLsizei! ]
	message     [ GLstring! ]
]


;-------------------------------------------
;-- GL_KHR_no_error
;-------------------------------------------

#define  GL_KHR_no_error                              1
#define  GL_CONTEXT_FLAG_NO_ERROR_BIT_KHR             00000008h


;-------------------------------------------
;-- GL_KHR_parallel_shader_compile
;-------------------------------------------

#define  GL_KHR_parallel_shader_compile               1
#define  GL_MAX_SHADER_COMPILER_THREADS_KHR           91B0h
#define  GL_COMPLETION_STATUS_KHR                     91B1h
;@@ void ( GLuint count );
glMaxShaderCompilerThreadsKHR!: alias function! [
	count       [ GLuint! ]
]


;-------------------------------------------
;-- GL_KHR_robust_buffer_access_behavior
;-------------------------------------------

#define  GL_KHR_robust_buffer_access_behavior         1


;-------------------------------------------
;-- GL_KHR_robustness
;-------------------------------------------

#define  GL_KHR_robustness                            1
#define  GL_CONTEXT_LOST                              0507h
#define  GL_LOSE_CONTEXT_ON_RESET                     8252h
#define  GL_GUILTY_CONTEXT_RESET                      8253h
#define  GL_INNOCENT_CONTEXT_RESET                    8254h
#define  GL_UNKNOWN_CONTEXT_RESET                     8255h
#define  GL_RESET_NOTIFICATION_STRATEGY               8256h
#define  GL_NO_RESET_NOTIFICATION                     8261h
#define  GL_CONTEXT_ROBUST_ACCESS                     90F3h
;@@ void ( GLuint program, GLint location, GLsizei bufSize, GLfloat* params );
glGetnUniformfv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	bufSize     [ GLsizei! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei bufSize, GLint* params );
glGetnUniformiv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	bufSize     [ GLsizei! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei bufSize, GLuint* params );
glGetnUniformuiv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	bufSize     [ GLsizei! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, void *data );
glReadnPixels!: alias function! [
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
;-- GL_KHR_texture_compression_astc_hdr
;-------------------------------------------

#define  GL_KHR_texture_compression_astc_hdr          1
#define  GL_COMPRESSED_RGBA_ASTC_4x4_KHR              93B0h
#define  GL_COMPRESSED_RGBA_ASTC_5x4_KHR              93B1h
#define  GL_COMPRESSED_RGBA_ASTC_5x5_KHR              93B2h
#define  GL_COMPRESSED_RGBA_ASTC_6x5_KHR              93B3h
#define  GL_COMPRESSED_RGBA_ASTC_6x6_KHR              93B4h
#define  GL_COMPRESSED_RGBA_ASTC_8x5_KHR              93B5h
#define  GL_COMPRESSED_RGBA_ASTC_8x6_KHR              93B6h
#define  GL_COMPRESSED_RGBA_ASTC_8x8_KHR              93B7h
#define  GL_COMPRESSED_RGBA_ASTC_10x5_KHR             93B8h
#define  GL_COMPRESSED_RGBA_ASTC_10x6_KHR             93B9h
#define  GL_COMPRESSED_RGBA_ASTC_10x8_KHR             93BAh
#define  GL_COMPRESSED_RGBA_ASTC_10x10_KHR            93BBh
#define  GL_COMPRESSED_RGBA_ASTC_12x10_KHR            93BCh
#define  GL_COMPRESSED_RGBA_ASTC_12x12_KHR            93BDh
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR      93D0h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR      93D1h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR      93D2h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR      93D3h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR      93D4h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR      93D5h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR      93D6h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR      93D7h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR     93D8h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR     93D9h
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR     93DAh
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR    93DBh
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR    93DCh
#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR    93DDh


;-------------------------------------------
;-- GL_KHR_texture_compression_astc_ldr
;-------------------------------------------

#define  GL_KHR_texture_compression_astc_ldr          1
;#define  GL_COMPRESSED_RGBA_ASTC_4x4_KHR              93B0h
;#define  GL_COMPRESSED_RGBA_ASTC_5x4_KHR              93B1h
;#define  GL_COMPRESSED_RGBA_ASTC_5x5_KHR              93B2h
;#define  GL_COMPRESSED_RGBA_ASTC_6x5_KHR              93B3h
;#define  GL_COMPRESSED_RGBA_ASTC_6x6_KHR              93B4h
;#define  GL_COMPRESSED_RGBA_ASTC_8x5_KHR              93B5h
;#define  GL_COMPRESSED_RGBA_ASTC_8x6_KHR              93B6h
;#define  GL_COMPRESSED_RGBA_ASTC_8x8_KHR              93B7h
;#define  GL_COMPRESSED_RGBA_ASTC_10x5_KHR             93B8h
;#define  GL_COMPRESSED_RGBA_ASTC_10x6_KHR             93B9h
;#define  GL_COMPRESSED_RGBA_ASTC_10x8_KHR             93BAh
;#define  GL_COMPRESSED_RGBA_ASTC_10x10_KHR            93BBh
;#define  GL_COMPRESSED_RGBA_ASTC_12x10_KHR            93BCh
;#define  GL_COMPRESSED_RGBA_ASTC_12x12_KHR            93BDh
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR      93D0h
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR      93D1h
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR      93D2h
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR      93D3h
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR      93D4h
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR      93D5h
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR      93D6h
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR      93D7h
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR     93D8h
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR     93D9h
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR     93DAh
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR    93DBh
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR    93DCh
;#define  GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR    93DDh


;-------------------------------------------
;-- GL_KHR_texture_compression_astc_sliced_3d
;-------------------------------------------

#define  GL_KHR_texture_compression_astc_sliced_3d    1
