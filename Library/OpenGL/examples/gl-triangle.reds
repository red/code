Red/System [
	Title:   "Red/System OpenGL triangle example"
	Purpose: "Displaying triangle using old way."
	Author:  "Oldes"
	File:    %gl-triangle.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note:    {Based on François Jouen's:
				https://github.com/ldci/glfw-red/blob/master/Samples/redS/triangle.reds}
]

#include %common.reds

GL-init
GL-window "GL triangle" 800 600
GL-context

render-scene: does [
	glClear GL_COLOR_BUFFER_BIT

	glBegin GL_TRIANGLES
		glColor3ub 255 0 0    glVertex2d -0.75 -0.75
		glColor3ub 0 255 0    glVertex2d  0.0   0.75 
		glColor3ub 0 0 255    glVertex2d  0.75 -0.75
	glEnd
	glFlush

	glfwSwapBuffers window
]

forever [
	render-scene
	glfwPollEvents
	GL-exit-test
]

GL-close