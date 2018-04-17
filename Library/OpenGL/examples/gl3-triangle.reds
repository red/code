Red/System [
	Title:   "Red/System OpenGL basic triangle example using new OpenGL"
	Author:  "Oldes"
	File:    %gl3-triangle.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This code is Red/System port of tutorial from:
		http://www.opengl-tutorial.org/beginners-tutorials/tutorial-1-opening-a-window/
		http://www.opengl-tutorial.org/beginners-tutorials/tutorial-2-the-first-triangle/
	}
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

GL-window "GL3 triangle" 800 600

GL-context

#include %../gl3-common.reds ;imports common GL3 functions

;background color:
glClearColor .0 .0 .6 .0

VertexArrayID: 0
glGenVertexArrays 1 :VertexArrayID
glBindVertexArray VertexArrayID


vertexData: make-f32-buffer [
	-1.0 -1.0  0.0
	 1.0 -1.0  0.0
	 0.0  1.0  0.0
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
// Input vertex data, different for all executions of this shader.
layout(location = 0) in vec3 vertexPosition_modelspace;
void main() {
	gl_Position.xyz = vertexPosition_modelspace;
	gl_Position.w = 1.0;
}}

fragment-source: {#version 330 core
// Ouput data
out vec3 color;
void main() {
	// Output color = red 
	color = vec3(1,0,0);
}}

programID: GL-compile-program vertex-source fragment-source


render-scene: does [
	glClear GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT

	glUseProgram programID

	glEnableVertexAttribArray 0
	glBindBuffer GL_ARRAY_BUFFER vertexbuffer
	glVertexAttribPointer 0 3 GL_FLOAT GL_FALSE 0 NULL

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