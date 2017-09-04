Red/System [
	Title:   "Red/System OpenGL NVX extension binding"
	Author:  "Oldes"
	File: 	 %gl-NVX.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_NVX_blend_equation_advanced_multi_draw_buffers
;-------------------------------------------

#define  GL_NVX_blend_equation_advanced_multi_draw_buffers  1


;-------------------------------------------
;-- GL_NVX_conditional_render
;-------------------------------------------

#define  GL_NVX_conditional_render                    1
;@@ void ( GLuint id );
glBeginConditionalRenderNVX!: alias function! [
	id          [ GLuint! ]
]
;@@ void ( void );
glEndConditionalRenderNVX!: alias function! [
]


;-------------------------------------------
;-- GL_NVX_gpu_memory_info
;-------------------------------------------

#define  GL_NVX_gpu_memory_info                       1
#define  GL_GPU_MEMORY_INFO_DEDICATED_VIDMEM_NVX      9047h
#define  GL_GPU_MEMORY_INFO_TOTAL_AVAILABLE_MEMORY_NVX  9048h
#define  GL_GPU_MEMORY_INFO_CURRENT_AVAILABLE_VIDMEM_NVX  9049h
#define  GL_GPU_MEMORY_INFO_EVICTION_COUNT_NVX        904Ah
#define  GL_GPU_MEMORY_INFO_EVICTED_MEMORY_NVX        904Bh


;-------------------------------------------
;-- GL_NVX_linked_gpu_multicast
;-------------------------------------------

#define  GL_NVX_linked_gpu_multicast                  1
#define  GL_LGPU_SEPARATE_STORAGE_BIT_NVX             0800h
#define  GL_MAX_LGPU_GPUS_NVX                         92BAh
;@@ void ( GLuint sourceGpu, GLbitfield destinationGpuMask, GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srxY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei width, GLsizei height, GLsizei depth );
glLGPUCopyImageSubDataNVX!: alias function! [
	sourceGpu   [ GLuint! ]
	destinationGpuMask [ GLbitfield! ]
	srcName     [ GLuint! ]
	srcTarget   [ GLenum! ]
	srcLevel    [ GLint! ]
	srcX        [ GLint! ]
	srxY        [ GLint! ]
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
;@@ void ( void );
glLGPUInterlockNVX!: alias function! [
]
;@@ void ( GLbitfield gpuMask, GLuint buffer, GLintptr offset, GLsizeiptr size, const void *data );
glLGPUNamedBufferSubDataNVX!: alias function! [
	gpuMask     [ GLbitfield! ]
	buffer      [ GLuint! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
]
