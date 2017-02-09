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

probe iMagick [
	read %mnich.png
	use 2
	read %opice.png
	contrast off
	composite 1 over 50x50
	write %opice-mnich.png
]

iMagick [read %mnich.png use 2 read %opice.png hald-clut 1 write %opuice-hald-clut.jpg use 1]

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


comment {
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
	use 2
	write %opice-preview.jpg
	clear
	use 1
	clear
]

iMagick [
	read %mnich.png
	encipher "Red"
	write %mnich-crypted.png
	decipher "Red"
	write %mnich-decrypted.png
]

;}
probe iMagick [
	read  %opice.png
	clone 2                        ;== Clone current wand to index 2
	clone 3                        ;== Clone current wand to index 3
	;adaptive-blur 16.0 4.0
	;charcoal 16 4
	;motion-blur 100 60 180
	edge 3

	use 3
	clear
	read %son1.gif
	adaptive-threshold 140x140 7    ;== Selects an individual threshold for each pixel based on the range of intensity values in its local neighborhood
	write %son1-threshold.gif

	use 2
	charcoal 16 4
	write %opice-charcoal.jpg
	
	clear                         ;== Clears resources associated with current wand
	read %mnich.png
	adaptive-resize 200x200       ;== Adaptively resize image with data dependent triangulation

	write %mnich.gif
	use 1
	write %opice.jpg
]
