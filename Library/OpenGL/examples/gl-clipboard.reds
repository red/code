Red/System [
	Title:   "GLFW Binding: clipboard"
	Purpose: {
	 This program is used to test the clipboard functionality. 
	 Orginal program by Camilla Berglund <elmindreda@elmindreda.org>
	}
	Author:  "François Jouen, Oldes"
	File:    %gl-windows.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note:    {Based on François Jouen's:
				https://github.com/ldci/glfw-red/blob/master/Samples/redS/clipboard.reds}
]

#include %common.reds

on-key: func [
	[GLFW3_CALLING]
	window   [GLFWwindow!]
	key      [integer!]
	scancode [integer!]
	action   [integer!]
	mods     [integer!]
	/local string
] [
	if action <> GLFW_PRESS [exit]
	switch key [
		GLFW_KEY_ESCAPE [
			glfwSetWindowShouldClose window GL_TRUE
		]
		GLFW_KEY_V [
			if mods = GLFW_MOD_CONTROL [
				string: glfwGetClipboardString window
				either 0 < length? string [
					print-line["Clipboard contains " string]
				][	print-line "Clipboard does not contain a string" ]
			]
		]
		GLFW_KEY_C [
			if mods = GLFW_MOD_CONTROL [
				string: "Hello GLFW World!"
				glfwSetClipboardString window string
				print-line ["Setting clipboard to " string]
			]
		]
		default [0] ;do nothing
	]
]

GL-init
GL-window "Clipboard Test [CTRL-C CTRL-V]" 320 240
GL-context

glfwSetKeyCallback window :on-key

glMatrixMode GL_PROJECTION
glOrtho -1.0 1.0 -1.0 1.0 -1.0 1.0
glMatrixMode GL_MODELVIEW
glClearColor 0.5 0.5 0.5 0.0

render-scene: does [
	glClear GL_COLOR_BUFFER_BIT
	glColor3d 0.8 0.2 0.4
	glRectd -0.5 -0.5 0.5 0.5
	glfwSwapBuffers window
]
	
forever [
	render-scene
	glfwWaitEvents
	GL-exit-test
]

GL-close
