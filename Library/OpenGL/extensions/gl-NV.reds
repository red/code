Red/System [
	Title:   "Red/System OpenGL NV extension binding"
	Author:  "Oldes"
	File: 	 %gl-NV.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_NV_3dvision_settings
;-------------------------------------------

#define  GL_NV_3dvision_settings                      1
#define  GL_3DVISION_STEREO_NV                        90F4h
#define  GL_STEREO_SEPARATION_NV                      90F5h
#define  GL_STEREO_CONVERGENCE_NV                     90F6h
#define  GL_STEREO_CUTOFF_NV                          90F7h
#define  GL_STEREO_PROJECTION_NV                      90F8h
#define  GL_STEREO_PROJECTION_PERSPECTIVE_NV          90F9h
#define  GL_STEREO_PROJECTION_ORTHO_NV                90FAh
;@@ void ( GLenum pname, GLfloat param );
glStereoParameterfNV!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum pname, GLint param );
glStereoParameteriNV!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]


;-------------------------------------------
;-- GL_NV_EGL_stream_consumer_external
;-------------------------------------------

#define  GL_NV_EGL_stream_consumer_external           1
#define  GL_TEXTURE_EXTERNAL_OES                      8D65h
#define  GL_SAMPLER_EXTERNAL_OES                      8D66h
#define  GL_TEXTURE_BINDING_EXTERNAL_OES              8D67h
#define  GL_REQUIRED_TEXTURE_IMAGE_UNITS_OES          8D68h


;-------------------------------------------
;-- GL_NV_alpha_to_coverage_dither_control
;-------------------------------------------

#define  GL_NV_alpha_to_coverage_dither_control       1
#define  GL_ALPHA_TO_COVERAGE_DITHER_MODE_NV          92BFh
#define  GL_ALPHA_TO_COVERAGE_DITHER_DEFAULT_NV       934Dh
#define  GL_ALPHA_TO_COVERAGE_DITHER_ENABLE_NV        934Eh
#define  GL_ALPHA_TO_COVERAGE_DITHER_DISABLE_NV       934Fh


;-------------------------------------------
;-- GL_NV_bgr
;-------------------------------------------

#define  GL_NV_bgr                                    1
#define  GL_BGR_NV                                    80E0h


;-------------------------------------------
;-- GL_NV_bindless_multi_draw_indirect
;-------------------------------------------

#define  GL_NV_bindless_multi_draw_indirect           1
;@@ void ( GLenum mode, const void *indirect, GLsizei drawCount, GLsizei stride, GLint vertexBufferCount );
glMultiDrawArraysIndirectBindlessNV!: alias function! [
	mode        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	drawCount   [ GLsizei! ]
	stride      [ GLsizei! ]
	vertexBufferCount [ GLint! ]
]
;@@ void ( GLenum mode, GLenum type, const void *indirect, GLsizei drawCount, GLsizei stride, GLint vertexBufferCount );
glMultiDrawElementsIndirectBindlessNV!: alias function! [
	mode        [ GLenum! ]
	type        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	drawCount   [ GLsizei! ]
	stride      [ GLsizei! ]
	vertexBufferCount [ GLint! ]
]


;-------------------------------------------
;-- GL_NV_bindless_multi_draw_indirect_count
;-------------------------------------------

#define  GL_NV_bindless_multi_draw_indirect_count     1
;@@ void ( GLenum mode, const void *indirect, GLintptr drawCount, GLsizei maxDrawCount, GLsizei stride, GLint vertexBufferCount );
glMultiDrawArraysIndirectBindlessCountNV!: alias function! [
	mode        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	drawCount   [ GLintptr! ]
	maxDrawCount [ GLsizei! ]
	stride      [ GLsizei! ]
	vertexBufferCount [ GLint! ]
]
;@@ void ( GLenum mode, GLenum type, const void *indirect, GLintptr drawCount, GLsizei maxDrawCount, GLsizei stride, GLint vertexBufferCount );
glMultiDrawElementsIndirectBindlessCountNV!: alias function! [
	mode        [ GLenum! ]
	type        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	drawCount   [ GLintptr! ]
	maxDrawCount [ GLsizei! ]
	stride      [ GLsizei! ]
	vertexBufferCount [ GLint! ]
]


;-------------------------------------------
;-- GL_NV_bindless_texture
;-------------------------------------------

#define  GL_NV_bindless_texture                       1
;@@ GLuint64 ( GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum format );
glGetImageHandleNV!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	layered     [ GLboolean! ]
	layer       [ GLint! ]
	format      [ GLenum! ]
	return: [ GLuint64! ]

]
;@@ GLuint64 ( GLuint texture );
glGetTextureHandleNV!: alias function! [
	texture     [ GLuint! ]
	return: [ GLuint64! ]

]
;@@ GLuint64 ( GLuint texture, GLuint sampler );
glGetTextureSamplerHandleNV!: alias function! [
	texture     [ GLuint! ]
	sampler     [ GLuint! ]
	return: [ GLuint64! ]

]
;@@ GLboolean ( GLuint64 handle );
glIsImageHandleResidentNV!: alias function! [
	handle      [ GLuint64! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint64 handle );
glIsTextureHandleResidentNV!: alias function! [
	handle      [ GLuint64! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint64 handle );
glMakeImageHandleNonResidentNV!: alias function! [
	handle      [ GLuint64! ]
]
;@@ void ( GLuint64 handle, GLenum access );
glMakeImageHandleResidentNV!: alias function! [
	handle      [ GLuint64! ]
	access      [ GLenum! ]
]
;@@ void ( GLuint64 handle );
glMakeTextureHandleNonResidentNV!: alias function! [
	handle      [ GLuint64! ]
]
;@@ void ( GLuint64 handle );
glMakeTextureHandleResidentNV!: alias function! [
	handle      [ GLuint64! ]
]
;@@ void ( GLuint program, GLint location, GLuint64 value );
glProgramUniformHandleui64NV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	value       [ GLuint64! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64* values );
glProgramUniformHandleui64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	values      [ GLuint64-ptr! ]
]
;@@ void ( GLint location, GLuint64 value );
glUniformHandleui64NV!: alias function! [
	location    [ GLint! ]
	value       [ GLuint64! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64* value );
glUniformHandleui64vNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64-ptr! ]
]


;-------------------------------------------
;-- GL_NV_blend_equation_advanced
;-------------------------------------------

#define  GL_NV_blend_equation_advanced                1
#define  GL_XOR_NV                                    1506h
#define  GL_RED_NV                                    1903h
#define  GL_GREEN_NV                                  1904h
#define  GL_BLUE_NV                                   1905h
#define  GL_BLEND_PREMULTIPLIED_SRC_NV                9280h
#define  GL_BLEND_OVERLAP_NV                          9281h
#define  GL_UNCORRELATED_NV                           9282h
#define  GL_DISJOINT_NV                               9283h
#define  GL_CONJOINT_NV                               9284h
#define  GL_BLEND_ADVANCED_COHERENT_NV                9285h
#define  GL_SRC_NV                                    9286h
#define  GL_DST_NV                                    9287h
#define  GL_SRC_OVER_NV                               9288h
#define  GL_DST_OVER_NV                               9289h
#define  GL_SRC_IN_NV                                 928Ah
#define  GL_DST_IN_NV                                 928Bh
#define  GL_SRC_OUT_NV                                928Ch
#define  GL_DST_OUT_NV                                928Dh
#define  GL_SRC_ATOP_NV                               928Eh
#define  GL_DST_ATOP_NV                               928Fh
#define  GL_PLUS_NV                                   9291h
#define  GL_PLUS_DARKER_NV                            9292h
#define  GL_MULTIPLY_NV                               9294h
#define  GL_SCREEN_NV                                 9295h
#define  GL_OVERLAY_NV                                9296h
#define  GL_DARKEN_NV                                 9297h
#define  GL_LIGHTEN_NV                                9298h
#define  GL_COLORDODGE_NV                             9299h
#define  GL_COLORBURN_NV                              929Ah
#define  GL_HARDLIGHT_NV                              929Bh
#define  GL_SOFTLIGHT_NV                              929Ch
#define  GL_DIFFERENCE_NV                             929Eh
#define  GL_MINUS_NV                                  929Fh
#define  GL_EXCLUSION_NV                              92A0h
#define  GL_CONTRAST_NV                               92A1h
#define  GL_INVERT_RGB_NV                             92A3h
#define  GL_LINEARDODGE_NV                            92A4h
#define  GL_LINEARBURN_NV                             92A5h
#define  GL_VIVIDLIGHT_NV                             92A6h
#define  GL_LINEARLIGHT_NV                            92A7h
#define  GL_PINLIGHT_NV                               92A8h
#define  GL_HARDMIX_NV                                92A9h
#define  GL_HSL_HUE_NV                                92ADh
#define  GL_HSL_SATURATION_NV                         92AEh
#define  GL_HSL_COLOR_NV                              92AFh
#define  GL_HSL_LUMINOSITY_NV                         92B0h
#define  GL_PLUS_CLAMPED_NV                           92B1h
#define  GL_PLUS_CLAMPED_ALPHA_NV                     92B2h
#define  GL_MINUS_CLAMPED_NV                          92B3h
#define  GL_INVERT_OVG_NV                             92B4h
;@@ void ( void );
glBlendBarrierNV!: alias function! [
]
;@@ void ( GLenum pname, GLint value );
glBlendParameteriNV!: alias function! [
	pname       [ GLenum! ]
	value       [ GLint! ]
]


;-------------------------------------------
;-- GL_NV_blend_equation_advanced_coherent
;-------------------------------------------

#define  GL_NV_blend_equation_advanced_coherent       1


;-------------------------------------------
;-- GL_NV_blend_minmax_factor
;-------------------------------------------

#define  GL_NV_blend_minmax_factor                    1
;#define  GL_FACTOR_MIN_AMD                            901Ch
;#define  GL_FACTOR_MAX_AMD                            901Dh


;-------------------------------------------
;-- GL_NV_blend_square
;-------------------------------------------

#define  GL_NV_blend_square                           1


;-------------------------------------------
;-- GL_NV_clip_space_w_scaling
;-------------------------------------------

#define  GL_NV_clip_space_w_scaling                   1
#define  GL_VIEWPORT_POSITION_W_SCALE_NV              937Ch
#define  GL_VIEWPORT_POSITION_W_SCALE_X_COEFF_NV      937Dh
#define  GL_VIEWPORT_POSITION_W_SCALE_Y_COEFF_NV      937Eh
;@@ void ( GLuint index, GLfloat xcoeff, GLfloat ycoeff );
glViewportPositionWScaleNV!: alias function! [
	index       [ GLuint! ]
	xcoeff      [ GLfloat! ]
	ycoeff      [ GLfloat! ]
]


;-------------------------------------------
;-- GL_NV_command_list
;-------------------------------------------

#define  GL_NV_command_list                           1
#define  GL_TERMINATE_SEQUENCE_COMMAND_NV             0000h
#define  GL_NOP_COMMAND_NV                            0001h
#define  GL_DRAW_ELEMENTS_COMMAND_NV                  0002h
#define  GL_DRAW_ARRAYS_COMMAND_NV                    0003h
#define  GL_DRAW_ELEMENTS_STRIP_COMMAND_NV            0004h
#define  GL_DRAW_ARRAYS_STRIP_COMMAND_NV              0005h
#define  GL_DRAW_ELEMENTS_INSTANCED_COMMAND_NV        0006h
#define  GL_DRAW_ARRAYS_INSTANCED_COMMAND_NV          0007h
#define  GL_ELEMENT_ADDRESS_COMMAND_NV                0008h
#define  GL_ATTRIBUTE_ADDRESS_COMMAND_NV              0009h
#define  GL_UNIFORM_ADDRESS_COMMAND_NV                000Ah
#define  GL_BLEND_COLOR_COMMAND_NV                    000Bh
#define  GL_STENCIL_REF_COMMAND_NV                    000Ch
#define  GL_LINE_WIDTH_COMMAND_NV                     000Dh
#define  GL_POLYGON_OFFSET_COMMAND_NV                 000Eh
#define  GL_ALPHA_REF_COMMAND_NV                      000Fh
#define  GL_VIEWPORT_COMMAND_NV                       0010h
#define  GL_SCISSOR_COMMAND_NV                        0011h
#define  GL_FRONT_FACE_COMMAND_NV                     0012h
;@@ void ( GLuint list );
glCallCommandListNV!: alias function! [
	list        [ GLuint! ]
]
;@@ void ( GLuint list, GLuint segments );
glCommandListSegmentsNV!: alias function! [
	list        [ GLuint! ]
	segments    [ GLuint! ]
]
;@@ void ( GLuint list );
glCompileCommandListNV!: alias function! [
	list        [ GLuint! ]
]
;@@ void ( GLsizei n, GLuint* lists );
glCreateCommandListsNV!: alias function! [
	n           [ GLsizei! ]
	lists       [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* states );
glCreateStatesNV!: alias function! [
	n           [ GLsizei! ]
	states      [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, const GLuint* lists );
glDeleteCommandListsNV!: alias function! [
	n           [ GLsizei! ]
	lists       [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, const GLuint* states );
glDeleteStatesNV!: alias function! [
	n           [ GLsizei! ]
	states      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum primitiveMode, const GLuint64* indirects, const GLsizei* sizes, GLuint count );
glDrawCommandsAddressNV!: alias function! [
	primitiveMode [ GLenum! ]
	indirects   [ GLuint64-ptr! ]
	sizes       [ pointer! [GLsizei!] ]
	count       [ GLuint! ]
]
;@@ void ( GLenum primitiveMode, GLuint buffer, const GLintptr* indirects, const GLsizei* sizes, GLuint count );
glDrawCommandsNV!: alias function! [
	primitiveMode [ GLenum! ]
	buffer      [ GLuint! ]
	indirects   [ pointer! [GLintptr!] ]
	sizes       [ pointer! [GLsizei!] ]
	count       [ GLuint! ]
]
;@@ void ( const GLuint64* indirects, const GLsizei* sizes, const GLuint* states, const GLuint* fbos, GLuint count );
glDrawCommandsStatesAddressNV!: alias function! [
	indirects   [ GLuint64-ptr! ]
	sizes       [ pointer! [GLsizei!] ]
	states      [ pointer! [GLuint!] ]
	fbos        [ pointer! [GLuint!] ]
	count       [ GLuint! ]
]
;@@ void ( GLuint buffer, const GLintptr* indirects, const GLsizei* sizes, const GLuint* states, const GLuint* fbos, GLuint count );
glDrawCommandsStatesNV!: alias function! [
	buffer      [ GLuint! ]
	indirects   [ pointer! [GLintptr!] ]
	sizes       [ pointer! [GLsizei!] ]
	states      [ pointer! [GLuint!] ]
	fbos        [ pointer! [GLuint!] ]
	count       [ GLuint! ]
]
;@@ GLuint ( GLenum tokenID, GLuint size );
glGetCommandHeaderNV!: alias function! [
	tokenID     [ GLenum! ]
	size        [ GLuint! ]
	return: [ GLuint! ]

]
;@@ GLushort ( GLenum shadertype );
glGetStageIndexNV!: alias function! [
	shadertype  [ GLenum! ]
	return: [ GLushort! ]

]
;@@ GLboolean ( GLuint list );
glIsCommandListNV!: alias function! [
	list        [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint state );
glIsStateNV!: alias function! [
	state       [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint list, GLuint segment, const void** indirects, const GLsizei* sizes, const GLuint* states, const GLuint* fbos, GLuint count );
glListDrawCommandsStatesClientNV!: alias function! [
	list        [ GLuint! ]
	segment     [ GLuint! ]
	indirects   [ binary-ptr! ]
	sizes       [ pointer! [GLsizei!] ]
	states      [ pointer! [GLuint!] ]
	fbos        [ pointer! [GLuint!] ]
	count       [ GLuint! ]
]
;@@ void ( GLuint state, GLenum mode );
glStateCaptureNV!: alias function! [
	state       [ GLuint! ]
	mode        [ GLenum! ]
]


;-------------------------------------------
;-- GL_NV_compute_program5
;-------------------------------------------

#define  GL_NV_compute_program5                       1
#define  GL_COMPUTE_PROGRAM_NV                        90FBh
#define  GL_COMPUTE_PROGRAM_PARAMETER_BUFFER_NV       90FCh


;-------------------------------------------
;-- GL_NV_conditional_render
;-------------------------------------------

#define  GL_NV_conditional_render                     1
#define  GL_QUERY_WAIT_NV                             8E13h
#define  GL_QUERY_NO_WAIT_NV                          8E14h
#define  GL_QUERY_BY_REGION_WAIT_NV                   8E15h
#define  GL_QUERY_BY_REGION_NO_WAIT_NV                8E16h
;@@ void ( GLuint id, GLenum mode );
glBeginConditionalRenderNV!: alias function! [
	id          [ GLuint! ]
	mode        [ GLenum! ]
]
;@@ void ( void );
glEndConditionalRenderNV!: alias function! [
]


;-------------------------------------------
;-- GL_NV_conservative_raster
;-------------------------------------------

#define  GL_NV_conservative_raster                    1
#define  GL_CONSERVATIVE_RASTERIZATION_NV             9346h
#define  GL_SUBPIXEL_PRECISION_BIAS_X_BITS_NV         9347h
#define  GL_SUBPIXEL_PRECISION_BIAS_Y_BITS_NV         9348h
#define  GL_MAX_SUBPIXEL_PRECISION_BIAS_BITS_NV       9349h
;@@ void ( GLuint xbits, GLuint ybits );
glSubpixelPrecisionBiasNV!: alias function! [
	xbits       [ GLuint! ]
	ybits       [ GLuint! ]
]


;-------------------------------------------
;-- GL_NV_conservative_raster_dilate
;-------------------------------------------

#define  GL_NV_conservative_raster_dilate             1
#define  GL_CONSERVATIVE_RASTER_DILATE_NV             9379h
#define  GL_CONSERVATIVE_RASTER_DILATE_RANGE_NV       937Ah
#define  GL_CONSERVATIVE_RASTER_DILATE_GRANULARITY_NV  937Bh
;@@ void ( GLenum pname, GLfloat value );
glConservativeRasterParameterfNV!: alias function! [
	pname       [ GLenum! ]
	value       [ GLfloat! ]
]


;-------------------------------------------
;-- GL_NV_conservative_raster_pre_snap_triangles
;-------------------------------------------

#define  GL_NV_conservative_raster_pre_snap_triangles  1
#define  GL_CONSERVATIVE_RASTER_MODE_NV               954Dh
#define  GL_CONSERVATIVE_RASTER_MODE_POST_SNAP_NV     954Eh
#define  GL_CONSERVATIVE_RASTER_MODE_PRE_SNAP_TRIANGLES_NV  954Fh
;@@ void ( GLenum pname, GLint param );
glConservativeRasterParameteriNV!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]


;-------------------------------------------
;-- GL_NV_copy_buffer
;-------------------------------------------

#define  GL_NV_copy_buffer                            1
#define  GL_COPY_READ_BUFFER_NV                       8F36h
#define  GL_COPY_WRITE_BUFFER_NV                      8F37h
;@@ void ( GLenum readtarget, GLenum writetarget, GLintptr readoffset, GLintptr writeoffset, GLsizeiptr size );
glCopyBufferSubDataNV!: alias function! [
	readtarget  [ GLenum! ]
	writetarget [ GLenum! ]
	readoffset  [ GLintptr! ]
	writeoffset [ GLintptr! ]
	size        [ GLsizeiptr! ]
]


;-------------------------------------------
;-- GL_NV_copy_depth_to_color
;-------------------------------------------

#define  GL_NV_copy_depth_to_color                    1
#define  GL_DEPTH_STENCIL_TO_RGBA_NV                  886Eh
#define  GL_DEPTH_STENCIL_TO_BGRA_NV                  886Fh


;-------------------------------------------
;-- GL_NV_copy_image
;-------------------------------------------

#define  GL_NV_copy_image                             1
;@@ void ( GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srcY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei width, GLsizei height, GLsizei depth );
glCopyImageSubDataNV!: alias function! [
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
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
]


;-------------------------------------------
;-- GL_NV_deep_texture3D
;-------------------------------------------

#define  GL_NV_deep_texture3D                         1
#define  GL_MAX_DEEP_3D_TEXTURE_WIDTH_HEIGHT_NV       90D0h
#define  GL_MAX_DEEP_3D_TEXTURE_DEPTH_NV              90D1h


;-------------------------------------------
;-- GL_NV_depth_buffer_float
;-------------------------------------------

#define  GL_NV_depth_buffer_float                     1
#define  GL_DEPTH_COMPONENT32F_NV                     8DABh
#define  GL_DEPTH32F_STENCIL8_NV                      8DACh
#define  GL_FLOAT_32_UNSIGNED_INT_24_8_REV_NV         8DADh
#define  GL_DEPTH_BUFFER_FLOAT_MODE_NV                8DAFh
;@@ void ( GLdouble depth );
glClearDepthdNV!: alias function! [
	depth       [ GLdouble! ]
]
;@@ void ( GLdouble zmin, GLdouble zmax );
glDepthBoundsdNV!: alias function! [
	zmin        [ GLdouble! ]
	zmax        [ GLdouble! ]
]
;@@ void ( GLdouble zNear, GLdouble zFar );
glDepthRangedNV!: alias function! [
	zNear       [ GLdouble! ]
	zFar        [ GLdouble! ]
]


;-------------------------------------------
;-- GL_NV_depth_clamp
;-------------------------------------------

#define  GL_NV_depth_clamp                            1
#define  GL_DEPTH_CLAMP_NV                            864Fh


;-------------------------------------------
;-- GL_NV_depth_range_unclamped
;-------------------------------------------

#define  GL_NV_depth_range_unclamped                  1
#define  GL_SAMPLE_COUNT_BITS_NV                      8864h
#define  GL_CURRENT_SAMPLE_COUNT_QUERY_NV             8865h
#define  GL_QUERY_RESULT_NV                           8866h
#define  GL_QUERY_RESULT_AVAILABLE_NV                 8867h
#define  GL_SAMPLE_COUNT_NV                           8914h


;-------------------------------------------
;-- GL_NV_draw_buffers
;-------------------------------------------

#define  GL_NV_draw_buffers                           1
#define  GL_MAX_DRAW_BUFFERS_NV                       8824h
#define  GL_DRAW_BUFFER0_NV                           8825h
#define  GL_DRAW_BUFFER1_NV                           8826h
#define  GL_DRAW_BUFFER2_NV                           8827h
#define  GL_DRAW_BUFFER3_NV                           8828h
#define  GL_DRAW_BUFFER4_NV                           8829h
#define  GL_DRAW_BUFFER5_NV                           882Ah
#define  GL_DRAW_BUFFER6_NV                           882Bh
#define  GL_DRAW_BUFFER7_NV                           882Ch
#define  GL_DRAW_BUFFER8_NV                           882Dh
#define  GL_DRAW_BUFFER9_NV                           882Eh
#define  GL_DRAW_BUFFER10_NV                          882Fh
#define  GL_DRAW_BUFFER11_NV                          8830h
#define  GL_DRAW_BUFFER12_NV                          8831h
#define  GL_DRAW_BUFFER13_NV                          8832h
#define  GL_DRAW_BUFFER14_NV                          8833h
#define  GL_DRAW_BUFFER15_NV                          8834h
#define  GL_COLOR_ATTACHMENT0_NV                      8CE0h
#define  GL_COLOR_ATTACHMENT1_NV                      8CE1h
#define  GL_COLOR_ATTACHMENT2_NV                      8CE2h
#define  GL_COLOR_ATTACHMENT3_NV                      8CE3h
#define  GL_COLOR_ATTACHMENT4_NV                      8CE4h
#define  GL_COLOR_ATTACHMENT5_NV                      8CE5h
#define  GL_COLOR_ATTACHMENT6_NV                      8CE6h
#define  GL_COLOR_ATTACHMENT7_NV                      8CE7h
#define  GL_COLOR_ATTACHMENT8_NV                      8CE8h
#define  GL_COLOR_ATTACHMENT9_NV                      8CE9h
#define  GL_COLOR_ATTACHMENT10_NV                     8CEAh
#define  GL_COLOR_ATTACHMENT11_NV                     8CEBh
#define  GL_COLOR_ATTACHMENT12_NV                     8CECh
#define  GL_COLOR_ATTACHMENT13_NV                     8CEDh
#define  GL_COLOR_ATTACHMENT14_NV                     8CEEh
#define  GL_COLOR_ATTACHMENT15_NV                     8CEFh
;@@ void ( GLsizei n, const GLenum* bufs );
glDrawBuffersNV!: alias function! [
	n           [ GLsizei! ]
	bufs        [ pointer! [GLenum!] ]
]


;-------------------------------------------
;-- GL_NV_draw_instanced
;-------------------------------------------

#define  GL_NV_draw_instanced                         1
;@@ void ( GLenum mode, GLint first, GLsizei count, GLsizei primcount );
glDrawArraysInstancedNV!: alias function! [
	mode        [ GLenum! ]
	first       [ GLint! ]
	count       [ GLsizei! ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount );
glDrawElementsInstancedNV!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
]


;-------------------------------------------
;-- GL_NV_draw_texture
;-------------------------------------------

#define  GL_NV_draw_texture                           1
;@@ void ( GLuint texture, GLuint sampler, GLfloat x0, GLfloat y0, GLfloat x1, GLfloat y1, GLfloat z, GLfloat s0, GLfloat t0, GLfloat s1, GLfloat t1 );
glDrawTextureNV!: alias function! [
	texture     [ GLuint! ]
	sampler     [ GLuint! ]
	x0          [ GLfloat! ]
	y0          [ GLfloat! ]
	x1          [ GLfloat! ]
	y1          [ GLfloat! ]
	z           [ GLfloat! ]
	s0          [ GLfloat! ]
	t0          [ GLfloat! ]
	s1          [ GLfloat! ]
	t1          [ GLfloat! ]
]


;-------------------------------------------
;-- GL_NV_draw_vulkan_image
;-------------------------------------------

#define  GL_NV_draw_vulkan_image                      1
;@@ void ( GLuint64 vkImage, GLuint sampler, GLfloat x0, GLfloat y0, GLfloat x1, GLfloat y1, GLfloat z, GLfloat s0, GLfloat t0, GLfloat s1, GLfloat t1 );
glDrawVkImageNV!: alias function! [
	vkImage     [ GLuint64! ]
	sampler     [ GLuint! ]
	x0          [ GLfloat! ]
	y0          [ GLfloat! ]
	x1          [ GLfloat! ]
	y1          [ GLfloat! ]
	z           [ GLfloat! ]
	s0          [ GLfloat! ]
	t0          [ GLfloat! ]
	s1          [ GLfloat! ]
	t1          [ GLfloat! ]
]
;@@ GLVULKANPROCNV ( const GLchar* name );
glGetVkProcAddrNV!: alias function! [
	name        [ GLstring! ]
	return: [ GLVULKANPROCNV! ]

]
;@@ void ( GLuint64 vkFence );
glSignalVkFenceNV!: alias function! [
	vkFence     [ GLuint64! ]
]
;@@ void ( GLuint64 vkSemaphore );
glSignalVkSemaphoreNV!: alias function! [
	vkSemaphore [ GLuint64! ]
]
;@@ void ( GLuint64 vkSemaphore );
glWaitVkSemaphoreNV!: alias function! [
	vkSemaphore [ GLuint64! ]
]


;-------------------------------------------
;-- GL_NV_evaluators
;-------------------------------------------

#define  GL_NV_evaluators                             1
#define  GL_EVAL_2D_NV                                86C0h
#define  GL_EVAL_TRIANGULAR_2D_NV                     86C1h
#define  GL_MAP_TESSELLATION_NV                       86C2h
#define  GL_MAP_ATTRIB_U_ORDER_NV                     86C3h
#define  GL_MAP_ATTRIB_V_ORDER_NV                     86C4h
#define  GL_EVAL_FRACTIONAL_TESSELLATION_NV           86C5h
#define  GL_EVAL_VERTEX_ATTRIB0_NV                    86C6h
#define  GL_EVAL_VERTEX_ATTRIB1_NV                    86C7h
#define  GL_EVAL_VERTEX_ATTRIB2_NV                    86C8h
#define  GL_EVAL_VERTEX_ATTRIB3_NV                    86C9h
#define  GL_EVAL_VERTEX_ATTRIB4_NV                    86CAh
#define  GL_EVAL_VERTEX_ATTRIB5_NV                    86CBh
#define  GL_EVAL_VERTEX_ATTRIB6_NV                    86CCh
#define  GL_EVAL_VERTEX_ATTRIB7_NV                    86CDh
#define  GL_EVAL_VERTEX_ATTRIB8_NV                    86CEh
#define  GL_EVAL_VERTEX_ATTRIB9_NV                    86CFh
#define  GL_EVAL_VERTEX_ATTRIB10_NV                   86D0h
#define  GL_EVAL_VERTEX_ATTRIB11_NV                   86D1h
#define  GL_EVAL_VERTEX_ATTRIB12_NV                   86D2h
#define  GL_EVAL_VERTEX_ATTRIB13_NV                   86D3h
#define  GL_EVAL_VERTEX_ATTRIB14_NV                   86D4h
#define  GL_EVAL_VERTEX_ATTRIB15_NV                   86D5h
#define  GL_MAX_MAP_TESSELLATION_NV                   86D6h
#define  GL_MAX_RATIONAL_EVAL_ORDER_NV                86D7h
;@@ void ( GLenum target, GLenum mode );
glEvalMapsNV!: alias function! [
	target      [ GLenum! ]
	mode        [ GLenum! ]
]
;@@ void ( GLenum target, GLuint index, GLenum pname, GLfloat* params );
glGetMapAttribParameterfvNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLuint index, GLenum pname, GLint* params );
glGetMapAttribParameterivNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLboolean packed, void *points );
glGetMapControlPointsNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	type        [ GLenum! ]
	ustride     [ GLsizei! ]
	vstride     [ GLsizei! ]
	packed      [ GLboolean! ]
	points      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat* params );
glGetMapParameterfvNV!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetMapParameterivNV!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLint uorder, GLint vorder, GLboolean packed, const void *points );
glMapControlPointsNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	type        [ GLenum! ]
	ustride     [ GLsizei! ]
	vstride     [ GLsizei! ]
	uorder      [ GLint! ]
	vorder      [ GLint! ]
	packed      [ GLboolean! ]
	points      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLfloat* params );
