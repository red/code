Red/System [
	Title:   "Red/System OpenGL3 colored and animated cube example"
	Author:  "Oldes"
	File:    %gl3-cube-colored.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note:    {
		This code is based on: http://www.opengl-tutorial.org/beginners-tutorials/tutorial-4-a-colored-cube/
		Related reading: https://learnopengl.com/#!Getting-started/Coordinate-Systems
	}
]

#include %common.reds
#include %../../os/datatypes/typed-array.reds
#include %../../3D-math/matrix-float32.reds

;some functions used in this example are defined as ARB extensions
#include %../extensions/gl-ARB.reds ;(Extensions officially approved by the OpenGL Architecture Review Board)
;to use these functions, you must manually load them.. see bellow in code.

GL-init

glfwWindowHint GLFW_SAMPLES 4 ;4x antialiasing
glfwWindowHint GLFW_CONTEXT_VERSION_MAJOR 3 ;We want OpenGL 3.3
glfwWindowHint GLFW_CONTEXT_VERSION_MINOR 3 ;
glfwWindowHint GLFW_OPENGL_FORWARD_COMPAT GL_TRUE ;To make MacOS happy; should not be needed
glfwWindowHint GLFW_OPENGL_PROFILE GLFW_OPENGL_CORE_PROFILE ;We don't want the old OpenGL 

GL-window "GL3 colored cube" 800 600

GL-context

#include %../gl3-common.reds ;imports common GL3 functions

;background color:
glClearColor .0 .0 .6 .0

;Enable depth test
glEnable GL_DEPTH_TEST
;Accept fragment if it closer to the camera than the former one
glDepthFunc GL_LESS 

VertexArrayID: 0
glGenVertexArrays 1 :VertexArrayID
glBindVertexArray VertexArrayID

vertexData: make-f32-buffer [
	-1.0 -1.0 -1.0 ;triangle 1 : begin
	-1.0 -1.0  1.0
	-1.0  1.0  1.0 ;triangle 1 : end
	 1.0  1.0 -1.0 ;triangle 2 : begin
	-1.0 -1.0 -1.0
	-1.0  1.0 -1.0 ;triangle 2 : end
	 1.0 -1.0  1.0
	-1.0 -1.0 -1.0
	 1.0 -1.0 -1.0
	 1.0  1.0 -1.0
	 1.0 -1.0 -1.0
	-1.0 -1.0 -1.0
	-1.0 -1.0 -1.0
	-1.0  1.0  1.0
	-1.0  1.0 -1.0
	 1.0 -1.0  1.0
	-1.0 -1.0  1.0
	-1.0 -1.0 -1.0
	-1.0  1.0  1.0
	-1.0 -1.0  1.0
	 1.0 -1.0  1.0
	 1.0  1.0  1.0
	 1.0 -1.0 -1.0
	 1.0  1.0 -1.0
	 1.0 -1.0 -1.0
	 1.0  1.0  1.0
	 1.0 -1.0  1.0
	 1.0  1.0  1.0
	 1.0  1.0 -1.0
	-1.0  1.0 -1.0
	 1.0  1.0  1.0
	-1.0  1.0 -1.0
	-1.0  1.0  1.0
	 1.0  1.0  1.0
	-1.0  1.0  1.0
	 1.0 -1.0  1.0
]

;This will identify our vertex buffer
vertexbuffer: 0 
;Generate 1 buffer, put the resulting identifier in vertexbuffer
glGenBuffers 1 :vertexbuffer 
;The following commands will talk about our 'vertexbuffer' buffer
glBindBuffer GL_ARRAY_BUFFER vertexbuffer
;Give our vertices to OpenGL.
glBufferData GL_ARRAY_BUFFER (size? float32!) * vertexData/size vertexData/head GL_STATIC_DRAW

colorData: make-f32-buffer [
	0.583  0.771  0.014
	0.609  0.115  0.436
	0.327  0.483  0.844
	0.822  0.569  0.201
	0.435  0.602  0.223
	0.310  0.747  0.185
	0.597  0.770  0.761
	0.559  0.436  0.730
	0.359  0.583  0.152
	0.483  0.596  0.789
	0.559  0.861  0.639
	0.195  0.548  0.859
	0.014  0.184  0.576
	0.771  0.328  0.970
	0.406  0.615  0.116
	0.676  0.977  0.133
	0.971  0.572  0.833
	0.140  0.616  0.489
	0.997  0.513  0.064
	0.945  0.719  0.592
	0.543  0.021  0.978
	0.279  0.317  0.505
	0.167  0.620  0.077
	0.347  0.857  0.137
	0.055  0.953  0.042
	0.714  0.505  0.345
	0.783  0.290  0.734
	0.722  0.645  0.174
	0.302  0.455  0.848
	0.225  0.587  0.040
	0.517  0.713  0.338
	0.053  0.959  0.120
	0.393  0.621  0.362
	0.673  0.211  0.457
	0.820  0.883  0.371
	0.982  0.099  0.879
]

