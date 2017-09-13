Red/System [
	Title:   "Common code for OpenGL examples"
	Author:  "Oldes"
	File: 	 %common.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %../../GLFW/glfw3.reds
#include %../gl.reds

window: declare GLFWwindow!

on-gl-error: func [
	[GLFW3_CALLING]
	error       [integer!]
	description [c-string!]
][
    print-line [ "!!! OpenGL error[" error "] - " description]
]

on-resize: func [
	[GLFW3_CALLING]
	window [GLFWwindow!]
	width  [integer!]
	height [integer!]
][
	print-line ["resize: " width #"x" height]
	glViewport 0 0 width height
	render-scene ;redraw the scene
]

GL-init: func[][
	glfwSetErrorCallback :on-gl-error
	if GL_TRUE <> glfwInit [print-line "Failed to initialize GLFW library!" quit -1]
]

GL-window: func[
	title   [c-string!]
	width   [integer!]
	height  [integer!]
	return: [GLFWwindow!]
][
	window: glfwCreateWindow width height title NULL NULL

	if NULL = window [
		print-line "Failed to open GLFW window."
		glfwTerminate
		quit -1
	]

	glfwSetInputMode window GLFW_STICKY_KEYS GL_TRUE

	window
]

GL-context: does [
	glfwMakeContextCurrent window
	glfwSetFramebufferSizeCallback window :on-resize
	glfwSwapInterval 1
]

GL-close: func[][
	if null <> window [glfwDestroyWindow window]  
	glfwTerminate
]

;this define can be used to quit the main GL loop
#define GL-exit-test [
	if any [
    	0 <> glfwWindowShouldClose window
    	GLFW_PRESS = glfwGetKey window GLFW_KEY_ESCAPE
    ][
    	break
    ]
]