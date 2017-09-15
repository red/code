Red/System [
	Title:   "Red/System OpenGL binding"
	Author:  "Oldes"
	File: 	 %gl.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
This source was made from glew.h file, which contains these copyrights:

/*
** The OpenGL Extension Wrangler Library
** Copyright (C) 2008-2017, Nigel Stewart <nigels[]users sourceforge net>
** Copyright (C) 2002-2008, Milan Ikits <milan ikits[]ieee org>
** Copyright (C) 2002-2008, Marcelo E. Magallon <mmagallo[]debian org>
** Copyright (C) 2002, Lev Povalahev
** All rights reserved.
** 
** Redistribution and use in source and binary forms, with or without 
** modification, are permitted provided that the following conditions are met:
** 
** * Redistributions of source code must retain the above copyright notice, 
**   this list of conditions and the following disclaimer.
** * Redistributions in binary form must reproduce the above copyright notice, 
**   this list of conditions and the following disclaimer in the documentation 
**   and/or other materials provided with the distribution.
** * The name of the author may be used to endorse or promote products 
**   derived from this software without specific prior written permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
** AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
** IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
** ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
** LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
** CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
** SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
** INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
** CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
** ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
** THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
 * Mesa 3-D graphics library
 * Version:  7.0
 *
 * Copyright (C) 1999-2007  Brian Paul   All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * BRIAN PAUL BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/*
** Copyright (c) 2007 The Khronos Group Inc.
** 
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
** 
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
** 
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*/
	}
]

#switch OS [
	Windows   [
		#define GL_LIBRARY "OpenGL32.dll"
		#define GL_CALLING stdcall
	]
	macOS     [ ;@@ not tested!
		#define GL_LIBRARY "/System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib"
		#define GL_CALLING cdecl
	] 
	#default  [ ;@@ not tested!
		#define GL_LIBRARY "/usr/lib/libGL.so.1"
		#define GL_CALLING cdecl
	] 
]

#include %../os/definitions.reds ;common aliases and defines

#define GLenum!       integer!
#define GLboolean!    integer!
#define GLbitfield!   integer!
#define GLbyte!       byte!
#define GLshort!      int16-value!  ;@@ change me once proper int16! will be available
#define GLint!        integer!
#define GLsizei!      integer!
#define GLubyte!      integer!
#define GLushort!     uint16-value! ;@@ change me once proper int16! will be available
#define GLuint!       integer!
#define GLfloat!      float32! ; 32-bit float
#define GLclampf!     float32!
#define GLvoid!       [pointer! [byte!]]
#define GLdouble!     float!   ; 64-bit float
#define GLclampd!     float!
#define GLclampx!     integer!
#define GLfixed!      integer!
#define GLhalf!       uint16-value! ;@@ change me once proper int16! will be available
#define GLhandleARB!  integer! ;unsigned int

#define GLint64!      int64-value! ;@@ change me once proper int64! will be available
#define GLint64EXT!   int64-value! ;@@ change me once proper int64! will be available
#define GLuint64!     int64-value! ;@@ change me once proper int64! will be available
#define GLuint64EXT!  int64-value! ;@@ change me once proper int64! will be available

#define GLint64-ptr!     int64-ptr! ;@@ change me once proper int64! will be available
#define GLint64EXT-ptr!  int64-ptr! ;@@ change me once proper int64! will be available
#define GLuint64-ptr!    int64-ptr! ;@@ change me once proper int64! will be available
#define GLuint64EXT-ptr! int64-ptr! ;@@ change me once proper int64! will be available

#define GLshort-ptr!   int16-ptr!
#define GLushort-ptr!  uint16-ptr!

#define GLintptr!     integer!
#define GLintptrARB!  integer! ;maybe integer64! in 64bit version

#define GLsizeiptr!   integer!

#define GLvdpauSurfaceNV! GLintptr!

#define GLstring!          c-string!
#define GLcharARB!         byte!
#define GLcharARB-ptr!     c-string!
#define GLcharARB-ptr-ptr! string-ptr!

#define GLeglClientBufferEXT! [pointer! [integer!]]

GLboolean-ptr!: alias struct! [value [GLboolean!]]
GLstring-ptr!:  alias struct! [value [GLstring!]]


#define GLsync!         [pointer! [integer!]]
#define GLsizeiptrARB!  integer!
#define GLDEBUGPROC!    [pointer! [integer!]]
#define GLDEBUGPROCAMD! [pointer! [integer!]]
#define GLDEBUGPROCARB! [pointer! [integer!]]
#define GLVULKANPROCNV! [pointer! [integer!]]
#define GLLOGPROCREGAL! [pointer! [integer!]]



;-------------------------------------------
;-- GL_VERSION_1_1
;-------------------------------------------

