Red/System [
	Title:   "Red/System OpenGL ATIX extension binding"
	Author:  "Oldes"
	File: 	 %gl-ATIX.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_ATIX_point_sprites
;-------------------------------------------

#define  GL_ATIX_point_sprites                        1
#define  GL_TEXTURE_POINT_MODE_ATIX                   60B0h
#define  GL_TEXTURE_POINT_ONE_COORD_ATIX              60B1h
#define  GL_TEXTURE_POINT_SPRITE_ATIX                 60B2h
#define  GL_POINT_SPRITE_CULL_MODE_ATIX               60B3h
#define  GL_POINT_SPRITE_CULL_CENTER_ATIX             60B4h
#define  GL_POINT_SPRITE_CULL_CLIP_ATIX               60B5h


;-------------------------------------------
;-- GL_ATIX_texture_env_combine3
;-------------------------------------------

#define  GL_ATIX_texture_env_combine3                 1
#define  GL_MODULATE_ADD_ATIX                         8744h
#define  GL_MODULATE_SIGNED_ADD_ATIX                  8745h
#define  GL_MODULATE_SUBTRACT_ATIX                    8746h


;-------------------------------------------
;-- GL_ATIX_texture_env_route
;-------------------------------------------

#define  GL_ATIX_texture_env_route                    1
#define  GL_SECONDARY_COLOR_ATIX                      8747h
#define  GL_TEXTURE_OUTPUT_RGB_ATIX                   8748h
#define  GL_TEXTURE_OUTPUT_ALPHA_ATIX                 8749h


;-------------------------------------------
;-- GL_ATIX_vertex_shader_output_point_size
;-------------------------------------------

#define  GL_ATIX_vertex_shader_output_point_size      1
#define  GL_OUTPUT_POINT_SIZE_ATIX                    610Eh
