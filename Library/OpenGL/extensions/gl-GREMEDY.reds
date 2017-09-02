Red/System [
	Title:   "Red/System OpenGL GREMEDY extension binding"
	Author:  "Oldes"
	File: 	 %gl-GREMEDY.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_GREMEDY_frame_terminator
;-------------------------------------------

#define  GL_GREMEDY_frame_terminator                  1
;@@ void ( void );
glFrameTerminatorGREMEDY!: alias function! [
]


;-------------------------------------------
;-- GL_GREMEDY_string_marker
;-------------------------------------------

#define  GL_GREMEDY_string_marker                     1
;@@ void ( GLsizei len, const void *string );
glStringMarkerGREMEDY!: alias function! [
	len         [ GLsizei! ]
	string      [ pointer! [byte!] ]
]