#define  GL_VERSION_1_1                               1
#define  GL_ZERO                                      0
#define  GL_FALSE                                     0
#define  GL_LOGIC_OP                                  0BF1h
#define  GL_NONE                                      0
#define  GL_TEXTURE_COMPONENTS                        1003h
#define  GL_NO_ERROR                                  0
#define  GL_POINTS                                    0000h
#define  GL_CURRENT_BIT                               00000001h
#define  GL_TRUE                                      1
#define  GL_ONE                                       1
#define  GL_CLIENT_PIXEL_STORE_BIT                    00000001h
#define  GL_LINES                                     0001h
#define  GL_LINE_LOOP                                 0002h
#define  GL_POINT_BIT                                 00000002h
#define  GL_CLIENT_VERTEX_ARRAY_BIT                   00000002h
#define  GL_LINE_STRIP                                0003h
#define  GL_LINE_BIT                                  00000004h
#define  GL_TRIANGLES                                 0004h
#define  GL_TRIANGLE_STRIP                            0005h
#define  GL_TRIANGLE_FAN                              0006h
#define  GL_QUADS                                     0007h
#define  GL_QUAD_STRIP                                0008h
#define  GL_POLYGON_BIT                               00000008h
#define  GL_POLYGON                                   0009h
#define  GL_POLYGON_STIPPLE_BIT                       00000010h
#define  GL_PIXEL_MODE_BIT                            00000020h
#define  GL_LIGHTING_BIT                              00000040h
#define  GL_FOG_BIT                                   00000080h
#define  GL_DEPTH_BUFFER_BIT                          00000100h
#define  GL_ACCUM                                     0100h
#define  GL_LOAD                                      0101h
#define  GL_RETURN                                    0102h
#define  GL_MULT                                      0103h
#define  GL_ADD                                       0104h
#define  GL_NEVER                                     0200h
#define  GL_ACCUM_BUFFER_BIT                          00000200h
#define  GL_LESS                                      0201h
#define  GL_EQUAL                                     0202h
#define  GL_LEQUAL                                    0203h
#define  GL_GREATER                                   0204h
#define  GL_NOTEQUAL                                  0205h
#define  GL_GEQUAL                                    0206h
#define  GL_ALWAYS                                    0207h
#define  GL_SRC_COLOR                                 0300h
#define  GL_ONE_MINUS_SRC_COLOR                       0301h
#define  GL_SRC_ALPHA                                 0302h
#define  GL_ONE_MINUS_SRC_ALPHA                       0303h
#define  GL_DST_ALPHA                                 0304h
#define  GL_ONE_MINUS_DST_ALPHA                       0305h
#define  GL_DST_COLOR                                 0306h
#define  GL_ONE_MINUS_DST_COLOR                       0307h
#define  GL_SRC_ALPHA_SATURATE                        0308h
#define  GL_STENCIL_BUFFER_BIT                        00000400h
#define  GL_FRONT_LEFT                                0400h
#define  GL_FRONT_RIGHT                               0401h
#define  GL_BACK_LEFT                                 0402h
#define  GL_BACK_RIGHT                                0403h
#define  GL_FRONT                                     0404h
#define  GL_BACK                                      0405h
#define  GL_LEFT                                      0406h
#define  GL_RIGHT                                     0407h
#define  GL_FRONT_AND_BACK                            0408h
#define  GL_AUX0                                      0409h
#define  GL_AUX1                                      040Ah
#define  GL_AUX2                                      040Bh
#define  GL_AUX3                                      040Ch
#define  GL_INVALID_ENUM                              0500h
#define  GL_INVALID_VALUE                             0501h
#define  GL_INVALID_OPERATION                         0502h
#define  GL_STACK_OVERFLOW                            0503h
#define  GL_STACK_UNDERFLOW                           0504h
#define  GL_OUT_OF_MEMORY                             0505h
#define  GL_2D                                        0600h
#define  GL_3D                                        0601h
#define  GL_3D_COLOR                                  0602h
#define  GL_3D_COLOR_TEXTURE                          0603h
#define  GL_4D_COLOR_TEXTURE                          0604h
#define  GL_PASS_THROUGH_TOKEN                        0700h
#define  GL_POINT_TOKEN                               0701h
#define  GL_LINE_TOKEN                                0702h
#define  GL_POLYGON_TOKEN                             0703h
#define  GL_BITMAP_TOKEN                              0704h
#define  GL_DRAW_PIXEL_TOKEN                          0705h
#define  GL_COPY_PIXEL_TOKEN                          0706h
#define  GL_LINE_RESET_TOKEN                          0707h
#define  GL_EXP                                       0800h
#define  GL_VIEWPORT_BIT                              00000800h
#define  GL_EXP2                                      0801h
#define  GL_CW                                        0900h
#define  GL_CCW                                       0901h
#define  GL_COEFF                                     0A00h
#define  GL_ORDER                                     0A01h
#define  GL_DOMAIN                                    0A02h
#define  GL_CURRENT_COLOR                             0B00h
#define  GL_CURRENT_INDEX                             0B01h
#define  GL_CURRENT_NORMAL                            0B02h
#define  GL_CURRENT_TEXTURE_COORDS                    0B03h
#define  GL_CURRENT_RASTER_COLOR                      0B04h
#define  GL_CURRENT_RASTER_INDEX                      0B05h
#define  GL_CURRENT_RASTER_TEXTURE_COORDS             0B06h
#define  GL_CURRENT_RASTER_POSITION                   0B07h
#define  GL_CURRENT_RASTER_POSITION_VALID             0B08h
#define  GL_CURRENT_RASTER_DISTANCE                   0B09h
#define  GL_POINT_SMOOTH                              0B10h
#define  GL_POINT_SIZE                                0B11h
#define  GL_POINT_SIZE_RANGE                          0B12h
#define  GL_POINT_SIZE_GRANULARITY                    0B13h
#define  GL_LINE_SMOOTH                               0B20h
#define  GL_LINE_WIDTH                                0B21h
#define  GL_LINE_WIDTH_RANGE                          0B22h
#define  GL_LINE_WIDTH_GRANULARITY                    0B23h
#define  GL_LINE_STIPPLE                              0B24h
#define  GL_LINE_STIPPLE_PATTERN                      0B25h
#define  GL_LINE_STIPPLE_REPEAT                       0B26h
#define  GL_LIST_MODE                                 0B30h
#define  GL_MAX_LIST_NESTING                          0B31h
#define  GL_LIST_BASE                                 0B32h
#define  GL_LIST_INDEX                                0B33h
#define  GL_POLYGON_MODE                              0B40h
#define  GL_POLYGON_SMOOTH                            0B41h
#define  GL_POLYGON_STIPPLE                           0B42h
#define  GL_EDGE_FLAG                                 0B43h
#define  GL_CULL_FACE                                 0B44h
#define  GL_CULL_FACE_MODE                            0B45h
#define  GL_FRONT_FACE                                0B46h
#define  GL_LIGHTING                                  0B50h
#define  GL_LIGHT_MODEL_LOCAL_VIEWER                  0B51h
#define  GL_LIGHT_MODEL_TWO_SIDE                      0B52h
#define  GL_LIGHT_MODEL_AMBIENT                       0B53h
#define  GL_SHADE_MODEL                               0B54h
#define  GL_COLOR_MATERIAL_FACE                       0B55h
#define  GL_COLOR_MATERIAL_PARAMETER                  0B56h
#define  GL_COLOR_MATERIAL                            0B57h
#define  GL_FOG                                       0B60h
#define  GL_FOG_INDEX                                 0B61h
#define  GL_FOG_DENSITY                               0B62h
#define  GL_FOG_START                                 0B63h
#define  GL_FOG_END                                   0B64h
#define  GL_FOG_MODE                                  0B65h
#define  GL_FOG_COLOR                                 0B66h
#define  GL_DEPTH_RANGE                               0B70h
#define  GL_DEPTH_TEST                                0B71h
#define  GL_DEPTH_WRITEMASK                           0B72h
#define  GL_DEPTH_CLEAR_VALUE                         0B73h
#define  GL_DEPTH_FUNC                                0B74h
#define  GL_ACCUM_CLEAR_VALUE                         0B80h
#define  GL_STENCIL_TEST                              0B90h
#define  GL_STENCIL_CLEAR_VALUE                       0B91h
#define  GL_STENCIL_FUNC                              0B92h
#define  GL_STENCIL_VALUE_MASK                        0B93h
#define  GL_STENCIL_FAIL                              0B94h
#define  GL_STENCIL_PASS_DEPTH_FAIL                   0B95h
#define  GL_STENCIL_PASS_DEPTH_PASS                   0B96h
#define  GL_STENCIL_REF                               0B97h
#define  GL_STENCIL_WRITEMASK                         0B98h
#define  GL_MATRIX_MODE                               0BA0h
#define  GL_NORMALIZE                                 0BA1h
#define  GL_VIEWPORT                                  0BA2h
#define  GL_MODELVIEW_STACK_DEPTH                     0BA3h
#define  GL_PROJECTION_STACK_DEPTH                    0BA4h
#define  GL_TEXTURE_STACK_DEPTH                       0BA5h
#define  GL_MODELVIEW_MATRIX                          0BA6h
#define  GL_PROJECTION_MATRIX                         0BA7h
#define  GL_TEXTURE_MATRIX                            0BA8h
#define  GL_ATTRIB_STACK_DEPTH                        0BB0h
#define  GL_CLIENT_ATTRIB_STACK_DEPTH                 0BB1h
#define  GL_ALPHA_TEST                                0BC0h
#define  GL_ALPHA_TEST_FUNC                           0BC1h
#define  GL_ALPHA_TEST_REF                            0BC2h
#define  GL_DITHER                                    0BD0h
#define  GL_BLEND_DST                                 0BE0h
#define  GL_BLEND_SRC                                 0BE1h
#define  GL_BLEND                                     0BE2h
#define  GL_LOGIC_OP_MODE                             0BF0h
#define  GL_INDEX_LOGIC_OP                            0BF1h
#define  GL_COLOR_LOGIC_OP                            0BF2h
#define  GL_AUX_BUFFERS                               0C00h
#define  GL_DRAW_BUFFER                               0C01h
#define  GL_READ_BUFFER                               0C02h
#define  GL_SCISSOR_BOX                               0C10h
#define  GL_SCISSOR_TEST                              0C11h
#define  GL_INDEX_CLEAR_VALUE                         0C20h
#define  GL_INDEX_WRITEMASK                           0C21h
#define  GL_COLOR_CLEAR_VALUE                         0C22h
#define  GL_COLOR_WRITEMASK                           0C23h
#define  GL_INDEX_MODE                                0C30h
#define  GL_RGBA_MODE                                 0C31h
#define  GL_DOUBLEBUFFER                              0C32h
#define  GL_STEREO                                    0C33h
#define  GL_RENDER_MODE                               0C40h
#define  GL_PERSPECTIVE_CORRECTION_HINT               0C50h
#define  GL_POINT_SMOOTH_HINT                         0C51h
#define  GL_LINE_SMOOTH_HINT                          0C52h
#define  GL_POLYGON_SMOOTH_HINT                       0C53h
#define  GL_FOG_HINT                                  0C54h
#define  GL_TEXTURE_GEN_S                             0C60h
#define  GL_TEXTURE_GEN_T                             0C61h
#define  GL_TEXTURE_GEN_R                             0C62h
#define  GL_TEXTURE_GEN_Q                             0C63h
#define  GL_PIXEL_MAP_I_TO_I                          0C70h
#define  GL_PIXEL_MAP_S_TO_S                          0C71h
#define  GL_PIXEL_MAP_I_TO_R                          0C72h
#define  GL_PIXEL_MAP_I_TO_G                          0C73h
#define  GL_PIXEL_MAP_I_TO_B                          0C74h
#define  GL_PIXEL_MAP_I_TO_A                          0C75h
#define  GL_PIXEL_MAP_R_TO_R                          0C76h
#define  GL_PIXEL_MAP_G_TO_G                          0C77h
#define  GL_PIXEL_MAP_B_TO_B                          0C78h
#define  GL_PIXEL_MAP_A_TO_A                          0C79h
#define  GL_PIXEL_MAP_I_TO_I_SIZE                     0CB0h
#define  GL_PIXEL_MAP_S_TO_S_SIZE                     0CB1h
#define  GL_PIXEL_MAP_I_TO_R_SIZE                     0CB2h
#define  GL_PIXEL_MAP_I_TO_G_SIZE                     0CB3h
#define  GL_PIXEL_MAP_I_TO_B_SIZE                     0CB4h
#define  GL_PIXEL_MAP_I_TO_A_SIZE                     0CB5h
#define  GL_PIXEL_MAP_R_TO_R_SIZE                     0CB6h
#define  GL_PIXEL_MAP_G_TO_G_SIZE                     0CB7h
#define  GL_PIXEL_MAP_B_TO_B_SIZE                     0CB8h
#define  GL_PIXEL_MAP_A_TO_A_SIZE                     0CB9h
#define  GL_UNPACK_SWAP_BYTES                         0CF0h
#define  GL_UNPACK_LSB_FIRST                          0CF1h
#define  GL_UNPACK_ROW_LENGTH                         0CF2h
#define  GL_UNPACK_SKIP_ROWS                          0CF3h
#define  GL_UNPACK_SKIP_PIXELS                        0CF4h
#define  GL_UNPACK_ALIGNMENT                          0CF5h
#define  GL_PACK_SWAP_BYTES                           0D00h
#define  GL_PACK_LSB_FIRST                            0D01h
#define  GL_PACK_ROW_LENGTH                           0D02h
#define  GL_PACK_SKIP_ROWS                            0D03h
#define  GL_PACK_SKIP_PIXELS                          0D04h
#define  GL_PACK_ALIGNMENT                            0D05h
#define  GL_MAP_COLOR                                 0D10h
#define  GL_MAP_STENCIL                               0D11h
#define  GL_INDEX_SHIFT                               0D12h
#define  GL_INDEX_OFFSET                              0D13h
#define  GL_RED_SCALE                                 0D14h
#define  GL_RED_BIAS                                  0D15h
#define  GL_ZOOM_X                                    0D16h
#define  GL_ZOOM_Y                                    0D17h
#define  GL_GREEN_SCALE                               0D18h
#define  GL_GREEN_BIAS                                0D19h
#define  GL_BLUE_SCALE                                0D1Ah
#define  GL_BLUE_BIAS                                 0D1Bh
#define  GL_ALPHA_SCALE                               0D1Ch
#define  GL_ALPHA_BIAS                                0D1Dh
#define  GL_DEPTH_SCALE                               0D1Eh
#define  GL_DEPTH_BIAS                                0D1Fh
#define  GL_MAX_EVAL_ORDER                            0D30h
#define  GL_MAX_LIGHTS                                0D31h
#define  GL_MAX_CLIP_PLANES                           0D32h
#define  GL_MAX_TEXTURE_SIZE                          0D33h
#define  GL_MAX_PIXEL_MAP_TABLE                       0D34h
#define  GL_MAX_ATTRIB_STACK_DEPTH                    0D35h
#define  GL_MAX_MODELVIEW_STACK_DEPTH                 0D36h
#define  GL_MAX_NAME_STACK_DEPTH                      0D37h
#define  GL_MAX_PROJECTION_STACK_DEPTH                0D38h
#define  GL_MAX_TEXTURE_STACK_DEPTH                   0D39h
#define  GL_MAX_VIEWPORT_DIMS                         0D3Ah
#define  GL_MAX_CLIENT_ATTRIB_STACK_DEPTH             0D3Bh
#define  GL_SUBPIXEL_BITS                             0D50h
#define  GL_INDEX_BITS                                0D51h
#define  GL_RED_BITS                                  0D52h
#define  GL_GREEN_BITS                                0D53h
#define  GL_BLUE_BITS                                 0D54h
#define  GL_ALPHA_BITS                                0D55h
#define  GL_DEPTH_BITS                                0D56h
#define  GL_STENCIL_BITS                              0D57h
#define  GL_ACCUM_RED_BITS                            0D58h
#define  GL_ACCUM_GREEN_BITS                          0D59h
#define  GL_ACCUM_BLUE_BITS                           0D5Ah
#define  GL_ACCUM_ALPHA_BITS                          0D5Bh
#define  GL_NAME_STACK_DEPTH                          0D70h
#define  GL_AUTO_NORMAL                               0D80h
#define  GL_MAP1_COLOR_4                              0D90h
#define  GL_MAP1_INDEX                                0D91h
#define  GL_MAP1_NORMAL                               0D92h
#define  GL_MAP1_TEXTURE_COORD_1                      0D93h
#define  GL_MAP1_TEXTURE_COORD_2                      0D94h
#define  GL_MAP1_TEXTURE_COORD_3                      0D95h
#define  GL_MAP1_TEXTURE_COORD_4                      0D96h
#define  GL_MAP1_VERTEX_3                             0D97h
#define  GL_MAP1_VERTEX_4                             0D98h
#define  GL_MAP2_COLOR_4                              0DB0h
#define  GL_MAP2_INDEX                                0DB1h
#define  GL_MAP2_NORMAL                               0DB2h
#define  GL_MAP2_TEXTURE_COORD_1                      0DB3h
#define  GL_MAP2_TEXTURE_COORD_2                      0DB4h
#define  GL_MAP2_TEXTURE_COORD_3                      0DB5h
#define  GL_MAP2_TEXTURE_COORD_4                      0DB6h
#define  GL_MAP2_VERTEX_3                             0DB7h
#define  GL_MAP2_VERTEX_4                             0DB8h
#define  GL_MAP1_GRID_DOMAIN                          0DD0h
#define  GL_MAP1_GRID_SEGMENTS                        0DD1h
#define  GL_MAP2_GRID_DOMAIN                          0DD2h
#define  GL_MAP2_GRID_SEGMENTS                        0DD3h
#define  GL_TEXTURE_1D                                0DE0h
#define  GL_TEXTURE_2D                                0DE1h
#define  GL_FEEDBACK_BUFFER_POINTER                   0DF0h
#define  GL_FEEDBACK_BUFFER_SIZE                      0DF1h
#define  GL_FEEDBACK_BUFFER_TYPE                      0DF2h
#define  GL_SELECTION_BUFFER_POINTER                  0DF3h
#define  GL_SELECTION_BUFFER_SIZE                     0DF4h
#define  GL_TEXTURE_WIDTH                             1000h
#define  GL_TRANSFORM_BIT                             00001000h
#define  GL_TEXTURE_HEIGHT                            1001h
#define  GL_TEXTURE_INTERNAL_FORMAT                   1003h
#define  GL_TEXTURE_BORDER_COLOR                      1004h
#define  GL_TEXTURE_BORDER                            1005h
#define  GL_DONT_CARE                                 1100h
#define  GL_FASTEST                                   1101h
#define  GL_NICEST                                    1102h
#define  GL_AMBIENT                                   1200h
#define  GL_DIFFUSE                                   1201h
#define  GL_SPECULAR                                  1202h
#define  GL_POSITION                                  1203h
#define  GL_SPOT_DIRECTION                            1204h
#define  GL_SPOT_EXPONENT                             1205h
#define  GL_SPOT_CUTOFF                               1206h
#define  GL_CONSTANT_ATTENUATION                      1207h
#define  GL_LINEAR_ATTENUATION                        1208h
#define  GL_QUADRATIC_ATTENUATION                     1209h
#define  GL_COMPILE                                   1300h
#define  GL_COMPILE_AND_EXECUTE                       1301h
#define  GL_BYTE                                      1400h
#define  GL_UNSIGNED_BYTE                             1401h
#define  GL_SHORT                                     1402h
#define  GL_UNSIGNED_SHORT                            1403h
#define  GL_INT                                       1404h
#define  GL_UNSIGNED_INT                              1405h
#define  GL_FLOAT                                     1406h
#define  GL_2_BYTES                                   1407h
#define  GL_3_BYTES                                   1408h
#define  GL_4_BYTES                                   1409h
#define  GL_DOUBLE                                    140Ah
#define  GL_CLEAR                                     1500h
#define  GL_AND                                       1501h
#define  GL_AND_REVERSE                               1502h
#define  GL_COPY                                      1503h
#define  GL_AND_INVERTED                              1504h
#define  GL_NOOP                                      1505h
#define  GL_XOR                                       1506h
#define  GL_OR                                        1507h
#define  GL_NOR                                       1508h
#define  GL_EQUIV                                     1509h
#define  GL_INVERT                                    150Ah
#define  GL_OR_REVERSE                                150Bh
#define  GL_COPY_INVERTED                             150Ch
#define  GL_OR_INVERTED                               150Dh
#define  GL_NAND                                      150Eh
#define  GL_SET                                       150Fh
#define  GL_EMISSION                                  1600h
#define  GL_SHININESS                                 1601h
#define  GL_AMBIENT_AND_DIFFUSE                       1602h
#define  GL_COLOR_INDEXES                             1603h
#define  GL_MODELVIEW                                 1700h
#define  GL_PROJECTION                                1701h
#define  GL_TEXTURE                                   1702h
#define  GL_COLOR                                     1800h
#define  GL_DEPTH                                     1801h
#define  GL_STENCIL                                   1802h
#define  GL_COLOR_INDEX                               1900h
#define  GL_STENCIL_INDEX                             1901h
#define  GL_DEPTH_COMPONENT                           1902h
#define  GL_RED                                       1903h
#define  GL_GREEN                                     1904h
#define  GL_BLUE                                      1905h
#define  GL_ALPHA                                     1906h
#define  GL_RGB                                       1907h
#define  GL_RGBA                                      1908h
#define  GL_LUMINANCE                                 1909h
#define  GL_LUMINANCE_ALPHA                           190Ah
#define  GL_BITMAP                                    1A00h
#define  GL_POINT                                     1B00h
#define  GL_LINE                                      1B01h
#define  GL_FILL                                      1B02h
#define  GL_RENDER                                    1C00h
#define  GL_FEEDBACK                                  1C01h
#define  GL_SELECT                                    1C02h
#define  GL_FLAT                                      1D00h
#define  GL_SMOOTH                                    1D01h
#define  GL_KEEP                                      1E00h
#define  GL_REPLACE                                   1E01h
#define  GL_INCR                                      1E02h
#define  GL_DECR                                      1E03h
#define  GL_VENDOR                                    1F00h
#define  GL_RENDERER                                  1F01h
#define  GL_VERSION                                   1F02h
#define  GL_EXTENSIONS                                1F03h
#define  GL_S                                         2000h
#define  GL_ENABLE_BIT                                00002000h
#define  GL_T                                         2001h
#define  GL_R                                         2002h
#define  GL_Q                                         2003h
#define  GL_MODULATE                                  2100h
#define  GL_DECAL                                     2101h
#define  GL_TEXTURE_ENV_MODE                          2200h
#define  GL_TEXTURE_ENV_COLOR                         2201h
#define  GL_TEXTURE_ENV                               2300h
#define  GL_EYE_LINEAR                                2400h
#define  GL_OBJECT_LINEAR                             2401h
#define  GL_SPHERE_MAP                                2402h
#define  GL_TEXTURE_GEN_MODE                          2500h
#define  GL_OBJECT_PLANE                              2501h
#define  GL_EYE_PLANE                                 2502h
#define  GL_NEAREST                                   2600h
#define  GL_LINEAR                                    2601h
#define  GL_NEAREST_MIPMAP_NEAREST                    2700h
#define  GL_LINEAR_MIPMAP_NEAREST                     2701h
#define  GL_NEAREST_MIPMAP_LINEAR                     2702h
#define  GL_LINEAR_MIPMAP_LINEAR                      2703h
#define  GL_TEXTURE_MAG_FILTER                        2800h
#define  GL_TEXTURE_MIN_FILTER                        2801h
#define  GL_TEXTURE_WRAP_S                            2802h
#define  GL_TEXTURE_WRAP_T                            2803h
#define  GL_CLAMP                                     2900h
#define  GL_REPEAT                                    2901h
#define  GL_POLYGON_OFFSET_UNITS                      2A00h
#define  GL_POLYGON_OFFSET_POINT                      2A01h
#define  GL_POLYGON_OFFSET_LINE                       2A02h
#define  GL_R3_G3_B2                                  2A10h
#define  GL_V2F                                       2A20h
#define  GL_V3F                                       2A21h
#define  GL_C4UB_V2F                                  2A22h
#define  GL_C4UB_V3F                                  2A23h
#define  GL_C3F_V3F                                   2A24h
#define  GL_N3F_V3F                                   2A25h
#define  GL_C4F_N3F_V3F                               2A26h
#define  GL_T2F_V3F                                   2A27h
#define  GL_T4F_V4F                                   2A28h
#define  GL_T2F_C4UB_V3F                              2A29h
#define  GL_T2F_C3F_V3F                               2A2Ah
#define  GL_T2F_N3F_V3F                               2A2Bh
#define  GL_T2F_C4F_N3F_V3F                           2A2Ch
#define  GL_T4F_C4F_N3F_V4F                           2A2Dh
#define  GL_CLIP_PLANE0                               3000h
#define  GL_CLIP_PLANE1                               3001h
#define  GL_CLIP_PLANE2                               3002h
#define  GL_CLIP_PLANE3                               3003h
#define  GL_CLIP_PLANE4                               3004h
#define  GL_CLIP_PLANE5                               3005h
#define  GL_LIGHT0                                    4000h
#define  GL_COLOR_BUFFER_BIT                          00004000h
#define  GL_LIGHT1                                    4001h
#define  GL_LIGHT2                                    4002h
#define  GL_LIGHT3                                    4003h
#define  GL_LIGHT4                                    4004h
#define  GL_LIGHT5                                    4005h
#define  GL_LIGHT6                                    4006h
#define  GL_LIGHT7                                    4007h
#define  GL_HINT_BIT                                  00008000h
#define  GL_POLYGON_OFFSET_FILL                       8037h
#define  GL_POLYGON_OFFSET_FACTOR                     8038h
#define  GL_ALPHA4                                    803Bh
#define  GL_ALPHA8                                    803Ch
#define  GL_ALPHA12                                   803Dh
#define  GL_ALPHA16                                   803Eh
#define  GL_LUMINANCE4                                803Fh
#define  GL_LUMINANCE8                                8040h
#define  GL_LUMINANCE12                               8041h
#define  GL_LUMINANCE16                               8042h
#define  GL_LUMINANCE4_ALPHA4                         8043h
#define  GL_LUMINANCE6_ALPHA2                         8044h
#define  GL_LUMINANCE8_ALPHA8                         8045h
#define  GL_LUMINANCE12_ALPHA4                        8046h
#define  GL_LUMINANCE12_ALPHA12                       8047h
#define  GL_LUMINANCE16_ALPHA16                       8048h
#define  GL_INTENSITY                                 8049h
#define  GL_INTENSITY4                                804Ah
#define  GL_INTENSITY8                                804Bh
#define  GL_INTENSITY12                               804Ch
#define  GL_INTENSITY16                               804Dh
#define  GL_RGB4                                      804Fh
#define  GL_RGB5                                      8050h
#define  GL_RGB8                                      8051h
#define  GL_RGB10                                     8052h
#define  GL_RGB12                                     8053h
#define  GL_RGB16                                     8054h
#define  GL_RGBA2                                     8055h
#define  GL_RGBA4                                     8056h
#define  GL_RGB5_A1                                   8057h
#define  GL_RGBA8                                     8058h
#define  GL_RGB10_A2                                  8059h
#define  GL_RGBA12                                    805Ah
#define  GL_RGBA16                                    805Bh
#define  GL_TEXTURE_RED_SIZE                          805Ch
#define  GL_TEXTURE_GREEN_SIZE                        805Dh
#define  GL_TEXTURE_BLUE_SIZE                         805Eh
#define  GL_TEXTURE_ALPHA_SIZE                        805Fh
#define  GL_TEXTURE_LUMINANCE_SIZE                    8060h
#define  GL_TEXTURE_INTENSITY_SIZE                    8061h
#define  GL_PROXY_TEXTURE_1D                          8063h
#define  GL_PROXY_TEXTURE_2D                          8064h
#define  GL_TEXTURE_PRIORITY                          8066h
#define  GL_TEXTURE_RESIDENT                          8067h
#define  GL_TEXTURE_BINDING_1D                        8068h
#define  GL_TEXTURE_BINDING_2D                        8069h
#define  GL_VERTEX_ARRAY                              8074h
#define  GL_NORMAL_ARRAY                              8075h
#define  GL_COLOR_ARRAY                               8076h
#define  GL_INDEX_ARRAY                               8077h
#define  GL_TEXTURE_COORD_ARRAY                       8078h
#define  GL_EDGE_FLAG_ARRAY                           8079h
#define  GL_VERTEX_ARRAY_SIZE                         807Ah
#define  GL_VERTEX_ARRAY_TYPE                         807Bh
#define  GL_VERTEX_ARRAY_STRIDE                       807Ch
#define  GL_NORMAL_ARRAY_TYPE                         807Eh
#define  GL_NORMAL_ARRAY_STRIDE                       807Fh
#define  GL_COLOR_ARRAY_SIZE                          8081h
#define  GL_COLOR_ARRAY_TYPE                          8082h
#define  GL_COLOR_ARRAY_STRIDE                        8083h
#define  GL_INDEX_ARRAY_TYPE                          8085h
#define  GL_INDEX_ARRAY_STRIDE                        8086h
#define  GL_TEXTURE_COORD_ARRAY_SIZE                  8088h
#define  GL_TEXTURE_COORD_ARRAY_TYPE                  8089h
#define  GL_TEXTURE_COORD_ARRAY_STRIDE                808Ah
#define  GL_EDGE_FLAG_ARRAY_STRIDE                    808Ch
#define  GL_VERTEX_ARRAY_POINTER                      808Eh
#define  GL_NORMAL_ARRAY_POINTER                      808Fh
#define  GL_COLOR_ARRAY_POINTER                       8090h
#define  GL_INDEX_ARRAY_POINTER                       8091h
#define  GL_TEXTURE_COORD_ARRAY_POINTER               8092h
#define  GL_EDGE_FLAG_ARRAY_POINTER                   8093h
#define  GL_COLOR_INDEX1_EXT                          80E2h
#define  GL_COLOR_INDEX2_EXT                          80E3h
#define  GL_COLOR_INDEX4_EXT                          80E4h
#define  GL_COLOR_INDEX8_EXT                          80E5h
#define  GL_COLOR_INDEX12_EXT                         80E6h
#define  GL_COLOR_INDEX16_EXT                         80E7h
#define  GL_EVAL_BIT                                  00010000h
#define  GL_LIST_BIT                                  00020000h
#define  GL_TEXTURE_BIT                               00040000h
#define  GL_SCISSOR_BIT                               00080000h
#define  GL_ALL_ATTRIB_BITS                           000FFFFFh
#define  GL_CLIENT_ALL_ATTRIB_BITS                    FFFFFFFFh

