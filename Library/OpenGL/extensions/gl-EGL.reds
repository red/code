Red/System [
	Title:   "Red/System OpenGL EGL extension binding"
	Author:  "Oldes"
	File: 	 %gl-EGL.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_EGL_KHR_context_flush_control
;-------------------------------------------

#define  GL_EGL_KHR_context_flush_control             1


;-------------------------------------------
;-- GL_EGL_NV_robustness_video_memory_purge
;-------------------------------------------

#define  GL_EGL_NV_robustness_video_memory_purge      1
#define  GL_EGL_GENERATE_RESET_ON_VIDEO_MEMORY_PURGE_NV  334Ch
#define  GL_PURGED_CONTEXT_RESET_NV                   92BBh
