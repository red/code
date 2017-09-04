Red/System [
	Title:   "Red/System OpenGL S3 extension binding"
	Author:  "Oldes"
	File: 	 %gl-S3.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_S3_s3tc
;-------------------------------------------

#define  GL_S3_s3tc                                   1
#define  GL_RGB_S3TC                                  83A0h
#define  GL_RGB4_S3TC                                 83A1h
#define  GL_RGBA_S3TC                                 83A2h
#define  GL_RGBA4_S3TC                                83A3h
#define  GL_RGBA_DXT5_S3TC                            83A4h
#define  GL_RGBA4_DXT5_S3TC                           83A5h