#import [ GL_LIBRARY GL_CALLING [
	glAccum: "glAccum"[
		op          [ GLenum! ]
		value       [ GLfloat! ]
	]
	glAlphaFunc: "glAlphaFunc"[
		func        [ GLenum! ]
		ref         [ GLclampf! ]
	]
	glAreTexturesResident: "glAreTexturesResident"[
		n           [ GLsizei! ]
		textures    [ pointer! [GLuint!] ]
		residences  [ pointer! [integer!] ]
		return:     [ GLboolean! ]
	]
	glArrayElement: "glArrayElement" [ i [GLint!] ]
	glBegin: "glBegin" [ mode [GLenum!] ]
	glBindTexture: "glBindTexture"[
		target      [ GLenum! ]
		texture     [ GLuint! ]
	]
	glBitmap: "glBitmap"[
		width       [ GLsizei! ]
		height      [ GLsizei! ]
		xorig       [ GLfloat! ]
		yorig       [ GLfloat! ]
		xmove       [ GLfloat! ]
		ymove       [ GLfloat! ]
		bitmap      [ pointer! [GLubyte!] ]
	]
	glBlendFunc: "glBlendFunc"[
		sfactor     [ GLenum! ]
		dfactor     [ GLenum! ]
	]
	glCallList: "glCallList" [ list [GLuint!] ]
	glCallLists: "glCallLists"[
		n           [ GLsizei! ]
		type        [ GLenum! ]
		lists       [ pointer! [byte!] ]
	]
	glClear: "glClear" [ mask [GLbitfield!] ]
	glClearAccum: "glClearAccum"[
		red         [ GLfloat! ]
		green       [ GLfloat! ]
		blue        [ GLfloat! ]
		alpha       [ GLfloat! ]
	]
	glClearColor: "glClearColor"[
		red         [ GLclampf! ]
		green       [ GLclampf! ]
		blue        [ GLclampf! ]
		alpha       [ GLclampf! ]
	]
	glClearDepth: "glClearDepth" [ depth [GLclampd!] ]
	glClearIndex: "glClearIndex" [ c [GLfloat!] ]
	glClearStencil: "glClearStencil" [ s [GLint!] ]
	glClipPlane: "glClipPlane"[
		plane       [ GLenum! ]
		equation    [ pointer! [GLdouble!] ]
	]
	glColor3b: "glColor3b"[
		red         [ GLbyte! ]
		green       [ GLbyte! ]
		blue        [ GLbyte! ]
	]
	glColor3bv: "glColor3bv" [ v [pointer! [GLbyte!]] ]
	glColor3d: "glColor3d"[
		red         [ GLdouble! ]
		green       [ GLdouble! ]
		blue        [ GLdouble! ]
	]
	glColor3dv: "glColor3dv" [ v [pointer! [GLdouble!]] ]
	glColor3f: "glColor3f"[
		red         [ GLfloat! ]
		green       [ GLfloat! ]
		blue        [ GLfloat! ]
	]
	glColor3fv: "glColor3fv" [ v [pointer! [GLfloat!]] ]
	glColor3i: "glColor3i"[
		red         [ GLint! ]
		green       [ GLint! ]
		blue        [ GLint! ]
	]
	glColor3iv: "glColor3iv" [ v [pointer! [GLint!]] ]
	glColor3s: "glColor3s"[
		red         [ GLshort! ]
		green       [ GLshort! ]
		blue        [ GLshort! ]
	]
	glColor3sv: "glColor3sv" [ v [GLshort-ptr!] ]
	glColor3ub: "glColor3ub"[
		red         [ GLubyte! ]
		green       [ GLubyte! ]
		blue        [ GLubyte! ]
	]
	glColor3ubv: "glColor3ubv" [ v [pointer! [GLubyte!]] ]
	glColor3ui: "glColor3ui"[
		red         [ GLuint! ]
		green       [ GLuint! ]
		blue        [ GLuint! ]
	]
	glColor3uiv: "glColor3uiv" [ v [pointer! [GLuint!]] ]
	glColor3us: "glColor3us"[
		red         [ GLushort! ]
		green       [ GLushort! ]
		blue        [ GLushort! ]
	]
	glColor3usv: "glColor3usv" [ v [GLushort-ptr!] ]
	glColor4b: "glColor4b"[
		red         [ GLbyte! ]
		green       [ GLbyte! ]
		blue        [ GLbyte! ]
		alpha       [ GLbyte! ]
	]
	glColor4bv: "glColor4bv" [ v [pointer! [GLbyte!]] ]
	glColor4d: "glColor4d"[
		red         [ GLdouble! ]
		green       [ GLdouble! ]
		blue        [ GLdouble! ]
		alpha       [ GLdouble! ]
	]
	glColor4dv: "glColor4dv" [ v [pointer! [GLdouble!]] ]
	glColor4f: "glColor4f"[
		red         [ GLfloat! ]
		green       [ GLfloat! ]
		blue        [ GLfloat! ]
		alpha       [ GLfloat! ]
	]
	glColor4fv: "glColor4fv" [ v [pointer! [GLfloat!]] ]
	glColor4i: "glColor4i"[
		red         [ GLint! ]
		green       [ GLint! ]
		blue        [ GLint! ]
		alpha       [ GLint! ]
	]
	glColor4iv: "glColor4iv" [ v [pointer! [GLint!]] ]
	glColor4s: "glColor4s"[
		red         [ GLshort! ]
		green       [ GLshort! ]
		blue        [ GLshort! ]
		alpha       [ GLshort! ]
	]
	glColor4sv: "glColor4sv" [ v [GLshort-ptr!] ]
	glColor4ub: "glColor4ub"[
		red         [ GLubyte! ]
		green       [ GLubyte! ]
		blue        [ GLubyte! ]
		alpha       [ GLubyte! ]
	]
	glColor4ubv: "glColor4ubv" [ v [pointer! [GLubyte!]] ]
	glColor4ui: "glColor4ui"[
		red         [ GLuint! ]
		green       [ GLuint! ]
		blue        [ GLuint! ]
		alpha       [ GLuint! ]
	]
	glColor4uiv: "glColor4uiv" [ v [pointer! [GLuint!]] ]
	glColor4us: "glColor4us"[
		red         [ GLushort! ]
		green       [ GLushort! ]
		blue        [ GLushort! ]
		alpha       [ GLushort! ]
	]
	glColor4usv: "glColor4usv" [ v [GLushort-ptr!] ]
	glColorMask: "glColorMask"[
		red         [ GLboolean! ]
		green       [ GLboolean! ]
		blue        [ GLboolean! ]
		alpha       [ GLboolean! ]
	]
	glColorMaterial: "glColorMaterial"[
		face        [ GLenum! ]
		mode        [ GLenum! ]
	]
	glColorPointer: "glColorPointer"[
		size        [ GLint! ]
		type        [ GLenum! ]
		stride      [ GLsizei! ]
		pointer     [ pointer! [byte!] ]
	]
	glCopyPixels: "glCopyPixels"[
		x           [ GLint! ]
		y           [ GLint! ]
		width       [ GLsizei! ]
		height      [ GLsizei! ]
		type        [ GLenum! ]
	]
	glCopyTexImage1D: "glCopyTexImage1D"[
		target      [ GLenum! ]
		level       [ GLint! ]
		internalFormat [ GLenum! ]
		x           [ GLint! ]
		y           [ GLint! ]
		width       [ GLsizei! ]
		border      [ GLint! ]
	]
	glCopyTexImage2D: "glCopyTexImage2D"[
		target      [ GLenum! ]
		level       [ GLint! ]
		internalFormat [ GLenum! ]
		x           [ GLint! ]
		y           [ GLint! ]
		width       [ GLsizei! ]
		height      [ GLsizei! ]
		border      [ GLint! ]
	]
	glCopyTexSubImage1D: "glCopyTexSubImage1D"[
		target      [ GLenum! ]
		level       [ GLint! ]
		xoffset     [ GLint! ]
		x           [ GLint! ]
		y           [ GLint! ]
		width       [ GLsizei! ]
	]
	glCopyTexSubImage2D: "glCopyTexSubImage2D"[
		target      [ GLenum! ]
		level       [ GLint! ]
		xoffset     [ GLint! ]
		yoffset     [ GLint! ]
		x           [ GLint! ]
		y           [ GLint! ]
		width       [ GLsizei! ]
		height      [ GLsizei! ]
	]
	glCullFace: "glCullFace" [ mode [GLenum!] ]
	glDeleteLists: "glDeleteLists"[
		list        [ GLuint! ]
		range       [ GLsizei! ]
	]
	glDeleteTextures: "glDeleteTextures"[
		n           [ GLsizei! ]
		textures    [ pointer! [GLuint!] ]
	]
	glDepthFunc: "glDepthFunc" [ func [GLenum!] ]
	glDepthMask: "glDepthMask" [ flag [GLboolean!] ]
	glDepthRange: "glDepthRange"[
		zNear       [ GLclampd! ]
		zFar        [ GLclampd! ]
	]
	glDisable: "glDisable" [ cap [GLenum!] ]
	glDisableClientState: "glDisableClientState" [ array [GLenum!] ]
	glDrawArrays: "glDrawArrays"[
		mode        [ GLenum! ]
		first       [ GLint! ]
		count       [ GLsizei! ]
	]
	glDrawBuffer: "glDrawBuffer" [ mode [GLenum!] ]
	glDrawElements: "glDrawElements"[
		mode        [ GLenum! ]
		count       [ GLsizei! ]
		type        [ GLenum! ]
		indices     [ pointer! [byte!] ]
	]
	glDrawPixels: "glDrawPixels"[
		width       [ GLsizei! ]
		height      [ GLsizei! ]
		format      [ GLenum! ]
		type        [ GLenum! ]
		pixels      [ pointer! [byte!] ]
	]
	glEdgeFlag: "glEdgeFlag" [ flag [GLboolean!] ]
	glEdgeFlagPointer: "glEdgeFlagPointer"[
		stride      [ GLsizei! ]
		pointer     [ pointer! [byte!] ]
	]
	glEdgeFlagv: "glEdgeFlagv" [ flag [pointer! [integer!]] ]
	glEnable: "glEnable" [ cap [GLenum!] ]
	glEnableClientState: "glEnableClientState" [ array [GLenum!] ]
	glEnd: "glEnd" [ ]
	glEndList: "glEndList" [ ]
	glEvalCoord1d: "glEvalCoord1d" [ u [GLdouble!] ]
	glEvalCoord1dv: "glEvalCoord1dv" [ u [pointer! [GLdouble!]] ]
	glEvalCoord1f: "glEvalCoord1f" [ u [GLfloat!] ]
	glEvalCoord1fv: "glEvalCoord1fv" [ u [pointer! [GLfloat!]] ]
	glEvalCoord2d: "glEvalCoord2d"[
		u           [ GLdouble! ]
		v           [ GLdouble! ]
	]
	glEvalCoord2dv: "glEvalCoord2dv" [ u [pointer! [GLdouble!]] ]
	glEvalCoord2f: "glEvalCoord2f"[
		u           [ GLfloat! ]
		v           [ GLfloat! ]
	]
	glEvalCoord2fv: "glEvalCoord2fv" [ u [pointer! [GLfloat!]] ]
	glEvalMesh1: "glEvalMesh1"[
		mode        [ GLenum! ]
		i1          [ GLint! ]
		i2          [ GLint! ]
	]
	glEvalMesh2: "glEvalMesh2"[
		mode        [ GLenum! ]
		i1          [ GLint! ]
		i2          [ GLint! ]
		j1          [ GLint! ]
		j2          [ GLint! ]
	]
	glEvalPoint1: "glEvalPoint1" [ i [GLint!] ]
	glEvalPoint2: "glEvalPoint2"[
		i           [ GLint! ]
		j           [ GLint! ]
	]
	glFeedbackBuffer: "glFeedbackBuffer"[
		size        [ GLsizei! ]
		type        [ GLenum! ]
		buffer      [ pointer! [GLfloat!] ]
	]
	glFinish: "glFinish" [ ]
	glFlush: "glFlush" [ ]
	glFogf: "glFogf"[
		pname       [ GLenum! ]
		param       [ GLfloat! ]
	]
	glFogfv: "glFogfv"[
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glFogi: "glFogi"[
		pname       [ GLenum! ]
		param       [ GLint! ]
	]
	glFogiv: "glFogiv"[
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glFrontFace: "glFrontFace" [ mode [GLenum!] ]
	glFrustum: "glFrustum"[
		left        [ GLdouble! ]
		right       [ GLdouble! ]
		bottom      [ GLdouble! ]
		top         [ GLdouble! ]
		zNear       [ GLdouble! ]
		zFar        [ GLdouble! ]
	]
	glGenLists: "glGenLists" [ range [GLsizei!] return: [GLuint!] ]
	glGenTextures: "glGenTextures"[
		n           [ GLsizei! ]
		textures    [ pointer! [GLuint!] ]
	]
	glGetBooleanv: "glGetBooleanv"[
		pname       [ GLenum! ]
		params      [ pointer! [integer!] ]
	]
	glGetClipPlane: "glGetClipPlane"[
		plane       [ GLenum! ]
		equation    [ pointer! [GLdouble!] ]
	]
	glGetDoublev: "glGetDoublev"[
		pname       [ GLenum! ]
		params      [ pointer! [GLdouble!] ]
	]
	glGetError: "glGetError" [ return: [GLenum!] ]
	glGetFloatv: "glGetFloatv"[
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glGetIntegerv: "glGetIntegerv"[
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glGetLightfv: "glGetLightfv"[
		light       [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glGetLightiv: "glGetLightiv"[
		light       [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glGetMapdv: "glGetMapdv"[
		target      [ GLenum! ]
		query       [ GLenum! ]
		v           [ pointer! [GLdouble!] ]
	]
	glGetMapfv: "glGetMapfv"[
		target      [ GLenum! ]
		query       [ GLenum! ]
		v           [ pointer! [GLfloat!] ]
	]
	glGetMapiv: "glGetMapiv"[
		target      [ GLenum! ]
		query       [ GLenum! ]
		v           [ pointer! [GLint!] ]
	]
	glGetMaterialfv: "glGetMaterialfv"[
		face        [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glGetMaterialiv: "glGetMaterialiv"[
		face        [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glGetPixelMapfv: "glGetPixelMapfv"[
		map         [ GLenum! ]
		values      [ pointer! [GLfloat!] ]
	]
	glGetPixelMapuiv: "glGetPixelMapuiv"[
		map         [ GLenum! ]
		values      [ pointer! [GLuint!] ]
	]
	glGetPixelMapusv: "glGetPixelMapusv"[
		map         [ GLenum! ]
		values      [ GLushort-ptr! ]
	]
	glGetPointerv: "glGetPointerv"[
		pname       [ GLenum! ]
		params      [ binary-ptr! ]
	]
	glGetPolygonStipple: "glGetPolygonStipple" [ mask [pointer! [GLubyte!]] ]
	glGetString: "glGetString" [ name [GLenum!] return: [c-string!] ]
	glGetTexEnvfv: "glGetTexEnvfv"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glGetTexEnviv: "glGetTexEnviv"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glGetTexGendv: "glGetTexGendv"[
		coord       [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLdouble!] ]
	]
	glGetTexGenfv: "glGetTexGenfv"[
		coord       [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glGetTexGeniv: "glGetTexGeniv"[
		coord       [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glGetTexImage: "glGetTexImage"[
		target      [ GLenum! ]
		level       [ GLint! ]
		format      [ GLenum! ]
		type        [ GLenum! ]
		pixels      [ pointer! [byte!] ]
	]
	glGetTexLevelParameterfv: "glGetTexLevelParameterfv"[
		target      [ GLenum! ]
		level       [ GLint! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glGetTexLevelParameteriv: "glGetTexLevelParameteriv"[
		target      [ GLenum! ]
		level       [ GLint! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glGetTexParameterfv: "glGetTexParameterfv"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glGetTexParameteriv: "glGetTexParameteriv"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glHint: "glHint"[
		target      [ GLenum! ]
		mode        [ GLenum! ]
	]
	glIndexMask: "glIndexMask" [ mask [GLuint!] ]
	glIndexPointer: "glIndexPointer"[
		type        [ GLenum! ]
		stride      [ GLsizei! ]
		pointer     [ pointer! [byte!] ]
	]
	glIndexd: "glIndexd" [ c [GLdouble!] ]
	glIndexdv: "glIndexdv" [ c [pointer! [GLdouble!]] ]
	glIndexf: "glIndexf" [ c [GLfloat!] ]
	glIndexfv: "glIndexfv" [ c [pointer! [GLfloat!]] ]
	glIndexi: "glIndexi" [ c [GLint!] ]
	glIndexiv: "glIndexiv" [ c [pointer! [GLint!]] ]
	glIndexs: "glIndexs" [ c [GLshort!] ]
	glIndexsv: "glIndexsv" [ c [GLshort-ptr!] ]
	glIndexub: "glIndexub" [ c [GLubyte!] ]
	glIndexubv: "glIndexubv" [ c [pointer! [GLubyte!]] ]
	glInitNames: "glInitNames" [ ]
	glInterleavedArrays: "glInterleavedArrays"[
		format      [ GLenum! ]
		stride      [ GLsizei! ]
		pointer     [ pointer! [byte!] ]
	]
	glIsEnabled: "glIsEnabled" [ cap [GLenum!] return: [GLboolean!] ]
	glIsList: "glIsList" [ list [GLuint!] return: [GLboolean!] ]
	glIsTexture: "glIsTexture" [ texture [GLuint!] return: [GLboolean!] ]
	glLightModelf: "glLightModelf"[
		pname       [ GLenum! ]
		param       [ GLfloat! ]
	]
	glLightModelfv: "glLightModelfv"[
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glLightModeli: "glLightModeli"[
		pname       [ GLenum! ]
		param       [ GLint! ]
	]
	glLightModeliv: "glLightModeliv"[
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glLightf: "glLightf"[
		light       [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLfloat! ]
	]
	glLightfv: "glLightfv"[
		light       [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glLighti: "glLighti"[
		light       [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLint! ]
	]
	glLightiv: "glLightiv"[
		light       [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glLineStipple: "glLineStipple"[
		factor      [ GLint! ]
		pattern     [ GLushort! ]
	]
	glLineWidth: "glLineWidth" [ width [GLfloat!] ]
	glListBase: "glListBase" [ base [GLuint!] ]
	glLoadIdentity: "glLoadIdentity" [ ]
	glLoadMatrixd: "glLoadMatrixd" [ m [pointer! [GLdouble!]] ]
	glLoadMatrixf: "glLoadMatrixf" [ m [pointer! [GLfloat!]] ]
	glLoadName: "glLoadName" [ name [GLuint!] ]
	glLogicOp: "glLogicOp" [ opcode [GLenum!] ]
	glMap1d: "glMap1d"[
		target      [ GLenum! ]
		u1          [ GLdouble! ]
		u2          [ GLdouble! ]
		stride      [ GLint! ]
		order       [ GLint! ]
		points      [ pointer! [GLdouble!] ]
	]
	glMap1f: "glMap1f"[
		target      [ GLenum! ]
		u1          [ GLfloat! ]
		u2          [ GLfloat! ]
		stride      [ GLint! ]
		order       [ GLint! ]
		points      [ pointer! [GLfloat!] ]
	]
	glMap2d: "glMap2d"[
		target      [ GLenum! ]
		u1          [ GLdouble! ]
		u2          [ GLdouble! ]
		ustride     [ GLint! ]
		uorder      [ GLint! ]
		v1          [ GLdouble! ]
		v2          [ GLdouble! ]
		vstride     [ GLint! ]
		vorder      [ GLint! ]
		points      [ pointer! [GLdouble!] ]
	]
	glMap2f: "glMap2f"[
		target      [ GLenum! ]
		u1          [ GLfloat! ]
		u2          [ GLfloat! ]
		ustride     [ GLint! ]
		uorder      [ GLint! ]
		v1          [ GLfloat! ]
		v2          [ GLfloat! ]
		vstride     [ GLint! ]
		vorder      [ GLint! ]
		points      [ pointer! [GLfloat!] ]
	]
	glMapGrid1d: "glMapGrid1d"[
		un          [ GLint! ]
		u1          [ GLdouble! ]
		u2          [ GLdouble! ]
	]
	glMapGrid1f: "glMapGrid1f"[
		un          [ GLint! ]
		u1          [ GLfloat! ]
		u2          [ GLfloat! ]
	]
	glMapGrid2d: "glMapGrid2d"[
		un          [ GLint! ]
		u1          [ GLdouble! ]
		u2          [ GLdouble! ]
		vn          [ GLint! ]
		v1          [ GLdouble! ]
		v2          [ GLdouble! ]
	]
	glMapGrid2f: "glMapGrid2f"[
		un          [ GLint! ]
		u1          [ GLfloat! ]
		u2          [ GLfloat! ]
		vn          [ GLint! ]
		v1          [ GLfloat! ]
		v2          [ GLfloat! ]
	]
	glMaterialf: "glMaterialf"[
		face        [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLfloat! ]
	]
	glMaterialfv: "glMaterialfv"[
		face        [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glMateriali: "glMateriali"[
		face        [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLint! ]
	]
	glMaterialiv: "glMaterialiv"[
		face        [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glMatrixMode: "glMatrixMode" [ mode [GLenum!] ]
	glMultMatrixd: "glMultMatrixd" [ m [pointer! [GLdouble!]] ]
	glMultMatrixf: "glMultMatrixf" [ m [pointer! [GLfloat!]] ]
	glNewList: "glNewList"[
		list        [ GLuint! ]
		mode        [ GLenum! ]
	]
	glNormal3b: "glNormal3b"[
		nx          [ GLbyte! ]
		ny          [ GLbyte! ]
		nz          [ GLbyte! ]
	]
	glNormal3bv: "glNormal3bv" [ v [pointer! [GLbyte!]] ]
	glNormal3d: "glNormal3d"[
		nx          [ GLdouble! ]
		ny          [ GLdouble! ]
		nz          [ GLdouble! ]
	]
	glNormal3dv: "glNormal3dv" [ v [pointer! [GLdouble!]] ]
	glNormal3f: "glNormal3f"[
		nx          [ GLfloat! ]
		ny          [ GLfloat! ]
		nz          [ GLfloat! ]
	]
	glNormal3fv: "glNormal3fv" [ v [pointer! [GLfloat!]] ]
	glNormal3i: "glNormal3i"[
		nx          [ GLint! ]
		ny          [ GLint! ]
		nz          [ GLint! ]
	]
	glNormal3iv: "glNormal3iv" [ v [pointer! [GLint!]] ]
	glNormal3s: "glNormal3s"[
		nx          [ GLshort! ]
		ny          [ GLshort! ]
		nz          [ GLshort! ]
	]
	glNormal3sv: "glNormal3sv" [ v [GLshort-ptr!] ]
	glNormalPointer: "glNormalPointer"[
		type        [ GLenum! ]
		stride      [ GLsizei! ]
		pointer     [ pointer! [byte!] ]
	]
	glOrtho: "glOrtho"[
		left        [ GLdouble! ]
		right       [ GLdouble! ]
		bottom      [ GLdouble! ]
		top         [ GLdouble! ]
		zNear       [ GLdouble! ]
		zFar        [ GLdouble! ]
	]
	glPassThrough: "glPassThrough" [ token [GLfloat!] ]
	glPixelMapfv: "glPixelMapfv"[
		map         [ GLenum! ]
		mapsize     [ GLsizei! ]
		values      [ pointer! [GLfloat!] ]
	]
	glPixelMapuiv: "glPixelMapuiv"[
		map         [ GLenum! ]
		mapsize     [ GLsizei! ]
		values      [ pointer! [GLuint!] ]
	]
	glPixelMapusv: "glPixelMapusv"[
		map         [ GLenum! ]
		mapsize     [ GLsizei! ]
		values      [ GLushort-ptr! ]
	]
	glPixelStoref: "glPixelStoref"[
		pname       [ GLenum! ]
		param       [ GLfloat! ]
	]
	glPixelStorei: "glPixelStorei"[
		pname       [ GLenum! ]
		param       [ GLint! ]
	]
	glPixelTransferf: "glPixelTransferf"[
		pname       [ GLenum! ]
		param       [ GLfloat! ]
	]
	glPixelTransferi: "glPixelTransferi"[
		pname       [ GLenum! ]
		param       [ GLint! ]
	]
	glPixelZoom: "glPixelZoom"[
		xfactor     [ GLfloat! ]
		yfactor     [ GLfloat! ]
	]
	glPointSize: "glPointSize" [ size [GLfloat!] ]
	glPolygonMode: "glPolygonMode"[
		face        [ GLenum! ]
		mode        [ GLenum! ]
	]
	glPolygonOffset: "glPolygonOffset"[
		factor      [ GLfloat! ]
		units       [ GLfloat! ]
	]
	glPolygonStipple: "glPolygonStipple" [ mask [pointer! [GLubyte!]] ]
	glPopAttrib: "glPopAttrib" [ ]
	glPopClientAttrib: "glPopClientAttrib" [ ]
	glPopMatrix: "glPopMatrix" [ ]
	glPopName: "glPopName" [ ]
	glPrioritizeTextures: "glPrioritizeTextures"[
		n           [ GLsizei! ]
		textures    [ pointer! [GLuint!] ]
		priorities  [ pointer! [GLclampf!] ]
	]
	glPushAttrib: "glPushAttrib" [ mask [GLbitfield!] ]
	glPushClientAttrib: "glPushClientAttrib" [ mask [GLbitfield!] ]
	glPushMatrix: "glPushMatrix" [ ]
	glPushName: "glPushName" [ name [GLuint!] ]
	glRasterPos2d: "glRasterPos2d"[
		x           [ GLdouble! ]
		y           [ GLdouble! ]
	]
	glRasterPos2dv: "glRasterPos2dv" [ v [pointer! [GLdouble!]] ]
	glRasterPos2f: "glRasterPos2f"[
		x           [ GLfloat! ]
		y           [ GLfloat! ]
	]
	glRasterPos2fv: "glRasterPos2fv" [ v [pointer! [GLfloat!]] ]
	glRasterPos2i: "glRasterPos2i"[
		x           [ GLint! ]
		y           [ GLint! ]
	]
	glRasterPos2iv: "glRasterPos2iv" [ v [pointer! [GLint!]] ]
	glRasterPos2s: "glRasterPos2s"[
		x           [ GLshort! ]
		y           [ GLshort! ]
	]
	glRasterPos2sv: "glRasterPos2sv" [ v [GLshort-ptr!] ]
	glRasterPos3d: "glRasterPos3d"[
		x           [ GLdouble! ]
		y           [ GLdouble! ]
		z           [ GLdouble! ]
	]
	glRasterPos3dv: "glRasterPos3dv" [ v [pointer! [GLdouble!]] ]
	glRasterPos3f: "glRasterPos3f"[
		x           [ GLfloat! ]
		y           [ GLfloat! ]
		z           [ GLfloat! ]
	]
	glRasterPos3fv: "glRasterPos3fv" [ v [pointer! [GLfloat!]] ]
	glRasterPos3i: "glRasterPos3i"[
		x           [ GLint! ]
		y           [ GLint! ]
		z           [ GLint! ]
	]
	glRasterPos3iv: "glRasterPos3iv" [ v [pointer! [GLint!]] ]
	glRasterPos3s: "glRasterPos3s"[
		x           [ GLshort! ]
		y           [ GLshort! ]
		z           [ GLshort! ]
	]
	glRasterPos3sv: "glRasterPos3sv" [ v [GLshort-ptr!] ]
	glRasterPos4d: "glRasterPos4d"[
		x           [ GLdouble! ]
		y           [ GLdouble! ]
		z           [ GLdouble! ]
		w           [ GLdouble! ]
	]
	glRasterPos4dv: "glRasterPos4dv" [ v [pointer! [GLdouble!]] ]
	glRasterPos4f: "glRasterPos4f"[
		x           [ GLfloat! ]
		y           [ GLfloat! ]
		z           [ GLfloat! ]
		w           [ GLfloat! ]
	]
	glRasterPos4fv: "glRasterPos4fv" [ v [pointer! [GLfloat!]] ]
	glRasterPos4i: "glRasterPos4i"[
		x           [ GLint! ]
		y           [ GLint! ]
		z           [ GLint! ]
		w           [ GLint! ]
	]
	glRasterPos4iv: "glRasterPos4iv" [ v [pointer! [GLint!]] ]
	glRasterPos4s: "glRasterPos4s"[
		x           [ GLshort! ]
		y           [ GLshort! ]
		z           [ GLshort! ]
		w           [ GLshort! ]
	]
	glRasterPos4sv: "glRasterPos4sv" [ v [GLshort-ptr!] ]
	glReadBuffer: "glReadBuffer" [ mode [GLenum!] ]
	glReadPixels: "glReadPixels"[
		x           [ GLint! ]
		y           [ GLint! ]
		width       [ GLsizei! ]
		height      [ GLsizei! ]
		format      [ GLenum! ]
		type        [ GLenum! ]
		pixels      [ pointer! [byte!] ]
	]
	glRectd: "glRectd"[
		x1          [ GLdouble! ]
		y1          [ GLdouble! ]
		x2          [ GLdouble! ]
		y2          [ GLdouble! ]
	]
	glRectdv: "glRectdv"[
		v1          [ pointer! [GLdouble!] ]
		v2          [ pointer! [GLdouble!] ]
	]
	glRectf: "glRectf"[
		x1          [ GLfloat! ]
		y1          [ GLfloat! ]
		x2          [ GLfloat! ]
		y2          [ GLfloat! ]
	]
	glRectfv: "glRectfv"[
		v1          [ pointer! [GLfloat!] ]
		v2          [ pointer! [GLfloat!] ]
	]
	glRecti: "glRecti"[
		x1          [ GLint! ]
		y1          [ GLint! ]
		x2          [ GLint! ]
		y2          [ GLint! ]
	]
	glRectiv: "glRectiv"[
		v1          [ pointer! [GLint!] ]
		v2          [ pointer! [GLint!] ]
	]
	glRects: "glRects"[
		x1          [ GLshort! ]
		y1          [ GLshort! ]
		x2          [ GLshort! ]
		y2          [ GLshort! ]
	]
	glRectsv: "glRectsv"[
		v1          [ GLshort-ptr! ]
		v2          [ GLshort-ptr! ]
	]
	glRenderMode: "glRenderMode" [ mode [GLenum!] return: [GLint!] ]
	glRotated: "glRotated"[
		angle       [ GLdouble! ]
		x           [ GLdouble! ]
		y           [ GLdouble! ]
		z           [ GLdouble! ]
	]
	glRotatef: "glRotatef"[
		angle       [ GLfloat! ]
		x           [ GLfloat! ]
		y           [ GLfloat! ]
		z           [ GLfloat! ]
	]
	glScaled: "glScaled"[
		x           [ GLdouble! ]
		y           [ GLdouble! ]
		z           [ GLdouble! ]
	]
	glScalef: "glScalef"[
		x           [ GLfloat! ]
		y           [ GLfloat! ]
		z           [ GLfloat! ]
	]
	glScissor: "glScissor"[
		x           [ GLint! ]
		y           [ GLint! ]
		width       [ GLsizei! ]
		height      [ GLsizei! ]
	]
	glSelectBuffer: "glSelectBuffer"[
		size        [ GLsizei! ]
		buffer      [ pointer! [GLuint!] ]
	]
	glShadeModel: "glShadeModel" [ mode [GLenum!] ]
	glStencilFunc: "glStencilFunc"[
		func        [ GLenum! ]
		ref         [ GLint! ]
		mask        [ GLuint! ]
	]
	glStencilMask: "glStencilMask" [ mask [GLuint!] ]
	glStencilOp: "glStencilOp"[
		fail        [ GLenum! ]
		zfail       [ GLenum! ]
		zpass       [ GLenum! ]
	]
	glTexCoord1d: "glTexCoord1d" [ s [GLdouble!] ]
	glTexCoord1dv: "glTexCoord1dv" [ v [pointer! [GLdouble!]] ]
	glTexCoord1f: "glTexCoord1f" [ s [GLfloat!] ]
	glTexCoord1fv: "glTexCoord1fv" [ v [pointer! [GLfloat!]] ]
	glTexCoord1i: "glTexCoord1i" [ s [GLint!] ]
	glTexCoord1iv: "glTexCoord1iv" [ v [pointer! [GLint!]] ]
	glTexCoord1s: "glTexCoord1s" [ s [GLshort!] ]
	glTexCoord1sv: "glTexCoord1sv" [ v [GLshort-ptr!] ]
	glTexCoord2d: "glTexCoord2d"[
		s           [ GLdouble! ]
		t           [ GLdouble! ]
	]
	glTexCoord2dv: "glTexCoord2dv" [ v [pointer! [GLdouble!]] ]
	glTexCoord2f: "glTexCoord2f"[
		s           [ GLfloat! ]
		t           [ GLfloat! ]
	]
	glTexCoord2fv: "glTexCoord2fv" [ v [pointer! [GLfloat!]] ]
	glTexCoord2i: "glTexCoord2i"[
		s           [ GLint! ]
		t           [ GLint! ]
	]
	glTexCoord2iv: "glTexCoord2iv" [ v [pointer! [GLint!]] ]
	glTexCoord2s: "glTexCoord2s"[
		s           [ GLshort! ]
		t           [ GLshort! ]
	]
	glTexCoord2sv: "glTexCoord2sv" [ v [GLshort-ptr!] ]
	glTexCoord3d: "glTexCoord3d"[
		s           [ GLdouble! ]
		t           [ GLdouble! ]
		r           [ GLdouble! ]
	]
	glTexCoord3dv: "glTexCoord3dv" [ v [pointer! [GLdouble!]] ]
	glTexCoord3f: "glTexCoord3f"[
		s           [ GLfloat! ]
		t           [ GLfloat! ]
		r           [ GLfloat! ]
	]
	glTexCoord3fv: "glTexCoord3fv" [ v [pointer! [GLfloat!]] ]
	glTexCoord3i: "glTexCoord3i"[
		s           [ GLint! ]
		t           [ GLint! ]
		r           [ GLint! ]
	]
	glTexCoord3iv: "glTexCoord3iv" [ v [pointer! [GLint!]] ]
	glTexCoord3s: "glTexCoord3s"[
		s           [ GLshort! ]
		t           [ GLshort! ]
		r           [ GLshort! ]
	]
	glTexCoord3sv: "glTexCoord3sv" [ v [GLshort-ptr!] ]
	glTexCoord4d: "glTexCoord4d"[
		s           [ GLdouble! ]
		t           [ GLdouble! ]
		r           [ GLdouble! ]
		q           [ GLdouble! ]
	]
	glTexCoord4dv: "glTexCoord4dv" [ v [pointer! [GLdouble!]] ]
	glTexCoord4f: "glTexCoord4f"[
		s           [ GLfloat! ]
		t           [ GLfloat! ]
		r           [ GLfloat! ]
		q           [ GLfloat! ]
	]
	glTexCoord4fv: "glTexCoord4fv" [ v [pointer! [GLfloat!]] ]
	glTexCoord4i: "glTexCoord4i"[
		s           [ GLint! ]
		t           [ GLint! ]
		r           [ GLint! ]
		q           [ GLint! ]
	]
	glTexCoord4iv: "glTexCoord4iv" [ v [pointer! [GLint!]] ]
	glTexCoord4s: "glTexCoord4s"[
		s           [ GLshort! ]
		t           [ GLshort! ]
		r           [ GLshort! ]
		q           [ GLshort! ]
	]
	glTexCoord4sv: "glTexCoord4sv" [ v [GLshort-ptr!] ]
	glTexCoordPointer: "glTexCoordPointer"[
		size        [ GLint! ]
		type        [ GLenum! ]
		stride      [ GLsizei! ]
		pointer     [ pointer! [byte!] ]
	]
	glTexEnvf: "glTexEnvf"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLfloat! ]
	]
	glTexEnvfv: "glTexEnvfv"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glTexEnvi: "glTexEnvi"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLint! ]
	]
	glTexEnviv: "glTexEnviv"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glTexGend: "glTexGend"[
		coord       [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLdouble! ]
	]
	glTexGendv: "glTexGendv"[
		coord       [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLdouble!] ]
	]
	glTexGenf: "glTexGenf"[
		coord       [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLfloat! ]
	]
	glTexGenfv: "glTexGenfv"[
		coord       [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glTexGeni: "glTexGeni"[
		coord       [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLint! ]
	]
	glTexGeniv: "glTexGeniv"[
		coord       [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glTexImage1D: "glTexImage1D"[
		target      [ GLenum! ]
		level       [ GLint! ]
		internalformat [ GLint! ]
		width       [ GLsizei! ]
		border      [ GLint! ]
		format      [ GLenum! ]
		type        [ GLenum! ]
		pixels      [ pointer! [byte!] ]
	]
	glTexImage2D: "glTexImage2D"[
		target      [ GLenum! ]
		level       [ GLint! ]
		internalformat [ GLint! ]
		width       [ GLsizei! ]
		height      [ GLsizei! ]
		border      [ GLint! ]
		format      [ GLenum! ]
		type        [ GLenum! ]
		pixels      [ pointer! [byte!] ]
	]
	glTexParameterf: "glTexParameterf"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLfloat! ]
	]
	glTexParameterfv: "glTexParameterfv"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLfloat!] ]
	]
	glTexParameteri: "glTexParameteri"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		param       [ GLint! ]
	]
	glTexParameteriv: "glTexParameteriv"[
		target      [ GLenum! ]
		pname       [ GLenum! ]
		params      [ pointer! [GLint!] ]
	]
	glTexSubImage1D: "glTexSubImage1D"[
		target      [ GLenum! ]
		level       [ GLint! ]
		xoffset     [ GLint! ]
		width       [ GLsizei! ]
		format      [ GLenum! ]
		type        [ GLenum! ]
		pixels      [ pointer! [byte!] ]
	]
	glTexSubImage2D: "glTexSubImage2D"[
		target      [ GLenum! ]
		level       [ GLint! ]
		xoffset     [ GLint! ]
		yoffset     [ GLint! ]
		width       [ GLsizei! ]
		height      [ GLsizei! ]
		format      [ GLenum! ]
		type        [ GLenum! ]
		pixels      [ pointer! [byte!] ]
	]
	glTranslated: "glTranslated"[
		x           [ GLdouble! ]
		y           [ GLdouble! ]
		z           [ GLdouble! ]
	]
	glTranslatef: "glTranslatef"[
		x           [ GLfloat! ]
		y           [ GLfloat! ]
		z           [ GLfloat! ]
	]
	glVertex2d: "glVertex2d"[
		x           [ GLdouble! ]
		y           [ GLdouble! ]
	]
	glVertex2dv: "glVertex2dv" [ v [pointer! [GLdouble!]] ]
	glVertex2f: "glVertex2f"[
		x           [ GLfloat! ]
		y           [ GLfloat! ]
	]
	glVertex2fv: "glVertex2fv" [ v [pointer! [GLfloat!]] ]
	glVertex2i: "glVertex2i"[
		x           [ GLint! ]
		y           [ GLint! ]
	]
	glVertex2iv: "glVertex2iv" [ v [pointer! [GLint!]] ]
	glVertex2s: "glVertex2s"[
		x           [ GLshort! ]
		y           [ GLshort! ]
	]
	glVertex2sv: "glVertex2sv" [ v [GLshort-ptr!] ]
	glVertex3d: "glVertex3d"[
		x           [ GLdouble! ]
		y           [ GLdouble! ]
		z           [ GLdouble! ]
	]
	glVertex3dv: "glVertex3dv" [ v [pointer! [GLdouble!]] ]
	glVertex3f: "glVertex3f"[
		x           [ GLfloat! ]
		y           [ GLfloat! ]
		z           [ GLfloat! ]
	]
	glVertex3fv: "glVertex3fv" [ v [pointer! [GLfloat!]] ]
	glVertex3i: "glVertex3i"[
		x           [ GLint! ]
		y           [ GLint! ]
		z           [ GLint! ]
	]
	glVertex3iv: "glVertex3iv" [ v [pointer! [GLint!]] ]
	glVertex3s: "glVertex3s"[
		x           [ GLshort! ]
		y           [ GLshort! ]
		z           [ GLshort! ]
	]
	glVertex3sv: "glVertex3sv" [ v [GLshort-ptr!] ]
	glVertex4d: "glVertex4d"[
		x           [ GLdouble! ]
		y           [ GLdouble! ]
		z           [ GLdouble! ]
		w           [ GLdouble! ]
	]
	glVertex4dv: "glVertex4dv" [ v [pointer! [GLdouble!]] ]
	glVertex4f: "glVertex4f"[
		x           [ GLfloat! ]
		y           [ GLfloat! ]
		z           [ GLfloat! ]
		w           [ GLfloat! ]
	]
	glVertex4fv: "glVertex4fv" [ v [pointer! [GLfloat!]] ]
	glVertex4i: "glVertex4i"[
		x           [ GLint! ]
		y           [ GLint! ]
		z           [ GLint! ]
		w           [ GLint! ]
	]
	glVertex4iv: "glVertex4iv" [ v [pointer! [GLint!]] ]
	glVertex4s: "glVertex4s"[
		x           [ GLshort! ]
		y           [ GLshort! ]
		z           [ GLshort! ]
		w           [ GLshort! ]
	]
	glVertex4sv: "glVertex4sv" [ v [GLshort-ptr!] ]
	glVertexPointer: "glVertexPointer"[
		size        [ GLint! ]
		type        [ GLenum! ]
		stride      [ GLsizei! ]
		pointer     [ pointer! [byte!] ]
	]
	glViewport: "glViewport"[
		x           [ GLint! ]
		y           [ GLint! ]
		width       [ GLsizei! ]
		height      [ GLsizei! ]
	]
]]



;-------------------------------------------
;-- GL_VERSION_1_2
;-------------------------------------------

#define  GL_VERSION_1_2                               1
#define  GL_SMOOTH_POINT_SIZE_RANGE                   0B12h
#define  GL_SMOOTH_POINT_SIZE_GRANULARITY             0B13h
#define  GL_SMOOTH_LINE_WIDTH_RANGE                   0B22h
#define  GL_SMOOTH_LINE_WIDTH_GRANULARITY             0B23h
#define  GL_UNSIGNED_BYTE_3_3_2                       8032h
#define  GL_UNSIGNED_SHORT_4_4_4_4                    8033h
#define  GL_UNSIGNED_SHORT_5_5_5_1                    8034h
#define  GL_UNSIGNED_INT_8_8_8_8                      8035h
#define  GL_UNSIGNED_INT_10_10_10_2                   8036h
#define  GL_RESCALE_NORMAL                            803Ah
#define  GL_TEXTURE_BINDING_3D                        806Ah
#define  GL_PACK_SKIP_IMAGES                          806Bh
#define  GL_PACK_IMAGE_HEIGHT                         806Ch
#define  GL_UNPACK_SKIP_IMAGES                        806Dh
#define  GL_UNPACK_IMAGE_HEIGHT                       806Eh
#define  GL_TEXTURE_3D                                806Fh
#define  GL_PROXY_TEXTURE_3D                          8070h
#define  GL_TEXTURE_DEPTH                             8071h
#define  GL_TEXTURE_WRAP_R                            8072h
#define  GL_MAX_3D_TEXTURE_SIZE                       8073h
#define  GL_BGR                                       80E0h
#define  GL_BGRA                                      80E1h
#define  GL_MAX_ELEMENTS_VERTICES                     80E8h
#define  GL_MAX_ELEMENTS_INDICES                      80E9h
#define  GL_CLAMP_TO_EDGE                             812Fh
#define  GL_TEXTURE_MIN_LOD                           813Ah
#define  GL_TEXTURE_MAX_LOD                           813Bh
#define  GL_TEXTURE_BASE_LEVEL                        813Ch
#define  GL_TEXTURE_MAX_LEVEL                         813Dh
#define  GL_LIGHT_MODEL_COLOR_CONTROL                 81F8h
#define  GL_SINGLE_COLOR                              81F9h
#define  GL_SEPARATE_SPECULAR_COLOR                   81FAh
#define  GL_UNSIGNED_BYTE_2_3_3_REV                   8362h
#define  GL_UNSIGNED_SHORT_5_6_5                      8363h
#define  GL_UNSIGNED_SHORT_5_6_5_REV                  8364h
#define  GL_UNSIGNED_SHORT_4_4_4_4_REV                8365h
#define  GL_UNSIGNED_SHORT_1_5_5_5_REV                8366h
#define  GL_UNSIGNED_INT_8_8_8_8_REV                  8367h
#define  GL_ALIASED_POINT_SIZE_RANGE                  846Dh
#define  GL_ALIASED_LINE_WIDTH_RANGE                  846Eh
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height );
glCopyTexSubImage3D!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	x           [ GLint! ]
	y           [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
]
;@@ void ( GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const void *indices );
glDrawRangeElements!: alias function! [
	mode        [ GLenum! ]
	start       [ GLuint! ]
	end         [ GLuint! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels );
glTexImage3D!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalFormat [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	border      [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels );
glTexSubImage3D!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	pixels      [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_VERSION_1_2_1
;-------------------------------------------

#define  GL_VERSION_1_2_1                             1


;-------------------------------------------
;-- GL_VERSION_1_3
;-------------------------------------------

#define  GL_VERSION_1_3                               1
#define  GL_MULTISAMPLE                               809Dh
#define  GL_SAMPLE_ALPHA_TO_COVERAGE                  809Eh
#define  GL_SAMPLE_ALPHA_TO_ONE                       809Fh
#define  GL_SAMPLE_COVERAGE                           80A0h
#define  GL_SAMPLE_BUFFERS                            80A8h
#define  GL_SAMPLES                                   80A9h
#define  GL_SAMPLE_COVERAGE_VALUE                     80AAh
#define  GL_SAMPLE_COVERAGE_INVERT                    80ABh
#define  GL_CLAMP_TO_BORDER                           812Dh
#define  GL_TEXTURE0                                  84C0h
#define  GL_TEXTURE1                                  84C1h
#define  GL_TEXTURE2                                  84C2h
#define  GL_TEXTURE3                                  84C3h
#define  GL_TEXTURE4                                  84C4h
#define  GL_TEXTURE5                                  84C5h
#define  GL_TEXTURE6                                  84C6h
#define  GL_TEXTURE7                                  84C7h
#define  GL_TEXTURE8                                  84C8h
#define  GL_TEXTURE9                                  84C9h
#define  GL_TEXTURE10                                 84CAh
#define  GL_TEXTURE11                                 84CBh
#define  GL_TEXTURE12                                 84CCh
#define  GL_TEXTURE13                                 84CDh
#define  GL_TEXTURE14                                 84CEh
#define  GL_TEXTURE15                                 84CFh
#define  GL_TEXTURE16                                 84D0h
#define  GL_TEXTURE17                                 84D1h
#define  GL_TEXTURE18                                 84D2h
#define  GL_TEXTURE19                                 84D3h
#define  GL_TEXTURE20                                 84D4h
#define  GL_TEXTURE21                                 84D5h
#define  GL_TEXTURE22                                 84D6h
#define  GL_TEXTURE23                                 84D7h
#define  GL_TEXTURE24                                 84D8h
#define  GL_TEXTURE25                                 84D9h
#define  GL_TEXTURE26                                 84DAh
#define  GL_TEXTURE27                                 84DBh
#define  GL_TEXTURE28                                 84DCh
#define  GL_TEXTURE29                                 84DDh
#define  GL_TEXTURE30                                 84DEh
#define  GL_TEXTURE31                                 84DFh
#define  GL_ACTIVE_TEXTURE                            84E0h
#define  GL_CLIENT_ACTIVE_TEXTURE                     84E1h
#define  GL_MAX_TEXTURE_UNITS                         84E2h
#define  GL_TRANSPOSE_MODELVIEW_MATRIX                84E3h
#define  GL_TRANSPOSE_PROJECTION_MATRIX               84E4h
#define  GL_TRANSPOSE_TEXTURE_MATRIX                  84E5h
#define  GL_TRANSPOSE_COLOR_MATRIX                    84E6h
#define  GL_SUBTRACT                                  84E7h
#define  GL_COMPRESSED_ALPHA                          84E9h
#define  GL_COMPRESSED_LUMINANCE                      84EAh
#define  GL_COMPRESSED_LUMINANCE_ALPHA                84EBh
#define  GL_COMPRESSED_INTENSITY                      84ECh
#define  GL_COMPRESSED_RGB                            84EDh
#define  GL_COMPRESSED_RGBA                           84EEh
#define  GL_TEXTURE_COMPRESSION_HINT                  84EFh
#define  GL_NORMAL_MAP                                8511h
#define  GL_REFLECTION_MAP                            8512h
#define  GL_TEXTURE_CUBE_MAP                          8513h
#define  GL_TEXTURE_BINDING_CUBE_MAP                  8514h
#define  GL_TEXTURE_CUBE_MAP_POSITIVE_X               8515h
#define  GL_TEXTURE_CUBE_MAP_NEGATIVE_X               8516h
#define  GL_TEXTURE_CUBE_MAP_POSITIVE_Y               8517h
#define  GL_TEXTURE_CUBE_MAP_NEGATIVE_Y               8518h
#define  GL_TEXTURE_CUBE_MAP_POSITIVE_Z               8519h
#define  GL_TEXTURE_CUBE_MAP_NEGATIVE_Z               851Ah
#define  GL_PROXY_TEXTURE_CUBE_MAP                    851Bh
#define  GL_MAX_CUBE_MAP_TEXTURE_SIZE                 851Ch
#define  GL_COMBINE                                   8570h
#define  GL_COMBINE_RGB                               8571h
#define  GL_COMBINE_ALPHA                             8572h
#define  GL_RGB_SCALE                                 8573h
#define  GL_ADD_SIGNED                                8574h
#define  GL_INTERPOLATE                               8575h
#define  GL_CONSTANT                                  8576h
#define  GL_PRIMARY_COLOR                             8577h
#define  GL_PREVIOUS                                  8578h
#define  GL_SOURCE0_RGB                               8580h
#define  GL_SOURCE1_RGB                               8581h
#define  GL_SOURCE2_RGB                               8582h
#define  GL_SOURCE0_ALPHA                             8588h
#define  GL_SOURCE1_ALPHA                             8589h
#define  GL_SOURCE2_ALPHA                             858Ah
#define  GL_OPERAND0_RGB                              8590h
#define  GL_OPERAND1_RGB                              8591h
#define  GL_OPERAND2_RGB                              8592h
#define  GL_OPERAND0_ALPHA                            8598h
#define  GL_OPERAND1_ALPHA                            8599h
#define  GL_OPERAND2_ALPHA                            859Ah
#define  GL_TEXTURE_COMPRESSED_IMAGE_SIZE             86A0h
#define  GL_TEXTURE_COMPRESSED                        86A1h
#define  GL_NUM_COMPRESSED_TEXTURE_FORMATS            86A2h
#define  GL_COMPRESSED_TEXTURE_FORMATS                86A3h
#define  GL_DOT3_RGB                                  86AEh
#define  GL_DOT3_RGBA                                 86AFh
#define  GL_MULTISAMPLE_BIT                           20000000h
;@@ void ( GLenum texture );
glActiveTexture!: alias function! [
	texture     [ GLenum! ]
]
;@@ void ( GLenum texture );
glClientActiveTexture!: alias function! [
	texture     [ GLenum! ]
]
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const void *data );
glCompressedTexImage1D!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *data );
glCompressedTexImage2D!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *data );
glCompressedTexImage3D!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	internalformat [ GLenum! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	border      [ GLint! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *data );
glCompressedTexSubImage1D!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	width       [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data );
glCompressedTexSubImage2D!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data );
glCompressedTexSubImage3D!: alias function! [
	target      [ GLenum! ]
	level       [ GLint! ]
	xoffset     [ GLint! ]
	yoffset     [ GLint! ]
	zoffset     [ GLint! ]
	width       [ GLsizei! ]
	height      [ GLsizei! ]
	depth       [ GLsizei! ]
	format      [ GLenum! ]
	imageSize   [ GLsizei! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLenum target, GLint lod, void *img );
glGetCompressedTexImage!: alias function! [
	target      [ GLenum! ]
	lod         [ GLint! ]
	img         [ pointer! [byte!] ]
]
;@@ void ( const GLdouble m[16] );
glLoadTransposeMatrixd!: alias function! [
	m           [ pointer! [GLdouble!] ] ;@@[16]
]
;@@ void ( const GLfloat m[16] );
glLoadTransposeMatrixf!: alias function! [
	m           [ pointer! [GLfloat!] ] ;@@[16]
]
;@@ void ( const GLdouble m[16] );
glMultTransposeMatrixd!: alias function! [
	m           [ pointer! [GLdouble!] ] ;@@[16]
]
;@@ void ( const GLfloat m[16] );
glMultTransposeMatrixf!: alias function! [
	m           [ pointer! [GLfloat!] ] ;@@[16]
]
;@@ void ( GLenum target, GLdouble s );
glMultiTexCoord1d!: alias function! [
	target      [ GLenum! ]
	s           [ GLdouble! ]
]
;@@ void ( GLenum target, const GLdouble *v );
glMultiTexCoord1dv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLfloat s );
glMultiTexCoord1f!: alias function! [
	target      [ GLenum! ]
	s           [ GLfloat! ]
]
;@@ void ( GLenum target, const GLfloat *v );
glMultiTexCoord1fv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLint s );
glMultiTexCoord1i!: alias function! [
	target      [ GLenum! ]
	s           [ GLint! ]
]
;@@ void ( GLenum target, const GLint *v );
glMultiTexCoord1iv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLshort s );
glMultiTexCoord1s!: alias function! [
	target      [ GLenum! ]
	s           [ GLshort! ]
]
;@@ void ( GLenum target, const GLshort *v );
glMultiTexCoord1sv!: alias function! [
	target      [ GLenum! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLenum target, GLdouble s, GLdouble t );
glMultiTexCoord2d!: alias function! [
	target      [ GLenum! ]
	s           [ GLdouble! ]
	t           [ GLdouble! ]
]
;@@ void ( GLenum target, const GLdouble *v );
glMultiTexCoord2dv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLfloat s, GLfloat t );
glMultiTexCoord2f!: alias function! [
	target      [ GLenum! ]
	s           [ GLfloat! ]
	t           [ GLfloat! ]
]
;@@ void ( GLenum target, const GLfloat *v );
glMultiTexCoord2fv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLint s, GLint t );
glMultiTexCoord2i!: alias function! [
	target      [ GLenum! ]
	s           [ GLint! ]
	t           [ GLint! ]
]
;@@ void ( GLenum target, const GLint *v );
glMultiTexCoord2iv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLshort s, GLshort t );
glMultiTexCoord2s!: alias function! [
	target      [ GLenum! ]
	s           [ GLshort! ]
	t           [ GLshort! ]
]
;@@ void ( GLenum target, const GLshort *v );
glMultiTexCoord2sv!: alias function! [
	target      [ GLenum! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLenum target, GLdouble s, GLdouble t, GLdouble r );
glMultiTexCoord3d!: alias function! [
	target      [ GLenum! ]
	s           [ GLdouble! ]
	t           [ GLdouble! ]
	r           [ GLdouble! ]
]
;@@ void ( GLenum target, const GLdouble *v );
glMultiTexCoord3dv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLfloat s, GLfloat t, GLfloat r );
glMultiTexCoord3f!: alias function! [
	target      [ GLenum! ]
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	r           [ GLfloat! ]
]
;@@ void ( GLenum target, const GLfloat *v );
glMultiTexCoord3fv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLint s, GLint t, GLint r );
glMultiTexCoord3i!: alias function! [
	target      [ GLenum! ]
	s           [ GLint! ]
	t           [ GLint! ]
	r           [ GLint! ]
]
;@@ void ( GLenum target, const GLint *v );
glMultiTexCoord3iv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLshort s, GLshort t, GLshort r );
glMultiTexCoord3s!: alias function! [
	target      [ GLenum! ]
	s           [ GLshort! ]
	t           [ GLshort! ]
	r           [ GLshort! ]
]
;@@ void ( GLenum target, const GLshort *v );
glMultiTexCoord3sv!: alias function! [
	target      [ GLenum! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q );
glMultiTexCoord4d!: alias function! [
	target      [ GLenum! ]
	s           [ GLdouble! ]
	t           [ GLdouble! ]
	r           [ GLdouble! ]
	q           [ GLdouble! ]
]
;@@ void ( GLenum target, const GLdouble *v );
glMultiTexCoord4dv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q );
glMultiTexCoord4f!: alias function! [
	target      [ GLenum! ]
	s           [ GLfloat! ]
	t           [ GLfloat! ]
	r           [ GLfloat! ]
	q           [ GLfloat! ]
]
;@@ void ( GLenum target, const GLfloat *v );
glMultiTexCoord4fv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum target, GLint s, GLint t, GLint r, GLint q );
glMultiTexCoord4i!: alias function! [
	target      [ GLenum! ]
	s           [ GLint! ]
	t           [ GLint! ]
	r           [ GLint! ]
	q           [ GLint! ]
]
;@@ void ( GLenum target, const GLint *v );
glMultiTexCoord4iv!: alias function! [
	target      [ GLenum! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLshort s, GLshort t, GLshort r, GLshort q );
glMultiTexCoord4s!: alias function! [
	target      [ GLenum! ]
	s           [ GLshort! ]
	t           [ GLshort! ]
	r           [ GLshort! ]
	q           [ GLshort! ]
]
;@@ void ( GLenum target, const GLshort *v );
glMultiTexCoord4sv!: alias function! [
	target      [ GLenum! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLclampf value, GLboolean invert );
glSampleCoverage!: alias function! [
	value       [ GLclampf! ]
	invert      [ GLboolean! ]
]


;-------------------------------------------
;-- GL_VERSION_1_4
;-------------------------------------------

#define  GL_VERSION_1_4                               1
#define  GL_BLEND_DST_RGB                             80C8h
#define  GL_BLEND_SRC_RGB                             80C9h
#define  GL_BLEND_DST_ALPHA                           80CAh
#define  GL_BLEND_SRC_ALPHA                           80CBh
#define  GL_POINT_SIZE_MIN                            8126h
#define  GL_POINT_SIZE_MAX                            8127h
#define  GL_POINT_FADE_THRESHOLD_SIZE                 8128h
#define  GL_POINT_DISTANCE_ATTENUATION                8129h
#define  GL_GENERATE_MIPMAP                           8191h
#define  GL_GENERATE_MIPMAP_HINT                      8192h
#define  GL_DEPTH_COMPONENT16                         81A5h
#define  GL_DEPTH_COMPONENT24                         81A6h
#define  GL_DEPTH_COMPONENT32                         81A7h
#define  GL_MIRRORED_REPEAT                           8370h
#define  GL_FOG_COORDINATE_SOURCE                     8450h
#define  GL_FOG_COORDINATE                            8451h
#define  GL_FRAGMENT_DEPTH                            8452h
#define  GL_CURRENT_FOG_COORDINATE                    8453h
#define  GL_FOG_COORDINATE_ARRAY_TYPE                 8454h
#define  GL_FOG_COORDINATE_ARRAY_STRIDE               8455h
#define  GL_FOG_COORDINATE_ARRAY_POINTER              8456h
#define  GL_FOG_COORDINATE_ARRAY                      8457h
#define  GL_COLOR_SUM                                 8458h
#define  GL_CURRENT_SECONDARY_COLOR                   8459h
#define  GL_SECONDARY_COLOR_ARRAY_SIZE                845Ah
#define  GL_SECONDARY_COLOR_ARRAY_TYPE                845Bh
#define  GL_SECONDARY_COLOR_ARRAY_STRIDE              845Ch
#define  GL_SECONDARY_COLOR_ARRAY_POINTER             845Dh
#define  GL_SECONDARY_COLOR_ARRAY                     845Eh
#define  GL_MAX_TEXTURE_LOD_BIAS                      84FDh
#define  GL_TEXTURE_FILTER_CONTROL                    8500h
#define  GL_TEXTURE_LOD_BIAS                          8501h
#define  GL_INCR_WRAP                                 8507h
#define  GL_DECR_WRAP                                 8508h
#define  GL_TEXTURE_DEPTH_SIZE                        884Ah
#define  GL_DEPTH_TEXTURE_MODE                        884Bh
#define  GL_TEXTURE_COMPARE_MODE                      884Ch
#define  GL_TEXTURE_COMPARE_FUNC                      884Dh
#define  GL_COMPARE_R_TO_TEXTURE                      884Eh
;@@ void ( GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha );
glBlendColor!: alias function! [
	red         [ GLclampf! ]
	green       [ GLclampf! ]
	blue        [ GLclampf! ]
	alpha       [ GLclampf! ]
]
;@@ void ( GLenum mode );
glBlendEquation!: alias function! [
	mode        [ GLenum! ]
]
;@@ void ( GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha );
glBlendFuncSeparate!: alias function! [
	sfactorRGB  [ GLenum! ]
	dfactorRGB  [ GLenum! ]
	sfactorAlpha [ GLenum! ]
	dfactorAlpha [ GLenum! ]
]
;@@ void ( GLenum type, GLsizei stride, const void *pointer );
glFogCoordPointer!: alias function! [
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLdouble coord );
glFogCoordd!: alias function! [
	coord       [ GLdouble! ]
]
;@@ void ( const GLdouble *coord );
glFogCoorddv!: alias function! [
	coord       [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat coord );
glFogCoordf!: alias function! [
	coord       [ GLfloat! ]
]
;@@ void ( const GLfloat *coord );
glFogCoordfv!: alias function! [
	coord       [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum mode, const GLint *first, const GLsizei *count, GLsizei drawcount );
glMultiDrawArrays!: alias function! [
	mode        [ GLenum! ]
	first       [ pointer! [GLint!] ]
	count       [ pointer! [GLsizei!] ]
	drawcount   [ GLsizei! ]
]
;@@ void ( GLenum mode, const GLsizei *count, GLenum type, const void *const* indices, GLsizei drawcount );
glMultiDrawElements!: alias function! [
	mode        [ GLenum! ]
	count       [ pointer! [GLsizei!] ]
	type        [ GLenum! ]
	indices     [ binary-ptr! ]
	drawcount   [ GLsizei! ]
]
;@@ void ( GLenum pname, GLfloat param );
glPointParameterf!: alias function! [
	pname       [ GLenum! ]
	param       [ GLfloat! ]
]
;@@ void ( GLenum pname, const GLfloat *params );
glPointParameterfv!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum pname, GLint param );
glPointParameteri!: alias function! [
	pname       [ GLenum! ]
	param       [ GLint! ]
]
;@@ void ( GLenum pname, const GLint *params );
glPointParameteriv!: alias function! [
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLbyte red, GLbyte green, GLbyte blue );
glSecondaryColor3b!: alias function! [
	red         [ GLbyte! ]
	green       [ GLbyte! ]
	blue        [ GLbyte! ]
]
;@@ void ( const GLbyte *v );
glSecondaryColor3bv!: alias function! [
	v           [ pointer! [GLbyte!] ]
]
;@@ void ( GLdouble red, GLdouble green, GLdouble blue );
glSecondaryColor3d!: alias function! [
	red         [ GLdouble! ]
	green       [ GLdouble! ]
	blue        [ GLdouble! ]
]
;@@ void ( const GLdouble *v );
glSecondaryColor3dv!: alias function! [
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat red, GLfloat green, GLfloat blue );
glSecondaryColor3f!: alias function! [
	red         [ GLfloat! ]
	green       [ GLfloat! ]
	blue        [ GLfloat! ]
]
;@@ void ( const GLfloat *v );
glSecondaryColor3fv!: alias function! [
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLint red, GLint green, GLint blue );
glSecondaryColor3i!: alias function! [
	red         [ GLint! ]
	green       [ GLint! ]
	blue        [ GLint! ]
]
;@@ void ( const GLint *v );
glSecondaryColor3iv!: alias function! [
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLshort red, GLshort green, GLshort blue );
glSecondaryColor3s!: alias function! [
	red         [ GLshort! ]
	green       [ GLshort! ]
	blue        [ GLshort! ]
]
;@@ void ( const GLshort *v );
glSecondaryColor3sv!: alias function! [
	v           [ GLshort-ptr! ]
]
;@@ void ( GLubyte red, GLubyte green, GLubyte blue );
glSecondaryColor3ub!: alias function! [
	red         [ GLubyte! ]
	green       [ GLubyte! ]
	blue        [ GLubyte! ]
]
;@@ void ( const GLubyte *v );
glSecondaryColor3ubv!: alias function! [
	v           [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint red, GLuint green, GLuint blue );
glSecondaryColor3ui!: alias function! [
	red         [ GLuint! ]
	green       [ GLuint! ]
	blue        [ GLuint! ]
]
;@@ void ( const GLuint *v );
glSecondaryColor3uiv!: alias function! [
	v           [ pointer! [GLuint!] ]
]
;@@ void ( GLushort red, GLushort green, GLushort blue );
glSecondaryColor3us!: alias function! [
	red         [ GLushort! ]
	green       [ GLushort! ]
	blue        [ GLushort! ]
]
;@@ void ( const GLushort *v );
glSecondaryColor3usv!: alias function! [
	v           [ GLushort-ptr! ]
]
;@@ void ( GLint size, GLenum type, GLsizei stride, const void *pointer );
glSecondaryColorPointer!: alias function! [
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]
;@@ void ( GLdouble x, GLdouble y );
glWindowPos2d!: alias function! [
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( const GLdouble *p );
glWindowPos2dv!: alias function! [
	p           [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat x, GLfloat y );
glWindowPos2f!: alias function! [
	x           [ GLfloat! ]
	y           [ GLfloat! ]
]
;@@ void ( const GLfloat *p );
glWindowPos2fv!: alias function! [
	p           [ pointer! [GLfloat!] ]
]
;@@ void ( GLint x, GLint y );
glWindowPos2i!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
]
;@@ void ( const GLint *p );
glWindowPos2iv!: alias function! [
	p           [ pointer! [GLint!] ]
]
;@@ void ( GLshort x, GLshort y );
glWindowPos2s!: alias function! [
	x           [ GLshort! ]
	y           [ GLshort! ]
]
;@@ void ( const GLshort *p );
glWindowPos2sv!: alias function! [
	p           [ GLshort-ptr! ]
]
;@@ void ( GLdouble x, GLdouble y, GLdouble z );
glWindowPos3d!: alias function! [
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( const GLdouble *p );
glWindowPos3dv!: alias function! [
	p           [ pointer! [GLdouble!] ]
]
;@@ void ( GLfloat x, GLfloat y, GLfloat z );
glWindowPos3f!: alias function! [
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( const GLfloat *p );
glWindowPos3fv!: alias function! [
	p           [ pointer! [GLfloat!] ]
]
;@@ void ( GLint x, GLint y, GLint z );
glWindowPos3i!: alias function! [
	x           [ GLint! ]
	y           [ GLint! ]
	z           [ GLint! ]
]
;@@ void ( const GLint *p );
glWindowPos3iv!: alias function! [
	p           [ pointer! [GLint!] ]
]
;@@ void ( GLshort x, GLshort y, GLshort z );
glWindowPos3s!: alias function! [
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
]
;@@ void ( const GLshort *p );
glWindowPos3sv!: alias function! [
	p           [ GLshort-ptr! ]
]


;-------------------------------------------
;-- GL_VERSION_1_5
;-------------------------------------------

#define  GL_VERSION_1_5                               1
#define  GL_CURRENT_FOG_COORD                         GL_CURRENT_FOG_COORDINATE
#define  GL_FOG_COORD                                 GL_FOG_COORDINATE
#define  GL_FOG_COORD_ARRAY                           GL_FOG_COORDINATE_ARRAY
#define  GL_FOG_COORD_ARRAY_BUFFER_BINDING            GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING
#define  GL_FOG_COORD_ARRAY_POINTER                   GL_FOG_COORDINATE_ARRAY_POINTER
#define  GL_FOG_COORD_ARRAY_STRIDE                    GL_FOG_COORDINATE_ARRAY_STRIDE
#define  GL_FOG_COORD_ARRAY_TYPE                      GL_FOG_COORDINATE_ARRAY_TYPE
#define  GL_FOG_COORD_SRC                             GL_FOG_COORDINATE_SOURCE
#define  GL_SRC0_ALPHA                                GL_SOURCE0_ALPHA
#define  GL_SRC0_RGB                                  GL_SOURCE0_RGB
#define  GL_SRC1_ALPHA                                GL_SOURCE1_ALPHA
#define  GL_SRC1_RGB                                  GL_SOURCE1_RGB
#define  GL_SRC2_ALPHA                                GL_SOURCE2_ALPHA
#define  GL_SRC2_RGB                                  GL_SOURCE2_RGB
#define  GL_BUFFER_SIZE                               8764h
#define  GL_BUFFER_USAGE                              8765h
#define  GL_QUERY_COUNTER_BITS                        8864h
#define  GL_CURRENT_QUERY                             8865h
#define  GL_QUERY_RESULT                              8866h
#define  GL_QUERY_RESULT_AVAILABLE                    8867h
#define  GL_ARRAY_BUFFER                              8892h
#define  GL_ELEMENT_ARRAY_BUFFER                      8893h
#define  GL_ARRAY_BUFFER_BINDING                      8894h
#define  GL_ELEMENT_ARRAY_BUFFER_BINDING              8895h
#define  GL_VERTEX_ARRAY_BUFFER_BINDING               8896h
#define  GL_NORMAL_ARRAY_BUFFER_BINDING               8897h
#define  GL_COLOR_ARRAY_BUFFER_BINDING                8898h
#define  GL_INDEX_ARRAY_BUFFER_BINDING                8899h
#define  GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING        889Ah
#define  GL_EDGE_FLAG_ARRAY_BUFFER_BINDING            889Bh
#define  GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING      889Ch
#define  GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING       889Dh
#define  GL_WEIGHT_ARRAY_BUFFER_BINDING               889Eh
#define  GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING        889Fh
#define  GL_READ_ONLY                                 88B8h
#define  GL_WRITE_ONLY                                88B9h
#define  GL_READ_WRITE                                88BAh
#define  GL_BUFFER_ACCESS                             88BBh
#define  GL_BUFFER_MAPPED                             88BCh
#define  GL_BUFFER_MAP_POINTER                        88BDh
#define  GL_STREAM_DRAW                               88E0h
#define  GL_STREAM_READ                               88E1h
#define  GL_STREAM_COPY                               88E2h
#define  GL_STATIC_DRAW                               88E4h
#define  GL_STATIC_READ                               88E5h
#define  GL_STATIC_COPY                               88E6h
#define  GL_DYNAMIC_DRAW                              88E8h
#define  GL_DYNAMIC_READ                              88E9h
#define  GL_DYNAMIC_COPY                              88EAh
#define  GL_SAMPLES_PASSED                            8914h
;@@ void ( GLenum target, GLuint id );
glBeginQuery!: alias function! [
	target      [ GLenum! ]
	id          [ GLuint! ]
]
;@@ void ( GLenum target, GLuint buffer );
glBindBuffer!: alias function! [
	target      [ GLenum! ]
	buffer      [ GLuint! ]
]
;@@ void ( GLenum target, GLsizeiptr size, const void* data, GLenum usage );
glBufferData!: alias function! [
	target      [ GLenum! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
	usage       [ GLenum! ]
]
;@@ void ( GLenum target, GLintptr offset, GLsizeiptr size, const void* data );
glBufferSubData!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLsizei n, const GLuint* buffers );
glDeleteBuffers!: alias function! [
	n           [ GLsizei! ]
	buffers     [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, const GLuint* ids );
glDeleteQueries!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target );
glEndQuery!: alias function! [
	target      [ GLenum! ]
]
;@@ void ( GLsizei n, GLuint* buffers );
glGenBuffers!: alias function! [
	n           [ GLsizei! ]
	buffers     [ pointer! [GLuint!] ]
]
;@@ void ( GLsizei n, GLuint* ids );
glGenQueries!: alias function! [
	n           [ GLsizei! ]
	ids         [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetBufferParameteriv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, void** params );
glGetBufferPointerv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ binary-ptr! ]
]
;@@ void ( GLenum target, GLintptr offset, GLsizeiptr size, void* data );
glGetBufferSubData!: alias function! [
	target      [ GLenum! ]
	offset      [ GLintptr! ]
	size        [ GLsizeiptr! ]
	data        [ pointer! [byte!] ]
]
;@@ void ( GLuint id, GLenum pname, GLint* params );
glGetQueryObjectiv!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint id, GLenum pname, GLuint* params );
glGetQueryObjectuiv!: alias function! [
	id          [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetQueryiv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint buffer );
glIsBuffer!: alias function! [
	buffer      [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint id );
glIsQuery!: alias function! [
	id          [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void* ( GLenum target, GLenum access );
glMapBuffer!: alias function! [
	target      [ GLenum! ]
	access      [ GLenum! ]
	return: [ pointer! [byte!] ]

]
;@@ GLboolean ( GLenum target );
glUnmapBuffer!: alias function! [
	target      [ GLenum! ]
	return: [ GLboolean! ]

]


;-------------------------------------------
;-- GL_VERSION_2_0
;-------------------------------------------

#define  GL_VERSION_2_0                               1
#define  GL_BLEND_EQUATION_RGB                        GL_BLEND_EQUATION
#define  GL_VERTEX_ATTRIB_ARRAY_ENABLED               8622h
#define  GL_VERTEX_ATTRIB_ARRAY_SIZE                  8623h
#define  GL_VERTEX_ATTRIB_ARRAY_STRIDE                8624h
#define  GL_VERTEX_ATTRIB_ARRAY_TYPE                  8625h
#define  GL_CURRENT_VERTEX_ATTRIB                     8626h
#define  GL_VERTEX_PROGRAM_POINT_SIZE                 8642h
#define  GL_VERTEX_PROGRAM_TWO_SIDE                   8643h
#define  GL_VERTEX_ATTRIB_ARRAY_POINTER               8645h
#define  GL_STENCIL_BACK_FUNC                         8800h
#define  GL_STENCIL_BACK_FAIL                         8801h
#define  GL_STENCIL_BACK_PASS_DEPTH_FAIL              8802h
#define  GL_STENCIL_BACK_PASS_DEPTH_PASS              8803h
#define  GL_MAX_DRAW_BUFFERS                          8824h
#define  GL_DRAW_BUFFER0                              8825h
#define  GL_DRAW_BUFFER1                              8826h
#define  GL_DRAW_BUFFER2                              8827h
#define  GL_DRAW_BUFFER3                              8828h
#define  GL_DRAW_BUFFER4                              8829h
#define  GL_DRAW_BUFFER5                              882Ah
#define  GL_DRAW_BUFFER6                              882Bh
#define  GL_DRAW_BUFFER7                              882Ch
#define  GL_DRAW_BUFFER8                              882Dh
#define  GL_DRAW_BUFFER9                              882Eh
#define  GL_DRAW_BUFFER10                             882Fh
#define  GL_DRAW_BUFFER11                             8830h
#define  GL_DRAW_BUFFER12                             8831h
#define  GL_DRAW_BUFFER13                             8832h
#define  GL_DRAW_BUFFER14                             8833h
#define  GL_DRAW_BUFFER15                             8834h
#define  GL_BLEND_EQUATION_ALPHA                      883Dh
#define  GL_POINT_SPRITE                              8861h
#define  GL_COORD_REPLACE                             8862h
#define  GL_MAX_VERTEX_ATTRIBS                        8869h
#define  GL_VERTEX_ATTRIB_ARRAY_NORMALIZED            886Ah
#define  GL_MAX_TEXTURE_COORDS                        8871h
#define  GL_MAX_TEXTURE_IMAGE_UNITS                   8872h
#define  GL_FRAGMENT_SHADER                           8B30h
#define  GL_VERTEX_SHADER                             8B31h
#define  GL_MAX_FRAGMENT_UNIFORM_COMPONENTS           8B49h
#define  GL_MAX_VERTEX_UNIFORM_COMPONENTS             8B4Ah
#define  GL_MAX_VARYING_FLOATS                        8B4Bh
#define  GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS            8B4Ch
#define  GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS          8B4Dh
#define  GL_SHADER_TYPE                               8B4Fh
#define  GL_FLOAT_VEC2                                8B50h
#define  GL_FLOAT_VEC3                                8B51h
#define  GL_FLOAT_VEC4                                8B52h
#define  GL_INT_VEC2                                  8B53h
#define  GL_INT_VEC3                                  8B54h
#define  GL_INT_VEC4                                  8B55h
#define  GL_BOOL                                      8B56h
#define  GL_BOOL_VEC2                                 8B57h
#define  GL_BOOL_VEC3                                 8B58h
#define  GL_BOOL_VEC4                                 8B59h
#define  GL_FLOAT_MAT2                                8B5Ah
#define  GL_FLOAT_MAT3                                8B5Bh
#define  GL_FLOAT_MAT4                                8B5Ch
#define  GL_SAMPLER_1D                                8B5Dh
#define  GL_SAMPLER_2D                                8B5Eh
#define  GL_SAMPLER_3D                                8B5Fh
#define  GL_SAMPLER_CUBE                              8B60h
#define  GL_SAMPLER_1D_SHADOW                         8B61h
#define  GL_SAMPLER_2D_SHADOW                         8B62h
#define  GL_DELETE_STATUS                             8B80h
#define  GL_COMPILE_STATUS                            8B81h
#define  GL_LINK_STATUS                               8B82h
#define  GL_VALIDATE_STATUS                           8B83h
#define  GL_INFO_LOG_LENGTH                           8B84h
#define  GL_ATTACHED_SHADERS                          8B85h
#define  GL_ACTIVE_UNIFORMS                           8B86h
#define  GL_ACTIVE_UNIFORM_MAX_LENGTH                 8B87h
#define  GL_SHADER_SOURCE_LENGTH                      8B88h
#define  GL_ACTIVE_ATTRIBUTES                         8B89h
#define  GL_ACTIVE_ATTRIBUTE_MAX_LENGTH               8B8Ah
#define  GL_FRAGMENT_SHADER_DERIVATIVE_HINT           8B8Bh
#define  GL_SHADING_LANGUAGE_VERSION                  8B8Ch
#define  GL_CURRENT_PROGRAM                           8B8Dh
#define  GL_POINT_SPRITE_COORD_ORIGIN                 8CA0h
#define  GL_LOWER_LEFT                                8CA1h
#define  GL_UPPER_LEFT                                8CA2h
#define  GL_STENCIL_BACK_REF                          8CA3h
#define  GL_STENCIL_BACK_VALUE_MASK                   8CA4h
#define  GL_STENCIL_BACK_WRITEMASK                    8CA5h
;@@ void ( GLuint program, GLuint shader );
glAttachShader!: alias function! [
	program     [ GLuint! ]
	shader      [ GLuint! ]
]
;@@ void ( GLuint program, GLuint index, const GLchar* name );
glBindAttribLocation!: alias function! [
	program     [ GLuint! ]
	index       [ GLuint! ]
	name        [ GLstring! ]
]
;@@ void ( GLenum modeRGB, GLenum modeAlpha );
glBlendEquationSeparate!: alias function! [
	modeRGB     [ GLenum! ]
	modeAlpha   [ GLenum! ]
]
;@@ void ( GLuint shader );
glCompileShader!: alias function! [
	shader      [ GLuint! ]
]
;@@ GLuint ( void );
glCreateProgram!: alias function! [
	return: [ GLuint! ]

]
;@@ GLuint ( GLenum type );
glCreateShader!: alias function! [
	type        [ GLenum! ]
	return: [ GLuint! ]

]
;@@ void ( GLuint program );
glDeleteProgram!: alias function! [
	program     [ GLuint! ]
]
;@@ void ( GLuint shader );
glDeleteShader!: alias function! [
	shader      [ GLuint! ]
]
;@@ void ( GLuint program, GLuint shader );
glDetachShader!: alias function! [
	program     [ GLuint! ]
	shader      [ GLuint! ]
]
;@@ void ( GLuint index );
glDisableVertexAttribArray!: alias function! [
	index       [ GLuint! ]
]
;@@ void ( GLsizei n, const GLenum* bufs );
glDrawBuffers!: alias function! [
	n           [ GLsizei! ]
	bufs        [ pointer! [GLenum!] ]
]
;@@ void ( GLuint index );
glEnableVertexAttribArray!: alias function! [
	index       [ GLuint! ]
]
;@@ void ( GLuint program, GLuint index, GLsizei maxLength, GLsizei* length, GLint* size, GLenum* type, GLchar* name );
glGetActiveAttrib!: alias function! [
	program     [ GLuint! ]
	index       [ GLuint! ]
	maxLength   [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	size        [ pointer! [GLint!] ]
	type        [ pointer! [GLenum!] ]
	name        [ GLstring! ]
]
;@@ void ( GLuint program, GLuint index, GLsizei maxLength, GLsizei* length, GLint* size, GLenum* type, GLchar* name );
glGetActiveUniform!: alias function! [
	program     [ GLuint! ]
	index       [ GLuint! ]
	maxLength   [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	size        [ pointer! [GLint!] ]
	type        [ pointer! [GLenum!] ]
	name        [ GLstring! ]
]
;@@ void ( GLuint program, GLsizei maxCount, GLsizei* count, GLuint* shaders );
glGetAttachedShaders!: alias function! [
	program     [ GLuint! ]
	maxCount    [ GLsizei! ]
	count       [ pointer! [GLsizei!] ]
	shaders     [ pointer! [GLuint!] ]
]
;@@ GLint ( GLuint program, const GLchar* name );
glGetAttribLocation!: alias function! [
	program     [ GLuint! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]
;@@ void ( GLuint program, GLsizei bufSize, GLsizei* length, GLchar* infoLog );
glGetProgramInfoLog!: alias function! [
	program     [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	infoLog     [ GLstring! ]
]
;@@ void ( GLuint program, GLenum pname, GLint* param );
glGetProgramiv!: alias function! [
	program     [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ void ( GLuint shader, GLsizei bufSize, GLsizei* length, GLchar* infoLog );
glGetShaderInfoLog!: alias function! [
	shader      [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	infoLog     [ GLstring! ]
]
;@@ void ( GLuint obj, GLsizei maxLength, GLsizei* length, GLchar* source );
glGetShaderSource!: alias function! [
	obj         [ GLuint! ]
	maxLength   [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	source      [ GLstring! ]
]
;@@ void ( GLuint shader, GLenum pname, GLint* param );
glGetShaderiv!: alias function! [
	shader      [ GLuint! ]
	pname       [ GLenum! ]
	param       [ pointer! [GLint!] ]
]
;@@ GLint ( GLuint program, const GLchar* name );
glGetUniformLocation!: alias function! [
	program     [ GLuint! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]
;@@ void ( GLuint program, GLint location, GLfloat* params );
glGetUniformfv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program, GLint location, GLint* params );
glGetUniformiv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLenum pname, void** pointer );
glGetVertexAttribPointerv!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	pointer     [ binary-ptr! ]
]
;@@ void ( GLuint index, GLenum pname, GLdouble* params );
glGetVertexAttribdv!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLenum pname, GLfloat* params );
glGetVertexAttribfv!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLenum pname, GLint* params );
glGetVertexAttribiv!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ GLboolean ( GLuint program );
glIsProgram!: alias function! [
	program     [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ GLboolean ( GLuint shader );
glIsShader!: alias function! [
	shader      [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLuint program );
glLinkProgram!: alias function! [
	program     [ GLuint! ]
]
;@@ void ( GLuint shader, GLsizei count, const GLchar *const* string, const GLint* length );
glShaderSource!: alias function! [
	shader      [ GLuint! ]
	count       [ GLsizei! ]
	string      [ GLstring-ptr! ]
	length      [ pointer! [GLint!] ]
]
;@@ void ( GLenum frontfunc, GLenum backfunc, GLint ref, GLuint mask );
glStencilFuncSeparate!: alias function! [
	frontfunc   [ GLenum! ]
	backfunc    [ GLenum! ]
	ref         [ GLint! ]
	mask        [ GLuint! ]
]
;@@ void ( GLenum face, GLuint mask );
glStencilMaskSeparate!: alias function! [
	face        [ GLenum! ]
	mask        [ GLuint! ]
]
;@@ void ( GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass );
glStencilOpSeparate!: alias function! [
	face        [ GLenum! ]
	sfail       [ GLenum! ]
	dpfail      [ GLenum! ]
	dppass      [ GLenum! ]
]
;@@ void ( GLint location, GLfloat v0 );
glUniform1f!: alias function! [
	location    [ GLint! ]
	v0          [ GLfloat! ]
]
;@@ void ( GLint location, GLsizei count, const GLfloat* value );
glUniform1fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLint v0 );
glUniform1i!: alias function! [
	location    [ GLint! ]
	v0          [ GLint! ]
]
;@@ void ( GLint location, GLsizei count, const GLint* value );
glUniform1iv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLint location, GLfloat v0, GLfloat v1 );
glUniform2f!: alias function! [
	location    [ GLint! ]
	v0          [ GLfloat! ]
	v1          [ GLfloat! ]
]
;@@ void ( GLint location, GLsizei count, const GLfloat* value );
glUniform2fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLint v0, GLint v1 );
glUniform2i!: alias function! [
	location    [ GLint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
]
;@@ void ( GLint location, GLsizei count, const GLint* value );
glUniform2iv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLint location, GLfloat v0, GLfloat v1, GLfloat v2 );
glUniform3f!: alias function! [
	location    [ GLint! ]
	v0          [ GLfloat! ]
	v1          [ GLfloat! ]
	v2          [ GLfloat! ]
]
;@@ void ( GLint location, GLsizei count, const GLfloat* value );
glUniform3fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLint v0, GLint v1, GLint v2 );
glUniform3i!: alias function! [
	location    [ GLint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
	v2          [ GLint! ]
]
;@@ void ( GLint location, GLsizei count, const GLint* value );
glUniform3iv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3 );
glUniform4f!: alias function! [
	location    [ GLint! ]
	v0          [ GLfloat! ]
	v1          [ GLfloat! ]
	v2          [ GLfloat! ]
	v3          [ GLfloat! ]
]
;@@ void ( GLint location, GLsizei count, const GLfloat* value );
glUniform4fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLint v0, GLint v1, GLint v2, GLint v3 );
glUniform4i!: alias function! [
	location    [ GLint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
	v2          [ GLint! ]
	v3          [ GLint! ]
]
;@@ void ( GLint location, GLsizei count, const GLint* value );
glUniform4iv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix2fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix3fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat* value );
glUniformMatrix4fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint program );
glUseProgram!: alias function! [
	program     [ GLuint! ]
]
;@@ void ( GLuint program );
glValidateProgram!: alias function! [
	program     [ GLuint! ]
]
;@@ void ( GLuint index, GLdouble x );
glVertexAttrib1d!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib1dv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x );
glVertexAttrib1f!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib1fv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLshort x );
glVertexAttrib1s!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib1sv!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y );
glVertexAttrib2d!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib2dv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y );
glVertexAttrib2f!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib2fv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLshort x, GLshort y );
glVertexAttrib2s!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib2sv!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y, GLdouble z );
glVertexAttrib3d!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib3dv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y, GLfloat z );
glVertexAttrib3f!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib3fv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, GLshort x, GLshort y, GLshort z );
glVertexAttrib3s!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib3sv!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, const GLbyte* v );
glVertexAttrib4Nbv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLbyte!] ]
]
;@@ void ( GLuint index, const GLint* v );
glVertexAttrib4Niv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib4Nsv!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w );
glVertexAttrib4Nub!: alias function! [
	index       [ GLuint! ]
	x           [ GLubyte! ]
	y           [ GLubyte! ]
	z           [ GLubyte! ]
	w           [ GLubyte! ]
]
;@@ void ( GLuint index, const GLubyte* v );
glVertexAttrib4Nubv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint index, const GLuint* v );
glVertexAttrib4Nuiv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, const GLushort* v );
glVertexAttrib4Nusv!: alias function! [
	index       [ GLuint! ]
	v           [ GLushort-ptr! ]
]
;@@ void ( GLuint index, const GLbyte* v );
glVertexAttrib4bv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLbyte!] ]
]
;@@ void ( GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w );
glVertexAttrib4d!: alias function! [
	index       [ GLuint! ]
	x           [ GLdouble! ]
	y           [ GLdouble! ]
	z           [ GLdouble! ]
	w           [ GLdouble! ]
]
;@@ void ( GLuint index, const GLdouble* v );
glVertexAttrib4dv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLdouble!] ]
]
;@@ void ( GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
glVertexAttrib4f!: alias function! [
	index       [ GLuint! ]
	x           [ GLfloat! ]
	y           [ GLfloat! ]
	z           [ GLfloat! ]
	w           [ GLfloat! ]
]
;@@ void ( GLuint index, const GLfloat* v );
glVertexAttrib4fv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLfloat!] ]
]
;@@ void ( GLuint index, const GLint* v );
glVertexAttrib4iv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLshort x, GLshort y, GLshort z, GLshort w );
glVertexAttrib4s!: alias function! [
	index       [ GLuint! ]
	x           [ GLshort! ]
	y           [ GLshort! ]
	z           [ GLshort! ]
	w           [ GLshort! ]
]
;@@ void ( GLuint index, const GLshort* v );
glVertexAttrib4sv!: alias function! [
	index       [ GLuint! ]
	v           [ GLshort-ptr! ]
]
;@@ void ( GLuint index, const GLubyte* v );
glVertexAttrib4ubv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint index, const GLuint* v );
glVertexAttrib4uiv!: alias function! [
	index       [ GLuint! ]
	v           [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, const GLushort* v );
glVertexAttrib4usv!: alias function! [
	index       [ GLuint! ]
	v           [ GLushort-ptr! ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const void* pointer );
glVertexAttribPointer!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	normalized  [ GLboolean! ]
	stride      [ GLsizei! ]
	pointer     [ integer! ] ;-- some legacy API cruft required this to be pointer, but we can avoid it - it is just an offset
]


;-------------------------------------------
;-- GL_VERSION_2_1
;-------------------------------------------

#define  GL_VERSION_2_1                               1
#define  GL_CURRENT_RASTER_SECONDARY_COLOR            845Fh
#define  GL_PIXEL_PACK_BUFFER                         88EBh
#define  GL_PIXEL_UNPACK_BUFFER                       88ECh
#define  GL_PIXEL_PACK_BUFFER_BINDING                 88EDh
#define  GL_PIXEL_UNPACK_BUFFER_BINDING               88EFh
#define  GL_FLOAT_MAT2x3                              8B65h
#define  GL_FLOAT_MAT2x4                              8B66h
#define  GL_FLOAT_MAT3x2                              8B67h
#define  GL_FLOAT_MAT3x4                              8B68h
#define  GL_FLOAT_MAT4x2                              8B69h
#define  GL_FLOAT_MAT4x3                              8B6Ah
#define  GL_SRGB                                      8C40h
#define  GL_SRGB8                                     8C41h
#define  GL_SRGB_ALPHA                                8C42h
#define  GL_SRGB8_ALPHA8                              8C43h
#define  GL_SLUMINANCE_ALPHA                          8C44h
#define  GL_SLUMINANCE8_ALPHA8                        8C45h
#define  GL_SLUMINANCE                                8C46h
#define  GL_SLUMINANCE8                               8C47h
#define  GL_COMPRESSED_SRGB                           8C48h
#define  GL_COMPRESSED_SRGB_ALPHA                     8C49h
#define  GL_COMPRESSED_SLUMINANCE                     8C4Ah
#define  GL_COMPRESSED_SLUMINANCE_ALPHA               8C4Bh
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat *value );
glUniformMatrix2x3fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat *value );
glUniformMatrix2x4fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat *value );
glUniformMatrix3x2fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat *value );
glUniformMatrix3x4fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat *value );
glUniformMatrix4x2fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLint location, GLsizei count, GLboolean transpose, const GLfloat *value );
glUniformMatrix4x3fv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	transpose   [ GLboolean! ]
	value       [ pointer! [GLfloat!] ]
]