colorBuffer: 0 
glGenBuffers 1 :colorBuffer
glBindBuffer GL_ARRAY_BUFFER colorBuffer
glBufferData GL_ARRAY_BUFFER (size? float32!) * colorData/size colorData/head GL_STATIC_DRAW

vertex-source: {#version 330 core
// Input vertex data, different for all executions of this shader.
layout(location = 0) in vec3 vertexPosition_modelspace;
layout(location = 1) in vec3 vertexColor;

// Output data ; will be interpolated for each fragment.
out vec3 fragmentColor;
// Values that stay constant for the whole mesh.
uniform mat4  model;
uniform mat4  camera;
uniform mat4  projection;

void main(){
	gl_Position = projection * inverse(camera) * model * vec4(vertexPosition_modelspace,1);

	// The color of each vertex will be interpolated
	// to produce the color of each fragment
	fragmentColor = vertexColor;
}}

fragment-source: {#version 330 core
// Interpolated values from the vertex shaders
in vec3 fragmentColor;

// Ouput data
out vec3 color;

void main(){
	// Output color = color specified in the vertex shader, 
	// interpolated between all 3 surrounding vertices
	color = fragmentColor;

}}

programID: GL-compile-program vertex-source fragment-source


camPosition: vec3f/make 4.0 3.0 3.0 ;Camera is at (4,3,3), in World Space
camTarget:   vec3f/make 0.0 0.0 0.0 ;and looks at the origin
camHead:     vec3f/make 0.0 1.0 0.0 ;Head is up (set to 0 -1 0 to look upside-down)

projection: declare mat4f!
camera:     declare mat4f!
model:      declare mat4f!

;Projection matrix : 60° Field of View, 4:3 ratio, display range : 0.1 unit <-> 100 units
mat4f/perspective projection  TO_RADIANS(60.0) (800.0 / 600.0) 0.1 100.0

;Or, for an ortho camera :
;mat4f/orthographic projection -80.0 80.0 -60.0 60.0 0.0 100.0

;Camera matrix
mat4f/look-at     camera      camPosition camTarget camHead

;Model matrix : an identity matrix (model will be at the origin)
mat4f/identity    model


glUseProgram programID
projectionID: glGetUniformLocation programID "projection"
cameraID:     glGetUniformLocation programID "camera"
modelID:      glGetUniformLocation programID "model"

glUseProgram 0



render-scene: func[
	/local time
] [
	glClear GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT

	glUseProgram programID

	time: glfwGetTime

	;note: bellow code incrementaly adds rotation, so the animation will speed up!
	mat4f/rotate-x model time * 0.001
	mat4f/rotate-y model time * 0.0005
	mat4f/rotate-z model time * 0.002
	;:note

	glUniformMatrix4fv projectionID 1 GL_FALSE as pointer! [float32!] projection
	glUniformMatrix4fv cameraID     1 GL_FALSE as pointer! [float32!] camera
	glUniformMatrix4fv modelID      1 GL_FALSE as pointer! [float32!] model

	;1rst attribute buffer : vertices
	glEnableVertexAttribArray 0
	glBindBuffer GL_ARRAY_BUFFER vertexbuffer
	glVertexAttribPointer 0 3 GL_FLOAT GL_FALSE 0 NULL

	;2nd attribute buffer : colors
	glEnableVertexAttribArray 1
	glBindBuffer GL_ARRAY_BUFFER colorBuffer
	glVertexAttribPointer 1 3 GL_FLOAT GL_FALSE 0 NULL

	;Draw the triangle!
	glDrawArrays GL_TRIANGLES 0 36 ;12*3 indices starting at 0 -> 12 triangles -> 6 squares

	glDisableVertexAttribArray 0
	glDisableVertexAttribArray 1

	;Swap buffers
	glfwSwapBuffers window
]

forever [
	render-scene
	glfwPollEvents

	GL-exit-test
]

GL-close