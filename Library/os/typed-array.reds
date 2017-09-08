Red/System [
	Title:   "Typed array"
	Purpose: "Low level struct for holding typed data"
	Author:  "Oldes"
	File: 	 %typed-array.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

#enum typed-array-types! [
	TYPE_FLOAT32!:  1
] 

typed-array!: alias struct! [
	type   [typed-array-types!]
	size   [integer!]
	head   [byte-ptr!] ;always points to node
	data   [integer!]  ;real data starts here
]


make-f32-buffer: func[
	[variadic]
	count   [integer!]
	list    [pointer! [float!]]
	return: [typed-array!]
	/local pad array bytes buffer n 
][
	;pading result size to multiplies of 4
	pad:   count // 4
	if pad > 0 [pad: 4 - pad]
	bytes: 12 + 4 * (count + pad)

	array:  as typed-array! allocate bytes
	array/type: TYPE_FLOAT32!
	array/size: count
	array/head: as byte-ptr! :array/data
	buffer: as pointer! [float32!] :array/data

	;conver float values into float32 and write them to buffer
	n: 0
	while [n < count][
		n: n + 1
		buffer/n: as float32! list/n
	]
	;zero the padded bytes if needed
	print-line ["pad: " pad]
	while [pad > 0][
		n: n + 1
		buffer/n: as float32! 0.0
		pad: pad - 1
	]
	array
]
