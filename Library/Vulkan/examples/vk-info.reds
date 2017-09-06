Red/System [
	Title:   "Red/System Vulkan info"
	Purpose: "Prints some informations about supported Vulkan driver"
	Author:  "Oldes"
	File: 	 %vk-info.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %common.reds

VK-init

VK-window "Vulkan" 800 600

glfwMakeContextCurrent window

VK-instance






;no main loop in this example

VK-close