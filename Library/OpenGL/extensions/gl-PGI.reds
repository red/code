Red/System [
	Title:   "Red/System OpenGL PGI extension binding"
	Author:  "Oldes"
	File: 	 %gl-PGI.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_PGI_misc_hints
;-------------------------------------------

#define  GL_PGI_misc_hints                            1
#define  GL_PREFER_DOUBLEBUFFER_HINT_PGI              107000
#define  GL_CONSERVE_MEMORY_HINT_PGI                  107005
#define  GL_RECLAIM_MEMORY_HINT_PGI                   107006
#define  GL_NATIVE_GRAPHICS_HANDLE_PGI                107010
#define  GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI            107011
#define  GL_NATIVE_GRAPHICS_END_HINT_PGI              107012
#define  GL_ALWAYS_FAST_HINT_PGI                      107020
#define  GL_ALWAYS_SOFT_HINT_PGI                      107021
#define  GL_ALLOW_DRAW_OBJ_HINT_PGI                   107022
#define  GL_ALLOW_DRAW_WIN_HINT_PGI                   107023
#define  GL_ALLOW_DRAW_FRG_HINT_PGI                   107024
#define  GL_ALLOW_DRAW_MEM_HINT_PGI                   107025
#define  GL_STRICT_DEPTHFUNC_HINT_PGI                 107030
#define  GL_STRICT_LIGHTING_HINT_PGI                  107031
#define  GL_STRICT_SCISSOR_HINT_PGI                   107032
#define  GL_FULL_STIPPLE_HINT_PGI                     107033
#define  GL_CLIP_NEAR_HINT_PGI                        107040
#define  GL_CLIP_FAR_HINT_PGI                         107041
#define  GL_WIDE_LINE_HINT_PGI                        107042
#define  GL_BACK_NORMALS_HINT_PGI                     107043


;-------------------------------------------
;-- GL_PGI_vertex_hints
;-------------------------------------------

#define  GL_PGI_vertex_hints                          1
#define  GL_VERTEX23_BIT_PGI                          00000004h
#define  GL_VERTEX4_BIT_PGI                           00000008h
#define  GL_COLOR3_BIT_PGI                            00010000h
#define  GL_COLOR4_BIT_PGI                            00020000h
#define  GL_EDGEFLAG_BIT_PGI                          00040000h
#define  GL_INDEX_BIT_PGI                             00080000h
#define  GL_MAT_AMBIENT_BIT_PGI                       00100000h
#define  GL_VERTEX_DATA_HINT_PGI                      107050
#define  GL_VERTEX_CONSISTENT_HINT_PGI                107051
#define  GL_MATERIAL_SIDE_HINT_PGI                    107052
#define  GL_MAX_VERTEX_HINT_PGI                       107053
#define  GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI           00200000h
#define  GL_MAT_DIFFUSE_BIT_PGI                       00400000h
#define  GL_MAT_EMISSION_BIT_PGI                      00800000h
#define  GL_MAT_COLOR_INDEXES_BIT_PGI                 01000000h
#define  GL_MAT_SHININESS_BIT_PGI                     02000000h
#define  GL_MAT_SPECULAR_BIT_PGI                      04000000h
#define  GL_NORMAL_BIT_PGI                            08000000h
#define  GL_TEXCOORD1_BIT_PGI                         10000000h
#define  GL_TEXCOORD2_BIT_PGI                         20000000h
#define  GL_TEXCOORD3_BIT_PGI                         40000000h
#define  GL_TEXCOORD4_BIT_PGI                         80000000h
