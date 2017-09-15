Red/System [
	Title:   "Red/System Vulkan binding"
	Author:  "Oldes"
	File: 	 %vulkan.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
This source was generated from vulkan.h file (SDK version 1.0.57.0),
which contains this copyright:

/*
** Copyright (c) 2015-2017 The Khronos Group Inc.
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/
	}
]

#include %../os/definitions.reds ;common aliases and defines

#switch OS [
	Windows   [
		#define VULKAN_LIBRARY "vulkan-1.dll"
		#define VULKAN_CALLING stdcall
	]
	macOS     [
		;@@ can I throw compiler error there?
		print-line "Vulkan is not supported on macOS"
	] 
	#default  [ ;@@ not tested!
		#define VULKAN_LIBRARY "libVulkan.so.1"
		#define VULKAN_CALLING cdecl
	] 
]

;from win32:
#define HINSTANCE!      handle!
#define HWND!           handle!
SECURITY_ATTRIBUTES!: alias struct! [
	nLength [integer!]
	lpSecurityDescriptor [pointer! [integer!]]
	bInheritHandle [logic!]
]

;from X11
#define xcb_visualid_t! integer!
#define VisualID!       integer!
#define RROutput!       integer!

#define MirConnection!  [pointer! [integer!]]
#define MirSurface!     [pointer! [integer!]]


#define VkFlags!        integer! ;uint32_t
#define VkBool32!       integer! ;uint32_t
#define VkDeviceSize!   [uint64! value]  ;uint64_t
#define VkSampleMask!   integer! ;uint32_t

VK_LUID!: alias struct! [a [integer!] b [integer!]] ;8 bytes
VK_UUID!: alias struct! [a [integer!] b [integer!] c [integer!] d [integer!]] ;16 bytes

#define LPCWSTR! [pointer! [integer!]]

;typedef union VkClearColorValue {
;    float       float32[4];
;    int32_t     int32[4];
;    uint32_t    uint32[4];
;} VkClearColorValue;

VkClearColorValue!: alias struct! [
	r [integer!]
	g [integer!]
	b [integer!]
	w [integer!]
]
#define VkClearValue! VkClearColorValue!

;@@ these are just temporary warkaroud of Red/System compiler limitations:

#define __char-256! [struct! [
 v1  [float!] v2  [float!] v3  [float!] v4  [float!] v5  [float!] v6  [float!] v7  [float!] v8  [float!]
 v9  [float!] v10 [float!] v11 [float!] v12 [float!] v13 [float!] v14 [float!] v15 [float!] v16 [float!]
 v17 [float!] v18 [float!] v19 [float!] v20 [float!] v21 [float!] v22 [float!] v23 [float!] v24 [float!]
 v25 [float!] v26 [float!] v27 [float!] v28 [float!] v29 [float!] v30 [float!] v31 [float!] v32 [float!]
] value ]

#define __VkMemoryType-32! [struct! [
 v1  [VkMemoryType! value] v2  [VkMemoryType! value]
 v3  [VkMemoryType! value] v4  [VkMemoryType! value]
 v5  [VkMemoryType! value] v6  [VkMemoryType! value]
 v7  [VkMemoryType! value] v8  [VkMemoryType! value]
 v9  [VkMemoryType! value] v10 [VkMemoryType! value]
 v11 [VkMemoryType! value] v12 [VkMemoryType! value]
 v13 [VkMemoryType! value] v14 [VkMemoryType! value]
 v15 [VkMemoryType! value] v16 [VkMemoryType! value]
 v17 [VkMemoryType! value] v18 [VkMemoryType! value]
 v19 [VkMemoryType! value] v20 [VkMemoryType! value]
 v21 [VkMemoryType! value] v22 [VkMemoryType! value]
 v23 [VkMemoryType! value] v24 [VkMemoryType! value]
 v25 [VkMemoryType! value] v26 [VkMemoryType! value]
 v27 [VkMemoryType! value] v28 [VkMemoryType! value]
 v29 [VkMemoryType! value] v30 [VkMemoryType! value]
 v31 [VkMemoryType! value] v32 [VkMemoryType! value]
] value ]

#define __VkMemoryHeap-16! [struct! [
 v1  [VkMemoryHeap! value] v2  [VkMemoryHeap! value]
 v3  [VkMemoryHeap! value] v4  [VkMemoryHeap! value]
 v5  [VkMemoryHeap! value] v6  [VkMemoryHeap! value]
 v7  [VkMemoryHeap! value] v8  [VkMemoryHeap! value]
 v9  [VkMemoryHeap! value] v10 [VkMemoryHeap! value]
 v11 [VkMemoryHeap! value] v12 [VkMemoryHeap! value]
 v13 [VkMemoryHeap! value] v14 [VkMemoryHeap! value]
 v15 [VkMemoryHeap! value] v16 [VkMemoryHeap! value]
] value ]

#define __int-32! [struct! [
 v1  [integer!] v2  [integer!] v3  [integer!] v4  [integer!] v5  [integer!] v6  [integer!] v7  [integer!] v8  [integer!]
 v9  [integer!] v10 [integer!] v11 [integer!] v12 [integer!] v13 [integer!] v14 [integer!] v15 [integer!] v16 [integer!]
 v17 [integer!] v18 [integer!] v19 [integer!] v20 [integer!] v21 [integer!] v22 [integer!] v23 [integer!] v24 [integer!]
 v25 [integer!] v26 [integer!] v27 [integer!] v28 [integer!] v29 [integer!] v30 [integer!] v31 [integer!] v32 [integer!]
] value]

#define __float32-2!   [struct! [v1 [float32!] v2 [float32!]] value]
#define __float32-4!   [struct! [v1 [float32!] v2 [float32!] v3 [float32!] v4 [float32!]] value]
#define __int-3!   [struct! [v1 [integer!] v2 [integer!] v3 [integer!]] value]
#define __int-4!   [struct! [v1 [integer!] v2 [integer!] v3 [integer!] v4 [integer!]] value]
#define __VkOffset3D-2!   [struct! [v1 [VkOffset3D! value] v2 [VkOffset3D! value]] value]

#define VK_MAKE_VERSION(major minor patch) [(((major) << 22) or ((minor) << 12) or (patch))]

#define VK_VERSION_1_0                                        1 
#define VK_HEADER_VERSION                                     51 
#define VK_NULL_HANDLE                                        0 
#define VkInstance!             integer!
#define VkPhysicalDevice!       integer!
#define VkDevice!               integer!
#define VkQueue!                integer!
#define VkSemaphore!            integer!
#define VkCommandBuffer!        integer!
#define VkFence!                integer!
#define VkDeviceMemory!         integer!
#define VkBuffer!               integer!
#define VkImage!                integer!
#define VkEvent!                integer!
#define VkQueryPool!            integer!
#define VkBufferView!           integer!
#define VkImageView!            integer!
#define VkShaderModule!         integer!
#define VkPipelineCache!        integer!
#define VkPipelineLayout!       integer!
#define VkRenderPass!           integer!
#define VkPipeline!             integer!
#define VkDescriptorSetLayout!  integer!
#define VkSampler!              integer!
#define VkDescriptorPool!       integer!
#define VkDescriptorSet!        integer!
#define VkFramebuffer!          integer!
#define VkCommandPool!          integer!
#define VK_LOD_CLAMP_NONE                                     [as float32! 1000.0] 
#define VK_REMAINING_MIP_LEVELS                               FFFFh  ;(~0U)
#define VK_REMAINING_ARRAY_LAYERS                             FFFFh  ;(~0U)
#define VK_WHOLE_SIZE                                         FFFFFFFFh  ;(~0ULL)
#define VK_ATTACHMENT_UNUSED                                  FFFFh  ;(~0U)
#define VK_TRUE                                               1 
#define VK_FALSE                                              0 
#define VK_QUEUE_FAMILY_IGNORED                               FFFFh  ;(~0U)
#define VK_SUBPASS_EXTERNAL                                   FFFFh  ;(~0U)
#define VK_MAX_PHYSICAL_DEVICE_NAME_SIZE                      256 
#define VK_UUID_SIZE                                          16 
#define VK_MAX_MEMORY_TYPES                                   32 
#define VK_MAX_MEMORY_HEAPS                                   16 
#define VK_MAX_EXTENSION_NAME_SIZE                            256 
#define VK_MAX_DESCRIPTION_SIZE                               256 

#enum VkPipelineCacheHeaderVersion! [
	VK_PIPELINE_CACHE_HEADER_VERSION_ONE:         1
	VK_PIPELINE_CACHE_HEADER_VERSION_BEGIN_RANGE: VK_PIPELINE_CACHE_HEADER_VERSION_ONE
	VK_PIPELINE_CACHE_HEADER_VERSION_END_RANGE:   VK_PIPELINE_CACHE_HEADER_VERSION_ONE
	VK_PIPELINE_CACHE_HEADER_VERSION_RANGE_SIZE:  1 ; (VK_PIPELINE_CACHE_HEADER_VERSION_ONE - VK_PIPELINE_CACHE_HEADER_VERSION_ONE + 1)
	VK_PIPELINE_CACHE_HEADER_VERSION_MAX_ENUM:    7FFFFFFFh
]

#enum VkResult! [
	VK_SUCCESS:                           0
	VK_NOT_READY:                         1
	VK_TIMEOUT:                           2
	VK_EVENT_SET:                         3
	VK_EVENT_RESET:                       4
	VK_INCOMPLETE:                        5
	VK_ERROR_OUT_OF_HOST_MEMORY:          -1
	VK_ERROR_OUT_OF_DEVICE_MEMORY:        -2
	VK_ERROR_INITIALIZATION_FAILED:       -3
	VK_ERROR_DEVICE_LOST:                 -4
	VK_ERROR_MEMORY_MAP_FAILED:           -5
	VK_ERROR_LAYER_NOT_PRESENT:           -6
	VK_ERROR_EXTENSION_NOT_PRESENT:       -7
	VK_ERROR_FEATURE_NOT_PRESENT:         -8
	VK_ERROR_INCOMPATIBLE_DRIVER:         -9
	VK_ERROR_TOO_MANY_OBJECTS:            -10
	VK_ERROR_FORMAT_NOT_SUPPORTED:        -11
	VK_ERROR_FRAGMENTED_POOL:             -12
	VK_ERROR_SURFACE_LOST_KHR:            -1000000000
	VK_ERROR_NATIVE_WINDOW_IN_USE_KHR:    -1000000001
	VK_SUBOPTIMAL_KHR:                    1000001003
	VK_ERROR_OUT_OF_DATE_KHR:             -1000001004
	VK_ERROR_INCOMPATIBLE_DISPLAY_KHR:    -1000003001
	VK_ERROR_VALIDATION_FAILED_EXT:       -1000011001
	VK_ERROR_INVALID_SHADER_NV:           -1000012000
	VK_ERROR_OUT_OF_POOL_MEMORY_KHR:      -1000069000
	VK_ERROR_INVALID_EXTERNAL_HANDLE_KHX: -1000072003
	VK_RESULT_BEGIN_RANGE:                VK_ERROR_FRAGMENTED_POOL
	VK_RESULT_END_RANGE:                  VK_INCOMPLETE
	VK_RESULT_RANGE_SIZE:                 18 ; (VK_INCOMPLETE - VK_ERROR_FRAGMENTED_POOL + 1)
	VK_RESULT_MAX_ENUM:                   7FFFFFFFh
]

#enum VkStructureType! [
	VK_STRUCTURE_TYPE_APPLICATION_INFO:                                             0
	VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO:                                         1
	VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO:                                     2
	VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO:                                           3
	VK_STRUCTURE_TYPE_SUBMIT_INFO:                                                  4
	VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO:                                         5
	VK_STRUCTURE_TYPE_MAPPED_MEMORY_RANGE:                                          6
	VK_STRUCTURE_TYPE_BIND_SPARSE_INFO:                                             7
	VK_STRUCTURE_TYPE_FENCE_CREATE_INFO:                                            8
	VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO:                                        9
	VK_STRUCTURE_TYPE_EVENT_CREATE_INFO:                                            10
	VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO:                                       11
	VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO:                                           12
	VK_STRUCTURE_TYPE_BUFFER_VIEW_CREATE_INFO:                                      13
	VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO:                                            14
	VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO:                                       15
	VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO:                                    16
	VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO:                                   17
	VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO:                            18
	VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO:                      19
	VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO:                    20
	VK_STRUCTURE_TYPE_PIPELINE_TESSELLATION_STATE_CREATE_INFO:                      21
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO:                          22
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO:                     23
	VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO:                       24
	VK_STRUCTURE_TYPE_PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO:                     25
	VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO:                       26
	VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO:                           27
	VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO:                                28
	VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO:                                 29
	VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO:                                  30
	VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO:                                          31
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO:                            32
	VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO:                                  33
	VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO:                                 34
	VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET:                                         35
	VK_STRUCTURE_TYPE_COPY_DESCRIPTOR_SET:                                          36
	VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO:                                      37
	VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO:                                      38
	VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO:                                     39
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO:                                 40
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_INHERITANCE_INFO:                              41
	VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO:                                    42
	VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO:                                       43
	VK_STRUCTURE_TYPE_BUFFER_MEMORY_BARRIER:                                        44
	VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER:                                         45
	VK_STRUCTURE_TYPE_MEMORY_BARRIER:                                               46
	VK_STRUCTURE_TYPE_LOADER_INSTANCE_CREATE_INFO:                                  47
	VK_STRUCTURE_TYPE_LOADER_DEVICE_CREATE_INFO:                                    48
	VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR:                                    1000001000
	VK_STRUCTURE_TYPE_PRESENT_INFO_KHR:                                             1000001001
	VK_STRUCTURE_TYPE_DISPLAY_MODE_CREATE_INFO_KHR:                                 1000002000
	VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR:                              1000002001
	VK_STRUCTURE_TYPE_DISPLAY_PRESENT_INFO_KHR:                                     1000003000
	VK_STRUCTURE_TYPE_XLIB_SURFACE_CREATE_INFO_KHR:                                 1000004000
	VK_STRUCTURE_TYPE_XCB_SURFACE_CREATE_INFO_KHR:                                  1000005000
	VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR:                              1000006000
	VK_STRUCTURE_TYPE_MIR_SURFACE_CREATE_INFO_KHR:                                  1000007000
	VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR:                              1000008000
	VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR:                                1000009000
	VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT:                        1000011000
	VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_RASTERIZATION_ORDER_AMD:         1000018000
	VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_NAME_INFO_EXT:                            1000022000
	VK_STRUCTURE_TYPE_DEBUG_MARKER_OBJECT_TAG_INFO_EXT:                             1000022001
	VK_STRUCTURE_TYPE_DEBUG_MARKER_MARKER_INFO_EXT:                                 1000022002
	VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_IMAGE_CREATE_INFO_NV:                    1000026000
	VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_BUFFER_CREATE_INFO_NV:                   1000026001
	VK_STRUCTURE_TYPE_DEDICATED_ALLOCATION_MEMORY_ALLOCATE_INFO_NV:                 1000026002
	VK_STRUCTURE_TYPE_TEXTURE_LOD_GATHER_FORMAT_PROPERTIES_AMD:                     1000041000
	VK_STRUCTURE_TYPE_RENDER_PASS_MULTIVIEW_CREATE_INFO_KHX:                        1000053000
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_FEATURES_KHX:                       1000053001
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES_KHX:                     1000053002
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV:                         1000056000
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_NV:                               1000056001
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_NV:                           1000057000
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_NV:                           1000057001
	VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_NV:                    1000058000
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2_KHR:                               1000059000
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2_KHR:                             1000059001
	VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_2_KHR:                                      1000059002
	VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2_KHR:                                1000059003
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2_KHR:                      1000059004
	VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR:                                1000059005
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2_KHR:                      1000059006
	VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2_KHR:                         1000059007
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2_KHR:               1000059008
	VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_FLAGS_INFO_KHX:                               1000060000
	VK_STRUCTURE_TYPE_BIND_BUFFER_MEMORY_INFO_KHX:                                  1000060001
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_INFO_KHX:                                   1000060002
	VK_STRUCTURE_TYPE_DEVICE_GROUP_RENDER_PASS_BEGIN_INFO_KHX:                      1000060003
	VK_STRUCTURE_TYPE_DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO_KHX:                   1000060004
	VK_STRUCTURE_TYPE_DEVICE_GROUP_SUBMIT_INFO_KHX:                                 1000060005
	VK_STRUCTURE_TYPE_DEVICE_GROUP_BIND_SPARSE_INFO_KHX:                            1000060006
	VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_CAPABILITIES_KHX:                        1000060007
	VK_STRUCTURE_TYPE_IMAGE_SWAPCHAIN_CREATE_INFO_KHX:                              1000060008
	VK_STRUCTURE_TYPE_BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHX:                         1000060009
	VK_STRUCTURE_TYPE_ACQUIRE_NEXT_IMAGE_INFO_KHX:                                  1000060010
	VK_STRUCTURE_TYPE_DEVICE_GROUP_PRESENT_INFO_KHX:                                1000060011
	VK_STRUCTURE_TYPE_DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHX:                       1000060012
	VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT:                                         1000061000
	VK_STRUCTURE_TYPE_VI_SURFACE_CREATE_INFO_NN:                                    1000062000
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GROUP_PROPERTIES_KHX:                         1000070000
	VK_STRUCTURE_TYPE_DEVICE_GROUP_DEVICE_CREATE_INFO_KHX:                          1000070001
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO_KHX:               1000071000
	VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES_KHX:                         1000071001
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO_KHX:                     1000071002
	VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES_KHX:                               1000071003
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES_KHX:                            1000071004
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_BUFFER_CREATE_INFO_KHX:                       1000072000
	VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_KHX:                        1000072001
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO_KHX:                              1000072002
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_KHX:                          1000073000
	VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_KHX:                          1000073001
	VK_STRUCTURE_TYPE_MEMORY_WIN32_HANDLE_PROPERTIES_KHX:                           1000073002
	VK_STRUCTURE_TYPE_IMPORT_MEMORY_FD_INFO_KHX:                                    1000074000
	VK_STRUCTURE_TYPE_MEMORY_FD_PROPERTIES_KHX:                                     1000074001
	VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHX:                   1000075000
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO_KHX:                  1000076000
	VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES_KHX:                            1000076001
	VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_CREATE_INFO_KHX:                             1000077000
	VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHX:                       1000078000
	VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHX:                       1000078001
	VK_STRUCTURE_TYPE_D3D12_FENCE_SUBMIT_INFO_KHX:                                  1000078002
	VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_FD_INFO_KHX:                                 1000079000
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR:               1000080000
	VK_STRUCTURE_TYPE_PRESENT_REGIONS_KHR:                                          1000084000
	VK_STRUCTURE_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO_KHR:                   1000085000
	VK_STRUCTURE_TYPE_OBJECT_TABLE_CREATE_INFO_NVX:                                 1000086000
	VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NVX:                     1000086001
	VK_STRUCTURE_TYPE_CMD_PROCESS_COMMANDS_INFO_NVX:                                1000086002
	VK_STRUCTURE_TYPE_CMD_RESERVE_SPACE_FOR_COMMANDS_INFO_NVX:                      1000086003
	VK_STRUCTURE_TYPE_DEVICE_GENERATED_COMMANDS_LIMITS_NVX:                         1000086004
	VK_STRUCTURE_TYPE_DEVICE_GENERATED_COMMANDS_FEATURES_NVX:                       1000086005
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_W_SCALING_STATE_CREATE_INFO_NV:             1000087000
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES2_EXT:                                    1000090000
	VK_STRUCTURE_TYPE_DISPLAY_POWER_INFO_EXT:                                       1000091000
	VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT:                                        1000091001
	VK_STRUCTURE_TYPE_DISPLAY_EVENT_INFO_EXT:                                       1000091002
	VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT:                            1000091003
	VK_STRUCTURE_TYPE_PRESENT_TIMES_INFO_GOOGLE:                                    1000092000
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_ATTRIBUTES_PROPERTIES_NVX: 1000097000
	VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_SWIZZLE_STATE_CREATE_INFO_NV:               1000098000
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISCARD_RECTANGLE_PROPERTIES_EXT:             1000099000
	VK_STRUCTURE_TYPE_PIPELINE_DISCARD_RECTANGLE_STATE_CREATE_INFO_EXT:             1000099001
	VK_STRUCTURE_TYPE_HDR_METADATA_EXT:                                             1000105000
	VK_STRUCTURE_TYPE_SHARED_PRESENT_SURFACE_CAPABILITIES_KHR:                      1000111000
	VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR:                           1000119000
	VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR:                                   1000119001
	VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR:                                         1000119002
	VK_STRUCTURE_TYPE_IOS_SURFACE_CREATE_INFO_MVK:                                  1000122000
	VK_STRUCTURE_TYPE_MACOS_SURFACE_CREATE_INFO_MVK:                                1000123000
	VK_STRUCTURE_TYPE_BEGIN_RANGE:                                                  VK_STRUCTURE_TYPE_APPLICATION_INFO
	VK_STRUCTURE_TYPE_END_RANGE:                                                    VK_STRUCTURE_TYPE_LOADER_DEVICE_CREATE_INFO
	VK_STRUCTURE_TYPE_RANGE_SIZE:                                                   49 ; (VK_STRUCTURE_TYPE_LOADER_DEVICE_CREATE_INFO - VK_STRUCTURE_TYPE_APPLICATION_INFO + 1)
	VK_STRUCTURE_TYPE_MAX_ENUM:                                                     7FFFFFFFh
]

#enum VkSystemAllocationScope! [
	VK_SYSTEM_ALLOCATION_SCOPE_COMMAND:     0
	VK_SYSTEM_ALLOCATION_SCOPE_OBJECT:      1
	VK_SYSTEM_ALLOCATION_SCOPE_CACHE:       2
	VK_SYSTEM_ALLOCATION_SCOPE_DEVICE:      3
	VK_SYSTEM_ALLOCATION_SCOPE_INSTANCE:    4
	VK_SYSTEM_ALLOCATION_SCOPE_BEGIN_RANGE: VK_SYSTEM_ALLOCATION_SCOPE_COMMAND
	VK_SYSTEM_ALLOCATION_SCOPE_END_RANGE:   VK_SYSTEM_ALLOCATION_SCOPE_INSTANCE
	VK_SYSTEM_ALLOCATION_SCOPE_RANGE_SIZE:  5 ; (VK_SYSTEM_ALLOCATION_SCOPE_INSTANCE - VK_SYSTEM_ALLOCATION_SCOPE_COMMAND + 1)
	VK_SYSTEM_ALLOCATION_SCOPE_MAX_ENUM:    7FFFFFFFh
]

#enum VkInternalAllocationType! [
	VK_INTERNAL_ALLOCATION_TYPE_EXECUTABLE:  0
	VK_INTERNAL_ALLOCATION_TYPE_BEGIN_RANGE: VK_INTERNAL_ALLOCATION_TYPE_EXECUTABLE
	VK_INTERNAL_ALLOCATION_TYPE_END_RANGE:   VK_INTERNAL_ALLOCATION_TYPE_EXECUTABLE
	VK_INTERNAL_ALLOCATION_TYPE_RANGE_SIZE:  1 ; (VK_INTERNAL_ALLOCATION_TYPE_EXECUTABLE - VK_INTERNAL_ALLOCATION_TYPE_EXECUTABLE + 1)
	VK_INTERNAL_ALLOCATION_TYPE_MAX_ENUM:    7FFFFFFFh
]

#enum VkFormat! [
	VK_FORMAT_UNDEFINED:                   0
	VK_FORMAT_R4G4_UNORM_PACK8:            1
	VK_FORMAT_R4G4B4A4_UNORM_PACK16:       2
	VK_FORMAT_B4G4R4A4_UNORM_PACK16:       3
	VK_FORMAT_R5G6B5_UNORM_PACK16:         4
	VK_FORMAT_B5G6R5_UNORM_PACK16:         5
	VK_FORMAT_R5G5B5A1_UNORM_PACK16:       6
	VK_FORMAT_B5G5R5A1_UNORM_PACK16:       7
	VK_FORMAT_A1R5G5B5_UNORM_PACK16:       8
	VK_FORMAT_R8_UNORM:                    9
	VK_FORMAT_R8_SNORM:                    10
	VK_FORMAT_R8_USCALED:                  11
	VK_FORMAT_R8_SSCALED:                  12
	VK_FORMAT_R8_UINT:                     13
	VK_FORMAT_R8_SINT:                     14
	VK_FORMAT_R8_SRGB:                     15
	VK_FORMAT_R8G8_UNORM:                  16
	VK_FORMAT_R8G8_SNORM:                  17
	VK_FORMAT_R8G8_USCALED:                18
	VK_FORMAT_R8G8_SSCALED:                19
	VK_FORMAT_R8G8_UINT:                   20
	VK_FORMAT_R8G8_SINT:                   21
	VK_FORMAT_R8G8_SRGB:                   22
	VK_FORMAT_R8G8B8_UNORM:                23
	VK_FORMAT_R8G8B8_SNORM:                24
	VK_FORMAT_R8G8B8_USCALED:              25
	VK_FORMAT_R8G8B8_SSCALED:              26
	VK_FORMAT_R8G8B8_UINT:                 27
	VK_FORMAT_R8G8B8_SINT:                 28
	VK_FORMAT_R8G8B8_SRGB:                 29
	VK_FORMAT_B8G8R8_UNORM:                30
	VK_FORMAT_B8G8R8_SNORM:                31
	VK_FORMAT_B8G8R8_USCALED:              32
	VK_FORMAT_B8G8R8_SSCALED:              33
	VK_FORMAT_B8G8R8_UINT:                 34
	VK_FORMAT_B8G8R8_SINT:                 35
	VK_FORMAT_B8G8R8_SRGB:                 36
	VK_FORMAT_R8G8B8A8_UNORM:              37
	VK_FORMAT_R8G8B8A8_SNORM:              38
	VK_FORMAT_R8G8B8A8_USCALED:            39
	VK_FORMAT_R8G8B8A8_SSCALED:            40
	VK_FORMAT_R8G8B8A8_UINT:               41
	VK_FORMAT_R8G8B8A8_SINT:               42
	VK_FORMAT_R8G8B8A8_SRGB:               43
	VK_FORMAT_B8G8R8A8_UNORM:              44
	VK_FORMAT_B8G8R8A8_SNORM:              45
	VK_FORMAT_B8G8R8A8_USCALED:            46
	VK_FORMAT_B8G8R8A8_SSCALED:            47
	VK_FORMAT_B8G8R8A8_UINT:               48
	VK_FORMAT_B8G8R8A8_SINT:               49
	VK_FORMAT_B8G8R8A8_SRGB:               50
	VK_FORMAT_A8B8G8R8_UNORM_PACK32:       51
	VK_FORMAT_A8B8G8R8_SNORM_PACK32:       52
	VK_FORMAT_A8B8G8R8_USCALED_PACK32:     53
	VK_FORMAT_A8B8G8R8_SSCALED_PACK32:     54
	VK_FORMAT_A8B8G8R8_UINT_PACK32:        55
	VK_FORMAT_A8B8G8R8_SINT_PACK32:        56
	VK_FORMAT_A8B8G8R8_SRGB_PACK32:        57
	VK_FORMAT_A2R10G10B10_UNORM_PACK32:    58
	VK_FORMAT_A2R10G10B10_SNORM_PACK32:    59
	VK_FORMAT_A2R10G10B10_USCALED_PACK32:  60
	VK_FORMAT_A2R10G10B10_SSCALED_PACK32:  61
	VK_FORMAT_A2R10G10B10_UINT_PACK32:     62
	VK_FORMAT_A2R10G10B10_SINT_PACK32:     63
	VK_FORMAT_A2B10G10R10_UNORM_PACK32:    64
	VK_FORMAT_A2B10G10R10_SNORM_PACK32:    65
	VK_FORMAT_A2B10G10R10_USCALED_PACK32:  66
	VK_FORMAT_A2B10G10R10_SSCALED_PACK32:  67
	VK_FORMAT_A2B10G10R10_UINT_PACK32:     68
	VK_FORMAT_A2B10G10R10_SINT_PACK32:     69
	VK_FORMAT_R16_UNORM:                   70
	VK_FORMAT_R16_SNORM:                   71
	VK_FORMAT_R16_USCALED:                 72
	VK_FORMAT_R16_SSCALED:                 73
	VK_FORMAT_R16_UINT:                    74
	VK_FORMAT_R16_SINT:                    75
	VK_FORMAT_R16_SFLOAT:                  76
	VK_FORMAT_R16G16_UNORM:                77
	VK_FORMAT_R16G16_SNORM:                78
	VK_FORMAT_R16G16_USCALED:              79
	VK_FORMAT_R16G16_SSCALED:              80
	VK_FORMAT_R16G16_UINT:                 81
	VK_FORMAT_R16G16_SINT:                 82
	VK_FORMAT_R16G16_SFLOAT:               83
	VK_FORMAT_R16G16B16_UNORM:             84
	VK_FORMAT_R16G16B16_SNORM:             85
	VK_FORMAT_R16G16B16_USCALED:           86
	VK_FORMAT_R16G16B16_SSCALED:           87
	VK_FORMAT_R16G16B16_UINT:              88
	VK_FORMAT_R16G16B16_SINT:              89
	VK_FORMAT_R16G16B16_SFLOAT:            90
	VK_FORMAT_R16G16B16A16_UNORM:          91
	VK_FORMAT_R16G16B16A16_SNORM:          92
	VK_FORMAT_R16G16B16A16_USCALED:        93
	VK_FORMAT_R16G16B16A16_SSCALED:        94
	VK_FORMAT_R16G16B16A16_UINT:           95
	VK_FORMAT_R16G16B16A16_SINT:           96
	VK_FORMAT_R16G16B16A16_SFLOAT:         97
	VK_FORMAT_R32_UINT:                    98
	VK_FORMAT_R32_SINT:                    99
	VK_FORMAT_R32_SFLOAT:                  100
	VK_FORMAT_R32G32_UINT:                 101
	VK_FORMAT_R32G32_SINT:                 102
	VK_FORMAT_R32G32_SFLOAT:               103
	VK_FORMAT_R32G32B32_UINT:              104
	VK_FORMAT_R32G32B32_SINT:              105
	VK_FORMAT_R32G32B32_SFLOAT:            106
	VK_FORMAT_R32G32B32A32_UINT:           107
	VK_FORMAT_R32G32B32A32_SINT:           108
	VK_FORMAT_R32G32B32A32_SFLOAT:         109
	VK_FORMAT_R64_UINT:                    110
	VK_FORMAT_R64_SINT:                    111
	VK_FORMAT_R64_SFLOAT:                  112
	VK_FORMAT_R64G64_UINT:                 113
	VK_FORMAT_R64G64_SINT:                 114
	VK_FORMAT_R64G64_SFLOAT:               115
	VK_FORMAT_R64G64B64_UINT:              116
	VK_FORMAT_R64G64B64_SINT:              117
	VK_FORMAT_R64G64B64_SFLOAT:            118
	VK_FORMAT_R64G64B64A64_UINT:           119
	VK_FORMAT_R64G64B64A64_SINT:           120
	VK_FORMAT_R64G64B64A64_SFLOAT:         121
	VK_FORMAT_B10G11R11_UFLOAT_PACK32:     122
	VK_FORMAT_E5B9G9R9_UFLOAT_PACK32:      123
	VK_FORMAT_D16_UNORM:                   124
	VK_FORMAT_X8_D24_UNORM_PACK32:         125
	VK_FORMAT_D32_SFLOAT:                  126
	VK_FORMAT_S8_UINT:                     127
	VK_FORMAT_D16_UNORM_S8_UINT:           128
	VK_FORMAT_D24_UNORM_S8_UINT:           129
	VK_FORMAT_D32_SFLOAT_S8_UINT:          130
	VK_FORMAT_BC1_RGB_UNORM_BLOCK:         131
	VK_FORMAT_BC1_RGB_SRGB_BLOCK:          132
	VK_FORMAT_BC1_RGBA_UNORM_BLOCK:        133
	VK_FORMAT_BC1_RGBA_SRGB_BLOCK:         134
	VK_FORMAT_BC2_UNORM_BLOCK:             135
	VK_FORMAT_BC2_SRGB_BLOCK:              136
	VK_FORMAT_BC3_UNORM_BLOCK:             137
	VK_FORMAT_BC3_SRGB_BLOCK:              138
	VK_FORMAT_BC4_UNORM_BLOCK:             139
	VK_FORMAT_BC4_SNORM_BLOCK:             140
	VK_FORMAT_BC5_UNORM_BLOCK:             141
	VK_FORMAT_BC5_SNORM_BLOCK:             142
	VK_FORMAT_BC6H_UFLOAT_BLOCK:           143
	VK_FORMAT_BC6H_SFLOAT_BLOCK:           144
	VK_FORMAT_BC7_UNORM_BLOCK:             145
	VK_FORMAT_BC7_SRGB_BLOCK:              146
	VK_FORMAT_ETC2_R8G8B8_UNORM_BLOCK:     147
	VK_FORMAT_ETC2_R8G8B8_SRGB_BLOCK:      148
	VK_FORMAT_ETC2_R8G8B8A1_UNORM_BLOCK:   149
	VK_FORMAT_ETC2_R8G8B8A1_SRGB_BLOCK:    150
	VK_FORMAT_ETC2_R8G8B8A8_UNORM_BLOCK:   151
	VK_FORMAT_ETC2_R8G8B8A8_SRGB_BLOCK:    152
	VK_FORMAT_EAC_R11_UNORM_BLOCK:         153
	VK_FORMAT_EAC_R11_SNORM_BLOCK:         154
	VK_FORMAT_EAC_R11G11_UNORM_BLOCK:      155
	VK_FORMAT_EAC_R11G11_SNORM_BLOCK:      156
	VK_FORMAT_ASTC_4x4_UNORM_BLOCK:        157
	VK_FORMAT_ASTC_4x4_SRGB_BLOCK:         158
	VK_FORMAT_ASTC_5x4_UNORM_BLOCK:        159
	VK_FORMAT_ASTC_5x4_SRGB_BLOCK:         160
	VK_FORMAT_ASTC_5x5_UNORM_BLOCK:        161
	VK_FORMAT_ASTC_5x5_SRGB_BLOCK:         162
	VK_FORMAT_ASTC_6x5_UNORM_BLOCK:        163
	VK_FORMAT_ASTC_6x5_SRGB_BLOCK:         164
	VK_FORMAT_ASTC_6x6_UNORM_BLOCK:        165
	VK_FORMAT_ASTC_6x6_SRGB_BLOCK:         166
	VK_FORMAT_ASTC_8x5_UNORM_BLOCK:        167
	VK_FORMAT_ASTC_8x5_SRGB_BLOCK:         168
	VK_FORMAT_ASTC_8x6_UNORM_BLOCK:        169
	VK_FORMAT_ASTC_8x6_SRGB_BLOCK:         170
	VK_FORMAT_ASTC_8x8_UNORM_BLOCK:        171
	VK_FORMAT_ASTC_8x8_SRGB_BLOCK:         172
	VK_FORMAT_ASTC_10x5_UNORM_BLOCK:       173
	VK_FORMAT_ASTC_10x5_SRGB_BLOCK:        174
	VK_FORMAT_ASTC_10x6_UNORM_BLOCK:       175
	VK_FORMAT_ASTC_10x6_SRGB_BLOCK:        176
	VK_FORMAT_ASTC_10x8_UNORM_BLOCK:       177
	VK_FORMAT_ASTC_10x8_SRGB_BLOCK:        178
	VK_FORMAT_ASTC_10x10_UNORM_BLOCK:      179
	VK_FORMAT_ASTC_10x10_SRGB_BLOCK:       180
	VK_FORMAT_ASTC_12x10_UNORM_BLOCK:      181
	VK_FORMAT_ASTC_12x10_SRGB_BLOCK:       182
	VK_FORMAT_ASTC_12x12_UNORM_BLOCK:      183
	VK_FORMAT_ASTC_12x12_SRGB_BLOCK:       184
	VK_FORMAT_PVRTC1_2BPP_UNORM_BLOCK_IMG: 1000054000
	VK_FORMAT_PVRTC1_4BPP_UNORM_BLOCK_IMG: 1000054001
	VK_FORMAT_PVRTC2_2BPP_UNORM_BLOCK_IMG: 1000054002
	VK_FORMAT_PVRTC2_4BPP_UNORM_BLOCK_IMG: 1000054003
	VK_FORMAT_PVRTC1_2BPP_SRGB_BLOCK_IMG:  1000054004
	VK_FORMAT_PVRTC1_4BPP_SRGB_BLOCK_IMG:  1000054005
	VK_FORMAT_PVRTC2_2BPP_SRGB_BLOCK_IMG:  1000054006
	VK_FORMAT_PVRTC2_4BPP_SRGB_BLOCK_IMG:  1000054007
	VK_FORMAT_BEGIN_RANGE:                 VK_FORMAT_UNDEFINED
	VK_FORMAT_END_RANGE:                   VK_FORMAT_ASTC_12x12_SRGB_BLOCK
	VK_FORMAT_RANGE_SIZE:                  185 ; (VK_FORMAT_ASTC_12x12_SRGB_BLOCK - VK_FORMAT_UNDEFINED + 1)
	VK_FORMAT_MAX_ENUM:                    7FFFFFFFh
]

#enum VkImageType! [
	VK_IMAGE_TYPE_1D:          0
	VK_IMAGE_TYPE_2D:          1
	VK_IMAGE_TYPE_3D:          2
	VK_IMAGE_TYPE_BEGIN_RANGE: VK_IMAGE_TYPE_1D
	VK_IMAGE_TYPE_END_RANGE:   VK_IMAGE_TYPE_3D
	VK_IMAGE_TYPE_RANGE_SIZE:  3 ; (VK_IMAGE_TYPE_3D - VK_IMAGE_TYPE_1D + 1)
	VK_IMAGE_TYPE_MAX_ENUM:    7FFFFFFFh
]

#enum VkImageTiling! [
	VK_IMAGE_TILING_OPTIMAL:     0
	VK_IMAGE_TILING_LINEAR:      1
	VK_IMAGE_TILING_BEGIN_RANGE: VK_IMAGE_TILING_OPTIMAL
	VK_IMAGE_TILING_END_RANGE:   VK_IMAGE_TILING_LINEAR
	VK_IMAGE_TILING_RANGE_SIZE:  2 ; (VK_IMAGE_TILING_LINEAR - VK_IMAGE_TILING_OPTIMAL + 1)
	VK_IMAGE_TILING_MAX_ENUM:    7FFFFFFFh
]

#enum VkPhysicalDeviceType! [
	VK_PHYSICAL_DEVICE_TYPE_OTHER:          0
	VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU: 1
	VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU:   2
	VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU:    3
	VK_PHYSICAL_DEVICE_TYPE_CPU:            4
	VK_PHYSICAL_DEVICE_TYPE_BEGIN_RANGE:    VK_PHYSICAL_DEVICE_TYPE_OTHER
	VK_PHYSICAL_DEVICE_TYPE_END_RANGE:      VK_PHYSICAL_DEVICE_TYPE_CPU
	VK_PHYSICAL_DEVICE_TYPE_RANGE_SIZE:     5 ; (VK_PHYSICAL_DEVICE_TYPE_CPU - VK_PHYSICAL_DEVICE_TYPE_OTHER + 1)
	VK_PHYSICAL_DEVICE_TYPE_MAX_ENUM:       7FFFFFFFh
]

#enum VkQueryType! [
	VK_QUERY_TYPE_OCCLUSION:           0
	VK_QUERY_TYPE_PIPELINE_STATISTICS: 1
	VK_QUERY_TYPE_TIMESTAMP:           2
	VK_QUERY_TYPE_BEGIN_RANGE:         VK_QUERY_TYPE_OCCLUSION
	VK_QUERY_TYPE_END_RANGE:           VK_QUERY_TYPE_TIMESTAMP
	VK_QUERY_TYPE_RANGE_SIZE:          3 ; (VK_QUERY_TYPE_TIMESTAMP - VK_QUERY_TYPE_OCCLUSION + 1)
	VK_QUERY_TYPE_MAX_ENUM:            7FFFFFFFh
]

#enum VkSharingMode! [
	VK_SHARING_MODE_EXCLUSIVE:   0
	VK_SHARING_MODE_CONCURRENT:  1
	VK_SHARING_MODE_BEGIN_RANGE: VK_SHARING_MODE_EXCLUSIVE
	VK_SHARING_MODE_END_RANGE:   VK_SHARING_MODE_CONCURRENT
	VK_SHARING_MODE_RANGE_SIZE:  2 ; (VK_SHARING_MODE_CONCURRENT - VK_SHARING_MODE_EXCLUSIVE + 1)
	VK_SHARING_MODE_MAX_ENUM:    7FFFFFFFh
]

#enum VkImageLayout! [
	VK_IMAGE_LAYOUT_UNDEFINED:                        0
	VK_IMAGE_LAYOUT_GENERAL:                          1
	VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL:         2
	VK_IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL: 3
	VK_IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL:  4
	VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL:         5
	VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL:             6
	VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL:             7
	VK_IMAGE_LAYOUT_PREINITIALIZED:                   8
	VK_IMAGE_LAYOUT_PRESENT_SRC_KHR:                  1000001002
	VK_IMAGE_LAYOUT_SHARED_PRESENT_KHR:               1000111000
	VK_IMAGE_LAYOUT_BEGIN_RANGE:                      VK_IMAGE_LAYOUT_UNDEFINED
	VK_IMAGE_LAYOUT_END_RANGE:                        VK_IMAGE_LAYOUT_PREINITIALIZED
	VK_IMAGE_LAYOUT_RANGE_SIZE:                       9 ; (VK_IMAGE_LAYOUT_PREINITIALIZED - VK_IMAGE_LAYOUT_UNDEFINED + 1)
	VK_IMAGE_LAYOUT_MAX_ENUM:                         7FFFFFFFh
]

#enum VkImageViewType! [
	VK_IMAGE_VIEW_TYPE_1D:          0
	VK_IMAGE_VIEW_TYPE_2D:          1
	VK_IMAGE_VIEW_TYPE_3D:          2
	VK_IMAGE_VIEW_TYPE_CUBE:        3
	VK_IMAGE_VIEW_TYPE_1D_ARRAY:    4
	VK_IMAGE_VIEW_TYPE_2D_ARRAY:    5
	VK_IMAGE_VIEW_TYPE_CUBE_ARRAY:  6
	VK_IMAGE_VIEW_TYPE_BEGIN_RANGE: VK_IMAGE_VIEW_TYPE_1D
	VK_IMAGE_VIEW_TYPE_END_RANGE:   VK_IMAGE_VIEW_TYPE_CUBE_ARRAY
	VK_IMAGE_VIEW_TYPE_RANGE_SIZE:  7 ; (VK_IMAGE_VIEW_TYPE_CUBE_ARRAY - VK_IMAGE_VIEW_TYPE_1D + 1)
	VK_IMAGE_VIEW_TYPE_MAX_ENUM:    7FFFFFFFh
]

#enum VkComponentSwizzle! [
	VK_COMPONENT_SWIZZLE_IDENTITY:    0
	VK_COMPONENT_SWIZZLE_ZERO:        1
	VK_COMPONENT_SWIZZLE_ONE:         2
	VK_COMPONENT_SWIZZLE_R:           3
	VK_COMPONENT_SWIZZLE_G:           4
	VK_COMPONENT_SWIZZLE_B:           5
	VK_COMPONENT_SWIZZLE_A:           6
	VK_COMPONENT_SWIZZLE_BEGIN_RANGE: VK_COMPONENT_SWIZZLE_IDENTITY
	VK_COMPONENT_SWIZZLE_END_RANGE:   VK_COMPONENT_SWIZZLE_A
	VK_COMPONENT_SWIZZLE_RANGE_SIZE:  7 ; (VK_COMPONENT_SWIZZLE_A - VK_COMPONENT_SWIZZLE_IDENTITY + 1)
	VK_COMPONENT_SWIZZLE_MAX_ENUM:    7FFFFFFFh
]

#enum VkVertexInputRate! [
	VK_VERTEX_INPUT_RATE_VERTEX:      0
	VK_VERTEX_INPUT_RATE_INSTANCE:    1
	VK_VERTEX_INPUT_RATE_BEGIN_RANGE: VK_VERTEX_INPUT_RATE_VERTEX
	VK_VERTEX_INPUT_RATE_END_RANGE:   VK_VERTEX_INPUT_RATE_INSTANCE
	VK_VERTEX_INPUT_RATE_RANGE_SIZE:  2 ; (VK_VERTEX_INPUT_RATE_INSTANCE - VK_VERTEX_INPUT_RATE_VERTEX + 1)
	VK_VERTEX_INPUT_RATE_MAX_ENUM:    7FFFFFFFh
]

#enum VkPrimitiveTopology! [
	VK_PRIMITIVE_TOPOLOGY_POINT_LIST:                    0
	VK_PRIMITIVE_TOPOLOGY_LINE_LIST:                     1
	VK_PRIMITIVE_TOPOLOGY_LINE_STRIP:                    2
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST:                 3
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP:                4
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_FAN:                  5
	VK_PRIMITIVE_TOPOLOGY_LINE_LIST_WITH_ADJACENCY:      6
	VK_PRIMITIVE_TOPOLOGY_LINE_STRIP_WITH_ADJACENCY:     7
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST_WITH_ADJACENCY:  8
	VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP_WITH_ADJACENCY: 9
	VK_PRIMITIVE_TOPOLOGY_PATCH_LIST:                    10
	VK_PRIMITIVE_TOPOLOGY_BEGIN_RANGE:                   VK_PRIMITIVE_TOPOLOGY_POINT_LIST
	VK_PRIMITIVE_TOPOLOGY_END_RANGE:                     VK_PRIMITIVE_TOPOLOGY_PATCH_LIST
	VK_PRIMITIVE_TOPOLOGY_RANGE_SIZE:                    11 ; (VK_PRIMITIVE_TOPOLOGY_PATCH_LIST - VK_PRIMITIVE_TOPOLOGY_POINT_LIST + 1)
	VK_PRIMITIVE_TOPOLOGY_MAX_ENUM:                      7FFFFFFFh
]

#enum VkPolygonMode! [
	VK_POLYGON_MODE_FILL:        0
	VK_POLYGON_MODE_LINE:        1
	VK_POLYGON_MODE_POINT:       2
	VK_POLYGON_MODE_BEGIN_RANGE: VK_POLYGON_MODE_FILL
	VK_POLYGON_MODE_END_RANGE:   VK_POLYGON_MODE_POINT
	VK_POLYGON_MODE_RANGE_SIZE:  3 ; (VK_POLYGON_MODE_POINT - VK_POLYGON_MODE_FILL + 1)
	VK_POLYGON_MODE_MAX_ENUM:    7FFFFFFFh
]

#enum VkFrontFace! [
	VK_FRONT_FACE_COUNTER_CLOCKWISE: 0
	VK_FRONT_FACE_CLOCKWISE:         1
	VK_FRONT_FACE_BEGIN_RANGE:       VK_FRONT_FACE_COUNTER_CLOCKWISE
	VK_FRONT_FACE_END_RANGE:         VK_FRONT_FACE_CLOCKWISE
	VK_FRONT_FACE_RANGE_SIZE:        2 ; (VK_FRONT_FACE_CLOCKWISE - VK_FRONT_FACE_COUNTER_CLOCKWISE + 1)
	VK_FRONT_FACE_MAX_ENUM:          7FFFFFFFh
]

#enum VkCompareOp! [
	VK_COMPARE_OP_NEVER:            0
	VK_COMPARE_OP_LESS:             1
	VK_COMPARE_OP_EQUAL:            2
	VK_COMPARE_OP_LESS_OR_EQUAL:    3
	VK_COMPARE_OP_GREATER:          4
	VK_COMPARE_OP_NOT_EQUAL:        5
	VK_COMPARE_OP_GREATER_OR_EQUAL: 6
	VK_COMPARE_OP_ALWAYS:           7
	VK_COMPARE_OP_BEGIN_RANGE:      VK_COMPARE_OP_NEVER
	VK_COMPARE_OP_END_RANGE:        VK_COMPARE_OP_ALWAYS
	VK_COMPARE_OP_RANGE_SIZE:       8 ; (VK_COMPARE_OP_ALWAYS - VK_COMPARE_OP_NEVER + 1)
	VK_COMPARE_OP_MAX_ENUM:         7FFFFFFFh
]

#enum VkStencilOp! [
	VK_STENCIL_OP_KEEP:                0
	VK_STENCIL_OP_ZERO:                1
	VK_STENCIL_OP_REPLACE:             2
	VK_STENCIL_OP_INCREMENT_AND_CLAMP: 3
	VK_STENCIL_OP_DECREMENT_AND_CLAMP: 4
	VK_STENCIL_OP_INVERT:              5
	VK_STENCIL_OP_INCREMENT_AND_WRAP:  6
	VK_STENCIL_OP_DECREMENT_AND_WRAP:  7
	VK_STENCIL_OP_BEGIN_RANGE:         VK_STENCIL_OP_KEEP
	VK_STENCIL_OP_END_RANGE:           VK_STENCIL_OP_DECREMENT_AND_WRAP
	VK_STENCIL_OP_RANGE_SIZE:          8 ; (VK_STENCIL_OP_DECREMENT_AND_WRAP - VK_STENCIL_OP_KEEP + 1)
	VK_STENCIL_OP_MAX_ENUM:            7FFFFFFFh
]

#enum VkLogicOp! [
	VK_LOGIC_OP_CLEAR:         0
	VK_LOGIC_OP_AND:           1
	VK_LOGIC_OP_AND_REVERSE:   2
	VK_LOGIC_OP_COPY:          3
	VK_LOGIC_OP_AND_INVERTED:  4
	VK_LOGIC_OP_NO_OP:         5
	VK_LOGIC_OP_XOR:           6
	VK_LOGIC_OP_OR:            7
	VK_LOGIC_OP_NOR:           8
	VK_LOGIC_OP_EQUIVALENT:    9
	VK_LOGIC_OP_INVERT:        10
	VK_LOGIC_OP_OR_REVERSE:    11
	VK_LOGIC_OP_COPY_INVERTED: 12
	VK_LOGIC_OP_OR_INVERTED:   13
	VK_LOGIC_OP_NAND:          14
	VK_LOGIC_OP_SET:           15
	VK_LOGIC_OP_BEGIN_RANGE:   VK_LOGIC_OP_CLEAR
	VK_LOGIC_OP_END_RANGE:     VK_LOGIC_OP_SET
	VK_LOGIC_OP_RANGE_SIZE:    16 ; (VK_LOGIC_OP_SET - VK_LOGIC_OP_CLEAR + 1)
	VK_LOGIC_OP_MAX_ENUM:      7FFFFFFFh
]

#enum VkBlendFactor! [
	VK_BLEND_FACTOR_ZERO:                     0
	VK_BLEND_FACTOR_ONE:                      1
	VK_BLEND_FACTOR_SRC_COLOR:                2
	VK_BLEND_FACTOR_ONE_MINUS_SRC_COLOR:      3
	VK_BLEND_FACTOR_DST_COLOR:                4
	VK_BLEND_FACTOR_ONE_MINUS_DST_COLOR:      5
	VK_BLEND_FACTOR_SRC_ALPHA:                6
	VK_BLEND_FACTOR_ONE_MINUS_SRC_ALPHA:      7
	VK_BLEND_FACTOR_DST_ALPHA:                8
	VK_BLEND_FACTOR_ONE_MINUS_DST_ALPHA:      9
	VK_BLEND_FACTOR_CONSTANT_COLOR:           10
	VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_COLOR: 11
	VK_BLEND_FACTOR_CONSTANT_ALPHA:           12
	VK_BLEND_FACTOR_ONE_MINUS_CONSTANT_ALPHA: 13
	VK_BLEND_FACTOR_SRC_ALPHA_SATURATE:       14
	VK_BLEND_FACTOR_SRC1_COLOR:               15
	VK_BLEND_FACTOR_ONE_MINUS_SRC1_COLOR:     16
	VK_BLEND_FACTOR_SRC1_ALPHA:               17
	VK_BLEND_FACTOR_ONE_MINUS_SRC1_ALPHA:     18
	VK_BLEND_FACTOR_BEGIN_RANGE:              VK_BLEND_FACTOR_ZERO
	VK_BLEND_FACTOR_END_RANGE:                VK_BLEND_FACTOR_ONE_MINUS_SRC1_ALPHA
	VK_BLEND_FACTOR_RANGE_SIZE:               19 ; (VK_BLEND_FACTOR_ONE_MINUS_SRC1_ALPHA - VK_BLEND_FACTOR_ZERO + 1)
	VK_BLEND_FACTOR_MAX_ENUM:                 7FFFFFFFh
]

#enum VkBlendOp! [
	VK_BLEND_OP_ADD:              0
	VK_BLEND_OP_SUBTRACT:         1
	VK_BLEND_OP_REVERSE_SUBTRACT: 2
	VK_BLEND_OP_MIN:              3
	VK_BLEND_OP_MAX:              4
	VK_BLEND_OP_BEGIN_RANGE:      VK_BLEND_OP_ADD
	VK_BLEND_OP_END_RANGE:        VK_BLEND_OP_MAX
	VK_BLEND_OP_RANGE_SIZE:       5 ; (VK_BLEND_OP_MAX - VK_BLEND_OP_ADD + 1)
	VK_BLEND_OP_MAX_ENUM:         7FFFFFFFh
]

#enum VkDynamicState! [
	VK_DYNAMIC_STATE_VIEWPORT:              0
	VK_DYNAMIC_STATE_SCISSOR:               1
	VK_DYNAMIC_STATE_LINE_WIDTH:            2
	VK_DYNAMIC_STATE_DEPTH_BIAS:            3
	VK_DYNAMIC_STATE_BLEND_CONSTANTS:       4
	VK_DYNAMIC_STATE_DEPTH_BOUNDS:          5
	VK_DYNAMIC_STATE_STENCIL_COMPARE_MASK:  6
	VK_DYNAMIC_STATE_STENCIL_WRITE_MASK:    7
	VK_DYNAMIC_STATE_STENCIL_REFERENCE:     8
	VK_DYNAMIC_STATE_VIEWPORT_W_SCALING_NV: 1000087000
	VK_DYNAMIC_STATE_DISCARD_RECTANGLE_EXT: 1000099000
	VK_DYNAMIC_STATE_BEGIN_RANGE:           VK_DYNAMIC_STATE_VIEWPORT
	VK_DYNAMIC_STATE_END_RANGE:             VK_DYNAMIC_STATE_STENCIL_REFERENCE
	VK_DYNAMIC_STATE_RANGE_SIZE:            9 ; (VK_DYNAMIC_STATE_STENCIL_REFERENCE - VK_DYNAMIC_STATE_VIEWPORT + 1)
	VK_DYNAMIC_STATE_MAX_ENUM:              7FFFFFFFh
]

#enum VkFilter! [
	VK_FILTER_NEAREST:     0
	VK_FILTER_LINEAR:      1
	VK_FILTER_CUBIC_IMG:   1000015000
	VK_FILTER_BEGIN_RANGE: VK_FILTER_NEAREST
	VK_FILTER_END_RANGE:   VK_FILTER_LINEAR
	VK_FILTER_RANGE_SIZE:  2 ; (VK_FILTER_LINEAR - VK_FILTER_NEAREST + 1)
	VK_FILTER_MAX_ENUM:    7FFFFFFFh
]

#enum VkSamplerMipmapMode! [
	VK_SAMPLER_MIPMAP_MODE_NEAREST:     0
	VK_SAMPLER_MIPMAP_MODE_LINEAR:      1
	VK_SAMPLER_MIPMAP_MODE_BEGIN_RANGE: VK_SAMPLER_MIPMAP_MODE_NEAREST
	VK_SAMPLER_MIPMAP_MODE_END_RANGE:   VK_SAMPLER_MIPMAP_MODE_LINEAR
	VK_SAMPLER_MIPMAP_MODE_RANGE_SIZE:  2 ; (VK_SAMPLER_MIPMAP_MODE_LINEAR - VK_SAMPLER_MIPMAP_MODE_NEAREST + 1)
	VK_SAMPLER_MIPMAP_MODE_MAX_ENUM:    7FFFFFFFh
]

#enum VkSamplerAddressMode! [
	VK_SAMPLER_ADDRESS_MODE_REPEAT:               0
	VK_SAMPLER_ADDRESS_MODE_MIRRORED_REPEAT:      1
	VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE:        2
	VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_BORDER:      3
	VK_SAMPLER_ADDRESS_MODE_MIRROR_CLAMP_TO_EDGE: 4
	VK_SAMPLER_ADDRESS_MODE_BEGIN_RANGE:          VK_SAMPLER_ADDRESS_MODE_REPEAT
	VK_SAMPLER_ADDRESS_MODE_END_RANGE:            VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_BORDER
	VK_SAMPLER_ADDRESS_MODE_RANGE_SIZE:           4 ; (VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_BORDER - VK_SAMPLER_ADDRESS_MODE_REPEAT + 1)
	VK_SAMPLER_ADDRESS_MODE_MAX_ENUM:             7FFFFFFFh
]

#enum VkBorderColor! [
	VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK: 0
	VK_BORDER_COLOR_INT_TRANSPARENT_BLACK:   1
	VK_BORDER_COLOR_FLOAT_OPAQUE_BLACK:      2
	VK_BORDER_COLOR_INT_OPAQUE_BLACK:        3
	VK_BORDER_COLOR_FLOAT_OPAQUE_WHITE:      4
	VK_BORDER_COLOR_INT_OPAQUE_WHITE:        5
	VK_BORDER_COLOR_BEGIN_RANGE:             VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK
	VK_BORDER_COLOR_END_RANGE:               VK_BORDER_COLOR_INT_OPAQUE_WHITE
	VK_BORDER_COLOR_RANGE_SIZE:              6 ; (VK_BORDER_COLOR_INT_OPAQUE_WHITE - VK_BORDER_COLOR_FLOAT_TRANSPARENT_BLACK + 1)
	VK_BORDER_COLOR_MAX_ENUM:                7FFFFFFFh
]

#enum VkDescriptorType! [
	VK_DESCRIPTOR_TYPE_SAMPLER:                0
	VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER: 1
	VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE:          2
	VK_DESCRIPTOR_TYPE_STORAGE_IMAGE:          3
	VK_DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER:   4
	VK_DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER:   5
	VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER:         6
	VK_DESCRIPTOR_TYPE_STORAGE_BUFFER:         7
	VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC: 8
	VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC: 9
	VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT:       10
	VK_DESCRIPTOR_TYPE_BEGIN_RANGE:            VK_DESCRIPTOR_TYPE_SAMPLER
	VK_DESCRIPTOR_TYPE_END_RANGE:              VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT
	VK_DESCRIPTOR_TYPE_RANGE_SIZE:             11 ; (VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT - VK_DESCRIPTOR_TYPE_SAMPLER + 1)
	VK_DESCRIPTOR_TYPE_MAX_ENUM:               7FFFFFFFh
]

#enum VkAttachmentLoadOp! [
	VK_ATTACHMENT_LOAD_OP_LOAD:        0
	VK_ATTACHMENT_LOAD_OP_CLEAR:       1
	VK_ATTACHMENT_LOAD_OP_DONT_CARE:   2
	VK_ATTACHMENT_LOAD_OP_BEGIN_RANGE: VK_ATTACHMENT_LOAD_OP_LOAD
	VK_ATTACHMENT_LOAD_OP_END_RANGE:   VK_ATTACHMENT_LOAD_OP_DONT_CARE
	VK_ATTACHMENT_LOAD_OP_RANGE_SIZE:  3 ; (VK_ATTACHMENT_LOAD_OP_DONT_CARE - VK_ATTACHMENT_LOAD_OP_LOAD + 1)
	VK_ATTACHMENT_LOAD_OP_MAX_ENUM:    7FFFFFFFh
]

#enum VkAttachmentStoreOp! [
	VK_ATTACHMENT_STORE_OP_STORE:       0
	VK_ATTACHMENT_STORE_OP_DONT_CARE:   1
	VK_ATTACHMENT_STORE_OP_BEGIN_RANGE: VK_ATTACHMENT_STORE_OP_STORE
	VK_ATTACHMENT_STORE_OP_END_RANGE:   VK_ATTACHMENT_STORE_OP_DONT_CARE
	VK_ATTACHMENT_STORE_OP_RANGE_SIZE:  2 ; (VK_ATTACHMENT_STORE_OP_DONT_CARE - VK_ATTACHMENT_STORE_OP_STORE + 1)
	VK_ATTACHMENT_STORE_OP_MAX_ENUM:    7FFFFFFFh
]

#enum VkPipelineBindPoint! [
	VK_PIPELINE_BIND_POINT_GRAPHICS:    0
	VK_PIPELINE_BIND_POINT_COMPUTE:     1
	VK_PIPELINE_BIND_POINT_BEGIN_RANGE: VK_PIPELINE_BIND_POINT_GRAPHICS
	VK_PIPELINE_BIND_POINT_END_RANGE:   VK_PIPELINE_BIND_POINT_COMPUTE
	VK_PIPELINE_BIND_POINT_RANGE_SIZE:  2 ; (VK_PIPELINE_BIND_POINT_COMPUTE - VK_PIPELINE_BIND_POINT_GRAPHICS + 1)
	VK_PIPELINE_BIND_POINT_MAX_ENUM:    7FFFFFFFh
]

#enum VkCommandBufferLevel! [
	VK_COMMAND_BUFFER_LEVEL_PRIMARY:     0
	VK_COMMAND_BUFFER_LEVEL_SECONDARY:   1
	VK_COMMAND_BUFFER_LEVEL_BEGIN_RANGE: VK_COMMAND_BUFFER_LEVEL_PRIMARY
	VK_COMMAND_BUFFER_LEVEL_END_RANGE:   VK_COMMAND_BUFFER_LEVEL_SECONDARY
	VK_COMMAND_BUFFER_LEVEL_RANGE_SIZE:  2 ; (VK_COMMAND_BUFFER_LEVEL_SECONDARY - VK_COMMAND_BUFFER_LEVEL_PRIMARY + 1)
	VK_COMMAND_BUFFER_LEVEL_MAX_ENUM:    7FFFFFFFh
]

#enum VkIndexType! [
	VK_INDEX_TYPE_UINT16:      0
	VK_INDEX_TYPE_UINT32:      1
	VK_INDEX_TYPE_BEGIN_RANGE: VK_INDEX_TYPE_UINT16
	VK_INDEX_TYPE_END_RANGE:   VK_INDEX_TYPE_UINT32
	VK_INDEX_TYPE_RANGE_SIZE:  2 ; (VK_INDEX_TYPE_UINT32 - VK_INDEX_TYPE_UINT16 + 1)
	VK_INDEX_TYPE_MAX_ENUM:    7FFFFFFFh
]

#enum VkSubpassContents! [
	VK_SUBPASS_CONTENTS_INLINE:                    0
	VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS: 1
	VK_SUBPASS_CONTENTS_BEGIN_RANGE:               VK_SUBPASS_CONTENTS_INLINE
	VK_SUBPASS_CONTENTS_END_RANGE:                 VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS
	VK_SUBPASS_CONTENTS_RANGE_SIZE:                2 ; (VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS - VK_SUBPASS_CONTENTS_INLINE + 1)
	VK_SUBPASS_CONTENTS_MAX_ENUM:                  7FFFFFFFh
]

#enum VkObjectType! [
	VK_OBJECT_TYPE_UNKNOWN:                        0
	VK_OBJECT_TYPE_INSTANCE:                       1
	VK_OBJECT_TYPE_PHYSICAL_DEVICE:                2
	VK_OBJECT_TYPE_DEVICE:                         3
	VK_OBJECT_TYPE_QUEUE:                          4
	VK_OBJECT_TYPE_SEMAPHORE:                      5
	VK_OBJECT_TYPE_COMMAND_BUFFER:                 6
	VK_OBJECT_TYPE_FENCE:                          7
	VK_OBJECT_TYPE_DEVICE_MEMORY:                  8
	VK_OBJECT_TYPE_BUFFER:                         9
	VK_OBJECT_TYPE_IMAGE:                          10
	VK_OBJECT_TYPE_EVENT:                          11
	VK_OBJECT_TYPE_QUERY_POOL:                     12
	VK_OBJECT_TYPE_BUFFER_VIEW:                    13
	VK_OBJECT_TYPE_IMAGE_VIEW:                     14
	VK_OBJECT_TYPE_SHADER_MODULE:                  15
	VK_OBJECT_TYPE_PIPELINE_CACHE:                 16
	VK_OBJECT_TYPE_PIPELINE_LAYOUT:                17
	VK_OBJECT_TYPE_RENDER_PASS:                    18
	VK_OBJECT_TYPE_PIPELINE:                       19
	VK_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT:          20
	VK_OBJECT_TYPE_SAMPLER:                        21
	VK_OBJECT_TYPE_DESCRIPTOR_POOL:                22
	VK_OBJECT_TYPE_DESCRIPTOR_SET:                 23
	VK_OBJECT_TYPE_FRAMEBUFFER:                    24
	VK_OBJECT_TYPE_COMMAND_POOL:                   25
	VK_OBJECT_TYPE_SURFACE_KHR:                    1000000000
	VK_OBJECT_TYPE_SWAPCHAIN_KHR:                  1000001000
	VK_OBJECT_TYPE_DISPLAY_KHR:                    1000002000
	VK_OBJECT_TYPE_DISPLAY_MODE_KHR:               1000002001
	VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT:      1000011000
	VK_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR: 1000085000
	VK_OBJECT_TYPE_OBJECT_TABLE_NVX:               1000086000
	VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX:   1000086001
	VK_OBJECT_TYPE_BEGIN_RANGE:                    VK_OBJECT_TYPE_UNKNOWN
	VK_OBJECT_TYPE_END_RANGE:                      VK_OBJECT_TYPE_COMMAND_POOL
	VK_OBJECT_TYPE_RANGE_SIZE:                     26 ; (VK_OBJECT_TYPE_COMMAND_POOL - VK_OBJECT_TYPE_UNKNOWN + 1)
	VK_OBJECT_TYPE_MAX_ENUM:                       7FFFFFFFh
]
#define VkInstanceCreateFlags! VkFlags!

#enum VkFormatFeatureFlagBits! [
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT:                  00000001h
	VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT:                  00000002h
	VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT:           00000004h
	VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT:           00000008h
	VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT:           00000010h
	VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT:    00000020h
	VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT:                  00000040h
	VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT:               00000080h
	VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT:         00000100h
	VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT:       00000200h
	VK_FORMAT_FEATURE_BLIT_SRC_BIT:                       00000400h
	VK_FORMAT_FEATURE_BLIT_DST_BIT:                       00000800h
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT:    00001000h
	VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG: 00002000h
	VK_FORMAT_FEATURE_TRANSFER_SRC_BIT_KHR:               00004000h
	VK_FORMAT_FEATURE_TRANSFER_DST_BIT_KHR:               00008000h
	VK_FORMAT_FEATURE_FLAG_BITS_MAX_ENUM:                 7FFFFFFFh
]
#define VkFormatFeatureFlags! VkFlags!

#enum VkImageUsageFlagBits! [
	VK_IMAGE_USAGE_TRANSFER_SRC_BIT:             00000001h
	VK_IMAGE_USAGE_TRANSFER_DST_BIT:             00000002h
	VK_IMAGE_USAGE_SAMPLED_BIT:                  00000004h
	VK_IMAGE_USAGE_STORAGE_BIT:                  00000008h
	VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT:         00000010h
	VK_IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT: 00000020h
	VK_IMAGE_USAGE_TRANSIENT_ATTACHMENT_BIT:     00000040h
	VK_IMAGE_USAGE_INPUT_ATTACHMENT_BIT:         00000080h
	VK_IMAGE_USAGE_FLAG_BITS_MAX_ENUM:           7FFFFFFFh
]
#define VkImageUsageFlags! VkFlags!

#enum VkImageCreateFlagBits! [
	VK_IMAGE_CREATE_SPARSE_BINDING_BIT:          00000001h
	VK_IMAGE_CREATE_SPARSE_RESIDENCY_BIT:        00000002h
	VK_IMAGE_CREATE_SPARSE_ALIASED_BIT:          00000004h
	VK_IMAGE_CREATE_MUTABLE_FORMAT_BIT:          00000008h
	VK_IMAGE_CREATE_CUBE_COMPATIBLE_BIT:         00000010h
	VK_IMAGE_CREATE_BIND_SFR_BIT_KHX:            00000040h
	VK_IMAGE_CREATE_2D_ARRAY_COMPATIBLE_BIT_KHR: 00000020h
	VK_IMAGE_CREATE_FLAG_BITS_MAX_ENUM:          7FFFFFFFh
]
#define VkImageCreateFlags! VkFlags!

#enum VkSampleCountFlagBits! [
	VK_SAMPLE_COUNT_1_BIT:              00000001h
	VK_SAMPLE_COUNT_2_BIT:              00000002h
	VK_SAMPLE_COUNT_4_BIT:              00000004h
	VK_SAMPLE_COUNT_8_BIT:              00000008h
	VK_SAMPLE_COUNT_16_BIT:             00000010h
	VK_SAMPLE_COUNT_32_BIT:             00000020h
	VK_SAMPLE_COUNT_64_BIT:             00000040h
	VK_SAMPLE_COUNT_FLAG_BITS_MAX_ENUM: 7FFFFFFFh
]
#define VkSampleCountFlags! VkFlags!

#enum VkQueueFlagBits! [
	VK_QUEUE_GRAPHICS_BIT:       00000001h
	VK_QUEUE_COMPUTE_BIT:        00000002h
	VK_QUEUE_TRANSFER_BIT:       00000004h
	VK_QUEUE_SPARSE_BINDING_BIT: 00000008h
	VK_QUEUE_FLAG_BITS_MAX_ENUM: 7FFFFFFFh
]
#define VkQueueFlags! VkFlags!

#enum VkMemoryPropertyFlagBits! [
	VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT:     00000001h
	VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT:     00000002h
	VK_MEMORY_PROPERTY_HOST_COHERENT_BIT:    00000004h
	VK_MEMORY_PROPERTY_HOST_CACHED_BIT:      00000008h
	VK_MEMORY_PROPERTY_LAZILY_ALLOCATED_BIT: 00000010h
	VK_MEMORY_PROPERTY_FLAG_BITS_MAX_ENUM:   7FFFFFFFh
]
#define VkMemoryPropertyFlags! VkFlags!

#enum VkMemoryHeapFlagBits! [
	VK_MEMORY_HEAP_DEVICE_LOCAL_BIT:       00000001h
	VK_MEMORY_HEAP_MULTI_INSTANCE_BIT_KHX: 00000002h
	VK_MEMORY_HEAP_FLAG_BITS_MAX_ENUM:     7FFFFFFFh
]
#define VkMemoryHeapFlags! VkFlags!
#define VkDeviceCreateFlags! VkFlags!
#define VkDeviceQueueCreateFlags! VkFlags!

#enum VkPipelineStageFlagBits! [
	VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT:                    00000001h
	VK_PIPELINE_STAGE_DRAW_INDIRECT_BIT:                  00000002h
	VK_PIPELINE_STAGE_VERTEX_INPUT_BIT:                   00000004h
	VK_PIPELINE_STAGE_VERTEX_SHADER_BIT:                  00000008h
	VK_PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT:    00000010h
	VK_PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT: 00000020h
	VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT:                00000040h
	VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT:                00000080h
	VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT:           00000100h
	VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT:            00000200h
	VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT:        00000400h
	VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT:                 00000800h
	VK_PIPELINE_STAGE_TRANSFER_BIT:                       00001000h
	VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT:                 00002000h
	VK_PIPELINE_STAGE_HOST_BIT:                           00004000h
	VK_PIPELINE_STAGE_ALL_GRAPHICS_BIT:                   00008000h
	VK_PIPELINE_STAGE_ALL_COMMANDS_BIT:                   00010000h
	VK_PIPELINE_STAGE_COMMAND_PROCESS_BIT_NVX:            00020000h
	VK_PIPELINE_STAGE_FLAG_BITS_MAX_ENUM:                 7FFFFFFFh
]
#define VkPipelineStageFlags! VkFlags!
#define VkMemoryMapFlags! VkFlags!

#enum VkImageAspectFlagBits! [
	VK_IMAGE_ASPECT_COLOR_BIT:          00000001h
	VK_IMAGE_ASPECT_DEPTH_BIT:          00000002h
	VK_IMAGE_ASPECT_STENCIL_BIT:        00000004h
	VK_IMAGE_ASPECT_METADATA_BIT:       00000008h
	VK_IMAGE_ASPECT_FLAG_BITS_MAX_ENUM: 7FFFFFFFh
]
#define VkImageAspectFlags! VkFlags!

#enum VkSparseImageFormatFlagBits! [
	VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT:         00000001h
	VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT:       00000002h
	VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT: 00000004h
	VK_SPARSE_IMAGE_FORMAT_FLAG_BITS_MAX_ENUM:         7FFFFFFFh
]
#define VkSparseImageFormatFlags! VkFlags!

#enum VkSparseMemoryBindFlagBits! [
	VK_SPARSE_MEMORY_BIND_METADATA_BIT:       00000001h
	VK_SPARSE_MEMORY_BIND_FLAG_BITS_MAX_ENUM: 7FFFFFFFh
]
#define VkSparseMemoryBindFlags! VkFlags!

#enum VkFenceCreateFlagBits! [
	VK_FENCE_CREATE_SIGNALED_BIT:       00000001h
	VK_FENCE_CREATE_FLAG_BITS_MAX_ENUM: 7FFFFFFFh
]
#define VkFenceCreateFlags! VkFlags!
#define VkSemaphoreCreateFlags! VkFlags!
#define VkEventCreateFlags! VkFlags!
#define VkQueryPoolCreateFlags! VkFlags!

#enum VkQueryPipelineStatisticFlagBits! [
	VK_QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_VERTICES_BIT:                    00000001h
	VK_QUERY_PIPELINE_STATISTIC_INPUT_ASSEMBLY_PRIMITIVES_BIT:                  00000002h
	VK_QUERY_PIPELINE_STATISTIC_VERTEX_SHADER_INVOCATIONS_BIT:                  00000004h
	VK_QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_INVOCATIONS_BIT:                00000008h
	VK_QUERY_PIPELINE_STATISTIC_GEOMETRY_SHADER_PRIMITIVES_BIT:                 00000010h
	VK_QUERY_PIPELINE_STATISTIC_CLIPPING_INVOCATIONS_BIT:                       00000020h
	VK_QUERY_PIPELINE_STATISTIC_CLIPPING_PRIMITIVES_BIT:                        00000040h
	VK_QUERY_PIPELINE_STATISTIC_FRAGMENT_SHADER_INVOCATIONS_BIT:                00000080h
	VK_QUERY_PIPELINE_STATISTIC_TESSELLATION_CONTROL_SHADER_PATCHES_BIT:        00000100h
	VK_QUERY_PIPELINE_STATISTIC_TESSELLATION_EVALUATION_SHADER_INVOCATIONS_BIT: 00000200h
	VK_QUERY_PIPELINE_STATISTIC_COMPUTE_SHADER_INVOCATIONS_BIT:                 00000400h
	VK_QUERY_PIPELINE_STATISTIC_FLAG_BITS_MAX_ENUM:                             7FFFFFFFh
]
#define VkQueryPipelineStatisticFlags! VkFlags!

#enum VkQueryResultFlagBits! [
	VK_QUERY_RESULT_64_BIT:                00000001h
	VK_QUERY_RESULT_WAIT_BIT:              00000002h
	VK_QUERY_RESULT_WITH_AVAILABILITY_BIT: 00000004h
	VK_QUERY_RESULT_PARTIAL_BIT:           00000008h
	VK_QUERY_RESULT_FLAG_BITS_MAX_ENUM:    7FFFFFFFh
]
#define VkQueryResultFlags! VkFlags!

#enum VkBufferCreateFlagBits! [
	VK_BUFFER_CREATE_SPARSE_BINDING_BIT:   00000001h
	VK_BUFFER_CREATE_SPARSE_RESIDENCY_BIT: 00000002h
	VK_BUFFER_CREATE_SPARSE_ALIASED_BIT:   00000004h
	VK_BUFFER_CREATE_FLAG_BITS_MAX_ENUM:   7FFFFFFFh
]
#define VkBufferCreateFlags! VkFlags!

#enum VkBufferUsageFlagBits! [
	VK_BUFFER_USAGE_TRANSFER_SRC_BIT:         00000001h
	VK_BUFFER_USAGE_TRANSFER_DST_BIT:         00000002h
	VK_BUFFER_USAGE_UNIFORM_TEXEL_BUFFER_BIT: 00000004h
	VK_BUFFER_USAGE_STORAGE_TEXEL_BUFFER_BIT: 00000008h
	VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT:       00000010h
	VK_BUFFER_USAGE_STORAGE_BUFFER_BIT:       00000020h
	VK_BUFFER_USAGE_INDEX_BUFFER_BIT:         00000040h
	VK_BUFFER_USAGE_VERTEX_BUFFER_BIT:        00000080h
	VK_BUFFER_USAGE_INDIRECT_BUFFER_BIT:      00000100h
	VK_BUFFER_USAGE_FLAG_BITS_MAX_ENUM:       7FFFFFFFh
]
#define VkBufferUsageFlags! VkFlags!
#define VkBufferViewCreateFlags! VkFlags!
#define VkImageViewCreateFlags! VkFlags!
#define VkShaderModuleCreateFlags! VkFlags!
#define VkPipelineCacheCreateFlags! VkFlags!

#enum VkPipelineCreateFlagBits! [
	VK_PIPELINE_CREATE_DISABLE_OPTIMIZATION_BIT:             00000001h
	VK_PIPELINE_CREATE_ALLOW_DERIVATIVES_BIT:                00000002h
	VK_PIPELINE_CREATE_DERIVATIVE_BIT:                       00000004h
	VK_PIPELINE_CREATE_VIEW_INDEX_FROM_DEVICE_INDEX_BIT_KHX: 00000008h
	VK_PIPELINE_CREATE_DISPATCH_BASE_KHX:                    00000010h
	VK_PIPELINE_CREATE_FLAG_BITS_MAX_ENUM:                   7FFFFFFFh
]
#define VkPipelineCreateFlags! VkFlags!
#define VkPipelineShaderStageCreateFlags! VkFlags!

#enum VkShaderStageFlagBits! [
	VK_SHADER_STAGE_VERTEX_BIT:                  00000001h
	VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT:    00000002h
	VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT: 00000004h
	VK_SHADER_STAGE_GEOMETRY_BIT:                00000008h
	VK_SHADER_STAGE_FRAGMENT_BIT:                00000010h
	VK_SHADER_STAGE_COMPUTE_BIT:                 00000020h
	VK_SHADER_STAGE_ALL_GRAPHICS:                0000001Fh
	VK_SHADER_STAGE_ALL:                         7FFFFFFFh
	VK_SHADER_STAGE_FLAG_BITS_MAX_ENUM:          7FFFFFFFh
]
#define VkPipelineVertexInputStateCreateFlags! VkFlags!
#define VkPipelineInputAssemblyStateCreateFlags! VkFlags!
#define VkPipelineTessellationStateCreateFlags! VkFlags!
#define VkPipelineViewportStateCreateFlags! VkFlags!
#define VkPipelineRasterizationStateCreateFlags! VkFlags!

#enum VkCullModeFlagBits! [
	VK_CULL_MODE_NONE:               0
	VK_CULL_MODE_FRONT_BIT:          00000001h
	VK_CULL_MODE_BACK_BIT:           00000002h
	VK_CULL_MODE_FRONT_AND_BACK:     00000003h
	VK_CULL_MODE_FLAG_BITS_MAX_ENUM: 7FFFFFFFh
]
#define VkCullModeFlags! VkFlags!
#define VkPipelineMultisampleStateCreateFlags! VkFlags!
#define VkPipelineDepthStencilStateCreateFlags! VkFlags!
#define VkPipelineColorBlendStateCreateFlags! VkFlags!

#enum VkColorComponentFlagBits! [
	VK_COLOR_COMPONENT_R_BIT:              00000001h
	VK_COLOR_COMPONENT_G_BIT:              00000002h
	VK_COLOR_COMPONENT_B_BIT:              00000004h
	VK_COLOR_COMPONENT_A_BIT:              00000008h
	VK_COLOR_COMPONENT_FLAG_BITS_MAX_ENUM: 7FFFFFFFh
]
#define VkColorComponentFlags! VkFlags!
#define VkPipelineDynamicStateCreateFlags! VkFlags!
#define VkPipelineLayoutCreateFlags! VkFlags!
#define VkShaderStageFlags! VkFlags!
#define VkSamplerCreateFlags! VkFlags!

#enum VkDescriptorSetLayoutCreateFlagBits! [
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR: 00000001h
	VK_DESCRIPTOR_SET_LAYOUT_CREATE_FLAG_BITS_MAX_ENUM:      7FFFFFFFh
]
#define VkDescriptorSetLayoutCreateFlags! VkFlags!

#enum VkDescriptorPoolCreateFlagBits! [
	VK_DESCRIPTOR_POOL_CREATE_FREE_DESCRIPTOR_SET_BIT: 00000001h
	VK_DESCRIPTOR_POOL_CREATE_FLAG_BITS_MAX_ENUM:      7FFFFFFFh
]
#define VkDescriptorPoolCreateFlags! VkFlags!
#define VkDescriptorPoolResetFlags! VkFlags!
#define VkFramebufferCreateFlags! VkFlags!
#define VkRenderPassCreateFlags! VkFlags!

#enum VkAttachmentDescriptionFlagBits! [
	VK_ATTACHMENT_DESCRIPTION_MAY_ALIAS_BIT:      00000001h
	VK_ATTACHMENT_DESCRIPTION_FLAG_BITS_MAX_ENUM: 7FFFFFFFh
]
#define VkAttachmentDescriptionFlags! VkFlags!

#enum VkSubpassDescriptionFlagBits! [
	VK_SUBPASS_DESCRIPTION_PER_VIEW_ATTRIBUTES_BIT_NVX:      00000001h
	VK_SUBPASS_DESCRIPTION_PER_VIEW_POSITION_X_ONLY_BIT_NVX: 00000002h
	VK_SUBPASS_DESCRIPTION_FLAG_BITS_MAX_ENUM:               7FFFFFFFh
]
#define VkSubpassDescriptionFlags! VkFlags!

#enum VkAccessFlagBits! [
	VK_ACCESS_INDIRECT_COMMAND_READ_BIT:          00000001h
	VK_ACCESS_INDEX_READ_BIT:                     00000002h
	VK_ACCESS_VERTEX_ATTRIBUTE_READ_BIT:          00000004h
	VK_ACCESS_UNIFORM_READ_BIT:                   00000008h
	VK_ACCESS_INPUT_ATTACHMENT_READ_BIT:          00000010h
	VK_ACCESS_SHADER_READ_BIT:                    00000020h
	VK_ACCESS_SHADER_WRITE_BIT:                   00000040h
	VK_ACCESS_COLOR_ATTACHMENT_READ_BIT:          00000080h
	VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT:         00000100h
	VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT:  00000200h
	VK_ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT: 00000400h
	VK_ACCESS_TRANSFER_READ_BIT:                  00000800h
	VK_ACCESS_TRANSFER_WRITE_BIT:                 00001000h
	VK_ACCESS_HOST_READ_BIT:                      00002000h
	VK_ACCESS_HOST_WRITE_BIT:                     00004000h
	VK_ACCESS_MEMORY_READ_BIT:                    00008000h
	VK_ACCESS_MEMORY_WRITE_BIT:                   00010000h
	VK_ACCESS_COMMAND_PROCESS_READ_BIT_NVX:       00020000h
	VK_ACCESS_COMMAND_PROCESS_WRITE_BIT_NVX:      00040000h
	VK_ACCESS_FLAG_BITS_MAX_ENUM:                 7FFFFFFFh
]
#define VkAccessFlags! VkFlags!

#enum VkDependencyFlagBits! [
	VK_DEPENDENCY_BY_REGION_BIT:        00000001h
	VK_DEPENDENCY_VIEW_LOCAL_BIT_KHX:   00000002h
	VK_DEPENDENCY_DEVICE_GROUP_BIT_KHX: 00000004h
	VK_DEPENDENCY_FLAG_BITS_MAX_ENUM:   7FFFFFFFh
]
#define VkDependencyFlags! VkFlags!

#enum VkCommandPoolCreateFlagBits! [
	VK_COMMAND_POOL_CREATE_TRANSIENT_BIT:            00000001h
	VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT: 00000002h
	VK_COMMAND_POOL_CREATE_FLAG_BITS_MAX_ENUM:       7FFFFFFFh
]
#define VkCommandPoolCreateFlags! VkFlags!

#enum VkCommandPoolResetFlagBits! [
	VK_COMMAND_POOL_RESET_RELEASE_RESOURCES_BIT: 00000001h
	VK_COMMAND_POOL_RESET_FLAG_BITS_MAX_ENUM:    7FFFFFFFh
]
#define VkCommandPoolResetFlags! VkFlags!

#enum VkCommandBufferUsageFlagBits! [
	VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT:      00000001h
	VK_COMMAND_BUFFER_USAGE_RENDER_PASS_CONTINUE_BIT: 00000002h
	VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT:     00000004h
	VK_COMMAND_BUFFER_USAGE_FLAG_BITS_MAX_ENUM:       7FFFFFFFh
]
#define VkCommandBufferUsageFlags! VkFlags!

#enum VkQueryControlFlagBits! [
	VK_QUERY_CONTROL_PRECISE_BIT:        00000001h
	VK_QUERY_CONTROL_FLAG_BITS_MAX_ENUM: 7FFFFFFFh
]
#define VkQueryControlFlags! VkFlags!

#enum VkCommandBufferResetFlagBits! [
	VK_COMMAND_BUFFER_RESET_RELEASE_RESOURCES_BIT: 00000001h
	VK_COMMAND_BUFFER_RESET_FLAG_BITS_MAX_ENUM:    7FFFFFFFh
]
#define VkCommandBufferResetFlags! VkFlags!

#enum VkStencilFaceFlagBits! [
	VK_STENCIL_FACE_FRONT_BIT:          00000001h
	VK_STENCIL_FACE_BACK_BIT:           00000002h
	VK_STENCIL_FRONT_AND_BACK:          00000003h
	VK_STENCIL_FACE_FLAG_BITS_MAX_ENUM: 7FFFFFFFh
]
#define VkStencilFaceFlags! VkFlags!
vkAllocationFunction!: alias function! [
	pUserData       [ pointer! [byte!] ]
	size            [ integer! ]
	alignment       [ integer! ]
	allocationScope [ VkSystemAllocationScope! ]
	return:         [ pointer! [byte!] ]
]
vkReallocationFunction!: alias function! [
	pUserData       [ pointer! [byte!] ]
	pOriginal       [ pointer! [byte!] ]
	size            [ integer! ]
	alignment       [ integer! ]
	allocationScope [ VkSystemAllocationScope! ]
	return:         [ pointer! [byte!] ]
]
vkFreeFunction!: alias function! [
	pUserData       [ pointer! [byte!] ]
	pMemory         [ pointer! [byte!] ]
]
vkInternalAllocationNotification!: alias function! [
	pUserData       [ pointer! [byte!] ]
	size            [ integer! ]
	allocationType  [ VkInternalAllocationType! ]
	allocationScope [ VkSystemAllocationScope! ]
]
vkInternalFreeNotification!: alias function! [
	pUserData       [ pointer! [byte!] ]
	size            [ integer! ]
	allocationType  [ VkInternalAllocationType! ]
	allocationScope [ VkSystemAllocationScope! ]
]
vkVoidFunction!: alias function! [
]

VkApplicationInfo!: alias struct! [
	sType              [ VkStructureType! ]
	pNext              [ pointer! [byte!] ]
	pApplicationName   [ c-string! ]
	applicationVersion [ integer! ]
	pEngineName        [ c-string! ]
	engineVersion      [ integer! ]
	apiVersion         [ integer! ]
]

VkInstanceCreateInfo!: alias struct! [
	sType                   [ VkStructureType! ]
	pNext                   [ pointer! [byte!] ]
	flags                   [ VkInstanceCreateFlags! ]
	pApplicationInfo        [ VkApplicationInfo! ]
	enabledLayerCount       [ integer! ]
	ppEnabledLayerNames     [ string-ptr! ]
	enabledExtensionCount   [ integer! ]
	ppEnabledExtensionNames [ string-ptr! ]
]

VkAllocationCallbacks!: alias struct! [
	pUserData             [ pointer! [byte!] ]
	pfnAllocation         [ vkAllocationFunction! ]
	pfnReallocation       [ vkReallocationFunction! ]
	pfnFree               [ vkFreeFunction! ]
	pfnInternalAllocation [ vkInternalAllocationNotification! ]
	pfnInternalFree       [ vkInternalFreeNotification! ]
]

VkPhysicalDeviceFeatures!: alias struct! [
	robustBufferAccess                      [ VkBool32! ]
	fullDrawIndexUint32                     [ VkBool32! ]
	imageCubeArray                          [ VkBool32! ]
	independentBlend                        [ VkBool32! ]
	geometryShader                          [ VkBool32! ]
	tessellationShader                      [ VkBool32! ]
	sampleRateShading                       [ VkBool32! ]
	dualSrcBlend                            [ VkBool32! ]
	logicOp                                 [ VkBool32! ]
	multiDrawIndirect                       [ VkBool32! ]
	drawIndirectFirstInstance               [ VkBool32! ]
	depthClamp                              [ VkBool32! ]
	depthBiasClamp                          [ VkBool32! ]
	fillModeNonSolid                        [ VkBool32! ]
	depthBounds                             [ VkBool32! ]
	wideLines                               [ VkBool32! ]
	largePoints                             [ VkBool32! ]
	alphaToOne                              [ VkBool32! ]
	multiViewport                           [ VkBool32! ]
	samplerAnisotropy                       [ VkBool32! ]
	textureCompressionETC2                  [ VkBool32! ]
	textureCompressionASTC_LDR              [ VkBool32! ]
	textureCompressionBC                    [ VkBool32! ]
	occlusionQueryPrecise                   [ VkBool32! ]
	pipelineStatisticsQuery                 [ VkBool32! ]
	vertexPipelineStoresAndAtomics          [ VkBool32! ]
	fragmentStoresAndAtomics                [ VkBool32! ]
	shaderTessellationAndGeometryPointSize  [ VkBool32! ]
	shaderImageGatherExtended               [ VkBool32! ]
	shaderStorageImageExtendedFormats       [ VkBool32! ]
	shaderStorageImageMultisample           [ VkBool32! ]
	shaderStorageImageReadWithoutFormat     [ VkBool32! ]
	shaderStorageImageWriteWithoutFormat    [ VkBool32! ]
	shaderUniformBufferArrayDynamicIndexing [ VkBool32! ]
	shaderSampledImageArrayDynamicIndexing  [ VkBool32! ]
	shaderStorageBufferArrayDynamicIndexing [ VkBool32! ]
	shaderStorageImageArrayDynamicIndexing  [ VkBool32! ]
	shaderClipDistance                      [ VkBool32! ]
	shaderCullDistance                      [ VkBool32! ]
	shaderFloat64                           [ VkBool32! ]
	shaderInt64                             [ VkBool32! ]
	shaderInt16                             [ VkBool32! ]
	shaderResourceResidency                 [ VkBool32! ]
	shaderResourceMinLod                    [ VkBool32! ]
	sparseBinding                           [ VkBool32! ]
	sparseResidencyBuffer                   [ VkBool32! ]
	sparseResidencyImage2D                  [ VkBool32! ]
	sparseResidencyImage3D                  [ VkBool32! ]
	sparseResidency2Samples                 [ VkBool32! ]
	sparseResidency4Samples                 [ VkBool32! ]
	sparseResidency8Samples                 [ VkBool32! ]
	sparseResidency16Samples                [ VkBool32! ]
	sparseResidencyAliased                  [ VkBool32! ]
	variableMultisampleRate                 [ VkBool32! ]
	inheritedQueries                        [ VkBool32! ]
]

VkFormatProperties!: alias struct! [
	linearTilingFeatures  [ VkFormatFeatureFlags! ]
	optimalTilingFeatures [ VkFormatFeatureFlags! ]
	bufferFeatures        [ VkFormatFeatureFlags! ]
]

VkExtent3D!: alias struct! [
	width           [ integer! ]
	height          [ integer! ]
	depth           [ integer! ]
]

VkImageFormatProperties!: alias struct! [
	maxExtent       [ VkExtent3D! value ]
	maxMipLevels    [ integer! ]
	maxArrayLayers  [ integer! ]
	sampleCounts    [ VkSampleCountFlags! ]
	maxResourceSize [ VkDeviceSize! ]
]

VkPhysicalDeviceLimits!: alias struct! [
	maxImageDimension1D                             [ integer! ]
	maxImageDimension2D                             [ integer! ]
	maxImageDimension3D                             [ integer! ]
	maxImageDimensionCube                           [ integer! ]
	maxImageArrayLayers                             [ integer! ]
	maxTexelBufferElements                          [ integer! ]
	maxUniformBufferRange                           [ integer! ]
	maxStorageBufferRange                           [ integer! ]
	maxPushConstantsSize                            [ integer! ]
	maxMemoryAllocationCount                        [ integer! ]
	maxSamplerAllocationCount                       [ integer! ]
	bufferImageGranularity                          [ VkDeviceSize! ]
	sparseAddressSpaceSize                          [ VkDeviceSize! ]
	maxBoundDescriptorSets                          [ integer! ]
	maxPerStageDescriptorSamplers                   [ integer! ]
	maxPerStageDescriptorUniformBuffers             [ integer! ]
	maxPerStageDescriptorStorageBuffers             [ integer! ]
	maxPerStageDescriptorSampledImages              [ integer! ]
	maxPerStageDescriptorStorageImages              [ integer! ]
	maxPerStageDescriptorInputAttachments           [ integer! ]
	maxPerStageResources                            [ integer! ]
	maxDescriptorSetSamplers                        [ integer! ]
	maxDescriptorSetUniformBuffers                  [ integer! ]
	maxDescriptorSetUniformBuffersDynamic           [ integer! ]
	maxDescriptorSetStorageBuffers                  [ integer! ]
	maxDescriptorSetStorageBuffersDynamic           [ integer! ]
	maxDescriptorSetSampledImages                   [ integer! ]
	maxDescriptorSetStorageImages                   [ integer! ]
	maxDescriptorSetInputAttachments                [ integer! ]
	maxVertexInputAttributes                        [ integer! ]
	maxVertexInputBindings                          [ integer! ]
	maxVertexInputAttributeOffset                   [ integer! ]
	maxVertexInputBindingStride                     [ integer! ]
	maxVertexOutputComponents                       [ integer! ]
	maxTessellationGenerationLevel                  [ integer! ]
	maxTessellationPatchSize                        [ integer! ]
	maxTessellationControlPerVertexInputComponents  [ integer! ]
	maxTessellationControlPerVertexOutputComponents [ integer! ]
	maxTessellationControlPerPatchOutputComponents  [ integer! ]
	maxTessellationControlTotalOutputComponents     [ integer! ]
	maxTessellationEvaluationInputComponents        [ integer! ]
	maxTessellationEvaluationOutputComponents       [ integer! ]
	maxGeometryShaderInvocations                    [ integer! ]
	maxGeometryInputComponents                      [ integer! ]
	maxGeometryOutputComponents                     [ integer! ]
	maxGeometryOutputVertices                       [ integer! ]
	maxGeometryTotalOutputComponents                [ integer! ]
	maxFragmentInputComponents                      [ integer! ]
	maxFragmentOutputAttachments                    [ integer! ]
	maxFragmentDualSrcAttachments                   [ integer! ]
	maxFragmentCombinedOutputResources              [ integer! ]
	maxComputeSharedMemorySize                      [ integer! ]
	maxComputeWorkGroupCount                        [ integer! ]
	maxComputeWorkGroupInvocations                  [ integer! ]
	maxComputeWorkGroupSize                         [ integer! ]
	subPixelPrecisionBits                           [ integer! ]
	subTexelPrecisionBits                           [ integer! ]
	mipmapPrecisionBits                             [ integer! ]
	maxDrawIndexedIndexValue                        [ integer! ]
	maxDrawIndirectCount                            [ integer! ]
	maxSamplerLodBias                               [ float32! ]
	maxSamplerAnisotropy                            [ float32! ]
	maxViewports                                    [ integer! ]
	maxViewportDimensions                           [ integer! ]
	viewportBoundsRange                             [ integer! ]
	viewportSubPixelBits                            [ integer! ]
	minMemoryMapAlignment                           [ integer! ]
	minTexelBufferOffsetAlignment                   [ VkDeviceSize! ]
	minUniformBufferOffsetAlignment                 [ VkDeviceSize! ]
	minStorageBufferOffsetAlignment                 [ VkDeviceSize! ]
	minTexelOffset                                  [ integer! ]
	maxTexelOffset                                  [ integer! ]
	minTexelGatherOffset                            [ integer! ]
	maxTexelGatherOffset                            [ integer! ]
	minInterpolationOffset                          [ float32! ]
	maxInterpolationOffset                          [ float32! ]
	subPixelInterpolationOffsetBits                 [ integer! ]
	maxFramebufferWidth                             [ integer! ]
	maxFramebufferHeight                            [ integer! ]
	maxFramebufferLayers                            [ integer! ]
	framebufferColorSampleCounts                    [ VkSampleCountFlags! ]
	framebufferDepthSampleCounts                    [ VkSampleCountFlags! ]
	framebufferStencilSampleCounts                  [ VkSampleCountFlags! ]
	framebufferNoAttachmentsSampleCounts            [ VkSampleCountFlags! ]
	maxColorAttachments                             [ integer! ]
	sampledImageColorSampleCounts                   [ VkSampleCountFlags! ]
	sampledImageIntegerSampleCounts                 [ VkSampleCountFlags! ]
	sampledImageDepthSampleCounts                   [ VkSampleCountFlags! ]
	sampledImageStencilSampleCounts                 [ VkSampleCountFlags! ]
	storageImageSampleCounts                        [ VkSampleCountFlags! ]
	maxSampleMaskWords                              [ integer! ]
	timestampComputeAndGraphics                     [ VkBool32! ]
	timestampPeriod                                 [ float32! ]
	maxClipDistances                                [ integer! ]
	maxCullDistances                                [ integer! ]
	maxCombinedClipAndCullDistances                 [ integer! ]
	discreteQueuePriorities                         [ integer! ]
	pointSizeRange                                  [ integer! ]
	lineWidthRange                                  [ integer! ]
	pointSizeGranularity                            [ float32! ]
	lineWidthGranularity                            [ float32! ]
	strictLines                                     [ VkBool32! ]
	standardSampleLocations                         [ VkBool32! ]
	optimalBufferCopyOffsetAlignment                [ VkDeviceSize! ]
	optimalBufferCopyRowPitchAlignment              [ VkDeviceSize! ]
	nonCoherentAtomSize                             [ VkDeviceSize! ]
]

VkPhysicalDeviceSparseProperties!: alias struct! [
	residencyStandard2DBlockShape            [ VkBool32! ]
	residencyStandard2DMultisampleBlockShape [ VkBool32! ]
	residencyStandard3DBlockShape            [ VkBool32! ]
	residencyAlignedMipSize                  [ VkBool32! ]
	residencyNonResidentStrict               [ VkBool32! ]
]

VkPhysicalDeviceProperties!: alias struct! [
	apiVersion        [ integer! ]
	driverVersion     [ integer! ]
	vendorID          [ integer! ]
	deviceID          [ integer! ]
	deviceType        [ VkPhysicalDeviceType! ]
	deviceName        [ integer! ]
	pipelineCacheUUID [ integer! ]
	limits            [ VkPhysicalDeviceLimits! value ]
	sparseProperties  [ VkPhysicalDeviceSparseProperties! value ]
]

VkQueueFamilyProperties!: alias struct! [
	queueFlags                  [ VkQueueFlags! ]
	queueCount                  [ integer! ]
	timestampValidBits          [ integer! ]
	minImageTransferGranularity [ VkExtent3D! value ]
]

VkMemoryType!: alias struct! [
	propertyFlags   [ VkMemoryPropertyFlags! ]
	heapIndex       [ integer! ]
]

VkMemoryHeap!: alias struct! [
	size            [ VkDeviceSize! ]
	flags           [ VkMemoryHeapFlags! ]
]

VkPhysicalDeviceMemoryProperties!: alias struct! [
	memoryTypeCount [ integer! ]
	memoryTypes     [ integer! ]
	memoryHeapCount [ integer! ]
	memoryHeaps     [ integer! ]
]

VkDeviceQueueCreateInfo!: alias struct! [
	sType            [ VkStructureType! ]
	pNext            [ pointer! [byte!] ]
	flags            [ VkDeviceQueueCreateFlags! ]
	queueFamilyIndex [ integer! ]
	queueCount       [ integer! ]
	pQueuePriorities [ pointer! [float32!] ]
]

VkDeviceCreateInfo!: alias struct! [
	sType                   [ VkStructureType! ]
	pNext                   [ pointer! [byte!] ]
	flags                   [ VkDeviceCreateFlags! ]
	queueCreateInfoCount    [ integer! ]
	pQueueCreateInfos       [ VkDeviceQueueCreateInfo! ]
	enabledLayerCount       [ integer! ]
	ppEnabledLayerNames     [ string-ptr! ]
	enabledExtensionCount   [ integer! ]
	ppEnabledExtensionNames [ string-ptr! ]
	pEnabledFeatures        [ VkPhysicalDeviceFeatures! ]
]

VkExtensionProperties!: alias struct! [
	extensionName   [ integer! ]
	specVersion     [ integer! ]
]

VkLayerProperties!: alias struct! [
	layerName             [ integer! ]
	specVersion           [ integer! ]
	implementationVersion [ integer! ]
	description           [ integer! ]
]

VkSubmitInfo!: alias struct! [
	sType                [ VkStructureType! ]
	pNext                [ pointer! [byte!] ]
	waitSemaphoreCount   [ integer! ]
	pWaitSemaphores      [ pointer! [integer!] ]
	pWaitDstStageMask    [ pointer! [integer!] ]
	commandBufferCount   [ integer! ]
	pCommandBuffers      [ pointer! [integer!] ]
	signalSemaphoreCount [ integer! ]
	pSignalSemaphores    [ pointer! [integer!] ]
]

VkMemoryAllocateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	allocationSize  [ VkDeviceSize! ]
	memoryTypeIndex [ integer! ]
]

VkMappedMemoryRange!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	memory          [ VkDeviceMemory! ]
	offset          [ VkDeviceSize! ]
	size            [ VkDeviceSize! ]
]

VkMemoryRequirements!: alias struct! [
	size            [ VkDeviceSize! ]
	alignment       [ VkDeviceSize! ]
	memoryTypeBits  [ integer! ]
]

VkSparseImageFormatProperties!: alias struct! [
	aspectMask       [ VkImageAspectFlags! ]
	imageGranularity [ VkExtent3D! value ]
	flags            [ VkSparseImageFormatFlags! ]
]

VkSparseImageMemoryRequirements!: alias struct! [
	formatProperties     [ VkSparseImageFormatProperties! value ]
	imageMipTailFirstLod [ integer! ]
	imageMipTailSize     [ VkDeviceSize! ]
	imageMipTailOffset   [ VkDeviceSize! ]
	imageMipTailStride   [ VkDeviceSize! ]
]

VkSparseMemoryBind!: alias struct! [
	resourceOffset  [ VkDeviceSize! ]
	size            [ VkDeviceSize! ]
	memory          [ VkDeviceMemory! ]
	memoryOffset    [ VkDeviceSize! ]
	flags           [ VkSparseMemoryBindFlags! ]
]

VkSparseBufferMemoryBindInfo!: alias struct! [
	buffer          [ VkBuffer! ]
	bindCount       [ integer! ]
	pBinds          [ VkSparseMemoryBind! ]
]

VkSparseImageOpaqueMemoryBindInfo!: alias struct! [
	image           [ VkImage! ]
	bindCount       [ integer! ]
	pBinds          [ VkSparseMemoryBind! ]
]

VkImageSubresource!: alias struct! [
	aspectMask      [ VkImageAspectFlags! ]
	mipLevel        [ integer! ]
	arrayLayer      [ integer! ]
]

VkOffset3D!: alias struct! [
	x               [ integer! ]
	y               [ integer! ]
	z               [ integer! ]
]

VkSparseImageMemoryBind!: alias struct! [
	subresource     [ VkImageSubresource! value ]
	offset          [ VkOffset3D! value ]
	extent          [ VkExtent3D! value ]
	memory          [ VkDeviceMemory! ]
	memoryOffset    [ VkDeviceSize! ]
	flags           [ VkSparseMemoryBindFlags! ]
]

VkSparseImageMemoryBindInfo!: alias struct! [
	image           [ VkImage! ]
	bindCount       [ integer! ]
	pBinds          [ VkSparseImageMemoryBind! ]
]

VkBindSparseInfo!: alias struct! [
	sType                [ VkStructureType! ]
	pNext                [ pointer! [byte!] ]
	waitSemaphoreCount   [ integer! ]
	pWaitSemaphores      [ pointer! [integer!] ]
	bufferBindCount      [ integer! ]
	pBufferBinds         [ VkSparseBufferMemoryBindInfo! ]
	imageOpaqueBindCount [ integer! ]
	pImageOpaqueBinds    [ VkSparseImageOpaqueMemoryBindInfo! ]
	imageBindCount       [ integer! ]
	pImageBinds          [ VkSparseImageMemoryBindInfo! ]
	signalSemaphoreCount [ integer! ]
	pSignalSemaphores    [ pointer! [integer!] ]
]

VkFenceCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkFenceCreateFlags! ]
]

VkSemaphoreCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkSemaphoreCreateFlags! ]
]

VkEventCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkEventCreateFlags! ]
]

VkQueryPoolCreateInfo!: alias struct! [
	sType              [ VkStructureType! ]
	pNext              [ pointer! [byte!] ]
	flags              [ VkQueryPoolCreateFlags! ]
	queryType          [ VkQueryType! ]
	queryCount         [ integer! ]
	pipelineStatistics [ VkQueryPipelineStatisticFlags! ]
]

VkBufferCreateInfo!: alias struct! [
	sType                 [ VkStructureType! ]
	pNext                 [ pointer! [byte!] ]
	flags                 [ VkBufferCreateFlags! ]
	size                  [ VkDeviceSize! ]
	usage                 [ VkBufferUsageFlags! ]
	sharingMode           [ VkSharingMode! ]
	queueFamilyIndexCount [ integer! ]
	pQueueFamilyIndices   [ pointer! [integer!] ]
]

VkBufferViewCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkBufferViewCreateFlags! ]
	buffer          [ VkBuffer! ]
	format          [ VkFormat! ]
	offset          [ VkDeviceSize! ]
	range           [ VkDeviceSize! ]
]

VkImageCreateInfo!: alias struct! [
	sType                 [ VkStructureType! ]
	pNext                 [ pointer! [byte!] ]
	flags                 [ VkImageCreateFlags! ]
	imageType             [ VkImageType! ]
	format                [ VkFormat! ]
	extent                [ VkExtent3D! value ]
	mipLevels             [ integer! ]
	arrayLayers           [ integer! ]
	samples               [ VkSampleCountFlagBits! ]
	tiling                [ VkImageTiling! ]
	usage                 [ VkImageUsageFlags! ]
	sharingMode           [ VkSharingMode! ]
	queueFamilyIndexCount [ integer! ]
	pQueueFamilyIndices   [ pointer! [integer!] ]
	initialLayout         [ VkImageLayout! ]
]

VkSubresourceLayout!: alias struct! [
	offset          [ VkDeviceSize! ]
	size            [ VkDeviceSize! ]
	rowPitch        [ VkDeviceSize! ]
	arrayPitch      [ VkDeviceSize! ]
	depthPitch      [ VkDeviceSize! ]
]

VkComponentMapping!: alias struct! [
	r               [ VkComponentSwizzle! ]
	g               [ VkComponentSwizzle! ]
	b               [ VkComponentSwizzle! ]
	a               [ VkComponentSwizzle! ]
]

VkImageSubresourceRange!: alias struct! [
	aspectMask      [ VkImageAspectFlags! ]
	baseMipLevel    [ integer! ]
	levelCount      [ integer! ]
	baseArrayLayer  [ integer! ]
	layerCount      [ integer! ]
]

VkImageViewCreateInfo!: alias struct! [
	sType            [ VkStructureType! ]
	pNext            [ pointer! [byte!] ]
	flags            [ VkImageViewCreateFlags! ]
	image            [ VkImage! ]
	viewType         [ VkImageViewType! ]
	format           [ VkFormat! ]
	components       [ VkComponentMapping! value ]
	subresourceRange [ VkImageSubresourceRange! value ]
]

VkShaderModuleCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkShaderModuleCreateFlags! ]
	codeSize        [ integer! ]
	pCode           [ pointer! [integer!] ]
]

VkPipelineCacheCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkPipelineCacheCreateFlags! ]
	initialDataSize [ integer! ]
	pInitialData    [ pointer! [byte!] ]
]

VkSpecializationMapEntry!: alias struct! [
	constantID      [ integer! ]
	offset          [ integer! ]
	size            [ integer! ]
]

VkSpecializationInfo!: alias struct! [
	mapEntryCount   [ integer! ]
	pMapEntries     [ VkSpecializationMapEntry! ]
	dataSize        [ integer! ]
	pData           [ pointer! [byte!] ]
]

VkPipelineShaderStageCreateInfo!: alias struct! [
	sType               [ VkStructureType! ]
	pNext               [ pointer! [byte!] ]
	flags               [ VkPipelineShaderStageCreateFlags! ]
	stage               [ VkShaderStageFlagBits! ]
	module              [ VkShaderModule! ]
	pName               [ c-string! ]
	pSpecializationInfo [ VkSpecializationInfo! ]
]

VkVertexInputBindingDescription!: alias struct! [
	binding         [ integer! ]
	stride          [ integer! ]
	inputRate       [ VkVertexInputRate! ]
]

VkVertexInputAttributeDescription!: alias struct! [
	location        [ integer! ]
	binding         [ integer! ]
	format          [ VkFormat! ]
	offset          [ integer! ]
]

VkPipelineVertexInputStateCreateInfo!: alias struct! [
	sType                           [ VkStructureType! ]
	pNext                           [ pointer! [byte!] ]
	flags                           [ VkPipelineVertexInputStateCreateFlags! ]
	vertexBindingDescriptionCount   [ integer! ]
	pVertexBindingDescriptions      [ VkVertexInputBindingDescription! ]
	vertexAttributeDescriptionCount [ integer! ]
	pVertexAttributeDescriptions    [ VkVertexInputAttributeDescription! ]
]

VkPipelineInputAssemblyStateCreateInfo!: alias struct! [
	sType                  [ VkStructureType! ]
	pNext                  [ pointer! [byte!] ]
	flags                  [ VkPipelineInputAssemblyStateCreateFlags! ]
	topology               [ VkPrimitiveTopology! ]
	primitiveRestartEnable [ VkBool32! ]
]

VkPipelineTessellationStateCreateInfo!: alias struct! [
	sType              [ VkStructureType! ]
	pNext              [ pointer! [byte!] ]
	flags              [ VkPipelineTessellationStateCreateFlags! ]
	patchControlPoints [ integer! ]
]

VkViewport!: alias struct! [
	x               [ float32! ]
	y               [ float32! ]
	width           [ float32! ]
	height          [ float32! ]
	minDepth        [ float32! ]
	maxDepth        [ float32! ]
]

VkOffset2D!: alias struct! [
	x               [ integer! ]
	y               [ integer! ]
]

VkExtent2D!: alias struct! [
	width           [ integer! ]
	height          [ integer! ]
]

VkRect2D!: alias struct! [
	offset          [ VkOffset2D! value ]
	extent          [ VkExtent2D! value ]
]

VkPipelineViewportStateCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkPipelineViewportStateCreateFlags! ]
	viewportCount   [ integer! ]
	pViewports      [ VkViewport! ]
	scissorCount    [ integer! ]
	pScissors       [ VkRect2D! ]
]

VkPipelineRasterizationStateCreateInfo!: alias struct! [
	sType                   [ VkStructureType! ]
	pNext                   [ pointer! [byte!] ]
	flags                   [ VkPipelineRasterizationStateCreateFlags! ]
	depthClampEnable        [ VkBool32! ]
	rasterizerDiscardEnable [ VkBool32! ]
	polygonMode             [ VkPolygonMode! ]
	cullMode                [ VkCullModeFlags! ]
	frontFace               [ VkFrontFace! ]
	depthBiasEnable         [ VkBool32! ]
	depthBiasConstantFactor [ float32! ]
	depthBiasClamp          [ float32! ]
	depthBiasSlopeFactor    [ float32! ]
	lineWidth               [ float32! ]
]

VkPipelineMultisampleStateCreateInfo!: alias struct! [
	sType                 [ VkStructureType! ]
	pNext                 [ pointer! [byte!] ]
	flags                 [ VkPipelineMultisampleStateCreateFlags! ]
	rasterizationSamples  [ VkSampleCountFlagBits! ]
	sampleShadingEnable   [ VkBool32! ]
	minSampleShading      [ float32! ]
	pSampleMask           [ pointer! [integer!] ]
	alphaToCoverageEnable [ VkBool32! ]
	alphaToOneEnable      [ VkBool32! ]
]

VkStencilOpState!: alias struct! [
	failOp          [ VkStencilOp! ]
	passOp          [ VkStencilOp! ]
	depthFailOp     [ VkStencilOp! ]
	compareOp       [ VkCompareOp! ]
	compareMask     [ integer! ]
	writeMask       [ integer! ]
	reference       [ integer! ]
]

VkPipelineDepthStencilStateCreateInfo!: alias struct! [
	sType                 [ VkStructureType! ]
	pNext                 [ pointer! [byte!] ]
	flags                 [ VkPipelineDepthStencilStateCreateFlags! ]
	depthTestEnable       [ VkBool32! ]
	depthWriteEnable      [ VkBool32! ]
	depthCompareOp        [ VkCompareOp! ]
	depthBoundsTestEnable [ VkBool32! ]
	stencilTestEnable     [ VkBool32! ]
	front                 [ VkStencilOpState! value ]
	back                  [ VkStencilOpState! value ]
	minDepthBounds        [ float32! ]
	maxDepthBounds        [ float32! ]
]

VkPipelineColorBlendAttachmentState!: alias struct! [
	blendEnable         [ VkBool32! ]
	srcColorBlendFactor [ VkBlendFactor! ]
	dstColorBlendFactor [ VkBlendFactor! ]
	colorBlendOp        [ VkBlendOp! ]
	srcAlphaBlendFactor [ VkBlendFactor! ]
	dstAlphaBlendFactor [ VkBlendFactor! ]
	alphaBlendOp        [ VkBlendOp! ]
	colorWriteMask      [ VkColorComponentFlags! ]
]

VkPipelineColorBlendStateCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkPipelineColorBlendStateCreateFlags! ]
	logicOpEnable   [ VkBool32! ]
	logicOp         [ VkLogicOp! ]
	attachmentCount [ integer! ]
	pAttachments    [ VkPipelineColorBlendAttachmentState! ]
	blendConstants  [ integer! ]
]

VkPipelineDynamicStateCreateInfo!: alias struct! [
	sType             [ VkStructureType! ]
	pNext             [ pointer! [byte!] ]
	flags             [ VkPipelineDynamicStateCreateFlags! ]
	dynamicStateCount [ integer! ]
	pDynamicStates    [ pointer! [integer!] ]
]

VkGraphicsPipelineCreateInfo!: alias struct! [
	sType               [ VkStructureType! ]
	pNext               [ pointer! [byte!] ]
	flags               [ VkPipelineCreateFlags! ]
	stageCount          [ integer! ]
	pStages             [ VkPipelineShaderStageCreateInfo! ]
	pVertexInputState   [ VkPipelineVertexInputStateCreateInfo! ]
	pInputAssemblyState [ VkPipelineInputAssemblyStateCreateInfo! ]
	pTessellationState  [ VkPipelineTessellationStateCreateInfo! ]
	pViewportState      [ VkPipelineViewportStateCreateInfo! ]
	pRasterizationState [ VkPipelineRasterizationStateCreateInfo! ]
	pMultisampleState   [ VkPipelineMultisampleStateCreateInfo! ]
	pDepthStencilState  [ VkPipelineDepthStencilStateCreateInfo! ]
	pColorBlendState    [ VkPipelineColorBlendStateCreateInfo! ]
	pDynamicState       [ VkPipelineDynamicStateCreateInfo! ]
	layout              [ VkPipelineLayout! ]
	renderPass          [ VkRenderPass! ]
	subpass             [ integer! ]
	basePipelineHandle  [ VkPipeline! ]
	basePipelineIndex   [ integer! ]
]

VkComputePipelineCreateInfo!: alias struct! [
	sType              [ VkStructureType! ]
	pNext              [ pointer! [byte!] ]
	flags              [ VkPipelineCreateFlags! ]
	stage              [ VkPipelineShaderStageCreateInfo! value ]
	layout             [ VkPipelineLayout! ]
	basePipelineHandle [ VkPipeline! ]
	basePipelineIndex  [ integer! ]
]

VkPushConstantRange!: alias struct! [
	stageFlags      [ VkShaderStageFlags! ]
	offset          [ integer! ]
	size            [ integer! ]
]

VkPipelineLayoutCreateInfo!: alias struct! [
	sType                  [ VkStructureType! ]
	pNext                  [ pointer! [byte!] ]
	flags                  [ VkPipelineLayoutCreateFlags! ]
	setLayoutCount         [ integer! ]
	pSetLayouts            [ pointer! [integer!] ]
	pushConstantRangeCount [ integer! ]
	pPushConstantRanges    [ VkPushConstantRange! ]
]

VkSamplerCreateInfo!: alias struct! [
	sType                   [ VkStructureType! ]
	pNext                   [ pointer! [byte!] ]
	flags                   [ VkSamplerCreateFlags! ]
	magFilter               [ VkFilter! ]
	minFilter               [ VkFilter! ]
	mipmapMode              [ VkSamplerMipmapMode! ]
	addressModeU            [ VkSamplerAddressMode! ]
	addressModeV            [ VkSamplerAddressMode! ]
	addressModeW            [ VkSamplerAddressMode! ]
	mipLodBias              [ float32! ]
	anisotropyEnable        [ VkBool32! ]
	maxAnisotropy           [ float32! ]
	compareEnable           [ VkBool32! ]
	compareOp               [ VkCompareOp! ]
	minLod                  [ float32! ]
	maxLod                  [ float32! ]
	borderColor             [ VkBorderColor! ]
	unnormalizedCoordinates [ VkBool32! ]
]

VkDescriptorSetLayoutBinding!: alias struct! [
	binding            [ integer! ]
	descriptorType     [ VkDescriptorType! ]
	descriptorCount    [ integer! ]
	stageFlags         [ VkShaderStageFlags! ]
	pImmutableSamplers [ pointer! [integer!] ]
]

VkDescriptorSetLayoutCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkDescriptorSetLayoutCreateFlags! ]
	bindingCount    [ integer! ]
	pBindings       [ VkDescriptorSetLayoutBinding! ]
]

VkDescriptorPoolSize!: alias struct! [
	type            [ VkDescriptorType! ]
	descriptorCount [ integer! ]
]

VkDescriptorPoolCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkDescriptorPoolCreateFlags! ]
	maxSets         [ integer! ]
	poolSizeCount   [ integer! ]
	pPoolSizes      [ VkDescriptorPoolSize! ]
]

VkDescriptorSetAllocateInfo!: alias struct! [
	sType              [ VkStructureType! ]
	pNext              [ pointer! [byte!] ]
	descriptorPool     [ VkDescriptorPool! ]
	descriptorSetCount [ integer! ]
	pSetLayouts        [ pointer! [integer!] ]
]

VkDescriptorImageInfo!: alias struct! [
	sampler         [ VkSampler! ]
	imageView       [ VkImageView! ]
	imageLayout     [ VkImageLayout! ]
]

VkDescriptorBufferInfo!: alias struct! [
	buffer          [ VkBuffer! ]
	offset          [ VkDeviceSize! ]
	range           [ VkDeviceSize! ]
]

VkWriteDescriptorSet!: alias struct! [
	sType            [ VkStructureType! ]
	pNext            [ pointer! [byte!] ]
	dstSet           [ VkDescriptorSet! ]
	dstBinding       [ integer! ]
	dstArrayElement  [ integer! ]
	descriptorCount  [ integer! ]
	descriptorType   [ VkDescriptorType! ]
	pImageInfo       [ VkDescriptorImageInfo! ]
	pBufferInfo      [ VkDescriptorBufferInfo! ]
	pTexelBufferView [ pointer! [integer!] ]
]

VkCopyDescriptorSet!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	srcSet          [ VkDescriptorSet! ]
	srcBinding      [ integer! ]
	srcArrayElement [ integer! ]
	dstSet          [ VkDescriptorSet! ]
	dstBinding      [ integer! ]
	dstArrayElement [ integer! ]
	descriptorCount [ integer! ]
]

VkFramebufferCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkFramebufferCreateFlags! ]
	renderPass      [ VkRenderPass! ]
	attachmentCount [ integer! ]
	pAttachments    [ pointer! [integer!] ]
	width           [ integer! ]
	height          [ integer! ]
	layers          [ integer! ]
]

VkAttachmentDescription!: alias struct! [
	flags           [ VkAttachmentDescriptionFlags! ]
	format          [ VkFormat! ]
	samples         [ VkSampleCountFlagBits! ]
	loadOp          [ VkAttachmentLoadOp! ]
	storeOp         [ VkAttachmentStoreOp! ]
	stencilLoadOp   [ VkAttachmentLoadOp! ]
	stencilStoreOp  [ VkAttachmentStoreOp! ]
	initialLayout   [ VkImageLayout! ]
	finalLayout     [ VkImageLayout! ]
]

VkAttachmentReference!: alias struct! [
	attachment      [ integer! ]
	layout          [ VkImageLayout! ]
]

VkSubpassDescription!: alias struct! [
	flags                   [ VkSubpassDescriptionFlags! ]
	pipelineBindPoint       [ VkPipelineBindPoint! ]
	inputAttachmentCount    [ integer! ]
	pInputAttachments       [ VkAttachmentReference! ]
	colorAttachmentCount    [ integer! ]
	pColorAttachments       [ VkAttachmentReference! ]
	pResolveAttachments     [ VkAttachmentReference! ]
	pDepthStencilAttachment [ VkAttachmentReference! ]
	preserveAttachmentCount [ integer! ]
	pPreserveAttachments    [ pointer! [integer!] ]
]

VkSubpassDependency!: alias struct! [
	srcSubpass      [ integer! ]
	dstSubpass      [ integer! ]
	srcStageMask    [ VkPipelineStageFlags! ]
	dstStageMask    [ VkPipelineStageFlags! ]
	srcAccessMask   [ VkAccessFlags! ]
	dstAccessMask   [ VkAccessFlags! ]
	dependencyFlags [ VkDependencyFlags! ]
]

VkRenderPassCreateInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkRenderPassCreateFlags! ]
	attachmentCount [ integer! ]
	pAttachments    [ VkAttachmentDescription! ]
	subpassCount    [ integer! ]
	pSubpasses      [ VkSubpassDescription! ]
	dependencyCount [ integer! ]
	pDependencies   [ VkSubpassDependency! ]
]

VkCommandPoolCreateInfo!: alias struct! [
	sType            [ VkStructureType! ]
	pNext            [ pointer! [byte!] ]
	flags            [ VkCommandPoolCreateFlags! ]
	queueFamilyIndex [ integer! ]
]

VkCommandBufferAllocateInfo!: alias struct! [
	sType              [ VkStructureType! ]
	pNext              [ pointer! [byte!] ]
	commandPool        [ VkCommandPool! ]
	level              [ VkCommandBufferLevel! ]
	commandBufferCount [ integer! ]
]

VkCommandBufferInheritanceInfo!: alias struct! [
	sType                [ VkStructureType! ]
	pNext                [ pointer! [byte!] ]
	renderPass           [ VkRenderPass! ]
	subpass              [ integer! ]
	framebuffer          [ VkFramebuffer! ]
	occlusionQueryEnable [ VkBool32! ]
	queryFlags           [ VkQueryControlFlags! ]
	pipelineStatistics   [ VkQueryPipelineStatisticFlags! ]
]

VkCommandBufferBeginInfo!: alias struct! [
	sType            [ VkStructureType! ]
	pNext            [ pointer! [byte!] ]
	flags            [ VkCommandBufferUsageFlags! ]
	pInheritanceInfo [ VkCommandBufferInheritanceInfo! ]
]

VkBufferCopy!: alias struct! [
	srcOffset       [ VkDeviceSize! ]
	dstOffset       [ VkDeviceSize! ]
	size            [ VkDeviceSize! ]
]

VkImageSubresourceLayers!: alias struct! [
	aspectMask      [ VkImageAspectFlags! ]
	mipLevel        [ integer! ]
	baseArrayLayer  [ integer! ]
	layerCount      [ integer! ]
]

VkImageCopy!: alias struct! [
	srcSubresource  [ VkImageSubresourceLayers! value ]
	srcOffset       [ VkOffset3D! value ]
	dstSubresource  [ VkImageSubresourceLayers! value ]
	dstOffset       [ VkOffset3D! value ]
	extent          [ VkExtent3D! value ]
]

VkImageBlit!: alias struct! [
	srcSubresource  [ VkImageSubresourceLayers! value ]
	srcOffsets      [ integer! ]
	dstSubresource  [ VkImageSubresourceLayers! value ]
	dstOffsets      [ integer! ]
]

VkBufferImageCopy!: alias struct! [
	bufferOffset      [ VkDeviceSize! ]
	bufferRowLength   [ integer! ]
	bufferImageHeight [ integer! ]
	imageSubresource  [ VkImageSubresourceLayers! value ]
	imageOffset       [ VkOffset3D! value ]
	imageExtent       [ VkExtent3D! value ]
]

VkClearDepthStencilValue!: alias struct! [
	depth           [ float32! ]
	stencil         [ integer! ]
]

VkClearAttachment!: alias struct! [
	aspectMask      [ VkImageAspectFlags! ]
	colorAttachment [ integer! ]
	clearValue      [ VkClearValue! value ]
]

VkClearRect!: alias struct! [
	rect            [ VkRect2D! value ]
	baseArrayLayer  [ integer! ]
	layerCount      [ integer! ]
]

VkImageResolve!: alias struct! [
	srcSubresource  [ VkImageSubresourceLayers! value ]
	srcOffset       [ VkOffset3D! value ]
	dstSubresource  [ VkImageSubresourceLayers! value ]
	dstOffset       [ VkOffset3D! value ]
	extent          [ VkExtent3D! value ]
]

VkMemoryBarrier!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	srcAccessMask   [ VkAccessFlags! ]
	dstAccessMask   [ VkAccessFlags! ]
]

VkBufferMemoryBarrier!: alias struct! [
	sType               [ VkStructureType! ]
	pNext               [ pointer! [byte!] ]
	srcAccessMask       [ VkAccessFlags! ]
	dstAccessMask       [ VkAccessFlags! ]
	srcQueueFamilyIndex [ integer! ]
	dstQueueFamilyIndex [ integer! ]
	buffer              [ VkBuffer! ]
	offset              [ VkDeviceSize! ]
	size                [ VkDeviceSize! ]
]

VkImageMemoryBarrier!: alias struct! [
	sType               [ VkStructureType! ]
	pNext               [ pointer! [byte!] ]
	srcAccessMask       [ VkAccessFlags! ]
	dstAccessMask       [ VkAccessFlags! ]
	oldLayout           [ VkImageLayout! ]
	newLayout           [ VkImageLayout! ]
	srcQueueFamilyIndex [ integer! ]
	dstQueueFamilyIndex [ integer! ]
	image               [ VkImage! ]
	subresourceRange    [ VkImageSubresourceRange! value ]
]

VkRenderPassBeginInfo!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	renderPass      [ VkRenderPass! ]
	framebuffer     [ VkFramebuffer! ]
	renderArea      [ VkRect2D! value ]
	clearValueCount [ integer! ]
	pClearValues    [ VkClearValue! ]
]

VkDispatchIndirectCommand!: alias struct! [
	x               [ integer! ]
	y               [ integer! ]
	z               [ integer! ]
]

VkDrawIndexedIndirectCommand!: alias struct! [
	indexCount      [ integer! ]
	instanceCount   [ integer! ]
	firstIndex      [ integer! ]
	vertexOffset    [ integer! ]
	firstInstance   [ integer! ]
]

VkDrawIndirectCommand!: alias struct! [
	vertexCount     [ integer! ]
	instanceCount   [ integer! ]
	firstVertex     [ integer! ]
	firstInstance   [ integer! ]
]
vkCreateInstance!: alias function! [
	pCreateInfo     [ VkInstanceCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pInstance       [ pointer! [VkInstance!] ]
	return:         [ VkResult! ]
]
vkDestroyInstance!: alias function! [
	instance        [ VkInstance! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkEnumeratePhysicalDevices!: alias function! [
	instance             [ VkInstance! ]
	pPhysicalDeviceCount [ pointer! [integer!] ]
	pPhysicalDevices     [ pointer! [integer!] ]
	return:              [ VkResult! ]
]
vkGetPhysicalDeviceFeatures!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pFeatures       [ VkPhysicalDeviceFeatures! ]
]
vkGetPhysicalDeviceFormatProperties!: alias function! [
	physicalDevice    [ VkPhysicalDevice! ]
	format            [ VkFormat! ]
	pFormatProperties [ VkFormatProperties! ]
]
vkGetPhysicalDeviceImageFormatProperties!: alias function! [
	physicalDevice         [ VkPhysicalDevice! ]
	format                 [ VkFormat! ]
	type                   [ VkImageType! ]
	tiling                 [ VkImageTiling! ]
	usage                  [ VkImageUsageFlags! ]
	flags                  [ VkImageCreateFlags! ]
	pImageFormatProperties [ VkImageFormatProperties! ]
	return:                [ VkResult! ]
]
vkGetPhysicalDeviceProperties!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pProperties     [ VkPhysicalDeviceProperties! ]
]
vkGetPhysicalDeviceQueueFamilyProperties!: alias function! [
	physicalDevice            [ VkPhysicalDevice! ]
	pQueueFamilyPropertyCount [ pointer! [integer!] ]
	pQueueFamilyProperties    [ VkQueueFamilyProperties! ]
]
vkGetPhysicalDeviceMemoryProperties!: alias function! [
	physicalDevice    [ VkPhysicalDevice! ]
	pMemoryProperties [ VkPhysicalDeviceMemoryProperties! ]
]
vkGetInstanceProcAddr!: alias function! [
	instance        [ VkInstance! ]
	pName           [ c-string! ]
	return:         [ vkVoidFunction! ]
]
vkGetDeviceProcAddr!: alias function! [
	device          [ VkDevice! ]
	pName           [ c-string! ]
	return:         [ vkVoidFunction! ]
]
vkCreateDevice!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pCreateInfo     [ VkDeviceCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pDevice         [ pointer! [VkDevice!] ]
	return:         [ VkResult! ]
]
vkDestroyDevice!: alias function! [
	device          [ VkDevice! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkEnumerateInstanceExtensionProperties!: alias function! [
	pLayerName      [ c-string! ]
	pPropertyCount  [ pointer! [integer!] ]
	pProperties     [ VkExtensionProperties! ]
	return:         [ VkResult! ]
]
vkEnumerateDeviceExtensionProperties!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pLayerName      [ c-string! ]
	pPropertyCount  [ pointer! [integer!] ]
	pProperties     [ VkExtensionProperties! ]
	return:         [ VkResult! ]
]
vkEnumerateInstanceLayerProperties!: alias function! [
	pPropertyCount  [ pointer! [integer!] ]
	pProperties     [ VkLayerProperties! ]
	return:         [ VkResult! ]
]
vkEnumerateDeviceLayerProperties!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pPropertyCount  [ pointer! [integer!] ]
	pProperties     [ VkLayerProperties! ]
	return:         [ VkResult! ]
]
vkGetDeviceQueue!: alias function! [
	device           [ VkDevice! ]
	queueFamilyIndex [ integer! ]
	queueIndex       [ integer! ]
	pQueue           [ pointer! [VkQueue!] ]
]
vkQueueSubmit!: alias function! [
	queue           [ VkQueue! ]
	submitCount     [ integer! ]
	pSubmits        [ VkSubmitInfo! ]
	fence           [ VkFence! ]
	return:         [ VkResult! ]
]
vkQueueWaitIdle!: alias function! [
	queue           [ VkQueue! ]
	return:         [ VkResult! ]
]
vkDeviceWaitIdle!: alias function! [
	device          [ VkDevice! ]
	return:         [ VkResult! ]
]
vkAllocateMemory!: alias function! [
	device          [ VkDevice! ]
	pAllocateInfo   [ VkMemoryAllocateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pMemory         [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkFreeMemory!: alias function! [
	device          [ VkDevice! ]
	memory          [ VkDeviceMemory! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkMapMemory!: alias function! [
	device          [ VkDevice! ]
	memory          [ VkDeviceMemory! ]
	offset          [ VkDeviceSize! ]
	size            [ VkDeviceSize! ]
	flags           [ VkMemoryMapFlags! ]
	ppData          [ binary-ptr! ]
	return:         [ VkResult! ]
]
vkUnmapMemory!: alias function! [
	device          [ VkDevice! ]
	memory          [ VkDeviceMemory! ]
]
vkFlushMappedMemoryRanges!: alias function! [
	device           [ VkDevice! ]
	memoryRangeCount [ integer! ]
	pMemoryRanges    [ VkMappedMemoryRange! ]
	return:          [ VkResult! ]
]
vkInvalidateMappedMemoryRanges!: alias function! [
	device           [ VkDevice! ]
	memoryRangeCount [ integer! ]
	pMemoryRanges    [ VkMappedMemoryRange! ]
	return:          [ VkResult! ]
]
vkGetDeviceMemoryCommitment!: alias function! [
	device                  [ VkDevice! ]
	memory                  [ VkDeviceMemory! ]
	pCommittedMemoryInBytes [ uint64! ]
]
vkBindBufferMemory!: alias function! [
	device          [ VkDevice! ]
	buffer          [ VkBuffer! ]
	memory          [ VkDeviceMemory! ]
	memoryOffset    [ VkDeviceSize! ]
	return:         [ VkResult! ]
]
vkBindImageMemory!: alias function! [
	device          [ VkDevice! ]
	image           [ VkImage! ]
	memory          [ VkDeviceMemory! ]
	memoryOffset    [ VkDeviceSize! ]
	return:         [ VkResult! ]
]
vkGetBufferMemoryRequirements!: alias function! [
	device              [ VkDevice! ]
	buffer              [ VkBuffer! ]
	pMemoryRequirements [ VkMemoryRequirements! ]
]
vkGetImageMemoryRequirements!: alias function! [
	device              [ VkDevice! ]
	image               [ VkImage! ]
	pMemoryRequirements [ VkMemoryRequirements! ]
]
vkGetImageSparseMemoryRequirements!: alias function! [
	device                        [ VkDevice! ]
	image                         [ VkImage! ]
	pSparseMemoryRequirementCount [ pointer! [integer!] ]
	pSparseMemoryRequirements     [ VkSparseImageMemoryRequirements! ]
]
vkGetPhysicalDeviceSparseImageFormatProperties!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	format          [ VkFormat! ]
	type            [ VkImageType! ]
	samples         [ VkSampleCountFlagBits! ]
	usage           [ VkImageUsageFlags! ]
	tiling          [ VkImageTiling! ]
	pPropertyCount  [ pointer! [integer!] ]
	pProperties     [ VkSparseImageFormatProperties! ]
]
vkQueueBindSparse!: alias function! [
	queue           [ VkQueue! ]
	bindInfoCount   [ integer! ]
	pBindInfo       [ VkBindSparseInfo! ]
	fence           [ VkFence! ]
	return:         [ VkResult! ]
]
vkCreateFence!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkFenceCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pFence          [ pointer! [VkFence!] ]
	return:         [ VkResult! ]
]
vkDestroyFence!: alias function! [
	device          [ VkDevice! ]
	fence           [ VkFence! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkResetFences!: alias function! [
	device          [ VkDevice! ]
	fenceCount      [ integer! ]
	pFences         [ pointer! [VkFence!] ]
	return:         [ VkResult! ]
]
vkGetFenceStatus!: alias function! [
	device          [ VkDevice! ]
	fence           [ VkFence! ]
	return:         [ VkResult! ]
]
vkWaitForFences!: alias function! [
	device          [ VkDevice! ]
	fenceCount      [ integer! ]
	pFences         [ pointer! [VkFence!] ]
	waitAll         [ VkBool32! ]
	timeout         [ uint64! value ]
	return:         [ VkResult! ]
]
vkCreateSemaphore!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkSemaphoreCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSemaphore      [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkDestroySemaphore!: alias function! [
	device          [ VkDevice! ]
	semaphore       [ VkSemaphore! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkCreateEvent!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkEventCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pEvent          [ pointer! [VkEvent!] ]
	return:         [ VkResult! ]
]
vkDestroyEvent!: alias function! [
	device          [ VkDevice! ]
	event           [ VkEvent! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkGetEventStatus!: alias function! [
	device          [ VkDevice! ]
	event           [ VkEvent! ]
	return:         [ VkResult! ]
]
vkSetEvent!: alias function! [
	device          [ VkDevice! ]
	event           [ VkEvent! ]
	return:         [ VkResult! ]
]
vkResetEvent!: alias function! [
	device          [ VkDevice! ]
	event           [ VkEvent! ]
	return:         [ VkResult! ]
]
vkCreateQueryPool!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkQueryPoolCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pQueryPool      [ pointer! [VkQueryPool!] ]
	return:         [ VkResult! ]
]
vkDestroyQueryPool!: alias function! [
	device          [ VkDevice! ]
	queryPool       [ VkQueryPool! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkGetQueryPoolResults!: alias function! [
	device          [ VkDevice! ]
	queryPool       [ VkQueryPool! ]
	firstQuery      [ integer! ]
	queryCount      [ integer! ]
	dataSize        [ integer! ]
	pData           [ pointer! [byte!] ]
	stride          [ VkDeviceSize! ]
	flags           [ VkQueryResultFlags! ]
	return:         [ VkResult! ]
]
vkCreateBuffer!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkBufferCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pBuffer         [ pointer! [VkBuffer!] ]
	return:         [ VkResult! ]
]
vkDestroyBuffer!: alias function! [
	device          [ VkDevice! ]
	buffer          [ VkBuffer! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkCreateBufferView!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkBufferViewCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pView           [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkDestroyBufferView!: alias function! [
	device          [ VkDevice! ]
	bufferView      [ VkBufferView! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkCreateImage!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkImageCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pImage          [ pointer! [VkImage!] ]
	return:         [ VkResult! ]
]
vkDestroyImage!: alias function! [
	device          [ VkDevice! ]
	image           [ VkImage! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkGetImageSubresourceLayout!: alias function! [
	device          [ VkDevice! ]
	image           [ VkImage! ]
	pSubresource    [ VkImageSubresource! ]
	pLayout         [ VkSubresourceLayout! ]
]
vkCreateImageView!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkImageViewCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pView           [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkDestroyImageView!: alias function! [
	device          [ VkDevice! ]
	imageView       [ VkImageView! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkCreateShaderModule!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkShaderModuleCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pShaderModule   [ pointer! [VkShaderModule!] ]
	return:         [ VkResult! ]
]
vkDestroyShaderModule!: alias function! [
	device          [ VkDevice! ]
	shaderModule    [ VkShaderModule! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkCreatePipelineCache!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkPipelineCacheCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pPipelineCache  [ pointer! [VkPipelineCache!] ]
	return:         [ VkResult! ]
]
vkDestroyPipelineCache!: alias function! [
	device          [ VkDevice! ]
	pipelineCache   [ VkPipelineCache! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkGetPipelineCacheData!: alias function! [
	device          [ VkDevice! ]
	pipelineCache   [ VkPipelineCache! ]
	pDataSize       [ pointer! [integer!] ]
	pData           [ pointer! [byte!] ]
	return:         [ VkResult! ]
]
vkMergePipelineCaches!: alias function! [
	device          [ VkDevice! ]
	dstCache        [ VkPipelineCache! ]
	srcCacheCount   [ integer! ]
	pSrcCaches      [ pointer! [VkPipelineCache!] ]
	return:         [ VkResult! ]
]
vkCreateGraphicsPipelines!: alias function! [
	device          [ VkDevice! ]
	pipelineCache   [ VkPipelineCache! ]
	createInfoCount [ integer! ]
	pCreateInfos    [ VkGraphicsPipelineCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pPipelines      [ pointer! [VkPipeline!] ]
	return:         [ VkResult! ]
]
vkCreateComputePipelines!: alias function! [
	device          [ VkDevice! ]
	pipelineCache   [ VkPipelineCache! ]
	createInfoCount [ integer! ]
	pCreateInfos    [ VkComputePipelineCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pPipelines      [ pointer! [VkPipeline!] ]
	return:         [ VkResult! ]
]
vkDestroyPipeline!: alias function! [
	device          [ VkDevice! ]
	pipeline        [ VkPipeline! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkCreatePipelineLayout!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkPipelineLayoutCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pPipelineLayout [ pointer! [VkPipelineLayout!] ]
	return:         [ VkResult! ]
]
vkDestroyPipelineLayout!: alias function! [
	device          [ VkDevice! ]
	pipelineLayout  [ VkPipelineLayout! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkCreateSampler!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkSamplerCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSampler        [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkDestroySampler!: alias function! [
	device          [ VkDevice! ]
	sampler         [ VkSampler! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkCreateDescriptorSetLayout!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkDescriptorSetLayoutCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSetLayout      [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkDestroyDescriptorSetLayout!: alias function! [
	device              [ VkDevice! ]
	descriptorSetLayout [ VkDescriptorSetLayout! ]
	pAllocator          [ VkAllocationCallbacks! ]
]
vkCreateDescriptorPool!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkDescriptorPoolCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pDescriptorPool [ pointer! [VkDescriptorPool!] ]
	return:         [ VkResult! ]
]
vkDestroyDescriptorPool!: alias function! [
	device          [ VkDevice! ]
	descriptorPool  [ VkDescriptorPool! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkResetDescriptorPool!: alias function! [
	device          [ VkDevice! ]
	descriptorPool  [ VkDescriptorPool! ]
	flags           [ VkDescriptorPoolResetFlags! ]
	return:         [ VkResult! ]
]
vkAllocateDescriptorSets!: alias function! [
	device          [ VkDevice! ]
	pAllocateInfo   [ VkDescriptorSetAllocateInfo! ]
	pDescriptorSets [ pointer! [VkDescriptorSet!] ]
	return:         [ VkResult! ]
]
vkFreeDescriptorSets!: alias function! [
	device             [ VkDevice! ]
	descriptorPool     [ VkDescriptorPool! ]
	descriptorSetCount [ integer! ]
	pDescriptorSets    [ pointer! [VkDescriptorSet!] ]
	return:            [ VkResult! ]
]
vkUpdateDescriptorSets!: alias function! [
	device               [ VkDevice! ]
	descriptorWriteCount [ integer! ]
	pDescriptorWrites    [ VkWriteDescriptorSet! ]
	descriptorCopyCount  [ integer! ]
	pDescriptorCopies    [ VkCopyDescriptorSet! ]
]
vkCreateFramebuffer!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkFramebufferCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pFramebuffer    [ pointer! [VkFramebuffer!] ]
	return:         [ VkResult! ]
]
vkDestroyFramebuffer!: alias function! [
	device          [ VkDevice! ]
	framebuffer     [ VkFramebuffer! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkCreateRenderPass!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkRenderPassCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pRenderPass     [ pointer! [VkRenderPass!] ]
	return:         [ VkResult! ]
]
vkDestroyRenderPass!: alias function! [
	device          [ VkDevice! ]
	renderPass      [ VkRenderPass! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkGetRenderAreaGranularity!: alias function! [
	device          [ VkDevice! ]
	renderPass      [ VkRenderPass! ]
	pGranularity    [ VkExtent2D! ]
]
vkCreateCommandPool!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkCommandPoolCreateInfo! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pCommandPool    [ pointer! [VkCommandPool!] ]
	return:         [ VkResult! ]
]
vkDestroyCommandPool!: alias function! [
	device          [ VkDevice! ]
	commandPool     [ VkCommandPool! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkResetCommandPool!: alias function! [
	device          [ VkDevice! ]
	commandPool     [ VkCommandPool! ]
	flags           [ VkCommandPoolResetFlags! ]
	return:         [ VkResult! ]
]
vkAllocateCommandBuffers!: alias function! [
	device          [ VkDevice! ]
	pAllocateInfo   [ VkCommandBufferAllocateInfo! ]
	pCommandBuffers [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkFreeCommandBuffers!: alias function! [
	device             [ VkDevice! ]
	commandPool        [ VkCommandPool! ]
	commandBufferCount [ integer! ]
	pCommandBuffers    [ pointer! [integer!] ]
]
vkBeginCommandBuffer!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	pBeginInfo      [ VkCommandBufferBeginInfo! ]
	return:         [ VkResult! ]
]
vkEndCommandBuffer!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	return:         [ VkResult! ]
]
vkResetCommandBuffer!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	flags           [ VkCommandBufferResetFlags! ]
	return:         [ VkResult! ]
]
vkCmdBindPipeline!: alias function! [
	commandBuffer     [ VkCommandBuffer! ]
	pipelineBindPoint [ VkPipelineBindPoint! ]
	pipeline          [ VkPipeline! ]
]
vkCmdSetViewport!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	firstViewport   [ integer! ]
	viewportCount   [ integer! ]
	pViewports      [ VkViewport! ]
]
vkCmdSetScissor!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	firstScissor    [ integer! ]
	scissorCount    [ integer! ]
	pScissors       [ VkRect2D! ]
]
vkCmdSetLineWidth!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	lineWidth       [ float32! ]
]
vkCmdSetDepthBias!: alias function! [
	commandBuffer           [ VkCommandBuffer! ]
	depthBiasConstantFactor [ float32! ]
	depthBiasClamp          [ float32! ]
	depthBiasSlopeFactor    [ float32! ]
]
vkCmdSetBlendConstants!: alias function! [
	commandBuffer     [ VkCommandBuffer! ]
	blendConstants    [ pointer! [float32!] ] ;@@[4]
]
vkCmdSetDepthBounds!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	minDepthBounds  [ float32! ]
	maxDepthBounds  [ float32! ]
]
vkCmdSetStencilCompareMask!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	faceMask        [ VkStencilFaceFlags! ]
	compareMask     [ integer! ]
]
vkCmdSetStencilWriteMask!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	faceMask        [ VkStencilFaceFlags! ]
	writeMask       [ integer! ]
]
vkCmdSetStencilReference!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	faceMask        [ VkStencilFaceFlags! ]
	reference       [ integer! ]
]
vkCmdBindDescriptorSets!: alias function! [
	commandBuffer      [ VkCommandBuffer! ]
	pipelineBindPoint  [ VkPipelineBindPoint! ]
	layout             [ VkPipelineLayout! ]
	firstSet           [ integer! ]
	descriptorSetCount [ integer! ]
	pDescriptorSets    [ pointer! [VkDescriptorSet!] ]
	dynamicOffsetCount [ integer! ]
	pDynamicOffsets    [ pointer! [integer!] ]
]
vkCmdBindIndexBuffer!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	buffer          [ VkBuffer! ]
	offset          [ VkDeviceSize! ]
	indexType       [ VkIndexType! ]
]
vkCmdBindVertexBuffers!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	firstBinding    [ integer! ]
	bindingCount    [ integer! ]
	pBuffers        [ pointer! [VkBuffer!] ]
	pOffsets        [ uint64! ]
]
vkCmdDraw!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	vertexCount     [ integer! ]
	instanceCount   [ integer! ]
	firstVertex     [ integer! ]
	firstInstance   [ integer! ]
]
vkCmdDrawIndexed!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	indexCount      [ integer! ]
	instanceCount   [ integer! ]
	firstIndex      [ integer! ]
	vertexOffset    [ integer! ]
	firstInstance   [ integer! ]
]
vkCmdDrawIndirect!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	buffer          [ VkBuffer! ]
	offset          [ VkDeviceSize! ]
	drawCount       [ integer! ]
	stride          [ integer! ]
]
vkCmdDrawIndexedIndirect!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	buffer          [ VkBuffer! ]
	offset          [ VkDeviceSize! ]
	drawCount       [ integer! ]
	stride          [ integer! ]
]
vkCmdDispatch!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	groupCountX     [ integer! ]
	groupCountY     [ integer! ]
	groupCountZ     [ integer! ]
]
vkCmdDispatchIndirect!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	buffer          [ VkBuffer! ]
	offset          [ VkDeviceSize! ]
]
vkCmdCopyBuffer!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	srcBuffer       [ VkBuffer! ]
	dstBuffer       [ VkBuffer! ]
	regionCount     [ integer! ]
	pRegions        [ VkBufferCopy! ]
]
vkCmdCopyImage!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	srcImage        [ VkImage! ]
	srcImageLayout  [ VkImageLayout! ]
	dstImage        [ VkImage! ]
	dstImageLayout  [ VkImageLayout! ]
	regionCount     [ integer! ]
	pRegions        [ VkImageCopy! ]
]
vkCmdBlitImage!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	srcImage        [ VkImage! ]
	srcImageLayout  [ VkImageLayout! ]
	dstImage        [ VkImage! ]
	dstImageLayout  [ VkImageLayout! ]
	regionCount     [ integer! ]
	pRegions        [ VkImageBlit! ]
	filter          [ VkFilter! ]
]
vkCmdCopyBufferToImage!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	srcBuffer       [ VkBuffer! ]
	dstImage        [ VkImage! ]
	dstImageLayout  [ VkImageLayout! ]
	regionCount     [ integer! ]
	pRegions        [ VkBufferImageCopy! ]
]
vkCmdCopyImageToBuffer!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	srcImage        [ VkImage! ]
	srcImageLayout  [ VkImageLayout! ]
	dstBuffer       [ VkBuffer! ]
	regionCount     [ integer! ]
	pRegions        [ VkBufferImageCopy! ]
]
vkCmdUpdateBuffer!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	dstBuffer       [ VkBuffer! ]
	dstOffset       [ VkDeviceSize! ]
	dataSize        [ VkDeviceSize! ]
	pData           [ pointer! [byte!] ]
]
vkCmdFillBuffer!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	dstBuffer       [ VkBuffer! ]
	dstOffset       [ VkDeviceSize! ]
	size            [ VkDeviceSize! ]
	data            [ integer! ]
]
vkCmdClearColorImage!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	image           [ VkImage! ]
	imageLayout     [ VkImageLayout! ]
	pColor          [ VkClearColorValue! ]
	rangeCount      [ integer! ]
	pRanges         [ VkImageSubresourceRange! ]
]
vkCmdClearDepthStencilImage!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	image           [ VkImage! ]
	imageLayout     [ VkImageLayout! ]
	pDepthStencil   [ VkClearDepthStencilValue! ]
	rangeCount      [ integer! ]
	pRanges         [ VkImageSubresourceRange! ]
]
vkCmdClearAttachments!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	attachmentCount [ integer! ]
	pAttachments    [ VkClearAttachment! ]
	rectCount       [ integer! ]
	pRects          [ VkClearRect! ]
]
vkCmdResolveImage!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	srcImage        [ VkImage! ]
	srcImageLayout  [ VkImageLayout! ]
	dstImage        [ VkImage! ]
	dstImageLayout  [ VkImageLayout! ]
	regionCount     [ integer! ]
	pRegions        [ VkImageResolve! ]
]
vkCmdSetEvent!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	event           [ VkEvent! ]
	stageMask       [ VkPipelineStageFlags! ]
]
vkCmdResetEvent!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	event           [ VkEvent! ]
	stageMask       [ VkPipelineStageFlags! ]
]
vkCmdWaitEvents!: alias function! [
	commandBuffer            [ VkCommandBuffer! ]
	eventCount               [ integer! ]
	pEvents                  [ pointer! [VkEvent!] ]
	srcStageMask             [ VkPipelineStageFlags! ]
	dstStageMask             [ VkPipelineStageFlags! ]
	memoryBarrierCount       [ integer! ]
	pMemoryBarriers          [ VkMemoryBarrier! ]
	bufferMemoryBarrierCount [ integer! ]
	pBufferMemoryBarriers    [ VkBufferMemoryBarrier! ]
	imageMemoryBarrierCount  [ integer! ]
	pImageMemoryBarriers     [ VkImageMemoryBarrier! ]
]
vkCmdPipelineBarrier!: alias function! [
	commandBuffer            [ VkCommandBuffer! ]
	srcStageMask             [ VkPipelineStageFlags! ]
	dstStageMask             [ VkPipelineStageFlags! ]
	dependencyFlags          [ VkDependencyFlags! ]
	memoryBarrierCount       [ integer! ]
	pMemoryBarriers          [ VkMemoryBarrier! ]
	bufferMemoryBarrierCount [ integer! ]
	pBufferMemoryBarriers    [ VkBufferMemoryBarrier! ]
	imageMemoryBarrierCount  [ integer! ]
	pImageMemoryBarriers     [ VkImageMemoryBarrier! ]
]
vkCmdBeginQuery!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	queryPool       [ VkQueryPool! ]
	query           [ integer! ]
	flags           [ VkQueryControlFlags! ]
]
vkCmdEndQuery!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	queryPool       [ VkQueryPool! ]
	query           [ integer! ]
]
vkCmdResetQueryPool!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	queryPool       [ VkQueryPool! ]
	firstQuery      [ integer! ]
	queryCount      [ integer! ]
]
vkCmdWriteTimestamp!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	pipelineStage   [ VkPipelineStageFlagBits! ]
	queryPool       [ VkQueryPool! ]
	query           [ integer! ]
]
vkCmdCopyQueryPoolResults!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	queryPool       [ VkQueryPool! ]
	firstQuery      [ integer! ]
	queryCount      [ integer! ]
	dstBuffer       [ VkBuffer! ]
	dstOffset       [ VkDeviceSize! ]
	stride          [ VkDeviceSize! ]
	flags           [ VkQueryResultFlags! ]
]
vkCmdPushConstants!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	layout          [ VkPipelineLayout! ]
	stageFlags      [ VkShaderStageFlags! ]
	offset          [ integer! ]
	size            [ integer! ]
	pValues         [ pointer! [byte!] ]
]
vkCmdBeginRenderPass!: alias function! [
	commandBuffer    [ VkCommandBuffer! ]
	pRenderPassBegin [ VkRenderPassBeginInfo! ]
	contents         [ VkSubpassContents! ]
]
vkCmdNextSubpass!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	contents        [ VkSubpassContents! ]
]
vkCmdEndRenderPass!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
]
vkCmdExecuteCommands!: alias function! [
	commandBuffer      [ VkCommandBuffer! ]
	commandBufferCount [ integer! ]
	pCommandBuffers    [ pointer! [integer!] ]
]


;-------------------------------------------
;-- Extension: VK_KHR_surface
;-------------------------------------------

#define VK_KHR_surface                                        1 
#define VkSurfaceKHR!           integer!
#define VK_KHR_SURFACE_SPEC_VERSION                           25 
#define VK_KHR_SURFACE_EXTENSION_NAME                         "VK_KHR_surface" 
#define VK_COLORSPACE_SRGB_NONLINEAR_KHR                      VK_COLOR_SPACE_SRGB_NONLINEAR_KHR 

#enum VkColorSpaceKHR! [
	VK_COLOR_SPACE_SRGB_NONLINEAR_KHR:       0
	VK_COLOR_SPACE_DISPLAY_P3_NONLINEAR_EXT: 1000104001
	VK_COLOR_SPACE_EXTENDED_SRGB_LINEAR_EXT: 1000104002
	VK_COLOR_SPACE_DCI_P3_LINEAR_EXT:        1000104003
	VK_COLOR_SPACE_DCI_P3_NONLINEAR_EXT:     1000104004
	VK_COLOR_SPACE_BT709_LINEAR_EXT:         1000104005
	VK_COLOR_SPACE_BT709_NONLINEAR_EXT:      1000104006
	VK_COLOR_SPACE_BT2020_LINEAR_EXT:        1000104007
	VK_COLOR_SPACE_HDR10_ST2084_EXT:         1000104008
	VK_COLOR_SPACE_DOLBYVISION_EXT:          1000104009
	VK_COLOR_SPACE_HDR10_HLG_EXT:            1000104010
	VK_COLOR_SPACE_ADOBERGB_LINEAR_EXT:      1000104011
	VK_COLOR_SPACE_ADOBERGB_NONLINEAR_EXT:   1000104012
	VK_COLOR_SPACE_PASS_THROUGH_EXT:         1000104013
	VK_COLOR_SPACE_BEGIN_RANGE_KHR:          VK_COLOR_SPACE_SRGB_NONLINEAR_KHR
	VK_COLOR_SPACE_END_RANGE_KHR:            VK_COLOR_SPACE_SRGB_NONLINEAR_KHR
	VK_COLOR_SPACE_RANGE_SIZE_KHR:           1 ; (VK_COLOR_SPACE_SRGB_NONLINEAR_KHR - VK_COLOR_SPACE_SRGB_NONLINEAR_KHR + 1)
	VK_COLOR_SPACE_MAX_ENUM_KHR:             7FFFFFFFh
]

#enum VkPresentModeKHR! [
	VK_PRESENT_MODE_IMMEDIATE_KHR:                 0
	VK_PRESENT_MODE_MAILBOX_KHR:                   1
	VK_PRESENT_MODE_FIFO_KHR:                      2
	VK_PRESENT_MODE_FIFO_RELAXED_KHR:              3
	VK_PRESENT_MODE_SHARED_DEMAND_REFRESH_KHR:     1000111000
	VK_PRESENT_MODE_SHARED_CONTINUOUS_REFRESH_KHR: 1000111001
	VK_PRESENT_MODE_BEGIN_RANGE_KHR:               VK_PRESENT_MODE_IMMEDIATE_KHR
	VK_PRESENT_MODE_END_RANGE_KHR:                 VK_PRESENT_MODE_FIFO_RELAXED_KHR
	VK_PRESENT_MODE_RANGE_SIZE_KHR:                4 ; (VK_PRESENT_MODE_FIFO_RELAXED_KHR - VK_PRESENT_MODE_IMMEDIATE_KHR + 1)
	VK_PRESENT_MODE_MAX_ENUM_KHR:                  7FFFFFFFh
]

#enum VkSurfaceTransformFlagBitsKHR! [
	VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR:                     00000001h
	VK_SURFACE_TRANSFORM_ROTATE_90_BIT_KHR:                    00000002h
	VK_SURFACE_TRANSFORM_ROTATE_180_BIT_KHR:                   00000004h
	VK_SURFACE_TRANSFORM_ROTATE_270_BIT_KHR:                   00000008h
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_BIT_KHR:            00000010h
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_90_BIT_KHR:  00000020h
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_180_BIT_KHR: 00000040h
	VK_SURFACE_TRANSFORM_HORIZONTAL_MIRROR_ROTATE_270_BIT_KHR: 00000080h
	VK_SURFACE_TRANSFORM_INHERIT_BIT_KHR:                      00000100h
	VK_SURFACE_TRANSFORM_FLAG_BITS_MAX_ENUM_KHR:               7FFFFFFFh
]
#define VkSurfaceTransformFlagsKHR! VkFlags!

#enum VkCompositeAlphaFlagBitsKHR! [
	VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR:          00000001h
	VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR:  00000002h
	VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR: 00000004h
	VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR:         00000008h
	VK_COMPOSITE_ALPHA_FLAG_BITS_MAX_ENUM_KHR:  7FFFFFFFh
]
#define VkCompositeAlphaFlagsKHR! VkFlags!

VkSurfaceCapabilitiesKHR!: alias struct! [
	minImageCount           [ integer! ]
	maxImageCount           [ integer! ]
	currentExtent           [ VkExtent2D! value ]
	minImageExtent          [ VkExtent2D! value ]
	maxImageExtent          [ VkExtent2D! value ]
	maxImageArrayLayers     [ integer! ]
	supportedTransforms     [ VkSurfaceTransformFlagsKHR! ]
	currentTransform        [ VkSurfaceTransformFlagBitsKHR! ]
	supportedCompositeAlpha [ VkCompositeAlphaFlagsKHR! ]
	supportedUsageFlags     [ VkImageUsageFlags! ]
]

VkSurfaceFormatKHR!: alias struct! [
	format          [ VkFormat! ]
	colorSpace      [ VkColorSpaceKHR! ]
]
vkDestroySurfaceKHR!: alias function! [
	instance        [ VkInstance! ]
	surface         [ VkSurfaceKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkGetPhysicalDeviceSurfaceSupportKHR!: alias function! [
	physicalDevice   [ VkPhysicalDevice! ]
	queueFamilyIndex [ integer! ]
	surface          [ VkSurfaceKHR! ]
	pSupported       [ pointer! [VkBool32!] ]
	return:          [ VkResult! ]
]
vkGetPhysicalDeviceSurfaceCapabilitiesKHR!: alias function! [
	physicalDevice       [ VkPhysicalDevice! ]
	surface              [ VkSurfaceKHR! ]
	pSurfaceCapabilities [ VkSurfaceCapabilitiesKHR! ]
	return:              [ VkResult! ]
]
vkGetPhysicalDeviceSurfaceFormatsKHR!: alias function! [
	physicalDevice      [ VkPhysicalDevice! ]
	surface             [ VkSurfaceKHR! ]
	pSurfaceFormatCount [ pointer! [integer!] ]
	pSurfaceFormats     [ VkSurfaceFormatKHR! ]
	return:             [ VkResult! ]
]
vkGetPhysicalDeviceSurfacePresentModesKHR!: alias function! [
	physicalDevice    [ VkPhysicalDevice! ]
	surface           [ VkSurfaceKHR! ]
	pPresentModeCount [ pointer! [integer!] ]
	pPresentModes     [ pointer! [integer!] ]
	return:           [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_swapchain
;-------------------------------------------

#define VK_KHR_swapchain                                      1 
#define VkSwapchainKHR!         integer!
#define VK_KHR_SWAPCHAIN_SPEC_VERSION                         68 
#define VK_KHR_SWAPCHAIN_EXTENSION_NAME                       "VK_KHR_swapchain" 

#enum VkSwapchainCreateFlagBitsKHR! [
	VK_SWAPCHAIN_CREATE_BIND_SFR_BIT_KHX:       00000001h
	VK_SWAPCHAIN_CREATE_FLAG_BITS_MAX_ENUM_KHR: 7FFFFFFFh
]
#define VkSwapchainCreateFlagsKHR! VkFlags!

VkSwapchainCreateInfoKHR!: alias struct! [
	sType                 [ VkStructureType! ]
	pNext                 [ pointer! [byte!] ]
	flags                 [ VkSwapchainCreateFlagsKHR! ]
	surface               [ VkSurfaceKHR! ]
	minImageCount         [ integer! ]
	imageFormat           [ VkFormat! ]
	imageColorSpace       [ VkColorSpaceKHR! ]
	imageExtent           [ VkExtent2D! value ]
	imageArrayLayers      [ integer! ]
	imageUsage            [ VkImageUsageFlags! ]
	imageSharingMode      [ VkSharingMode! ]
	queueFamilyIndexCount [ integer! ]
	pQueueFamilyIndices   [ pointer! [integer!] ]
	preTransform          [ VkSurfaceTransformFlagBitsKHR! ]
	compositeAlpha        [ VkCompositeAlphaFlagBitsKHR! ]
	presentMode           [ VkPresentModeKHR! ]
	clipped               [ VkBool32! ]
	oldSwapchain          [ VkSwapchainKHR! ]
]

VkPresentInfoKHR!: alias struct! [
	sType              [ VkStructureType! ]
	pNext              [ pointer! [byte!] ]
	waitSemaphoreCount [ integer! ]
	pWaitSemaphores    [ pointer! [integer!] ]
	swapchainCount     [ integer! ]
	pSwapchains        [ pointer! [integer!] ]
	pImageIndices      [ pointer! [integer!] ]
	pResults           [ pointer! [integer!] ]
]
vkCreateSwapchainKHR!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkSwapchainCreateInfoKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSwapchain      [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkDestroySwapchainKHR!: alias function! [
	device          [ VkDevice! ]
	swapchain       [ VkSwapchainKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkGetSwapchainImagesKHR!: alias function! [
	device               [ VkDevice! ]
	swapchain            [ VkSwapchainKHR! ]
	pSwapchainImageCount [ pointer! [integer!] ]
	pSwapchainImages     [ pointer! [VkImage!] ]
	return:              [ VkResult! ]
]
vkAcquireNextImageKHR!: alias function! [
	device          [ VkDevice! ]
	swapchain       [ VkSwapchainKHR! ]
	timeout         [ uint64! value ]
	semaphore       [ VkSemaphore! ]
	fence           [ VkFence! ]
	pImageIndex     [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkQueuePresentKHR!: alias function! [
	queue           [ VkQueue! ]
	pPresentInfo    [ VkPresentInfoKHR! ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_display
;-------------------------------------------

#define VK_KHR_display                                        1 
#define VkDisplayKHR!           integer!
#define VkDisplayModeKHR!       integer!
#define VK_KHR_DISPLAY_SPEC_VERSION                           21 
#define VK_KHR_DISPLAY_EXTENSION_NAME                         "VK_KHR_display" 

#enum VkDisplayPlaneAlphaFlagBitsKHR! [
	VK_DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR:                  00000001h
	VK_DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR:                  00000002h
	VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR:               00000004h
	VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR: 00000008h
	VK_DISPLAY_PLANE_ALPHA_FLAG_BITS_MAX_ENUM_KHR:          7FFFFFFFh
]
#define VkDisplayPlaneAlphaFlagsKHR! VkFlags!
#define VkDisplayModeCreateFlagsKHR! VkFlags!
#define VkDisplaySurfaceCreateFlagsKHR! VkFlags!

VkDisplayPropertiesKHR!: alias struct! [
	display              [ VkDisplayKHR! ]
	displayName          [ c-string! ]
	physicalDimensions   [ VkExtent2D! value ]
	physicalResolution   [ VkExtent2D! value ]
	supportedTransforms  [ VkSurfaceTransformFlagsKHR! ]
	planeReorderPossible [ VkBool32! ]
	persistentContent    [ VkBool32! ]
]

VkDisplayModeParametersKHR!: alias struct! [
	visibleRegion   [ VkExtent2D! value ]
	refreshRate     [ integer! ]
]

VkDisplayModePropertiesKHR!: alias struct! [
	displayMode     [ VkDisplayModeKHR! ]
	parameters      [ VkDisplayModeParametersKHR! value ]
]

VkDisplayModeCreateInfoKHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkDisplayModeCreateFlagsKHR! ]
	parameters      [ VkDisplayModeParametersKHR! value ]
]

VkDisplayPlaneCapabilitiesKHR!: alias struct! [
	supportedAlpha  [ VkDisplayPlaneAlphaFlagsKHR! ]
	minSrcPosition  [ VkOffset2D! value ]
	maxSrcPosition  [ VkOffset2D! value ]
	minSrcExtent    [ VkExtent2D! value ]
	maxSrcExtent    [ VkExtent2D! value ]
	minDstPosition  [ VkOffset2D! value ]
	maxDstPosition  [ VkOffset2D! value ]
	minDstExtent    [ VkExtent2D! value ]
	maxDstExtent    [ VkExtent2D! value ]
]

VkDisplayPlanePropertiesKHR!: alias struct! [
	currentDisplay    [ VkDisplayKHR! ]
	currentStackIndex [ integer! ]
]

VkDisplaySurfaceCreateInfoKHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkDisplaySurfaceCreateFlagsKHR! ]
	displayMode     [ VkDisplayModeKHR! ]
	planeIndex      [ integer! ]
	planeStackIndex [ integer! ]
	transform       [ VkSurfaceTransformFlagBitsKHR! ]
	globalAlpha     [ float32! ]
	alphaMode       [ VkDisplayPlaneAlphaFlagBitsKHR! ]
	imageExtent     [ VkExtent2D! value ]
]
vkGetPhysicalDeviceDisplayPropertiesKHR!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pPropertyCount  [ pointer! [integer!] ]
	pProperties     [ VkDisplayPropertiesKHR! ]
	return:         [ VkResult! ]
]
vkGetPhysicalDeviceDisplayPlanePropertiesKHR!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pPropertyCount  [ pointer! [integer!] ]
	pProperties     [ VkDisplayPlanePropertiesKHR! ]
	return:         [ VkResult! ]
]
vkGetDisplayPlaneSupportedDisplaysKHR!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	planeIndex      [ integer! ]
	pDisplayCount   [ pointer! [integer!] ]
	pDisplays       [ pointer! [VkDisplayKHR!] ]
	return:         [ VkResult! ]
]
vkGetDisplayModePropertiesKHR!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	display         [ VkDisplayKHR! ]
	pPropertyCount  [ pointer! [integer!] ]
	pProperties     [ VkDisplayModePropertiesKHR! ]
	return:         [ VkResult! ]
]
vkCreateDisplayModeKHR!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	display         [ VkDisplayKHR! ]
	pCreateInfo     [ VkDisplayModeCreateInfoKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pMode           [ pointer! [VkDisplayModeKHR!] ]
	return:         [ VkResult! ]
]
vkGetDisplayPlaneCapabilitiesKHR!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	mode            [ VkDisplayModeKHR! ]
	planeIndex      [ integer! ]
	pCapabilities   [ VkDisplayPlaneCapabilitiesKHR! ]
	return:         [ VkResult! ]
]
vkCreateDisplayPlaneSurfaceKHR!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkDisplaySurfaceCreateInfoKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSurface        [ pointer! [VkSurfaceKHR!] ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_display_swapchain
;-------------------------------------------

#define VK_KHR_display_swapchain                              1 
#define VK_KHR_DISPLAY_SWAPCHAIN_SPEC_VERSION                 9 
#define VK_KHR_DISPLAY_SWAPCHAIN_EXTENSION_NAME               "VK_KHR_display_swapchain" 

VkDisplayPresentInfoKHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	srcRect         [ VkRect2D! value ]
	dstRect         [ VkRect2D! value ]
	persistent      [ VkBool32! ]
]
vkCreateSharedSwapchainsKHR!: alias function! [
	device          [ VkDevice! ]
	swapchainCount  [ integer! ]
	pCreateInfos    [ VkSwapchainCreateInfoKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSwapchains     [ pointer! [integer!] ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_xlib_surface
;-------------------------------------------

#define VK_KHR_xlib_surface                                   1 
#define VK_KHR_XLIB_SURFACE_SPEC_VERSION                      6 
#define VK_KHR_XLIB_SURFACE_EXTENSION_NAME                    "VK_KHR_xlib_surface" 
#define VkXlibSurfaceCreateFlagsKHR! VkFlags!

VkXlibSurfaceCreateInfoKHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkXlibSurfaceCreateFlagsKHR! ]
	dpy             [ pointer! [integer!] ]
	window          [ pointer! [integer!] ]
]
vkCreateXlibSurfaceKHR!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkXlibSurfaceCreateInfoKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSurface        [ pointer! [VkSurfaceKHR!] ]
	return:         [ VkResult! ]
]
vkGetPhysicalDeviceXlibPresentationSupportKHR!: alias function! [
	physicalDevice   [ VkPhysicalDevice! ]
	queueFamilyIndex [ integer! ]
	dpy              [ pointer! [integer!] ]
	visualID         [ VisualID! ]
	return:          [ VkBool32! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_xcb_surface
;-------------------------------------------

#define VK_KHR_xcb_surface                                    1 
#define VK_KHR_XCB_SURFACE_SPEC_VERSION                       6 
#define VK_KHR_XCB_SURFACE_EXTENSION_NAME                     "VK_KHR_xcb_surface" 
#define VkXcbSurfaceCreateFlagsKHR! VkFlags!

VkXcbSurfaceCreateInfoKHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkXcbSurfaceCreateFlagsKHR! ]
	connection      [ pointer! [integer!] ]
	window          [ pointer! [integer!] ]
]
vkCreateXcbSurfaceKHR!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkXcbSurfaceCreateInfoKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSurface        [ pointer! [VkSurfaceKHR!] ]
	return:         [ VkResult! ]
]
vkGetPhysicalDeviceXcbPresentationSupportKHR!: alias function! [
	physicalDevice   [ VkPhysicalDevice! ]
	queueFamilyIndex [ integer! ]
	connection       [ pointer! [integer!] ]
	visual_id        [ xcb_visualid_t! ]
	return:          [ VkBool32! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_wayland_surface
;-------------------------------------------

#define VK_KHR_wayland_surface                                1 
#define VK_KHR_WAYLAND_SURFACE_SPEC_VERSION                   6 
#define VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME                 "VK_KHR_wayland_surface" 
#define VkWaylandSurfaceCreateFlagsKHR! VkFlags!

VkWaylandSurfaceCreateInfoKHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkWaylandSurfaceCreateFlagsKHR! ]
	display         [ pointer! [integer!] ]
	surface         [ pointer! [integer!] ]
]
vkCreateWaylandSurfaceKHR!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkWaylandSurfaceCreateInfoKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSurface        [ pointer! [VkSurfaceKHR!] ]
	return:         [ VkResult! ]
]
vkGetPhysicalDeviceWaylandPresentationSupportKHR!: alias function! [
	physicalDevice   [ VkPhysicalDevice! ]
	queueFamilyIndex [ integer! ]
	display          [ pointer! [integer!] ]
	return:          [ VkBool32! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_mir_surface
;-------------------------------------------

#define VK_KHR_mir_surface                                    1 
#define VK_KHR_MIR_SURFACE_SPEC_VERSION                       4 
#define VK_KHR_MIR_SURFACE_EXTENSION_NAME                     "VK_KHR_mir_surface" 
#define VkMirSurfaceCreateFlagsKHR! VkFlags!

VkMirSurfaceCreateInfoKHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkMirSurfaceCreateFlagsKHR! ]
	connection      [ MirConnection! ]
	mirSurface      [ MirSurface! ]
]
vkCreateMirSurfaceKHR!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkMirSurfaceCreateInfoKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSurface        [ pointer! [VkSurfaceKHR!] ]
	return:         [ VkResult! ]
]
vkGetPhysicalDeviceMirPresentationSupportKHR!: alias function! [
	physicalDevice   [ VkPhysicalDevice! ]
	queueFamilyIndex [ integer! ]
	connection       [ MirConnection! ]
	return:          [ VkBool32! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_android_surface
;-------------------------------------------

#define VK_KHR_android_surface                                1 
#define VK_KHR_ANDROID_SURFACE_SPEC_VERSION                   6 
#define VK_KHR_ANDROID_SURFACE_EXTENSION_NAME                 "VK_KHR_android_surface" 
#define VkAndroidSurfaceCreateFlagsKHR! VkFlags!

VkAndroidSurfaceCreateInfoKHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkAndroidSurfaceCreateFlagsKHR! ]
	window          [ pointer! [integer!] ]
]
vkCreateAndroidSurfaceKHR!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkAndroidSurfaceCreateInfoKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSurface        [ pointer! [VkSurfaceKHR!] ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_win32_surface
;-------------------------------------------

#define VK_KHR_win32_surface                                  1 
#define VK_KHR_WIN32_SURFACE_SPEC_VERSION                     6 
#define VK_KHR_WIN32_SURFACE_EXTENSION_NAME                   "VK_KHR_win32_surface" 
#define VkWin32SurfaceCreateFlagsKHR! VkFlags!

VkWin32SurfaceCreateInfoKHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkWin32SurfaceCreateFlagsKHR! ]
	hinstance       [ HINSTANCE! ]
	hwnd            [ HWND! ]
]
vkCreateWin32SurfaceKHR!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkWin32SurfaceCreateInfoKHR! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSurface        [ pointer! [VkSurfaceKHR!] ]
	return:         [ VkResult! ]
]
vkGetPhysicalDeviceWin32PresentationSupportKHR!: alias function! [
	physicalDevice   [ VkPhysicalDevice! ]
	queueFamilyIndex [ integer! ]
	return:          [ VkBool32! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_sampler_mirror_clamp_to_edge
;-------------------------------------------

#define VK_KHR_sampler_mirror_clamp_to_edge                   1 
#define VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_SPEC_VERSION      1 
#define VK_KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_EXTENSION_NAME    "VK_KHR_sampler_mirror_clamp_to_edge" 


;-------------------------------------------
;-- Extension: VK_KHR_get_physical_device_properties2
;-------------------------------------------

#define VK_KHR_get_physical_device_properties2                1 
#define VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_SPEC_VERSION  1 
#define VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME "VK_KHR_get_physical_device_properties2" 

VkPhysicalDeviceFeatures2KHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	features        [ VkPhysicalDeviceFeatures! value ]
]

VkPhysicalDeviceProperties2KHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	properties      [ VkPhysicalDeviceProperties! value ]
]

VkFormatProperties2KHR!: alias struct! [
	sType            [ VkStructureType! ]
	pNext            [ pointer! [byte!] ]
	formatProperties [ VkFormatProperties! value ]
]

VkImageFormatProperties2KHR!: alias struct! [
	sType                 [ VkStructureType! ]
	pNext                 [ pointer! [byte!] ]
	imageFormatProperties [ VkImageFormatProperties! value ]
]

VkPhysicalDeviceImageFormatInfo2KHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	format          [ VkFormat! ]
	type            [ VkImageType! ]
	tiling          [ VkImageTiling! ]
	usage           [ VkImageUsageFlags! ]
	flags           [ VkImageCreateFlags! ]
]

VkQueueFamilyProperties2KHR!: alias struct! [
	sType                 [ VkStructureType! ]
	pNext                 [ pointer! [byte!] ]
	queueFamilyProperties [ VkQueueFamilyProperties! value ]
]

VkPhysicalDeviceMemoryProperties2KHR!: alias struct! [
	sType            [ VkStructureType! ]
	pNext            [ pointer! [byte!] ]
	memoryProperties [ VkPhysicalDeviceMemoryProperties! value ]
]

VkSparseImageFormatProperties2KHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	properties      [ VkSparseImageFormatProperties! value ]
]

VkPhysicalDeviceSparseImageFormatInfo2KHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	format          [ VkFormat! ]
	type            [ VkImageType! ]
	samples         [ VkSampleCountFlagBits! ]
	usage           [ VkImageUsageFlags! ]
	tiling          [ VkImageTiling! ]
]
vkGetPhysicalDeviceFeatures2KHR!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pFeatures       [ VkPhysicalDeviceFeatures2KHR! ]
]
vkGetPhysicalDeviceProperties2KHR!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pProperties     [ VkPhysicalDeviceProperties2KHR! ]
]
vkGetPhysicalDeviceFormatProperties2KHR!: alias function! [
	physicalDevice    [ VkPhysicalDevice! ]
	format            [ VkFormat! ]
	pFormatProperties [ VkFormatProperties2KHR! ]
]
vkGetPhysicalDeviceImageFormatProperties2KHR!: alias function! [
	physicalDevice         [ VkPhysicalDevice! ]
	pImageFormatInfo       [ VkPhysicalDeviceImageFormatInfo2KHR! ]
	pImageFormatProperties [ VkImageFormatProperties2KHR! ]
	return:                [ VkResult! ]
]
vkGetPhysicalDeviceQueueFamilyProperties2KHR!: alias function! [
	physicalDevice            [ VkPhysicalDevice! ]
	pQueueFamilyPropertyCount [ pointer! [integer!] ]
	pQueueFamilyProperties    [ VkQueueFamilyProperties2KHR! ]
]
vkGetPhysicalDeviceMemoryProperties2KHR!: alias function! [
	physicalDevice    [ VkPhysicalDevice! ]
	pMemoryProperties [ VkPhysicalDeviceMemoryProperties2KHR! ]
]
vkGetPhysicalDeviceSparseImageFormatProperties2KHR!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pFormatInfo     [ VkPhysicalDeviceSparseImageFormatInfo2KHR! ]
	pPropertyCount  [ pointer! [integer!] ]
	pProperties     [ VkSparseImageFormatProperties2KHR! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_shader_draw_parameters
;-------------------------------------------

#define VK_KHR_shader_draw_parameters                         1 
#define VK_KHR_SHADER_DRAW_PARAMETERS_SPEC_VERSION            1 
#define VK_KHR_SHADER_DRAW_PARAMETERS_EXTENSION_NAME          "VK_KHR_shader_draw_parameters" 


;-------------------------------------------
;-- Extension: VK_KHR_maintenance1
;-------------------------------------------

#define VK_KHR_maintenance1                                   1 
#define VK_KHR_MAINTENANCE1_SPEC_VERSION                      1 
#define VK_KHR_MAINTENANCE1_EXTENSION_NAME                    "VK_KHR_maintenance1" 
#define VkCommandPoolTrimFlagsKHR! VkFlags!
vkTrimCommandPoolKHR!: alias function! [
	device          [ VkDevice! ]
	commandPool     [ VkCommandPool! ]
	flags           [ VkCommandPoolTrimFlagsKHR! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_push_descriptor
;-------------------------------------------

#define VK_KHR_push_descriptor                                1 
#define VK_KHR_PUSH_DESCRIPTOR_SPEC_VERSION                   1 
#define VK_KHR_PUSH_DESCRIPTOR_EXTENSION_NAME                 "VK_KHR_push_descriptor" 

VkPhysicalDevicePushDescriptorPropertiesKHR!: alias struct! [
	sType              [ VkStructureType! ]
	pNext              [ pointer! [byte!] ]
	maxPushDescriptors [ integer! ]
]
vkCmdPushDescriptorSetKHR!: alias function! [
	commandBuffer        [ VkCommandBuffer! ]
	pipelineBindPoint    [ VkPipelineBindPoint! ]
	layout               [ VkPipelineLayout! ]
	set                  [ integer! ]
	descriptorWriteCount [ integer! ]
	pDescriptorWrites    [ VkWriteDescriptorSet! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_incremental_present
;-------------------------------------------

#define VK_KHR_incremental_present                            1 
#define VK_KHR_INCREMENTAL_PRESENT_SPEC_VERSION               1 
#define VK_KHR_INCREMENTAL_PRESENT_EXTENSION_NAME             "VK_KHR_incremental_present" 

VkRectLayerKHR!: alias struct! [
	offset          [ VkOffset2D! value ]
	extent          [ VkExtent2D! value ]
	layer           [ integer! ]
]

VkPresentRegionKHR!: alias struct! [
	rectangleCount  [ integer! ]
	pRectangles     [ VkRectLayerKHR! ]
]

VkPresentRegionsKHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	swapchainCount  [ integer! ]
	pRegions        [ VkPresentRegionKHR! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_descriptor_update_template
;-------------------------------------------

#define VK_KHR_descriptor_update_template                     1 
#define VkDescriptorUpdateTemplateKHR! integer!
#define VK_KHR_DESCRIPTOR_UPDATE_TEMPLATE_SPEC_VERSION        1 
#define VK_KHR_DESCRIPTOR_UPDATE_TEMPLATE_EXTENSION_NAME      "VK_KHR_descriptor_update_template" 

#enum VkDescriptorUpdateTemplateTypeKHR! [
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET_KHR:   0
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_PUSH_DESCRIPTORS_KHR: 1
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_BEGIN_RANGE_KHR:      VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET_KHR
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_END_RANGE_KHR:        VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_PUSH_DESCRIPTORS_KHR
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_RANGE_SIZE_KHR:       2 ; (VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_PUSH_DESCRIPTORS_KHR - VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_DESCRIPTOR_SET_KHR + 1)
	VK_DESCRIPTOR_UPDATE_TEMPLATE_TYPE_MAX_ENUM_KHR:         7FFFFFFFh
]
#define VkDescriptorUpdateTemplateCreateFlagsKHR! VkFlags!

VkDescriptorUpdateTemplateEntryKHR!: alias struct! [
	dstBinding      [ integer! ]
	dstArrayElement [ integer! ]
	descriptorCount [ integer! ]
	descriptorType  [ VkDescriptorType! ]
	offset          [ integer! ]
	stride          [ integer! ]
]

VkDescriptorUpdateTemplateCreateInfoKHR!: alias struct! [
	sType                      [ VkStructureType! ]
	pNext                      [ pointer! [byte!] ]
	flags                      [ VkDescriptorUpdateTemplateCreateFlagsKHR! ]
	descriptorUpdateEntryCount [ integer! ]
	pDescriptorUpdateEntries   [ VkDescriptorUpdateTemplateEntryKHR! ]
	templateType               [ VkDescriptorUpdateTemplateTypeKHR! ]
	descriptorSetLayout        [ VkDescriptorSetLayout! ]
	pipelineBindPoint          [ VkPipelineBindPoint! ]
	pipelineLayout             [ VkPipelineLayout! ]
	set                        [ integer! ]
]
vkCreateDescriptorUpdateTemplateKHR!: alias function! [
	device                    [ VkDevice! ]
	pCreateInfo               [ VkDescriptorUpdateTemplateCreateInfoKHR! ]
	pAllocator                [ VkAllocationCallbacks! ]
	pDescriptorUpdateTemplate [ pointer! [VkDescriptorUpdateTemplateKHR!] ]
	return:                   [ VkResult! ]
]
vkDestroyDescriptorUpdateTemplateKHR!: alias function! [
	device                   [ VkDevice! ]
	descriptorUpdateTemplate [ VkDescriptorUpdateTemplateKHR! ]
	pAllocator               [ VkAllocationCallbacks! ]
]
vkUpdateDescriptorSetWithTemplateKHR!: alias function! [
	device                   [ VkDevice! ]
	descriptorSet            [ VkDescriptorSet! ]
	descriptorUpdateTemplate [ VkDescriptorUpdateTemplateKHR! ]
	pData                    [ pointer! [byte!] ]
]
vkCmdPushDescriptorSetWithTemplateKHR!: alias function! [
	commandBuffer            [ VkCommandBuffer! ]
	descriptorUpdateTemplate [ VkDescriptorUpdateTemplateKHR! ]
	layout                   [ VkPipelineLayout! ]
	set                      [ integer! ]
	pData                    [ pointer! [byte!] ]
]


;-------------------------------------------
;-- Extension: VK_KHR_shared_presentable_image
;-------------------------------------------

#define VK_KHR_shared_presentable_image                       1 
#define VK_KHR_SHARED_PRESENTABLE_IMAGE_SPEC_VERSION          1 
#define VK_KHR_SHARED_PRESENTABLE_IMAGE_EXTENSION_NAME        "VK_KHR_shared_presentable_image" 

VkSharedPresentSurfaceCapabilitiesKHR!: alias struct! [
	sType                            [ VkStructureType! ]
	pNext                            [ pointer! [byte!] ]
	sharedPresentSupportedUsageFlags [ VkImageUsageFlags! ]
]
vkGetSwapchainStatusKHR!: alias function! [
	device          [ VkDevice! ]
	swapchain       [ VkSwapchainKHR! ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_KHR_get_surface_capabilities2
;-------------------------------------------

#define VK_KHR_get_surface_capabilities2                      1 
#define VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION        1 
#define VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME      "VK_KHR_get_surface_capabilities2" 

VkPhysicalDeviceSurfaceInfo2KHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	surface         [ VkSurfaceKHR! ]
]

VkSurfaceCapabilities2KHR!: alias struct! [
	sType               [ VkStructureType! ]
	pNext               [ pointer! [byte!] ]
	surfaceCapabilities [ VkSurfaceCapabilitiesKHR! value ]
]

VkSurfaceFormat2KHR!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	surfaceFormat   [ VkSurfaceFormatKHR! value ]
]
vkGetPhysicalDeviceSurfaceCapabilities2KHR!: alias function! [
	physicalDevice       [ VkPhysicalDevice! ]
	pSurfaceInfo         [ VkPhysicalDeviceSurfaceInfo2KHR! ]
	pSurfaceCapabilities [ VkSurfaceCapabilities2KHR! ]
	return:              [ VkResult! ]
]
vkGetPhysicalDeviceSurfaceFormats2KHR!: alias function! [
	physicalDevice      [ VkPhysicalDevice! ]
	pSurfaceInfo        [ VkPhysicalDeviceSurfaceInfo2KHR! ]
	pSurfaceFormatCount [ pointer! [integer!] ]
	pSurfaceFormats     [ VkSurfaceFormat2KHR! ]
	return:             [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_EXT_debug_report
;-------------------------------------------

#define VK_EXT_debug_report                                   1 
#define VkDebugReportCallbackEXT! integer!
#define VK_EXT_DEBUG_REPORT_SPEC_VERSION                      8 
#define VK_EXT_DEBUG_REPORT_EXTENSION_NAME                    "VK_EXT_debug_report" 
#define VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT        VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT 
#define VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_EXT          VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT 

#enum VkDebugReportObjectTypeEXT! [
	VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT:                        0
	VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT:                       1
	VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT:                2
	VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT:                         3
	VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT:                          4
	VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT:                      5
	VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT:                 6
	VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT:                          7
	VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT:                  8
	VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT:                         9
	VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT:                          10
	VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT:                          11
	VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT:                     12
	VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT:                    13
	VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT:                     14
	VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT:                  15
	VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT:                 16
	VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT:                17
	VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT:                    18
	VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT:                       19
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT:          20
	VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT:                        21
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT:                22
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT:                 23
	VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT:                    24
	VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT:                   25
	VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT:                    26
	VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT:                  27
	VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT:      28
	VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT:                    29
	VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT:               30
	VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT:               31
	VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT:   32
	VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_KHR_EXT: 1000085000
	VK_DEBUG_REPORT_OBJECT_TYPE_BEGIN_RANGE_EXT:                    VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT
	VK_DEBUG_REPORT_OBJECT_TYPE_END_RANGE_EXT:                      VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT
	VK_DEBUG_REPORT_OBJECT_TYPE_RANGE_SIZE_EXT:                     33 ; (VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT - VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT + 1)
	VK_DEBUG_REPORT_OBJECT_TYPE_MAX_ENUM_EXT:                       7FFFFFFFh
]

#enum VkDebugReportFlagBitsEXT! [
	VK_DEBUG_REPORT_INFORMATION_BIT_EXT:         00000001h
	VK_DEBUG_REPORT_WARNING_BIT_EXT:             00000002h
	VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT: 00000004h
	VK_DEBUG_REPORT_ERROR_BIT_EXT:               00000008h
	VK_DEBUG_REPORT_DEBUG_BIT_EXT:               00000010h
	VK_DEBUG_REPORT_FLAG_BITS_MAX_ENUM_EXT:      7FFFFFFFh
]
#define VkDebugReportFlagsEXT! VkFlags!
vkDebugReportCallbackEXT!: alias function! [
	flags           [ VkDebugReportFlagsEXT! ]
	objectType      [ VkDebugReportObjectTypeEXT! ]
	object          [ uint64! value ]
	location        [ integer! ]
	messageCode     [ integer! ]
	pLayerPrefix    [ c-string! ]
	pMessage        [ c-string! ]
	pUserData       [ pointer! [byte!] ]
	return:         [ VkBool32! ]
]

VkDebugReportCallbackCreateInfoEXT!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkDebugReportFlagsEXT! ]
	pfnCallback     [ vkDebugReportCallbackEXT! ]
	pUserData       [ pointer! [byte!] ]
]
vkCreateDebugReportCallbackEXT!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkDebugReportCallbackCreateInfoEXT! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pCallback       [ pointer! [VkDebugReportCallbackEXT!] ]
	return:         [ VkResult! ]
]
vkDestroyDebugReportCallbackEXT!: alias function! [
	instance        [ VkInstance! ]
	callback        [ VkDebugReportCallbackEXT! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkDebugReportMessageEXT!: alias function! [
	instance        [ VkInstance! ]
	flags           [ VkDebugReportFlagsEXT! ]
	objectType      [ VkDebugReportObjectTypeEXT! ]
	object          [ uint64! value ]
	location        [ integer! ]
	messageCode     [ integer! ]
	pLayerPrefix    [ c-string! ]
	pMessage        [ c-string! ]
]


;-------------------------------------------
;-- Extension: VK_NV_glsl_shader
;-------------------------------------------

#define VK_NV_glsl_shader                                     1 
#define VK_NV_GLSL_SHADER_SPEC_VERSION                        1 
#define VK_NV_GLSL_SHADER_EXTENSION_NAME                      "VK_NV_glsl_shader" 


;-------------------------------------------
;-- Extension: VK_IMG_filter_cubic
;-------------------------------------------

#define VK_IMG_filter_cubic                                   1 
#define VK_IMG_FILTER_CUBIC_SPEC_VERSION                      1 
#define VK_IMG_FILTER_CUBIC_EXTENSION_NAME                    "VK_IMG_filter_cubic" 


;-------------------------------------------
;-- Extension: VK_AMD_rasterization_order
;-------------------------------------------

#define VK_AMD_rasterization_order                            1 
#define VK_AMD_RASTERIZATION_ORDER_SPEC_VERSION               1 
#define VK_AMD_RASTERIZATION_ORDER_EXTENSION_NAME             "VK_AMD_rasterization_order" 

#enum VkRasterizationOrderAMD! [
	VK_RASTERIZATION_ORDER_STRICT_AMD:      0
	VK_RASTERIZATION_ORDER_RELAXED_AMD:     1
	VK_RASTERIZATION_ORDER_BEGIN_RANGE_AMD: VK_RASTERIZATION_ORDER_STRICT_AMD
	VK_RASTERIZATION_ORDER_END_RANGE_AMD:   VK_RASTERIZATION_ORDER_RELAXED_AMD
	VK_RASTERIZATION_ORDER_RANGE_SIZE_AMD:  2 ; (VK_RASTERIZATION_ORDER_RELAXED_AMD - VK_RASTERIZATION_ORDER_STRICT_AMD + 1)
	VK_RASTERIZATION_ORDER_MAX_ENUM_AMD:    7FFFFFFFh
]

VkPipelineRasterizationStateRasterizationOrderAMD!: alias struct! [
	sType              [ VkStructureType! ]
	pNext              [ pointer! [byte!] ]
	rasterizationOrder [ VkRasterizationOrderAMD! ]
]


;-------------------------------------------
;-- Extension: VK_AMD_shader_trinary_minmax
;-------------------------------------------

#define VK_AMD_shader_trinary_minmax                          1 
#define VK_AMD_SHADER_TRINARY_MINMAX_SPEC_VERSION             1 
#define VK_AMD_SHADER_TRINARY_MINMAX_EXTENSION_NAME           "VK_AMD_shader_trinary_minmax" 


;-------------------------------------------
;-- Extension: VK_AMD_shader_explicit_vertex_parameter
;-------------------------------------------

#define VK_AMD_shader_explicit_vertex_parameter               1 
#define VK_AMD_SHADER_EXPLICIT_VERTEX_PARAMETER_SPEC_VERSION  1 
#define VK_AMD_SHADER_EXPLICIT_VERTEX_PARAMETER_EXTENSION_NAME "VK_AMD_shader_explicit_vertex_parameter" 


;-------------------------------------------
;-- Extension: VK_EXT_debug_marker
;-------------------------------------------

#define VK_EXT_debug_marker                                   1 
#define VK_EXT_DEBUG_MARKER_SPEC_VERSION                      4 
#define VK_EXT_DEBUG_MARKER_EXTENSION_NAME                    "VK_EXT_debug_marker" 

VkDebugMarkerObjectNameInfoEXT!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	objectType      [ VkDebugReportObjectTypeEXT! ]
	object          [ uint64! value ]
	pObjectName     [ c-string! ]
]

VkDebugMarkerObjectTagInfoEXT!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	objectType      [ VkDebugReportObjectTypeEXT! ]
	object          [ uint64! value ]
	tagName         [ uint64! value ]
	tagSize         [ integer! ]
	pTag            [ pointer! [byte!] ]
]

VkDebugMarkerMarkerInfoEXT!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	pMarkerName     [ c-string! ]
	color           [ integer! ]
]
vkDebugMarkerSetObjectTagEXT!: alias function! [
	device          [ VkDevice! ]
	pTagInfo        [ VkDebugMarkerObjectTagInfoEXT! ]
	return:         [ VkResult! ]
]
vkDebugMarkerSetObjectNameEXT!: alias function! [
	device          [ VkDevice! ]
	pNameInfo       [ VkDebugMarkerObjectNameInfoEXT! ]
	return:         [ VkResult! ]
]
vkCmdDebugMarkerBeginEXT!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	pMarkerInfo     [ VkDebugMarkerMarkerInfoEXT! ]
]
vkCmdDebugMarkerEndEXT!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
]
vkCmdDebugMarkerInsertEXT!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	pMarkerInfo     [ VkDebugMarkerMarkerInfoEXT! ]
]


;-------------------------------------------
;-- Extension: VK_AMD_gcn_shader
;-------------------------------------------

#define VK_AMD_gcn_shader                                     1 
#define VK_AMD_GCN_SHADER_SPEC_VERSION                        1 
#define VK_AMD_GCN_SHADER_EXTENSION_NAME                      "VK_AMD_gcn_shader" 


;-------------------------------------------
;-- Extension: VK_NV_dedicated_allocation
;-------------------------------------------

#define VK_NV_dedicated_allocation                            1 
#define VK_NV_DEDICATED_ALLOCATION_SPEC_VERSION               1 
#define VK_NV_DEDICATED_ALLOCATION_EXTENSION_NAME             "VK_NV_dedicated_allocation" 

VkDedicatedAllocationImageCreateInfoNV!: alias struct! [
	sType               [ VkStructureType! ]
	pNext               [ pointer! [byte!] ]
	dedicatedAllocation [ VkBool32! ]
]

VkDedicatedAllocationBufferCreateInfoNV!: alias struct! [
	sType               [ VkStructureType! ]
	pNext               [ pointer! [byte!] ]
	dedicatedAllocation [ VkBool32! ]
]

VkDedicatedAllocationMemoryAllocateInfoNV!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	image           [ VkImage! ]
	buffer          [ VkBuffer! ]
]


;-------------------------------------------
;-- Extension: VK_AMD_draw_indirect_count
;-------------------------------------------

#define VK_AMD_draw_indirect_count                            1 
#define VK_AMD_DRAW_INDIRECT_COUNT_SPEC_VERSION               1 
#define VK_AMD_DRAW_INDIRECT_COUNT_EXTENSION_NAME             "VK_AMD_draw_indirect_count" 
vkCmdDrawIndirectCountAMD!: alias function! [
	commandBuffer     [ VkCommandBuffer! ]
	buffer            [ VkBuffer! ]
	offset            [ VkDeviceSize! ]
	countBuffer       [ VkBuffer! ]
	countBufferOffset [ VkDeviceSize! ]
	maxDrawCount      [ integer! ]
	stride            [ integer! ]
]
vkCmdDrawIndexedIndirectCountAMD!: alias function! [
	commandBuffer     [ VkCommandBuffer! ]
	buffer            [ VkBuffer! ]
	offset            [ VkDeviceSize! ]
	countBuffer       [ VkBuffer! ]
	countBufferOffset [ VkDeviceSize! ]
	maxDrawCount      [ integer! ]
	stride            [ integer! ]
]


;-------------------------------------------
;-- Extension: VK_AMD_negative_viewport_height
;-------------------------------------------

#define VK_AMD_negative_viewport_height                       1 
#define VK_AMD_NEGATIVE_VIEWPORT_HEIGHT_SPEC_VERSION          1 
#define VK_AMD_NEGATIVE_VIEWPORT_HEIGHT_EXTENSION_NAME        "VK_AMD_negative_viewport_height" 


;-------------------------------------------
;-- Extension: VK_AMD_gpu_shader_half_float
;-------------------------------------------

#define VK_AMD_gpu_shader_half_float                          1 
#define VK_AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION             1 
#define VK_AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME           "VK_AMD_gpu_shader_half_float" 


;-------------------------------------------
;-- Extension: VK_AMD_shader_ballot
;-------------------------------------------

#define VK_AMD_shader_ballot                                  1 
#define VK_AMD_SHADER_BALLOT_SPEC_VERSION                     1 
#define VK_AMD_SHADER_BALLOT_EXTENSION_NAME                   "VK_AMD_shader_ballot" 


;-------------------------------------------
;-- Extension: VK_AMD_texture_gather_bias_lod
;-------------------------------------------

#define VK_AMD_texture_gather_bias_lod                        1 
#define VK_AMD_TEXTURE_GATHER_BIAS_LOD_SPEC_VERSION           1 
#define VK_AMD_TEXTURE_GATHER_BIAS_LOD_EXTENSION_NAME         "VK_AMD_texture_gather_bias_lod" 

VkTextureLODGatherFormatPropertiesAMD!: alias struct! [
	sType                           [ VkStructureType! ]
	pNext                           [ pointer! [byte!] ]
	supportsTextureGatherLODBiasAMD [ VkBool32! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_multiview
;-------------------------------------------

#define VK_KHX_multiview                                      1 
#define VK_KHX_MULTIVIEW_SPEC_VERSION                         1 
#define VK_KHX_MULTIVIEW_EXTENSION_NAME                       "VK_KHX_multiview" 

VkRenderPassMultiviewCreateInfoKHX!: alias struct! [
	sType                [ VkStructureType! ]
	pNext                [ pointer! [byte!] ]
	subpassCount         [ integer! ]
	pViewMasks           [ pointer! [integer!] ]
	dependencyCount      [ integer! ]
	pViewOffsets         [ pointer! [integer!] ]
	correlationMaskCount [ integer! ]
	pCorrelationMasks    [ pointer! [integer!] ]
]

VkPhysicalDeviceMultiviewFeaturesKHX!: alias struct! [
	sType                       [ VkStructureType! ]
	pNext                       [ pointer! [byte!] ]
	multiview                   [ VkBool32! ]
	multiviewGeometryShader     [ VkBool32! ]
	multiviewTessellationShader [ VkBool32! ]
]

VkPhysicalDeviceMultiviewPropertiesKHX!: alias struct! [
	sType                     [ VkStructureType! ]
	pNext                     [ pointer! [byte!] ]
	maxMultiviewViewCount     [ integer! ]
	maxMultiviewInstanceIndex [ integer! ]
]


;-------------------------------------------
;-- Extension: VK_IMG_format_pvrtc
;-------------------------------------------

#define VK_IMG_format_pvrtc                                   1 
#define VK_IMG_FORMAT_PVRTC_SPEC_VERSION                      1 
#define VK_IMG_FORMAT_PVRTC_EXTENSION_NAME                    "VK_IMG_format_pvrtc" 


;-------------------------------------------
;-- Extension: VK_NV_external_memory_capabilities
;-------------------------------------------

#define VK_NV_external_memory_capabilities                    1 
#define VK_NV_EXTERNAL_MEMORY_CAPABILITIES_SPEC_VERSION       1 
#define VK_NV_EXTERNAL_MEMORY_CAPABILITIES_EXTENSION_NAME     "VK_NV_external_memory_capabilities" 

#enum VkExternalMemoryHandleTypeFlagBitsNV! [
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_NV:     00000001h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_NV: 00000002h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_IMAGE_BIT_NV:      00000004h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_IMAGE_KMT_BIT_NV:  00000008h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_FLAG_BITS_MAX_ENUM_NV:   7FFFFFFFh
]
#define VkExternalMemoryHandleTypeFlagsNV! VkFlags!

#enum VkExternalMemoryFeatureFlagBitsNV! [
	VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT_NV: 00000001h
	VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT_NV:     00000002h
	VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT_NV:     00000004h
	VK_EXTERNAL_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM_NV: 7FFFFFFFh
]
#define VkExternalMemoryFeatureFlagsNV! VkFlags!

VkExternalImageFormatPropertiesNV!: alias struct! [
	imageFormatProperties         [ VkImageFormatProperties! value ]
	externalMemoryFeatures        [ VkExternalMemoryFeatureFlagsNV! ]
	exportFromImportedHandleTypes [ VkExternalMemoryHandleTypeFlagsNV! ]
	compatibleHandleTypes         [ VkExternalMemoryHandleTypeFlagsNV! ]
]
vkGetPhysicalDeviceExternalImageFormatPropertiesNV!: alias function! [
	physicalDevice                 [ VkPhysicalDevice! ]
	format                         [ VkFormat! ]
	type                           [ VkImageType! ]
	tiling                         [ VkImageTiling! ]
	usage                          [ VkImageUsageFlags! ]
	flags                          [ VkImageCreateFlags! ]
	externalHandleType             [ VkExternalMemoryHandleTypeFlagsNV! ]
	pExternalImageFormatProperties [ VkExternalImageFormatPropertiesNV! ]
	return:                        [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_NV_external_memory
;-------------------------------------------

#define VK_NV_external_memory                                 1 
#define VK_NV_EXTERNAL_MEMORY_SPEC_VERSION                    1 
#define VK_NV_EXTERNAL_MEMORY_EXTENSION_NAME                  "VK_NV_external_memory" 

VkExternalMemoryImageCreateInfoNV!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleTypes     [ VkExternalMemoryHandleTypeFlagsNV! ]
]

VkExportMemoryAllocateInfoNV!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleTypes     [ VkExternalMemoryHandleTypeFlagsNV! ]
]


;-------------------------------------------
;-- Extension: VK_NV_external_memory_win32
;-------------------------------------------

#define VK_NV_external_memory_win32                           1 
#define VK_NV_EXTERNAL_MEMORY_WIN32_SPEC_VERSION              1 
#define VK_NV_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME            "VK_NV_external_memory_win32" 

VkImportMemoryWin32HandleInfoNV!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleType      [ VkExternalMemoryHandleTypeFlagsNV! ]
	handle          [ HANDLE! ]
]

VkExportMemoryWin32HandleInfoNV!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	pAttributes     [ SECURITY_ATTRIBUTES! ]
	dwAccess        [ integer! ]
]
vkGetMemoryWin32HandleNV!: alias function! [
	device          [ VkDevice! ]
	memory          [ VkDeviceMemory! ]
	handleType      [ VkExternalMemoryHandleTypeFlagsNV! ]
	pHandle         [ pointer! [integer!] ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_NV_win32_keyed_mutex
;-------------------------------------------

#define VK_NV_win32_keyed_mutex                               1 
#define VK_NV_WIN32_KEYED_MUTEX_SPEC_VERSION                  1 
#define VK_NV_WIN32_KEYED_MUTEX_EXTENSION_NAME                "VK_NV_win32_keyed_mutex" 

VkWin32KeyedMutexAcquireReleaseInfoNV!: alias struct! [
	sType                       [ VkStructureType! ]
	pNext                       [ pointer! [byte!] ]
	acquireCount                [ integer! ]
	pAcquireSyncs               [ pointer! [integer!] ]
	pAcquireKeys                [ uint64! ]
	pAcquireTimeoutMilliseconds [ pointer! [integer!] ]
	releaseCount                [ integer! ]
	pReleaseSyncs               [ pointer! [integer!] ]
	pReleaseKeys                [ uint64! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_device_group
;-------------------------------------------

#define VK_KHX_device_group                                   1 
#define VK_MAX_DEVICE_GROUP_SIZE_KHX                          32 
#define VK_KHX_DEVICE_GROUP_SPEC_VERSION                      1 
#define VK_KHX_DEVICE_GROUP_EXTENSION_NAME                    "VK_KHX_device_group" 

#enum VkPeerMemoryFeatureFlagBitsKHX! [
	VK_PEER_MEMORY_FEATURE_COPY_SRC_BIT_KHX:       00000001h
	VK_PEER_MEMORY_FEATURE_COPY_DST_BIT_KHX:       00000002h
	VK_PEER_MEMORY_FEATURE_GENERIC_SRC_BIT_KHX:    00000004h
	VK_PEER_MEMORY_FEATURE_GENERIC_DST_BIT_KHX:    00000008h
	VK_PEER_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM_KHX: 7FFFFFFFh
]
#define VkPeerMemoryFeatureFlagsKHX! VkFlags!

#enum VkMemoryAllocateFlagBitsKHX! [
	VK_MEMORY_ALLOCATE_DEVICE_MASK_BIT_KHX:    00000001h
	VK_MEMORY_ALLOCATE_FLAG_BITS_MAX_ENUM_KHX: 7FFFFFFFh
]
#define VkMemoryAllocateFlagsKHX! VkFlags!

#enum VkDeviceGroupPresentModeFlagBitsKHX! [
	VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_BIT_KHX:              00000001h
	VK_DEVICE_GROUP_PRESENT_MODE_REMOTE_BIT_KHX:             00000002h
	VK_DEVICE_GROUP_PRESENT_MODE_SUM_BIT_KHX:                00000004h
	VK_DEVICE_GROUP_PRESENT_MODE_LOCAL_MULTI_DEVICE_BIT_KHX: 00000008h
	VK_DEVICE_GROUP_PRESENT_MODE_FLAG_BITS_MAX_ENUM_KHX:     7FFFFFFFh
]
#define VkDeviceGroupPresentModeFlagsKHX! VkFlags!

VkMemoryAllocateFlagsInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkMemoryAllocateFlagsKHX! ]
	deviceMask      [ integer! ]
]

VkBindBufferMemoryInfoKHX!: alias struct! [
	sType            [ VkStructureType! ]
	pNext            [ pointer! [byte!] ]
	buffer           [ VkBuffer! ]
	memory           [ VkDeviceMemory! ]
	memoryOffset     [ VkDeviceSize! ]
	deviceIndexCount [ integer! ]
	pDeviceIndices   [ pointer! [integer!] ]
]

VkBindImageMemoryInfoKHX!: alias struct! [
	sType            [ VkStructureType! ]
	pNext            [ pointer! [byte!] ]
	image            [ VkImage! ]
	memory           [ VkDeviceMemory! ]
	memoryOffset     [ VkDeviceSize! ]
	deviceIndexCount [ integer! ]
	pDeviceIndices   [ pointer! [integer!] ]
	SFRRectCount     [ integer! ]
	pSFRRects        [ VkRect2D! ]
]

VkDeviceGroupRenderPassBeginInfoKHX!: alias struct! [
	sType                 [ VkStructureType! ]
	pNext                 [ pointer! [byte!] ]
	deviceMask            [ integer! ]
	deviceRenderAreaCount [ integer! ]
	pDeviceRenderAreas    [ VkRect2D! ]
]

VkDeviceGroupCommandBufferBeginInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	deviceMask      [ integer! ]
]

VkDeviceGroupSubmitInfoKHX!: alias struct! [
	sType                         [ VkStructureType! ]
	pNext                         [ pointer! [byte!] ]
	waitSemaphoreCount            [ integer! ]
	pWaitSemaphoreDeviceIndices   [ pointer! [integer!] ]
	commandBufferCount            [ integer! ]
	pCommandBufferDeviceMasks     [ pointer! [integer!] ]
	signalSemaphoreCount          [ integer! ]
	pSignalSemaphoreDeviceIndices [ pointer! [integer!] ]
]

VkDeviceGroupBindSparseInfoKHX!: alias struct! [
	sType               [ VkStructureType! ]
	pNext               [ pointer! [byte!] ]
	resourceDeviceIndex [ integer! ]
	memoryDeviceIndex   [ integer! ]
]

VkDeviceGroupPresentCapabilitiesKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	presentMask     [ integer! ]
	modes           [ VkDeviceGroupPresentModeFlagsKHX! ]
]

VkImageSwapchainCreateInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	swapchain       [ VkSwapchainKHR! ]
]

VkBindImageMemorySwapchainInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	swapchain       [ VkSwapchainKHR! ]
	imageIndex      [ integer! ]
]

VkAcquireNextImageInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	swapchain       [ VkSwapchainKHR! ]
	timeout         [ uint64! value ]
	semaphore       [ VkSemaphore! ]
	fence           [ VkFence! ]
	deviceMask      [ integer! ]
]

VkDeviceGroupPresentInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	swapchainCount  [ integer! ]
	pDeviceMasks    [ pointer! [integer!] ]
	mode            [ VkDeviceGroupPresentModeFlagBitsKHX! ]
]

VkDeviceGroupSwapchainCreateInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	modes           [ VkDeviceGroupPresentModeFlagsKHX! ]
]
vkGetDeviceGroupPeerMemoryFeaturesKHX!: alias function! [
	device              [ VkDevice! ]
	heapIndex           [ integer! ]
	localDeviceIndex    [ integer! ]
	remoteDeviceIndex   [ integer! ]
	pPeerMemoryFeatures [ pointer! [VkPeerMemoryFeatureFlagsKHX!] ]
]
vkBindBufferMemory2KHX!: alias function! [
	device          [ VkDevice! ]
	bindInfoCount   [ integer! ]
	pBindInfos      [ VkBindBufferMemoryInfoKHX! ]
	return:         [ VkResult! ]
]
vkBindImageMemory2KHX!: alias function! [
	device          [ VkDevice! ]
	bindInfoCount   [ integer! ]
	pBindInfos      [ VkBindImageMemoryInfoKHX! ]
	return:         [ VkResult! ]
]
vkCmdSetDeviceMaskKHX!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	deviceMask      [ integer! ]
]
vkGetDeviceGroupPresentCapabilitiesKHX!: alias function! [
	device                          [ VkDevice! ]
	pDeviceGroupPresentCapabilities [ VkDeviceGroupPresentCapabilitiesKHX! ]
	return:                         [ VkResult! ]
]
vkGetDeviceGroupSurfacePresentModesKHX!: alias function! [
	device          [ VkDevice! ]
	surface         [ VkSurfaceKHR! ]
	pModes          [ pointer! [VkDeviceGroupPresentModeFlagsKHX!] ]
	return:         [ VkResult! ]
]
vkAcquireNextImage2KHX!: alias function! [
	device          [ VkDevice! ]
	pAcquireInfo    [ VkAcquireNextImageInfoKHX! ]
	pImageIndex     [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkCmdDispatchBaseKHX!: alias function! [
	commandBuffer   [ VkCommandBuffer! ]
	baseGroupX      [ integer! ]
	baseGroupY      [ integer! ]
	baseGroupZ      [ integer! ]
	groupCountX     [ integer! ]
	groupCountY     [ integer! ]
	groupCountZ     [ integer! ]
]
vkGetPhysicalDevicePresentRectanglesKHX!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	surface         [ VkSurfaceKHR! ]
	pRectCount      [ pointer! [integer!] ]
	pRects          [ VkRect2D! ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_EXT_validation_flags
;-------------------------------------------

#define VK_EXT_validation_flags                               1 
#define VK_EXT_VALIDATION_FLAGS_SPEC_VERSION                  1 
#define VK_EXT_VALIDATION_FLAGS_EXTENSION_NAME                "VK_EXT_validation_flags" 

#enum VkValidationCheckEXT! [
	VK_VALIDATION_CHECK_ALL_EXT:         0
	VK_VALIDATION_CHECK_SHADERS_EXT:     1
	VK_VALIDATION_CHECK_BEGIN_RANGE_EXT: VK_VALIDATION_CHECK_ALL_EXT
	VK_VALIDATION_CHECK_END_RANGE_EXT:   VK_VALIDATION_CHECK_SHADERS_EXT
	VK_VALIDATION_CHECK_RANGE_SIZE_EXT:  2 ; (VK_VALIDATION_CHECK_SHADERS_EXT - VK_VALIDATION_CHECK_ALL_EXT + 1)
	VK_VALIDATION_CHECK_MAX_ENUM_EXT:    7FFFFFFFh
]

VkValidationFlagsEXT!: alias struct! [
	sType                        [ VkStructureType! ]
	pNext                        [ pointer! [byte!] ]
	disabledValidationCheckCount [ integer! ]
	pDisabledValidationChecks    [ pointer! [integer!] ]
]


;-------------------------------------------
;-- Extension: VK_NN_vi_surface
;-------------------------------------------

#define VK_NN_vi_surface                                      1 
#define VK_NN_VI_SURFACE_SPEC_VERSION                         1 
#define VK_NN_VI_SURFACE_EXTENSION_NAME                       "VK_NN_vi_surface" 
#define VkViSurfaceCreateFlagsNN! VkFlags!

VkViSurfaceCreateInfoNN!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkViSurfaceCreateFlagsNN! ]
	window          [ pointer! [byte!] ]
]
vkCreateViSurfaceNN!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkViSurfaceCreateInfoNN! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSurface        [ pointer! [VkSurfaceKHR!] ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_EXT_shader_subgroup_ballot
;-------------------------------------------

#define VK_EXT_shader_subgroup_ballot                         1 
#define VK_EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION            1 
#define VK_EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME          "VK_EXT_shader_subgroup_ballot" 


;-------------------------------------------
;-- Extension: VK_EXT_shader_subgroup_vote
;-------------------------------------------

#define VK_EXT_shader_subgroup_vote                           1 
#define VK_EXT_SHADER_SUBGROUP_VOTE_SPEC_VERSION              1 
#define VK_EXT_SHADER_SUBGROUP_VOTE_EXTENSION_NAME            "VK_EXT_shader_subgroup_vote" 


;-------------------------------------------
;-- Extension: VK_KHX_device_group_creation
;-------------------------------------------

#define VK_KHX_device_group_creation                          1 
#define VK_KHX_DEVICE_GROUP_CREATION_SPEC_VERSION             1 
#define VK_KHX_DEVICE_GROUP_CREATION_EXTENSION_NAME           "VK_KHX_device_group_creation" 

VkPhysicalDeviceGroupPropertiesKHX!: alias struct! [
	sType               [ VkStructureType! ]
	pNext               [ pointer! [byte!] ]
	physicalDeviceCount [ integer! ]
	physicalDevices     [ integer! ]
	subsetAllocation    [ VkBool32! ]
]

VkDeviceGroupDeviceCreateInfoKHX!: alias struct! [
	sType               [ VkStructureType! ]
	pNext               [ pointer! [byte!] ]
	physicalDeviceCount [ integer! ]
	pPhysicalDevices    [ pointer! [integer!] ]
]
vkEnumeratePhysicalDeviceGroupsKHX!: alias function! [
	instance                       [ VkInstance! ]
	pPhysicalDeviceGroupCount      [ pointer! [integer!] ]
	pPhysicalDeviceGroupProperties [ VkPhysicalDeviceGroupPropertiesKHX! ]
	return:                        [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_external_memory_capabilities
;-------------------------------------------

#define VK_KHX_external_memory_capabilities                   1 
#define VK_LUID_SIZE_KHX                                      8 
#define VK_KHX_EXTERNAL_MEMORY_CAPABILITIES_SPEC_VERSION      1 
#define VK_KHX_EXTERNAL_MEMORY_CAPABILITIES_EXTENSION_NAME    "VK_KHX_external_memory_capabilities" 

#enum VkExternalMemoryHandleTypeFlagBitsKHX! [
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT_KHX:         00000001h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHX:      00000002h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHX:  00000004h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT_KHX:     00000008h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT_KHX: 00000010h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT_KHX:        00000020h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT_KHX:    00000040h
	VK_EXTERNAL_MEMORY_HANDLE_TYPE_FLAG_BITS_MAX_ENUM_KHX:    7FFFFFFFh
]
#define VkExternalMemoryHandleTypeFlagsKHX! VkFlags!

#enum VkExternalMemoryFeatureFlagBitsKHX! [
	VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT_KHX: 00000001h
	VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT_KHX:     00000002h
	VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT_KHX:     00000004h
	VK_EXTERNAL_MEMORY_FEATURE_FLAG_BITS_MAX_ENUM_KHX: 7FFFFFFFh
]
#define VkExternalMemoryFeatureFlagsKHX! VkFlags!

VkExternalMemoryPropertiesKHX!: alias struct! [
	externalMemoryFeatures        [ VkExternalMemoryFeatureFlagsKHX! ]
	exportFromImportedHandleTypes [ VkExternalMemoryHandleTypeFlagsKHX! ]
	compatibleHandleTypes         [ VkExternalMemoryHandleTypeFlagsKHX! ]
]

VkPhysicalDeviceExternalImageFormatInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleType      [ VkExternalMemoryHandleTypeFlagBitsKHX! ]
]

VkExternalImageFormatPropertiesKHX!: alias struct! [
	sType                    [ VkStructureType! ]
	pNext                    [ pointer! [byte!] ]
	externalMemoryProperties [ VkExternalMemoryPropertiesKHX! value ]
]

VkPhysicalDeviceExternalBufferInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkBufferCreateFlags! ]
	usage           [ VkBufferUsageFlags! ]
	handleType      [ VkExternalMemoryHandleTypeFlagBitsKHX! ]
]

VkExternalBufferPropertiesKHX!: alias struct! [
	sType                    [ VkStructureType! ]
	pNext                    [ pointer! [byte!] ]
	externalMemoryProperties [ VkExternalMemoryPropertiesKHX! value ]
]

VkPhysicalDeviceIDPropertiesKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	deviceUUID      [ integer! ]
	driverUUID      [ integer! ]
	deviceLUID      [ integer! ]
	deviceLUIDValid [ VkBool32! ]
]
vkGetPhysicalDeviceExternalBufferPropertiesKHX!: alias function! [
	physicalDevice            [ VkPhysicalDevice! ]
	pExternalBufferInfo       [ VkPhysicalDeviceExternalBufferInfoKHX! ]
	pExternalBufferProperties [ VkExternalBufferPropertiesKHX! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_external_memory
;-------------------------------------------

#define VK_KHX_external_memory                                1 
#define VK_KHX_EXTERNAL_MEMORY_SPEC_VERSION                   1 
#define VK_KHX_EXTERNAL_MEMORY_EXTENSION_NAME                 "VK_KHX_external_memory" 
#define VK_QUEUE_FAMILY_EXTERNAL_KHX                          FFFEh  ;(~0U-1)

VkExternalMemoryImageCreateInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleTypes     [ VkExternalMemoryHandleTypeFlagsKHX! ]
]

VkExternalMemoryBufferCreateInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleTypes     [ VkExternalMemoryHandleTypeFlagsKHX! ]
]

VkExportMemoryAllocateInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleTypes     [ VkExternalMemoryHandleTypeFlagsKHX! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_external_memory_win32
;-------------------------------------------

#define VK_KHX_external_memory_win32                          1 
#define VK_KHX_EXTERNAL_MEMORY_WIN32_SPEC_VERSION             1 
#define VK_KHX_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME           "VK_KHX_external_memory_win32" 

VkImportMemoryWin32HandleInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleType      [ VkExternalMemoryHandleTypeFlagBitsKHX! ]
	handle          [ HANDLE! ]
]

VkExportMemoryWin32HandleInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	pAttributes     [ SECURITY_ATTRIBUTES! ]
	dwAccess        [ integer! ]
	name            [ LPCWSTR! ]
]

VkMemoryWin32HandlePropertiesKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	memoryTypeBits  [ integer! ]
]
vkGetMemoryWin32HandleKHX!: alias function! [
	device          [ VkDevice! ]
	memory          [ VkDeviceMemory! ]
	handleType      [ VkExternalMemoryHandleTypeFlagBitsKHX! ]
	pHandle         [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkGetMemoryWin32HandlePropertiesKHX!: alias function! [
	device                       [ VkDevice! ]
	handleType                   [ VkExternalMemoryHandleTypeFlagBitsKHX! ]
	handle                       [ HANDLE! ]
	pMemoryWin32HandleProperties [ VkMemoryWin32HandlePropertiesKHX! ]
	return:                      [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_external_memory_fd
;-------------------------------------------

#define VK_KHX_external_memory_fd                             1 
#define VK_KHX_EXTERNAL_MEMORY_FD_SPEC_VERSION                1 
#define VK_KHX_EXTERNAL_MEMORY_FD_EXTENSION_NAME              "VK_KHX_external_memory_fd" 

VkImportMemoryFdInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleType      [ VkExternalMemoryHandleTypeFlagBitsKHX! ]
	fd              [ integer! ]
]

VkMemoryFdPropertiesKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	memoryTypeBits  [ integer! ]
]
vkGetMemoryFdKHX!: alias function! [
	device          [ VkDevice! ]
	memory          [ VkDeviceMemory! ]
	handleType      [ VkExternalMemoryHandleTypeFlagBitsKHX! ]
	pFd             [ pointer! [integer!] ]
	return:         [ VkResult! ]
]
vkGetMemoryFdPropertiesKHX!: alias function! [
	device              [ VkDevice! ]
	handleType          [ VkExternalMemoryHandleTypeFlagBitsKHX! ]
	fd                  [ integer! ]
	pMemoryFdProperties [ VkMemoryFdPropertiesKHX! ]
	return:             [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_win32_keyed_mutex
;-------------------------------------------

#define VK_KHX_win32_keyed_mutex                              1 
#define VK_KHX_WIN32_KEYED_MUTEX_SPEC_VERSION                 1 
#define VK_KHX_WIN32_KEYED_MUTEX_EXTENSION_NAME               "VK_KHX_win32_keyed_mutex" 

VkWin32KeyedMutexAcquireReleaseInfoKHX!: alias struct! [
	sType            [ VkStructureType! ]
	pNext            [ pointer! [byte!] ]
	acquireCount     [ integer! ]
	pAcquireSyncs    [ pointer! [integer!] ]
	pAcquireKeys     [ uint64! ]
	pAcquireTimeouts [ pointer! [integer!] ]
	releaseCount     [ integer! ]
	pReleaseSyncs    [ pointer! [integer!] ]
	pReleaseKeys     [ uint64! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_external_semaphore_capabilities
;-------------------------------------------

#define VK_KHX_external_semaphore_capabilities                1 
#define VK_KHX_EXTERNAL_SEMAPHORE_CAPABILITIES_SPEC_VERSION   1 
#define VK_KHX_EXTERNAL_SEMAPHORE_CAPABILITIES_EXTENSION_NAME "VK_KHX_external_semaphore_capabilities" 

#enum VkExternalSemaphoreHandleTypeFlagBitsKHX! [
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT_KHX:        00000001h
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHX:     00000002h
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHX: 00000004h
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_D3D12_FENCE_BIT_KHX:      00000008h
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_FENCE_FD_BIT_KHX:         00000010h
	VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_FLAG_BITS_MAX_ENUM_KHX:   7FFFFFFFh
]
#define VkExternalSemaphoreHandleTypeFlagsKHX! VkFlags!

#enum VkExternalSemaphoreFeatureFlagBitsKHX! [
	VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT_KHX:     00000001h
	VK_EXTERNAL_SEMAPHORE_FEATURE_IMPORTABLE_BIT_KHX:     00000002h
	VK_EXTERNAL_SEMAPHORE_FEATURE_FLAG_BITS_MAX_ENUM_KHX: 7FFFFFFFh
]
#define VkExternalSemaphoreFeatureFlagsKHX! VkFlags!

VkPhysicalDeviceExternalSemaphoreInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleType      [ VkExternalSemaphoreHandleTypeFlagBitsKHX! ]
]

VkExternalSemaphorePropertiesKHX!: alias struct! [
	sType                         [ VkStructureType! ]
	pNext                         [ pointer! [byte!] ]
	exportFromImportedHandleTypes [ VkExternalSemaphoreHandleTypeFlagsKHX! ]
	compatibleHandleTypes         [ VkExternalSemaphoreHandleTypeFlagsKHX! ]
	externalSemaphoreFeatures     [ VkExternalSemaphoreFeatureFlagsKHX! ]
]
vkGetPhysicalDeviceExternalSemaphorePropertiesKHX!: alias function! [
	physicalDevice               [ VkPhysicalDevice! ]
	pExternalSemaphoreInfo       [ VkPhysicalDeviceExternalSemaphoreInfoKHX! ]
	pExternalSemaphoreProperties [ VkExternalSemaphorePropertiesKHX! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_external_semaphore
;-------------------------------------------

#define VK_KHX_external_semaphore                             1 
#define VK_KHX_EXTERNAL_SEMAPHORE_SPEC_VERSION                1 
#define VK_KHX_EXTERNAL_SEMAPHORE_EXTENSION_NAME              "VK_KHX_external_semaphore" 

VkExportSemaphoreCreateInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	handleTypes     [ VkExternalSemaphoreHandleTypeFlagsKHX! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_external_semaphore_win32
;-------------------------------------------

#define VK_KHX_external_semaphore_win32                       1 
#define VK_KHX_EXTERNAL_SEMAPHORE_WIN32_SPEC_VERSION          1 
#define VK_KHX_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME        "VK_KHX_external_semaphore_win32" 

VkImportSemaphoreWin32HandleInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	semaphore       [ VkSemaphore! ]
	handleType      [ VkExternalSemaphoreHandleTypeFlagsKHX! ]
	handle          [ HANDLE! ]
]

VkExportSemaphoreWin32HandleInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	pAttributes     [ SECURITY_ATTRIBUTES! ]
	dwAccess        [ integer! ]
	name            [ LPCWSTR! ]
]

VkD3D12FenceSubmitInfoKHX!: alias struct! [
	sType                      [ VkStructureType! ]
	pNext                      [ pointer! [byte!] ]
	waitSemaphoreValuesCount   [ integer! ]
	pWaitSemaphoreValues       [ uint64! ]
	signalSemaphoreValuesCount [ integer! ]
	pSignalSemaphoreValues     [ uint64! ]
]
vkImportSemaphoreWin32HandleKHX!: alias function! [
	device                          [ VkDevice! ]
	pImportSemaphoreWin32HandleInfo [ VkImportSemaphoreWin32HandleInfoKHX! ]
	return:                         [ VkResult! ]
]
vkGetSemaphoreWin32HandleKHX!: alias function! [
	device          [ VkDevice! ]
	semaphore       [ VkSemaphore! ]
	handleType      [ VkExternalSemaphoreHandleTypeFlagBitsKHX! ]
	pHandle         [ pointer! [integer!] ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_KHX_external_semaphore_fd
;-------------------------------------------

#define VK_KHX_external_semaphore_fd                          1 
#define VK_KHX_EXTERNAL_SEMAPHORE_FD_SPEC_VERSION             1 
#define VK_KHX_EXTERNAL_SEMAPHORE_FD_EXTENSION_NAME           "VK_KHX_external_semaphore_fd" 

VkImportSemaphoreFdInfoKHX!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	semaphore       [ VkSemaphore! ]
	handleType      [ VkExternalSemaphoreHandleTypeFlagBitsKHX! ]
	fd              [ integer! ]
]
vkImportSemaphoreFdKHX!: alias function! [
	device                 [ VkDevice! ]
	pImportSemaphoreFdInfo [ VkImportSemaphoreFdInfoKHX! ]
	return:                [ VkResult! ]
]
vkGetSemaphoreFdKHX!: alias function! [
	device          [ VkDevice! ]
	semaphore       [ VkSemaphore! ]
	handleType      [ VkExternalSemaphoreHandleTypeFlagBitsKHX! ]
	pFd             [ pointer! [integer!] ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_NVX_device_generated_commands
;-------------------------------------------

#define VK_NVX_device_generated_commands                      1 
#define VkObjectTableNVX!       integer!
#define VkIndirectCommandsLayoutNVX! integer!
#define VK_NVX_DEVICE_GENERATED_COMMANDS_SPEC_VERSION         1 
#define VK_NVX_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME       "VK_NVX_device_generated_commands" 

#enum VkIndirectCommandsTokenTypeNVX! [
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_PIPELINE_NVX:       0
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_DESCRIPTOR_SET_NVX: 1
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_INDEX_BUFFER_NVX:   2
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_VERTEX_BUFFER_NVX:  3
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_PUSH_CONSTANT_NVX:  4
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_INDEXED_NVX:   5
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_DRAW_NVX:           6
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_DISPATCH_NVX:       7
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_BEGIN_RANGE_NVX:    VK_INDIRECT_COMMANDS_TOKEN_TYPE_PIPELINE_NVX
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_END_RANGE_NVX:      VK_INDIRECT_COMMANDS_TOKEN_TYPE_DISPATCH_NVX
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_RANGE_SIZE_NVX:     8 ; (VK_INDIRECT_COMMANDS_TOKEN_TYPE_DISPATCH_NVX - VK_INDIRECT_COMMANDS_TOKEN_TYPE_PIPELINE_NVX + 1)
	VK_INDIRECT_COMMANDS_TOKEN_TYPE_MAX_ENUM_NVX:       7FFFFFFFh
]

#enum VkObjectEntryTypeNVX! [
	VK_OBJECT_ENTRY_TYPE_DESCRIPTOR_SET_NVX: 0
	VK_OBJECT_ENTRY_TYPE_PIPELINE_NVX:       1
	VK_OBJECT_ENTRY_TYPE_INDEX_BUFFER_NVX:   2
	VK_OBJECT_ENTRY_TYPE_VERTEX_BUFFER_NVX:  3
	VK_OBJECT_ENTRY_TYPE_PUSH_CONSTANT_NVX:  4
	VK_OBJECT_ENTRY_TYPE_BEGIN_RANGE_NVX:    VK_OBJECT_ENTRY_TYPE_DESCRIPTOR_SET_NVX
	VK_OBJECT_ENTRY_TYPE_END_RANGE_NVX:      VK_OBJECT_ENTRY_TYPE_PUSH_CONSTANT_NVX
	VK_OBJECT_ENTRY_TYPE_RANGE_SIZE_NVX:     5 ; (VK_OBJECT_ENTRY_TYPE_PUSH_CONSTANT_NVX - VK_OBJECT_ENTRY_TYPE_DESCRIPTOR_SET_NVX + 1)
	VK_OBJECT_ENTRY_TYPE_MAX_ENUM_NVX:       7FFFFFFFh
]

#enum VkIndirectCommandsLayoutUsageFlagBitsNVX! [
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_UNORDERED_SEQUENCES_BIT_NVX: 00000001h
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_SPARSE_SEQUENCES_BIT_NVX:    00000002h
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_EMPTY_EXECUTIONS_BIT_NVX:    00000004h
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_INDEXED_SEQUENCES_BIT_NVX:   00000008h
	VK_INDIRECT_COMMANDS_LAYOUT_USAGE_FLAG_BITS_MAX_ENUM_NVX:      7FFFFFFFh
]
#define VkIndirectCommandsLayoutUsageFlagsNVX! VkFlags!

#enum VkObjectEntryUsageFlagBitsNVX! [
	VK_OBJECT_ENTRY_USAGE_GRAPHICS_BIT_NVX:       00000001h
	VK_OBJECT_ENTRY_USAGE_COMPUTE_BIT_NVX:        00000002h
	VK_OBJECT_ENTRY_USAGE_FLAG_BITS_MAX_ENUM_NVX: 7FFFFFFFh
]
#define VkObjectEntryUsageFlagsNVX! VkFlags!

VkDeviceGeneratedCommandsFeaturesNVX!: alias struct! [
	sType                      [ VkStructureType! ]
	pNext                      [ pointer! [byte!] ]
	computeBindingPointSupport [ VkBool32! ]
]

VkDeviceGeneratedCommandsLimitsNVX!: alias struct! [
	sType                                 [ VkStructureType! ]
	pNext                                 [ pointer! [byte!] ]
	maxIndirectCommandsLayoutTokenCount   [ integer! ]
	maxObjectEntryCounts                  [ integer! ]
	minSequenceCountBufferOffsetAlignment [ integer! ]
	minSequenceIndexBufferOffsetAlignment [ integer! ]
	minCommandsTokenBufferOffsetAlignment [ integer! ]
]

VkIndirectCommandsTokenNVX!: alias struct! [
	tokenType       [ VkIndirectCommandsTokenTypeNVX! ]
	buffer          [ VkBuffer! ]
	offset          [ VkDeviceSize! ]
]

VkIndirectCommandsLayoutTokenNVX!: alias struct! [
	tokenType       [ VkIndirectCommandsTokenTypeNVX! ]
	bindingUnit     [ integer! ]
	dynamicCount    [ integer! ]
	divisor         [ integer! ]
]

VkIndirectCommandsLayoutCreateInfoNVX!: alias struct! [
	sType             [ VkStructureType! ]
	pNext             [ pointer! [byte!] ]
	pipelineBindPoint [ VkPipelineBindPoint! ]
	flags             [ VkIndirectCommandsLayoutUsageFlagsNVX! ]
	tokenCount        [ integer! ]
	pTokens           [ VkIndirectCommandsLayoutTokenNVX! ]
]

VkCmdProcessCommandsInfoNVX!: alias struct! [
	sType                      [ VkStructureType! ]
	pNext                      [ pointer! [byte!] ]
	objectTable                [ VkObjectTableNVX! ]
	indirectCommandsLayout     [ VkIndirectCommandsLayoutNVX! ]
	indirectCommandsTokenCount [ integer! ]
	pIndirectCommandsTokens    [ VkIndirectCommandsTokenNVX! ]
	maxSequencesCount          [ integer! ]
	targetCommandBuffer        [ VkCommandBuffer! ]
	sequencesCountBuffer       [ VkBuffer! ]
	sequencesCountOffset       [ VkDeviceSize! ]
	sequencesIndexBuffer       [ VkBuffer! ]
	sequencesIndexOffset       [ VkDeviceSize! ]
]

VkCmdReserveSpaceForCommandsInfoNVX!: alias struct! [
	sType                  [ VkStructureType! ]
	pNext                  [ pointer! [byte!] ]
	objectTable            [ VkObjectTableNVX! ]
	indirectCommandsLayout [ VkIndirectCommandsLayoutNVX! ]
	maxSequencesCount      [ integer! ]
]

VkObjectTableCreateInfoNVX!: alias struct! [
	sType                          [ VkStructureType! ]
	pNext                          [ pointer! [byte!] ]
	objectCount                    [ integer! ]
	pObjectEntryTypes              [ pointer! [integer!] ]
	pObjectEntryCounts             [ pointer! [integer!] ]
	pObjectEntryUsageFlags         [ pointer! [integer!] ]
	maxUniformBuffersPerDescriptor [ integer! ]
	maxStorageBuffersPerDescriptor [ integer! ]
	maxStorageImagesPerDescriptor  [ integer! ]
	maxSampledImagesPerDescriptor  [ integer! ]
	maxPipelineLayouts             [ integer! ]
]

VkObjectTableEntryNVX!: alias struct! [
	type            [ VkObjectEntryTypeNVX! ]
	flags           [ VkObjectEntryUsageFlagsNVX! ]
]

VkObjectTablePipelineEntryNVX!: alias struct! [
	type            [ VkObjectEntryTypeNVX! ]
	flags           [ VkObjectEntryUsageFlagsNVX! ]
	pipeline        [ VkPipeline! ]
]

VkObjectTableDescriptorSetEntryNVX!: alias struct! [
	type            [ VkObjectEntryTypeNVX! ]
	flags           [ VkObjectEntryUsageFlagsNVX! ]
	pipelineLayout  [ VkPipelineLayout! ]
	descriptorSet   [ VkDescriptorSet! ]
]

VkObjectTableVertexBufferEntryNVX!: alias struct! [
	type            [ VkObjectEntryTypeNVX! ]
	flags           [ VkObjectEntryUsageFlagsNVX! ]
	buffer          [ VkBuffer! ]
]

VkObjectTableIndexBufferEntryNVX!: alias struct! [
	type            [ VkObjectEntryTypeNVX! ]
	flags           [ VkObjectEntryUsageFlagsNVX! ]
	buffer          [ VkBuffer! ]
	indexType       [ VkIndexType! ]
]

VkObjectTablePushConstantEntryNVX!: alias struct! [
	type            [ VkObjectEntryTypeNVX! ]
	flags           [ VkObjectEntryUsageFlagsNVX! ]
	pipelineLayout  [ VkPipelineLayout! ]
	stageFlags      [ VkShaderStageFlags! ]
]
vkCmdProcessCommandsNVX!: alias function! [
	commandBuffer        [ VkCommandBuffer! ]
	pProcessCommandsInfo [ VkCmdProcessCommandsInfoNVX! ]
]
vkCmdReserveSpaceForCommandsNVX!: alias function! [
	commandBuffer     [ VkCommandBuffer! ]
	pReserveSpaceInfo [ VkCmdReserveSpaceForCommandsInfoNVX! ]
]
vkCreateIndirectCommandsLayoutNVX!: alias function! [
	device                  [ VkDevice! ]
	pCreateInfo             [ VkIndirectCommandsLayoutCreateInfoNVX! ]
	pAllocator              [ VkAllocationCallbacks! ]
	pIndirectCommandsLayout [ pointer! [VkIndirectCommandsLayoutNVX!] ]
	return:                 [ VkResult! ]
]
vkDestroyIndirectCommandsLayoutNVX!: alias function! [
	device                 [ VkDevice! ]
	indirectCommandsLayout [ VkIndirectCommandsLayoutNVX! ]
	pAllocator             [ VkAllocationCallbacks! ]
]
vkCreateObjectTableNVX!: alias function! [
	device          [ VkDevice! ]
	pCreateInfo     [ VkObjectTableCreateInfoNVX! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pObjectTable    [ pointer! [VkObjectTableNVX!] ]
	return:         [ VkResult! ]
]
vkDestroyObjectTableNVX!: alias function! [
	device          [ VkDevice! ]
	objectTable     [ VkObjectTableNVX! ]
	pAllocator      [ VkAllocationCallbacks! ]
]
vkRegisterObjectsNVX!: alias function! [
	device               [ VkDevice! ]
	objectTable          [ VkObjectTableNVX! ]
	objectCount          [ integer! ]
	ppObjectTableEntries [ pointer! [integer!] ]
	pObjectIndices       [ pointer! [integer!] ]
	return:              [ VkResult! ]
]
vkUnregisterObjectsNVX!: alias function! [
	device            [ VkDevice! ]
	objectTable       [ VkObjectTableNVX! ]
	objectCount       [ integer! ]
	pObjectEntryTypes [ pointer! [integer!] ]
	pObjectIndices    [ pointer! [integer!] ]
	return:           [ VkResult! ]
]
vkGetPhysicalDeviceGeneratedCommandsPropertiesNVX!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	pFeatures       [ VkDeviceGeneratedCommandsFeaturesNVX! ]
	pLimits         [ VkDeviceGeneratedCommandsLimitsNVX! ]
]


;-------------------------------------------
;-- Extension: VK_NV_clip_space_w_scaling
;-------------------------------------------

#define VK_NV_clip_space_w_scaling                            1 
#define VK_NV_CLIP_SPACE_W_SCALING_SPEC_VERSION               1 
#define VK_NV_CLIP_SPACE_W_SCALING_EXTENSION_NAME             "VK_NV_clip_space_w_scaling" 

VkViewportWScalingNV!: alias struct! [
	xcoeff          [ float32! ]
	ycoeff          [ float32! ]
]

VkPipelineViewportWScalingStateCreateInfoNV!: alias struct! [
	sType                  [ VkStructureType! ]
	pNext                  [ pointer! [byte!] ]
	viewportWScalingEnable [ VkBool32! ]
	viewportCount          [ integer! ]
	pViewportWScalings     [ VkViewportWScalingNV! ]
]
vkCmdSetViewportWScalingNV!: alias function! [
	commandBuffer      [ VkCommandBuffer! ]
	firstViewport      [ integer! ]
	viewportCount      [ integer! ]
	pViewportWScalings [ VkViewportWScalingNV! ]
]


;-------------------------------------------
;-- Extension: VK_EXT_direct_mode_display
;-------------------------------------------

#define VK_EXT_direct_mode_display                            1 
#define VK_EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION               1 
#define VK_EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME             "VK_EXT_direct_mode_display" 
vkReleaseDisplayEXT!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	display         [ VkDisplayKHR! ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_EXT_acquire_xlib_display
;-------------------------------------------

#define VK_EXT_acquire_xlib_display                           1 
#define VK_EXT_ACQUIRE_XLIB_DISPLAY_SPEC_VERSION              1 
#define VK_EXT_ACQUIRE_XLIB_DISPLAY_EXTENSION_NAME            "VK_EXT_acquire_xlib_display" 
vkAcquireXlibDisplayEXT!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	dpy             [ pointer! [integer!] ]
	display         [ VkDisplayKHR! ]
	return:         [ VkResult! ]
]
vkGetRandROutputDisplayEXT!: alias function! [
	physicalDevice  [ VkPhysicalDevice! ]
	dpy             [ pointer! [integer!] ]
	rrOutput        [ RROutput! ]
	pDisplay        [ pointer! [VkDisplayKHR!] ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_EXT_display_surface_counter
;-------------------------------------------

#define VK_EXT_display_surface_counter                        1 
#define VK_EXT_DISPLAY_SURFACE_COUNTER_SPEC_VERSION           1 
#define VK_EXT_DISPLAY_SURFACE_COUNTER_EXTENSION_NAME         "VK_EXT_display_surface_counter" 

#enum VkSurfaceCounterFlagBitsEXT! [
	VK_SURFACE_COUNTER_VBLANK_EXT:             00000001h
	VK_SURFACE_COUNTER_FLAG_BITS_MAX_ENUM_EXT: 7FFFFFFFh
]
#define VkSurfaceCounterFlagsEXT! VkFlags!

VkSurfaceCapabilities2EXT!: alias struct! [
	sType                    [ VkStructureType! ]
	pNext                    [ pointer! [byte!] ]
	minImageCount            [ integer! ]
	maxImageCount            [ integer! ]
	currentExtent            [ VkExtent2D! value ]
	minImageExtent           [ VkExtent2D! value ]
	maxImageExtent           [ VkExtent2D! value ]
	maxImageArrayLayers      [ integer! ]
	supportedTransforms      [ VkSurfaceTransformFlagsKHR! ]
	currentTransform         [ VkSurfaceTransformFlagBitsKHR! ]
	supportedCompositeAlpha  [ VkCompositeAlphaFlagsKHR! ]
	supportedUsageFlags      [ VkImageUsageFlags! ]
	supportedSurfaceCounters [ VkSurfaceCounterFlagsEXT! ]
]
vkGetPhysicalDeviceSurfaceCapabilities2EXT!: alias function! [
	physicalDevice       [ VkPhysicalDevice! ]
	surface              [ VkSurfaceKHR! ]
	pSurfaceCapabilities [ VkSurfaceCapabilities2EXT! ]
	return:              [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_EXT_display_control
;-------------------------------------------

#define VK_EXT_display_control                                1 
#define VK_EXT_DISPLAY_CONTROL_SPEC_VERSION                   1 
#define VK_EXT_DISPLAY_CONTROL_EXTENSION_NAME                 "VK_EXT_display_control" 

#enum VkDisplayPowerStateEXT! [
	VK_DISPLAY_POWER_STATE_OFF_EXT:         0
	VK_DISPLAY_POWER_STATE_SUSPEND_EXT:     1
	VK_DISPLAY_POWER_STATE_ON_EXT:          2
	VK_DISPLAY_POWER_STATE_BEGIN_RANGE_EXT: VK_DISPLAY_POWER_STATE_OFF_EXT
	VK_DISPLAY_POWER_STATE_END_RANGE_EXT:   VK_DISPLAY_POWER_STATE_ON_EXT
	VK_DISPLAY_POWER_STATE_RANGE_SIZE_EXT:  3 ; (VK_DISPLAY_POWER_STATE_ON_EXT - VK_DISPLAY_POWER_STATE_OFF_EXT + 1)
	VK_DISPLAY_POWER_STATE_MAX_ENUM_EXT:    7FFFFFFFh
]

#enum VkDeviceEventTypeEXT! [
	VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT: 0
	VK_DEVICE_EVENT_TYPE_BEGIN_RANGE_EXT:     VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT
	VK_DEVICE_EVENT_TYPE_END_RANGE_EXT:       VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT
	VK_DEVICE_EVENT_TYPE_RANGE_SIZE_EXT:      1 ; (VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT - VK_DEVICE_EVENT_TYPE_DISPLAY_HOTPLUG_EXT + 1)
	VK_DEVICE_EVENT_TYPE_MAX_ENUM_EXT:        7FFFFFFFh
]

#enum VkDisplayEventTypeEXT! [
	VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT: 0
	VK_DISPLAY_EVENT_TYPE_BEGIN_RANGE_EXT:     VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT
	VK_DISPLAY_EVENT_TYPE_END_RANGE_EXT:       VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT
	VK_DISPLAY_EVENT_TYPE_RANGE_SIZE_EXT:      1 ; (VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT - VK_DISPLAY_EVENT_TYPE_FIRST_PIXEL_OUT_EXT + 1)
	VK_DISPLAY_EVENT_TYPE_MAX_ENUM_EXT:        7FFFFFFFh
]

VkDisplayPowerInfoEXT!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	powerState      [ VkDisplayPowerStateEXT! ]
]

VkDeviceEventInfoEXT!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	deviceEvent     [ VkDeviceEventTypeEXT! ]
]

VkDisplayEventInfoEXT!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	displayEvent    [ VkDisplayEventTypeEXT! ]
]

VkSwapchainCounterCreateInfoEXT!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	surfaceCounters [ VkSurfaceCounterFlagsEXT! ]
]
vkDisplayPowerControlEXT!: alias function! [
	device            [ VkDevice! ]
	display           [ VkDisplayKHR! ]
	pDisplayPowerInfo [ VkDisplayPowerInfoEXT! ]
	return:           [ VkResult! ]
]
vkRegisterDeviceEventEXT!: alias function! [
	device           [ VkDevice! ]
	pDeviceEventInfo [ VkDeviceEventInfoEXT! ]
	pAllocator       [ VkAllocationCallbacks! ]
	pFence           [ pointer! [VkFence!] ]
	return:          [ VkResult! ]
]
vkRegisterDisplayEventEXT!: alias function! [
	device            [ VkDevice! ]
	display           [ VkDisplayKHR! ]
	pDisplayEventInfo [ VkDisplayEventInfoEXT! ]
	pAllocator        [ VkAllocationCallbacks! ]
	pFence            [ pointer! [VkFence!] ]
	return:           [ VkResult! ]
]
vkGetSwapchainCounterEXT!: alias function! [
	device          [ VkDevice! ]
	swapchain       [ VkSwapchainKHR! ]
	counter         [ VkSurfaceCounterFlagBitsEXT! ]
	pCounterValue   [ uint64! ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_GOOGLE_display_timing
;-------------------------------------------

#define VK_GOOGLE_display_timing                              1 
#define VK_GOOGLE_DISPLAY_TIMING_SPEC_VERSION                 1 
#define VK_GOOGLE_DISPLAY_TIMING_EXTENSION_NAME               "VK_GOOGLE_display_timing" 

VkRefreshCycleDurationGOOGLE!: alias struct! [
	refreshDuration [ uint64! value ]
]

VkPastPresentationTimingGOOGLE!: alias struct! [
	presentID           [ integer! ]
	desiredPresentTime  [ uint64! value ]
	actualPresentTime   [ uint64! value ]
	earliestPresentTime [ uint64! value ]
	presentMargin       [ uint64! value ]
]

VkPresentTimeGOOGLE!: alias struct! [
	presentID          [ integer! ]
	desiredPresentTime [ uint64! value ]
]

VkPresentTimesInfoGOOGLE!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	swapchainCount  [ integer! ]
	pTimes          [ VkPresentTimeGOOGLE! ]
]
vkGetRefreshCycleDurationGOOGLE!: alias function! [
	device                   [ VkDevice! ]
	swapchain                [ VkSwapchainKHR! ]
	pDisplayTimingProperties [ VkRefreshCycleDurationGOOGLE! ]
	return:                  [ VkResult! ]
]
vkGetPastPresentationTimingGOOGLE!: alias function! [
	device                   [ VkDevice! ]
	swapchain                [ VkSwapchainKHR! ]
	pPresentationTimingCount [ pointer! [integer!] ]
	pPresentationTimings     [ VkPastPresentationTimingGOOGLE! ]
	return:                  [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_NV_sample_mask_override_coverage
;-------------------------------------------

#define VK_NV_sample_mask_override_coverage                   1 
#define VK_NV_SAMPLE_MASK_OVERRIDE_COVERAGE_SPEC_VERSION      1 
#define VK_NV_SAMPLE_MASK_OVERRIDE_COVERAGE_EXTENSION_NAME    "VK_NV_sample_mask_override_coverage" 


;-------------------------------------------
;-- Extension: VK_NV_geometry_shader_passthrough
;-------------------------------------------

#define VK_NV_geometry_shader_passthrough                     1 
#define VK_NV_GEOMETRY_SHADER_PASSTHROUGH_SPEC_VERSION        1 
#define VK_NV_GEOMETRY_SHADER_PASSTHROUGH_EXTENSION_NAME      "VK_NV_geometry_shader_passthrough" 


;-------------------------------------------
;-- Extension: VK_NV_viewport_array2
;-------------------------------------------

#define VK_NV_viewport_array2                                 1 
#define VK_NV_VIEWPORT_ARRAY2_SPEC_VERSION                    1 
#define VK_NV_VIEWPORT_ARRAY2_EXTENSION_NAME                  "VK_NV_viewport_array2" 


;-------------------------------------------
;-- Extension: VK_NVX_multiview_per_view_attributes
;-------------------------------------------

#define VK_NVX_multiview_per_view_attributes                  1 
#define VK_NVX_MULTIVIEW_PER_VIEW_ATTRIBUTES_SPEC_VERSION     1 
#define VK_NVX_MULTIVIEW_PER_VIEW_ATTRIBUTES_EXTENSION_NAME   "VK_NVX_multiview_per_view_attributes" 

VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX!: alias struct! [
	sType                        [ VkStructureType! ]
	pNext                        [ pointer! [byte!] ]
	perViewPositionAllComponents [ VkBool32! ]
]


;-------------------------------------------
;-- Extension: VK_NV_viewport_swizzle
;-------------------------------------------

#define VK_NV_viewport_swizzle                                1 
#define VK_NV_VIEWPORT_SWIZZLE_SPEC_VERSION                   1 
#define VK_NV_VIEWPORT_SWIZZLE_EXTENSION_NAME                 "VK_NV_viewport_swizzle" 

#enum VkViewportCoordinateSwizzleNV! [
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_X_NV:  0
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_X_NV:  1
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_Y_NV:  2
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_Y_NV:  3
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_Z_NV:  4
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_Z_NV:  5
	VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_W_NV:  6
	VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_W_NV:  7
	VK_VIEWPORT_COORDINATE_SWIZZLE_BEGIN_RANGE_NV: VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_X_NV
	VK_VIEWPORT_COORDINATE_SWIZZLE_END_RANGE_NV:   VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_W_NV
	VK_VIEWPORT_COORDINATE_SWIZZLE_RANGE_SIZE_NV:  8 ; (VK_VIEWPORT_COORDINATE_SWIZZLE_NEGATIVE_W_NV - VK_VIEWPORT_COORDINATE_SWIZZLE_POSITIVE_X_NV + 1)
	VK_VIEWPORT_COORDINATE_SWIZZLE_MAX_ENUM_NV:    7FFFFFFFh
]
#define VkPipelineViewportSwizzleStateCreateFlagsNV! VkFlags!

VkViewportSwizzleNV!: alias struct! [
	x               [ VkViewportCoordinateSwizzleNV! ]
	y               [ VkViewportCoordinateSwizzleNV! ]
	z               [ VkViewportCoordinateSwizzleNV! ]
	w               [ VkViewportCoordinateSwizzleNV! ]
]

VkPipelineViewportSwizzleStateCreateInfoNV!: alias struct! [
	sType             [ VkStructureType! ]
	pNext             [ pointer! [byte!] ]
	flags             [ VkPipelineViewportSwizzleStateCreateFlagsNV! ]
	viewportCount     [ integer! ]
	pViewportSwizzles [ VkViewportSwizzleNV! ]
]


;-------------------------------------------
;-- Extension: VK_EXT_discard_rectangles
;-------------------------------------------

#define VK_EXT_discard_rectangles                             1 
#define VK_EXT_DISCARD_RECTANGLES_SPEC_VERSION                1 
#define VK_EXT_DISCARD_RECTANGLES_EXTENSION_NAME              "VK_EXT_discard_rectangles" 

#enum VkDiscardRectangleModeEXT! [
	VK_DISCARD_RECTANGLE_MODE_INCLUSIVE_EXT:   0
	VK_DISCARD_RECTANGLE_MODE_EXCLUSIVE_EXT:   1
	VK_DISCARD_RECTANGLE_MODE_BEGIN_RANGE_EXT: VK_DISCARD_RECTANGLE_MODE_INCLUSIVE_EXT
	VK_DISCARD_RECTANGLE_MODE_END_RANGE_EXT:   VK_DISCARD_RECTANGLE_MODE_EXCLUSIVE_EXT
	VK_DISCARD_RECTANGLE_MODE_RANGE_SIZE_EXT:  2 ; (VK_DISCARD_RECTANGLE_MODE_EXCLUSIVE_EXT - VK_DISCARD_RECTANGLE_MODE_INCLUSIVE_EXT + 1)
	VK_DISCARD_RECTANGLE_MODE_MAX_ENUM_EXT:    7FFFFFFFh
]
#define VkPipelineDiscardRectangleStateCreateFlagsEXT! VkFlags!

VkPhysicalDeviceDiscardRectanglePropertiesEXT!: alias struct! [
	sType                [ VkStructureType! ]
	pNext                [ pointer! [byte!] ]
	maxDiscardRectangles [ integer! ]
]

VkPipelineDiscardRectangleStateCreateInfoEXT!: alias struct! [
	sType                 [ VkStructureType! ]
	pNext                 [ pointer! [byte!] ]
	flags                 [ VkPipelineDiscardRectangleStateCreateFlagsEXT! ]
	discardRectangleMode  [ VkDiscardRectangleModeEXT! ]
	discardRectangleCount [ integer! ]
	pDiscardRectangles    [ VkRect2D! ]
]
vkCmdSetDiscardRectangleEXT!: alias function! [
	commandBuffer         [ VkCommandBuffer! ]
	firstDiscardRectangle [ integer! ]
	discardRectangleCount [ integer! ]
	pDiscardRectangles    [ VkRect2D! ]
]


;-------------------------------------------
;-- Extension: VK_EXT_swapchain_colorspace
;-------------------------------------------

#define VK_EXT_swapchain_colorspace                           1 
#define VK_EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION             2 
#define VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME           "VK_EXT_swapchain_colorspace" 


;-------------------------------------------
;-- Extension: VK_EXT_hdr_metadata
;-------------------------------------------

#define VK_EXT_hdr_metadata                                   1 
#define VK_EXT_HDR_METADATA_SPEC_VERSION                      1 
#define VK_EXT_HDR_METADATA_EXTENSION_NAME                    "VK_EXT_hdr_metadata" 

VkXYColorEXT!: alias struct! [
	x               [ float32! ]
	y               [ float32! ]
]

VkHdrMetadataEXT!: alias struct! [
	sType                     [ VkStructureType! ]
	pNext                     [ pointer! [byte!] ]
	displayPrimaryRed         [ VkXYColorEXT! value ]
	displayPrimaryGreen       [ VkXYColorEXT! value ]
	displayPrimaryBlue        [ VkXYColorEXT! value ]
	whitePoint                [ VkXYColorEXT! value ]
	maxLuminance              [ float32! ]
	minLuminance              [ float32! ]
	maxContentLightLevel      [ float32! ]
	maxFrameAverageLightLevel [ float32! ]
]
vkSetHdrMetadataEXT!: alias function! [
	device          [ VkDevice! ]
	swapchainCount  [ integer! ]
	pSwapchains     [ pointer! [integer!] ]
	pMetadata       [ VkHdrMetadataEXT! ]
]


;-------------------------------------------
;-- Extension: VK_MVK_ios_surface
;-------------------------------------------

#define VK_MVK_ios_surface                                    1 
#define VK_MVK_IOS_SURFACE_SPEC_VERSION                       2 
#define VK_MVK_IOS_SURFACE_EXTENSION_NAME                     "VK_MVK_ios_surface" 
#define VkIOSSurfaceCreateFlagsMVK! VkFlags!

VkIOSSurfaceCreateInfoMVK!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkIOSSurfaceCreateFlagsMVK! ]
	pView           [ pointer! [byte!] ]
]
vkCreateIOSSurfaceMVK!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkIOSSurfaceCreateInfoMVK! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSurface        [ pointer! [VkSurfaceKHR!] ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Extension: VK_MVK_macos_surface
;-------------------------------------------

#define VK_MVK_macos_surface                                  1 
#define VK_MVK_MACOS_SURFACE_SPEC_VERSION                     2 
#define VK_MVK_MACOS_SURFACE_EXTENSION_NAME                   "VK_MVK_macos_surface" 
#define VkMacOSSurfaceCreateFlagsMVK! VkFlags!

VkMacOSSurfaceCreateInfoMVK!: alias struct! [
	sType           [ VkStructureType! ]
	pNext           [ pointer! [byte!] ]
	flags           [ VkMacOSSurfaceCreateFlagsMVK! ]
	pView           [ pointer! [byte!] ]
]
vkCreateMacOSSurfaceMVK!: alias function! [
	instance        [ VkInstance! ]
	pCreateInfo     [ VkMacOSSurfaceCreateInfoMVK! ]
	pAllocator      [ VkAllocationCallbacks! ]
	pSurface        [ pointer! [VkSurfaceKHR!] ]
	return:         [ VkResult! ]
]


;-------------------------------------------
;-- Basic imports:
;-------------------------------------------

#import [ VULKAN_LIBRARY VULKAN_CALLING [
	vkAllocationFunction: "vkAllocationFunction" [
		pUserData       [ pointer! [byte!] ]
		size            [ integer! ]
		alignment       [ integer! ]
		allocationScope [ VkSystemAllocationScope! ]
		return:         [ pointer! [byte!] ]
	]
	vkReallocationFunction: "vkReallocationFunction" [
		pUserData       [ pointer! [byte!] ]
		pOriginal       [ pointer! [byte!] ]
		size            [ integer! ]
		alignment       [ integer! ]
		allocationScope [ VkSystemAllocationScope! ]
		return:         [ pointer! [byte!] ]
	]
	vkFreeFunction: "vkFreeFunction" [
		pUserData       [ pointer! [byte!] ]
		pMemory         [ pointer! [byte!] ]
	]
	vkInternalAllocationNotification: "vkInternalAllocationNotification" [
		pUserData       [ pointer! [byte!] ]
		size            [ integer! ]
		allocationType  [ VkInternalAllocationType! ]
		allocationScope [ VkSystemAllocationScope! ]
	]
	vkInternalFreeNotification: "vkInternalFreeNotification" [
		pUserData       [ pointer! [byte!] ]
		size            [ integer! ]
		allocationType  [ VkInternalAllocationType! ]
		allocationScope [ VkSystemAllocationScope! ]
	]
	vkVoidFunction: "vkVoidFunction" [
	]
	vkCreateInstance: "vkCreateInstance" [
		pCreateInfo     [ VkInstanceCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pInstance       [ pointer! [VkInstance!] ]
		return:         [ VkResult! ]
	]
	vkDestroyInstance: "vkDestroyInstance" [
		instance        [ VkInstance! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkEnumeratePhysicalDevices: "vkEnumeratePhysicalDevices" [
		instance             [ VkInstance! ]
		pPhysicalDeviceCount [ pointer! [integer!] ]
		pPhysicalDevices     [ pointer! [integer!] ]
		return:              [ VkResult! ]
	]
	vkGetPhysicalDeviceFeatures: "vkGetPhysicalDeviceFeatures" [
		physicalDevice  [ VkPhysicalDevice! ]
		pFeatures       [ VkPhysicalDeviceFeatures! ]
	]
	vkGetPhysicalDeviceFormatProperties: "vkGetPhysicalDeviceFormatProperties" [
		physicalDevice    [ VkPhysicalDevice! ]
		format            [ VkFormat! ]
		pFormatProperties [ VkFormatProperties! ]
	]
	vkGetPhysicalDeviceImageFormatProperties: "vkGetPhysicalDeviceImageFormatProperties" [
		physicalDevice         [ VkPhysicalDevice! ]
		format                 [ VkFormat! ]
		type                   [ VkImageType! ]
		tiling                 [ VkImageTiling! ]
		usage                  [ VkImageUsageFlags! ]
		flags                  [ VkImageCreateFlags! ]
		pImageFormatProperties [ VkImageFormatProperties! ]
		return:                [ VkResult! ]
	]
	vkGetPhysicalDeviceProperties: "vkGetPhysicalDeviceProperties" [
		physicalDevice  [ VkPhysicalDevice! ]
		pProperties     [ VkPhysicalDeviceProperties! ]
	]
	vkGetPhysicalDeviceQueueFamilyProperties: "vkGetPhysicalDeviceQueueFamilyProperties" [
		physicalDevice            [ VkPhysicalDevice! ]
		pQueueFamilyPropertyCount [ pointer! [integer!] ]
		pQueueFamilyProperties    [ VkQueueFamilyProperties! ]
	]
	vkGetPhysicalDeviceMemoryProperties: "vkGetPhysicalDeviceMemoryProperties" [
		physicalDevice    [ VkPhysicalDevice! ]
		pMemoryProperties [ VkPhysicalDeviceMemoryProperties! ]
	]
	vkGetInstanceProcAddr: "vkGetInstanceProcAddr" [
		instance        [ VkInstance! ]
		pName           [ c-string! ]
		return:         [ vkVoidFunction! ]
	]
	vkGetDeviceProcAddr: "vkGetDeviceProcAddr" [
		device          [ VkDevice! ]
		pName           [ c-string! ]
		return:         [ vkVoidFunction! ]
	]
	vkCreateDevice: "vkCreateDevice" [
		physicalDevice  [ VkPhysicalDevice! ]
		pCreateInfo     [ VkDeviceCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pDevice         [ pointer! [VkDevice!] ]
		return:         [ VkResult! ]
	]
	vkDestroyDevice: "vkDestroyDevice" [
		device          [ VkDevice! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkEnumerateInstanceExtensionProperties: "vkEnumerateInstanceExtensionProperties" [
		pLayerName      [ c-string! ]
		pPropertyCount  [ pointer! [integer!] ]
		pProperties     [ VkExtensionProperties! ]
		return:         [ VkResult! ]
	]
	vkEnumerateDeviceExtensionProperties: "vkEnumerateDeviceExtensionProperties" [
		physicalDevice  [ VkPhysicalDevice! ]
		pLayerName      [ c-string! ]
		pPropertyCount  [ pointer! [integer!] ]
		pProperties     [ VkExtensionProperties! ]
		return:         [ VkResult! ]
	]
	vkEnumerateInstanceLayerProperties: "vkEnumerateInstanceLayerProperties" [
		pPropertyCount  [ pointer! [integer!] ]
		pProperties     [ VkLayerProperties! ]
		return:         [ VkResult! ]
	]
	vkEnumerateDeviceLayerProperties: "vkEnumerateDeviceLayerProperties" [
		physicalDevice  [ VkPhysicalDevice! ]
		pPropertyCount  [ pointer! [integer!] ]
		pProperties     [ VkLayerProperties! ]
		return:         [ VkResult! ]
	]
	vkGetDeviceQueue: "vkGetDeviceQueue" [
		device           [ VkDevice! ]
		queueFamilyIndex [ integer! ]
		queueIndex       [ integer! ]
		pQueue           [ pointer! [VkQueue!] ]
	]
	vkQueueSubmit: "vkQueueSubmit" [
		queue           [ VkQueue! ]
		submitCount     [ integer! ]
		pSubmits        [ VkSubmitInfo! ]
		fence           [ VkFence! ]
		return:         [ VkResult! ]
	]
	vkQueueWaitIdle: "vkQueueWaitIdle" [
		queue           [ VkQueue! ]
		return:         [ VkResult! ]
	]
	vkDeviceWaitIdle: "vkDeviceWaitIdle" [
		device          [ VkDevice! ]
		return:         [ VkResult! ]
	]
	vkAllocateMemory: "vkAllocateMemory" [
		device          [ VkDevice! ]
		pAllocateInfo   [ VkMemoryAllocateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pMemory         [ pointer! [integer!] ]
		return:         [ VkResult! ]
	]
	vkFreeMemory: "vkFreeMemory" [
		device          [ VkDevice! ]
		memory          [ VkDeviceMemory! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkMapMemory: "vkMapMemory" [
		device          [ VkDevice! ]
		memory          [ VkDeviceMemory! ]
		offset          [ VkDeviceSize! ]
		size            [ VkDeviceSize! ]
		flags           [ VkMemoryMapFlags! ]
		ppData          [ binary-ptr! ]
		return:         [ VkResult! ]
	]
	vkUnmapMemory: "vkUnmapMemory" [
		device          [ VkDevice! ]
		memory          [ VkDeviceMemory! ]
	]
	vkFlushMappedMemoryRanges: "vkFlushMappedMemoryRanges" [
		device           [ VkDevice! ]
		memoryRangeCount [ integer! ]
		pMemoryRanges    [ VkMappedMemoryRange! ]
		return:          [ VkResult! ]
	]
	vkInvalidateMappedMemoryRanges: "vkInvalidateMappedMemoryRanges" [
		device           [ VkDevice! ]
		memoryRangeCount [ integer! ]
		pMemoryRanges    [ VkMappedMemoryRange! ]
		return:          [ VkResult! ]
	]
	vkGetDeviceMemoryCommitment: "vkGetDeviceMemoryCommitment" [
		device                  [ VkDevice! ]
		memory                  [ VkDeviceMemory! ]
		pCommittedMemoryInBytes [ uint64! ]
	]
	vkBindBufferMemory: "vkBindBufferMemory" [
		device          [ VkDevice! ]
		buffer          [ VkBuffer! ]
		memory          [ VkDeviceMemory! ]
		memoryOffset    [ VkDeviceSize! ]
		return:         [ VkResult! ]
	]
	vkBindImageMemory: "vkBindImageMemory" [
		device          [ VkDevice! ]
		image           [ VkImage! ]
		memory          [ VkDeviceMemory! ]
		memoryOffset    [ VkDeviceSize! ]
		return:         [ VkResult! ]
	]
	vkGetBufferMemoryRequirements: "vkGetBufferMemoryRequirements" [
		device              [ VkDevice! ]
		buffer              [ VkBuffer! ]
		pMemoryRequirements [ VkMemoryRequirements! ]
	]
	vkGetImageMemoryRequirements: "vkGetImageMemoryRequirements" [
		device              [ VkDevice! ]
		image               [ VkImage! ]
		pMemoryRequirements [ VkMemoryRequirements! ]
	]
	vkGetImageSparseMemoryRequirements: "vkGetImageSparseMemoryRequirements" [
		device                        [ VkDevice! ]
		image                         [ VkImage! ]
		pSparseMemoryRequirementCount [ pointer! [integer!] ]
		pSparseMemoryRequirements     [ VkSparseImageMemoryRequirements! ]
	]
	vkGetPhysicalDeviceSparseImageFormatProperties: "vkGetPhysicalDeviceSparseImageFormatProperties" [
		physicalDevice  [ VkPhysicalDevice! ]
		format          [ VkFormat! ]
		type            [ VkImageType! ]
		samples         [ VkSampleCountFlagBits! ]
		usage           [ VkImageUsageFlags! ]
		tiling          [ VkImageTiling! ]
		pPropertyCount  [ pointer! [integer!] ]
		pProperties     [ VkSparseImageFormatProperties! ]
	]
	vkQueueBindSparse: "vkQueueBindSparse" [
		queue           [ VkQueue! ]
		bindInfoCount   [ integer! ]
		pBindInfo       [ VkBindSparseInfo! ]
		fence           [ VkFence! ]
		return:         [ VkResult! ]
	]
	vkCreateFence: "vkCreateFence" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkFenceCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pFence          [ pointer! [VkFence!] ]
		return:         [ VkResult! ]
	]
	vkDestroyFence: "vkDestroyFence" [
		device          [ VkDevice! ]
		fence           [ VkFence! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkResetFences: "vkResetFences" [
		device          [ VkDevice! ]
		fenceCount      [ integer! ]
		pFences         [ pointer! [VkFence!] ]
		return:         [ VkResult! ]
	]
	vkGetFenceStatus: "vkGetFenceStatus" [
		device          [ VkDevice! ]
		fence           [ VkFence! ]
		return:         [ VkResult! ]
	]
	vkWaitForFences: "vkWaitForFences" [
		device          [ VkDevice! ]
		fenceCount      [ integer! ]
		pFences         [ pointer! [VkFence!] ]
		waitAll         [ VkBool32! ]
		timeout         [ uint64! value ]
		return:         [ VkResult! ]
	]
	vkCreateSemaphore: "vkCreateSemaphore" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkSemaphoreCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pSemaphore      [ pointer! [integer!] ]
		return:         [ VkResult! ]
	]
	vkDestroySemaphore: "vkDestroySemaphore" [
		device          [ VkDevice! ]
		semaphore       [ VkSemaphore! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkCreateEvent: "vkCreateEvent" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkEventCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pEvent          [ pointer! [VkEvent!] ]
		return:         [ VkResult! ]
	]
	vkDestroyEvent: "vkDestroyEvent" [
		device          [ VkDevice! ]
		event           [ VkEvent! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkGetEventStatus: "vkGetEventStatus" [
		device          [ VkDevice! ]
		event           [ VkEvent! ]
		return:         [ VkResult! ]
	]
	vkSetEvent: "vkSetEvent" [
		device          [ VkDevice! ]
		event           [ VkEvent! ]
		return:         [ VkResult! ]
	]
	vkResetEvent: "vkResetEvent" [
		device          [ VkDevice! ]
		event           [ VkEvent! ]
		return:         [ VkResult! ]
	]
	vkCreateQueryPool: "vkCreateQueryPool" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkQueryPoolCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pQueryPool      [ pointer! [VkQueryPool!] ]
		return:         [ VkResult! ]
	]
	vkDestroyQueryPool: "vkDestroyQueryPool" [
		device          [ VkDevice! ]
		queryPool       [ VkQueryPool! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkGetQueryPoolResults: "vkGetQueryPoolResults" [
		device          [ VkDevice! ]
		queryPool       [ VkQueryPool! ]
		firstQuery      [ integer! ]
		queryCount      [ integer! ]
		dataSize        [ integer! ]
		pData           [ pointer! [byte!] ]
		stride          [ VkDeviceSize! ]
		flags           [ VkQueryResultFlags! ]
		return:         [ VkResult! ]
	]
	vkCreateBuffer: "vkCreateBuffer" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkBufferCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pBuffer         [ pointer! [VkBuffer!] ]
		return:         [ VkResult! ]
	]
	vkDestroyBuffer: "vkDestroyBuffer" [
		device          [ VkDevice! ]
		buffer          [ VkBuffer! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkCreateBufferView: "vkCreateBufferView" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkBufferViewCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pView           [ pointer! [integer!] ]
		return:         [ VkResult! ]
	]
	vkDestroyBufferView: "vkDestroyBufferView" [
		device          [ VkDevice! ]
		bufferView      [ VkBufferView! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkCreateImage: "vkCreateImage" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkImageCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pImage          [ pointer! [VkImage!] ]
		return:         [ VkResult! ]
	]
	vkDestroyImage: "vkDestroyImage" [
		device          [ VkDevice! ]
		image           [ VkImage! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkGetImageSubresourceLayout: "vkGetImageSubresourceLayout" [
		device          [ VkDevice! ]
		image           [ VkImage! ]
		pSubresource    [ VkImageSubresource! ]
		pLayout         [ VkSubresourceLayout! ]
	]
	vkCreateImageView: "vkCreateImageView" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkImageViewCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pView           [ pointer! [integer!] ]
		return:         [ VkResult! ]
	]
	vkDestroyImageView: "vkDestroyImageView" [
		device          [ VkDevice! ]
		imageView       [ VkImageView! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkCreateShaderModule: "vkCreateShaderModule" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkShaderModuleCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pShaderModule   [ pointer! [VkShaderModule!] ]
		return:         [ VkResult! ]
	]
	vkDestroyShaderModule: "vkDestroyShaderModule" [
		device          [ VkDevice! ]
		shaderModule    [ VkShaderModule! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkCreatePipelineCache: "vkCreatePipelineCache" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkPipelineCacheCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pPipelineCache  [ pointer! [VkPipelineCache!] ]
		return:         [ VkResult! ]
	]
	vkDestroyPipelineCache: "vkDestroyPipelineCache" [
		device          [ VkDevice! ]
		pipelineCache   [ VkPipelineCache! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkGetPipelineCacheData: "vkGetPipelineCacheData" [
		device          [ VkDevice! ]
		pipelineCache   [ VkPipelineCache! ]
		pDataSize       [ pointer! [integer!] ]
		pData           [ pointer! [byte!] ]
		return:         [ VkResult! ]
	]
	vkMergePipelineCaches: "vkMergePipelineCaches" [
		device          [ VkDevice! ]
		dstCache        [ VkPipelineCache! ]
		srcCacheCount   [ integer! ]
		pSrcCaches      [ pointer! [VkPipelineCache!] ]
		return:         [ VkResult! ]
	]
	vkCreateGraphicsPipelines: "vkCreateGraphicsPipelines" [
		device          [ VkDevice! ]
		pipelineCache   [ VkPipelineCache! ]
		createInfoCount [ integer! ]
		pCreateInfos    [ VkGraphicsPipelineCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pPipelines      [ pointer! [VkPipeline!] ]
		return:         [ VkResult! ]
	]
	vkCreateComputePipelines: "vkCreateComputePipelines" [
		device          [ VkDevice! ]
		pipelineCache   [ VkPipelineCache! ]
		createInfoCount [ integer! ]
		pCreateInfos    [ VkComputePipelineCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pPipelines      [ pointer! [VkPipeline!] ]
		return:         [ VkResult! ]
	]
	vkDestroyPipeline: "vkDestroyPipeline" [
		device          [ VkDevice! ]
		pipeline        [ VkPipeline! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkCreatePipelineLayout: "vkCreatePipelineLayout" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkPipelineLayoutCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pPipelineLayout [ pointer! [VkPipelineLayout!] ]
		return:         [ VkResult! ]
	]
	vkDestroyPipelineLayout: "vkDestroyPipelineLayout" [
		device          [ VkDevice! ]
		pipelineLayout  [ VkPipelineLayout! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkCreateSampler: "vkCreateSampler" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkSamplerCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pSampler        [ pointer! [integer!] ]
		return:         [ VkResult! ]
	]
	vkDestroySampler: "vkDestroySampler" [
		device          [ VkDevice! ]
		sampler         [ VkSampler! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkCreateDescriptorSetLayout: "vkCreateDescriptorSetLayout" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkDescriptorSetLayoutCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pSetLayout      [ pointer! [integer!] ]
		return:         [ VkResult! ]
	]
	vkDestroyDescriptorSetLayout: "vkDestroyDescriptorSetLayout" [
		device              [ VkDevice! ]
		descriptorSetLayout [ VkDescriptorSetLayout! ]
		pAllocator          [ VkAllocationCallbacks! ]
	]
	vkCreateDescriptorPool: "vkCreateDescriptorPool" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkDescriptorPoolCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pDescriptorPool [ pointer! [VkDescriptorPool!] ]
		return:         [ VkResult! ]
	]
	vkDestroyDescriptorPool: "vkDestroyDescriptorPool" [
		device          [ VkDevice! ]
		descriptorPool  [ VkDescriptorPool! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkResetDescriptorPool: "vkResetDescriptorPool" [
		device          [ VkDevice! ]
		descriptorPool  [ VkDescriptorPool! ]
		flags           [ VkDescriptorPoolResetFlags! ]
		return:         [ VkResult! ]
	]
	vkAllocateDescriptorSets: "vkAllocateDescriptorSets" [
		device          [ VkDevice! ]
		pAllocateInfo   [ VkDescriptorSetAllocateInfo! ]
		pDescriptorSets [ pointer! [VkDescriptorSet!] ]
		return:         [ VkResult! ]
	]
	vkFreeDescriptorSets: "vkFreeDescriptorSets" [
		device             [ VkDevice! ]
		descriptorPool     [ VkDescriptorPool! ]
		descriptorSetCount [ integer! ]
		pDescriptorSets    [ pointer! [VkDescriptorSet!] ]
		return:            [ VkResult! ]
	]
	vkUpdateDescriptorSets: "vkUpdateDescriptorSets" [
		device               [ VkDevice! ]
		descriptorWriteCount [ integer! ]
		pDescriptorWrites    [ VkWriteDescriptorSet! ]
		descriptorCopyCount  [ integer! ]
		pDescriptorCopies    [ VkCopyDescriptorSet! ]
	]
	vkCreateFramebuffer: "vkCreateFramebuffer" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkFramebufferCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pFramebuffer    [ pointer! [VkFramebuffer!] ]
		return:         [ VkResult! ]
	]
	vkDestroyFramebuffer: "vkDestroyFramebuffer" [
		device          [ VkDevice! ]
		framebuffer     [ VkFramebuffer! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkCreateRenderPass: "vkCreateRenderPass" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkRenderPassCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pRenderPass     [ pointer! [VkRenderPass!] ]
		return:         [ VkResult! ]
	]
	vkDestroyRenderPass: "vkDestroyRenderPass" [
		device          [ VkDevice! ]
		renderPass      [ VkRenderPass! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkGetRenderAreaGranularity: "vkGetRenderAreaGranularity" [
		device          [ VkDevice! ]
		renderPass      [ VkRenderPass! ]
		pGranularity    [ VkExtent2D! ]
	]
	vkCreateCommandPool: "vkCreateCommandPool" [
		device          [ VkDevice! ]
		pCreateInfo     [ VkCommandPoolCreateInfo! ]
		pAllocator      [ VkAllocationCallbacks! ]
		pCommandPool    [ pointer! [VkCommandPool!] ]
		return:         [ VkResult! ]
	]
	vkDestroyCommandPool: "vkDestroyCommandPool" [
		device          [ VkDevice! ]
		commandPool     [ VkCommandPool! ]
		pAllocator      [ VkAllocationCallbacks! ]
	]
	vkResetCommandPool: "vkResetCommandPool" [
		device          [ VkDevice! ]
		commandPool     [ VkCommandPool! ]
		flags           [ VkCommandPoolResetFlags! ]
		return:         [ VkResult! ]
	]
	vkAllocateCommandBuffers: "vkAllocateCommandBuffers" [
		device          [ VkDevice! ]
		pAllocateInfo   [ VkCommandBufferAllocateInfo! ]
		pCommandBuffers [ pointer! [integer!] ]
		return:         [ VkResult! ]
	]
	vkFreeCommandBuffers: "vkFreeCommandBuffers" [
		device             [ VkDevice! ]
		commandPool        [ VkCommandPool! ]
		commandBufferCount [ integer! ]
		pCommandBuffers    [ pointer! [integer!] ]
	]
	vkBeginCommandBuffer: "vkBeginCommandBuffer" [
		commandBuffer   [ VkCommandBuffer! ]
		pBeginInfo      [ VkCommandBufferBeginInfo! ]
		return:         [ VkResult! ]
	]
	vkEndCommandBuffer: "vkEndCommandBuffer" [
		commandBuffer   [ VkCommandBuffer! ]
		return:         [ VkResult! ]
	]
	vkResetCommandBuffer: "vkResetCommandBuffer" [
		commandBuffer   [ VkCommandBuffer! ]
		flags           [ VkCommandBufferResetFlags! ]
		return:         [ VkResult! ]
	]
	vkCmdBindPipeline: "vkCmdBindPipeline" [
		commandBuffer     [ VkCommandBuffer! ]
		pipelineBindPoint [ VkPipelineBindPoint! ]
		pipeline          [ VkPipeline! ]
	]
	vkCmdSetViewport: "vkCmdSetViewport" [
		commandBuffer   [ VkCommandBuffer! ]
		firstViewport   [ integer! ]
		viewportCount   [ integer! ]
		pViewports      [ VkViewport! ]
	]
	vkCmdSetScissor: "vkCmdSetScissor" [
		commandBuffer   [ VkCommandBuffer! ]
		firstScissor    [ integer! ]
		scissorCount    [ integer! ]
		pScissors       [ VkRect2D! ]
	]
	vkCmdSetLineWidth: "vkCmdSetLineWidth" [
		commandBuffer   [ VkCommandBuffer! ]
		lineWidth       [ float32! ]
	]
	vkCmdSetDepthBias: "vkCmdSetDepthBias" [
		commandBuffer           [ VkCommandBuffer! ]
		depthBiasConstantFactor [ float32! ]
		depthBiasClamp          [ float32! ]
		depthBiasSlopeFactor    [ float32! ]
	]
	vkCmdSetBlendConstants: "vkCmdSetBlendConstants" [
		commandBuffer     [ VkCommandBuffer! ]
		blendConstants    [ pointer! [float32!] ] ;@@[4]
	]
	vkCmdSetDepthBounds: "vkCmdSetDepthBounds" [
		commandBuffer   [ VkCommandBuffer! ]
		minDepthBounds  [ float32! ]
		maxDepthBounds  [ float32! ]
	]
	vkCmdSetStencilCompareMask: "vkCmdSetStencilCompareMask" [
		commandBuffer   [ VkCommandBuffer! ]
		faceMask        [ VkStencilFaceFlags! ]
		compareMask     [ integer! ]
	]
	vkCmdSetStencilWriteMask: "vkCmdSetStencilWriteMask" [
		commandBuffer   [ VkCommandBuffer! ]
		faceMask        [ VkStencilFaceFlags! ]
		writeMask       [ integer! ]
	]
	vkCmdSetStencilReference: "vkCmdSetStencilReference" [
		commandBuffer   [ VkCommandBuffer! ]
		faceMask        [ VkStencilFaceFlags! ]
		reference       [ integer! ]
	]
	vkCmdBindDescriptorSets: "vkCmdBindDescriptorSets" [
		commandBuffer      [ VkCommandBuffer! ]
		pipelineBindPoint  [ VkPipelineBindPoint! ]
		layout             [ VkPipelineLayout! ]
		firstSet           [ integer! ]
		descriptorSetCount [ integer! ]
		pDescriptorSets    [ pointer! [VkDescriptorSet!] ]
		dynamicOffsetCount [ integer! ]
		pDynamicOffsets    [ pointer! [integer!] ]
	]
	vkCmdBindIndexBuffer: "vkCmdBindIndexBuffer" [
		commandBuffer   [ VkCommandBuffer! ]
		buffer          [ VkBuffer! ]
		offset          [ VkDeviceSize! ]
		indexType       [ VkIndexType! ]
	]
	vkCmdBindVertexBuffers: "vkCmdBindVertexBuffers" [
		commandBuffer   [ VkCommandBuffer! ]
		firstBinding    [ integer! ]
		bindingCount    [ integer! ]
		pBuffers        [ pointer! [VkBuffer!] ]
		pOffsets        [ uint64! ]
	]
	vkCmdDraw: "vkCmdDraw" [
		commandBuffer   [ VkCommandBuffer! ]
		vertexCount     [ integer! ]
		instanceCount   [ integer! ]
		firstVertex     [ integer! ]
		firstInstance   [ integer! ]
	]
	vkCmdDrawIndexed: "vkCmdDrawIndexed" [
		commandBuffer   [ VkCommandBuffer! ]
		indexCount      [ integer! ]
		instanceCount   [ integer! ]
		firstIndex      [ integer! ]
		vertexOffset    [ integer! ]
		firstInstance   [ integer! ]
	]
	vkCmdDrawIndirect: "vkCmdDrawIndirect" [
		commandBuffer   [ VkCommandBuffer! ]
		buffer          [ VkBuffer! ]
		offset          [ VkDeviceSize! ]
		drawCount       [ integer! ]
		stride          [ integer! ]
	]
	vkCmdDrawIndexedIndirect: "vkCmdDrawIndexedIndirect" [
		commandBuffer   [ VkCommandBuffer! ]
		buffer          [ VkBuffer! ]
		offset          [ VkDeviceSize! ]
		drawCount       [ integer! ]
		stride          [ integer! ]
	]
	vkCmdDispatch: "vkCmdDispatch" [
		commandBuffer   [ VkCommandBuffer! ]
		groupCountX     [ integer! ]
		groupCountY     [ integer! ]
		groupCountZ     [ integer! ]
	]
	vkCmdDispatchIndirect: "vkCmdDispatchIndirect" [
		commandBuffer   [ VkCommandBuffer! ]
		buffer          [ VkBuffer! ]
		offset          [ VkDeviceSize! ]
	]
	vkCmdCopyBuffer: "vkCmdCopyBuffer" [
		commandBuffer   [ VkCommandBuffer! ]
		srcBuffer       [ VkBuffer! ]
		dstBuffer       [ VkBuffer! ]
		regionCount     [ integer! ]
		pRegions        [ VkBufferCopy! ]
	]
	vkCmdCopyImage: "vkCmdCopyImage" [
		commandBuffer   [ VkCommandBuffer! ]
		srcImage        [ VkImage! ]
		srcImageLayout  [ VkImageLayout! ]
		dstImage        [ VkImage! ]
		dstImageLayout  [ VkImageLayout! ]
		regionCount     [ integer! ]
		pRegions        [ VkImageCopy! ]
	]
	vkCmdBlitImage: "vkCmdBlitImage" [
		commandBuffer   [ VkCommandBuffer! ]
		srcImage        [ VkImage! ]
		srcImageLayout  [ VkImageLayout! ]
		dstImage        [ VkImage! ]
		dstImageLayout  [ VkImageLayout! ]
		regionCount     [ integer! ]
		pRegions        [ VkImageBlit! ]
		filter          [ VkFilter! ]
	]
	vkCmdCopyBufferToImage: "vkCmdCopyBufferToImage" [
		commandBuffer   [ VkCommandBuffer! ]
		srcBuffer       [ VkBuffer! ]
		dstImage        [ VkImage! ]
		dstImageLayout  [ VkImageLayout! ]
		regionCount     [ integer! ]
		pRegions        [ VkBufferImageCopy! ]
	]
	vkCmdCopyImageToBuffer: "vkCmdCopyImageToBuffer" [
		commandBuffer   [ VkCommandBuffer! ]
		srcImage        [ VkImage! ]
		srcImageLayout  [ VkImageLayout! ]
		dstBuffer       [ VkBuffer! ]
		regionCount     [ integer! ]
		pRegions        [ VkBufferImageCopy! ]
	]
	vkCmdUpdateBuffer: "vkCmdUpdateBuffer" [
		commandBuffer   [ VkCommandBuffer! ]
		dstBuffer       [ VkBuffer! ]
		dstOffset       [ VkDeviceSize! ]
		dataSize        [ VkDeviceSize! ]
		pData           [ pointer! [byte!] ]
	]
	vkCmdFillBuffer: "vkCmdFillBuffer" [
		commandBuffer   [ VkCommandBuffer! ]
		dstBuffer       [ VkBuffer! ]
		dstOffset       [ VkDeviceSize! ]
		size            [ VkDeviceSize! ]
		data            [ integer! ]
	]
	vkCmdClearColorImage: "vkCmdClearColorImage" [
		commandBuffer   [ VkCommandBuffer! ]
		image           [ VkImage! ]
		imageLayout     [ VkImageLayout! ]
		pColor          [ VkClearColorValue! ]
		rangeCount      [ integer! ]
		pRanges         [ VkImageSubresourceRange! ]
	]
	vkCmdClearDepthStencilImage: "vkCmdClearDepthStencilImage" [
		commandBuffer   [ VkCommandBuffer! ]
		image           [ VkImage! ]
		imageLayout     [ VkImageLayout! ]
		pDepthStencil   [ VkClearDepthStencilValue! ]
		rangeCount      [ integer! ]
		pRanges         [ VkImageSubresourceRange! ]
	]
	vkCmdClearAttachments: "vkCmdClearAttachments" [
		commandBuffer   [ VkCommandBuffer! ]
		attachmentCount [ integer! ]
		pAttachments    [ VkClearAttachment! ]
		rectCount       [ integer! ]
		pRects          [ VkClearRect! ]
	]
	vkCmdResolveImage: "vkCmdResolveImage" [
		commandBuffer   [ VkCommandBuffer! ]
		srcImage        [ VkImage! ]
		srcImageLayout  [ VkImageLayout! ]
		dstImage        [ VkImage! ]
		dstImageLayout  [ VkImageLayout! ]
		regionCount     [ integer! ]
		pRegions        [ VkImageResolve! ]
	]
	vkCmdSetEvent: "vkCmdSetEvent" [
		commandBuffer   [ VkCommandBuffer! ]
		event           [ VkEvent! ]
		stageMask       [ VkPipelineStageFlags! ]
	]
	vkCmdResetEvent: "vkCmdResetEvent" [
		commandBuffer   [ VkCommandBuffer! ]
		event           [ VkEvent! ]
		stageMask       [ VkPipelineStageFlags! ]
	]
	vkCmdWaitEvents: "vkCmdWaitEvents" [
		commandBuffer            [ VkCommandBuffer! ]
		eventCount               [ integer! ]
		pEvents                  [ pointer! [VkEvent!] ]
		srcStageMask             [ VkPipelineStageFlags! ]
		dstStageMask             [ VkPipelineStageFlags! ]
		memoryBarrierCount       [ integer! ]
		pMemoryBarriers          [ VkMemoryBarrier! ]
		bufferMemoryBarrierCount [ integer! ]
		pBufferMemoryBarriers    [ VkBufferMemoryBarrier! ]
		imageMemoryBarrierCount  [ integer! ]
		pImageMemoryBarriers     [ VkImageMemoryBarrier! ]
	]
	vkCmdPipelineBarrier: "vkCmdPipelineBarrier" [
		commandBuffer            [ VkCommandBuffer! ]
		srcStageMask             [ VkPipelineStageFlags! ]
		dstStageMask             [ VkPipelineStageFlags! ]
		dependencyFlags          [ VkDependencyFlags! ]
		memoryBarrierCount       [ integer! ]
		pMemoryBarriers          [ VkMemoryBarrier! ]
		bufferMemoryBarrierCount [ integer! ]
		pBufferMemoryBarriers    [ VkBufferMemoryBarrier! ]
		imageMemoryBarrierCount  [ integer! ]
		pImageMemoryBarriers     [ VkImageMemoryBarrier! ]
	]
	vkCmdBeginQuery: "vkCmdBeginQuery" [
		commandBuffer   [ VkCommandBuffer! ]
		queryPool       [ VkQueryPool! ]
		query           [ integer! ]
		flags           [ VkQueryControlFlags! ]
	]
	vkCmdEndQuery: "vkCmdEndQuery" [
		commandBuffer   [ VkCommandBuffer! ]
		queryPool       [ VkQueryPool! ]
		query           [ integer! ]
	]
	vkCmdResetQueryPool: "vkCmdResetQueryPool" [
		commandBuffer   [ VkCommandBuffer! ]
		queryPool       [ VkQueryPool! ]
		firstQuery      [ integer! ]
		queryCount      [ integer! ]
	]
	vkCmdWriteTimestamp: "vkCmdWriteTimestamp" [
		commandBuffer   [ VkCommandBuffer! ]
		pipelineStage   [ VkPipelineStageFlagBits! ]
		queryPool       [ VkQueryPool! ]
		query           [ integer! ]
	]
	vkCmdCopyQueryPoolResults: "vkCmdCopyQueryPoolResults" [
		commandBuffer   [ VkCommandBuffer! ]
		queryPool       [ VkQueryPool! ]
		firstQuery      [ integer! ]
		queryCount      [ integer! ]
		dstBuffer       [ VkBuffer! ]
		dstOffset       [ VkDeviceSize! ]
		stride          [ VkDeviceSize! ]
		flags           [ VkQueryResultFlags! ]
	]
	vkCmdPushConstants: "vkCmdPushConstants" [
		commandBuffer   [ VkCommandBuffer! ]
		layout          [ VkPipelineLayout! ]
		stageFlags      [ VkShaderStageFlags! ]
		offset          [ integer! ]
		size            [ integer! ]
		pValues         [ pointer! [byte!] ]
	]
	vkCmdBeginRenderPass: "vkCmdBeginRenderPass" [
		commandBuffer    [ VkCommandBuffer! ]
		pRenderPassBegin [ VkRenderPassBeginInfo! ]
		contents         [ VkSubpassContents! ]
	]
	vkCmdNextSubpass: "vkCmdNextSubpass" [
		commandBuffer   [ VkCommandBuffer! ]
		contents        [ VkSubpassContents! ]
	]
	vkCmdEndRenderPass: "vkCmdEndRenderPass" [
		commandBuffer   [ VkCommandBuffer! ]
	]
	vkCmdExecuteCommands: "vkCmdExecuteCommands" [
		commandBuffer      [ VkCommandBuffer! ]
		commandBufferCount [ integer! ]
		pCommandBuffers    [ pointer! [integer!] ]
	]

]]
