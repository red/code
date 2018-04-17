Red/System [
	Title:   "Red/System OpenGL moving triangle example"
	Author:  "Oldes"
	File:    %gl3-triangle-2.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note:    {This code is enhanced version of gl3-triangle.reds}
]

#include %common.reds
#include %../../os/datatypes/typed-array.reds

;some functions used in this example are defined as ARB extensions
#include %../extensions/gl-ARB.reds ;(Extensions officially approved by the OpenGL Architecture Review Board)
;to use these functions, you must manually load them.. see bellow in code.

GL-init

glfwWindowHint GLFW_SAMPLES 4 ;4x antialiasing
glfwWindowHint GLFW_CONTEXT_VERSION_MAJOR 3 ;We want OpenGL 3.3
glfwWindowHint GLFW_CONTEXT_VERSION_MINOR 3 ;
glfwWindowHint GLFW_OPENGL_FORWARD_COMPAT GL_TRUE ;To make MacOS happy; should not be needed
glfwWindowHint GLFW_OPENGL_PROFILE GLFW_OPENGL_CORE_PROFILE ;We don't want the old OpenGL 

GL-window "GL3 triangle 2 - moving" 800 600

GL-context

#include %../gl3-common.reds ;imports common GL3 functions

;background color:
glClearColor .0 .0 .6 .0

VertexArrayID: 0
glGenVertexArrays 1 :VertexArrayID
glBindVertexArray VertexArrayID


vertexData: make-f32-buffer [
	-0.5 -0.5  0.0  1.0
	 0.5 -0.5  0.0  1.0
	 0.0  0.5  0.0  1.0

	 1.0  0.0  0.0  1.0
	 0.0  1.0  0.0  1.0
	 0.0  0.0  1.0  1.0
]

;This will identify our vertex buffer
vertexbuffer: 0 
;Generate 1 buffer, put the resulting identifier in vertexbuffer
glGenBuffers 1 :vertexbuffer 
;The following commands will talk about our 'vertexbuffer' buffer
glBindBuffer GL_ARRAY_BUFFER vertexbuffer
;Give our vertices to OpenGL.
glBufferData GL_ARRAY_BUFFER (size? float32!) * vertexData/size vertexData/head GL_STATIC_DRAW


vertex-source: {#version 330 core
layout(location = 0) in vec4 position;
layout(location = 1) in vec4 color;
uniform    vec2 offset;
smooth out vec4 theColor;
void main() {
	theColor         = color;
	vec4 totalOffset = vec4(offset.x, offset.y, 0.0, 0.0);
	gl_Position      = position + totalOffset;
	
}}

fragment-source: {#version 330 core
smooth in vec4 theColor;
out vec4 outputColor;
void main() {
	outputColor = theColor;
}}

programID: GL-compile-program vertex-source fragment-source

offsetLocation: glGetUniformLocation programID "offset"

#define LOOP_DURATION 5.0
#define LOOP_SCALE    1.256637061435917 ;2PI / FLOOP_DURATION

print-line ["offsetLocation: " offsetLocation]

render-scene: func[
	/local alfa
][
	glClear GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT

	glUseProgram programID

	alfa: LOOP_SCALE * fmod glfwGetTime LOOP_DURATION

	glUniform2f offsetLocation as float32! (0.5 * cos alfa) as float32! (0.5 * sin alfa)

	glEnableVertexAttribArray 0
	glEnableVertexAttribArray 1
	glBindBuffer GL_ARRAY_BUFFER vertexbuffer
	glVertexAttribPointer 0 4 GL_FLOAT GL_FALSE 0 NULL
	glVertexAttribPointer 1 4 GL_FLOAT GL_FALSE 0 48

	;Draw the triangle!
	glDrawArrays GL_TRIANGLES 0 3 ;Starting from vertex 0; 3 vertices total -> 1 triangle
	glDisableVertexAttribArray 0
	;Swap buffers
	glfwSwapBuffers window
]

forever [
	render-scene
	glfwPollEvents

	GL-exit-test
]

GL-close