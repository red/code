Red/System [
	Title:   "Red/System OpenGL INGR extension binding"
	Author:  "Oldes"
	File: 	 %gl-INGR.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_INGR_color_clamp
;-------------------------------------------

#define  GL_INGR_color_clamp                          1
#define  GL_RED_MIN_CLAMP_INGR                        8560h
#define  GL_GREEN_MIN_CLAMP_INGR                      8561h
#define  GL_BLUE_MIN_CLAMP_INGR                       8562h
#define  GL_ALPHA_MIN_CLAMP_INGR                      8563h
#define  GL_RED_MAX_CLAMP_INGR                        8564h
#define  GL_GREEN_MAX_CLAMP_INGR                      8565h
#define  GL_BLUE_MAX_CLAMP_INGR                       8566h
#define  GL_ALPHA_MAX_CLAMP_INGR                      8567h


;-------------------------------------------
;-- GL_INGR_interlace_read
;-------------------------------------------

#define  GL_INGR_interlace_read                       1
#define  GL_INTERLACE_READ_INGR                       8568h
