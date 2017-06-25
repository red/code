Red/System [
	Title:  "Minimal file IO functions"
	Purpose: "Stripped version of the simple-io.reds script for use without Red runtime"
	Author: "Nenad Rakocevic, Oldes"
	File:   %simple-io-minimal.reds
	Tabs:   4
	Rights: "Copyright (C) 2012-2017 Nenad Rakocevic. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#either OS = 'Windows [

	#define GENERIC_WRITE             40000000h
	#define GENERIC_READ              80000000h
	#define FILE_SHARE_READ           00000001h
	#define FILE_SHARE_WRITE          00000002h
	#define FILE_SHARE_DELETE         00000004h
	#define CREATE_NEW                00000001h
	#define CREATE_ALWAYS             00000002h
	#define OPEN_EXISTING             00000003h
	#define OPEN_ALWAYS               00000004h
	#define TRUNCATE_EXISTING         00000005h
	#define FILE_ATTRIBUTE_NORMAL     00000080h
	#define FILE_ATTRIBUTE_DIRECTORY  00000010h
	#define FILE_FLAG_SEQUENTIAL_SCAN 08000000h

	#define SET_FILE_BEGIN          0
	#define SET_FILE_CURRENT        1
	#define SET_FILE_END            2
][
	#define O_RDONLY    0
	#define O_WRONLY    1
	#define O_RDWR      2
	#define O_BINARY    0

	#define S_IREAD     256
	#define S_IWRITE    128
	#define S_IRGRP     32
	#define S_IWGRP     16
	#define S_IROTH     4
]
simple-io: context [

	#enum red-io-mode! [
		RIO_READ:   1
		RIO_WRITE:  2
		RIO_APPEND: 4
		RIO_SEEK:   8
		RIO_NEW:    16
	]

	#either OS = 'Windows [

		WIN32_FIND_DATA: alias struct! [
			dwFileAttributes    [integer!]
			ftCreationTime      [float!]
			ftLastAccessTime    [float!]
			ftLastWriteTime     [float!]
			nFileSizeHigh       [integer!]
			nFileSizeLow        [integer!]
			dwReserved0         [integer!]
			dwReserved1         [integer!]
			;cFileName          [byte-ptr!]             ;-- WCHAR  cFileName[ 260 ]
			;cAlternateFileName [c-string!]             ;-- cAlternateFileName[ 14 ]
		]

		#import [
			"kernel32.dll" stdcall [
				GetFileAttributesW: "GetFileAttributesW" [
					path        [c-string!]
					return:     [integer!]
				]
				CreateFileA: "CreateFileA" [            ;-- temporary needed by Red/System
					filename    [c-string!]
					access      [integer!]
					share       [integer!]
					security    [int-ptr!]
					disposition [integer!]
					flags       [integer!]
					template    [int-ptr!]
					return:     [integer!]
				]
				CreateFileW: "CreateFileW" [
					filename    [c-string!]
					access      [integer!]
					share       [integer!]
					security    [int-ptr!]
					disposition [integer!]
					flags       [integer!]
					template    [int-ptr!]
					return:     [integer!]
				]
				ReadFile:   "ReadFile" [
					file        [integer!]
					buffer      [byte-ptr!]
					bytes       [integer!]
					read        [int-ptr!]
					overlapped  [int-ptr!]
					return:     [integer!]
				]
				WriteFile:  "WriteFile" [
					file        [integer!]
					buffer      [byte-ptr!]
					bytes       [integer!]
					written     [int-ptr!]
					overlapped  [int-ptr!]
					return:     [integer!]
				]
				GetFileSize: "GetFileSize" [
					file        [integer!]
					high-size   [integer!]
					return:     [integer!]
				]
				CloseHandle:    "CloseHandle" [
					obj         [integer!]
					return:     [logic!]
				]
				SetFilePointer: "SetFilePointer" [
					file        [integer!]
					distance    [integer!]
					pDistance   [int-ptr!]
					dwMove      [integer!]
					return:     [integer!]
				]
				lstrlen: "lstrlenW" [
					str         [byte-ptr!]
					return:     [integer!]
				]
				WideCharToMultiByte: "WideCharToMultiByte" [
					CodePage            [integer!]
					dwFlags             [integer!]
					lpWideCharStr       [c-string!]
					cchWideChar         [integer!]
					lpMultiByteStr      [byte-ptr!]
					cbMultiByte         [integer!]
					lpDefaultChar       [c-string!]
					lpUsedDefaultChar   [integer!]
					return:             [integer!]
				]
			]
		]
	][
		#case [
			OS = 'FreeBSD [
				;-- http://fxr.watson.org/fxr/source/sys/stat.h?v=FREEBSD10
				stat!: alias struct! [
					st_dev      [integer!]
					st_ino      [integer!]
					st_modelink [integer!]                  ;-- st_mode & st_link are both 16bit fields
					st_uid      [integer!]
					st_gid      [integer!]
					st_rdev     [integer!]
					atv_sec     [integer!]                  ;-- struct timespec inlined
					atv_msec    [integer!]
					mtv_sec     [integer!]                  ;-- struct timespec inlined
					mtv_msec    [integer!]
					ctv_sec     [integer!]                  ;-- struct timespec inlined
					ctv_msec    [integer!]
					st_size     [integer!]
					st_size_h   [integer!]
					st_blocks_l [integer!]
					st_blocks_h [integer!]
					st_blksize  [integer!]
					st_flags    [integer!]
					st_gen      [integer!]
					st_lspare   [integer!]
					btm_sec     [integer!]
					btm_msec    [integer!]                  ;-- struct timespec inlined
					pad0        [integer!]
					pad1        [integer!]
				]
				dirent!: alias struct! [                    ;@@ the same as macOS
					d_ino       [integer!]
					d_reclen    [byte!]
					_d_reclen_  [byte!]
					d_type      [byte!]
					d_namlen    [byte!]
					;d_name     [byte! [256]]
				]
			]
			OS = 'macOS [
				stat!: alias struct! [
					st_dev      [integer!]
					st_ino      [integer!]
					st_modelink [integer!]                  ;-- st_mode & st_link are both 16bit fields
					st_uid      [integer!]
					st_gid      [integer!]
					st_rdev     [integer!]
					atv_sec     [integer!]                  ;-- struct timespec inlined
					atv_msec    [integer!]
					mtv_sec     [integer!]                  ;-- struct timespec inlined
					mtv_msec    [integer!]
					ctv_sec     [integer!]                  ;-- struct timespec inlined
					ctv_msec    [integer!]
					st_size     [integer!]
					st_blocks   [integer!]
					st_blksize  [integer!]
					st_flags    [integer!]
					st_gen      [integer!]
					st_lspare   [integer!]
					st_qspare_1 [integer!]
					st_qspare_2 [integer!]
				]
				;;-- #if __DARWIN_64_BIT_INO_T
				;#define DIRENT_NAME_OFFSET 21
				;dirent!: alias struct! [
				;   d_ino       [integer!]
				;   _d_ino_     [integer!]
				;   d_seekoff   [integer!]
				;   _d_seekoff_ [integer!]
				;   d_reclen    [integer!]                  ;-- d_reclen & d_namlen
				;   ;d_namlen   [integer!]
				;   d_type      [byte!]
				;   ;d_name     [byte! [1024]]
				;]
				;;-- #endif

				dirent!: alias struct! [
					d_ino       [integer!]
					d_reclen    [byte!]
					_d_reclen_  [byte!]
					d_type      [byte!]
					d_namlen    [byte!]
					;d_name     [byte! [256]]
				]
			]
			OS = 'Syllable [
				;-- http://glibc.sourcearchive.com/documentation/2.7-18lenny7/glibc-2_87_2bits_2stat_8h_source.html
				stat!: alias struct! [
					st_mode     [integer!]
					st_ino      [integer!]
					st_dev      [integer!]
					st_nlink    [integer!]
					st_uid      [integer!]
					st_gid      [integer!]
					filler1     [integer!]              ;-- not in spec above...
					filler2     [integer!]              ;-- not in spec above...
					st_size     [integer!]
					;...incomplete...
				]
				#define DIRENT_NAME_OFFSET 8
				dirent!: alias struct! [
					d_ino       [integer!]
					d_reclen    [byte!]
					_d_reclen_  [byte!]
					d_type      [byte!]
					d_namlen    [byte!]
					;d_name     [byte! [256]]
				]
			]
			all [legacy find legacy 'stat32] [
				stat!: alias struct! [
					st_dev      [integer!]
					st_ino      [integer!]
					st_mode     [integer!]
					st_nlink    [integer!]
					st_uid      [integer!]
					st_gid      [integer!]
					st_rdev     [integer!]
					st_size     [integer!]
					st_blksize  [integer!]
					st_blocks   [integer!]
					st_atime    [integer!]
					st_mtime    [integer!]
					st_ctime    [integer!]
				]
				#define DIRENT_NAME_OFFSET 8
				dirent!: alias struct! [
					d_ino       [integer!]
					d_reclen    [byte!]
					_d_reclen_  [byte!]
					d_type      [byte!]
					d_namlen    [byte!]
					;d_name     [byte! [256]]
				]
			]
			OS = 'Android [ ; else
				;https://android.googlesource.com/platform/bionic.git/+/master/libc/include/sys/stat.h
				stat!: alias struct! [              ;-- stat64 struct
					st_dev_h      [integer!]
					st_dev_l      [integer!]
					pad0          [integer!]
					__st_ino      [integer!]
					st_mode       [integer!]
					st_nlink      [integer!]
					st_uid        [integer!]
					st_gid        [integer!]
					st_rdev_h     [integer!]
					st_rdev_l     [integer!]
					pad1          [integer!]
					st_size_h     [integer!]
					st_size   [integer!]
					st_blksize    [integer!]
					st_blocks_h   [integer!]
					st_blocks     [integer!]
					st_atime      [integer!]
					st_atime_nsec [integer!]
					st_mtime      [integer!]
					st_mtime_nsec [integer!]
					st_ctime      [integer!]
					st_ctime_nsec [integer!]
					st_ino_h      [integer!]
					st_ino_l      [integer!]
					;...optional padding skipped
				]
				#define DIRENT_NAME_OFFSET  19
				dirent!: alias struct! [
					d_ino       [integer!]
					_d_ino_     [integer!]
					d_off       [integer!]
					_d_off_     [integer!]
					d_reclen    [byte!]
					_d_reclen_  [byte!]
					d_type      [byte!]
					;d_name     [byte! [256]]
				]
			]
			true [ ; else
				;-- http://lxr.free-electrons.com/source/arch/x86/include/uapi/asm/stat.h
				stat!: alias struct! [              ;-- stat64 struct
					st_dev_l      [integer!]
					st_dev_h      [integer!]
					pad0          [integer!]
					__st_ino      [integer!]
					st_mode       [integer!]
					st_nlink      [integer!]
					st_uid        [integer!]
					st_gid        [integer!]
					st_rdev_l     [integer!]
					st_rdev_h     [integer!]
					pad1          [integer!]
					st_size       [integer!]
					st_blksize    [integer!]
					st_blocks     [integer!]
					st_atime      [integer!]
					st_atime_nsec [integer!]
					st_mtime      [integer!]
					st_mtime_nsec [integer!]
					st_ctime      [integer!]
					st_ctime_nsec [integer!]
					st_ino_h      [integer!]
					st_ino_l      [integer!]
					;...optional padding skipped
				]

				#define DIRENT_NAME_OFFSET 11
				dirent!: alias struct! [
					d_ino           [integer!]
					d_off           [integer!]
					d_reclen        [byte!]
					d_reclen_pad    [byte!]
					d_type          [byte!]
					;d_name         [byte! [256]]
				]
			]
		]

		#case [
			any [OS = 'macOS OS = 'FreeBSD OS = 'Android] [
				#import [
					LIBC-file cdecl [
						;-- https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/10.6/man2/stat.2.html?useVersion=10.6
						_stat:  "fstat" [
							file        [integer!]
							restrict    [stat!]
							return:     [integer!]
						]
					]
				]
			]
			true [
				#import [
					LIBC-file cdecl [
						;-- http://refspecs.linuxbase.org/LSB_3.0.0/LSB-Core-generic/LSB-Core-generic/baselib-xstat-1.html
						_stat:  "__fxstat" [
							version     [integer!]
							file        [integer!]
							restrict    [stat!]
							return:     [integer!]
						]
					]
				]
			]
		]

		#either OS = 'macOS [
			#import [
				LIBC-file cdecl [
					lseek: "lseek" [
						file        [integer!]
						offset-lo   [integer!]
						offset-hi   [integer!]
						whence      [integer!]
						return:     [integer!]
					]
				]
			]
		][
			#import [
				LIBC-file cdecl [
					lseek: "lseek" [
						file        [integer!]
						offset      [integer!]
						whence      [integer!]
						return:     [integer!]
					]
				]
			]
		]
		#import [
			LIBC-file cdecl [
				_access: "access" [
					filename    [c-string!]
					mode        [integer!]
					return:     [integer!]
				]
				_open:  "open" [
					filename    [c-string!]
					flags       [integer!]
					mode        [integer!]
					return:     [integer!]
				]
				_read:  "read" [
					file        [integer!]
					buffer      [byte-ptr!]
					bytes       [integer!]
					return:     [integer!]
				]
				_write: "write" [
					file        [integer!]
					buffer      [byte-ptr!]
					bytes       [integer!]
					return:     [integer!]
				]
				_close: "close" [
					file        [integer!]
					return:     [integer!]
				]
				mkdir: "mkdir" [
					pathname    [c-string!]
					mode        [integer!]
					return:     [integer!]
				]
				opendir: "opendir" [
					filename    [c-string!]
					return:     [integer!]
				]
				readdir: "readdir" [
					file        [integer!]
					return:     [dirent!]
				]
				closedir: "closedir" [
					file        [integer!]
					return:     [integer!]
				]
				strncmp: "strncmp" [
					str1        [c-string!]
					str2        [c-string!]
					num         [integer!]
					return:     [integer!]
				]
				strstr: "strstr" [
					str         [c-string!]
					substr      [c-string!]
					return:     [c-string!]
				]
				strchr: "strchr" [
					str         [c-string!]
					c           [byte!]
					return:     [c-string!]
				]
			]
		]
	]

	open-file: func [
		filename [c-string!]
		mode     [integer!]
		unicode? [logic!]
		return:  [integer!]
		/local
			file   [integer!]
			modes  [integer!]
			access [integer!]
	][
		#either OS = 'Windows [
			either mode and RIO_READ <> 0 [
				modes: GENERIC_READ
				access: OPEN_EXISTING
			][
				modes: GENERIC_WRITE
				either any [
					mode and RIO_APPEND <> 0
					mode and RIO_SEEK <> 0
				][
					access: OPEN_ALWAYS
				][
					access: CREATE_ALWAYS
				]
			]
			either unicode? [
				file: CreateFileW
					filename
					modes
					FILE_SHARE_READ or FILE_SHARE_WRITE
					null
					access
					FILE_ATTRIBUTE_NORMAL
					null
			][
				file: CreateFileA
					filename
					modes
					FILE_SHARE_READ or FILE_SHARE_WRITE
					null
					access
					FILE_ATTRIBUTE_NORMAL
					null
			]
		][
			either mode and RIO_READ <> 0 [
				modes: O_BINARY or O_RDONLY
				access: S_IREAD
			][
				modes: O_BINARY or O_WRONLY or O_CREAT
				either mode and RIO_APPEND <> 0 [
					modes: modes or O_APPEND
				][
					if mode and RIO_SEEK = 0 [modes: modes or O_TRUNC]
				]
				access: S_IREAD or S_IWRITE or S_IRGRP or S_IWGRP or S_IROTH
			]
			file: _open filename modes access
		]
		if file = -1 [return -1]
		file
	]
	
	file-size?: func [
		file     [integer!]
		return:  [integer!]
		/local s
	][
		#case [
			OS = 'Windows [
				GetFileSize file null
			]
			any [OS = 'macOS OS = 'FreeBSD OS = 'Android] [
				s: declare stat!
				_stat file s
				s/st_size
			]
			true [ ; else
				s: declare stat!
				_stat 3 file s
				s/st_size
			]
		]
	]

	file-exists?: func [
		path    [c-string!]
		return: [logic!]
	][
		#either OS = 'Windows [
			-1 <> GetFileAttributesW path
		][
			-1 <> _access path 0                ;-- F_OK: 0
		]
	]

	seek-file: func [
		file    [integer!]
		offset  [integer!]
	][
		#case [
			OS = 'Windows [
				SetFilePointer file offset null SET_FILE_BEGIN
			]
			OS = 'macOS [
				lseek file offset 0 0               ;@@ offset is 64bit
			]
			true [
				lseek file offset 0                 ;-- SEEK_SET
			]
		]
	]

	read-data: func [
		file    [integer!]
		buffer  [byte-ptr!]
		size    [integer!]
		return: [integer!]
		/local
			read-sz [integer!]
			res     [integer!]
	][
		#either OS = 'Windows [
			read-sz: -1
			res: ReadFile file buffer size :read-sz null
			res: either zero? res [-1][1]
		][
			res: _read file buffer size
		]
		res
	]

	write-data: func [
		file    [integer!]
		data    [byte-ptr!]
		size    [integer!]
		return: [integer!]
		/local
			len [integer!]
			ret [integer!]
	][
		#either OS = 'Windows [
			len: 0
			ret: WriteFile file data size :len null
			ret: either zero? ret [-1][1]
		][
			ret: _write file data size
		]
		ret
	]

	close-file: func [
		file    [integer!]
		return: [logic!]
	][
		#either OS = 'Windows [
			CloseHandle file
		][
			0 = _close file
		]
	]
]

