Red/System [
	Title:   "Common code for OpenGL examples"
	Author:  "Oldes"
	File: 	 %common.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %../../GLFW/glfw3.reds
#include %../vulkan.reds




;-- global variables!
window:   declare GLFWwindow!
instance: 0
appInfo:  declare VkApplicationInfo!
;-----------


VK-init: func[][
	if GLFW_TRUE <> glfwInit [print-line "Failed to initialize GLFW library!" quit -1]
]

VK-window: func[
	title   [c-string!]
	width   [integer!]
	height  [integer!]
	return: [GLFWwindow!]
][
	glfwWindowHint GLFW_CLIENT_API GLFW_NO_API
	glfwWindowHint GLFW_RESIZABLE GLFW_FALSE

	window: glfwCreateWindow width height title NULL NULL

	if NULL = window [
		print-line "Failed to open GLFW window."
		glfwTerminate
		quit -1
	]

	glfwSetInputMode window GLFW_STICKY_KEYS GLFW_TRUE

	window
]

VK-close: func[][
	vkDestroyInstance instance null
	glfwDestroyWindow window   
	glfwTerminate
]

VK-instance: func[
	/local createInfo num i p extensions ext
][
	appInfo/sType:              VK_STRUCTURE_TYPE_APPLICATION_INFO
    appInfo/pApplicationName:   "Hello Triangle"
    appInfo/applicationVersion: VK_MAKE_VERSION(1 0 0)
    appInfo/pEngineName:        "No Engine"
    appInfo/engineVersion:      VK_MAKE_VERSION(1 0 0)
    appInfo/apiVersion:         VK_MAKE_VERSION(1 0 0)

    createInfo: declare VkInstanceCreateInfo!
    createInfo/sType: VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
    createInfo/pApplicationInfo: appInfo

    num: 0
    extensions: glfwGetRequiredInstanceExtensions :num

    print-line ["Vulkan extensions: " num]
    i: 0 p: as int-ptr! extensions
    while [i < num] [
    	ext: as string-ref! p
    	i: i + 1
    	p: p + 1
    	print-line [#" " i ".^-" ext/value]
    ]

    createInfo/enabledExtensionCount: num
    createInfo/ppEnabledExtensionNames: extensions
    createInfo/enabledLayerCount: 0

    if VK_SUCCESS <> vkCreateInstance createInfo null :instance [
    	print-line "Failed to create Vulkan instance!"
    	VK-close
    	quit -1
    ]
    print-line ["Vulkan instance: " as int-ptr! instance]
]

;this define can be used to quit the main Vulkan loop
#define VK-exit-test [
	if any [
    	0 <> glfwWindowShouldClose window
    	GLFW_PRESS = glfwGetKey window GLFW_KEY_ESCAPE
    ][
    	break
    ]
]