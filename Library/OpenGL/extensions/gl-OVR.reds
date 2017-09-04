Red/System [
	Title:   "Red/System OpenGL OVR extension binding"
	Author:  "Oldes"
	File: 	 %gl-OVR.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_OVR_multiview
;-------------------------------------------

#define  GL_OVR_multiview                             1
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_NUM_VIEWS_OVR  9630h
#define  GL_MAX_VIEWS_OVR                             9631h
#define  GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_BASE_VIEW_INDEX_OVR  9632h
#define  GL_FRAMEBUFFER_INCOMPLETE_VIEW_TARGETS_OVR   9633h
;@@ void ( GLenum target, GLenum attachment, GLuint texture, GLint level, GLint baseViewIndex, GLsizei numViews );
glFramebufferTextureMultiviewOVR!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	baseViewIndex [ GLint! ]
	numViews    [ GLsizei! ]
]


;-------------------------------------------
;-- GL_OVR_multiview2
;-------------------------------------------

#define  GL_OVR_multiview2                            1


;-------------------------------------------
;-- GL_OVR_multiview_multisampled_render_to_texture
;-------------------------------------------

#define  GL_OVR_multiview_multisampled_render_to_texture  1
;@@ void ( GLenum target, GLenum attachment, GLuint texture, GLint level, GLsizei samples, GLint baseViewIndex, GLsizei numViews );
glFramebufferTextureMultisampleMultiviewOVR!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
	samples     [ GLsizei! ]
	baseViewIndex [ GLint! ]
	numViews    [ GLsizei! ]
]