;-------------------------------------------
;-- GL_VERSION_3_0
;-------------------------------------------

#define  GL_VERSION_3_0                               1
#define  GL_CLIP_DISTANCE0                            GL_CLIP_PLANE0
#define  GL_CLIP_DISTANCE1                            GL_CLIP_PLANE1
#define  GL_CLIP_DISTANCE2                            GL_CLIP_PLANE2
#define  GL_CLIP_DISTANCE3                            GL_CLIP_PLANE3
#define  GL_CLIP_DISTANCE4                            GL_CLIP_PLANE4
#define  GL_CLIP_DISTANCE5                            GL_CLIP_PLANE5
#define  GL_COMPARE_REF_TO_TEXTURE                    GL_COMPARE_R_TO_TEXTURE_ARB
#define  GL_MAX_CLIP_DISTANCES                        GL_MAX_CLIP_PLANES
#define  GL_MAX_VARYING_COMPONENTS                    GL_MAX_VARYING_FLOATS
#define  GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT       0001h
#define  GL_MAJOR_VERSION                             821Bh
#define  GL_MINOR_VERSION                             821Ch
#define  GL_NUM_EXTENSIONS                            821Dh
#define  GL_CONTEXT_FLAGS                             821Eh
#define  GL_DEPTH_BUFFER                              8223h
#define  GL_STENCIL_BUFFER                            8224h
#define  GL_RGBA32F                                   8814h
#define  GL_RGB32F                                    8815h
#define  GL_RGBA16F                                   881Ah
#define  GL_RGB16F                                    881Bh
#define  GL_VERTEX_ATTRIB_ARRAY_INTEGER               88FDh
#define  GL_MAX_ARRAY_TEXTURE_LAYERS                  88FFh
#define  GL_MIN_PROGRAM_TEXEL_OFFSET                  8904h
#define  GL_MAX_PROGRAM_TEXEL_OFFSET                  8905h
#define  GL_CLAMP_VERTEX_COLOR                        891Ah
#define  GL_CLAMP_FRAGMENT_COLOR                      891Bh
#define  GL_CLAMP_READ_COLOR                          891Ch
#define  GL_FIXED_ONLY                                891Dh
#define  GL_TEXTURE_RED_TYPE                          8C10h
#define  GL_TEXTURE_GREEN_TYPE                        8C11h
#define  GL_TEXTURE_BLUE_TYPE                         8C12h
#define  GL_TEXTURE_ALPHA_TYPE                        8C13h
#define  GL_TEXTURE_LUMINANCE_TYPE                    8C14h
#define  GL_TEXTURE_INTENSITY_TYPE                    8C15h
#define  GL_TEXTURE_DEPTH_TYPE                        8C16h
#define  GL_TEXTURE_1D_ARRAY                          8C18h
#define  GL_PROXY_TEXTURE_1D_ARRAY                    8C19h
#define  GL_TEXTURE_2D_ARRAY                          8C1Ah
#define  GL_PROXY_TEXTURE_2D_ARRAY                    8C1Bh
#define  GL_TEXTURE_BINDING_1D_ARRAY                  8C1Ch
#define  GL_TEXTURE_BINDING_2D_ARRAY                  8C1Dh
#define  GL_R11F_G11F_B10F                            8C3Ah
#define  GL_UNSIGNED_INT_10F_11F_11F_REV              8C3Bh
#define  GL_RGB9_E5                                   8C3Dh
#define  GL_UNSIGNED_INT_5_9_9_9_REV                  8C3Eh
#define  GL_TEXTURE_SHARED_SIZE                       8C3Fh
#define  GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH     8C76h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_MODE            8C7Fh
#define  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS  8C80h
#define  GL_TRANSFORM_FEEDBACK_VARYINGS               8C83h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_START           8C84h
#define  GL_TRANSFORM_FEEDBACK_BUFFER_SIZE            8C85h
#define  GL_PRIMITIVES_GENERATED                      8C87h
#define  GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN     8C88h
#define  GL_RASTERIZER_DISCARD                        8C89h
#define  GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS  8C8Ah
#define  GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS   8C8Bh
#define  GL_INTERLEAVED_ATTRIBS                       8C8Ch
#define  GL_SEPARATE_ATTRIBS                          8C8Dh
#define  GL_TRANSFORM_FEEDBACK_BUFFER                 8C8Eh
#define  GL_TRANSFORM_FEEDBACK_BUFFER_BINDING         8C8Fh
#define  GL_RGBA32UI                                  8D70h
#define  GL_RGB32UI                                   8D71h
#define  GL_RGBA16UI                                  8D76h
#define  GL_RGB16UI                                   8D77h
#define  GL_RGBA8UI                                   8D7Ch
#define  GL_RGB8UI                                    8D7Dh
#define  GL_RGBA32I                                   8D82h
#define  GL_RGB32I                                    8D83h
#define  GL_RGBA16I                                   8D88h
#define  GL_RGB16I                                    8D89h
#define  GL_RGBA8I                                    8D8Eh
#define  GL_RGB8I                                     8D8Fh
#define  GL_RED_INTEGER                               8D94h
#define  GL_GREEN_INTEGER                             8D95h
#define  GL_BLUE_INTEGER                              8D96h
#define  GL_ALPHA_INTEGER                             8D97h
#define  GL_RGB_INTEGER                               8D98h
#define  GL_RGBA_INTEGER                              8D99h
#define  GL_BGR_INTEGER                               8D9Ah
#define  GL_BGRA_INTEGER                              8D9Bh
#define  GL_SAMPLER_1D_ARRAY                          8DC0h
#define  GL_SAMPLER_2D_ARRAY                          8DC1h
#define  GL_SAMPLER_1D_ARRAY_SHADOW                   8DC3h
#define  GL_SAMPLER_2D_ARRAY_SHADOW                   8DC4h
#define  GL_SAMPLER_CUBE_SHADOW                       8DC5h
#define  GL_UNSIGNED_INT_VEC2                         8DC6h
#define  GL_UNSIGNED_INT_VEC3                         8DC7h
#define  GL_UNSIGNED_INT_VEC4                         8DC8h
#define  GL_INT_SAMPLER_1D                            8DC9h
#define  GL_INT_SAMPLER_2D                            8DCAh
#define  GL_INT_SAMPLER_3D                            8DCBh
#define  GL_INT_SAMPLER_CUBE                          8DCCh
#define  GL_INT_SAMPLER_1D_ARRAY                      8DCEh
#define  GL_INT_SAMPLER_2D_ARRAY                      8DCFh
#define  GL_UNSIGNED_INT_SAMPLER_1D                   8DD1h
#define  GL_UNSIGNED_INT_SAMPLER_2D                   8DD2h
#define  GL_UNSIGNED_INT_SAMPLER_3D                   8DD3h
#define  GL_UNSIGNED_INT_SAMPLER_CUBE                 8DD4h
#define  GL_UNSIGNED_INT_SAMPLER_1D_ARRAY             8DD6h
#define  GL_UNSIGNED_INT_SAMPLER_2D_ARRAY             8DD7h
#define  GL_QUERY_WAIT                                8E13h
#define  GL_QUERY_NO_WAIT                             8E14h
#define  GL_QUERY_BY_REGION_WAIT                      8E15h
#define  GL_QUERY_BY_REGION_NO_WAIT                   8E16h
;@@ void ( GLuint id, GLenum mode );
glBeginConditionalRender!: alias function! [
	id          [ GLuint! ]
	mode        [ GLenum! ]
]
;@@ void ( GLenum primitiveMode );
glBeginTransformFeedback!: alias function! [
	primitiveMode [ GLenum! ]
]
;@@ void ( GLuint program, GLuint colorNumber, const GLchar* name );
glBindFragDataLocation!: alias function! [
	program     [ GLuint! ]
	colorNumber [ GLuint! ]
	name        [ GLstring! ]
]
;@@ void ( GLenum target, GLenum clamp );
glClampColor!: alias function! [
	target      [ GLenum! ]
	clamp       [ GLenum! ]
]
;@@ void ( GLenum buffer, GLint drawBuffer, GLfloat depth, GLint stencil );
glClearBufferfi!: alias function! [
	buffer      [ GLenum! ]
	drawBuffer  [ GLint! ]
	depth       [ GLfloat! ]
	stencil     [ GLint! ]
]
;@@ void ( GLenum buffer, GLint drawBuffer, const GLfloat* value );
glClearBufferfv!: alias function! [
	buffer      [ GLenum! ]
	drawBuffer  [ GLint! ]
	value       [ pointer! [GLfloat!] ]
]
;@@ void ( GLenum buffer, GLint drawBuffer, const GLint* value );
glClearBufferiv!: alias function! [
	buffer      [ GLenum! ]
	drawBuffer  [ GLint! ]
	value       [ pointer! [GLint!] ]
]
;@@ void ( GLenum buffer, GLint drawBuffer, const GLuint* value );
glClearBufferuiv!: alias function! [
	buffer      [ GLenum! ]
	drawBuffer  [ GLint! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint buf, GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha );
glColorMaski!: alias function! [
	buf         [ GLuint! ]
	red         [ GLboolean! ]
	green       [ GLboolean! ]
	blue        [ GLboolean! ]
	alpha       [ GLboolean! ]
]
;@@ void ( GLenum cap, GLuint index );
glDisablei!: alias function! [
	cap         [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( GLenum cap, GLuint index );
glEnablei!: alias function! [
	cap         [ GLenum! ]
	index       [ GLuint! ]
]
;@@ void ( void );
glEndConditionalRender!: alias function! [
]
;@@ void ( void );
glEndTransformFeedback!: alias function! [
]
;@@ void ( GLenum pname, GLuint index, GLboolean* data );
glGetBooleani_v!: alias function! [
	pname       [ GLenum! ]
	index       [ GLuint! ]
	data        [ pointer! [integer!] ]
]
;@@ GLint ( GLuint program, const GLchar* name );
glGetFragDataLocation!: alias function! [
	program     [ GLuint! ]
	name        [ GLstring! ]
	return: [ GLint! ]

]
;@@ const GLubyte* ( GLenum name, GLuint index );
glGetStringi!: alias function! [
	name        [ GLenum! ]
	index       [ GLuint! ]
	return: [ c-string! ]

]
;@@ void ( GLenum target, GLenum pname, GLint* params );
glGetTexParameterIiv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, GLuint* params );
glGetTexParameterIuiv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLuint index, GLsizei bufSize, GLsizei * length, GLsizei * size, GLenum * type, GLchar * name );
glGetTransformFeedbackVarying!: alias function! [
	program     [ GLuint! ]
	index       [ GLuint! ]
	bufSize     [ GLsizei! ]
	length      [ pointer! [GLsizei!] ]
	size        [ pointer! [GLsizei!] ]
	type        [ pointer! [GLenum!] ]
	name        [ GLstring! ]
]
;@@ void ( GLuint program, GLint location, GLuint* params );
glGetUniformuiv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLenum pname, GLint* params );
glGetVertexAttribIiv!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLenum pname, GLuint* params );
glGetVertexAttribIuiv!: alias function! [
	index       [ GLuint! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ GLboolean ( GLenum cap, GLuint index );
glIsEnabledi!: alias function! [
	cap         [ GLenum! ]
	index       [ GLuint! ]
	return: [ GLboolean! ]

]
;@@ void ( GLenum target, GLenum pname, const GLint* params );
glTexParameterIiv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLint!] ]
]
;@@ void ( GLenum target, GLenum pname, const GLuint* params );
glTexParameterIuiv!: alias function! [
	target      [ GLenum! ]
	pname       [ GLenum! ]
	params      [ pointer! [GLuint!] ]
]
;@@ void ( GLuint program, GLsizei count, const GLchar *const* varyings, GLenum bufferMode );
glTransformFeedbackVaryings!: alias function! [
	program     [ GLuint! ]
	count       [ GLsizei! ]
	varyings    [ GLstring-ptr! ]
	bufferMode  [ GLenum! ]
]
;@@ void ( GLint location, GLuint v0 );
glUniform1ui!: alias function! [
	location    [ GLint! ]
	v0          [ GLuint! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint* value );
glUniform1uiv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLint location, GLuint v0, GLuint v1 );
glUniform2ui!: alias function! [
	location    [ GLint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint* value );
glUniform2uiv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLint location, GLuint v0, GLuint v1, GLuint v2 );
glUniform3ui!: alias function! [
	location    [ GLint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
	v2          [ GLuint! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint* value );
glUniform3uiv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3 );
glUniform4ui!: alias function! [
	location    [ GLint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
	v2          [ GLuint! ]
	v3          [ GLuint! ]
]
;@@ void ( GLint location, GLsizei count, const GLuint* value );
glUniform4uiv!: alias function! [
	location    [ GLint! ]
	count       [ GLsizei! ]
	value       [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLint v0 );
glVertexAttribI1i!: alias function! [
	index       [ GLuint! ]
	v0          [ GLint! ]
]
;@@ void ( GLuint index, const GLint* v0 );
glVertexAttribI1iv!: alias function! [
	index       [ GLuint! ]
	v0          [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLuint v0 );
glVertexAttribI1ui!: alias function! [
	index       [ GLuint! ]
	v0          [ GLuint! ]
]
;@@ void ( GLuint index, const GLuint* v0 );
glVertexAttribI1uiv!: alias function! [
	index       [ GLuint! ]
	v0          [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLint v0, GLint v1 );
glVertexAttribI2i!: alias function! [
	index       [ GLuint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
]
;@@ void ( GLuint index, const GLint* v0 );
glVertexAttribI2iv!: alias function! [
	index       [ GLuint! ]
	v0          [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLuint v0, GLuint v1 );
glVertexAttribI2ui!: alias function! [
	index       [ GLuint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
]
;@@ void ( GLuint index, const GLuint* v0 );
glVertexAttribI2uiv!: alias function! [
	index       [ GLuint! ]
	v0          [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, GLint v0, GLint v1, GLint v2 );
glVertexAttribI3i!: alias function! [
	index       [ GLuint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
	v2          [ GLint! ]
]
;@@ void ( GLuint index, const GLint* v0 );
glVertexAttribI3iv!: alias function! [
	index       [ GLuint! ]
	v0          [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, GLuint v0, GLuint v1, GLuint v2 );
glVertexAttribI3ui!: alias function! [
	index       [ GLuint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
	v2          [ GLuint! ]
]
;@@ void ( GLuint index, const GLuint* v0 );
glVertexAttribI3uiv!: alias function! [
	index       [ GLuint! ]
	v0          [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, const GLbyte* v0 );
glVertexAttribI4bv!: alias function! [
	index       [ GLuint! ]
	v0          [ pointer! [GLbyte!] ]
]
;@@ void ( GLuint index, GLint v0, GLint v1, GLint v2, GLint v3 );
glVertexAttribI4i!: alias function! [
	index       [ GLuint! ]
	v0          [ GLint! ]
	v1          [ GLint! ]
	v2          [ GLint! ]
	v3          [ GLint! ]
]
;@@ void ( GLuint index, const GLint* v0 );
glVertexAttribI4iv!: alias function! [
	index       [ GLuint! ]
	v0          [ pointer! [GLint!] ]
]
;@@ void ( GLuint index, const GLshort* v0 );
glVertexAttribI4sv!: alias function! [
	index       [ GLuint! ]
	v0          [ GLshort-ptr! ]
]
;@@ void ( GLuint index, const GLubyte* v0 );
glVertexAttribI4ubv!: alias function! [
	index       [ GLuint! ]
	v0          [ pointer! [GLubyte!] ]
]
;@@ void ( GLuint index, GLuint v0, GLuint v1, GLuint v2, GLuint v3 );
glVertexAttribI4ui!: alias function! [
	index       [ GLuint! ]
	v0          [ GLuint! ]
	v1          [ GLuint! ]
	v2          [ GLuint! ]
	v3          [ GLuint! ]
]
;@@ void ( GLuint index, const GLuint* v0 );
glVertexAttribI4uiv!: alias function! [
	index       [ GLuint! ]
	v0          [ pointer! [GLuint!] ]
]
;@@ void ( GLuint index, const GLushort* v0 );
glVertexAttribI4usv!: alias function! [
	index       [ GLuint! ]
	v0          [ GLushort-ptr! ]
]
;@@ void ( GLuint index, GLint size, GLenum type, GLsizei stride, const void*pointer );
glVertexAttribIPointer!: alias function! [
	index       [ GLuint! ]
	size        [ GLint! ]
	type        [ GLenum! ]
	stride      [ GLsizei! ]
	pointer     [ pointer! [byte!] ]
]


;-------------------------------------------
;-- GL_VERSION_3_1
;-------------------------------------------

#define  GL_VERSION_3_1                               1
#define  GL_TEXTURE_RECTANGLE                         84F5h
#define  GL_TEXTURE_BINDING_RECTANGLE                 84F6h
#define  GL_PROXY_TEXTURE_RECTANGLE                   84F7h
#define  GL_MAX_RECTANGLE_TEXTURE_SIZE                84F8h
#define  GL_SAMPLER_2D_RECT                           8B63h
#define  GL_SAMPLER_2D_RECT_SHADOW                    8B64h
#define  GL_TEXTURE_BUFFER                            8C2Ah
#define  GL_MAX_TEXTURE_BUFFER_SIZE                   8C2Bh
#define  GL_TEXTURE_BINDING_BUFFER                    8C2Ch
#define  GL_TEXTURE_BUFFER_DATA_STORE_BINDING         8C2Dh
#define  GL_TEXTURE_BUFFER_FORMAT                     8C2Eh
#define  GL_SAMPLER_BUFFER                            8DC2h
#define  GL_INT_SAMPLER_2D_RECT                       8DCDh
#define  GL_INT_SAMPLER_BUFFER                        8DD0h
#define  GL_UNSIGNED_INT_SAMPLER_2D_RECT              8DD5h
#define  GL_UNSIGNED_INT_SAMPLER_BUFFER               8DD8h
#define  GL_RED_SNORM                                 8F90h
#define  GL_RG_SNORM                                  8F91h
#define  GL_RGB_SNORM                                 8F92h
#define  GL_RGBA_SNORM                                8F93h
#define  GL_R8_SNORM                                  8F94h
#define  GL_RG8_SNORM                                 8F95h
#define  GL_RGB8_SNORM                                8F96h
#define  GL_RGBA8_SNORM                               8F97h
#define  GL_R16_SNORM                                 8F98h
#define  GL_RG16_SNORM                                8F99h
#define  GL_RGB16_SNORM                               8F9Ah
#define  GL_RGBA16_SNORM                              8F9Bh
#define  GL_SIGNED_NORMALIZED                         8F9Ch
#define  GL_PRIMITIVE_RESTART                         8F9Dh
#define  GL_PRIMITIVE_RESTART_INDEX                   8F9Eh
#define  GL_BUFFER_ACCESS_FLAGS                       911Fh
#define  GL_BUFFER_MAP_LENGTH                         9120h
#define  GL_BUFFER_MAP_OFFSET                         9121h
;@@ void ( GLenum mode, GLint first, GLsizei count, GLsizei primcount );
glDrawArraysInstanced!: alias function! [
	mode        [ GLenum! ]
	first       [ GLint! ]
	count       [ GLsizei! ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLenum mode, GLsizei count, GLenum type, const void* indices, GLsizei primcount );
glDrawElementsInstanced!: alias function! [
	mode        [ GLenum! ]
	count       [ GLsizei! ]
	type        [ GLenum! ]
	indices     [ pointer! [byte!] ]
	primcount   [ GLsizei! ]
]
;@@ void ( GLuint buffer );
glPrimitiveRestartIndex!: alias function! [
	buffer      [ GLuint! ]
]
;@@ void ( GLenum target, GLenum internalFormat, GLuint buffer );
glTexBuffer!: alias function! [
	target      [ GLenum! ]
	internalFormat [ GLenum! ]
	buffer      [ GLuint! ]
]


;-------------------------------------------
;-- GL_VERSION_3_2
;-------------------------------------------

#define  GL_VERSION_3_2                               1
#define  GL_CONTEXT_CORE_PROFILE_BIT                  00000001h
#define  GL_CONTEXT_COMPATIBILITY_PROFILE_BIT         00000002h
#define  GL_LINES_ADJACENCY                           000Ah
#define  GL_LINE_STRIP_ADJACENCY                      000Bh
#define  GL_TRIANGLES_ADJACENCY                       000Ch
#define  GL_TRIANGLE_STRIP_ADJACENCY                  000Dh
#define  GL_PROGRAM_POINT_SIZE                        8642h
#define  GL_GEOMETRY_VERTICES_OUT                     8916h
#define  GL_GEOMETRY_INPUT_TYPE                       8917h
#define  GL_GEOMETRY_OUTPUT_TYPE                      8918h
#define  GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS          8C29h
#define  GL_FRAMEBUFFER_ATTACHMENT_LAYERED            8DA7h
#define  GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS      8DA8h
#define  GL_GEOMETRY_SHADER                           8DD9h
#define  GL_MAX_GEOMETRY_UNIFORM_COMPONENTS           8DDFh
#define  GL_MAX_GEOMETRY_OUTPUT_VERTICES              8DE0h
#define  GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS      8DE1h
#define  GL_MAX_VERTEX_OUTPUT_COMPONENTS              9122h
#define  GL_MAX_GEOMETRY_INPUT_COMPONENTS             9123h
#define  GL_MAX_GEOMETRY_OUTPUT_COMPONENTS            9124h
#define  GL_MAX_FRAGMENT_INPUT_COMPONENTS             9125h
#define  GL_CONTEXT_PROFILE_MASK                      9126h
;@@ void ( GLenum target, GLenum attachment, GLuint texture, GLint level );
glFramebufferTexture!: alias function! [
	target      [ GLenum! ]
	attachment  [ GLenum! ]
	texture     [ GLuint! ]
	level       [ GLint! ]
]
;@@ void ( GLenum target, GLenum value, GLint64 * data );
glGetBufferParameteri64v!: alias function! [
	target      [ GLenum! ]
	value       [ GLenum! ]
	data        [ GLint64-ptr! ]
]
;@@ void ( GLenum pname, GLuint index, GLint64 * data );
glGetInteger64i_v!: alias function! [
	pname       [ GLenum! ]
	index       [ GLuint! ]
	data        [ GLint64-ptr! ]
]


;-------------------------------------------
;-- GL_VERSION_3_3
;-------------------------------------------

#define  GL_VERSION_3_3                               1
#define  GL_VERTEX_ATTRIB_ARRAY_DIVISOR               88FEh
#define  GL_RGB10_A2UI                                906Fh
;@@ void ( GLuint index, GLuint divisor );
glVertexAttribDivisor!: alias function! [
	index       [ GLuint! ]
	divisor     [ GLuint! ]
]


;-------------------------------------------
;-- GL_VERSION_4_0
;-------------------------------------------

#define  GL_VERSION_4_0                               1
#define  GL_SAMPLE_SHADING                            8C36h
#define  GL_MIN_SAMPLE_SHADING_VALUE                  8C37h
#define  GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET         8E5Eh
#define  GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET         8E5Fh
#define  GL_MAX_PROGRAM_TEXTURE_GATHER_COMPONENTS     8F9Fh
#define  GL_TEXTURE_CUBE_MAP_ARRAY                    9009h
#define  GL_TEXTURE_BINDING_CUBE_MAP_ARRAY            900Ah
#define  GL_PROXY_TEXTURE_CUBE_MAP_ARRAY              900Bh
#define  GL_SAMPLER_CUBE_MAP_ARRAY                    900Ch
#define  GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW             900Dh
#define  GL_INT_SAMPLER_CUBE_MAP_ARRAY                900Eh
#define  GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY       900Fh
;@@ void ( GLuint buf, GLenum modeRGB, GLenum modeAlpha );
glBlendEquationSeparatei!: alias function! [
	buf         [ GLuint! ]
	modeRGB     [ GLenum! ]
	modeAlpha   [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum mode );
glBlendEquationi!: alias function! [
	buf         [ GLuint! ]
	mode        [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha );
glBlendFuncSeparatei!: alias function! [
	buf         [ GLuint! ]
	srcRGB      [ GLenum! ]
	dstRGB      [ GLenum! ]
	srcAlpha    [ GLenum! ]
	dstAlpha    [ GLenum! ]
]
;@@ void ( GLuint buf, GLenum src, GLenum dst );
glBlendFunci!: alias function! [
	buf         [ GLuint! ]
	src         [ GLenum! ]
	dst         [ GLenum! ]
]
;@@ void ( GLclampf value );
glMinSampleShading!: alias function! [
	value       [ GLclampf! ]
]


;-------------------------------------------
;-- GL_VERSION_4_1
;-------------------------------------------

#define  GL_VERSION_4_1                               1


;-------------------------------------------
;-- GL_VERSION_4_2
;-------------------------------------------

#define  GL_VERSION_4_2                               1
#define  GL_TRANSFORM_FEEDBACK_PAUSED                 8E23h
#define  GL_TRANSFORM_FEEDBACK_ACTIVE                 8E24h
#define  GL_COMPRESSED_RGBA_BPTC_UNORM                8E8Ch
#define  GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM          8E8Dh
#define  GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT          8E8Eh
#define  GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT        8E8Fh
#define  GL_COPY_READ_BUFFER_BINDING                  8F36h
#define  GL_COPY_WRITE_BUFFER_BINDING                 8F37h


;-------------------------------------------
;-- GL_VERSION_4_3
;-------------------------------------------

#define  GL_VERSION_4_3                               1
#define  GL_NUM_SHADING_LANGUAGE_VERSIONS             82E9h
#define  GL_VERTEX_ATTRIB_ARRAY_LONG                  874Eh


;-------------------------------------------
;-- GL_VERSION_4_4
;-------------------------------------------

#define  GL_VERSION_4_4                               1
#define  GL_PRIMITIVE_RESTART_FOR_PATCHES_SUPPORTED   8221h
#define  GL_MAX_VERTEX_ATTRIB_STRIDE                  82E5h
#define  GL_TEXTURE_BUFFER_BINDING                    8C2Ah


;-------------------------------------------
;-- GL_VERSION_4_5
;-------------------------------------------

#define  GL_VERSION_4_5                               1
#define  GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT            00000004h
;@@ GLenum ( void );
glGetGraphicsResetStatus!: alias function! [
	return: [ GLenum! ]

]
;@@ void ( GLenum target, GLint lod, GLsizei bufSize, GLvoid *pixels );
glGetnCompressedTexImage!: alias function! [
	target      [ GLenum! ]
	lod         [ GLint! ]
	bufSize     [ GLsizei! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLenum tex, GLint level, GLenum format, GLenum type, GLsizei bufSize, GLvoid *pixels );
glGetnTexImage!: alias function! [
	tex         [ GLenum! ]
	level       [ GLint! ]
	format      [ GLenum! ]
	type        [ GLenum! ]
	bufSize     [ GLsizei! ]
	pixels      [ pointer! [byte!] ]
]
;@@ void ( GLuint program, GLint location, GLsizei bufSize, GLdouble *params );
glGetnUniformdv!: alias function! [
	program     [ GLuint! ]
	location    [ GLint! ]
	bufSize     [ GLsizei! ]
	params      [ pointer! [GLdouble!] ]
]


;-------------------------------------------
;-- GL_VERSION_4_6
;-------------------------------------------

#define  GL_VERSION_4_6                               1
#define  GL_CONTEXT_FLAG_NO_ERROR_BIT                 00000008h
#define  GL_PARAMETER_BUFFER                          80EEh
#define  GL_PARAMETER_BUFFER_BINDING                  80EFh
#define  GL_TRANSFORM_FEEDBACK_OVERFLOW               82ECh
#define  GL_TRANSFORM_FEEDBACK_STREAM_OVERFLOW        82EDh
#define  GL_VERTICES_SUBMITTED                        82EEh
#define  GL_PRIMITIVES_SUBMITTED                      82EFh
#define  GL_VERTEX_SHADER_INVOCATIONS                 82F0h
#define  GL_TESS_CONTROL_SHADER_PATCHES               82F1h
#define  GL_TESS_EVALUATION_SHADER_INVOCATIONS        82F2h
#define  GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED        82F3h
#define  GL_FRAGMENT_SHADER_INVOCATIONS               82F4h
#define  GL_COMPUTE_SHADER_INVOCATIONS                82F5h
#define  GL_CLIPPING_INPUT_PRIMITIVES                 82F6h
#define  GL_CLIPPING_OUTPUT_PRIMITIVES                82F7h
#define  GL_TEXTURE_MAX_ANISOTROPY                    84FEh
#define  GL_MAX_TEXTURE_MAX_ANISOTROPY                84FFh
#define  GL_POLYGON_OFFSET_CLAMP                      8E1Bh
#define  GL_SHADER_BINARY_FORMAT_SPIR_V               9551h
#define  GL_SPIR_V_BINARY                             9552h
#define  GL_SPIR_V_EXTENSIONS                         9553h
#define  GL_NUM_SPIR_V_EXTENSIONS                     9554h
;@@ void ( GLenum mode, const GLvoid *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride );
glMultiDrawArraysIndirectCount!: alias function! [
	mode        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	drawcount   [ GLintptr! ]
	maxdrawcount [ GLsizei! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLenum mode, GLenum type, const GLvoid *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride );
glMultiDrawElementsIndirectCount!: alias function! [
	mode        [ GLenum! ]
	type        [ GLenum! ]
	indirect    [ pointer! [byte!] ]
	drawcount   [ GLintptr! ]
	maxdrawcount [ GLsizei! ]
	stride      [ GLsizei! ]
]
;@@ void ( GLuint shader, const GLchar *pEntryPoint, GLuint numSpecializationConstants, const GLuint *pConstantIndex, const GLuint *pConstantValue );
glSpecializeShader!: alias function! [
	shader      [ GLuint! ]
	pEntryPoint [ GLstring! ]
	numSpecializationConstants [ GLuint! ]
	pConstantIndex [ pointer! [GLuint!] ]
	pConstantValue [ pointer! [GLuint!] ]
]
