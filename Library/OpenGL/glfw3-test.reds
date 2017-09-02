Red/System [
	Title:   "Red/System glfw3 binding test"
	Author:  "Oldes"
	File: 	 %glfw3-test.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This code is Red/System port of tutorial from:
		http://www.opengl-tutorial.org/beginners-tutorials/tutorial-1-opening-a-window/
		http://www.opengl-tutorial.org/beginners-tutorials/tutorial-2-the-first-triangle/
	}
]

#include %glfw3.reds
#include %gl.reds
;some functions used in this example are defined as ARB extensions
#include %extensions/gl-ARB.reds ;(Extensions officially approved by the OpenGL Architecture Review Board)
;to use these functions, you must manually load them.. see bellow in code.

either 1 = glfwInit [
	print-line "GLFW library initialized"
][  print-line "Failed to initialize GLFW library!" quit -1]

major: 0
minor: 0
rev:   0
glfwGetVersion :major :minor :rev

print-line ["GLFW version: " major #"." minor #"." rev]

glfwWindowHint GLFW_SAMPLES 4 ;4x antialiasing
glfwWindowHint GLFW_CONTEXT_VERSION_MAJOR 3 ;We want OpenGL 3.3
glfwWindowHint GLFW_CONTEXT_VERSION_MINOR 3 ;
glfwWindowHint GLFW_OPENGL_FORWARD_COMPAT GL_TRUE ;To make MacOS happy; should not be needed
glfwWindowHint GLFW_OPENGL_PROFILE GLFW_OPENGL_CORE_PROFILE ;We don't want the old OpenGL 

window: glfwCreateWindow 1024 768 "Tutorial 01" NULL NULL

print-line ["Window: " window]
if NULL = window [
	print-line "Failed to open GLFW window. If you have an Intel GPU, they may not be 3.3 compatible."
	glfwTerminate
	quit -1
]

glfwMakeContextCurrent window ; Initialize GLEW

glewExperimental: true


;@@ must manually load used GL extension functions here as Red compiler is not able to do it automatically yet!
glGenVertexArrays:          as glGenVertexArrays!          glfwGetProcAddress "glGenVertexArrays"
glBindVertexArray:          as glBindVertexArray!          glfwGetProcAddress "glBindVertexArray"
glGenBuffers:               as glGenBuffers!               glfwGetProcAddress "glGenBuffers"
glBindBuffer:               as glBindBuffer!               glfwGetProcAddress "glBindBuffer"
glBufferData:               as glBufferData!               glfwGetProcAddress "glBufferData"
glEnableVertexAttribArray:  as glEnableVertexAttribArray!  glfwGetProcAddress "glEnableVertexAttribArray"
glVertexAttribPointer:      as glVertexAttribPointer!      glfwGetProcAddress "glVertexAttribPointer"
glDisableVertexAttribArray: as glDisableVertexAttribArray! glfwGetProcAddress "glDisableVertexAttribArray"
glGetStringi:               as glGetStringi!               glfwGetProcAddress "glGetStringi"


num-extensions: 0
glGetIntegerv GL_NUM_EXTENSIONS :num-extensions
print-line ["Supported extensions: " num-extensions]
i: 0 while [i < num-extensions][
	i: i + 1
	print-line [#" " i ":^-" as c-string! glGetStringi GL_EXTENSIONS i - 1]
]



glfwSetInputMode window GLFW_STICKY_KEYS GL_TRUE
glClearColor as float32! 1.0  as float32! 0.0 as float32! 0.1 as float32! 0.0

VertexArrayID: 0
glGenVertexArrays 1 :VertexArrayID
glBindVertexArray VertexArrayID

g_vertex_buffer_data: [
	-1.0 -1.0  0.0
	 1.0 -1.0  0.0
	 0.0  1.0  0.0
]
;note that I'm using floats (GL_DOUBLE) in the buffer above than float32 (GL_FLOAT)
;as you would find in C tutorial, because it is more easy to write in Red (now) ...
;but for sure.. in real life these data would be from external source
;and you definitely want to save memory by not using double!

;This will identify our vertex buffer
vertexbuffer: 0 
;Generate 1 buffer, put the resulting identifier in vertexbuffer
glGenBuffers 1 :vertexbuffer 
;The following commands will talk about our 'vertexbuffer' buffer
glBindBuffer GL_ARRAY_BUFFER vertexbuffer
;Give our vertices to OpenGL.
glBufferData GL_ARRAY_BUFFER (size? float!) * size? g_vertex_buffer_data as byte-ptr! g_vertex_buffer_data GL_STATIC_DRAW

forever [
	glClear GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT

	glEnableVertexAttribArray 0
	glBindBuffer GL_ARRAY_BUFFER vertexbuffer
	glVertexAttribPointer 0 3 GL_DOUBLE GL_FALSE 0 NULL

	;Draw the triangle!
	glDrawArrays GL_TRIANGLES 0 3 ;Starting from vertex 0; 3 vertices total -> 1 triangle
	glDisableVertexAttribArray 0
    ;Swap buffers
    glfwSwapBuffers window
    glfwPollEvents

    if any [
    	0 <> glfwWindowShouldClose window
    	GLFW_PRESS = glfwGetKey window GLFW_KEY_ESCAPE
    ][
    	break
    ]
]

glfwTerminate