glMapParameterfvNV!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLint* params );
glMapParameterivNV!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_NV_explicit_attrib_location
;-------------------------------------------

#define  GL_NV_explicit_attrib_location               1


;-------------------------------------------
;-- GL_NV_explicit_multisample
;-------------------------------------------

#define  GL_NV_explicit_multisample                   1
#define  GL_SAMPLE_POSITION_NV                        8E50h
#define  GL_SAMPLE_MASK_NV                            8E51h
#define  GL_SAMPLE_MASK_VALUE_NV                      8E52h
#define  GL_TEXTURE_BINDING_RENDERBUFFER_NV           8E53h
#define  GL_TEXTURE_RENDERBUFFER_DATA_STORE_BINDING_NV  8E54h
#define  GL_TEXTURE_RENDERBUFFER_NV                   8E55h
#define  GL_SAMPLER_RENDERBUFFER_NV                   8E56h
#define  GL_INT_SAMPLER_RENDERBUFFER_NV               8E57h
#define  GL_UNSIGNED_INT_SAMPLER_RENDERBUFFER_NV      8E58h
#define  GL_MAX_SAMPLE_MASK_WORDS_NV                  8E59h
;@@ void ( GLenum pname, GLuint index, GLfloat* val );
glGetMultisamplefvNV!: alias function! [
	pname       [ GLenum! ]
	index       [ GLuint! ]
	val         [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLbitfield mask );
glSampleMaskIndexedNV!: alias function! [
	index       [ GLuint! ]
	mask        [ GLbitfield! ]
]
;@@ void ( GLenum target, GLuint renderbuffer );
glTexRenderbufferNV!: alias function! [
	target      [ GLenum! ]
	renderbuffer [ GLuint! ]
]


;-------------------------------------------
;-- GL_NV_fbo_color_attachments
;-------------------------------------------

#define  GL_NV_fbo_color_attachments                  1
#define  GL_MAX_COLOR_ATTACHMENTS_NV                  8CDFh
;#define  GL_COLOR_ATTACHMENT0_NV                      8CE0h
;#define  GL_COLOR_ATTACHMENT1_NV                      8CE1h
;#define  GL_COLOR_ATTACHMENT2_NV                      8CE2h
;#define  GL_COLOR_ATTACHMENT3_NV                      8CE3h
;#define  GL_COLOR_ATTACHMENT4_NV                      8CE4h
;#define  GL_COLOR_ATTACHMENT5_NV                      8CE5h
;#define  GL_COLOR_ATTACHMENT6_NV                      8CE6h
;#define  GL_COLOR_ATTACHMENT7_NV                      8CE7h
;#define  GL_COLOR_ATTACHMENT8_NV                      8CE8h
;#define  GL_COLOR_ATTACHMENT9_NV                      8CE9h
;#define  GL_COLOR_ATTACHMENT10_NV                     8CEAh
;#define  GL_COLOR_ATTACHMENT11_NV                     8CEBh
;#define  GL_COLOR_ATTACHMENT12_NV                     8CECh
;#define  GL_COLOR_ATTACHMENT13_NV                     8CEDh
;#define  GL_COLOR_ATTACHMENT14_NV                     8CEEh
;#define  GL_COLOR_ATTACHMENT15_NV                     8CEFh


;-------------------------------------------
;-- GL_NV_fence
;-------------------------------------------

#define  GL_NV_fence                                  1
#define  GL_ALL_COMPLETED_NV                          84F2h
#define  GL_FENCE_STATUS_NV                           84F3h
#define  GL_FENCE_CONDITION_NV                        84F4h
;@@ void ( GLsizei n, const GLuint* fences );
glDeleteFencesNV!: alias function! [
	n           [ GLsizei! ]
	fences      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint fence );
glFinishFenceNV!: alias function! [
	fence       [ GLuint! ]
]
;@@ void ( GLsizei n, GLuint* fences );
glGenFencesNV!: alias function! [
	n           [ GLsizei! ]
	fences      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint fence, GLenum pname, GLint* params );
glGetFenceivNV!: alias function! [
	fence       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint fence );
glIsFenceNV!: alias function! [
	fence       [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint fence, GLenum condition );
glSetFenceNV!: alias function! [
	fence       [ GLuint! ]
	condition   [ GLenum! ]
]
;@@ GLboolean ( GLuint fence );
glTestFenceNV!: alias function! [
	fence       [ GLuint! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_NV_fill_rectangle
;-------------------------------------------

#define  GL_NV_fill_rectangle                         1
#define  GL_FILL_RECTANGLE_NV                         933Ch


;-------------------------------------------
;-- GL_NV_float_buffer
;-------------------------------------------

#define  GL_NV_float_buffer                           1
#define  GL_FLOAT_R_NV                                8880h
#define  GL_FLOAT_RG_NV                               8881h
#define  GL_FLOAT_RGB_NV                              8882h
#define  GL_FLOAT_RGBA_NV                             8883h
#define  GL_FLOAT_R16_NV                              8884h
#define  GL_FLOAT_R32_NV                              8885h
#define  GL_FLOAT_RG16_NV                             8886h
#define  GL_FLOAT_RG32_NV                             8887h
#define  GL_FLOAT_RGB16_NV                            8888h
#define  GL_FLOAT_RGB32_NV                            8889h
#define  GL_FLOAT_RGBA16_NV                           888Ah
#define  GL_FLOAT_RGBA32_NV                           888Bh
#define  GL_TEXTURE_FLOAT_COMPONENTS_NV               888Ch
#define  GL_FLOAT_CLEAR_COLOR_VALUE_NV                888Dh
#define  GL_FLOAT_RGBA_MODE_NV                        888Eh


;-------------------------------------------
;-- GL_NV_fog_distance
;-------------------------------------------

#define  GL_NV_fog_distance                           1
#define  GL_FOG_DISTANCE_MODE_NV                      855Ah
#define  GL_EYE_RADIAL_NV                             855Bh
#define  GL_EYE_PLANE_ABSOLUTE_NV                     855Ch


;-------------------------------------------
;-- GL_NV_fragment_coverage_to_color
;-------------------------------------------

#define  GL_NV_fragment_coverage_to_color             1
#define  GL_FRAGMENT_COVERAGE_TO_COLOR_NV             92DDh
#define  GL_FRAGMENT_COVERAGE_COLOR_NV                92DEh
;@@ void ( GLuint color );
glFragmentCoverageColorNV!: alias function! [
	color       [ GLuint! ]
]


;-------------------------------------------
;-- GL_NV_fragment_program
;-------------------------------------------

#define  GL_NV_fragment_program                       1
#define  GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV  8868h
#define  GL_FRAGMENT_PROGRAM_NV                       8870h
#define  GL_MAX_TEXTURE_COORDS_NV                     8871h
#define  GL_MAX_TEXTURE_IMAGE_UNITS_NV                8872h
#define  GL_FRAGMENT_PROGRAM_BINDING_NV               8873h
#define  GL_PROGRAM_ERROR_STRING_NV                   8874h
;@@ void ( GLuint id, GLsizei len, const GLubyte* name, GLdouble *params );
glGetProgramNamedParameterdvNV!: alias function! [
	id          [ GLuint! ]
	len         [ GLsizei! ]
	name        [ pointer! [GLubyte!] ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint id, GLsizei len, const GLubyte* name, GLfloat *params );
glGetProgramNamedParameterfvNV!: alias function! [
	id          [ GLuint! ]
	len         [ GLsizei! ]
	name        [ pointer! [GLubyte!] ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint id, GLsizei len, const GLubyte* name, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glProgramNamedParameter4dNV!: alias function! [
	id          [ GLuint! ]
	len         [ GLsizei! ]
	name        [ pointer! [GLubyte!] ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLuint id, GLsizei len, const GLubyte* name, const GLdouble v[] );
glProgramNamedParameter4dvNV!: alias function! [
	id          [ GLuint! ]
	len         [ GLsizei! ]
	name        [ pointer! [GLubyte!] ]
	v           [ pointer! [GLdouble!] ] ;@@[]
]
;@@ void ( GLuint id, GLsizei len, const GLubyte* name, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glProgramNamedParameter4fNV!: alias function! [
	id          [ GLuint! ]
	len         [ GLsizei! ]
	name        [ pointer! [GLubyte!] ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( GLuint id, GLsizei len, const GLubyte* name, const GLfloat v[] );
glProgramNamedParameter4fvNV!: alias function! [
	id          [ GLuint! ]
	len         [ GLsizei! ]
	name        [ pointer! [GLubyte!] ]
	v           [ pointer! [GLfloat!] ] ;@@[]
]


;-------------------------------------------
;-- GL_NV_fragment_program2
;-------------------------------------------

#define  GL_NV_fragment_program2                      1
#define  GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV          88F4h
#define  GL_MAX_PROGRAM_CALL_DEPTH_NV                 88F5h
#define  GL_MAX_PROGRAM_IF_DEPTH_NV                   88F6h
#define  GL_MAX_PROGRAM_LOOP_DEPTH_NV                 88F7h
#define  GL_MAX_PROGRAM_LOOP_COUNT_NV                 88F8h


;-------------------------------------------
;-- GL_NV_fragment_program4
;-------------------------------------------

#define  GL_NV_fragment_program4                      1


;-------------------------------------------
;-- GL_NV_fragment_program_option
;-------------------------------------------

#define  GL_NV_fragment_program_option                1


;-------------------------------------------
;-- GL_NV_fragment_shader_interlock
;-------------------------------------------

#define  GL_NV_fragment_shader_interlock              1


;-------------------------------------------
;-- GL_NV_framebuffer_blit
;-------------------------------------------

#define  GL_NV_framebuffer_blit                       1
#define  GL_DRAW_FRAMEBUFFER_BINDING_NV               8CA6h
#define  GL_READ_FRAMEBUFFER_NV                       8CA8h
#define  GL_DRAW_FRAMEBUFFER_NV                       8CA9h
#define  GL_READ_FRAMEBUFFER_BINDING_NV               8CAAh
;@@ void ( GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter );
glBlitFramebufferNV!: alias function! [
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
;-- GL_NV_framebuffer_mixed_samples
;-------------------------------------------

#define  GL_NV_framebuffer_mixed_samples              1
;#define  GL_COLOR_SAMPLES_NV                          8E20h
;#define  GL_RASTER_MULTISAMPLE_EXT                    9327h
;#define  GL_RASTER_SAMPLES_EXT                        9328h
;#define  GL_MAX_RASTER_SAMPLES_EXT                    9329h
;#define  GL_RASTER_FIXED_SAMPLE_LOCATIONS_EXT         932Ah
;#define  GL_MULTISAMPLE_RASTERIZATION_ALLOWED_EXT     932Bh
;#define  GL_EFFECTIVE_RASTER_SAMPLES_EXT              932Ch
;#define  GL_DEPTH_SAMPLES_NV                          932Dh
;#define  GL_STENCIL_SAMPLES_NV                        932Eh
;#define  GL_MIXED_DEPTH_SAMPLES_SUPPORTED_NV          932Fh
;#define  GL_MIXED_STENCIL_SAMPLES_SUPPORTED_NV        9330h
;#define  GL_COVERAGE_MODULATION_TABLE_NV              9331h
;#define  GL_COVERAGE_MODULATION_NV                    9332h
;#define  GL_COVERAGE_MODULATION_TABLE_SIZE_NV         9333h


;-------------------------------------------
;-- GL_NV_framebuffer_multisample
;-------------------------------------------

#define  GL_NV_framebuffer_multisample                1
#define  GL_RENDERBUFFER_SAMPLES_NV                   8CABh
#define  GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_NV     8D56h
#define  GL_MAX_SAMPLES_NV                            8D57h
;@@ void ( GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height );
glRenderbufferStorageMultisampleNV!: alias function! [
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_NV_framebuffer_multisample_coverage
;-------------------------------------------

#define  GL_NV_framebuffer_multisample_coverage       1
#define  GL_RENDERBUFFER_COVERAGE_SAMPLES_NV          8CABh
#define  GL_RENDERBUFFER_COLOR_SAMPLES_NV             8E10h
#define  GL_MAX_MULTISAMPLE_COVERAGE_MODES_NV         8E11h
#define  GL_MULTISAMPLE_COVERAGE_MODES_NV             8E12h
;@@ void ( GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height );
glRenderbufferStorageMultisampleCoverageNV!: alias function! [
	target      [ GLenum! ]
	coverageSamples [ GLsizei! ]
	colorSamples [ GLsizei! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_NV_generate_mipmap_sRGB
;-------------------------------------------

#define  GL_NV_generate_mipmap_sRGB                   1


;-------------------------------------------
;-- GL_NV_geometry_program4
;-------------------------------------------

#define  GL_NV_geometry_program4                      1
#define  GL_GEOMETRY_PROGRAM_NV                       8C26h
#define  GL_MAX_PROGRAM_OUTPUT_VERTICES_NV            8C27h
#define  GL_MAX_PROGRAM_TOTAL_OUTPUT_COMPONENTS_NV    8C28h
;@@ void ( GLenum target, GLint limit );
glProgramVertexLimitNV!: alias function! [
	target      [ GLenum! ]
	limit       [ GLint! ]
]


;-------------------------------------------
;-- GL_NV_geometry_shader4
;-------------------------------------------

#define  GL_NV_geometry_shader4                       1


;-------------------------------------------
;-- GL_NV_geometry_shader_passthrough
;-------------------------------------------

#define  GL_NV_geometry_shader_passthrough            1


;-------------------------------------------
;-- GL_NV_gpu_multicast
;-------------------------------------------

#define  GL_NV_gpu_multicast                          1
#define  GL_PER_GPU_STORAGE_BIT_NV                    0800h
#define  GL_MULTICAST_GPUS_NV                         92BAh
#define  GL_PER_GPU_STORAGE_NV                        9548h
#define  GL_MULTICAST_PROGRAMMABLE_SAMPLE_LOCATION_NV  9549h
#define  GL_RENDER_GPU_MASK_NV                        9558h
;@@ void ( void );
glMulticastBarrierNV!: alias function! [
]
;@@ void ( GLuint srcGpu, GLuint dstGpu, GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter );
glMulticastBlitFramebufferNV!: alias function! [
	srcGpu      [ GLuint! ]
	dstGpu      [ GLuint! ]
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
;@@ void ( GLbitfield gpuMask, GLuint buffer, GLintptr offset, GLsizeiptr size, const void *data );
glMulticastBufferSubDataNV!: alias function! [
	gpuMask     [ GLbitfield! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint readGpu, GLbitfield writeGpuMask, GLuint readBuffer, GLuint writeBuffer, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size );
glMulticastCopyBufferSubDataNV!: alias function! [
	readGpu     [ GLuint! ]
	writeGpuMask [ GLbitfield! ]
	readBuffer  [ GLuint! ]
	writeBuffer [ GLuint! ]
	readOffset  [ GLintptr! ]
	writeOffset [ GLintptr! ]
	size        [ GLsizeiptr! ]
]
;@@ void ( GLuint srcGpu, GLbitfield dstGpuMask, GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srcY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei srcWidth, GLsizei srcHeight, GLsizei srcDepth );
glMulticastCopyImageSubDataNV!: alias function! [
	srcGpu      [ GLuint! ]
	dstGpuMask  [ GLbitfield! ]
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
;@@ void ( GLuint gpu, GLuint framebuffer, GLuint start, GLsizei count, const GLfloat* v );
glMulticastFramebufferSampleLocationsfvNV!: alias function! [
	gpu         [ GLuint! ]
	framebuffer [ GLuint! ]
	start       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint gpu, GLuint id, GLenum pname, GLint64* params );
glMulticastGetQueryObjecti64vNV!: alias function! [
	gpu         [ GLuint! ]
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLint64-ptr! ]
]
;@@ void ( GLuint gpu, GLuint id, GLenum pname, GLint* params );
glMulticastGetQueryObjectivNV!: alias function! [
	gpu         [ GLuint! ]
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint gpu, GLuint id, GLenum pname, GLuint64* params );
glMulticastGetQueryObjectui64vNV!: alias function! [
	gpu         [ GLuint! ]
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLuint64-ptr! ]
]
;@@ void ( GLuint gpu, GLuint id, GLenum pname, GLuint* params );
glMulticastGetQueryObjectuivNV!: alias function! [
	gpu         [ GLuint! ]
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint signalGpu, GLbitfield waitGpuMask );
glMulticastWaitSyncNV!: alias function! [
	signalGpu   [ GLuint! ]
	waitGpuMask [ GLbitfield! ]
]
;@@ void ( GLbitfield mask );
glRenderGpuMaskNV!: alias function! [
	mask        [ GLbitfield! ]
]


;-------------------------------------------
;-- GL_NV_gpu_program4
;-------------------------------------------

#define  GL_NV_gpu_program4                           1
#define  GL_MIN_PROGRAM_TEXEL_OFFSET_NV               8904h
#define  GL_MAX_PROGRAM_TEXEL_OFFSET_NV               8905h
#define  GL_PROGRAM_ATTRIB_COMPONENTS_NV              8906h
#define  GL_PROGRAM_RESULT_COMPONENTS_NV              8907h
#define  GL_MAX_PROGRAM_ATTRIB_COMPONENTS_NV          8908h
#define  GL_MAX_PROGRAM_RESULT_COMPONENTS_NV          8909h
#define  GL_MAX_PROGRAM_GENERIC_ATTRIBS_NV            8DA5h
#define  GL_MAX_PROGRAM_GENERIC_RESULTS_NV            8DA6h
;@@ void ( GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w );
glProgramEnvParameterI4iNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
	w           [ GLint! ]
]
;@@ void ( GLenum target, GLuint index, const GLint *params );
glProgramEnvParameterI4ivNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w );
glProgramEnvParameterI4uiNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLuint! ]
	y           [ GLuint! ]
	z           [ GLuint! ]
	w           [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index, const GLuint *params );
glProgramEnvParameterI4uivNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLuint index, GLsizei count, const GLint *params );
glProgramEnvParametersI4ivNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint index, GLsizei count, const GLuint *params );
glProgramEnvParametersI4uivNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w );
glProgramLocalParameterI4iNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
	w           [ GLint! ]
]
;@@ void ( GLenum target, GLuint index, const GLint *params );
glProgramLocalParameterI4ivNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w );
glProgramLocalParameterI4uiNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLuint! ]
	y           [ GLuint! ]
	z           [ GLuint! ]
	w           [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index, const GLuint *params );
glProgramLocalParameterI4uivNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLuint index, GLsizei count, const GLint *params );
glProgramLocalParametersI4ivNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint index, GLsizei count, const GLuint *params );
glProgramLocalParametersI4uivNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLuint!] ]
]


;-------------------------------------------
;-- GL_NV_gpu_program5
;-------------------------------------------

#define  GL_NV_gpu_program5                           1
#define  GL_MAX_GEOMETRY_PROGRAM_INVOCATIONS_NV       8E5Ah
#define  GL_MIN_FRAGMENT_INTERPOLATION_OFFSET_NV      8E5Bh
#define  GL_MAX_FRAGMENT_INTERPOLATION_OFFSET_NV      8E5Ch
#define  GL_FRAGMENT_PROGRAM_INTERPOLATION_OFFSET_BITS_NV  8E5Dh
#define  GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_NV      8E5Eh
#define  GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_NV      8E5Fh


;-------------------------------------------
;-- GL_NV_gpu_program5_mem_extended
;-------------------------------------------

#define  GL_NV_gpu_program5_mem_extended              1


;-------------------------------------------
;-- GL_NV_gpu_program_fp64
;-------------------------------------------

#define  GL_NV_gpu_program_fp64                       1


;-------------------------------------------
;-- GL_NV_gpu_shader5
;-------------------------------------------

#define  GL_NV_gpu_shader5                            1
#define  GL_INT64_NV                                  140Eh
#define  GL_UNSIGNED_INT64_NV                         140Fh
#define  GL_INT8_NV                                   8FE0h
#define  GL_INT8_VEC2_NV                              8FE1h
#define  GL_INT8_VEC3_NV                              8FE2h
#define  GL_INT8_VEC4_NV                              8FE3h
#define  GL_INT16_NV                                  8FE4h
#define  GL_INT16_VEC2_NV                             8FE5h
#define  GL_INT16_VEC3_NV                             8FE6h
#define  GL_INT16_VEC4_NV                             8FE7h
#define  GL_INT64_VEC2_NV                             8FE9h
#define  GL_INT64_VEC3_NV                             8FEAh
#define  GL_INT64_VEC4_NV                             8FEBh
#define  GL_UNSIGNED_INT8_NV                          8FECh
#define  GL_UNSIGNED_INT8_VEC2_NV                     8FEDh
#define  GL_UNSIGNED_INT8_VEC3_NV                     8FEEh
#define  GL_UNSIGNED_INT8_VEC4_NV                     8FEFh
#define  GL_UNSIGNED_INT16_NV                         8FF0h
#define  GL_UNSIGNED_INT16_VEC2_NV                    8FF1h
#define  GL_UNSIGNED_INT16_VEC3_NV                    8FF2h
#define  GL_UNSIGNED_INT16_VEC4_NV                    8FF3h
#define  GL_UNSIGNED_INT64_VEC2_NV                    8FF5h
#define  GL_UNSIGNED_INT64_VEC3_NV                    8FF6h
#define  GL_UNSIGNED_INT64_VEC4_NV                    8FF7h
;#define  GL_FLOAT16_NV                                8FF8h
;#define  GL_FLOAT16_VEC2_NV                           8FF9h
;#define  GL_FLOAT16_VEC3_NV                           8FFAh
;#define  GL_FLOAT16_VEC4_NV                           8FFBh
;@@ void ( GLuint program, GLint location, GLint64EXT* params );
glGetUniformi64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	params      [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLuint64EXT* params );
glGetUniformui64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	params      [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLint64EXT x );
glProgramUniform1i64NV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint64EXT! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint64EXT* value );
glProgramUniform1i64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLuint64EXT x );
glProgramUniform1ui64NV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint64EXT! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64EXT* value );
glProgramUniform1ui64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLint64EXT x, GLint64EXT y );
glProgramUniform2i64NV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint64EXT! ]
	y           [ GLint64EXT! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint64EXT* value );
