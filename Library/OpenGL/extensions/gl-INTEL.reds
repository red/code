Red/System [
	Title:   "Red/System OpenGL INTEL extension binding"
	Author:  "Oldes"
	File: 	 %gl-INTEL.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_INTEL_conservative_rasterization
;-------------------------------------------

#define  GL_INTEL_conservative_rasterization          1
#define  GL_CONSERVATIVE_RASTERIZATION_INTEL          83FEh


;-------------------------------------------
;-- GL_INTEL_fragment_shader_ordering
;-------------------------------------------

#define  GL_INTEL_fragment_shader_ordering            1


;-------------------------------------------
;-- GL_INTEL_framebuffer_CMAA
;-------------------------------------------

#define  GL_INTEL_framebuffer_CMAA                    1


;-------------------------------------------
;-- GL_INTEL_map_texture
;-------------------------------------------

#define  GL_INTEL_map_texture                         1
#define  GL_LAYOUT_DEFAULT_INTEL                      0
#define  GL_LAYOUT_LINEAR_INTEL                       1
#define  GL_LAYOUT_LINEAR_CPU_CACHED_INTEL            2
#define  GL_TEXTURE_MEMORY_LAYOUT_INTEL               83FFh
;@@ void * ( GLuint texture, GLint level, GLbitfield access, GLint* stride, GLenum *layout );
glMapTexture2DINTEL!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
	access      [ GLbitfield! ]
	stride      [ pointer! [GLint!] ]
	layout      [ pointer! [GLenum!] ]
	return: [ pointer! [byte!] ]

]
;@@ void ( GLuint texture );
glSyncTextureINTEL!: alias function! [
	texture     [ GLuint! ]
]
;@@ void ( GLuint texture, GLint level );
glUnmapTexture2DINTEL!: alias function! [
	texture     [ GLuint! ]
	level       [ GLint! ]
]


;-------------------------------------------
;-- GL_INTEL_parallel_arrays
;-------------------------------------------

#define  GL_INTEL_parallel_arrays                     1
#define  GL_PARALLEL_ARRAYS_INTEL                     83F4h
#define  GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL      83F5h
#define  GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL      83F6h
#define  GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL       83F7h
#define  GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL  83F8h
;@@ void ( GLint size, GLenum type, const void** pointer );
glColorPointervINTEL!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	pointer     [ binary-ptr! ]
]
;@@ void ( GLenum type, const void** pointer );
glNormalPointervINTEL!: alias function! [
	type        [ GLenum! ]
	pointer     [ binary-ptr! ]
]
;@@ void ( GLint size, GLenum type, const void** pointer );
glTexCoordPointervINTEL!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	pointer     [ binary-ptr! ]
]
;@@ void ( GLint size, GLenum type, const void** pointer );
glVertexPointervINTEL!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	pointer     [ binary-ptr! ]
]


;-------------------------------------------
;-- GL_INTEL_performance_query
;-------------------------------------------

