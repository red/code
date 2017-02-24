Red [
	Title:  "ImageMagick stand alone test script"
	Author: "Oldes"
	File:   %ImageMagick-test.red
	Tabs:   4
	Rights: "Copyright (C) 2017 Oldes. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

#include %ImageMagick.red

;-- here are image files used in the test
media: [%mnich.png %opice.png]
;-- download them if not exists...
foreach file media [
	unless exists? file [
		url: rejoin [https://github.com/Oldes/media/blob/master/ file]
		print ["Downloading file:" mold file "from:" url]
		write/binary file read/binary rejoin [url %?raw=true]
	]
]

;-- One magick wand can hold multiple images...
imagick [
	read %opice.png            ;this loads 1. image into current wand at first index
	read %mnich.png            ;this loads 2. image into current wand and increments image index
	previous                   ;this changes index to the previous one
	write %test1.gif           ;so this will save %opice image
	next                       ;this changes index back
	write %test2.gif           ;so this will save %mnich image
	remove                     ;this removes image at current index (so only %opice would be in the wand)
	read %mnich.png            ;this loads %mnich image back
	adaptive-resize 200x200    ;adaptively resize %mnich image with data dependent triangulation
	write-images %anim.gif on  ;creates animated gif from both images
	write-images %anim.gif off ;creates sequence from both images (anim-0.gif and anim-1.gif)
	write-images %anim.miff on ;writes animation into special MIFF file so anim can be loaded later without data lost (which would happen in the GIF)
	clear                      ;this clears all resources associated with the wand, but keeping the wand for later use
]

iMagick [restart]              ;this does complete cleanup of the ImageMagick environment

index: iMagick [
	read %anim.miff            ;read previously created animation file (so we have again both images in wand)
	get-index                  ;this returns the position of the iterator in the image list (evaluation ends!)
	read %what-ever            ;this will not be evaluated, because above command stops evaluation
]

print ["Wand is now on index:" index]

iMagick [
	head                       ;heare we continue with above wand - setting the wand iterator to the first image
	combine                    ;combines both images into a single image (replacing current wand with a new one!)
	write %test3.gif           ;and stores result in a new file
] 

iMagick [restart]

iMagick [
	read %opice.png            ;this loads 1. image into current wand at first index
	read %mnich.png            ;this loads 2. image into current wand and increments image index
	scale 200x200              ;combine requires images to have same size
	previous                   ;set index to previous image using 'previous' command here
	combine 2                  ;combines both images into a single image (writing target to the second wand keeping the original)
	write 2 %test3.jpg         ;write content of the second wand as JPG
	destroy 2                  ;completely release all resoutces from second wand if not needed anymore
] 

iMagick [restart]

print iMagick [
	ping %mnich.png           ;`ping` is like `read` except the only valid information returned is the image width height size and format
	get-size                  ;so we can get image size here without actually reading complete image into memory
]
print iMagick [
	get-info                  ;identifies an image by printing all its attributes
]

iMagick [restart]

img: iMagick [read %mnich.png get-image]
;view [image img]

save %image-from-red.png img

iMagick [scale 2x2]                               ;scale image down so bellow results are not too large
print ["RGB:   " mold iMagick [get-binary "RGB"]] ;prits raw RGB binary data
print ["Alpha: " mold iMagick [get-binary "A"]]   ;prits raw binary data with image alpha

iMagick [restart]

iMagick [
	new 10x10 255.0.0.200  ;this creates a new image with specified color and partial transparency
	write "PNG32:new.png"  ;saves result as 32bit PNG
]

iMagick [restart]

probe iMagick [
	read %opice.png             ;load background image into main wand
	read 2 %mnich.png           ;load another image into second wand
	composite 2 over 50x50      ;composite second image on the first one using just basic composition 'over and position
	write %opice-mnich-v1.png   ;save result
]

iMagick [restart]

iMagick [
	read %opice.png 
	alpha on                                       ;activates alpha channel as original image does not have it
	white-threshold 160.150.100                    ;force all pixels above the color threshold into white while leaving all pixels below unchanged
	rotate 45                                      ;rotates an image 45 degrees; as no color is specified, the background will be transparent
	write "PNG32:opice-white-threshold-rotate.png" ;saving result into 32bit PNG file (else it would use same format as original where was no transparency)
	write %opice-white-threshold-rotate.gif        ;saving result into GIF file (transparency used)
]


comment {
if error? set/any 'err try [
	iMagick [
		read %not-existing-file
	]
][
	print err
	print "This was intentional error and was catched so everything is OK" 
]

probe iMagick [
	read %opice.png
	color-decision-list {
		<ColorCorrectionCollection xmlns="urn:ASC:CDL:v1.2">
			<ColorCorrection id="cc03345">
				<SOPNode>
					<Slope> 0.9 1.2 0.5 </Slope>
					<Offset> 0.4 -0.5 0.6 </Offset>
					<Power> 1.0 0.8 1.5 </Power>
				</SOPNode>
				<SATNode>
					<Saturation> 0.85 </Saturation>
				</SATNode>
			</ColorCorrection>
		</ColorCorrectionCollection>}
	write %opice-ccc.png
	clear
]



iMagick [read %mnich.png use 2 read %opice.png hald-clut 1 write %opuice-hald-clut.jpg]

iMagick [read %opice.png liquid-rescale 300x300 3.0 0.3 write %opuice-liquid-rescale.jpg] ;Rescales image with seam carving

;["o4x4" "o4x4,3,3" "o4x4,8,8,8" "o8x8" "h8x8a" "h8x8a,3,3" "checks" "checks,3,3" "checks,8,8"]
{A string containing the name of the threshold dither map to use, followed by zero or more numbers representing the number of color levels tho dither between.
Any level number less than 2 is equivalent to 2, and means only binary dithering will be applied to each color channel.
No numbers also means a 2 level (bitmap) dither will be applied to all channels, while a single number is the number of levels applied to each channel in sequence. More numbers will be applied in turn to each of the color channels.
For example: "o3x3,6" generates a 6 level posterization of the image with a ordered 3x3 diffused pixel dither being applied between each level. While checker,8,8,4 will produce a 332 colormaped image with only a single checkerboard hash pattern (50 grey) between each color level, to basically double the number of color levels with a bare minimim of dithering.}
iMagick [read %opice.png magnify ordered-posterize "o3x3,6" write %opice-posterize.jpg]

iMagick [read %opice.png raise 10 10 50 50 true write %opice-raise.jpg]
iMagick [read %opice.png sigmoidal-contrast on 100 50 write %opice-sigmoidal-contrast.jpg]

iMagick [read %opice.png spread 10 write %opice-spread.jpg]



probe iMagick [
	read %opice.png
	vignette 0 50 30 10
	;add-noise gaussian
	;chop 50 50 20 20
	write %opice-vignette.gif
	clear
]

probe iMagick [
	read %opice.png
	preview oil-paint 2
	write 2 %opice-preview.jpg
	destroy 2
]

iMagick [
	read %mnich.png
	encipher "Red"
	write %mnich-crypted.png
	decipher "Red"
	write %mnich-decrypted.png
]

;}
comment { 
probe iMagick [
	read  %opice.png
	clone 2                        ;== Clone current wand to index 2
	clone 3                        ;== Clone current wand to index 3
	;adaptive-blur 16.0 4.0
	;charcoal 16 4
	;motion-blur 100 60 180
	edge 3

;	use 3
;	clear
;	read %son1.gif
;	adaptive-threshold 140x140 7    ;== Selects an individual threshold for each pixel based on the range of intensity values in its local neighborhood
;	write %son1-threshold.gif

	use 2
	charcoal 16 4
	write %opice-charcoal.jpg
	
;;	destroy                       ;== Deallocates memory associated with an MagickWand
;	read %mnich.png
;	adaptive-resize 200x200       ;== Adaptively resize image with data dependent triangulation
;
;	write %mnich.gif
;	use 1
;	write %opice.jpg
]

probe iMagick [
	destroy 2
	read  %opice.png
	clone 2                        ;== Clone current wand to index 2
;	edge 3
	use 2
	charcoal 16 4
	write %opice-charcoal-2.jpg
]

probe iMagick [read %opice.png clone 2 clone 3 edge 3 use 2 charcoal 16 4 write %opice-charcoal.jpg]
probe iMagick [restart read %opice.png clone 2 use 2 charcoal 16 4 write %opice-charcoal-2.jpg]

}