glProgramUniform2i64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y );
glProgramUniform2ui64NV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint64EXT! ]
	y           [ GLuint64EXT! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64EXT* value );
glProgramUniform2ui64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z );
glProgramUniform3i64NV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint64EXT! ]
	y           [ GLint64EXT! ]
	z           [ GLint64EXT! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint64EXT* value );
glProgramUniform3i64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z );
glProgramUniform3ui64NV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint64EXT! ]
	y           [ GLuint64EXT! ]
	z           [ GLuint64EXT! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64EXT* value );
glProgramUniform3ui64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w );
glProgramUniform4i64NV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLint64EXT! ]
	y           [ GLint64EXT! ]
	z           [ GLint64EXT! ]
	w           [ GLint64EXT! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLint64EXT* value );
glProgramUniform4i64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w );
glProgramUniform4ui64NV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	x           [ GLuint64EXT! ]
	y           [ GLuint64EXT! ]
	z           [ GLuint64EXT! ]
	w           [ GLuint64EXT! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64EXT* value );
glProgramUniform4ui64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64EXT-ptr! ]
]
;@@ void ( GLint location, GLint64EXT x );
glUniform1i64NV!: alias function! [
	location    [ GLint! ]
	x           [ GLint64EXT! ]
]
;@@ void ( GLint location, GLsizei count, const GLint64EXT* value );
glUniform1i64vNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64EXT-ptr! ]
]
;@@ void ( GLint location, GLuint64EXT x );
glUniform1ui64NV!: alias function! [
	location    [ GLint! ]
	x           [ GLuint64EXT! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64EXT* value );
glUniform1ui64vNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64EXT-ptr! ]
]
;@@ void ( GLint location, GLint64EXT x, GLint64EXT y );
glUniform2i64NV!: alias function! [
	location    [ GLint! ]
	x           [ GLint64EXT! ]
	y           [ GLint64EXT! ]
]
;@@ void ( GLint location, GLsizei count, const GLint64EXT* value );
glUniform2i64vNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64EXT-ptr! ]
]
;@@ void ( GLint location, GLuint64EXT x, GLuint64EXT y );
glUniform2ui64NV!: alias function! [
	location    [ GLint! ]
	x           [ GLuint64EXT! ]
	y           [ GLuint64EXT! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64EXT* value );
glUniform2ui64vNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64EXT-ptr! ]
]
;@@ void ( GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z );
glUniform3i64NV!: alias function! [
	location    [ GLint! ]
	x           [ GLint64EXT! ]
	y           [ GLint64EXT! ]
	z           [ GLint64EXT! ]
]
;@@ void ( GLint location, GLsizei count, const GLint64EXT* value );
glUniform3i64vNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64EXT-ptr! ]
]
;@@ void ( GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z );
glUniform3ui64NV!: alias function! [
	location    [ GLint! ]
	x           [ GLuint64EXT! ]
	y           [ GLuint64EXT! ]
	z           [ GLuint64EXT! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64EXT* value );
glUniform3ui64vNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64EXT-ptr! ]
]
;@@ void ( GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w );
glUniform4i64NV!: alias function! [
	location    [ GLint! ]
	x           [ GLint64EXT! ]
	y           [ GLint64EXT! ]
	z           [ GLint64EXT! ]
	w           [ GLint64EXT! ]
]
;@@ void ( GLint location, GLsizei count, const GLint64EXT* value );
glUniform4i64vNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLint64EXT-ptr! ]
]
;@@ void ( GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w );
glUniform4ui64NV!: alias function! [
	location    [ GLint! ]
	x           [ GLuint64EXT! ]
	y           [ GLuint64EXT! ]
	z           [ GLuint64EXT! ]
	w           [ GLuint64EXT! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64EXT* value );
glUniform4ui64vNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64EXT-ptr! ]
]


;-------------------------------------------
;-- GL_NV_half_float
;-------------------------------------------

#define  GL_NV_half_float                             1
#define  GL_HALF_FLOAT_NV                             140Bh
;@@ void ( GLhalf red, GLhalf green, GLhalf blue );
glColor3hNV!: alias function! [
	red         [ GLhalf! ]
	green       [ GLhalf! ]
	blue        [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glColor3hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf red, GLhalf green, GLhalf blue, GLhalf alpha );
glColor4hNV!: alias function! [
	red         [ GLhalf! ]
	green       [ GLhalf! ]
	blue        [ GLhalf! ]
	alpha       [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glColor4hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf fog );
glFogCoordhNV!: alias function! [
	fog         [ GLhalf! ]
]
;@@ void ( const GLhalf* fog );
glFogCoordhvNV!: alias function! [
	fog         [ GLhalf-ptr! ]
]
;@@ void ( GLenum target, GLhalf s );
glMultiTexCoord1hNV!: alias function! [
	target      [ GLenum! ]
	s           [ GLhalf! ]
]
;@@ void ( GLenum target, const GLhalf* v );
glMultiTexCoord1hvNV!: alias function! [
	target      [ GLenum! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLenum target, GLhalf s, GLhalf t );
glMultiTexCoord2hNV!: alias function! [
	target      [ GLenum! ]
	s           [ GLhalf! ]
	t           [ GLhalf! ]
]
;@@ void ( GLenum target, const GLhalf* v );
glMultiTexCoord2hvNV!: alias function! [
	target      [ GLenum! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLenum target, GLhalf s, GLhalf t, GLhalf r );
glMultiTexCoord3hNV!: alias function! [
	target      [ GLenum! ]
	s           [ GLhalf! ]
	t           [ GLhalf! ]
	r           [ GLhalf! ]
]
;@@ void ( GLenum target, const GLhalf* v );
glMultiTexCoord3hvNV!: alias function! [
	target      [ GLenum! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLenum target, GLhalf s, GLhalf t, GLhalf r, GLhalf q );
glMultiTexCoord4hNV!: alias function! [
	target      [ GLenum! ]
	s           [ GLhalf! ]
	t           [ GLhalf! ]
	r           [ GLhalf! ]
	q           [ GLhalf! ]
]
;@@ void ( GLenum target, const GLhalf* v );
glMultiTexCoord4hvNV!: alias function! [
	target      [ GLenum! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf nx, GLhalf ny, GLhalf nz );
glNormal3hNV!: alias function! [
	nx          [ GLhalf! ]
	ny          [ GLhalf! ]
	nz          [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glNormal3hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf red, GLhalf green, GLhalf blue );
glSecondaryColor3hNV!: alias function! [
	red         [ GLhalf! ]
	green       [ GLhalf! ]
	blue        [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glSecondaryColor3hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf s );
glTexCoord1hNV!: alias function! [
	s           [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glTexCoord1hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf s, GLhalf t );
glTexCoord2hNV!: alias function! [
	s           [ GLhalf! ]
	t           [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glTexCoord2hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf s, GLhalf t, GLhalf r );
glTexCoord3hNV!: alias function! [
	s           [ GLhalf! ]
	t           [ GLhalf! ]
	r           [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glTexCoord3hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf s, GLhalf t, GLhalf r, GLhalf q );
glTexCoord4hNV!: alias function! [
	s           [ GLhalf! ]
	t           [ GLhalf! ]
	r           [ GLhalf! ]
	q           [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glTexCoord4hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf x, GLhalf y );
glVertex2hNV!: alias function! [
	x           [ GLhalf! ]
	y           [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glVertex2hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf x, GLhalf y, GLhalf z );
glVertex3hNV!: alias function! [
	x           [ GLhalf! ]
	y           [ GLhalf! ]
	z           [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glVertex3hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf x, GLhalf y, GLhalf z, GLhalf w );
glVertex4hNV!: alias function! [
	x           [ GLhalf! ]
	y           [ GLhalf! ]
	z           [ GLhalf! ]
	w           [ GLhalf! ]
]
;@@ void ( const GLhalf* v );
glVertex4hvNV!: alias function! [
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLuint index, GLhalf x );
glVertexAttrib1hNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLhalf! ]
]
;@@ void ( GLuint index, const GLhalf* v );
glVertexAttrib1hvNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLuint index, GLhalf x, GLhalf y );
glVertexAttrib2hNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLhalf! ]
	y           [ GLhalf! ]
]
;@@ void ( GLuint index, const GLhalf* v );
glVertexAttrib2hvNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLuint index, GLhalf x, GLhalf y, GLhalf z );
glVertexAttrib3hNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLhalf! ]
	y           [ GLhalf! ]
	z           [ GLhalf! ]
]
;@@ void ( GLuint index, const GLhalf* v );
glVertexAttrib3hvNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLuint index, GLhalf x, GLhalf y, GLhalf z, GLhalf w );
glVertexAttrib4hNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLhalf! ]
	y           [ GLhalf! ]
	z           [ GLhalf! ]
	w           [ GLhalf! ]
]
;@@ void ( GLuint index, const GLhalf* v );
glVertexAttrib4hvNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLuint index, GLsizei n, const GLhalf* v );
glVertexAttribs1hvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLuint index, GLsizei n, const GLhalf* v );
glVertexAttribs2hvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLuint index, GLsizei n, const GLhalf* v );
glVertexAttribs3hvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLuint index, GLsizei n, const GLhalf* v );
glVertexAttribs4hvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ GLhalf-ptr! ]
]
;@@ void ( GLhalf weight );
glVertexWeighthNV!: alias function! [
	weight      [ GLhalf! ]
]
;@@ void ( const GLhalf* weight );
glVertexWeighthvNV!: alias function! [
	weight      [ GLhalf-ptr! ]
]


;-------------------------------------------
;-- GL_NV_image_formats
;-------------------------------------------

#define  GL_NV_image_formats                          1


;-------------------------------------------
;-- GL_NV_instanced_arrays
;-------------------------------------------

#define  GL_NV_instanced_arrays                       1
#define  GL_VERTEX_ATTRIB_ARRAY_DIVISOR_NV            88FEh
;@@ void ( GLuint index, GLuint divisor );
glVertexAttribDivisorNV!: alias function! [
	index       [ GLuint! ]
	divisor     [ GLuint! ]
]


;-------------------------------------------
;-- GL_NV_internalformat_sample_query
;-------------------------------------------

