Red/System [
	Title:   "Red/System OpenGL v3 and newer common functions"
	Author:  "Oldes"
	File: 	 %gl3-common.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

;@@ must manually load used GL extension functions here as Red compiler is not able to do it automatically yet!
glGenVertexArrays:          as glGenVertexArrays!          glfwGetProcAddress "glGenVertexArrays"
glBindVertexArray:          as glBindVertexArray!          glfwGetProcAddress "glBindVertexArray"
glGenBuffers:               as glGenBuffers!               glfwGetProcAddress "glGenBuffers"
glBindBuffer:               as glBindBuffer!               glfwGetProcAddress "glBindBuffer"
glBufferData:               as glBufferData!               glfwGetProcAddress "glBufferData"
glEnableVertexAttribArray:  as glEnableVertexAttribArray!  glfwGetProcAddress "glEnableVertexAttribArray"
glVertexAttribPointer:      as glVertexAttribPointer!      glfwGetProcAddress "glVertexAttribPointer"
glDisableVertexAttribArray: as glDisableVertexAttribArray! glfwGetProcAddress "glDisableVertexAttribArray"
glCreateShader:             as glCreateShader!             glfwGetProcAddress "glCreateShader"
glShaderSource:             as glShaderSource!             glfwGetProcAddress "glShaderSource"
glCompileShader:            as glCompileShader!            glfwGetProcAddress "glCompileShader"
glGetShaderiv:              as glGetShaderiv!              glfwGetProcAddress "glGetShaderiv"
glGetShaderInfoLog:         as glGetShaderInfoLog!         glfwGetProcAddress "glGetShaderInfoLog"
glCreateProgram:            as glCreateProgram!            glfwGetProcAddress "glCreateProgram"
glAttachShader:             as glAttachShader!             glfwGetProcAddress "glAttachShader"
glLinkProgram:              as glLinkProgram!              glfwGetProcAddress "glLinkProgram"
glGetProgramiv:             as glGetProgramiv!             glfwGetProcAddress "glGetProgramiv"
glGetProgramInfoLog:        as glGetProgramInfoLog!        glfwGetProcAddress "glGetProgramInfoLog"
glDetachShader:             as glDetachShader!             glfwGetProcAddress "glDetachShader"
glDeleteShader:             as glDeleteShader!             glfwGetProcAddress "glDeleteShader"
glUseProgram:               as glUseProgram!               glfwGetProcAddress "glUseProgram"
glGetUniformLocation:       as glGetUniformLocation!       glfwGetProcAddress "glGetUniformLocation"
glUniform1f:                as glUniform1f!                glfwGetProcAddress "glUniform1f"
glUniform2f:                as glUniform2f!                glfwGetProcAddress "glUniform2f"
glUniform2d:                as glUniform2d!                glfwGetProcAddress "glUniform2d"
glUniformMatrix4fv:         as glUniformMatrix4fv!         glfwGetProcAddress "glUniformMatrix4fv"

GL-compile-shader: func [
	source [c-string!]
	type   [integer!]
	return: [GLuint!]
	/local shader-id result info-length message source-ref
][
	source-ref: declare string-ptr!
	source-ref/value: source

	shader-id: glCreateShader type
	glShaderSource  shader-id 1 source-ref NULL
	glCompileShader shader-id

	;check result:
	result: GL_FALSE
	info-length: 0
	glGetShaderiv shader-id GL_COMPILE_STATUS :result
	glGetShaderiv shader-id GL_INFO_LOG_LENGTH :info-length
	print-line ["shader result: " result #" "info-length]
	if info-length > 0 [
		message: as c-string! allocate (info-length + 1)
		glGetShaderInfoLog shader-id info-length NULL message
		print-line message
		print-line source
		free as byte-ptr! message
	]
	shader-id
]
GL-compile-program: func[
	vertex   [c-string!]
	fragment [c-string!]
	return: [GLuint!]
	/local
		VertexShaderID FragmentShaderID ProgramID
		result info-length message
][
	VertexShaderID:   GL-compile-shader vertex   GL_VERTEX_SHADER
	FragmentShaderID: GL-compile-shader fragment GL_FRAGMENT_SHADER

	ProgramID: glCreateProgram

	glAttachShader ProgramID VertexShaderID
	glAttachShader ProgramID FragmentShaderID

	glLinkProgram ProgramID

	;check result:
	result: GL_FALSE
	info-length: 0
	glGetProgramiv ProgramID GL_LINK_STATUS :result
	glGetProgramiv ProgramID GL_INFO_LOG_LENGTH :info-length
	print-line ["program result: " result #" "info-length]
	if info-length > 0 [
		message: as c-string! allocate (info-length + 1)
		glGetProgramInfoLog ProgramID info-length NULL message
		print-line message
		free as byte-ptr! message
	]

	glDetachShader ProgramID VertexShaderID
	glDetachShader ProgramID FragmentShaderID
	
	glDeleteShader VertexShaderID
	glDeleteShader FragmentShaderID

	ProgramID
]
