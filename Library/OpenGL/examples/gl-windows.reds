Red/System [
	Title:   "Simple multi-window GLFW/OpenGL test"
	Purpose: {
	 This test creates four windows and clears each in a different color  
	 Orginal program by Camilla Berglund <elmindreda@elmindreda.org>
	}
	Author:  "François Jouen, Oldes"
	File:    %gl-windows.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note:    {Based on François Jouen's:
				https://github.com/ldci/glfw-red/blob/master/Samples/redS/windows.reds}
]

#include %common.reds

GL-init

c1: 0.0
c2: 0.0
c3: 0.0

titles:  ["Foo" "Bar" "Baz" "Quux"] ; An array for 4 windows title    
windows: [0 0 0 0]                  ; An array to 4 windows

i: 0
while [i < 4] [
	i: i + 1
	windows/i: as integer! glfwCreateWindow 200 200 as c-string! titles/i NULL NULL
	window:    as int-ptr! windows/i
	glfwMakeContextCurrent window
	c1: as float! ((i - 1) and 1)
	c2: as float! ((i - 1) >> 1)
	either i - 1 = 0 [c3: 1.0 ] [c3: 0.0]
	glClearColor as float32! c1 as float32! c2  as float32! c3 1.0
	glfwSetWindowPos window 100 + ((i - 1 AND 1) * 300) 100 + ((i - 1 >> 1) * 300)
	glfwShowWindow window
]

running: true

while [running][
	i: 0
	while [i < 4][
		i: i + 1 
		window: as int-ptr! windows/i
		glfwMakeContextCurrent window
		glClear GL_COLOR_BUFFER_BIT
		glfwSwapBuffers window
		if (glfwWindowShouldClose window) = GL_TRUE  [running: false] ; Closing any window quits app    
	]
	glfwPollEvents
]

;Let's be nice and destroy all windows before exit
i: 0
while [i < 4] [
	i: i + 1
	glfwDestroyWindow as int-ptr! windows/i
]

glfwTerminate