#define  GL_NV_internalformat_sample_query            1
#define  GL_MULTISAMPLES_NV                           9371h
#define  GL_SUPERSAMPLE_SCALE_X_NV                    9372h
#define  GL_SUPERSAMPLE_SCALE_Y_NV                    9373h
#define  GL_CONFORMANT_NV                             9374h
;@@ void ( GLenum target, GLenum internalformat, GLsizei samples, GLenum pname, GLsizei bufSize, GLint* params );
glGetInternalformatSampleivNV!: alias function! [
	target      [ GLenum! ]
	internalformat [ GLenum! ]
	samples     [ GLsizei! ]
	pname       [ GLenum! ]
	bufSize     [ GLsizei! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_NV_light_max_exponent
;-------------------------------------------

#define  GL_NV_light_max_exponent                     1
#define  GL_MAX_SHININESS_NV                          8504h
#define  GL_MAX_SPOT_EXPONENT_NV                      8505h


;-------------------------------------------
;-- GL_NV_multisample_coverage
;-------------------------------------------

#define  GL_NV_multisample_coverage                   1
;#define  GL_COLOR_SAMPLES_NV                          8E20h


;-------------------------------------------
;-- GL_NV_multisample_filter_hint
;-------------------------------------------

#define  GL_NV_multisample_filter_hint                1
#define  GL_MULTISAMPLE_FILTER_HINT_NV                8534h


;-------------------------------------------
;-- GL_NV_non_square_matrices
;-------------------------------------------

#define  GL_NV_non_square_matrices                    1
#define  GL_FLOAT_MAT2x3_NV                           8B65h
#define  GL_FLOAT_MAT2x4_NV                           8B66h
#define  GL_FLOAT_MAT3x2_NV                           8B67h
#define  GL_FLOAT_MAT3x4_NV                           8B68h
#define  GL_FLOAT_MAT4x2_NV                           8B69h
#define  GL_FLOAT_MAT4x3_NV                           8B6Ah
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix2x3fvNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix2x4fvNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix3x2fvNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix3x4fvNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix4x2fvNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix4x3fvNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_NV_occlusion_query
;-------------------------------------------

#define  GL_NV_occlusion_query                        1
#define  GL_PIXEL_COUNTER_BITS_NV                     8864h
#define  GL_CURRENT_OCCLUSION_QUERY_ID_NV             8865h
#define  GL_PIXEL_COUNT_NV                            8866h
#define  GL_PIXEL_COUNT_AVAILABLE_NV                  8867h
;@@ void ( GLuint id );
glBeginOcclusionQueryNV!: alias function! [
	id          [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* ids );
glDeleteOcclusionQueriesNV!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( void );
glEndOcclusionQueryNV!: alias function! [
]
;@@ void ( GLsizei n, GLuint* ids );
glGenOcclusionQueriesNV!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLuint id, GLenum pname, GLint* params );
glGetOcclusionQueryivNV!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint id, GLenum pname, GLuint* params );
glGetOcclusionQueryuivNV!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ GLboolean ( GLuint id );
glIsOcclusionQueryNV!: alias function! [
	id          [ GLuint! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_NV_pack_subimage
;-------------------------------------------

#define  GL_NV_pack_subimage                          1
#define  GL_PACK_ROW_LENGTH_NV                        0D02h
#define  GL_PACK_SKIP_ROWS_NV                         0D03h
#define  GL_PACK_SKIP_PIXELS_NV                       0D04h


;-------------------------------------------
;-- GL_NV_packed_depth_stencil
;-------------------------------------------

#define  GL_NV_packed_depth_stencil                   1
#define  GL_DEPTH_STENCIL_NV                          84F9h
#define  GL_UNSIGNED_INT_24_8_NV                      84FAh


;-------------------------------------------
;-- GL_NV_packed_float
;-------------------------------------------

#define  GL_NV_packed_float                           1
#define  GL_R11F_G11F_B10F_NV                         8C3Ah
#define  GL_UNSIGNED_INT_10F_11F_11F_REV_NV           8C3Bh


;-------------------------------------------
;-- GL_NV_packed_float_linear
;-------------------------------------------

#define  GL_NV_packed_float_linear                    1
;#define  GL_R11F_G11F_B10F_NV                         8C3Ah
;#define  GL_UNSIGNED_INT_10F_11F_11F_REV_NV           8C3Bh


;-------------------------------------------
;-- GL_NV_parameter_buffer_object
;-------------------------------------------

#define  GL_NV_parameter_buffer_object                1
#define  GL_MAX_PROGRAM_PARAMETER_BUFFER_BINDINGS_NV  8DA0h
#define  GL_MAX_PROGRAM_PARAMETER_BUFFER_SIZE_NV      8DA1h
#define  GL_VERTEX_PROGRAM_PARAMETER_BUFFER_NV        8DA2h
#define  GL_GEOMETRY_PROGRAM_PARAMETER_BUFFER_NV      8DA3h
#define  GL_FRAGMENT_PROGRAM_PARAMETER_BUFFER_NV      8DA4h
;@@ void ( GLenum target, GLuint buffer, GLuint index, GLsizei count, const GLint *params );
glProgramBufferParametersIivNV!: alias function! [
	target      [ GLenum! ]
	buffer      [ GLuint! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint buffer, GLuint index, GLsizei count, const GLuint *params );
glProgramBufferParametersIuivNV!: alias function! [
	target      [ GLenum! ]
	buffer      [ GLuint! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLuint buffer, GLuint index, GLsizei count, const GLfloat *params );
glProgramBufferParametersfvNV!: alias function! [
	target      [ GLenum! ]
	buffer      [ GLuint! ]
	index       [ GLuint! ]
	count       [ GLsizei! ]
	params      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_NV_parameter_buffer_object2
;-------------------------------------------

#define  GL_NV_parameter_buffer_object2               1


;-------------------------------------------
;-- GL_NV_path_rendering
;-------------------------------------------

#define  GL_NV_path_rendering                         1
#define  GL_CLOSE_PATH_NV                             00h
#define  GL_BOLD_BIT_NV                               01h
#define  GL_GLYPH_WIDTH_BIT_NV                        01h
#define  GL_GLYPH_HEIGHT_BIT_NV                       02h
#define  GL_ITALIC_BIT_NV                             02h
#define  GL_MOVE_TO_NV                                02h
#define  GL_RELATIVE_MOVE_TO_NV                       03h
#define  GL_GLYPH_HORIZONTAL_BEARING_X_BIT_NV         04h
#define  GL_LINE_TO_NV                                04h
#define  GL_RELATIVE_LINE_TO_NV                       05h
#define  GL_HORIZONTAL_LINE_TO_NV                     06h
#define  GL_RELATIVE_HORIZONTAL_LINE_TO_NV            07h
#define  GL_GLYPH_HORIZONTAL_BEARING_Y_BIT_NV         08h
#define  GL_VERTICAL_LINE_TO_NV                       08h
#define  GL_RELATIVE_VERTICAL_LINE_TO_NV              09h
#define  GL_QUADRATIC_CURVE_TO_NV                     0Ah
#define  GL_RELATIVE_QUADRATIC_CURVE_TO_NV            0Bh
#define  GL_CUBIC_CURVE_TO_NV                         0Ch
#define  GL_RELATIVE_CUBIC_CURVE_TO_NV                0Dh
#define  GL_SMOOTH_QUADRATIC_CURVE_TO_NV              0Eh
#define  GL_RELATIVE_SMOOTH_QUADRATIC_CURVE_TO_NV     0Fh
#define  GL_GLYPH_HORIZONTAL_BEARING_ADVANCE_BIT_NV   10h
#define  GL_SMOOTH_CUBIC_CURVE_TO_NV                  10h
#define  GL_RELATIVE_SMOOTH_CUBIC_CURVE_TO_NV         11h
#define  GL_SMALL_CCW_ARC_TO_NV                       12h
#define  GL_RELATIVE_SMALL_CCW_ARC_TO_NV              13h
#define  GL_SMALL_CW_ARC_TO_NV                        14h
#define  GL_RELATIVE_SMALL_CW_ARC_TO_NV               15h
#define  GL_LARGE_CCW_ARC_TO_NV                       16h
#define  GL_RELATIVE_LARGE_CCW_ARC_TO_NV              17h
#define  GL_LARGE_CW_ARC_TO_NV                        18h
#define  GL_RELATIVE_LARGE_CW_ARC_TO_NV               19h
#define  GL_CONIC_CURVE_TO_NV                         1Ah
#define  GL_RELATIVE_CONIC_CURVE_TO_NV                1Bh
#define  GL_GLYPH_VERTICAL_BEARING_X_BIT_NV           20h
#define  GL_GLYPH_VERTICAL_BEARING_Y_BIT_NV           40h
#define  GL_GLYPH_VERTICAL_BEARING_ADVANCE_BIT_NV     80h
#define  GL_ROUNDED_RECT_NV                           E8h
#define  GL_RELATIVE_ROUNDED_RECT_NV                  E9h
#define  GL_ROUNDED_RECT2_NV                          EAh
#define  GL_RELATIVE_ROUNDED_RECT2_NV                 EBh
#define  GL_ROUNDED_RECT4_NV                          ECh
#define  GL_RELATIVE_ROUNDED_RECT4_NV                 EDh
#define  GL_ROUNDED_RECT8_NV                          EEh
#define  GL_RELATIVE_ROUNDED_RECT8_NV                 EFh
#define  GL_RESTART_PATH_NV                           F0h
#define  GL_DUP_FIRST_CUBIC_CURVE_TO_NV               F2h
#define  GL_DUP_LAST_CUBIC_CURVE_TO_NV                F4h
#define  GL_RECT_NV                                   F6h
#define  GL_RELATIVE_RECT_NV                          F7h
#define  GL_CIRCULAR_CCW_ARC_TO_NV                    F8h
#define  GL_CIRCULAR_CW_ARC_TO_NV                     FAh
#define  GL_CIRCULAR_TANGENT_ARC_TO_NV                FCh
#define  GL_ARC_TO_NV                                 FEh
#define  GL_RELATIVE_ARC_TO_NV                        FFh
#define  GL_GLYPH_HAS_KERNING_BIT_NV                  0100h
#define  GL_PRIMARY_COLOR_NV                          852Ch
#define  GL_SECONDARY_COLOR_NV                        852Dh
;#define  GL_PRIMARY_COLOR                             8577h
#define  GL_PATH_FORMAT_SVG_NV                        9070h
#define  GL_PATH_FORMAT_PS_NV                         9071h
#define  GL_STANDARD_FONT_NAME_NV                     9072h
#define  GL_SYSTEM_FONT_NAME_NV                       9073h
#define  GL_FILE_NAME_NV                              9074h
#define  GL_PATH_STROKE_WIDTH_NV                      9075h
#define  GL_PATH_END_CAPS_NV                          9076h
#define  GL_PATH_INITIAL_END_CAP_NV                   9077h
#define  GL_PATH_TERMINAL_END_CAP_NV                  9078h
#define  GL_PATH_JOIN_STYLE_NV                        9079h
#define  GL_PATH_MITER_LIMIT_NV                       907Ah
#define  GL_PATH_DASH_CAPS_NV                         907Bh
#define  GL_PATH_INITIAL_DASH_CAP_NV                  907Ch
#define  GL_PATH_TERMINAL_DASH_CAP_NV                 907Dh
#define  GL_PATH_DASH_OFFSET_NV                       907Eh
#define  GL_PATH_CLIENT_LENGTH_NV                     907Fh
#define  GL_PATH_FILL_MODE_NV                         9080h
#define  GL_PATH_FILL_MASK_NV                         9081h
#define  GL_PATH_FILL_COVER_MODE_NV                   9082h
#define  GL_PATH_STROKE_COVER_MODE_NV                 9083h
#define  GL_PATH_STROKE_MASK_NV                       9084h
#define  GL_PATH_STROKE_BOUND_NV                      9086h
#define  GL_COUNT_UP_NV                               9088h
#define  GL_COUNT_DOWN_NV                             9089h
#define  GL_PATH_OBJECT_BOUNDING_BOX_NV               908Ah
#define  GL_CONVEX_HULL_NV                            908Bh
#define  GL_BOUNDING_BOX_NV                           908Dh
#define  GL_TRANSLATE_X_NV                            908Eh
#define  GL_TRANSLATE_Y_NV                            908Fh
#define  GL_TRANSLATE_2D_NV                           9090h
#define  GL_TRANSLATE_3D_NV                           9091h
#define  GL_AFFINE_2D_NV                              9092h
#define  GL_AFFINE_3D_NV                              9094h
#define  GL_TRANSPOSE_AFFINE_2D_NV                    9096h
#define  GL_TRANSPOSE_AFFINE_3D_NV                    9098h
#define  GL_UTF8_NV                                   909Ah
#define  GL_UTF16_NV                                  909Bh
#define  GL_BOUNDING_BOX_OF_BOUNDING_BOXES_NV         909Ch
#define  GL_PATH_COMMAND_COUNT_NV                     909Dh
#define  GL_PATH_COORD_COUNT_NV                       909Eh
#define  GL_PATH_DASH_ARRAY_COUNT_NV                  909Fh
#define  GL_PATH_COMPUTED_LENGTH_NV                   90A0h
#define  GL_PATH_FILL_BOUNDING_BOX_NV                 90A1h
#define  GL_PATH_STROKE_BOUNDING_BOX_NV               90A2h
#define  GL_SQUARE_NV                                 90A3h
#define  GL_ROUND_NV                                  90A4h
#define  GL_TRIANGULAR_NV                             90A5h
#define  GL_BEVEL_NV                                  90A6h
#define  GL_MITER_REVERT_NV                           90A7h
#define  GL_MITER_TRUNCATE_NV                         90A8h
#define  GL_SKIP_MISSING_GLYPH_NV                     90A9h
#define  GL_USE_MISSING_GLYPH_NV                      90AAh
#define  GL_PATH_ERROR_POSITION_NV                    90ABh
#define  GL_PATH_FOG_GEN_MODE_NV                      90ACh
#define  GL_ACCUM_ADJACENT_PAIRS_NV                   90ADh
#define  GL_ADJACENT_PAIRS_NV                         90AEh
#define  GL_FIRST_TO_REST_NV                          90AFh
#define  GL_PATH_GEN_MODE_NV                          90B0h
#define  GL_PATH_GEN_COEFF_NV                         90B1h
#define  GL_PATH_GEN_COLOR_FORMAT_NV                  90B2h
#define  GL_PATH_GEN_COMPONENTS_NV                    90B3h
#define  GL_PATH_DASH_OFFSET_RESET_NV                 90B4h
#define  GL_MOVE_TO_RESETS_NV                         90B5h
#define  GL_MOVE_TO_CONTINUES_NV                      90B6h
#define  GL_PATH_STENCIL_FUNC_NV                      90B7h
#define  GL_PATH_STENCIL_REF_NV                       90B8h
#define  GL_PATH_STENCIL_VALUE_MASK_NV                90B9h
#define  GL_PATH_STENCIL_DEPTH_OFFSET_FACTOR_NV       90BDh
#define  GL_PATH_STENCIL_DEPTH_OFFSET_UNITS_NV        90BEh
#define  GL_PATH_COVER_DEPTH_FUNC_NV                  90BFh
#define  GL_FONT_GLYPHS_AVAILABLE_NV                  9368h
#define  GL_FONT_TARGET_UNAVAILABLE_NV                9369h
#define  GL_FONT_UNAVAILABLE_NV                       936Ah
#define  GL_FONT_UNINTELLIGIBLE_NV                    936Bh
#define  GL_STANDARD_FONT_FORMAT_NV                   936Ch
#define  GL_FRAGMENT_INPUT_NV                         936Dh
#define  GL_FONT_X_MIN_BOUNDS_BIT_NV                  00010000h
#define  GL_FONT_Y_MIN_BOUNDS_BIT_NV                  00020000h
#define  GL_FONT_X_MAX_BOUNDS_BIT_NV                  00040000h
#define  GL_FONT_Y_MAX_BOUNDS_BIT_NV                  00080000h
#define  GL_FONT_UNITS_PER_EM_BIT_NV                  00100000h
#define  GL_FONT_ASCENDER_BIT_NV                      00200000h
#define  GL_FONT_DESCENDER_BIT_NV                     00400000h
#define  GL_FONT_HEIGHT_BIT_NV                        00800000h
#define  GL_FONT_MAX_ADVANCE_WIDTH_BIT_NV             01000000h
#define  GL_FONT_MAX_ADVANCE_HEIGHT_BIT_NV            02000000h
#define  GL_FONT_UNDERLINE_POSITION_BIT_NV            04000000h
#define  GL_FONT_UNDERLINE_THICKNESS_BIT_NV           08000000h
#define  GL_FONT_HAS_KERNING_BIT_NV                   10000000h
#define  GL_FONT_NUM_GLYPH_INDICES_BIT_NV             20000000h
;@@ void ( GLuint resultPath, GLuint srcPath );
glCopyPathNV!: alias function! [
	resultPath  [ GLuint! ]
	srcPath     [ GLuint! ]
]
;@@ void ( GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum coverMode, GLenum transformType, const GLfloat *transformValues );
glCoverFillPathInstancedNV!: alias function! [
	numPaths    [ GLsizei! ]
	pathNameType [ GLenum! ]
	paths       [ pointer! [byte!] ]
	pathBase    [ GLuint! ]
	coverMode   [ GLenum! ]
	transformType [ GLenum! ]
	transformValues [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLenum coverMode );
glCoverFillPathNV!: alias function! [
	path        [ GLuint! ]
	coverMode   [ GLenum! ]
]
;@@ void ( GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum coverMode, GLenum transformType, const GLfloat *transformValues );
glCoverStrokePathInstancedNV!: alias function! [
	numPaths    [ GLsizei! ]
	pathNameType [ GLenum! ]
	paths       [ pointer! [byte!] ]
	pathBase    [ GLuint! ]
	coverMode   [ GLenum! ]
	transformType [ GLenum! ]
	transformValues [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLenum coverMode );
glCoverStrokePathNV!: alias function! [
	path        [ GLuint! ]
	coverMode   [ GLenum! ]
]
;@@ void ( GLuint path, GLsizei range );
glDeletePathsNV!: alias function! [
	path        [ GLuint! ]
	range       [ GLsizei! ]
]
;@@ GLuint ( GLsizei range );
glGenPathsNV!: alias function! [
	range       [ GLsizei! ]
	return: [ GLuint! ]

]
;@@ void ( GLenum color, GLenum pname, GLfloat* value );
glGetPathColorGenfvNV!: alias function! [
	color       [ GLenum! ]
	pname       [ GLenum! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum color, GLenum pname, GLint* value );
glGetPathColorGenivNV!: alias function! [
	color       [ GLenum! ]
	pname       [ GLenum! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint path, GLubyte* commands );
glGetPathCommandsNV!: alias function! [
	path        [ GLuint! ]
	commands    [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint path, GLfloat* coords );
glGetPathCoordsNV!: alias function! [
	path        [ GLuint! ]
	coords      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLfloat* dashArray );
glGetPathDashArrayNV!: alias function! [
	path        [ GLuint! ]
	dashArray   [ pointer! [GLfloat!] ]
]
;@@ GLfloat ( GLuint path, GLsizei startSegment, GLsizei numSegments );
glGetPathLengthNV!: alias function! [
	path        [ GLuint! ]
	startSegment [ GLsizei! ]
	numSegments [ GLsizei! ]
	return: [ GLfloat! ]

]
;@@ void ( GLbitfield metricQueryMask, GLuint firstPathName, GLsizei numPaths, GLsizei stride, GLfloat* metrics );
glGetPathMetricRangeNV!: alias function! [
	metricQueryMask [ GLbitfield! ]
	firstPathName [ GLuint! ]
	numPaths    [ GLsizei! ]
	stride      [ GLsizei! ]
	metrics     [ pointer! [GLfloat!] ]
]
;@@ void ( GLbitfield metricQueryMask, GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLsizei stride, GLfloat *metrics );
glGetPathMetricsNV!: alias function! [
	metricQueryMask [ GLbitfield! ]
	numPaths    [ GLsizei! ]
	pathNameType [ GLenum! ]
	paths       [ pointer! [byte!] ]
	pathBase    [ GLuint! ]
	stride      [ GLsizei! ]
	metrics     [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLenum pname, GLfloat* value );
glGetPathParameterfvNV!: alias function! [
	path        [ GLuint! ]
	pname       [ GLenum! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLenum pname, GLint* value );
glGetPathParameterivNV!: alias function! [
	path        [ GLuint! ]
	pname       [ GLenum! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLenum pathListMode, GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLfloat advanceScale, GLfloat kerningScale, GLenum transformType, GLfloat *returnedSpacing );
glGetPathSpacingNV!: alias function! [
	pathListMode [ GLenum! ]
	numPaths    [ GLsizei! ]
	pathNameType [ GLenum! ]
	paths       [ pointer! [byte!] ]
	pathBase    [ GLuint! ]
	advanceScale [ GLfloat! ]
	kerningScale [ GLfloat! ]
	transformType [ GLenum! ]
	returnedSpacing [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum texCoordSet, GLenum pname, GLfloat* value );
glGetPathTexGenfvNV!: alias function! [
	texCoordSet [ GLenum! ]
	pname       [ GLenum! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum texCoordSet, GLenum pname, GLint* value );
glGetPathTexGenivNV!: alias function! [
	texCoordSet [ GLenum! ]
	pname       [ GLenum! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLuint program, GLenum programInterface, GLuint index, GLsizei propCount, const GLenum* props, GLsizei bufSize, GLsizei *length, GLfloat *params );
glGetProgramResourcefvNV!: alias function! [
	program     [ GLuint! ]
	programInterface [ GLenum! ]
	index       [ GLuint! ]
	propCount   [ GLsizei! ]
	props       [ pointer! [GLenum!] ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint resultPath, GLuint pathA, GLuint pathB, GLfloat weight );
glInterpolatePathsNV!: alias function! [
	resultPath  [ GLuint! ]
	pathA       [ GLuint! ]
	pathB       [ GLuint! ]
	weight      [ GLfloat! ]
]
;@@ GLboolean ( GLuint path );
glIsPathNV!: alias function! [
	path        [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint path, GLuint mask, GLfloat x, GLfloat y );
glIsPointInFillPathNV!: alias function! [
	path        [ GLuint! ]
	mask        [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint path, GLfloat x, GLfloat y );
glIsPointInStrokePathNV!: alias function! [
	path        [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum matrixMode, const GLfloat* m );
glMatrixLoad3x2fNV!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum matrixMode, const GLfloat* m );
glMatrixLoad3x3fNV!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum matrixMode, const GLfloat* m );
glMatrixLoadTranspose3x3fNV!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum matrixMode, const GLfloat* m );
glMatrixMult3x2fNV!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum matrixMode, const GLfloat* m );
glMatrixMult3x3fNV!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum matrixMode, const GLfloat* m );
glMatrixMultTranspose3x3fNV!: alias function! [
	matrixMode  [ GLenum! ]
	m           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum color, GLenum genMode, GLenum colorFormat, const GLfloat* coeffs );
glPathColorGenNV!: alias function! [
	color       [ GLenum! ]
	genMode     [ GLenum! ]
	colorFormat [ GLenum! ]
	coeffs      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLsizei numCommands, const GLubyte* commands, GLsizei numCoords, GLenum coordType, const void*coords );
glPathCommandsNV!: alias function! [
	path        [ GLuint! ]
	numCommands [ GLsizei! ]
	commands    [ pointer! [GLubyte!] ]
	numCoords   [ GLsizei! ]
	coordType   [ GLenum! ]
	coords      [ pointer! [byte!] ]
]
;@@ void ( GLuint path, GLsizei numCoords, GLenum coordType, const void *coords );
glPathCoordsNV!: alias function! [
	path        [ GLuint! ]
	numCoords   [ GLsizei! ]
	coordType   [ GLenum! ]
	coords      [ pointer! [byte!] ]
]
;@@ void ( GLenum zfunc );
glPathCoverDepthFuncNV!: alias function! [
	zfunc       [ GLenum! ]
]
;@@ void ( GLuint path, GLsizei dashCount, const GLfloat* dashArray );
glPathDashArrayNV!: alias function! [
	path        [ GLuint! ]
	dashCount   [ GLsizei! ]
	dashArray   [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum genMode );
glPathFogGenNV!: alias function! [
	genMode     [ GLenum! ]
]
;@@ GLenum ( GLuint firstPathName, GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLuint firstGlyphIndex, GLsizei numGlyphs, GLuint pathParameterTemplate, GLfloat emScale );
glPathGlyphIndexArrayNV!: alias function! [
	firstPathName [ GLuint! ]
	fontTarget  [ GLenum! ]
	fontName    [ pointer! [byte!] ]
	fontStyle   [ GLbitfield! ]
	firstGlyphIndex [ GLuint! ]
	numGlyphs   [ GLsizei! ]
	pathParameterTemplate [ GLuint! ]
	emScale     [ GLfloat! ]
	return: [ GLenum! ]

]
;@@ GLenum ( GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLuint pathParameterTemplate, GLfloat emScale, GLuint baseAndCount[2] );
glPathGlyphIndexRangeNV!: alias function! [
	fontTarget  [ GLenum! ]
	fontName    [ pointer! [byte!] ]
	fontStyle   [ GLbitfield! ]
	pathParameterTemplate [ GLuint! ]
	emScale     [ GLfloat! ]
	baseAndCount [ pointer! [GLuint!] ] ;@@[2]
	return: [ GLenum! ]

]
;@@ void ( GLuint firstPathName, GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLuint firstGlyph, GLsizei numGlyphs, GLenum handleMissingGlyphs, GLuint pathParameterTemplate, GLfloat emScale );
glPathGlyphRangeNV!: alias function! [
	firstPathName [ GLuint! ]
	fontTarget  [ GLenum! ]
	fontName    [ pointer! [byte!] ]
	fontStyle   [ GLbitfield! ]
	firstGlyph  [ GLuint! ]
	numGlyphs   [ GLsizei! ]
	handleMissingGlyphs [ GLenum! ]
	pathParameterTemplate [ GLuint! ]
	emScale     [ GLfloat! ]
]
;@@ void ( GLuint firstPathName, GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLsizei numGlyphs, GLenum type, const void*charcodes, GLenum handleMissingGlyphs, GLuint pathParameterTemplate, GLfloat emScale );
glPathGlyphsNV!: alias function! [
	firstPathName [ GLuint! ]
	fontTarget  [ GLenum! ]
	fontName    [ pointer! [byte!] ]
	fontStyle   [ GLbitfield! ]
	numGlyphs   [ GLsizei! ]
	type        [ GLenum! ]
	charcodes   [ pointer! [byte!] ]
	handleMissingGlyphs [ GLenum! ]
	pathParameterTemplate [ GLuint! ]
	emScale     [ GLfloat! ]
]
;@@ GLenum ( GLuint firstPathName, GLenum fontTarget, GLsizeiptr fontSize, const void *fontData, GLsizei faceIndex, GLuint firstGlyphIndex, GLsizei numGlyphs, GLuint pathParameterTemplate, GLfloat emScale );
glPathMemoryGlyphIndexArrayNV!: alias function! [
	firstPathName [ GLuint! ]
	fontTarget  [ GLenum! ]
	fontSize    [ GLsizeiptr! ]
	fontData    [ pointer! [byte!] ]
	faceIndex   [ GLsizei! ]
	firstGlyphIndex [ GLuint! ]
	numGlyphs   [ GLsizei! ]
	pathParameterTemplate [ GLuint! ]
	emScale     [ GLfloat! ]
	return: [ GLenum! ]

]
;@@ void ( GLuint path, GLenum pname, GLfloat value );
glPathParameterfNV!: alias function! [
	path        [ GLuint! ]
	pname       [ GLenum! ]
	value       [ GLfloat! ]
]
;@@ void ( GLuint path, GLenum pname, const GLfloat* value );
glPathParameterfvNV!: alias function! [
	path        [ GLuint! ]
	pname       [ GLenum! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLenum pname, GLint value );
glPathParameteriNV!: alias function! [
	path        [ GLuint! ]
	pname       [ GLenum! ]
	value       [ GLint! ]
]
;@@ void ( GLuint path, GLenum pname, const GLint* value );
glPathParameterivNV!: alias function! [
	path        [ GLuint! ]
	pname       [ GLenum! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLfloat factor, GLfloat units );
glPathStencilDepthOffsetNV!: alias function! [
	factor      [ GLfloat! ]
	units       [ GLfloat! ]
]
;@@ void ( GLenum func, GLint ref, GLuint mask );
glPathStencilFuncNV!: alias function! [
	func        [ GLenum! ]
	ref         [ GLint! ]
	mask        [ GLuint! ]
]
;@@ void ( GLuint path, GLenum format, GLsizei length, const void *pathString );
glPathStringNV!: alias function! [
	path        [ GLuint! ]
	format      [ GLenum! ]
	length      [ GLsizei! ]
	pathString  [ pointer! [byte!] ]
]
;@@ void ( GLuint path, GLsizei commandStart, GLsizei commandsToDelete, GLsizei numCommands, const GLubyte* commands, GLsizei numCoords, GLenum coordType, const void*coords );
glPathSubCommandsNV!: alias function! [
	path        [ GLuint! ]
	commandStart [ GLsizei! ]
	commandsToDelete [ GLsizei! ]
	numCommands [ GLsizei! ]
	commands    [ pointer! [GLubyte!] ]
	numCoords   [ GLsizei! ]
	coordType   [ GLenum! ]
	coords      [ pointer! [byte!] ]
]
;@@ void ( GLuint path, GLsizei coordStart, GLsizei numCoords, GLenum coordType, const void *coords );
glPathSubCoordsNV!: alias function! [
	path        [ GLuint! ]
	coordStart  [ GLsizei! ]
	numCoords   [ GLsizei! ]
	coordType   [ GLenum! ]
	coords      [ pointer! [byte!] ]
]
;@@ void ( GLenum texCoordSet, GLenum genMode, GLint components, const GLfloat* coeffs );
glPathTexGenNV!: alias function! [
	texCoordSet [ GLenum! ]
	genMode     [ GLenum! ]
	components  [ GLint! ]
	coeffs      [ pointer! [GLfloat!] ]
]
;@@ GLboolean ( GLuint path, GLsizei startSegment, GLsizei numSegments, GLfloat distance, GLfloat* x, GLfloat *y, GLfloat *tangentX, GLfloat *tangentY );
glPointAlongPathNV!: alias function! [
	path        [ GLuint! ]
	startSegment [ GLsizei! ]
	numSegments [ GLsizei! ]
	distance    [ GLfloat! ]
	x           [ pointer! [GLfloat!] ]
	y           [ pointer! [GLfloat!] ]
	tangentX    [ pointer! [GLfloat!] ]
	tangentY    [ pointer! [GLfloat!] ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint program, GLint location, GLenum genMode, GLint components, const GLfloat* coeffs );
glProgramPathFragmentInputGenNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	genMode     [ GLenum! ]
	components  [ GLint! ]
	coeffs      [ pointer! [GLfloat!] ]
]
;@@ void ( GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum fillMode, GLuint mask, GLenum transformType, const GLfloat *transformValues );
glStencilFillPathInstancedNV!: alias function! [
	numPaths    [ GLsizei! ]
	pathNameType [ GLenum! ]
	paths       [ pointer! [byte!] ]
	pathBase    [ GLuint! ]
	fillMode    [ GLenum! ]
	mask        [ GLuint! ]
	transformType [ GLenum! ]
	transformValues [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLenum fillMode, GLuint mask );
glStencilFillPathNV!: alias function! [
	path        [ GLuint! ]
	fillMode    [ GLenum! ]
	mask        [ GLuint! ]
]
;@@ void ( GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLint reference, GLuint mask, GLenum transformType, const GLfloat *transformValues );
glStencilStrokePathInstancedNV!: alias function! [
	numPaths    [ GLsizei! ]
	pathNameType [ GLenum! ]
	paths       [ pointer! [byte!] ]
	pathBase    [ GLuint! ]
	reference   [ GLint! ]
	mask        [ GLuint! ]
	transformType [ GLenum! ]
	transformValues [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLint reference, GLuint mask );
glStencilStrokePathNV!: alias function! [
	path        [ GLuint! ]
	reference   [ GLint! ]
	mask        [ GLuint! ]
]
;@@ void ( GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum fillMode, GLuint mask, GLenum coverMode, GLenum transformType, const GLfloat *transformValues );
glStencilThenCoverFillPathInstancedNV!: alias function! [
	numPaths    [ GLsizei! ]
	pathNameType [ GLenum! ]
	paths       [ pointer! [byte!] ]
	pathBase    [ GLuint! ]
	fillMode    [ GLenum! ]
	mask        [ GLuint! ]
	coverMode   [ GLenum! ]
	transformType [ GLenum! ]
	transformValues [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLenum fillMode, GLuint mask, GLenum coverMode );
glStencilThenCoverFillPathNV!: alias function! [
	path        [ GLuint! ]
	fillMode    [ GLenum! ]
	mask        [ GLuint! ]
	coverMode   [ GLenum! ]
]
;@@ void ( GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLint reference, GLuint mask, GLenum coverMode, GLenum transformType, const GLfloat *transformValues );
glStencilThenCoverStrokePathInstancedNV!: alias function! [
	numPaths    [ GLsizei! ]
	pathNameType [ GLenum! ]
	paths       [ pointer! [byte!] ]
	pathBase    [ GLuint! ]
	reference   [ GLint! ]
	mask        [ GLuint! ]
	coverMode   [ GLenum! ]
	transformType [ GLenum! ]
	transformValues [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint path, GLint reference, GLuint mask, GLenum coverMode );
glStencilThenCoverStrokePathNV!: alias function! [
	path        [ GLuint! ]
	reference   [ GLint! ]
	mask        [ GLuint! ]
	coverMode   [ GLenum! ]
]
;@@ void ( GLuint resultPath, GLuint srcPath, GLenum transformType, const GLfloat* transformValues );
glTransformPathNV!: alias function! [
	resultPath  [ GLuint! ]
	srcPath     [ GLuint! ]
	transformType [ GLenum! ]
	transformValues [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint resultPath, GLsizei numPaths, const GLuint paths[], const GLfloat weights[] );
glWeightPathsNV!: alias function! [
	resultPath  [ GLuint! ]
	numPaths    [ GLsizei! ]
	paths       [ pointer! [GLuint!] ] ;@@[]
	weights     [ pointer! [GLfloat!] ] ;@@[]
]


;-------------------------------------------
;-- GL_NV_path_rendering_shared_edge
;-------------------------------------------

#define  GL_NV_path_rendering_shared_edge             1
#define  GL_SHARED_EDGE_NV                            C0h


;-------------------------------------------
;-- GL_NV_pixel_buffer_object
;-------------------------------------------

#define  GL_NV_pixel_buffer_object                    1
#define  GL_PIXEL_PACK_BUFFER_NV                      88EBh
#define  GL_PIXEL_UNPACK_BUFFER_NV                    88ECh
#define  GL_PIXEL_PACK_BUFFER_BINDING_NV              88EDh
#define  GL_PIXEL_UNPACK_BUFFER_BINDING_NV            88EFh


;-------------------------------------------
;-- GL_NV_pixel_data_range
;-------------------------------------------

#define  GL_NV_pixel_data_range                       1
#define  GL_WRITE_PIXEL_DATA_RANGE_NV                 8878h
#define  GL_READ_PIXEL_DATA_RANGE_NV                  8879h
#define  GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV          887Ah
#define  GL_READ_PIXEL_DATA_RANGE_LENGTH_NV           887Bh
#define  GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV         887Ch
#define  GL_READ_PIXEL_DATA_RANGE_POINTER_NV          887Dh
;@@ void ( GLenum target );
glFlushPixelDataRangeNV!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLenum target, GLsizei length, void *pointer );
glPixelDataRangeNV!: alias function! [
	target      [ GLenum! ]
	length      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_NV_platform_binary
;-------------------------------------------

#define  GL_NV_platform_binary                        1
#define  GL_NVIDIA_PLATFORM_BINARY_NV                 890Bh


;-------------------------------------------
;-- GL_NV_point_sprite
;-------------------------------------------

#define  GL_NV_point_sprite                           1
#define  GL_POINT_SPRITE_NV                           8861h
#define  GL_COORD_REPLACE_NV                          8862h
#define  GL_POINT_SPRITE_R_MODE_NV                    8863h
;@@ void ( GLenum pname, GLint param );
glPointParameteriNV!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum pname, const GLint* params );
glPointParameterivNV!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_NV_polygon_mode
;-------------------------------------------

#define  GL_NV_polygon_mode                           1
#define  GL_POLYGON_MODE_NV                           0B40h
#define  GL_POINT_NV                                  1B00h
#define  GL_LINE_NV                                   1B01h
#define  GL_FILL_NV                                   1B02h
#define  GL_POLYGON_OFFSET_POINT_NV                   2A01h
#define  GL_POLYGON_OFFSET_LINE_NV                    2A02h
;@@ void ( GLenum face, GLenum mode );
glPolygonModeNV!: alias function! [
	face        [ GLenum! ]
	mode        [ GLenum! ]
]


;-------------------------------------------
;-- GL_NV_present_video
;-------------------------------------------

#define  GL_NV_present_video                          1
#define  GL_FRAME_NV                                  8E26h
#define  GL_FIELDS_NV                                 8E27h
#define  GL_CURRENT_TIME_NV                           8E28h
#define  GL_NUM_FILL_STREAMS_NV                       8E29h
#define  GL_PRESENT_TIME_NV                           8E2Ah
#define  GL_PRESENT_DURATION_NV                       8E2Bh
;@@ void ( GLuint video_slot, GLenum pname, GLint64EXT* params );
glGetVideoi64vNV!: alias function! [
	video_slot  [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint video_slot, GLenum pname, GLint* params );
glGetVideoivNV!: alias function! [
	video_slot  [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint video_slot, GLenum pname, GLuint64EXT* params );
glGetVideoui64vNV!: alias function! [
	video_slot  [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint video_slot, GLenum pname, GLuint* params );
glGetVideouivNV!: alias function! [
	video_slot  [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint video_slot, GLuint64EXT minPresentTime, GLuint beginPresentTimeId, GLuint presentDurationId, GLenum type, GLenum target0, GLuint fill0, GLenum target1, GLuint fill1, GLenum target2, GLuint fill2, GLenum target3, GLuint fill3 );
glPresentFrameDualFillNV!: alias function! [
	video_slot  [ GLuint! ]
	minPresentTime [ GLuint64EXT! ]
	beginPresentTimeId [ GLuint! ]
	presentDurationId [ GLuint! ]
	type        [ GLenum! ]
	target0     [ GLenum! ]
	fill0       [ GLuint! ]
	target1     [ GLenum! ]
	fill1       [ GLuint! ]
	target2     [ GLenum! ]
	fill2       [ GLuint! ]
	target3     [ GLenum! ]
	fill3       [ GLuint! ]
]
;@@ void ( GLuint video_slot, GLuint64EXT minPresentTime, GLuint beginPresentTimeId, GLuint presentDurationId, GLenum type, GLenum target0, GLuint fill0, GLuint key0, GLenum target1, GLuint fill1, GLuint key1 );
glPresentFrameKeyedNV!: alias function! [
	video_slot  [ GLuint! ]
	minPresentTime [ GLuint64EXT! ]
	beginPresentTimeId [ GLuint! ]
	presentDurationId [ GLuint! ]
	type        [ GLenum! ]
	target0     [ GLenum! ]
	fill0       [ GLuint! ]
	key0        [ GLuint! ]
	target1     [ GLenum! ]
	fill1       [ GLuint! ]
	key1        [ GLuint! ]
]


;-------------------------------------------
;-- GL_NV_primitive_restart
;-------------------------------------------

#define  GL_NV_primitive_restart                      1
#define  GL_PRIMITIVE_RESTART_NV                      8558h
#define  GL_PRIMITIVE_RESTART_INDEX_NV                8559h
;@@ void ( GLuint index );
glPrimitiveRestartIndexNV!: alias function! [
	index       [ GLuint! ]
]
;@@ void ( void );
glPrimitiveRestartNV!: alias function! [
]


;-------------------------------------------
;-- GL_NV_read_depth
;-------------------------------------------

#define  GL_NV_read_depth                             1


;-------------------------------------------
;-- GL_NV_read_depth_stencil
;-------------------------------------------

#define  GL_NV_read_depth_stencil                     1


;-------------------------------------------
;-- GL_NV_read_stencil
;-------------------------------------------

#define  GL_NV_read_stencil                           1


;-------------------------------------------
;-- GL_NV_register_combiners
;-------------------------------------------

#define  GL_NV_register_combiners                     1
#define  GL_REGISTER_COMBINERS_NV                     8522h
#define  GL_VARIABLE_A_NV                             8523h
#define  GL_VARIABLE_B_NV                             8524h
#define  GL_VARIABLE_C_NV                             8525h
#define  GL_VARIABLE_D_NV                             8526h
#define  GL_VARIABLE_E_NV                             8527h
#define  GL_VARIABLE_F_NV                             8528h
#define  GL_VARIABLE_G_NV                             8529h
#define  GL_CONSTANT_COLOR0_NV                        852Ah
#define  GL_CONSTANT_COLOR1_NV                        852Bh
;#define  GL_PRIMARY_COLOR_NV                          852Ch
;#define  GL_SECONDARY_COLOR_NV                        852Dh
#define  GL_SPARE0_NV                                 852Eh
#define  GL_SPARE1_NV                                 852Fh
#define  GL_DISCARD_NV                                8530h
#define  GL_E_TIMES_F_NV                              8531h
#define  GL_SPARE0_PLUS_SECONDARY_COLOR_NV            8532h
#define  GL_UNSIGNED_IDENTITY_NV                      8536h
#define  GL_UNSIGNED_INVERT_NV                        8537h
#define  GL_EXPAND_NORMAL_NV                          8538h
#define  GL_EXPAND_NEGATE_NV                          8539h
#define  GL_HALF_BIAS_NORMAL_NV                       853Ah
#define  GL_HALF_BIAS_NEGATE_NV                       853Bh
#define  GL_SIGNED_IDENTITY_NV                        853Ch
#define  GL_SIGNED_NEGATE_NV                          853Dh
#define  GL_SCALE_BY_TWO_NV                           853Eh
#define  GL_SCALE_BY_FOUR_NV                          853Fh
#define  GL_SCALE_BY_ONE_HALF_NV                      8540h
#define  GL_BIAS_BY_NEGATIVE_ONE_HALF_NV              8541h
#define  GL_COMBINER_INPUT_NV                         8542h
#define  GL_COMBINER_MAPPING_NV                       8543h
#define  GL_COMBINER_COMPONENT_USAGE_NV               8544h
#define  GL_COMBINER_AB_DOT_PRODUCT_NV                8545h
#define  GL_COMBINER_CD_DOT_PRODUCT_NV                8546h
#define  GL_COMBINER_MUX_SUM_NV                       8547h
#define  GL_COMBINER_SCALE_NV                         8548h
#define  GL_COMBINER_BIAS_NV                          8549h
#define  GL_COMBINER_AB_OUTPUT_NV                     854Ah
#define  GL_COMBINER_CD_OUTPUT_NV                     854Bh
#define  GL_COMBINER_SUM_OUTPUT_NV                    854Ch
#define  GL_MAX_GENERAL_COMBINERS_NV                  854Dh
#define  GL_NUM_GENERAL_COMBINERS_NV                  854Eh
#define  GL_COLOR_SUM_CLAMP_NV                        854Fh
#define  GL_COMBINER0_NV                              8550h
#define  GL_COMBINER1_NV                              8551h
#define  GL_COMBINER2_NV                              8552h
#define  GL_COMBINER3_NV                              8553h
#define  GL_COMBINER4_NV                              8554h
#define  GL_COMBINER5_NV                              8555h
#define  GL_COMBINER6_NV                              8556h
#define  GL_COMBINER7_NV                              8557h
;@@ void ( GLenum stage, GLenum portion, GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage );
glCombinerInputNV!: alias function! [
	stage       [ GLenum! ]
	portion     [ GLenum! ]
	variable    [ GLenum! ]
	input       [ GLenum! ]
	mapping     [ GLenum! ]
	componentUsage [ GLenum! ]
]
;@@ void ( GLenum stage, GLenum portion, GLenum abOutput, GLenum cdOutput, GLenum sumOutput, GLenum scale, GLenum bias, GLboolean abDotProduct, GLboolean cdDotProduct, GLboolean muxSum );
glCombinerOutputNV!: alias function! [
	stage       [ GLenum! ]
	portion     [ GLenum! ]
	abOutput    [ GLenum! ]
	cdOutput    [ GLenum! ]
	sumOutput   [ GLenum! ]
	scale       [ GLenum! ]
	bias        [ GLenum! ]
	abDotProduct [ GLboolean! ]
	cdDotProduct [ GLboolean! ]
	muxSum      [ GLboolean! ]
]
;@@ void ( GLenum pname, GLfloat param );
glCombinerParameterfNV!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum pname, const GLfloat* params );
glCombinerParameterfvNV!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum pname, GLint param );
glCombinerParameteriNV!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum pname, const GLint* params );
glCombinerParameterivNV!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage );
glFinalCombinerInputNV!: alias function! [
	variable    [ GLenum! ]
	input       [ GLenum! ]
	mapping     [ GLenum! ]
	componentUsage [ GLenum! ]
]
;@@ void ( GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLfloat* params );
glGetCombinerInputParameterfvNV!: alias function! [
	stage       [ GLenum! ]
	portion     [ GLenum! ]
	variable    [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLint* params );
glGetCombinerInputParameterivNV!: alias function! [
	stage       [ GLenum! ]
	portion     [ GLenum! ]
	variable    [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum stage, GLenum portion, GLenum pname, GLfloat* params );
glGetCombinerOutputParameterfvNV!: alias function! [
	stage       [ GLenum! ]
	portion     [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum stage, GLenum portion, GLenum pname, GLint* params );
glGetCombinerOutputParameterivNV!: alias function! [
	stage       [ GLenum! ]
	portion     [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum variable, GLenum pname, GLfloat* params );
glGetFinalCombinerInputParameterfvNV!: alias function! [
	variable    [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum variable, GLenum pname, GLint* params );
glGetFinalCombinerInputParameterivNV!: alias function! [
	variable    [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_NV_register_combiners2
;-------------------------------------------

#define  GL_NV_register_combiners2                    1
#define  GL_PER_STAGE_CONSTANTS_NV                    8535h
;@@ void ( GLenum stage, GLenum pname, const GLfloat* params );
glCombinerStageParameterfvNV!: alias function! [
	stage       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum stage, GLenum pname, GLfloat* params );
glGetCombinerStageParameterfvNV!: alias function! [
	stage       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_NV_robustness_video_memory_purge
;-------------------------------------------

#define  GL_NV_robustness_video_memory_purge          1
;#define  GL_EGL_GENERATE_RESET_ON_VIDEO_MEMORY_PURGE_NV  334Ch
;#define  GL_PURGED_CONTEXT_RESET_NV                   92BBh


;-------------------------------------------
;-- GL_NV_sRGB_formats
;-------------------------------------------

#define  GL_NV_sRGB_formats                           1
#define  GL_ETC1_SRGB8_NV                             88EEh
#define  GL_SRGB8_NV                                  8C41h
#define  GL_SLUMINANCE_ALPHA_NV                       8C44h
#define  GL_SLUMINANCE8_ALPHA8_NV                     8C45h
#define  GL_SLUMINANCE_NV                             8C46h
#define  GL_SLUMINANCE8_NV                            8C47h
#define  GL_COMPRESSED_SRGB_S3TC_DXT1_NV              8C4Ch
#define  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_NV        8C4Dh
#define  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_NV        8C4Eh
#define  GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_NV        8C4Fh


;-------------------------------------------
;-- GL_NV_sample_locations
;-------------------------------------------

#define  GL_NV_sample_locations                       1
#define  GL_SAMPLE_LOCATION_NV                        8E50h
#define  GL_SAMPLE_LOCATION_SUBPIXEL_BITS_NV          933Dh
#define  GL_SAMPLE_LOCATION_PIXEL_GRID_WIDTH_NV       933Eh
#define  GL_SAMPLE_LOCATION_PIXEL_GRID_HEIGHT_NV      933Fh
#define  GL_PROGRAMMABLE_SAMPLE_LOCATION_TABLE_SIZE_NV  9340h
#define  GL_PROGRAMMABLE_SAMPLE_LOCATION_NV           9341h
#define  GL_FRAMEBUFFER_PROGRAMMABLE_SAMPLE_LOCATIONS_NV  9342h
#define  GL_FRAMEBUFFER_SAMPLE_LOCATION_PIXEL_GRID_NV  9343h
;@@ void ( GLenum target, GLuint start, GLsizei count, const GLfloat* v );
glFramebufferSampleLocationsfvNV!: alias function! [
	target      [ GLenum! ]
	start       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint framebuffer, GLuint start, GLsizei count, const GLfloat* v );
glNamedFramebufferSampleLocationsfvNV!: alias function! [
	framebuffer [ GLuint! ]
	start       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_NV_sample_mask_override_coverage
;-------------------------------------------

#define  GL_NV_sample_mask_override_coverage          1


;-------------------------------------------
;-- GL_NV_shader_atomic_counters
;-------------------------------------------

#define  GL_NV_shader_atomic_counters                 1


;-------------------------------------------
;-- GL_NV_shader_atomic_float
;-------------------------------------------

#define  GL_NV_shader_atomic_float                    1


;-------------------------------------------
;-- GL_NV_shader_atomic_float64
;-------------------------------------------

#define  GL_NV_shader_atomic_float64                  1


;-------------------------------------------
;-- GL_NV_shader_atomic_fp16_vector
;-------------------------------------------

#define  GL_NV_shader_atomic_fp16_vector              1


;-------------------------------------------
;-- GL_NV_shader_atomic_int64
;-------------------------------------------

#define  GL_NV_shader_atomic_int64                    1


;-------------------------------------------
;-- GL_NV_shader_buffer_load
;-------------------------------------------

#define  GL_NV_shader_buffer_load                     1
#define  GL_BUFFER_GPU_ADDRESS_NV                     8F1Dh
#define  GL_GPU_ADDRESS_NV                            8F34h
#define  GL_MAX_SHADER_BUFFER_ADDRESS_NV              8F35h
;@@ void ( GLenum target, GLenum pname, GLuint64EXT* params );
glGetBufferParameterui64vNV!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ GLuint64EXT-ptr! ]
]
;@@ void ( GLenum value, GLuint64EXT* result );
glGetIntegerui64vNV!: alias function! [
	value       [ GLenum! ]
	result      [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint buffer, GLenum pname, GLuint64EXT* params );
glGetNamedBufferParameterui64vNV!: alias function! [
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLuint64EXT-ptr! ]
]
;@@ GLboolean ( GLenum target );
glIsBufferResidentNV!: alias function! [
	target      [ GLenum! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint buffer );
glIsNamedBufferResidentNV!: alias function! [
	buffer      [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum target );
glMakeBufferNonResidentNV!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLenum target, GLenum access );
glMakeBufferResidentNV!: alias function! [
	target      [ GLenum! ]
	access      [ GLenum! ]
]
;@@ void ( GLuint buffer );
glMakeNamedBufferNonResidentNV!: alias function! [
	buffer      [ GLuint! ]
]
;@@ void ( GLuint buffer, GLenum access );
glMakeNamedBufferResidentNV!: alias function! [
	buffer      [ GLuint! ]
	access      [ GLenum! ]
]
;@@ void ( GLuint program, GLint location, GLuint64EXT value );
glProgramUniformui64NV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	value       [ GLuint64EXT! ]
]
;@@ void ( GLuint program, GLint location, GLsizei count, const GLuint64EXT* value );
glProgramUniformui64vNV!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64EXT-ptr! ]
]
;@@ void ( GLint location, GLuint64EXT value );
glUniformui64NV!: alias function! [
	location    [ GLint! ]
	value       [ GLuint64EXT! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint64EXT* value );
glUniformui64vNV!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ GLuint64EXT-ptr! ]
]


;-------------------------------------------
;-- GL_NV_shader_noperspective_interpolation
;-------------------------------------------

#define  GL_NV_shader_noperspective_interpolation     1


;-------------------------------------------
;-- GL_NV_shader_storage_buffer_object
;-------------------------------------------

#define  GL_NV_shader_storage_buffer_object           1


;-------------------------------------------
;-- GL_NV_shader_thread_group
;-------------------------------------------

#define  GL_NV_shader_thread_group                    1
#define  GL_WARP_SIZE_NV                              9339h
#define  GL_WARPS_PER_SM_NV                           933Ah
#define  GL_SM_COUNT_NV                               933Bh


;-------------------------------------------
;-- GL_NV_shader_thread_shuffle
;-------------------------------------------

#define  GL_NV_shader_thread_shuffle                  1


;-------------------------------------------
;-- GL_NV_shadow_samplers_array
;-------------------------------------------

#define  GL_NV_shadow_samplers_array                  1
#define  GL_SAMPLER_2D_ARRAY_SHADOW_NV                8DC4h


;-------------------------------------------
;-- GL_NV_shadow_samplers_cube
;-------------------------------------------

#define  GL_NV_shadow_samplers_cube                   1
#define  GL_SAMPLER_CUBE_SHADOW_NV                    8DC5h


;-------------------------------------------
;-- GL_NV_stereo_view_rendering
;-------------------------------------------

#define  GL_NV_stereo_view_rendering                  1


;-------------------------------------------
;-- GL_NV_tessellation_program5
;-------------------------------------------

#define  GL_NV_tessellation_program5                  1
#define  GL_MAX_PROGRAM_PATCH_ATTRIBS_NV              86D8h
#define  GL_TESS_CONTROL_PROGRAM_NV                   891Eh
#define  GL_TESS_EVALUATION_PROGRAM_NV                891Fh
#define  GL_TESS_CONTROL_PROGRAM_PARAMETER_BUFFER_NV  8C74h
#define  GL_TESS_EVALUATION_PROGRAM_PARAMETER_BUFFER_NV  8C75h


;-------------------------------------------
;-- GL_NV_texgen_emboss
;-------------------------------------------

#define  GL_NV_texgen_emboss                          1
#define  GL_EMBOSS_LIGHT_NV                           855Dh
#define  GL_EMBOSS_CONSTANT_NV                        855Eh
#define  GL_EMBOSS_MAP_NV                             855Fh


;-------------------------------------------
;-- GL_NV_texgen_reflection
;-------------------------------------------

#define  GL_NV_texgen_reflection                      1
#define  GL_NORMAL_MAP_NV                             8511h
#define  GL_REFLECTION_MAP_NV                         8512h


;-------------------------------------------
;-- GL_NV_texture_array
;-------------------------------------------

#define  GL_NV_texture_array                          1
#define  GL_UNPACK_SKIP_IMAGES_NV                     806Dh
#define  GL_UNPACK_IMAGE_HEIGHT_NV                    806Eh
#define  GL_MAX_ARRAY_TEXTURE_LAYERS_NV               88FFh
#define  GL_TEXTURE_2D_ARRAY_NV                       8C1Ah
#define  GL_TEXTURE_BINDING_2D_ARRAY_NV               8C1Dh
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_NV   8CD4h
#define  GL_SAMPLER_2D_ARRAY_NV                       8DC1h
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *data );
glCompressedTexImage3DNV!: alias function! [
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
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data );
glCompressedTexSubImage3DNV!: alias function! [
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
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyTexSubImage3DNV!: alias function! [
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
;@@ void ( GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer );
glFramebufferTextureLayerNV!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	layer       [ GLint! ]
]
;@@ void ( GLenum target, GLint level, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels );
glTexImage3DNV!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalFormat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	border      [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels );
glTexSubImage3DNV!: alias function! [
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
;-- GL_NV_texture_barrier
;-------------------------------------------

#define  GL_NV_texture_barrier                        1
;@@ void ( void );
glTextureBarrierNV!: alias function! [
]


;-------------------------------------------
;-- GL_NV_texture_border_clamp
;-------------------------------------------

#define  GL_NV_texture_border_clamp                   1
#define  GL_TEXTURE_BORDER_COLOR_NV                   1004h
#define  GL_CLAMP_TO_BORDER_NV                        812Dh


;-------------------------------------------
;-- GL_NV_texture_compression_latc
;-------------------------------------------

#define  GL_NV_texture_compression_latc               1
#define  GL_COMPRESSED_LUMINANCE_LATC1_NV             8C70h
#define  GL_COMPRESSED_SIGNED_LUMINANCE_LATC1_NV      8C71h
#define  GL_COMPRESSED_LUMINANCE_ALPHA_LATC2_NV       8C72h
#define  GL_COMPRESSED_SIGNED_LUMINANCE_ALPHA_LATC2_NV  8C73h


;-------------------------------------------
;-- GL_NV_texture_compression_s3tc
;-------------------------------------------

#define  GL_NV_texture_compression_s3tc               1
#define  GL_COMPRESSED_RGB_S3TC_DXT1_NV               83F0h
#define  GL_COMPRESSED_RGBA_S3TC_DXT1_NV              83F1h
#define  GL_COMPRESSED_RGBA_S3TC_DXT3_NV              83F2h
#define  GL_COMPRESSED_RGBA_S3TC_DXT5_NV              83F3h


;-------------------------------------------
;-- GL_NV_texture_compression_s3tc_update
;-------------------------------------------

#define  GL_NV_texture_compression_s3tc_update        1


;-------------------------------------------
;-- GL_NV_texture_compression_vtc
;-------------------------------------------

#define  GL_NV_texture_compression_vtc                1


;-------------------------------------------
;-- GL_NV_texture_env_combine4
;-------------------------------------------

#define  GL_NV_texture_env_combine4                   1
#define  GL_COMBINE4_NV                               8503h
#define  GL_SOURCE3_RGB_NV                            8583h
#define  GL_SOURCE3_ALPHA_NV                          858Bh
#define  GL_OPERAND3_RGB_NV                           8593h
#define  GL_OPERAND3_ALPHA_NV                         859Bh


;-------------------------------------------
;-- GL_NV_texture_expand_normal
;-------------------------------------------

#define  GL_NV_texture_expand_normal                  1
#define  GL_TEXTURE_UNSIGNED_REMAP_MODE_NV            888Fh


;-------------------------------------------
;-- GL_NV_texture_multisample
;-------------------------------------------

#define  GL_NV_texture_multisample                    1
#define  GL_TEXTURE_COVERAGE_SAMPLES_NV               9045h
#define  GL_TEXTURE_COLOR_SAMPLES_NV                  9046h
;@@ void ( GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations );
glTexImage2DMultisampleCoverageNV!: alias function! [
	target      [ GLenum! ]
	coverageSamples [ GLsizei! ]
	colorSamples [ GLsizei! ]
	internalFormat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	fixedSampleLocations [ GLboolean! ]
]
;@@ void ( GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations );
glTexImage3DMultisampleCoverageNV!: alias function! [
	target      [ GLenum! ]
	coverageSamples [ GLsizei! ]
	colorSamples [ GLsizei! ]
	internalFormat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	fixedSampleLocations [ GLboolean! ]
]
;@@ void ( GLuint texture, GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations );
glTextureImage2DMultisampleCoverageNV!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	coverageSamples [ GLsizei! ]
	colorSamples [ GLsizei! ]
	internalFormat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	fixedSampleLocations [ GLboolean! ]
]
;@@ void ( GLuint texture, GLenum target, GLsizei samples, GLint internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations );
glTextureImage2DMultisampleNV!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalFormat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	fixedSampleLocations [ GLboolean! ]
]
;@@ void ( GLuint texture, GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations );
glTextureImage3DMultisampleCoverageNV!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	coverageSamples [ GLsizei! ]
	colorSamples [ GLsizei! ]
	internalFormat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	fixedSampleLocations [ GLboolean! ]
]
;@@ void ( GLuint texture, GLenum target, GLsizei samples, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations );
glTextureImage3DMultisampleNV!: alias function! [
	texture     [ GLuint! ]
	target      [ GLenum! ]
	samples     [ GLsizei! ]
	internalFormat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	fixedSampleLocations [ GLboolean! ]
]


;-------------------------------------------
;-- GL_NV_texture_npot_2D_mipmap
;-------------------------------------------

#define  GL_NV_texture_npot_2D_mipmap                 1


;-------------------------------------------
;-- GL_NV_texture_rectangle
;-------------------------------------------

#define  GL_NV_texture_rectangle                      1
#define  GL_TEXTURE_RECTANGLE_NV                      84F5h
#define  GL_TEXTURE_BINDING_RECTANGLE_NV              84F6h
#define  GL_PROXY_TEXTURE_RECTANGLE_NV                84F7h
#define  GL_MAX_RECTANGLE_TEXTURE_SIZE_NV             84F8h


;-------------------------------------------
;-- GL_NV_texture_rectangle_compressed
;-------------------------------------------

#define  GL_NV_texture_rectangle_compressed           1


;-------------------------------------------
;-- GL_NV_texture_shader
;-------------------------------------------

#define  GL_NV_texture_shader                         1
#define  GL_OFFSET_TEXTURE_RECTANGLE_NV               864Ch
#define  GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV         864Dh
#define  GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV          864Eh
#define  GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV      86D9h
#define  GL_UNSIGNED_INT_S8_S8_8_8_NV                 86DAh
#define  GL_UNSIGNED_INT_8_8_S8_S8_REV_NV             86DBh
#define  GL_DSDT_MAG_INTENSITY_NV                     86DCh
#define  GL_SHADER_CONSISTENT_NV                      86DDh
#define  GL_TEXTURE_SHADER_NV                         86DEh
#define  GL_SHADER_OPERATION_NV                       86DFh
#define  GL_CULL_MODES_NV                             86E0h
#define  GL_OFFSET_TEXTURE_2D_MATRIX_NV               86E1h
#define  GL_OFFSET_TEXTURE_MATRIX_NV                  86E1h
#define  GL_OFFSET_TEXTURE_2D_SCALE_NV                86E2h
#define  GL_OFFSET_TEXTURE_SCALE_NV                   86E2h
#define  GL_OFFSET_TEXTURE_2D_BIAS_NV                 86E3h
#define  GL_OFFSET_TEXTURE_BIAS_NV                    86E3h
#define  GL_PREVIOUS_TEXTURE_INPUT_NV                 86E4h
#define  GL_CONST_EYE_NV                              86E5h
#define  GL_PASS_THROUGH_NV                           86E6h
#define  GL_CULL_FRAGMENT_NV                          86E7h
#define  GL_OFFSET_TEXTURE_2D_NV                      86E8h
#define  GL_DEPENDENT_AR_TEXTURE_2D_NV                86E9h
#define  GL_DEPENDENT_GB_TEXTURE_2D_NV                86EAh
#define  GL_DOT_PRODUCT_NV                            86ECh
#define  GL_DOT_PRODUCT_DEPTH_REPLACE_NV              86EDh
#define  GL_DOT_PRODUCT_TEXTURE_2D_NV                 86EEh
#define  GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV           86F0h
#define  GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV           86F1h
#define  GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV           86F2h
#define  GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV  86F3h
#define  GL_HILO_NV                                   86F4h
#define  GL_DSDT_NV                                   86F5h
#define  GL_DSDT_MAG_NV                               86F6h
#define  GL_DSDT_MAG_VIB_NV                           86F7h
#define  GL_HILO16_NV                                 86F8h
#define  GL_SIGNED_HILO_NV                            86F9h
#define  GL_SIGNED_HILO16_NV                          86FAh
#define  GL_SIGNED_RGBA_NV                            86FBh
#define  GL_SIGNED_RGBA8_NV                           86FCh
#define  GL_SIGNED_RGB_NV                             86FEh
#define  GL_SIGNED_RGB8_NV                            86FFh
#define  GL_SIGNED_LUMINANCE_NV                       8701h
#define  GL_SIGNED_LUMINANCE8_NV                      8702h
#define  GL_SIGNED_LUMINANCE_ALPHA_NV                 8703h
#define  GL_SIGNED_LUMINANCE8_ALPHA8_NV               8704h
#define  GL_SIGNED_ALPHA_NV                           8705h
#define  GL_SIGNED_ALPHA8_NV                          8706h
#define  GL_SIGNED_INTENSITY_NV                       8707h
#define  GL_SIGNED_INTENSITY8_NV                      8708h
#define  GL_DSDT8_NV                                  8709h
#define  GL_DSDT8_MAG8_NV                             870Ah
#define  GL_DSDT8_MAG8_INTENSITY8_NV                  870Bh
#define  GL_SIGNED_RGB_UNSIGNED_ALPHA_NV              870Ch
#define  GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV            870Dh
#define  GL_HI_SCALE_NV                               870Eh
#define  GL_LO_SCALE_NV                               870Fh
#define  GL_DS_SCALE_NV                               8710h
#define  GL_DT_SCALE_NV                               8711h
#define  GL_MAGNITUDE_SCALE_NV                        8712h
#define  GL_VIBRANCE_SCALE_NV                         8713h
#define  GL_HI_BIAS_NV                                8714h
#define  GL_LO_BIAS_NV                                8715h
#define  GL_DS_BIAS_NV                                8716h
#define  GL_DT_BIAS_NV                                8717h
#define  GL_MAGNITUDE_BIAS_NV                         8718h
#define  GL_VIBRANCE_BIAS_NV                          8719h
#define  GL_TEXTURE_BORDER_VALUES_NV                  871Ah
#define  GL_TEXTURE_HI_SIZE_NV                        871Bh
#define  GL_TEXTURE_LO_SIZE_NV                        871Ch
#define  GL_TEXTURE_DS_SIZE_NV                        871Dh
#define  GL_TEXTURE_DT_SIZE_NV                        871Eh
#define  GL_TEXTURE_MAG_SIZE_NV                       871Fh


;-------------------------------------------
;-- GL_NV_texture_shader2
;-------------------------------------------

#define  GL_NV_texture_shader2                        1
;#define  GL_UNSIGNED_INT_S8_S8_8_8_NV                 86DAh
;#define  GL_UNSIGNED_INT_8_8_S8_S8_REV_NV             86DBh
;#define  GL_DSDT_MAG_INTENSITY_NV                     86DCh
#define  GL_DOT_PRODUCT_TEXTURE_3D_NV                 86EFh
;#define  GL_HILO_NV                                   86F4h
;#define  GL_DSDT_NV                                   86F5h
;#define  GL_DSDT_MAG_NV                               86F6h
;#define  GL_DSDT_MAG_VIB_NV                           86F7h
;#define  GL_HILO16_NV                                 86F8h
;#define  GL_SIGNED_HILO_NV                            86F9h
;#define  GL_SIGNED_HILO16_NV                          86FAh
;#define  GL_SIGNED_RGBA_NV                            86FBh
;#define  GL_SIGNED_RGBA8_NV                           86FCh
;#define  GL_SIGNED_RGB_NV                             86FEh
;#define  GL_SIGNED_RGB8_NV                            86FFh
;#define  GL_SIGNED_LUMINANCE_NV                       8701h
;#define  GL_SIGNED_LUMINANCE8_NV                      8702h
;#define  GL_SIGNED_LUMINANCE_ALPHA_NV                 8703h
;#define  GL_SIGNED_LUMINANCE8_ALPHA8_NV               8704h
;#define  GL_SIGNED_ALPHA_NV                           8705h
;#define  GL_SIGNED_ALPHA8_NV                          8706h
;#define  GL_SIGNED_INTENSITY_NV                       8707h
;#define  GL_SIGNED_INTENSITY8_NV                      8708h
;#define  GL_DSDT8_NV                                  8709h
;#define  GL_DSDT8_MAG8_NV                             870Ah
;#define  GL_DSDT8_MAG8_INTENSITY8_NV                  870Bh
;#define  GL_SIGNED_RGB_UNSIGNED_ALPHA_NV              870Ch
;#define  GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV            870Dh


;-------------------------------------------
;-- GL_NV_texture_shader3
;-------------------------------------------

#define  GL_NV_texture_shader3                        1
#define  GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV           8850h
#define  GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV     8851h
#define  GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV    8852h
#define  GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV  8853h
#define  GL_OFFSET_HILO_TEXTURE_2D_NV                 8854h
#define  GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV          8855h
#define  GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV      8856h
#define  GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV  8857h
#define  GL_DEPENDENT_HILO_TEXTURE_2D_NV              8858h
#define  GL_DEPENDENT_RGB_TEXTURE_3D_NV               8859h
#define  GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV         885Ah
#define  GL_DOT_PRODUCT_PASS_THROUGH_NV               885Bh
#define  GL_DOT_PRODUCT_TEXTURE_1D_NV                 885Ch
#define  GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV       885Dh
#define  GL_HILO8_NV                                  885Eh
#define  GL_SIGNED_HILO8_NV                           885Fh
#define  GL_FORCE_BLUE_TO_ONE_NV                      8860h


;-------------------------------------------
;-- GL_NV_transform_feedback
;-------------------------------------------

#define  GL_NV_transform_feedback                     1
#define  GL_BACK_PRIMARY_COLOR_NV                     8C77h
#define  GL_BACK_SECONDARY_COLOR_NV                   8C78h
#define  GL_TEXTURE_COORD_NV                          8C79h
#define  GL_CLIP_DISTANCE_NV                          8C7Ah
#define  GL_VERTEX_ID_NV                              8C7Bh
#define  GL_PRIMITIVE_ID_NV                           8C7Ch
#define  GL_GENERIC_ATTRIB_NV                         8C7Dh
#define  GL_TRANSFORM_FEEDBACK_ATTRIBS_NV             8C7Eh
#define  GL_TRANSFORM_FEEDBACK_BUFFER_MODE_NV         8C7Fh
#define  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_NV  8C80h
#define  GL_ACTIVE_VARYINGS_NV                        8C81h
#define  GL_ACTIVE_VARYING_MAX_LENGTH_NV              8C82h
#define  GL_TRANSFORM_FEEDBACK_VARYINGS_NV            8C83h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_START_NV        8C84h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_NV         8C85h
#define  GL_TRANSFORM_FEEDBACK_RECORD_NV              8C86h
#define  GL_PRIMITIVES_GENERATED_NV                   8C87h
#define  GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_NV  8C88h
#define  GL_RASTERIZER_DISCARD_NV                     8C89h
#define  GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_NV  8C8Ah
#define  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_NV  8C8Bh
#define  GL_INTERLEAVED_ATTRIBS_NV                    8C8Ch
#define  GL_SEPARATE_ATTRIBS_NV                       8C8Dh
#define  GL_TRANSFORM_FEEDBACK_BUFFER_NV              8C8Eh
#define  GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_NV      8C8Fh
;@@ void ( GLuint program, const GLchar *name );
glActiveVaryingNV!: alias function! [
	program     [ GLuint! ]
	name        [ GLstring! ]
]
;@@ void ( GLenum primitiveMode );
glBeginTransformFeedbackNV!: alias function! [
	primitiveMode [ GLenum! ]
]
;@@ void ( GLenum target, GLuint index, GLuint buffer );
glBindBufferBaseNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	buffer      [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index, GLuint buffer, GLintptr offset );
glBindBufferOffsetNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
]
;@@ void ( GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size );
glBindBufferRangeNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
]
;@@ void ( void );
glEndTransformFeedbackNV!: alias function! [
]
;@@ void ( GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name );
glGetActiveVaryingNV!: alias function! [
	program     [ GLuint! ]
	index       [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	size        [ pointer! [GLsizei!] ]
	type        [ pointer! [GLenum!] ]
	name        [ GLstring! ]
]
;@@ void ( GLuint program, GLuint index, GLint *location );
glGetTransformFeedbackVaryingNV!: alias function! [
	program     [ GLuint! ]
	index       [ GLuint! ]
	location    [ pointer! [GLint!] ]
]
;@@ GLint ( GLuint program, const GLchar *name );
glGetVaryingLocationNV!: alias function! [
	program     [ GLuint! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]
;@@ void ( GLuint count, const GLint *attribs, GLenum bufferMode );
glTransformFeedbackAttribsNV!: alias function! [
	count       [ GLuint! ]
	attribs     [ pointer! [GLint!] ]
	bufferMode  [ GLenum! ]
]
;@@ void ( GLuint program, GLsizei count, const GLint *locations, GLenum bufferMode );
glTransformFeedbackVaryingsNV!: alias function! [
	program     [ GLuint! ]
	count       [ GLsizei! ]
	locations   [ pointer! [GLint!] ]
	bufferMode  [ GLenum! ]
]


;-------------------------------------------
;-- GL_NV_transform_feedback2
;-------------------------------------------

#define  GL_NV_transform_feedback2                    1
#define  GL_TRANSFORM_FEEDBACK_NV                     8E22h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED_NV       8E23h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE_NV       8E24h
#define  GL_TRANSFORM_FEEDBACK_BINDING_NV             8E25h
;@@ void ( GLenum target, GLuint id );
glBindTransformFeedbackNV!: alias function! [
	target      [ GLenum! ]
	id          [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* ids );
glDeleteTransformFeedbacksNV!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLenum mode, GLuint id );
glDrawTransformFeedbackNV!: alias function! [
	mode        [ GLenum! ]
	id          [ GLuint! ]
]
;@@ void ( GLsizei n, GLuint* ids );
glGenTransformFeedbacksNV!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ GLboolean ( GLuint id );
glIsTransformFeedbackNV!: alias function! [
	id          [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( void );
glPauseTransformFeedbackNV!: alias function! [
]
;@@ void ( void );
glResumeTransformFeedbackNV!: alias function! [
]


;-------------------------------------------
;-- GL_NV_uniform_buffer_unified_memory
;-------------------------------------------

#define  GL_NV_uniform_buffer_unified_memory          1
#define  GL_UNIFORM_BUFFER_UNIFIED_NV                 936Eh
#define  GL_UNIFORM_BUFFER_ADDRESS_NV                 936Fh
#define  GL_UNIFORM_BUFFER_LENGTH_NV                  9370h


;-------------------------------------------
;-- GL_NV_vdpau_interop
;-------------------------------------------

#define  GL_NV_vdpau_interop                          1
#define  GL_SURFACE_STATE_NV                          86EBh
#define  GL_SURFACE_REGISTERED_NV                     86FDh
#define  GL_SURFACE_MAPPED_NV                         8700h
#define  GL_WRITE_DISCARD_NV                          88BEh
;@@ void ( void );
glVDPAUFiniNV!: alias function! [
]
;@@ void ( GLvdpauSurfaceNV surface, GLenum pname, GLsizei bufSize, GLsizei* length, GLint *values );
glVDPAUGetSurfaceivNV!: alias function! [
	surface     [ GLvdpauSurfaceNV! ]
	pname       [ GLenum! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	values      [ pointer! [GLint!] ]
]
;@@ void ( const void* vdpDevice, const void*getProcAddress );
glVDPAUInitNV!: alias function! [
	vdpDevice   [ pointer! [byte!] ]
	getProcAddress [ pointer! [byte!] ]
]
;@@ void ( GLvdpauSurfaceNV surface );
glVDPAUIsSurfaceNV!: alias function! [
	surface     [ GLvdpauSurfaceNV! ]
]
;@@ void ( GLsizei numSurfaces, const GLvdpauSurfaceNV* surfaces );
glVDPAUMapSurfacesNV!: alias function! [
	numSurfaces [ GLsizei! ]
	surfaces    [ pointer! [GLvdpauSurfaceNV!] ]
]
;@@ GLvdpauSurfaceNV ( const void* vdpSurface, GLenum target, GLsizei numTextureNames, const GLuint *textureNames );
glVDPAURegisterOutputSurfaceNV!: alias function! [
	vdpSurface  [ pointer! [byte!] ]
	target      [ GLenum! ]
	numTextureNames [ GLsizei! ]
	textureNames [ pointer! [GLuint!] ]
	return: [ GLvdpauSurfaceNV! ]

]
;@@ GLvdpauSurfaceNV ( const void* vdpSurface, GLenum target, GLsizei numTextureNames, const GLuint *textureNames );
glVDPAURegisterVideoSurfaceNV!: alias function! [
	vdpSurface  [ pointer! [byte!] ]
	target      [ GLenum! ]
	numTextureNames [ GLsizei! ]
	textureNames [ pointer! [GLuint!] ]
	return: [ GLvdpauSurfaceNV! ]

]
;@@ void ( GLvdpauSurfaceNV surface, GLenum access );
glVDPAUSurfaceAccessNV!: alias function! [
	surface     [ GLvdpauSurfaceNV! ]
	access      [ GLenum! ]
]
;@@ void ( GLsizei numSurface, const GLvdpauSurfaceNV* surfaces );
glVDPAUUnmapSurfacesNV!: alias function! [
	numSurface  [ GLsizei! ]
	surfaces    [ pointer! [GLvdpauSurfaceNV!] ]
]
;@@ void ( GLvdpauSurfaceNV surface );
glVDPAUUnregisterSurfaceNV!: alias function! [
	surface     [ GLvdpauSurfaceNV! ]
]


;-------------------------------------------
;-- GL_NV_vertex_array_range
;-------------------------------------------

#define  GL_NV_vertex_array_range                     1
#define  GL_VERTEX_ARRAY_RANGE_NV                     851Dh
#define  GL_VERTEX_ARRAY_RANGE_LENGTH_NV              851Eh
#define  GL_VERTEX_ARRAY_RANGE_VALID_NV               851Fh
#define  GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV         8520h
#define  GL_VERTEX_ARRAY_RANGE_POINTER_NV             8521h
;@@ void ( void );
glFlushVertexArrayRangeNV!: alias function! [
]
;@@ void ( GLsizei length, void *pointer );
glVertexArrayRangeNV!: alias function! [
	length      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_NV_vertex_array_range2
;-------------------------------------------

#define  GL_NV_vertex_array_range2                    1
#define  GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV       8533h


;-------------------------------------------
;-- GL_NV_vertex_attrib_integer_64bit
;-------------------------------------------

#define  GL_NV_vertex_attrib_integer_64bit            1
;#define  GL_INT64_NV                                  140Eh
;#define  GL_UNSIGNED_INT64_NV                         140Fh
;@@ void ( GLuint index, GLenum pname, GLint64EXT* params );
glGetVertexAttribLi64vNV!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint index, GLenum pname, GLuint64EXT* params );
glGetVertexAttribLui64vNV!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint index, GLint64EXT x );
glVertexAttribL1i64NV!: alias function! [
	index       [ GLuint! ]
	x           [ GLint64EXT! ]
]
;@@ void ( GLuint index, const GLint64EXT* v );
glVertexAttribL1i64vNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint index, GLuint64EXT x );
glVertexAttribL1ui64NV!: alias function! [
	index       [ GLuint! ]
	x           [ GLuint64EXT! ]
]
;@@ void ( GLuint index, const GLuint64EXT* v );
glVertexAttribL1ui64vNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint index, GLint64EXT x, GLint64EXT y );
glVertexAttribL2i64NV!: alias function! [
	index       [ GLuint! ]
	x           [ GLint64EXT! ]
	y           [ GLint64EXT! ]
]
;@@ void ( GLuint index, const GLint64EXT* v );
glVertexAttribL2i64vNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint index, GLuint64EXT x, GLuint64EXT y );
glVertexAttribL2ui64NV!: alias function! [
	index       [ GLuint! ]
	x           [ GLuint64EXT! ]
	y           [ GLuint64EXT! ]
]
;@@ void ( GLuint index, const GLuint64EXT* v );
glVertexAttribL2ui64vNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint index, GLint64EXT x, GLint64EXT y, GLint64EXT z );
glVertexAttribL3i64NV!: alias function! [
	index       [ GLuint! ]
	x           [ GLint64EXT! ]
	y           [ GLint64EXT! ]
	z           [ GLint64EXT! ]
]
;@@ void ( GLuint index, const GLint64EXT* v );
glVertexAttribL3i64vNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint index, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z );
glVertexAttribL3ui64NV!: alias function! [
	index       [ GLuint! ]
	x           [ GLuint64EXT! ]
	y           [ GLuint64EXT! ]
	z           [ GLuint64EXT! ]
]
;@@ void ( GLuint index, const GLuint64EXT* v );
glVertexAttribL3ui64vNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint index, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w );
glVertexAttribL4i64NV!: alias function! [
	index       [ GLuint! ]
	x           [ GLint64EXT! ]
	y           [ GLint64EXT! ]
	z           [ GLint64EXT! ]
	w           [ GLint64EXT! ]
]
;@@ void ( GLuint index, const GLint64EXT* v );
glVertexAttribL4i64vNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLint64EXT-ptr! ]
]
;@@ void ( GLuint index, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w );
glVertexAttribL4ui64NV!: alias function! [
	index       [ GLuint! ]
	x           [ GLuint64EXT! ]
	y           [ GLuint64EXT! ]
	z           [ GLuint64EXT! ]
	w           [ GLuint64EXT! ]
]
;@@ void ( GLuint index, const GLuint64EXT* v );
glVertexAttribL4ui64vNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLuint64EXT-ptr! ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLsizei stride );
glVertexAttribLFormatNV!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_NV_vertex_buffer_unified_memory
;-------------------------------------------

#define  GL_NV_vertex_buffer_unified_memory           1
#define  GL_VERTEX_ATTRIB_ARRAY_UNIFIED_NV            8F1Eh
#define  GL_ELEMENT_ARRAY_UNIFIED_NV                  8F1Fh
#define  GL_VERTEX_ATTRIB_ARRAY_ADDRESS_NV            8F20h
#define  GL_VERTEX_ARRAY_ADDRESS_NV                   8F21h
#define  GL_NORMAL_ARRAY_ADDRESS_NV                   8F22h
#define  GL_COLOR_ARRAY_ADDRESS_NV                    8F23h
#define  GL_INDEX_ARRAY_ADDRESS_NV                    8F24h
#define  GL_TEXTURE_COORD_ARRAY_ADDRESS_NV            8F25h
#define  GL_EDGE_FLAG_ARRAY_ADDRESS_NV                8F26h
#define  GL_SECONDARY_COLOR_ARRAY_ADDRESS_NV          8F27h
#define  GL_FOG_COORD_ARRAY_ADDRESS_NV                8F28h
#define  GL_ELEMENT_ARRAY_ADDRESS_NV                  8F29h
#define  GL_VERTEX_ATTRIB_ARRAY_LENGTH_NV             8F2Ah
#define  GL_VERTEX_ARRAY_LENGTH_NV                    8F2Bh
#define  GL_NORMAL_ARRAY_LENGTH_NV                    8F2Ch
#define  GL_COLOR_ARRAY_LENGTH_NV                     8F2Dh
#define  GL_INDEX_ARRAY_LENGTH_NV                     8F2Eh
#define  GL_TEXTURE_COORD_ARRAY_LENGTH_NV             8F2Fh
#define  GL_EDGE_FLAG_ARRAY_LENGTH_NV                 8F30h
#define  GL_SECONDARY_COLOR_ARRAY_LENGTH_NV           8F31h
#define  GL_FOG_COORD_ARRAY_LENGTH_NV                 8F32h
#define  GL_ELEMENT_ARRAY_LENGTH_NV                   8F33h
#define  GL_DRAW_INDIRECT_UNIFIED_NV                  8F40h
#define  GL_DRAW_INDIRECT_ADDRESS_NV                  8F41h
#define  GL_DRAW_INDIRECT_LENGTH_NV                   8F42h
;@@ void ( GLenum pname, GLuint index, GLuint64EXT address, GLsizeiptr length );
glBufferAddressRangeNV!: alias function! [
	pname       [ GLenum! ]
	index       [ GLuint! ]
	address     [ GLuint64EXT! ]
	length      [ GLsizeiptr! ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride );
glColorFormatNV!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLsizei stride );
glEdgeFlagFormatNV!: alias function! [
	stride      [ GLsizei! ]
]
;@@ void ( GLenum type, GLsizei stride );
glFogCoordFormatNV!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLenum value, GLuint index, GLuint64EXT result[] );
glGetIntegerui64i_vNV!: alias function! [
	value       [ GLenum! ]
	index       [ GLuint! ]
	result      [ pointer! [GLuint64EXT!] ] ;@@[]
]
;@@ void ( GLenum type, GLsizei stride );
glIndexFormatNV!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLenum type, GLsizei stride );
glNormalFormatNV!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride );
glSecondaryColorFormatNV!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride );
glTexCoordFormatNV!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride );
glVertexAttribFormatNV!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLsizei stride );
glVertexAttribIFormatNV!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride );
glVertexFormatNV!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
]


;-------------------------------------------
;-- GL_NV_vertex_program
;-------------------------------------------

#define  GL_NV_vertex_program                         1
#define  GL_VERTEX_PROGRAM_NV                         8620h
#define  GL_VERTEX_STATE_PROGRAM_NV                   8621h
#define  GL_ATTRIB_ARRAY_SIZE_NV                      8623h
#define  GL_ATTRIB_ARRAY_STRIDE_NV                    8624h
#define  GL_ATTRIB_ARRAY_TYPE_NV                      8625h
#define  GL_CURRENT_ATTRIB_NV                         8626h
#define  GL_PROGRAM_LENGTH_NV                         8627h
#define  GL_PROGRAM_STRING_NV                         8628h
#define  GL_MODELVIEW_PROJECTION_NV                   8629h
#define  GL_IDENTITY_NV                               862Ah
#define  GL_INVERSE_NV                                862Bh
#define  GL_TRANSPOSE_NV                              862Ch
#define  GL_INVERSE_TRANSPOSE_NV                      862Dh
#define  GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV           862Eh
#define  GL_MAX_TRACK_MATRICES_NV                     862Fh
#define  GL_MATRIX0_NV                                8630h
#define  GL_MATRIX1_NV                                8631h
#define  GL_MATRIX2_NV                                8632h
#define  GL_MATRIX3_NV                                8633h
#define  GL_MATRIX4_NV                                8634h
#define  GL_MATRIX5_NV                                8635h
#define  GL_MATRIX6_NV                                8636h
#define  GL_MATRIX7_NV                                8637h
#define  GL_CURRENT_MATRIX_STACK_DEPTH_NV             8640h
#define  GL_CURRENT_MATRIX_NV                         8641h
#define  GL_VERTEX_PROGRAM_POINT_SIZE_NV              8642h
#define  GL_VERTEX_PROGRAM_TWO_SIDE_NV                8643h
#define  GL_PROGRAM_PARAMETER_NV                      8644h
#define  GL_ATTRIB_ARRAY_POINTER_NV                   8645h
#define  GL_PROGRAM_TARGET_NV                         8646h
#define  GL_PROGRAM_RESIDENT_NV                       8647h
#define  GL_TRACK_MATRIX_NV                           8648h
#define  GL_TRACK_MATRIX_TRANSFORM_NV                 8649h
#define  GL_VERTEX_PROGRAM_BINDING_NV                 864Ah
#define  GL_PROGRAM_ERROR_POSITION_NV                 864Bh
#define  GL_VERTEX_ATTRIB_ARRAY0_NV                   8650h
#define  GL_VERTEX_ATTRIB_ARRAY1_NV                   8651h
#define  GL_VERTEX_ATTRIB_ARRAY2_NV                   8652h
#define  GL_VERTEX_ATTRIB_ARRAY3_NV                   8653h
#define  GL_VERTEX_ATTRIB_ARRAY4_NV                   8654h
#define  GL_VERTEX_ATTRIB_ARRAY5_NV                   8655h
#define  GL_VERTEX_ATTRIB_ARRAY6_NV                   8656h
#define  GL_VERTEX_ATTRIB_ARRAY7_NV                   8657h
#define  GL_VERTEX_ATTRIB_ARRAY8_NV                   8658h
#define  GL_VERTEX_ATTRIB_ARRAY9_NV                   8659h
#define  GL_VERTEX_ATTRIB_ARRAY10_NV                  865Ah
#define  GL_VERTEX_ATTRIB_ARRAY11_NV                  865Bh
#define  GL_VERTEX_ATTRIB_ARRAY12_NV                  865Ch
#define  GL_VERTEX_ATTRIB_ARRAY13_NV                  865Dh
#define  GL_VERTEX_ATTRIB_ARRAY14_NV                  865Eh
#define  GL_VERTEX_ATTRIB_ARRAY15_NV                  865Fh
#define  GL_MAP1_VERTEX_ATTRIB0_4_NV                  8660h
#define  GL_MAP1_VERTEX_ATTRIB1_4_NV                  8661h
#define  GL_MAP1_VERTEX_ATTRIB2_4_NV                  8662h
#define  GL_MAP1_VERTEX_ATTRIB3_4_NV                  8663h
#define  GL_MAP1_VERTEX_ATTRIB4_4_NV                  8664h
#define  GL_MAP1_VERTEX_ATTRIB5_4_NV                  8665h
#define  GL_MAP1_VERTEX_ATTRIB6_4_NV                  8666h
#define  GL_MAP1_VERTEX_ATTRIB7_4_NV                  8667h
#define  GL_MAP1_VERTEX_ATTRIB8_4_NV                  8668h
#define  GL_MAP1_VERTEX_ATTRIB9_4_NV                  8669h
#define  GL_MAP1_VERTEX_ATTRIB10_4_NV                 866Ah
#define  GL_MAP1_VERTEX_ATTRIB11_4_NV                 866Bh
#define  GL_MAP1_VERTEX_ATTRIB12_4_NV                 866Ch
#define  GL_MAP1_VERTEX_ATTRIB13_4_NV                 866Dh
#define  GL_MAP1_VERTEX_ATTRIB14_4_NV                 866Eh
#define  GL_MAP1_VERTEX_ATTRIB15_4_NV                 866Fh
#define  GL_MAP2_VERTEX_ATTRIB0_4_NV                  8670h
#define  GL_MAP2_VERTEX_ATTRIB1_4_NV                  8671h
#define  GL_MAP2_VERTEX_ATTRIB2_4_NV                  8672h
#define  GL_MAP2_VERTEX_ATTRIB3_4_NV                  8673h
#define  GL_MAP2_VERTEX_ATTRIB4_4_NV                  8674h
#define  GL_MAP2_VERTEX_ATTRIB5_4_NV                  8675h
#define  GL_MAP2_VERTEX_ATTRIB6_4_NV                  8676h
#define  GL_MAP2_VERTEX_ATTRIB7_4_NV                  8677h
#define  GL_MAP2_VERTEX_ATTRIB8_4_NV                  8678h
#define  GL_MAP2_VERTEX_ATTRIB9_4_NV                  8679h
#define  GL_MAP2_VERTEX_ATTRIB10_4_NV                 867Ah
#define  GL_MAP2_VERTEX_ATTRIB11_4_NV                 867Bh
#define  GL_MAP2_VERTEX_ATTRIB12_4_NV                 867Ch
#define  GL_MAP2_VERTEX_ATTRIB13_4_NV                 867Dh
#define  GL_MAP2_VERTEX_ATTRIB14_4_NV                 867Eh
#define  GL_MAP2_VERTEX_ATTRIB15_4_NV                 867Fh
;@@ GLboolean ( GLsizei n, const GLuint* ids, GLboolean *residences );
glAreProgramsResidentNV!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
	residences  [ pointer! [integer!] ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum target, GLuint id );
glBindProgramNV!: alias function! [
	target      [ GLenum! ]
	id          [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* ids );
glDeleteProgramsNV!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLuint id, const GLfloat* params );
glExecuteProgramNV!: alias function! [
	target      [ GLenum! ]
	id          [ GLuint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLsizei n, GLuint* ids );
glGenProgramsNV!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLuint index, GLenum pname, GLdouble* params );
glGetProgramParameterdvNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLuint index, GLenum pname, GLfloat* params );
glGetProgramParameterfvNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint id, GLenum pname, GLubyte* program );
glGetProgramStringNV!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	program     [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint id, GLenum pname, GLint* params );
glGetProgramivNV!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLuint address, GLenum pname, GLint* params );
glGetTrackMatrixivNV!: alias function! [
	target      [ GLenum! ]
	address     [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLenum pname, void** pointer );
glGetVertexAttribPointervNV!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	pointer     [ binary-ptr! ]
]
;@@ void ( GLuint index, GLenum pname, GLdouble* params );
glGetVertexAttribdvNV!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLenum pname, GLfloat* params );
glGetVertexAttribfvNV!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLenum pname, GLint* params );
glGetVertexAttribivNV!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint id );
glIsProgramNV!: alias function! [
	id          [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum target, GLuint id, GLsizei len, const GLubyte* program );
glLoadProgramNV!: alias function! [
	target      [ GLenum! ]
	id          [ GLuint! ]
	len         [ GLsizei! ]
	program     [ pointer! [GLubyte!] ]
]
;@@ void ( GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glProgramParameter4dNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLenum target, GLuint index, const GLdouble* params );
glProgramParameter4dvNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glProgramParameter4fNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( GLenum target, GLuint index, const GLfloat* params );
glProgramParameter4fvNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLuint index, GLsizei num, const GLdouble* params );
glProgramParameters4dvNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	num         [ GLsizei! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLuint index, GLsizei num, const GLfloat* params );
glProgramParameters4fvNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	num         [ GLsizei! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLsizei n, GLuint* ids );
glRequestResidentProgramsNV!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLuint address, GLenum matrix, GLenum transform );
glTrackMatrixNV!: alias function! [
	target      [ GLenum! ]
	address     [ GLuint! ]
	matrix      [ GLenum! ]
	transform   [ GLenum! ]
]
;@@ void ( GLuint index, GLdouble x );
glVertexAttrib1dNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib1dvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x );
glVertexAttrib1fNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib1fvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLshort x );
glVertexAttrib1sNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib1svNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y );
glVertexAttrib2dNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib2dvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y );
glVertexAttrib2fNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib2fvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLshort x, GLshort y );
glVertexAttrib2sNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib2svNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y, GLdouble z );
glVertexAttrib3dNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib3dvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y, GLfloat z );
glVertexAttrib3fNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib3fvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLshort x, GLshort y, GLshort z );
glVertexAttrib3sNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib3svNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glVertexAttrib4dNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib4dvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glVertexAttrib4fNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib4fvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLshort x, GLshort y, GLshort z, GLshort w );
glVertexAttrib4sNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
	w           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib4svNV!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w );
