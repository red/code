Red/System [
	Title:   "Red/System OpenGL SGIX extension binding"
	Author:  "Oldes"
	File: 	 %gl-SGIX.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_SGIX_async
;-------------------------------------------

#define  GL_SGIX_async                                1
#define  GL_ASYNC_MARKER_SGIX                         8329h
;@@ void ( GLuint marker );
glAsyncMarkerSGIX!: alias function! [
	marker      [ GLuint! ]
]
;@@ void ( GLuint marker, GLsizei range );
glDeleteAsyncMarkersSGIX!: alias function! [
	marker      [ GLuint! ]
	range       [ GLsizei! ]
]
;@@ GLint ( GLuint* markerp );
glFinishAsyncSGIX!: alias function! [
	markerp     [ pointer! [GLuint!] ]
	return: [ GLint! ]

]
;@@ GLuint ( GLsizei range );
glGenAsyncMarkersSGIX!: alias function! [
	range       [ GLsizei! ]
	return: [ GLuint! ]

]
;@@ GLboolean ( GLuint marker );
glIsAsyncMarkerSGIX!: alias function! [
	marker      [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ GLint ( GLuint* markerp );
glPollAsyncSGIX!: alias function! [
	markerp     [ pointer! [GLuint!] ]
	return: [ GLint! ]

]


;-------------------------------------------
;-- GL_SGIX_async_histogram
;-------------------------------------------

#define  GL_SGIX_async_histogram                      1
#define  GL_ASYNC_HISTOGRAM_SGIX                      832Ch
#define  GL_MAX_ASYNC_HISTOGRAM_SGIX                  832Dh


;-------------------------------------------
;-- GL_SGIX_async_pixel
;-------------------------------------------

#define  GL_SGIX_async_pixel                          1
#define  GL_ASYNC_TEX_IMAGE_SGIX                      835Ch
#define  GL_ASYNC_DRAW_PIXELS_SGIX                    835Dh
#define  GL_ASYNC_READ_PIXELS_SGIX                    835Eh
#define  GL_MAX_ASYNC_TEX_IMAGE_SGIX                  835Fh
#define  GL_MAX_ASYNC_DRAW_PIXELS_SGIX                8360h
#define  GL_MAX_ASYNC_READ_PIXELS_SGIX                8361h


;-------------------------------------------
;-- GL_SGIX_bali_g_instruments
;-------------------------------------------

#define  GL_SGIX_bali_g_instruments                   1
#define  GL_BALI_NUM_TRIS_CULLED_INSTRUMENT           6080h
#define  GL_BALI_NUM_PRIMS_CLIPPED_INSTRUMENT         6081h
#define  GL_BALI_NUM_PRIMS_REJECT_INSTRUMENT          6082h
#define  GL_BALI_NUM_PRIMS_CLIP_RESULT_INSTRUMENT     6083h


;-------------------------------------------
;-- GL_SGIX_bali_r_instruments
;-------------------------------------------

#define  GL_SGIX_bali_r_instruments                   1
#define  GL_BALI_FRAGMENTS_GENERATED_INSTRUMENT       6090h
#define  GL_BALI_DEPTH_PASS_INSTRUMENT                6091h
#define  GL_BALI_R_CHIP_COUNT                         6092h


;-------------------------------------------
;-- GL_SGIX_bali_timer_instruments
;-------------------------------------------

#define  GL_SGIX_bali_timer_instruments               1


;-------------------------------------------
;-- GL_SGIX_blend_alpha_minmax
;-------------------------------------------

#define  GL_SGIX_blend_alpha_minmax                   1
#define  GL_ALPHA_MIN_SGIX                            8320h
#define  GL_ALPHA_MAX_SGIX                            8321h


;-------------------------------------------
;-- GL_SGIX_blend_cadd
;-------------------------------------------

#define  GL_SGIX_blend_cadd                           1
#define  GL_FUNC_COMPLEX_ADD_EXT                      601Ch


;-------------------------------------------
;-- GL_SGIX_blend_cmultiply
;-------------------------------------------

#define  GL_SGIX_blend_cmultiply                      1
#define  GL_FUNC_COMPLEX_MULTIPLY_EXT                 601Bh


;-------------------------------------------
;-- GL_SGIX_calligraphic_fragment
;-------------------------------------------

#define  GL_SGIX_calligraphic_fragment                1


;-------------------------------------------
;-- GL_SGIX_clipmap
;-------------------------------------------

#define  GL_SGIX_clipmap                              1


;-------------------------------------------
;-- GL_SGIX_color_matrix_accuracy
;-------------------------------------------

#define  GL_SGIX_color_matrix_accuracy                1
#define  GL_COLOR_MATRIX_HINT                         8317h


;-------------------------------------------
;-- GL_SGIX_color_table_index_mode
;-------------------------------------------

#define  GL_SGIX_color_table_index_mode               1


;-------------------------------------------
;-- GL_SGIX_complex_polar
;-------------------------------------------

#define  GL_SGIX_complex_polar                        1


;-------------------------------------------
;-- GL_SGIX_convolution_accuracy
;-------------------------------------------

#define  GL_SGIX_convolution_accuracy                 1
#define  GL_CONVOLUTION_HINT_SGIX                     8316h


;-------------------------------------------
;-- GL_SGIX_cube_map
;-------------------------------------------

#define  GL_SGIX_cube_map                             1
#define  GL_ENV_MAP_SGIX                              8340h
#define  GL_CUBE_MAP_SGIX                             8341h
#define  GL_CUBE_MAP_ZP_SGIX                          8342h
#define  GL_CUBE_MAP_ZN_SGIX                          8343h
#define  GL_CUBE_MAP_XN_SGIX                          8344h
#define  GL_CUBE_MAP_XP_SGIX                          8345h
#define  GL_CUBE_MAP_YN_SGIX                          8346h
#define  GL_CUBE_MAP_YP_SGIX                          8347h
#define  GL_CUBE_MAP_BINDING_SGIX                     8348h


;-------------------------------------------
;-- GL_SGIX_cylinder_texgen
;-------------------------------------------

#define  GL_SGIX_cylinder_texgen                      1


;-------------------------------------------
;-- GL_SGIX_datapipe
;-------------------------------------------

#define  GL_SGIX_datapipe                             1
#define  GL_GEOMETRY_BIT                              01h
#define  GL_IMAGE_BIT                                 02h
;@@ void ( GLenum space, GLbitfield mask );
glAddressSpace!: alias function! [
	space       [ GLenum! ]
	mask        [ GLbitfield! ]
]
;@@ GLint ( GLenum space );
glDataPipe!: alias function! [
	space       [ GLenum! ]
	return: [ GLint! ]

]


;-------------------------------------------
;-- GL_SGIX_decimation
;-------------------------------------------

#define  GL_SGIX_decimation                           1


;-------------------------------------------
;-- GL_SGIX_depth_pass_instrument
;-------------------------------------------

#define  GL_SGIX_depth_pass_instrument                1
#define  GL_DEPTH_PASS_INSTRUMENT_SGIX                8310h
#define  GL_DEPTH_PASS_INSTRUMENT_COUNTERS_SGIX       8311h
#define  GL_DEPTH_PASS_INSTRUMENT_MAX_SGIX            8312h


;-------------------------------------------
;-- GL_SGIX_depth_texture
;-------------------------------------------

#define  GL_SGIX_depth_texture                        1
#define  GL_DEPTH_COMPONENT16_SGIX                    81A5h
#define  GL_DEPTH_COMPONENT24_SGIX                    81A6h
#define  GL_DEPTH_COMPONENT32_SGIX                    81A7h


;-------------------------------------------
;-- GL_SGIX_dvc
;-------------------------------------------

#define  GL_SGIX_dvc                                  1


;-------------------------------------------
;-- GL_SGIX_flush_raster
;-------------------------------------------

#define  GL_SGIX_flush_raster                         1
;@@ void ( void );
glFlushRasterSGIX!: alias function! [
]


;-------------------------------------------
;-- GL_SGIX_fog_blend
;-------------------------------------------

#define  GL_SGIX_fog_blend                            1
#define  GL_FOG_BLEND_ALPHA_SGIX                      81FEh
#define  GL_FOG_BLEND_COLOR_SGIX                      81FFh


;-------------------------------------------
;-- GL_SGIX_fog_factor_to_alpha
;-------------------------------------------

#define  GL_SGIX_fog_factor_to_alpha                  1


;-------------------------------------------
;-- GL_SGIX_fog_layers
;-------------------------------------------

#define  GL_SGIX_fog_layers                           1
#define  GL_FOG_TYPE_SGIX                             8323h
#define  GL_UNIFORM_SGIX                              8324h
#define  GL_LAYERED_SGIX                              8325h
#define  GL_FOG_GROUND_PLANE_SGIX                     8326h
#define  GL_FOG_LAYERS_POINTS_SGIX                    8327h
#define  GL_MAX_FOG_LAYERS_POINTS_SGIX                8328h
;@@ void ( GLsizei n, const GLfloat* points );
glFogLayersSGIX!: alias function! [
	n           [ GLsizei! ]
	points      [ pointer! [GLfloat!] ]
]
;@@ void ( GLfloat* points );
glGetFogLayersSGIX!: alias function! [
	points      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_SGIX_fog_offset
;-------------------------------------------

#define  GL_SGIX_fog_offset                           1
#define  GL_FOG_OFFSET_SGIX                           8198h
#define  GL_FOG_OFFSET_VALUE_SGIX                     8199h


;-------------------------------------------
;-- GL_SGIX_fog_patchy
;-------------------------------------------

#define  GL_SGIX_fog_patchy                           1


;-------------------------------------------
;-- GL_SGIX_fog_scale
;-------------------------------------------

#define  GL_SGIX_fog_scale                            1
#define  GL_FOG_SCALE_SGIX                            81FCh
#define  GL_FOG_SCALE_VALUE_SGIX                      81FDh


;-------------------------------------------
;-- GL_SGIX_fog_texture
;-------------------------------------------

#define  GL_SGIX_fog_texture                          1
;@@ void ( GLenum pname );
glTextureFogSGIX!: alias function! [
	pname       [ GLenum! ]
]


;-------------------------------------------
;-- GL_SGIX_fragment_lighting_space
;-------------------------------------------

#define  GL_SGIX_fragment_lighting_space              1
#define  GL_EYE_SPACE_SGIX                            8436h
#define  GL_TANGENT_SPACE_SGIX                        8437h
#define  GL_OBJECT_SPACE_SGIX                         8438h
#define  GL_FRAGMENT_LIGHT_SPACE_SGIX                 843Dh


;-------------------------------------------
;-- GL_SGIX_fragment_specular_lighting
;-------------------------------------------

#define  GL_SGIX_fragment_specular_lighting           1
;@@ void ( GLenum face, GLenum mode );
glFragmentColorMaterialSGIX!: alias function! [
	face        [ GLenum! ]
	mode        [ GLenum! ]
]
;@@ void ( GLenum pname, GLfloat param );
glFragmentLightModelfSGIX!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum pname, GLfloat* params );
glFragmentLightModelfvSGIX!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum pname, GLint param );
glFragmentLightModeliSGIX!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum pname, GLint* params );
glFragmentLightModelivSGIX!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum light, GLenum pname, GLfloat param );
glFragmentLightfSGIX!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum light, GLenum pname, GLfloat* params );
glFragmentLightfvSGIX!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum light, GLenum pname, GLint param );
glFragmentLightiSGIX!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum light, GLenum pname, GLint* params );
glFragmentLightivSGIX!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum face, GLenum pname, const GLfloat param );
glFragmentMaterialfSGIX!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum face, GLenum pname, const GLfloat* params );
glFragmentMaterialfvSGIX!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum face, GLenum pname, const GLint param );
glFragmentMaterialiSGIX!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum face, GLenum pname, const GLint* params );
glFragmentMaterialivSGIX!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum light, GLenum value, GLfloat* data );
glGetFragmentLightfvSGIX!: alias function! [
	light       [ GLenum! ]
	value       [ GLenum! ]
	data        [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum light, GLenum value, GLint* data );
glGetFragmentLightivSGIX!: alias function! [
	light       [ GLenum! ]
	value       [ GLenum! ]
	data        [ pointer! [GLint!] ]
]
;@@ void ( GLenum face, GLenum pname, const GLfloat* data );
glGetFragmentMaterialfvSGIX!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	data        [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum face, GLenum pname, const GLint* data );
glGetFragmentMaterialivSGIX!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	data        [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_SGIX_fragments_instrument
;-------------------------------------------

#define  GL_SGIX_fragments_instrument                 1
#define  GL_FRAGMENTS_INSTRUMENT_SGIX                 8313h
#define  GL_FRAGMENTS_INSTRUMENT_COUNTERS_SGIX        8314h
#define  GL_FRAGMENTS_INSTRUMENT_MAX_SGIX             8315h


;-------------------------------------------
;-- GL_SGIX_framezoom
;-------------------------------------------

#define  GL_SGIX_framezoom                            1
;@@ void ( GLint factor );
glFrameZoomSGIX!: alias function! [
	factor      [ GLint! ]
]


;-------------------------------------------
;-- GL_SGIX_icc_texture
;-------------------------------------------

#define  GL_SGIX_icc_texture                          1
#define  GL_RGB_ICC_SGIX                              8460h
#define  GL_RGBA_ICC_SGIX                             8461h
#define  GL_ALPHA_ICC_SGIX                            8462h
#define  GL_LUMINANCE_ICC_SGIX                        8463h
#define  GL_INTENSITY_ICC_SGIX                        8464h
#define  GL_LUMINANCE_ALPHA_ICC_SGIX                  8465h
#define  GL_R5_G6_B5_ICC_SGIX                         8466h
#define  GL_R5_G6_B5_A8_ICC_SGIX                      8467h
#define  GL_ALPHA16_ICC_SGIX                          8468h
#define  GL_LUMINANCE16_ICC_SGIX                      8469h
#define  GL_INTENSITY16_ICC_SGIX                      846Ah
#define  GL_LUMINANCE16_ALPHA8_ICC_SGIX               846Bh


;-------------------------------------------
;-- GL_SGIX_igloo_interface
;-------------------------------------------

#define  GL_SGIX_igloo_interface                      1
#define  GL_IGLOO_FULLSCREEN_SGIX                     819Eh
#define  GL_IGLOO_VIEWPORT_OFFSET_SGIX                819Fh
#define  GL_IGLOO_SWAPTMESH_SGIX                      81A0h
#define  GL_IGLOO_COLORNORMAL_SGIX                    81A1h
#define  GL_IGLOO_IRISGL_MODE_SGIX                    81A2h
#define  GL_IGLOO_LMC_COLOR_SGIX                      81A3h
#define  GL_IGLOO_TMESHMODE_SGIX                      81A4h
#define  GL_LIGHT31                                   BEADh
;@@ void ( GLenum pname, void *param );
glIglooInterfaceSGIX!: alias function! [
	pname       [ GLenum! ]
	param       [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_SGIX_image_compression
;-------------------------------------------

#define  GL_SGIX_image_compression                    1


;-------------------------------------------
;-- GL_SGIX_impact_pixel_texture
;-------------------------------------------

#define  GL_SGIX_impact_pixel_texture                 1


;-------------------------------------------
;-- GL_SGIX_instrument_error
;-------------------------------------------

#define  GL_SGIX_instrument_error                     1


;-------------------------------------------
;-- GL_SGIX_interlace
;-------------------------------------------

#define  GL_SGIX_interlace                            1
#define  GL_INTERLACE_SGIX                            8094h


;-------------------------------------------
;-- GL_SGIX_ir_instrument1
;-------------------------------------------

#define  GL_SGIX_ir_instrument1                       1


;-------------------------------------------
;-- GL_SGIX_line_quality_hint
;-------------------------------------------

#define  GL_SGIX_line_quality_hint                    1
#define  GL_LINE_QUALITY_HINT_SGIX                    835Bh


;-------------------------------------------
;-- GL_SGIX_list_priority
;-------------------------------------------

#define  GL_SGIX_list_priority                        1


;-------------------------------------------
;-- GL_SGIX_mpeg1
;-------------------------------------------

#define  GL_SGIX_mpeg1                                1
;@@ void ( GLsizei width, GLsizei height, GLsizei n, GLuint* predictors );
glAllocMPEGPredictorsSGIX!: alias function! [
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	n           [ GLsizei! ]
	predictors  [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* predictors );
glDeleteMPEGPredictorsSGIX!: alias function! [
	n           [ GLsizei! ]
	predictors  [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* predictors );
glGenMPEGPredictorsSGIX!: alias function! [
	n           [ GLsizei! ]
	predictors  [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLfloat* params );
glGetMPEGParameterfvSGIX!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetMPEGParameterivSGIX!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum format, GLenum type, void *pixels );
glGetMPEGPredictorSGIX!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLubyte* values );
glGetMPEGQuantTableubv!: alias function! [
	target      [ GLenum! ]
	values      [ pointer! [GLubyte!] ]
]
;@@ GLboolean ( GLuint predictor );
glIsMPEGPredictorSGIX!: alias function! [
	predictor   [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum target, GLenum format, GLenum type, void *pixels );
glMPEGPredictorSGIX!: alias function! [
	target      [ GLenum! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLubyte* values );
glMPEGQuantTableubv!: alias function! [
	target      [ GLenum! ]
	values      [ pointer! [GLubyte!] ]
]
;@@ void ( GLenum target0, GLenum target1 );
glSwapMPEGPredictorsSGIX!: alias function! [
	target0     [ GLenum! ]
	target1     [ GLenum! ]
]


;-------------------------------------------
;-- GL_SGIX_mpeg2
;-------------------------------------------

#define  GL_SGIX_mpeg2                                1


;-------------------------------------------
;-- GL_SGIX_nonlinear_lighting_pervertex
;-------------------------------------------

#define  GL_SGIX_nonlinear_lighting_pervertex         1
;@@ void ( GLenum light, GLenum pname, GLint* terms, GLfloat *data );
glGetNonlinLightfvSGIX!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	terms       [ pointer! [GLint!] ]
	data        [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum face, GLenum pname, GLint* terms, const GLfloat *data );
glGetNonlinMaterialfvSGIX!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	terms       [ pointer! [GLint!] ]
	data        [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum light, GLenum pname, GLint terms, GLfloat* params );
glNonlinLightfvSGIX!: alias function! [
	light       [ GLenum! ]
	pname       [ GLenum! ]
	terms       [ GLint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum face, GLenum pname, GLint terms, const GLfloat* params );
glNonlinMaterialfvSGIX!: alias function! [
	face        [ GLenum! ]
	pname       [ GLenum! ]
	terms       [ GLint! ]
	params      [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_SGIX_nurbs_eval
;-------------------------------------------

#define  GL_SGIX_nurbs_eval                           1
#define  GL_MAP1_VERTEX_3_NURBS_SGIX                  81CBh
#define  GL_MAP1_VERTEX_4_NURBS_SGIX                  81CCh
#define  GL_MAP1_INDEX_NURBS_SGIX                     81CDh
#define  GL_MAP1_COLOR_4_NURBS_SGIX                   81CEh
#define  GL_MAP1_NORMAL_NURBS_SGIX                    81CFh
#define  GL_MAP1_TEXTURE_COORD_1_NURBS_SGIX           81E0h
#define  GL_MAP1_TEXTURE_COORD_2_NURBS_SGIX           81E1h
#define  GL_MAP1_TEXTURE_COORD_3_NURBS_SGIX           81E2h
#define  GL_MAP1_TEXTURE_COORD_4_NURBS_SGIX           81E3h
#define  GL_MAP2_VERTEX_3_NURBS_SGIX                  81E4h
#define  GL_MAP2_VERTEX_4_NURBS_SGIX                  81E5h
#define  GL_MAP2_INDEX_NURBS_SGIX                     81E6h
#define  GL_MAP2_COLOR_4_NURBS_SGIX                   81E7h
#define  GL_MAP2_NORMAL_NURBS_SGIX                    81E8h
#define  GL_MAP2_TEXTURE_COORD_1_NURBS_SGIX           81E9h
#define  GL_MAP2_TEXTURE_COORD_2_NURBS_SGIX           81EAh
#define  GL_MAP2_TEXTURE_COORD_3_NURBS_SGIX           81EBh
#define  GL_MAP2_TEXTURE_COORD_4_NURBS_SGIX           81ECh
#define  GL_NURBS_KNOT_COUNT_SGIX                     81EDh
#define  GL_NURBS_KNOT_VECTOR_SGIX                    81EEh


;-------------------------------------------
;-- GL_SGIX_occlusion_instrument
;-------------------------------------------

#define  GL_SGIX_occlusion_instrument                 1
#define  GL_OCCLUSION_INSTRUMENT_SGIX                 6060h


;-------------------------------------------
;-- GL_SGIX_packed_6bytes
;-------------------------------------------

#define  GL_SGIX_packed_6bytes                        1


;-------------------------------------------
;-- GL_SGIX_pixel_texture
;-------------------------------------------

#define  GL_SGIX_pixel_texture                        1
;@@ void ( GLenum mode );
glPixelTexGenSGIX!: alias function! [
	mode        [ GLenum! ]
]


;-------------------------------------------
;-- GL_SGIX_pixel_texture_bits
;-------------------------------------------

#define  GL_SGIX_pixel_texture_bits                   1


;-------------------------------------------
;-- GL_SGIX_pixel_texture_lod
;-------------------------------------------

#define  GL_SGIX_pixel_texture_lod                    1


;-------------------------------------------
;-- GL_SGIX_pixel_tiles
;-------------------------------------------

#define  GL_SGIX_pixel_tiles                          1


;-------------------------------------------
;-- GL_SGIX_polynomial_ffd
;-------------------------------------------

#define  GL_SGIX_polynomial_ffd                       1
#define  GL_TEXTURE_DEFORMATION_BIT_SGIX              01h
#define  GL_GEOMETRY_DEFORMATION_BIT_SGIX             02h
;@@ void ( GLbitfield mask );
glDeformSGIX!: alias function! [
	mask        [ GLbitfield! ]
]
;@@ void ( GLbitfield mask );
glLoadIdentityDeformationMapSGIX!: alias function! [
	mask        [ GLbitfield! ]
]


;-------------------------------------------
;-- GL_SGIX_quad_mesh
;-------------------------------------------

#define  GL_SGIX_quad_mesh                            1
;@@ void ( GLint breadth );
glMeshBreadthSGIX!: alias function! [
	breadth     [ GLint! ]
]
;@@ void ( GLint stride );
glMeshStrideSGIX!: alias function! [
	stride      [ GLint! ]
]


;-------------------------------------------
;-- GL_SGIX_reference_plane
;-------------------------------------------

#define  GL_SGIX_reference_plane                      1
;@@ void ( const GLdouble* equation );
glReferencePlaneSGIX!: alias function! [
	equation    [ pointer! [GLdouble!] ]
]


;-------------------------------------------
;-- GL_SGIX_resample
;-------------------------------------------

#define  GL_SGIX_resample                             1
#define  GL_PACK_RESAMPLE_SGIX                        842Eh
#define  GL_UNPACK_RESAMPLE_SGIX                      842Fh
#define  GL_RESAMPLE_DECIMATE_SGIX                    8430h
#define  GL_RESAMPLE_REPLICATE_SGIX                   8433h
#define  GL_RESAMPLE_ZERO_FILL_SGIX                   8434h


;-------------------------------------------
;-- GL_SGIX_scalebias_hint
;-------------------------------------------

#define  GL_SGIX_scalebias_hint                       1
#define  GL_SCALEBIAS_HINT_SGIX                       8322h


;-------------------------------------------
;-- GL_SGIX_shadow
;-------------------------------------------

#define  GL_SGIX_shadow                               1
#define  GL_TEXTURE_COMPARE_SGIX                      819Ah
#define  GL_TEXTURE_COMPARE_OPERATOR_SGIX             819Bh
#define  GL_TEXTURE_LEQUAL_R_SGIX                     819Ch
#define  GL_TEXTURE_GEQUAL_R_SGIX                     819Dh


;-------------------------------------------
;-- GL_SGIX_shadow_ambient
;-------------------------------------------

#define  GL_SGIX_shadow_ambient                       1
#define  GL_SHADOW_AMBIENT_SGIX                       80BFh


;-------------------------------------------
;-- GL_SGIX_slim
;-------------------------------------------

#define  GL_SGIX_slim                                 1
#define  GL_PACK_MAX_COMPRESSED_SIZE_SGIX             831Bh
#define  GL_SLIM8U_SGIX                               831Dh
#define  GL_SLIM10U_SGIX                              831Eh
#define  GL_SLIM12S_SGIX                              831Fh


;-------------------------------------------
;-- GL_SGIX_spotlight_cutoff
;-------------------------------------------

#define  GL_SGIX_spotlight_cutoff                     1
#define  GL_SPOT_CUTOFF_DELTA_SGIX                    8193h


;-------------------------------------------
;-- GL_SGIX_sprite
;-------------------------------------------

#define  GL_SGIX_sprite                               1
;@@ void ( GLenum pname, GLfloat param );
glSpriteParameterfSGIX!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum pname, GLfloat* params );
glSpriteParameterfvSGIX!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum pname, GLint param );
glSpriteParameteriSGIX!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum pname, GLint* params );
glSpriteParameterivSGIX!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]


;-------------------------------------------
;-- GL_SGIX_subdiv_patch
;-------------------------------------------

#define  GL_SGIX_subdiv_patch                         1


;-------------------------------------------
;-- GL_SGIX_subsample
;-------------------------------------------

#define  GL_SGIX_subsample                            1
#define  GL_PACK_SUBSAMPLE_RATE_SGIX                  85A0h
#define  GL_UNPACK_SUBSAMPLE_RATE_SGIX                85A1h
#define  GL_PIXEL_SUBSAMPLE_4444_SGIX                 85A2h
#define  GL_PIXEL_SUBSAMPLE_2424_SGIX                 85A3h
#define  GL_PIXEL_SUBSAMPLE_4242_SGIX                 85A4h


;-------------------------------------------
;-- GL_SGIX_tag_sample_buffer
;-------------------------------------------

#define  GL_SGIX_tag_sample_buffer                    1
;@@ void ( void );
glTagSampleBufferSGIX!: alias function! [
]


;-------------------------------------------
;-- GL_SGIX_texture_add_env
;-------------------------------------------

#define  GL_SGIX_texture_add_env                      1


;-------------------------------------------
;-- GL_SGIX_texture_coordinate_clamp
;-------------------------------------------

#define  GL_SGIX_texture_coordinate_clamp             1
#define  GL_TEXTURE_MAX_CLAMP_S_SGIX                  8369h
#define  GL_TEXTURE_MAX_CLAMP_T_SGIX                  836Ah
#define  GL_TEXTURE_MAX_CLAMP_R_SGIX                  836Bh


;-------------------------------------------
;-- GL_SGIX_texture_lod_bias
;-------------------------------------------

#define  GL_SGIX_texture_lod_bias                     1


;-------------------------------------------
;-- GL_SGIX_texture_mipmap_anisotropic
;-------------------------------------------

#define  GL_SGIX_texture_mipmap_anisotropic           1
#define  GL_TEXTURE_MIPMAP_ANISOTROPY_SGIX            832Eh
#define  GL_MAX_MIPMAP_ANISOTROPY_SGIX                832Fh


;-------------------------------------------
;-- GL_SGIX_texture_multi_buffer
;-------------------------------------------

#define  GL_SGIX_texture_multi_buffer                 1
#define  GL_TEXTURE_MULTI_BUFFER_HINT_SGIX            812Eh


;-------------------------------------------
;-- GL_SGIX_texture_phase
;-------------------------------------------

#define  GL_SGIX_texture_phase                        1
#define  GL_PHASE_SGIX                                832Ah


;-------------------------------------------
;-- GL_SGIX_texture_range
;-------------------------------------------

#define  GL_SGIX_texture_range                        1
#define  GL_RGB_SIGNED_SGIX                           85E0h
#define  GL_RGBA_SIGNED_SGIX                          85E1h
#define  GL_ALPHA_SIGNED_SGIX                         85E2h
#define  GL_LUMINANCE_SIGNED_SGIX                     85E3h
#define  GL_INTENSITY_SIGNED_SGIX                     85E4h
#define  GL_LUMINANCE_ALPHA_SIGNED_SGIX               85E5h
#define  GL_RGB16_SIGNED_SGIX                         85E6h
#define  GL_RGBA16_SIGNED_SGIX                        85E7h
#define  GL_ALPHA16_SIGNED_SGIX                       85E8h
#define  GL_LUMINANCE16_SIGNED_SGIX                   85E9h
#define  GL_INTENSITY16_SIGNED_SGIX                   85EAh
#define  GL_LUMINANCE16_ALPHA16_SIGNED_SGIX           85EBh
#define  GL_RGB_EXTENDED_RANGE_SGIX                   85ECh
#define  GL_RGBA_EXTENDED_RANGE_SGIX                  85EDh
#define  GL_ALPHA_EXTENDED_RANGE_SGIX                 85EEh
#define  GL_LUMINANCE_EXTENDED_RANGE_SGIX             85EFh
#define  GL_INTENSITY_EXTENDED_RANGE_SGIX             85F0h
#define  GL_LUMINANCE_ALPHA_EXTENDED_RANGE_SGIX       85F1h
#define  GL_RGB16_EXTENDED_RANGE_SGIX                 85F2h
#define  GL_RGBA16_EXTENDED_RANGE_SGIX                85F3h
#define  GL_ALPHA16_EXTENDED_RANGE_SGIX               85F4h
#define  GL_LUMINANCE16_EXTENDED_RANGE_SGIX           85F5h
#define  GL_INTENSITY16_EXTENDED_RANGE_SGIX           85F6h
#define  GL_LUMINANCE16_ALPHA16_EXTENDED_RANGE_SGIX   85F7h
#define  GL_MIN_LUMINANCE_SGIS                        85F8h
#define  GL_MAX_LUMINANCE_SGIS                        85F9h
#define  GL_MIN_INTENSITY_SGIS                        85FAh
#define  GL_MAX_INTENSITY_SGIS                        85FBh


;-------------------------------------------
;-- GL_SGIX_texture_scale_bias
;-------------------------------------------

#define  GL_SGIX_texture_scale_bias                   1
#define  GL_POST_TEXTURE_FILTER_BIAS_SGIX             8179h
#define  GL_POST_TEXTURE_FILTER_SCALE_SGIX            817Ah
#define  GL_POST_TEXTURE_FILTER_BIAS_RANGE_SGIX       817Bh
#define  GL_POST_TEXTURE_FILTER_SCALE_RANGE_SGIX      817Ch


;-------------------------------------------
;-- GL_SGIX_texture_supersample
;-------------------------------------------

#define  GL_SGIX_texture_supersample                  1


;-------------------------------------------
;-- GL_SGIX_vector_ops
;-------------------------------------------

#define  GL_SGIX_vector_ops                           1
;@@ void ( GLenum operation );
glGetVectorOperationSGIX!: alias function! [
	operation   [ GLenum! ]
]
;@@ void ( GLenum operation );
glVectorOperationSGIX!: alias function! [
	operation   [ GLenum! ]
]


;-------------------------------------------
;-- GL_SGIX_vertex_array_object
;-------------------------------------------

#define  GL_SGIX_vertex_array_object                  1
;@@ GLboolean ( GLsizei n, const GLuint* arrays, GLboolean* residences );
glAreVertexArraysResidentSGIX!: alias function! [
	n           [ GLsizei! ]
	arrays      [ pointer! [GLuint!] ]
	residences  [ pointer! [integer!] ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint array );
glBindVertexArraySGIX!: alias function! [
	array       [ GLuint! ]
]
;@@ void ( GLsizei n, const GLuint* arrays );
glDeleteVertexArraysSGIX!: alias function! [
	n           [ GLsizei! ]
	arrays      [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* arrays );
glGenVertexArraysSGIX!: alias function! [
	n           [ GLsizei! ]
	arrays      [ pointer! [GLuint!] ]
]
;@@ GLboolean ( GLuint array );
glIsVertexArraySGIX!: alias function! [
	array       [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLsizei n, const GLuint* arrays, const GLclampf* priorities );
glPrioritizeVertexArraysSGIX!: alias function! [
	n           [ GLsizei! ]
	arrays      [ pointer! [GLuint!] ]
	priorities  [ pointer! [GLclampf!] ]
]


;-------------------------------------------
;-- GL_SGIX_vertex_preclip
;-------------------------------------------

#define  GL_SGIX_vertex_preclip                       1
#define  GL_VERTEX_PRECLIP_SGIX                       83EEh
#define  GL_VERTEX_PRECLIP_HINT_SGIX                  83EFh


;-------------------------------------------
;-- GL_SGIX_vertex_preclip_hint
;-------------------------------------------

#define  GL_SGIX_vertex_preclip_hint                  1
;#define  GL_VERTEX_PRECLIP_SGIX                       83EEh
;#define  GL_VERTEX_PRECLIP_HINT_SGIX                  83EFh


;-------------------------------------------
;-- GL_SGIX_ycrcb
;-------------------------------------------

#define  GL_SGIX_ycrcb                                1


;-------------------------------------------
;-- GL_SGIX_ycrcb_subsample
;-------------------------------------------

#define  GL_SGIX_ycrcb_subsample                      1


;-------------------------------------------
;-- GL_SGIX_ycrcba
;-------------------------------------------

#define  GL_SGIX_ycrcba                               1
#define  GL_YCRCB_SGIX                                8318h
#define  GL_YCRCBA_SGIX                               8319h
