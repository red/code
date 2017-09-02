Red/System [
	Title:   "Red/System OpenGL WIN extension binding"
	Author:  "Oldes"
	File: 	 %gl-WIN.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_WIN_phong_shading
;-------------------------------------------

#define  GL_WIN_phong_shading                         1
#define  GL_PHONG_WIN                                 80EAh
#define  GL_PHONG_HINT_WIN                            80EBh


;-------------------------------------------
;-- GL_WIN_scene_markerXXX
;-------------------------------------------

#define  GL_WIN_scene_markerXXX                       1


;-------------------------------------------
;-- GL_WIN_specular_fog
;-------------------------------------------

#define  GL_WIN_specular_fog                          1
#define  GL_FOG_SPECULAR_TEXTURE_WIN                  80ECh


;-------------------------------------------
;-- GL_WIN_swap_hint
;-------------------------------------------

#define  GL_WIN_swap_hint                             1
;@@ void ( GLint x, GLint y, GLsizei width, GLsizei height );
glAddSwapHintRectWIN!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
