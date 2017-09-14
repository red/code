Red/System [
	Title:   "Red/System OpenGL ATI extension binding"
	Author:  "Oldes"
	File: 	 %gl-ATI.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_ATI_draw_buffers
;-------------------------------------------

#define  GL_ATI_draw_buffers                          1
#define  GL_MAX_DRAW_BUFFERS_ATI                      8824h
#define  GL_DRAW_BUFFER0_ATI                          8825h
#define  GL_DRAW_BUFFER1_ATI                          8826h
#define  GL_DRAW_BUFFER2_ATI                          8827h
#define  GL_DRAW_BUFFER3_ATI                          8828h
#define  GL_DRAW_BUFFER4_ATI                          8829h
#define  GL_DRAW_BUFFER5_ATI                          882Ah
#define  GL_DRAW_BUFFER6_ATI                          882Bh
#define  GL_DRAW_BUFFER7_ATI                          882Ch
#define  GL_DRAW_BUFFER8_ATI                          882Dh
#define  GL_DRAW_BUFFER9_ATI                          882Eh
#define  GL_DRAW_BUFFER10_ATI                         882Fh
#define  GL_DRAW_BUFFER11_ATI                         8830h
#define  GL_DRAW_BUFFER12_ATI                         8831h
#define  GL_DRAW_BUFFER13_ATI                         8832h
#define  GL_DRAW_BUFFER14_ATI                         8833h
#define  GL_DRAW_BUFFER15_ATI                         8834h
;@@ void ( GLsizei n, const GLenum* bufs );
glDrawBuffersATI!: alias function! [
	n           [ GLsizei! ]
	bufs        [ pointer! [GLenum!] ]
]


;-------------------------------------------
;-- GL_ATI_element_array
;-------------------------------------------

#define  GL_ATI_element_array                         1
#define  GL_ELEMENT_ARRAY_ATI                         8768h
#define  GL_ELEMENT_ARRAY_TYPE_ATI                    8769h
#define  GL_ELEMENT_ARRAY_POINTER_ATI                 876Ah
;@@ void ( GLenum mode, GLsizei count );
glDrawElementArrayATI!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
]
;@@ void ( GLenum mode, GLuint start, GLuint end, GLsizei count );
glDrawRangeElementArrayATI!: alias function! [
	mode        [ GLenum! ]
	start       [ GLuint! ]
	end         [ GLuint! ]
	count       [ GLsizei! ]
]
;@@ void ( GLenum type, const void *pointer );
glElementPointerATI!: alias function! [
	type        [ GLenum! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_ATI_envmap_bumpmap
;-------------------------------------------

#define  GL_ATI_envmap_bumpmap                        1
#define  GL_BUMP_ROT_MATRIX_ATI                       8775h
#define  GL_BUMP_ROT_MATRIX_SIZE_ATI                  8776h
#define  GL_BUMP_NUM_TEX_UNITS_ATI                    8777h
#define  GL_BUMP_TEX_UNITS_ATI                        8778h
#define  GL_DUDV_ATI                                  8779h
#define  GL_DU8DV8_ATI                                877Ah
#define  GL_BUMP_ENVMAP_ATI                           877Bh
#define  GL_BUMP_TARGET_ATI                           877Ch
;@@ void ( GLenum pname, GLfloat *param );
glGetTexBumpParameterfvATI!: alias function! [
	pname       [ GLenum! ]
	param       [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum pname, GLint *param );
glGetTexBumpParameterivATI!: alias function! [
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLenum pname, GLfloat *param );
glTexBumpParameterfvATI!: alias function! [
	pname       [ GLenum! ]
	param       [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum pname, GLint *param );
glTexBumpParameterivATI!: alias function! [
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_ATI_fragment_shader
;-------------------------------------------

#define  GL_ATI_fragment_shader                       1
#define  GL_2X_BIT_ATI                                00000001h
#define  GL_RED_BIT_ATI                               00000001h
#define  GL_4X_BIT_ATI                                00000002h
#define  GL_COMP_BIT_ATI                              00000002h
#define  GL_GREEN_BIT_ATI                             00000002h
#define  GL_8X_BIT_ATI                                00000004h
#define  GL_BLUE_BIT_ATI                              00000004h
#define  GL_NEGATE_BIT_ATI                            00000004h
#define  GL_BIAS_BIT_ATI                              00000008h
#define  GL_HALF_BIT_ATI                              00000008h
#define  GL_QUARTER_BIT_ATI                           00000010h
#define  GL_EIGHTH_BIT_ATI                            00000020h
#define  GL_SATURATE_BIT_ATI                          00000040h
#define  GL_FRAGMENT_SHADER_ATI                       8920h
#define  GL_REG_0_ATI                                 8921h
#define  GL_REG_1_ATI                                 8922h
#define  GL_REG_2_ATI                                 8923h
#define  GL_REG_3_ATI                                 8924h
#define  GL_REG_4_ATI                                 8925h
#define  GL_REG_5_ATI                                 8926h
#define  GL_CON_0_ATI                                 8941h
#define  GL_CON_1_ATI                                 8942h
#define  GL_CON_2_ATI                                 8943h
#define  GL_CON_3_ATI                                 8944h
#define  GL_CON_4_ATI                                 8945h
#define  GL_CON_5_ATI                                 8946h
#define  GL_CON_6_ATI                                 8947h
#define  GL_CON_7_ATI                                 8948h
#define  GL_MOV_ATI                                   8961h
#define  GL_ADD_ATI                                   8963h
#define  GL_MUL_ATI                                   8964h
#define  GL_SUB_ATI                                   8965h
#define  GL_DOT3_ATI                                  8966h
#define  GL_DOT4_ATI                                  8967h
#define  GL_MAD_ATI                                   8968h
#define  GL_LERP_ATI                                  8969h
#define  GL_CND_ATI                                   896Ah
#define  GL_CND0_ATI                                  896Bh
#define  GL_DOT2_ADD_ATI                              896Ch
#define  GL_SECONDARY_INTERPOLATOR_ATI                896Dh
#define  GL_NUM_FRAGMENT_REGISTERS_ATI                896Eh
#define  GL_NUM_FRAGMENT_CONSTANTS_ATI                896Fh
#define  GL_NUM_PASSES_ATI                            8970h
#define  GL_NUM_INSTRUCTIONS_PER_PASS_ATI             8971h
#define  GL_NUM_INSTRUCTIONS_TOTAL_ATI                8972h
#define  GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI     8973h
#define  GL_NUM_LOOPBACK_COMPONENTS_ATI               8974h
#define  GL_COLOR_ALPHA_PAIRING_ATI                   8975h
#define  GL_SWIZZLE_STR_ATI                           8976h
#define  GL_SWIZZLE_STQ_ATI                           8977h
#define  GL_SWIZZLE_STR_DR_ATI                        8978h
#define  GL_SWIZZLE_STQ_DQ_ATI                        8979h
#define  GL_SWIZZLE_STRQ_ATI                          897Ah
#define  GL_SWIZZLE_STRQ_DQ_ATI                       897Bh
;@@ void ( GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod );
glAlphaFragmentOp1ATI!: alias function! [
	op          [ GLenum! ]
	dst         [ GLuint! ]
	dstMod      [ GLuint! ]
	arg1        [ GLuint! ]
	arg1Rep     [ GLuint! ]
	arg1Mod     [ GLuint! ]
]
;@@ void ( GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod );
glAlphaFragmentOp2ATI!: alias function! [
	op          [ GLenum! ]
	dst         [ GLuint! ]
	dstMod      [ GLuint! ]
	arg1        [ GLuint! ]
	arg1Rep     [ GLuint! ]
	arg1Mod     [ GLuint! ]
	arg2        [ GLuint! ]
	arg2Rep     [ GLuint! ]
	arg2Mod     [ GLuint! ]
]
;@@ void ( GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod );
glAlphaFragmentOp3ATI!: alias function! [
	op          [ GLenum! ]
	dst         [ GLuint! ]
	dstMod      [ GLuint! ]
	arg1        [ GLuint! ]
	arg1Rep     [ GLuint! ]
	arg1Mod     [ GLuint! ]
	arg2        [ GLuint! ]
	arg2Rep     [ GLuint! ]
	arg2Mod     [ GLuint! ]
	arg3        [ GLuint! ]
	arg3Rep     [ GLuint! ]
	arg3Mod     [ GLuint! ]
]
;@@ void ( void );
glBeginFragmentShaderATI!: alias function! [
]
;@@ void ( GLuint id );
glBindFragmentShaderATI!: alias function! [
	id          [ GLuint! ]
]
;@@ void ( GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod );
glColorFragmentOp1ATI!: alias function! [
	op          [ GLenum! ]
	dst         [ GLuint! ]
	dstMask     [ GLuint! ]
	dstMod      [ GLuint! ]
	arg1        [ GLuint! ]
	arg1Rep     [ GLuint! ]
	arg1Mod     [ GLuint! ]
]
;@@ void ( GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod );
glColorFragmentOp2ATI!: alias function! [
	op          [ GLenum! ]
	dst         [ GLuint! ]
	dstMask     [ GLuint! ]
	dstMod      [ GLuint! ]
	arg1        [ GLuint! ]
	arg1Rep     [ GLuint! ]
	arg1Mod     [ GLuint! ]
	arg2        [ GLuint! ]
	arg2Rep     [ GLuint! ]
	arg2Mod     [ GLuint! ]
]
;@@ void ( GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod );
glColorFragmentOp3ATI!: alias function! [
	op          [ GLenum! ]
	dst         [ GLuint! ]
	dstMask     [ GLuint! ]
	dstMod      [ GLuint! ]
	arg1        [ GLuint! ]
	arg1Rep     [ GLuint! ]
	arg1Mod     [ GLuint! ]
	arg2        [ GLuint! ]
	arg2Rep     [ GLuint! ]
	arg2Mod     [ GLuint! ]
	arg3        [ GLuint! ]
	arg3Rep     [ GLuint! ]
	arg3Mod     [ GLuint! ]
]
;@@ void ( GLuint id );
glDeleteFragmentShaderATI!: alias function! [
	id          [ GLuint! ]
]
;@@ void ( void );
glEndFragmentShaderATI!: alias function! [
]
;@@ GLuint ( GLuint range );
glGenFragmentShadersATI!: alias function! [
	range       [ GLuint! ]
	return: [ GLuint! ]

]
;@@ void ( GLuint dst, GLuint coord, GLenum swizzle );
glPassTexCoordATI!: alias function! [
	dst         [ GLuint! ]
	coord       [ GLuint! ]
	swizzle     [ GLenum! ]
]
;@@ void ( GLuint dst, GLuint interp, GLenum swizzle );
glSampleMapATI!: alias function! [
	dst         [ GLuint! ]
	interp      [ GLuint! ]
	swizzle     [ GLenum! ]
]
;@@ void ( GLuint dst, const GLfloat* value );
glSetFragmentShaderConstantATI!: alias function! [
	dst         [ GLuint! ]
	value       [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_ATI_map_object_buffer
;-------------------------------------------

#define  GL_ATI_map_object_buffer                     1
;@@ void * ( GLuint buffer );
glMapObjectBufferATI!: alias function! [
	buffer      [ GLuint! ]
	return: [ pointer! [byte!] ]

]
;@@ void ( GLuint buffer );
glUnmapObjectBufferATI!: alias function! [
	buffer      [ GLuint! ]
]


;-------------------------------------------
;-- GL_ATI_meminfo
;-------------------------------------------

#define  GL_ATI_meminfo                               1
#define  GL_VBO_FREE_MEMORY_ATI                       87FBh
#define  GL_TEXTURE_FREE_MEMORY_ATI                   87FCh
#define  GL_RENDERBUFFER_FREE_MEMORY_ATI              87FDh


;-------------------------------------------
;-- GL_ATI_pn_triangles
;-------------------------------------------

#define  GL_ATI_pn_triangles                          1
#define  GL_PN_TRIANGLES_ATI                          87F0h
#define  GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI    87F1h
#define  GL_PN_TRIANGLES_POINT_MODE_ATI               87F2h
#define  GL_PN_TRIANGLES_NORMAL_MODE_ATI              87F3h
#define  GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI        87F4h
#define  GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI        87F5h
#define  GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI         87F6h
#define  GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI       87F7h
#define  GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI    87F8h
;@@ void ( GLenum pname, GLfloat param );
glPNTrianglesfATI!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum pname, GLint param );
glPNTrianglesiATI!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]


;-------------------------------------------
;-- GL_ATI_separate_stencil
;-------------------------------------------

#define  GL_ATI_separate_stencil                      1
#define  GL_STENCIL_BACK_FUNC_ATI                     8800h
#define  GL_STENCIL_BACK_FAIL_ATI                     8801h
#define  GL_STENCIL_BACK_PASS_DEPTH_FAIL_ATI          8802h
#define  GL_STENCIL_BACK_PASS_DEPTH_PASS_ATI          8803h
;@@ void ( GLenum frontfunc, GLenum backfunc, GLint ref, GLuint mask );
glStencilFuncSeparateATI!: alias function! [
	frontfunc   [ GLenum! ]
	backfunc    [ GLenum! ]
	ref         [ GLint! ]
	mask        [ GLuint! ]
]
;@@ void ( GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass );
glStencilOpSeparateATI!: alias function! [
	face        [ GLenum! ]
	sfail       [ GLenum! ]
	dpfail      [ GLenum! ]
	dppass      [ GLenum! ]
]


;-------------------------------------------
;-- GL_ATI_shader_texture_lod
;-------------------------------------------

#define  GL_ATI_shader_texture_lod                    1


;-------------------------------------------
;-- GL_ATI_text_fragment_shader
;-------------------------------------------

#define  GL_ATI_text_fragment_shader                  1
#define  GL_TEXT_FRAGMENT_SHADER_ATI                  8200h


;-------------------------------------------
;-- GL_ATI_texture_compression_3dc
;-------------------------------------------

#define  GL_ATI_texture_compression_3dc               1
#define  GL_COMPRESSED_LUMINANCE_ALPHA_3DC_ATI        8837h


;-------------------------------------------
;-- GL_ATI_texture_env_combine3
;-------------------------------------------

#define  GL_ATI_texture_env_combine3                  1
#define  GL_MODULATE_ADD_ATI                          8744h
#define  GL_MODULATE_SIGNED_ADD_ATI                   8745h
#define  GL_MODULATE_SUBTRACT_ATI                     8746h


;-------------------------------------------
;-- GL_ATI_texture_float
;-------------------------------------------

#define  GL_ATI_texture_float                         1
#define  GL_RGBA_FLOAT32_ATI                          8814h
#define  GL_RGB_FLOAT32_ATI                           8815h
#define  GL_ALPHA_FLOAT32_ATI                         8816h
#define  GL_INTENSITY_FLOAT32_ATI                     8817h
#define  GL_LUMINANCE_FLOAT32_ATI                     8818h
#define  GL_LUMINANCE_ALPHA_FLOAT32_ATI               8819h
#define  GL_RGBA_FLOAT16_ATI                          881Ah
#define  GL_RGB_FLOAT16_ATI                           881Bh
#define  GL_ALPHA_FLOAT16_ATI                         881Ch
#define  GL_INTENSITY_FLOAT16_ATI                     881Dh
#define  GL_LUMINANCE_FLOAT16_ATI                     881Eh
#define  GL_LUMINANCE_ALPHA_FLOAT16_ATI               881Fh


;-------------------------------------------
;-- GL_ATI_texture_mirror_once
;-------------------------------------------

#define  GL_ATI_texture_mirror_once                   1
#define  GL_MIRROR_CLAMP_ATI                          8742h
#define  GL_MIRROR_CLAMP_TO_EDGE_ATI                  8743h


;-------------------------------------------
;-- GL_ATI_vertex_array_object
;-------------------------------------------

#define  GL_ATI_vertex_array_object                   1
#define  GL_STATIC_ATI                                8760h
#define  GL_DYNAMIC_ATI                               8761h
#define  GL_PRESERVE_ATI                              8762h
#define  GL_DISCARD_ATI                               8763h
#define  GL_OBJECT_BUFFER_SIZE_ATI                    8764h
#define  GL_OBJECT_BUFFER_USAGE_ATI                   8765h
#define  GL_ARRAY_OBJECT_BUFFER_ATI                   8766h
#define  GL_ARRAY_OBJECT_OFFSET_ATI                   8767h
;@@ void ( GLenum array, GLint size, GLenum type, GLsizei stride, GLuint buffer, GLuint offset );
glArrayObjectATI!: alias function! [
	array       [ GLenum! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	buffer      [ GLuint! ]
	offset      [ GLuint! ]
]
;@@ void ( GLuint buffer );
glFreeObjectBufferATI!: alias function! [
	buffer      [ GLuint! ]
]
;@@ void ( GLenum array, GLenum pname, GLfloat* params );
glGetArrayObjectfvATI!: alias function! [
	array       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum array, GLenum pname, GLint* params );
glGetArrayObjectivATI!: alias function! [
	array       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint buffer, GLenum pname, GLfloat* params );
glGetObjectBufferfvATI!: alias function! [
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint buffer, GLenum pname, GLint* params );
glGetObjectBufferivATI!: alias function! [
	buffer      [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint id, GLenum pname, GLfloat* params );
glGetVariantArrayObjectfvATI!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint id, GLenum pname, GLint* params );
glGetVariantArrayObjectivATI!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint buffer );
glIsObjectBufferATI!: alias function! [
	buffer      [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ GLuint ( GLsizei size, const void *pointer, GLenum usage );
glNewObjectBufferATI!: alias function! [
	size        [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
	usage       [ GLenum! ]
	return: [ GLuint! ]

]
;@@ void ( GLuint buffer, GLuint offset, GLsizei size, const void *pointer, GLenum preserve );
glUpdateObjectBufferATI!: alias function! [
	buffer      [ GLuint! ]
	offset      [ GLuint! ]
	size        [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
	preserve    [ GLenum! ]
]
;@@ void ( GLuint id, GLenum type, GLsizei stride, GLuint buffer, GLuint offset );
glVariantArrayObjectATI!: alias function! [
	id          [ GLuint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	buffer      [ GLuint! ]
	offset      [ GLuint! ]
]


;-------------------------------------------
;-- GL_ATI_vertex_attrib_array_object
;-------------------------------------------

#define  GL_ATI_vertex_attrib_array_object            1
;@@ void ( GLuint index, GLenum pname, GLfloat* params );
glGetVertexAttribArrayObjectfvATI!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLenum pname, GLint* params );
glGetVertexAttribArrayObjectivATI!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, GLuint buffer, GLuint offset );
glVertexAttribArrayObjectATI!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	stride      [ GLsizei! ]
	buffer      [ GLuint! ]
	offset      [ GLuint! ]
]


;-------------------------------------------
;-- GL_ATI_vertex_streams
;-------------------------------------------

#define  GL_ATI_vertex_streams                        1
#define  GL_MAX_VERTEX_STREAMS_ATI                    876Bh
#define  GL_VERTEX_SOURCE_ATI                         876Ch
#define  GL_VERTEX_STREAM0_ATI                        876Dh
#define  GL_VERTEX_STREAM1_ATI                        876Eh
#define  GL_VERTEX_STREAM2_ATI                        876Fh
#define  GL_VERTEX_STREAM3_ATI                        8770h
#define  GL_VERTEX_STREAM4_ATI                        8771h
#define  GL_VERTEX_STREAM5_ATI                        8772h
#define  GL_VERTEX_STREAM6_ATI                        8773h
#define  GL_VERTEX_STREAM7_ATI                        8774h
;@@ void ( GLenum stream );
glClientActiveVertexStreamATI!: alias function! [
	stream      [ GLenum! ]
]
;@@ void ( GLenum stream, GLbyte x, GLbyte y, GLbyte z );
glNormalStream3bATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLbyte! ]
	y           [ GLbyte! ]
	z           [ GLbyte! ]
]
;@@ void ( GLenum stream, const GLbyte *coords );
glNormalStream3bvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLbyte!] ]
]
;@@ void ( GLenum stream, GLdouble x, GLdouble y, GLdouble z );
glNormalStream3dATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLenum stream, const GLdouble *coords );
glNormalStream3dvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum stream, GLfloat x, GLfloat y, GLfloat z );
glNormalStream3fATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( GLenum stream, const GLfloat *coords );
glNormalStream3fvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum stream, GLint x, GLint y, GLint z );
glNormalStream3iATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
]
;@@ void ( GLenum stream, const GLint *coords );
glNormalStream3ivATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLint!] ]
]
;@@ void ( GLenum stream, GLshort x, GLshort y, GLshort z );
glNormalStream3sATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
]
;@@ void ( GLenum stream, const GLshort *coords );
glNormalStream3svATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ GLshort-ptr! ]
]
;@@ void ( GLenum pname, GLfloat param );
glVertexBlendEnvfATI!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum pname, GLint param );
glVertexBlendEnviATI!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum stream, GLdouble x );
glVertexStream1dATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLdouble! ]
]
;@@ void ( GLenum stream, const GLdouble *coords );
glVertexStream1dvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum stream, GLfloat x );
glVertexStream1fATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLfloat! ]
]
;@@ void ( GLenum stream, const GLfloat *coords );
glVertexStream1fvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum stream, GLint x );
glVertexStream1iATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLint! ]
]
;@@ void ( GLenum stream, const GLint *coords );
glVertexStream1ivATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLint!] ]
]
;@@ void ( GLenum stream, GLshort x );
glVertexStream1sATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLshort! ]
]
;@@ void ( GLenum stream, const GLshort *coords );
glVertexStream1svATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ GLshort-ptr! ]
]
;@@ void ( GLenum stream, GLdouble x, GLdouble y );
glVertexStream2dATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( GLenum stream, const GLdouble *coords );
glVertexStream2dvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum stream, GLfloat x, GLfloat y );
glVertexStream2fATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
]
;@@ void ( GLenum stream, const GLfloat *coords );
glVertexStream2fvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum stream, GLint x, GLint y );
glVertexStream2iATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
]
;@@ void ( GLenum stream, const GLint *coords );
glVertexStream2ivATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLint!] ]
]
;@@ void ( GLenum stream, GLshort x, GLshort y );
glVertexStream2sATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
]
;@@ void ( GLenum stream, const GLshort *coords );
glVertexStream2svATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ GLshort-ptr! ]
]
;@@ void ( GLenum stream, GLdouble x, GLdouble y, GLdouble z );
glVertexStream3dATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLenum stream, const GLdouble *coords );
glVertexStream3dvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum stream, GLfloat x, GLfloat y, GLfloat z );
glVertexStream3fATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( GLenum stream, const GLfloat *coords );
glVertexStream3fvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum stream, GLint x, GLint y, GLint z );
glVertexStream3iATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
]
;@@ void ( GLenum stream, const GLint *coords );
glVertexStream3ivATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLint!] ]
]
;@@ void ( GLenum stream, GLshort x, GLshort y, GLshort z );
glVertexStream3sATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
]
;@@ void ( GLenum stream, const GLshort *coords );
glVertexStream3svATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ GLshort-ptr! ]
]
;@@ void ( GLenum stream, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glVertexStream4dATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLenum stream, const GLdouble *coords );
glVertexStream4dvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum stream, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glVertexStream4fATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( GLenum stream, const GLfloat *coords );
glVertexStream4fvATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum stream, GLint x, GLint y, GLint z, GLint w );
glVertexStream4iATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
	w           [ GLint! ]
]
;@@ void ( GLenum stream, const GLint *coords );
glVertexStream4ivATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ pointer! [GLint!] ]
]
;@@ void ( GLenum stream, GLshort x, GLshort y, GLshort z, GLshort w );
glVertexStream4sATI!: alias function! [
	stream      [ GLenum! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
	w           [ GLshort! ]
]
;@@ void ( GLenum stream, const GLshort *coords );
glVertexStream4svATI!: alias function! [
	stream      [ GLenum! ]
	coords      [ GLshort-ptr! ]
]
