Red/System [
	Title:   "Red/System glfw3 binding - A library for OpenGL, window and input"
	Author:  "Oldes"
	File: 	 %glfw3.reds
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

glfwTerminate