glVertexAttrib4ubNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLubyte! ]
	y           [ GLubyte! ]
	z           [ GLubyte! ]
	w           [ GLubyte! ]
]
;@@ void ( GLuint index, const GLubyte* v );
glVertexAttrib4ubvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLsizei stride, const void *pointer );
glVertexAttribPointerNV!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLuint index, GLsizei n, const GLdouble* v );
glVertexAttribs1dvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLsizei n, const GLfloat* v );
glVertexAttribs1fvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLsizei n, const GLshort* v );
glVertexAttribs1svNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLsizei n, const GLdouble* v );
glVertexAttribs2dvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLsizei n, const GLfloat* v );
glVertexAttribs2fvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLsizei n, const GLshort* v );
glVertexAttribs2svNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLsizei n, const GLdouble* v );
glVertexAttribs3dvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLsizei n, const GLfloat* v );
glVertexAttribs3fvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLsizei n, const GLshort* v );
glVertexAttribs3svNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLsizei n, const GLdouble* v );
glVertexAttribs4dvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLsizei n, const GLfloat* v );
glVertexAttribs4fvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLsizei n, const GLshort* v );
glVertexAttribs4svNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLsizei n, const GLubyte* v );
glVertexAttribs4ubvNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLsizei! ]
	v           [ pointer! [GLubyte!] ]
]


