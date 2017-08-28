Red/System [
	Title:   "Red/System glfw3 binding test"
	Author:  "Oldes"
	File: 	 %glfw3-test.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %glfw3.reds

either 1 = glfwInit [
	print-line "GLFW library initialized"
][  print-line "Failed to initialize GLFW library!" quit -1]

major: 0
minor: 0
rev: 0
glfwGetVersion :major :minor :rev

print-line ["GLFW version: " major #"." minor #"." rev]

glfwWindowHint GLFW_SAMPLES 4 ;4x antialiasing
glfwWindowHint GLFW_CONTEXT_VERSION_MAJOR 3 ;We want OpenGL 3.3
glfwWindowHint GLFW_CONTEXT_VERSION_MINOR 3 ;
glfwWindowHint GLFW_OPENGL_FORWARD_COMPAT 1 ;To make MacOS happy; should not be needed
glfwWindowHint GLFW_OPENGL_PROFILE GLFW_OPENGL_CORE_PROFILE ;We don't want the old OpenGL 

window: glfwCreateWindow 1024 768 "Tutorial 01" NULL NULL

print-line ["Window: " window]
if NULL = window [
	print-line "Failed to open GLFW window. If you have an Intel GPU, they may not be 3.3 compatible."
	glfwTerminate
	quit -1
]

glfwMakeContextCurrent window ; Initialize GLEW

glfwTerminate