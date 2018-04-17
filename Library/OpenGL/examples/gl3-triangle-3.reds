Red/System [
	Title:   "Red/System OpenGL moving triangle example"
	Author:  "Oldes"
	File:    %gl3-triangle-3.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note:    {This code is enhanced version of gl3-triangle-2.reds -> the position is computed on GPU}
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

GL-window "GL3 triangle 3 - moving (GPU)" 800 600

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
uniform float   loopDuration;
uniform float   time;
smooth out vec4 theColor;
void main() {
	theColor        = color;

	float timeScale = 3.14159f * 2.0f / loopDuration;
	float currTime  = mod(time, loopDuration);

	vec4 totalOffset = vec4(
        cos(currTime * timeScale) * 0.5f,
        sin(currTime * timeScale) * 0.5f,
        0.0f,
        0.0f);
    
    gl_Position = position + totalOffset;
}}

fragment-source: {#version 330 core
smooth in vec4 theColor;
out vec4 outputColor;
void main() {
	outputColor = theColor;
}}

programID: GL-compile-program vertex-source fragment-source
glUseProgram programID

elapsedTimeUniform: glGetUniformLocation programID "time"
loopDurationUnf:    glGetUniformLocation programID "loopDuration"

glUniform1f loopDurationUnf 5.0

glUseProgram 0

render-scene: does [
	glClear GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT

	glUseProgram programID

	;let the GPU (GLSF) know about current time:
	glUniform1f elapsedTimeUniform as float32! glfwGetTime

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