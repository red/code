Red/System [
	Title:   "Red/System OpenGL OML extension binding"
	Author:  "Oldes"
	File: 	 %gl-OML.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	Note: {
		This source was made from glew.h file.
		Commented definitions are there because the definition was already defined  with the same value.
	}
]



;-------------------------------------------
;-- GL_OML_interlace
;-------------------------------------------

#define  GL_OML_interlace                             1
#define  GL_INTERLACE_OML                             8980h
#define  GL_INTERLACE_READ_OML                        8981h


;-------------------------------------------
;-- GL_OML_resample
;-------------------------------------------

#define  GL_OML_resample                              1
#define  GL_PACK_RESAMPLE_OML                         8984h
#define  GL_UNPACK_RESAMPLE_OML                       8985h
#define  GL_RESAMPLE_REPLICATE_OML                    8986h
#define  GL_RESAMPLE_ZERO_FILL_OML                    8987h
#define  GL_RESAMPLE_AVERAGE_OML                      8988h
#define  GL_RESAMPLE_DECIMATE_OML                     8989h


;-------------------------------------------
;-- GL_OML_subsample
;-------------------------------------------

#define  GL_OML_subsample                             1
#define  GL_FORMAT_SUBSAMPLE_24_24_OML                8982h
#define  GL_FORMAT_SUBSAMPLE_244_244_OML              8983h