;-------------------------------------------
;-- GL_NV_vertex_program1_1
;-------------------------------------------

#define  GL_NV_vertex_program1_1                      1


;-------------------------------------------
;-- GL_NV_vertex_program2
;-------------------------------------------

#define  GL_NV_vertex_program2                        1


;-------------------------------------------
;-- GL_NV_vertex_program2_option
;-------------------------------------------

#define  GL_NV_vertex_program2_option                 1
;#define  GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV          88F4h
;#define  GL_MAX_PROGRAM_CALL_DEPTH_NV                 88F5h


;-------------------------------------------
;-- GL_NV_vertex_program3
;-------------------------------------------

#define  GL_NV_vertex_program3                        1
#define  MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB           8B4Ch


;-------------------------------------------
;-- GL_NV_vertex_program4
;-------------------------------------------

#define  GL_NV_vertex_program4                        1
#define  GL_VERTEX_ATTRIB_ARRAY_INTEGER_NV            88FDh


;-------------------------------------------
;-- GL_NV_video_capture
;-------------------------------------------

#define  GL_NV_video_capture                          1
#define  GL_VIDEO_BUFFER_NV                           9020h
#define  GL_VIDEO_BUFFER_BINDING_NV                   9021h
#define  GL_FIELD_UPPER_NV                            9022h
#define  GL_FIELD_LOWER_NV                            9023h
#define  GL_NUM_VIDEO_CAPTURE_STREAMS_NV              9024h
#define  GL_NEXT_VIDEO_CAPTURE_BUFFER_STATUS_NV       9025h
#define  GL_VIDEO_CAPTURE_TO_422_SUPPORTED_NV         9026h
#define  GL_LAST_VIDEO_CAPTURE_STATUS_NV              9027h
#define  GL_VIDEO_BUFFER_PITCH_NV                     9028h
#define  GL_VIDEO_COLOR_CONVERSION_MATRIX_NV          9029h
#define  GL_VIDEO_COLOR_CONVERSION_MAX_NV             902Ah
#define  GL_VIDEO_COLOR_CONVERSION_MIN_NV             902Bh
#define  GL_VIDEO_COLOR_CONVERSION_OFFSET_NV          902Ch
#define  GL_VIDEO_BUFFER_INTERNAL_FORMAT_NV           902Dh
#define  GL_PARTIAL_SUCCESS_NV                        902Eh
#define  GL_SUCCESS_NV                                902Fh
#define  GL_FAILURE_NV                                9030h
#define  GL_YCBYCR8_422_NV                            9031h
#define  GL_YCBAYCR8A_4224_NV                         9032h
#define  GL_Z6Y10Z6CB10Z6Y10Z6CR10_422_NV             9033h
#define  GL_Z6Y10Z6CB10Z6A10Z6Y10Z6CR10Z6A10_4224_NV  9034h
#define  GL_Z4Y12Z4CB12Z4Y12Z4CR12_422_NV             9035h
#define  GL_Z4Y12Z4CB12Z4A12Z4Y12Z4CR12Z4A12_4224_NV  9036h
#define  GL_Z4Y12Z4CB12Z4CR12_444_NV                  9037h
#define  GL_VIDEO_CAPTURE_FRAME_WIDTH_NV              9038h
#define  GL_VIDEO_CAPTURE_FRAME_HEIGHT_NV             9039h
#define  GL_VIDEO_CAPTURE_FIELD_UPPER_HEIGHT_NV       903Ah
#define  GL_VIDEO_CAPTURE_FIELD_LOWER_HEIGHT_NV       903Bh
#define  GL_VIDEO_CAPTURE_SURFACE_ORIGIN_NV           903Ch
;@@ void ( GLuint video_capture_slot );
glBeginVideoCaptureNV!: alias function! [
	video_capture_slot [ GLuint! ]
]
;@@ void ( GLuint video_capture_slot, GLuint stream, GLenum frame_region, GLintptrARB offset );
glBindVideoCaptureStreamBufferNV!: alias function! [
	video_capture_slot [ GLuint! ]
	stream      [ GLuint! ]
	frame_region [ GLenum! ]
	offset      [ GLintptrARB! ]
]
;@@ void ( GLuint video_capture_slot, GLuint stream, GLenum frame_region, GLenum target, GLuint texture );
glBindVideoCaptureStreamTextureNV!: alias function! [
	video_capture_slot [ GLuint! ]
	stream      [ GLuint! ]
	frame_region [ GLenum! ]
	target      [ GLenum! ]
	texture     [ GLuint! ]
]
;@@ void ( GLuint video_capture_slot );
glEndVideoCaptureNV!: alias function! [
	video_capture_slot [ GLuint! ]
]
;@@ void ( GLuint video_capture_slot, GLuint stream, GLenum pname, GLdouble* params );
glGetVideoCaptureStreamdvNV!: alias function! [
	video_capture_slot [ GLuint! ]
	stream      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint video_capture_slot, GLuint stream, GLenum pname, GLfloat* params );