#define  GL_INTEL_performance_query                   1
#define  GL_PERFQUERY_SINGLE_CONTEXT_INTEL            0000h
#define  GL_PERFQUERY_GLOBAL_CONTEXT_INTEL            0001h
#define  GL_PERFQUERY_DONOT_FLUSH_INTEL               83F9h
#define  GL_PERFQUERY_FLUSH_INTEL                     83FAh
#define  GL_PERFQUERY_WAIT_INTEL                      83FBh
#define  GL_PERFQUERY_COUNTER_EVENT_INTEL             94F0h
#define  GL_PERFQUERY_COUNTER_DURATION_NORM_INTEL     94F1h
#define  GL_PERFQUERY_COUNTER_DURATION_RAW_INTEL      94F2h
#define  GL_PERFQUERY_COUNTER_THROUGHPUT_INTEL        94F3h
#define  GL_PERFQUERY_COUNTER_RAW_INTEL               94F4h
#define  GL_PERFQUERY_COUNTER_TIMESTAMP_INTEL         94F5h
#define  GL_PERFQUERY_COUNTER_DATA_UINT32_INTEL       94F8h
#define  GL_PERFQUERY_COUNTER_DATA_UINT64_INTEL       94F9h
#define  GL_PERFQUERY_COUNTER_DATA_FLOAT_INTEL        94FAh
#define  GL_PERFQUERY_COUNTER_DATA_DOUBLE_INTEL       94FBh
#define  GL_PERFQUERY_COUNTER_DATA_BOOL32_INTEL       94FCh
#define  GL_PERFQUERY_QUERY_NAME_LENGTH_MAX_INTEL     94FDh
#define  GL_PERFQUERY_COUNTER_NAME_LENGTH_MAX_INTEL   94FEh
#define  GL_PERFQUERY_COUNTER_DESC_LENGTH_MAX_INTEL   94FFh
#define  GL_PERFQUERY_GPA_EXTENDED_COUNTERS_INTEL     9500h
;@@ void ( GLuint queryHandle );
glBeginPerfQueryINTEL!: alias function! [
	queryHandle [ GLuint! ]
]
;@@ void ( GLuint queryId, GLuint* queryHandle );
glCreatePerfQueryINTEL!: alias function! [
	queryId     [ GLuint! ]
	queryHandle [ pointer! [GLuint!] ]
]
;@@ void ( GLuint queryHandle );
glDeletePerfQueryINTEL!: alias function! [
	queryHandle [ GLuint! ]
]
;@@ void ( GLuint queryHandle );
glEndPerfQueryINTEL!: alias function! [
	queryHandle [ GLuint! ]
]
;@@ void ( GLuint* queryId );
glGetFirstPerfQueryIdINTEL!: alias function! [
	queryId     [ pointer! [GLuint!] ]
]
;@@ void ( GLuint queryId, GLuint* nextQueryId );
glGetNextPerfQueryIdINTEL!: alias function! [
	queryId     [ GLuint! ]
	nextQueryId [ pointer! [GLuint!] ]
]
;@@ void ( GLuint queryId, GLuint counterId, GLuint counterNameLength, GLchar* counterName, GLuint counterDescLength, GLchar *counterDesc, GLuint *counterOffset, GLuint *counterDataSize, GLuint *counterTypeEnum, GLuint *counterDataTypeEnum, GLuint64 *rawCounterMaxValue );
glGetPerfCounterInfoINTEL!: alias function! [
	queryId     [ GLuint! ]
	counterId   [ GLuint! ]
	counterNameLength [ GLuint! ]
	counterName [ GLstring! ]
	counterDescLength [ GLuint! ]
	counterDesc [ GLstring! ]
	counterOffset [ pointer! [GLuint!] ]
	counterDataSize [ pointer! [GLuint!] ]
	counterTypeEnum [ pointer! [GLuint!] ]
	counterDataTypeEnum [ pointer! [GLuint!] ]
	rawCounterMaxValue [ GLuint64-ptr! ]
]
;@@ void ( GLuint queryHandle, GLuint flags, GLsizei dataSize, void *data, GLuint *bytesWritten );
glGetPerfQueryDataINTEL!: alias function! [
	queryHandle [ GLuint! ]
	flags       [ GLuint! ]
	dataSize    [ GLsizei! ]
	data        [ pointer! [byte!] ]
	bytesWritten [ pointer! [GLuint!] ]
]
;@@ void ( GLchar* queryName, GLuint *queryId );
glGetPerfQueryIdByNameINTEL!: alias function! [
	queryName   [ GLstring! ]
	queryId     [ pointer! [GLuint!] ]
]
;@@ void ( GLuint queryId, GLuint queryNameLength, GLchar* queryName, GLuint *dataSize, GLuint *noCounters, GLuint *noInstances, GLuint *capsMask );
glGetPerfQueryInfoINTEL!: alias function! [
	queryId     [ GLuint! ]
	queryNameLength [ GLuint! ]
	queryName   [ GLstring! ]
	dataSize    [ pointer! [GLuint!] ]
	noCounters  [ pointer! [GLuint!] ]
	noInstances [ pointer! [GLuint!] ]
	capsMask    [ pointer! [GLuint!] ]
]


;-------------------------------------------
;-- GL_INTEL_texture_scissor
;-------------------------------------------

#define  GL_INTEL_texture_scissor                     1
;@@ void ( GLenum target, GLenum lfunc, GLenum hfunc );
glTexScissorFuncINTEL!: alias function! [
	target      [ GLenum! ]
	lfunc       [ GLenum! ]
	hfunc       [ GLenum! ]
]
;@@ void ( GLenum target, GLclampf tlow, GLclampf thigh );
glTexScissorINTEL!: alias function! [
	target      [ GLenum! ]
	tlow        [ GLclampf! ]
	thigh       [ GLclampf! ]
]
