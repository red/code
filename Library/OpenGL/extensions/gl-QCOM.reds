Red/System [
	Title:   "Red/System OpenGL QCOM extension binding"
	Author:  "Oldes"
	File: 	 %gl-QCOM.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_QCOM_alpha_test
;-------------------------------------------

#define  GL_QCOM_alpha_test                           1
#define  GL_ALPHA_TEST_QCOM                           0BC0h
#define  GL_ALPHA_TEST_FUNC_QCOM                      0BC1h
#define  GL_ALPHA_TEST_REF_QCOM                       0BC2h
;@@ void ( GLenum func, GLclampf ref );
glAlphaFuncQCOM!: alias function! [
	func        [ GLenum! ]
	ref         [ GLclampf! ]
]


;-------------------------------------------
;-- GL_QCOM_binning_control
;-------------------------------------------

#define  GL_QCOM_binning_control                      1
;#define  GL_DONT_CARE                                 1100h
#define  GL_BINNING_CONTROL_HINT_QCOM                 8FB0h
#define  GL_CPU_OPTIMIZED_QCOM                        8FB1h
#define  GL_GPU_OPTIMIZED_QCOM                        8FB2h
#define  GL_RENDER_DIRECT_TO_FRAMEBUFFER_QCOM         8FB3h


;-------------------------------------------
;-- GL_QCOM_driver_control
;-------------------------------------------

#define  GL_QCOM_driver_control                       1
;@@ void ( GLuint driverControl );
glDisableDriverControlQCOM!: alias function! [
	driverControl [ GLuint! ]
]
;@@ void ( GLuint driverControl );
glEnableDriverControlQCOM!: alias function! [
	driverControl [ GLuint! ]
]
;@@ void ( GLuint driverControl, GLsizei bufSize, GLsizei* length, GLchar *driverControlString );
glGetDriverControlStringQCOM!: alias function! [
	driverControl [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	driverControlString [ GLstring! ]
]
;@@ void ( GLint* num, GLsizei size, GLuint *driverControls );
glGetDriverControlsQCOM!: alias function! [
	num         [ pointer! [GLint!] ]
	size        [ GLsizei! ]
	driverControls [ pointer! [GLuint!] ]
]


;-------------------------------------------
;-- GL_QCOM_extended_get
;-------------------------------------------

#define  GL_QCOM_extended_get                         1
#define  GL_TEXTURE_WIDTH_QCOM                        8BD2h
#define  GL_TEXTURE_HEIGHT_QCOM                       8BD3h
#define  GL_TEXTURE_DEPTH_QCOM                        8BD4h
#define  GL_TEXTURE_INTERNAL_FORMAT_QCOM              8BD5h
#define  GL_TEXTURE_FORMAT_QCOM                       8BD6h
#define  GL_TEXTURE_TYPE_QCOM                         8BD7h
#define  GL_TEXTURE_IMAGE_VALID_QCOM                  8BD8h
#define  GL_TEXTURE_NUM_LEVELS_QCOM                   8BD9h
#define  GL_TEXTURE_TARGET_QCOM                       8BDAh
#define  GL_TEXTURE_OBJECT_VALID_QCOM                 8BDBh
#define  GL_STATE_RESTORE                             8BDCh
;@@ void ( GLenum target, void** params );
glExtGetBufferPointervQCOM!: alias function! [
	target      [ GLenum! ]
	params      [ binary-ptr! ]
]
;@@ void ( GLuint* buffers, GLint maxBuffers, GLint* numBuffers );
glExtGetBuffersQCOM!: alias function! [
	buffers     [ pointer! [GLuint!] ]
	maxBuffers  [ GLint! ]
	numBuffers  [ pointer! [GLint!] ]
]
;@@ void ( GLuint* framebuffers, GLint maxFramebuffers, GLint* numFramebuffers );
glExtGetFramebuffersQCOM!: alias function! [
	framebuffers [ pointer! [GLuint!] ]
	maxFramebuffers [ GLint! ]
	numFramebuffers [ pointer! [GLint!] ]
]
;@@ void ( GLuint* renderbuffers, GLint maxRenderbuffers, GLint* numRenderbuffers );
glExtGetRenderbuffersQCOM!: alias function! [
	renderbuffers [ pointer! [GLuint!] ]
	maxRenderbuffers [ GLint! ]
	numRenderbuffers [ pointer! [GLint!] ]
]
;@@ void ( GLuint texture, GLenum face, GLint level, GLenum pname, GLint* params );
glExtGetTexLevelParameterivQCOM!: alias function! [
	texture     [ GLuint! ]
	face        [ GLenum! ]
	level       [ GLint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, void *texels );
glExtGetTexSubImageQCOM!: alias function! [
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
	texels      [ pointer! [byte!] ]
]
;@@ void ( GLuint* textures, GLint maxTextures, GLint* numTextures );
glExtGetTexturesQCOM!: alias function! [
	textures    [ pointer! [GLuint!] ]
	maxTextures [ GLint! ]
	numTextures [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint param );
glExtTexObjectStateOverrideiQCOM!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]


;-------------------------------------------
;-- GL_QCOM_extended_get2
;-------------------------------------------

#define  GL_QCOM_extended_get2                        1
;@@ void ( GLuint program, GLenum shadertype, GLchar* source, GLint* length );
glExtGetProgramBinarySourceQCOM!: alias function! [
	program     [ GLuint! ]
	shadertype  [ GLenum! ]
	source      [ GLstring! ]
	length      [ pointer! [GLint!] ]
]
;@@ void ( GLuint* programs, GLint maxPrograms, GLint* numPrograms );
glExtGetProgramsQCOM!: alias function! [
	programs    [ pointer! [GLuint!] ]
	maxPrograms [ GLint! ]
	numPrograms [ pointer! [GLint!] ]
]
;@@ void ( GLuint* shaders, GLint maxShaders, GLint* numShaders );
glExtGetShadersQCOM!: alias function! [
	shaders     [ pointer! [GLuint!] ]
	maxShaders  [ GLint! ]
	numShaders  [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint program );
glExtIsProgramBinaryQCOM!: alias function! [
	program     [ GLuint! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_QCOM_framebuffer_foveated
;-------------------------------------------

#define  GL_QCOM_framebuffer_foveated                 1
#define  GL_FOVEATION_ENABLE_BIT_QCOM                 01h
#define  GL_FOVEATION_SCALED_BIN_METHOD_BIT_QCOM      02h
;@@ void ( GLuint fbo, GLuint numLayers, GLuint focalPointsPerLayer, GLuint requestedFeatures, GLuint* providedFeatures );
glFramebufferFoveationConfigQCOM!: alias function! [
	fbo         [ GLuint! ]
	numLayers   [ GLuint! ]
	focalPointsPerLayer [ GLuint! ]
	requestedFeatures [ GLuint! ]
	providedFeatures [ pointer! [GLuint!] ]
]
;@@ void ( GLuint fbo, GLuint layer, GLuint focalPoint, GLfloat focalX, GLfloat focalY, GLfloat gainX, GLfloat gainY, GLfloat foveaArea );
glFramebufferFoveationParametersQCOM!: alias function! [
	fbo         [ GLuint! ]
	layer       [ GLuint! ]
	focalPoint  [ GLuint! ]
	focalX      [ GLfloat! ]
	focalY      [ GLfloat! ]
	gainX       [ GLfloat! ]
	gainY       [ GLfloat! ]
	foveaArea   [ GLfloat! ]
]


;-------------------------------------------
;-- GL_QCOM_perfmon_global_mode
;-------------------------------------------

#define  GL_QCOM_perfmon_global_mode                  1
#define  GL_PERFMON_GLOBAL_MODE_QCOM                  8FA0h


;-------------------------------------------
;-- GL_QCOM_shader_framebuffer_fetch_noncoherent
;-------------------------------------------

#define  GL_QCOM_shader_framebuffer_fetch_noncoherent  1
#define  GL_FRAMEBUFFER_FETCH_NONCOHERENT_QCOM        96A2h
;@@ void ( void );
glFramebufferFetchBarrierQCOM!: alias function! [
]


;-------------------------------------------
;-- GL_QCOM_tiled_rendering
;-------------------------------------------

#define  GL_QCOM_tiled_rendering                      1
#define  GL_COLOR_BUFFER_BIT0_QCOM                    00000001h
#define  GL_COLOR_BUFFER_BIT1_QCOM                    00000002h
#define  GL_COLOR_BUFFER_BIT2_QCOM                    00000004h
#define  GL_COLOR_BUFFER_BIT3_QCOM                    00000008h
#define  GL_COLOR_BUFFER_BIT4_QCOM                    00000010h
#define  GL_COLOR_BUFFER_BIT5_QCOM                    00000020h
#define  GL_COLOR_BUFFER_BIT6_QCOM                    00000040h
#define  GL_COLOR_BUFFER_BIT7_QCOM                    00000080h
#define  GL_DEPTH_BUFFER_BIT0_QCOM                    00000100h
#define  GL_DEPTH_BUFFER_BIT1_QCOM                    00000200h
#define  GL_DEPTH_BUFFER_BIT2_QCOM                    00000400h
#define  GL_DEPTH_BUFFER_BIT3_QCOM                    00000800h
#define  GL_DEPTH_BUFFER_BIT4_QCOM                    00001000h
#define  GL_DEPTH_BUFFER_BIT5_QCOM                    00002000h
#define  GL_DEPTH_BUFFER_BIT6_QCOM                    00004000h
#define  GL_DEPTH_BUFFER_BIT7_QCOM                    00008000h
#define  GL_STENCIL_BUFFER_BIT0_QCOM                  00010000h
#define  GL_STENCIL_BUFFER_BIT1_QCOM                  00020000h
#define  GL_STENCIL_BUFFER_BIT2_QCOM                  00040000h
#define  GL_STENCIL_BUFFER_BIT3_QCOM                  00080000h
#define  GL_STENCIL_BUFFER_BIT4_QCOM                  00100000h
#define  GL_STENCIL_BUFFER_BIT5_QCOM                  00200000h
#define  GL_STENCIL_BUFFER_BIT6_QCOM                  00400000h
#define  GL_STENCIL_BUFFER_BIT7_QCOM                  00800000h
#define  GL_MULTISAMPLE_BUFFER_BIT0_QCOM              01000000h
#define  GL_MULTISAMPLE_BUFFER_BIT1_QCOM              02000000h
#define  GL_MULTISAMPLE_BUFFER_BIT2_QCOM              04000000h
#define  GL_MULTISAMPLE_BUFFER_BIT3_QCOM              08000000h
#define  GL_MULTISAMPLE_BUFFER_BIT4_QCOM              10000000h
#define  GL_MULTISAMPLE_BUFFER_BIT5_QCOM              20000000h
#define  GL_MULTISAMPLE_BUFFER_BIT6_QCOM              40000000h
#define  GL_MULTISAMPLE_BUFFER_BIT7_QCOM              80000000h
;@@ void ( GLbitfield preserveMask );
glEndTilingQCOM!: alias function! [
	preserveMask [ GLbitfield! ]
]
;@@ void ( GLuint x, GLuint y, GLuint width, GLuint height, GLbitfield preserveMask );
glStartTilingQCOM!: alias function! [
	x           [ GLuint! ]
	y           [ GLuint! ]
	width       [ GLuint! ]
	height      [ GLuint! ]
	preserveMask [ GLbitfield! ]
]


;-------------------------------------------
;-- GL_QCOM_writeonly_rendering
;-------------------------------------------

#define  GL_QCOM_writeonly_rendering                  1
#define  GL_WRITEONLY_RENDERING_QCOM                  8823h