glGetVideoCaptureStreamfvNV!: alias function! [
	video_capture_slot [ GLuint! ]
	stream      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint video_capture_slot, GLuint stream, GLenum pname, GLint* params );
glGetVideoCaptureStreamivNV!: alias function! [
	video_capture_slot [ GLuint! ]
	stream      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint video_capture_slot, GLenum pname, GLint* params );
glGetVideoCaptureivNV!: alias function! [
	video_capture_slot [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLenum ( GLuint video_capture_slot, GLuint* sequence_num, GLuint64EXT *capture_time );
glVideoCaptureNV!: alias function! [
	video_capture_slot [ GLuint! ]
	sequence_num [ pointer! [GLuint!] ]
	capture_time [ GLuint64EXT-ptr! ]
	return: [ GLenum! ]

]
;@@ void ( GLuint video_capture_slot, GLuint stream, GLenum pname, const GLdouble* params );
glVideoCaptureStreamParameterdvNV!: alias function! [
	video_capture_slot [ GLuint! ]
	stream      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint video_capture_slot, GLuint stream, GLenum pname, const GLfloat* params );
glVideoCaptureStreamParameterfvNV!: alias function! [
	video_capture_slot [ GLuint! ]
	stream      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint video_capture_slot, GLuint stream, GLenum pname, const GLint* params );
glVideoCaptureStreamParameterivNV!: alias function! [
	video_capture_slot [ GLuint! ]
	stream      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_NV_viewport_array
;-------------------------------------------

#define  GL_NV_viewport_array                         1
;#define  GL_DEPTH_RANGE                               0B70h
;#define  GL_VIEWPORT                                  0BA2h
;#define  GL_SCISSOR_BOX                               0C10h
;#define  GL_SCISSOR_TEST                              0C11h
#define  GL_MAX_VIEWPORTS_NV                          825Bh
#define  GL_VIEWPORT_SUBPIXEL_BITS_NV                 825Ch
#define  GL_VIEWPORT_BOUNDS_RANGE_NV                  825Dh
#define  GL_VIEWPORT_INDEX_PROVOKING_VERTEX_NV        825Fh
;@@ void ( GLuint first, GLsizei count, const GLfloat * v );
glDepthRangeArrayfvNV!: alias function! [
	first       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLfloat n, GLfloat f );
glDepthRangeIndexedfNV!: alias function! [
	index       [ GLuint! ]
	n           [ GLfloat! ]
	f           [ GLfloat! ]
]
;@@ void ( GLenum target, GLuint index );
glDisableiNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index );
glEnableiNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLenum target, GLuint index, GLfloat* data );
glGetFloati_vNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	data        [ pointer! [GLfloat!] ]
]
;@@ GLboolean ( GLenum target, GLuint index );
glIsEnablediNV!: alias function! [
	target      [ GLenum! ]
	index       [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint first, GLsizei count, const GLint * v );
glScissorArrayvNV!: alias function! [
	first       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLint left, GLint bottom, GLsizei width, GLsizei height );
glScissorIndexedNV!: alias function! [
	index       [ GLuint! ]
	left        [ GLint! ]
	bottom      [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLuint index, const GLint * v );
glScissorIndexedvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint first, GLsizei count, const GLfloat * v );
glViewportArrayvNV!: alias function! [
	first       [ GLuint! ]
	count       [ GLsizei! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y, GLfloat w, GLfloat h );
glViewportIndexedfNV!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	w           [ GLfloat! ]
	h           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat * v );
glViewportIndexedfvNV!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_NV_viewport_array2
;-------------------------------------------

#define  GL_NV_viewport_array2                        1


;-------------------------------------------
;-- GL_NV_viewport_swizzle
;-------------------------------------------

#define  GL_NV_viewport_swizzle                       1
#define  GL_VIEWPORT_SWIZZLE_POSITIVE_X_NV            9350h
#define  GL_VIEWPORT_SWIZZLE_NEGATIVE_X_NV            9351h
#define  GL_VIEWPORT_SWIZZLE_POSITIVE_Y_NV            9352h
#define  GL_VIEWPORT_SWIZZLE_NEGATIVE_Y_NV            9353h
#define  GL_VIEWPORT_SWIZZLE_POSITIVE_Z_NV            9354h
#define  GL_VIEWPORT_SWIZZLE_NEGATIVE_Z_NV            9355h
#define  GL_VIEWPORT_SWIZZLE_POSITIVE_W_NV            9356h
#define  GL_VIEWPORT_SWIZZLE_NEGATIVE_W_NV            9357h
#define  GL_VIEWPORT_SWIZZLE_X_NV                     9358h
#define  GL_VIEWPORT_SWIZZLE_Y_NV                     9359h
#define  GL_VIEWPORT_SWIZZLE_Z_NV                     935Ah
#define  GL_VIEWPORT_SWIZZLE_W_NV                     935Bh
;@@ void ( GLuint index, GLenum swizzlex, GLenum swizzley, GLenum swizzlez, GLenum swizzlew );
glViewportSwizzleNV!: alias function! [
	index       [ GLuint! ]
	swizzlex    [ GLenum! ]
	swizzley    [ GLenum! ]
	swizzlez    [ GLenum! ]
	swizzlew    [ GLenum! ]
]
