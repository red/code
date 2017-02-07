# ImageMagick binding for Red and Red/System

Purpose of file [ImageMagic.reds](ImageMagick/ImageMagick.reds) is to provide low level access to ImageMagick's functions in Red/System.
Including file [ImageMagic.red](ImageMagick/ImageMagick.red) you get simple _Domain Specific Language_ (DSL) to access these functions
in higher level _Red_ coding. Here is very basic example how it can be used:

```Red
Red []
#include %ImageMagick.red
iMagick [
  read %opice.png                  ;-- loads PNG image with size 200x200 into MagicWand
  liquid-rescale 300x300 3.0 0.3   ;-- rescales image with seam carving.
  resize 200x200 lanczos 1         ;-- resize it back to original size using Lanczos filter 
  write %opice.jpg                 ;-- save content of the MagicWand as JPG file
]
```

#### Todo
This is still work in progress... not all MagicWand functions have equivalent in `Red` binding and I still have to figure out,
how to integrate `PixelWand` and `DrawingWand` functions. It would be also nice to add a possibility to get content of `MagicWand`
as Red's `image!` type, so one could do live coding using `View`.

I should note, that I have actually no need to use this binding at this moment. I'm writing it mostly to learn some internals of
Red - Red/System coding. So I'm pretty sure many things in this binding could be done better, so if you find something, feel free
to improve it or let me know.

Code is so far tested on `Windows 7` with `ImageMagick-6.9.0-Q16`.
