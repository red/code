Red/System [
	Title:   "Red/System ImageMagick binding"
	Author:  "Oldes"
	File: 	 %ImageMagick.reds
	Rights:  "Copyright (C) 2012-2015 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
	
]

#switch OS [
	Windows   [
		#define MAGICK_LIBRARY "CORE_RL_MagickWand_.dll" ;-- Require ImageMagick version 7 or newer!
	]
	#default  [   ]
]


#enum MagickBooleanType! [MagickFalse MagickTrue]
#enum NoiseType! [
	  UniformNoise
	  GaussianNoise
	  MultiplicativeGaussianNoise
	  ImpulseNoise
	  LaplacianNoise
	  PoissonNoise
	  RandomNoise
]
#enum MetricType! [
	  AbsoluteErrorMetric
	  MeanAbsoluteErrorMetric
	  MeanErrorPerPixelMetric
	  MeanSquaredErrorMetric
	  PeakAbsoluteErrorMetric
	  PeakSignalToNoiseRatioMetric
	  RootMeanSquaredErrorMetric
	  NormalizedCrossCorrelationErrorMetric
]
#enum ImageLayerMethod! [
	  CoalesceLayer
	  CompareAnyLayer
	  CompareClearLayer
	  CompareOverlayLayer
	  DisposeLayer
	  OptimizeLayer
	  OptimizeImageLayer
	  OptimizePlusLayer
	  OptimizeTransLayer
	  RemoveDupsLayer
	  RemoveZeroLayer
	  CompositeLayer
	  MergeLayer
	  FlattenLayer
	  MosaicLayer
	  TrimBoundsLayer
]
#enum DistortImageMethod! [
	  AffineDistortion
	  AffineProjectionDistortion
	  ScaleRotateTranslateDistortion
	  PerspectiveDistortion
	  PerspectiveProjectionDistortion
	  BilinearForwardDistortion
	  BilinearDistortion: BilinearForwardDistortion
	  BilinearReverseDistortion
	  PolynomialDistortion
	  ArcDistortion
	  PolarDistortion
	  DePolarDistortion
	  BarrelDistortion
	  BarrelInverseDistortion
	  ShepardsDistortion
	  SentinelDistortion
]
#enum MorphologyMethod! [
	;/* Convolve / Correlate weighted sums */
	  ConvolveMorphology          ;/* Weighted Sum with reflected kernel */
	  CorrelateMorphology         ;/* Weighted Sum using a sliding window */
	;/* Low-level Morphology methods */
	  ErodeMorphology             ;/* Minimum Value in Neighbourhood */
	  DilateMorphology            ;/* Maximum Value in Neighbourhood */
	  ErodeIntensityMorphology    ;/* Pixel Pick using GreyScale Erode */
	  DilateIntensityMorphology   ;/* Pixel Pick using GreyScale Dialate */
	  DistanceMorphology          ;/* Add Kernel Value take Minimum */
	;/* Second-level Morphology methods */
	  OpenMorphology              ;/* Dilate then Erode */
	  CloseMorphology             ;/* Erode then Dilate */
	  OpenIntensityMorphology     ;/* Pixel Pick using GreyScale Open */
	  CloseIntensityMorphology    ;/* Pixel Pick using GreyScale Close */
	  SmoothMorphology            ;/* Open then Close */
	;/* Difference Morphology methods */
	  EdgeInMorphology            ;/* Dilate difference from Original */
	  EdgeOutMorphology           ;/* Erode difference from Original */
	  EdgeMorphology              ;/* Dilate difference with Erode */
	  TopHatMorphology            ;/* Close difference from Original */
	  BottomHatMorphology         ;/* Open difference from Original */
	;/* Recursive Morphology methods */
	  HitAndMissMorphology        ;/* Foreground/Background pattern matching */
	  ThinningMorphology          ;/* Remove matching pixels from image */
	  ThickenMorphology            ;/* Add matching pixels from image */
]
#enum DitherMethod! [
	  NoDitherMethod
	  RiemersmaDitherMethod
	  FloydSteinbergDitherMethod
]
#enum InterpolatePixelMethod! [
	  AverageInterpolatePixel
	  BicubicInterpolatePixel
	  BilinearInterpolatePixel
	  FilterInterpolatePixel
	  IntegerInterpolatePixel
	  MeshInterpolatePixel
	  NearestNeighborInterpolatePixel
	  SplineInterpolatePixel
]
#enum VirtualPixelMethod! [
	  BackgroundVirtualPixelMethod
	  ConstantVirtualPixelMethod  ;/* deprecated */
	  DitherVirtualPixelMethod
	  EdgeVirtualPixelMethod
	  MirrorVirtualPixelMethod
	  RandomVirtualPixelMethod
	  TileVirtualPixelMethod
	  TransparentVirtualPixelMethod
	  MaskVirtualPixelMethod
	  BlackVirtualPixelMethod
	  GrayVirtualPixelMethod
	  WhiteVirtualPixelMethod
	  HorizontalTileVirtualPixelMethod
	  VerticalTileVirtualPixelMethod
	  HorizontalTileEdgeVirtualPixelMethod
	  VerticalTileEdgeVirtualPixelMethod
	  CheckerTileVirtualPixelMethod
]
#enum CompositeOperator! [
	  UndefinedCompositeOp
	  AlphaCompositeOp
	  AtopCompositeOp
	  BlendCompositeOp
	  BlurCompositeOp
	  BumpmapCompositeOp
	  ChangeMaskCompositeOp
	  ClearCompositeOp
	  ColorBurnCompositeOp
	  ColorDodgeCompositeOp
	  ColorizeCompositeOp
	  CopyBlackCompositeOp
	  CopyBlueCompositeOp
	  CopyCompositeOp
	  CopyCyanCompositeOp
	  CopyGreenCompositeOp
	  CopyMagentaCompositeOp
	  CopyAlphaCompositeOp
	  CopyRedCompositeOp
	  CopyYellowCompositeOp
	  DarkenCompositeOp
	  DarkenIntensityCompositeOp
	  DifferenceCompositeOp
	  DisplaceCompositeOp
	  DissolveCompositeOp
	  DistortCompositeOp
	  DivideDstCompositeOp
	  DivideSrcCompositeOp
	  DstAtopCompositeOp
	  DstCompositeOp
	  DstInCompositeOp
	  DstOutCompositeOp
	  DstOverCompositeOp
	  ExclusionCompositeOp
	  HardLightCompositeOp
	  HardMixCompositeOp
	  HueCompositeOp
	  InCompositeOp
	  IntensityCompositeOp
	  LightenCompositeOp
	  LightenIntensityCompositeOp
	  LinearBurnCompositeOp
	  LinearDodgeCompositeOp
	  LinearLightCompositeOp
	  LuminizeCompositeOp
	  MathematicsCompositeOp
	  MinusDstCompositeOp
	  MinusSrcCompositeOp
	  ModulateCompositeOp
	  ModulusAddCompositeOp
	  ModulusSubtractCompositeOp
	  MultiplyCompositeOp
	  NoCompositeOp
	  OutCompositeOp
	  OverCompositeOp
	  OverlayCompositeOp
	  PegtopLightCompositeOp
	  PinLightCompositeOp
	  PlusCompositeOp
	  ReplaceCompositeOp
	  SaturateCompositeOp
	  ScreenCompositeOp
	  SoftLightCompositeOp
	  SrcAtopCompositeOp
	  SrcCompositeOp
	  SrcInCompositeOp
	  SrcOutCompositeOp
	  SrcOverCompositeOp
	  ThresholdCompositeOp
	  VividLightCompositeOp
	  XorCompositeOp
]
#enum MagickEvaluateOperator! [
	  UndefinedEvaluateOperator
	  AbsEvaluateOperator
	  AddEvaluateOperator
	  AddModulusEvaluateOperator
	  AndEvaluateOperator
	  CosineEvaluateOperator
	  DivideEvaluateOperator
	  ExponentialEvaluateOperator
	  GaussianNoiseEvaluateOperator
	  ImpulseNoiseEvaluateOperator
	  LaplacianNoiseEvaluateOperator
	  LeftShiftEvaluateOperator
	  LogEvaluateOperator
	  MaxEvaluateOperator
	  MeanEvaluateOperator
	  MedianEvaluateOperator
	  MinEvaluateOperator
	  MultiplicativeNoiseEvaluateOperator
	  MultiplyEvaluateOperator
	  OrEvaluateOperator
	  PoissonNoiseEvaluateOperator
	  PowEvaluateOperator
	  RightShiftEvaluateOperator
	  RootMeanSquareEvaluateOperator
	  SetEvaluateOperator
	  SineEvaluateOperator
	  SubtractEvaluateOperator
	  SumEvaluateOperator
	  ThresholdBlackEvaluateOperator
	  ThresholdEvaluateOperator
	  ThresholdWhiteEvaluateOperator
	  UniformNoiseEvaluateOperator
	  XorEvaluateOperator 
]
#enum StorageType! [
	  UndefinedPixel
	  CharPixel
	  DoublePixel
	  FloatPixel
	  IntegerPixel
	  LongPixel
	  QuantumPixel
	  ShortPixel
]
#enum MagickFunction! [
	  PolynomialFunction
	  SinusoidFunction
	  ArcsinFunction
	  ArctanFunction
]
#enum MontageMode! [
	  FrameMode
	  UnframeMode
	  ConcatenateMode
]
#enum PreviewType! [
	  RotatePreview
	  ShearPreview
	  RollPreview
	  HuePreview
	  SaturationPreview
	  BrightnessPreview
	  GammaPreview
	  SpiffPreview
	  DullPreview
	  GrayscalePreview
	  QuantizePreview
	  DespecklePreview
	  ReduceNoisePreview
	  AddNoisePreview
	  SharpenPreview
	  BlurPreview
	  ThresholdPreview
	  EdgeDetectPreview
	  SpreadPreview
	  SolarizePreview
	  ShadePreview
	  RaisePreview
	  SegmentPreview
	  SwirlPreview
	  ImplodePreview
	  WavePreview
	  OilPaintPreview
	  CharcoalDrawingPreview
	  JPEGPreview
]
#enum ColorspaceType! [
	  RGBColorspace
	  GRAYColorspace
	  TransparentColorspace
	  OHTAColorspace
	  LabColorspace
	  XYZColorspace
	  YCbCrColorspace
	  YCCColorspace
	  YIQColorspace
	  YPbPrColorspace
	  YUVColorspace
	  CMYKColorspace
	  sRGBColorspace
	  HSBColorspace
	  HSLColorspace
	  HWBColorspace
	  Rec601LumaColorspace
	  Rec601YCbCrColorspace
	  Rec709LumaColorspace
	  Rec709YCbCrColorspace
	  LogColorspace
	  CMYColorspace
]
#enum OrientationType! [
	  TopLeftOrientation
	  TopRightOrientation
	  BottomRightOrientation
	  BottomLeftOrientation
	  LeftTopOrientation
	  RightTopOrientation
	  RightBottomOrientation
	  LeftBottomOrientation
]
#enum FilterTypes! [
	  PointFilter: 1
	  BoxFilter
	  TriangleFilter
	  HermiteFilter
	  HannFilter
	  HammingFilter
	  BlackmanFilter
	  GaussianFilter
	  QuadraticFilter
	  CubicFilter
	  CatromFilter
	  MitchellFilter
	  JincFilter
	  SincFilter
	  SincFastFilter
	  KaiserFilter
	  WelchFilter
	  ParzenFilter
	  BohmanFilter
	  BartlettFilter
	  LagrangeFilter
	  LanczosFilter
	  LanczosSharpFilter
	  Lanczos2Filter
	  Lanczos2SharpFilter
	  RobidouxFilter
	  RobidouxSharpFilter
	  CosineFilter
	  SplineFilter
	  LanczosRadiusFilter
	  SentinelFilter  ;/* a count of all the filters not a real filter */
]
#enum ChannelType! [
	  RedChannel:        1
	  GrayChannel:       1
	  CyanChannel:       1
	  GreenChannel:      2
	  MagentaChannel:    2
	  BlueChannel:       4
	  YellowChannel:     4
	  BlackChannel:      8
	  AlphaChannel:      16
	  OpacityChannel:    16
	  IndexChannel:      32
	  ReadMaskChannel:   0040h      ;/* Pixel is Not Readable? */
	  WriteMaskChannel:  0080h      ;/* Pixel is Write Protected? */
	  MetaChannel:       0100h      ;/* ???? */
	  CompositeChannels: 001Fh
	  AllChannels:       07FFFFFFh
	 ; /* special channel types */
	  TrueAlphaChannel:  0100h      ;/* extract actual alpha channel from opacity */
	  RGBChannels:       0200h      ;/* set alpha from grayscale mask in RGB */
	  GrayChannels:      0400h
	  SyncChannels:      00020000h  ;/* channels modified as a single unit */
	  DefaultChannels:   07FFFFFFh 
]
#enum AlphaChannelType! [
	  UndefinedAlphaChannel
	  ActivateAlphaChannel
	  AssociateAlphaChannel
	  BackgroundAlphaChannel
	  CopyAlphaChannel
	  DeactivateAlphaChannel
	  DiscreteAlphaChannel
	  DisassociateAlphaChannel
	  ExtractAlphaChannel
	  OffAlphaChannel
	  OnAlphaChannel
	  OpaqueAlphaChannel
	  RemoveAlphaChannel
	  SetAlphaChannel
	  ShapeAlphaChannel
	  TransparentAlphaChannel
]
#enum CompressionType! [
	  NoCompression
	  BZipCompression
	  DXT1Compression
	  DXT3Compression
	  DXT5Compression
	  FaxCompression
	  Group4Compression
	  JPEGCompression
	  JPEG2000Compression
	  LosslessJPEGCompression
	  LZWCompression
	  RLECompression
	  ZipCompression
	  ZipSCompression
	  PizCompression
	  Pxr24Compression
	  B44Compression
	  B44ACompression
]
#enum DisposeType! [
	  NoneDispose
	  BackgroundDispose
	  PreviousDispose
]
#enum GravityType! [
	  ForgetGravity
	  NorthWestGravity
	  NorthGravity
	  NorthEastGravity
	  WestGravity
	  CenterGravity
	  EastGravity
	  SouthWestGravity
	  SouthGravity
	  SouthEastGravity
	  StaticGravity
]
#enum InterlaceType! [
	  NoInterlace
	  LineInterlace
	  PlaneInterlace
	  PartitionInterlace
	  GIFInterlace
	  JPEGInterlace
	  PNGInterlace
]
#enum ImageType! [
	  BilevelType
	  GrayscaleType
	  GrayscaleMatteType
	  PaletteType
	  PaletteMatteType
	  TrueColorType
	  TrueColorMatteType
	  ColorSeparationType
	  ColorSeparationMatteType
	  OptimizeType
	  PaletteBilevelMatteType
]
#enum ResolutionType! [
	  PixelsPerInchResolution
	  PixelsPerCentimeterResolution
]
#enum RenderingIntent! [
	  SaturationIntent
	  PerceptualIntent
	  AbsoluteIntent
	  RelativeIntent
]
#enum StatisticType! [
	UndefinedStatistic
	GradientStatistic
	MaximumStatistic
	MeanStatistic
	MedianStatistic
	MinimumStatistic
	ModeStatistic
	NonpeakStatistic
	StandardDeviationStatistic
]
#enum KernelInfoType! [
	UndefinedKernel
	UnityKernel
	GaussianKernel
	DoGKernel
	LoGKernel
	BlurKernel
	CometKernel
	LaplacianKernel
	SobelKernel
	FreiChenKernel
	RobertsKernel
	PrewittKernel
	CompassKernel
	KirschKernel
	DiamondKernel
	SquareKernel
	RectangleKernel
	OctagonKernel
	DiskKernel
	PlusKernel
	CrossKernel
	RingKernel
	PeaksKernel
	EdgesKernel
	CornersKernel
	DiagonalsKernel
	LineEndsKernel
	LineJunctionsKernel
	RidgesKernel
	ConvexHullKernel
	ThinSEKernel
	SkeletonKernel
	ChebyshevKernel
	ManhattanKernel
	OctagonalKernel
	EuclideanKernel
	UserDefinedKernel
]

#enum LineCap! [
	UndefinedCap
	ButtCap
	RoundCap
	SquareCap
]
#enum LineJoin! [
	UndefinedJoin
	MiterJoin
	RoundJoin
	BevelJoin
]
#enum AlignType! [
	UndefinedAlign ;No alignment specified. Equivalent to LeftAlign.
	LeftAlign      ;Align the leftmost part of the text to the starting point.
	CenterAlign    ;Center the text around the starting point.
	RightAlign
]
#enum ClipPathUnits! [
	UndefinedPathUnits
	UserSpace
	UserSpaceOnUse
	ObjectBoundingBox
]
#enum DecorationType! [
	UndefinedDecoration
	NoDecoration
	UnderlineDecoration
	OverlineDecoration
	LineThroughDecoration
]
#enum FillRule! [
	UndefinedRule
	EvenOddRule
	NonZeroRule
]
#enum StretchType! [
	AnyStretch	;Wildcard match for font stretch
	NormalStretch
	UltraCondensedStretch
	ExtraCondensedStretch
	CondensedStretch
	SemiCondensedStretch
	SemiExpandedStretch
	ExpandedStretch
	ExtraExpandedStretch
	UltraExpandedStretch
]
#enum StyleType! [
	AnyStyle
	NormalStyle
	ItalicStyle
	ObliqueStyle
]
#enum PaintMethod! [
	PointMethod
	ReplaceMethod
	FloodfillMethod
	FillToBorderMethod
	ResetMethod
]
#enum PathMode! [DefaultPathMode AbsolutePathMode RelativePathMode]

#define size_t!  integer!
#define ssize_t! integer!
#define FILE!   integer!
#define MagickWand!   [pointer! [integer!]] ;handle!
#define PixelWand!    [pointer! [integer!]] ;handle!
#define DrawingWand!  [pointer! [integer!]] ;handle!
#define Image!        [pointer! [integer!]] ;handle!
#define AffineMatrix! [pointer! [integer!]] ;handle!
#define PointInfo!    [pointer! [integer!]] ;handle!
#define Quantum! integer!     ;??
#define IndexPacket! integer! ;??
#define ChannelFeatures! [pointer! [integer!]] ;??
#define ChannelStatistics! [pointer! [integer!]] ;??
#define ?MagickProgressMonitor [pointer! [integer!]] ;??

ExceptionType!: alias struct! [value [integer!]]
KernelInfo!: alias struct! [
	type    [KernelInfoType!]
    width   [size_t!]
    height  [size_t!]
    x       [ssize_t!]
    y       [ssize_t!]
    *values [float!]
    minimum [float!]
    maximum [float!]
    negative_range [float!]
    positive_range [float!]
    angle   [float!]
    *next    [KernelInfo!]
    signature [size_t!]
]

#import [
	MAGICK_LIBRARY cdecl [


	;==== source: pixel-wand.reb ====;

		ClearPixelWand: "ClearPixelWand" [
			;== Clears resources associated with the wand
			;-- void ClearPixelWand(PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
		]
		ClonePixelWand: "ClonePixelWand" [
			;== Makes an exact copy of the specified wand
			;-- PixelWand *ClonePixelWand(const PixelWand *wand)
			wand	[PixelWand!] ;the magick wand.
			return: [PixelWand!]
		]
		ClonePixelWands: "ClonePixelWands" [
			;== Makes an exact copy of the specified wands
			;-- PixelWand **ClonePixelWands(const PixelWand **wandsconst size_t number_wands)
			wands	[pointer! [integer!]] ;the magick wands.
			number_wands	[size_t!] ;the number of wands.
			return: [pointer! [integer!]]
		]
		DestroyPixelWand: "DestroyPixelWand" [
			;== Deallocates resources associated with a PixelWand
			;-- PixelWand *DestroyPixelWand(PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [PixelWand!]
		]
		DestroyPixelWands: "DestroyPixelWands" [
			;== Deallocates resources associated with an array of pixel wands
			;-- PixelWand **DestroyPixelWands(PixelWand **wandconst size_t number_wands)
			wand	[pointer! [integer!]] ;the pixel wand.
			number_wands	[size_t!] ;the number of wands.
			return: [pointer! [integer!]]
		]
		IsPixelWandSimilar: "IsPixelWandSimilar" [
			;== Returns MagickTrue if the distance between two colors is less than the specified distance
			;-- MagickBooleanType IsPixelWandSimilar(PixelWand *pPixelWand *qconst double fuzz)
			p	[PixelWand!] ;the pixel wand.
			q	[PixelWand!]
			fuzz	[float!] ;any two colors that are less than or equal to this distance squared are consider similar.
			return: [MagickBooleanType!]
		]
		IsPixelWand: "IsPixelWand" [
			;== Returns MagickTrue if the wand is verified as a pixel wand
			;-- MagickBooleanType IsPixelWand(const PixelWand *wand)
			wand	[PixelWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		NewPixelWand: "NewPixelWand" [
			;== Returns a new pixel wand
			;-- PixelWand *NewPixelWand(void)
			return: [PixelWand!]
		]
		NewPixelWands: "NewPixelWands" [
			;== Returns an array of pixel wands
			;-- PixelWand **NewPixelWands(const size_t number_wands)
			number_wands	[size_t!] ;the number of wands.
			return: [pointer! [integer!]]
		]
		PixelClearException: "PixelClearException" [
			;== Clear any exceptions associated with the iterator
			;-- MagickBooleanType PixelClearException(PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [MagickBooleanType!]
		]
		PixelGetAlpha: "PixelGetAlpha" [
			;== Returns the normalized alpha color of the pixel wand
			;-- double PixelGetAlpha(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [float!]
		]
		PixelGetAlphaQuantum: "PixelGetAlphaQuantum" [
			;== Returns the alpha value of the pixel wand
			;-- Quantum PixelGetAlphaQuantum(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [Quantum!]
		]
		PixelGetBlack: "PixelGetBlack" [
			;== Returns the normalized black color of the pixel wand
			;-- double PixelGetBlack(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [float!]
		]
		PixelGetBlackQuantum: "PixelGetBlackQuantum" [
			;== Returns the black color of the pixel wand
			;-- Quantum PixelGetBlackQuantum(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [Quantum!]
		]
		PixelGetBlue: "PixelGetBlue" [
			;== Returns the normalized blue color of the pixel wand
			;-- double PixelGetBlue(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [float!]
		]
		PixelGetBlueQuantum: "PixelGetBlueQuantum" [
			;== Returns the blue color of the pixel wand
			;-- Quantum PixelGetBlueQuantum(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [Quantum!]
		]
		PixelGetColorAsString: "PixelGetColorAsString" [
			;== Returnsd the color of the pixel wand as a string
			;-- char *PixelGetColorAsString(PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [c-string!]
		]
		PixelGetColorAsNormalizedString: "PixelGetColorAsNormalizedString" [
			;== Returns the normalized color of the pixel wand as a string
			;-- char *PixelGetColorAsNormalizedString(PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [c-string!]
		]
		PixelGetColorCount: "PixelGetColorCount" [
			;== Returns the color count associated with this color
			;-- size_t PixelGetColorCount(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [size_t!]
		]
		PixelGetCyan: "PixelGetCyan" [
			;== Returns the normalized cyan color of the pixel wand
			;-- double PixelGetCyan(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [float!]
		]
		PixelGetCyanQuantum: "PixelGetCyanQuantum" [
			;== Returns the cyan color of the pixel wand
			;-- Quantum PixelGetCyanQuantum(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [Quantum!]
		]
		PixelGetException: "PixelGetException" [
			;== Returns the severity reason and description of any error that occurs when using other methods in this API
			;-- char *PixelGetException(const PixelWand *wandExceptionType *severity)
			wand	[PixelWand!] ;the pixel wand.
			severity	[ExceptionType!] ;the severity of the error is returned here.
			return: [c-string!]
		]
		PixelGetExceptionType: "PixelGetExceptionType" [
			;== The exception type associated with the wand
			;-- ExceptionType PixelGetExceptionType(const PixelWand *wand)
			wand	[PixelWand!] ;the magick wand.
			return: [ExceptionType!]
		]
		PixelGetFuzz: "PixelGetFuzz" [
			;== Returns the normalized fuzz value of the pixel wand
			;-- double PixelGetFuzz(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [float!]
		]
		PixelGetGreen: "PixelGetGreen" [
			;== Returns the normalized green color of the pixel wand
			;-- double PixelGetGreen(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [float!]
		]
		PixelGetGreenQuantum: "PixelGetGreenQuantum" [
			;== Returns the green color of the pixel wand
			;-- Quantum PixelGetGreenQuantum(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [Quantum!]
		]
		PixelGetHSL: "PixelGetHSL" [
			;== Returns the normalized HSL color of the pixel wand
			;-- void PixelGetHSL(const PixelWand *wanddouble *huedouble *saturationdouble *lightness)
			wand	[PixelWand!] ;the pixel wand.
			hue	[pointer! [float!]] ;Return the pixel hue saturation and brightness.
			saturation	[pointer! [float!]]
			lightness	[pointer! [float!]]
		]
		PixelGetIndex: "PixelGetIndex" [
			;== Returns the colormap index from the pixel wand
			;-- IndexPacket PixelGetIndex(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [IndexPacket!]
		]
		PixelGetMagenta: "PixelGetMagenta" [
			;== Returns the normalized magenta color of the pixel wand
			;-- double PixelGetMagenta(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [float!]
		]
		PixelGetMagentaQuantum: "PixelGetMagentaQuantum" [
			;== Returns the magenta color of the pixel wand
			;-- Quantum PixelGetMagentaQuantum(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [Quantum!]
		]
		PixelGetMagickColor: "PixelGetMagickColor" [
			;== Gets the magick color of the pixel wand
			;-- void PixelGetMagickColor(PixelWand *wandMagickPixelPacket *color)
			wand	[PixelWand!] ;the pixel wand.
			color	[int-ptr!] ;The pixel wand color is returned here.
		]
		PixelGetOpacity: "PixelGetOpacity" [
			;== Returns the normalized opacity color of the pixel wand
			;-- double PixelGetOpacity(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [float!]
		]
		PixelGetOpacityQuantum: "PixelGetOpacityQuantum" [
			;== Returns the opacity color of the pixel wand
			;-- Quantum PixelGetOpacityQuantum(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [Quantum!]
		]
		PixelGetQuantumColor: "PixelGetQuantumColor" [
			;== Gets the color of the pixel wand as a PixelPacket
			;-- void PixelGetQuantumColor(PixelWand *wandPixelPacket *color)
			wand	[PixelWand!] ;the pixel wand.
			color	[pointer! [integer!]] ;The pixel wand color is returned here.
		]
		PixelGetRed: "PixelGetRed" [
			;== Returns the normalized red color of the pixel wand
			;-- double PixelGetRed(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [float!]
		]
		PixelGetRedQuantum: "PixelGetRedQuantum" [
			;== Returns the red color of the pixel wand
			;-- Quantum PixelGetRedQuantum(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [Quantum!]
		]
		PixelGetYellow: "PixelGetYellow" [
			;== Returns the normalized yellow color of the pixel wand
			;-- double PixelGetYellow(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [float!]
		]
		PixelGetYellowQuantum: "PixelGetYellowQuantum" [
			;== Returns the yellow color of the pixel wand
			;-- Quantum PixelGetYellowQuantum(const PixelWand *wand)
			wand	[PixelWand!] ;the pixel wand.
			return: [Quantum!]
		]
		PixelSetAlpha: "PixelSetAlpha" [
			;== Sets the normalized alpha color of the pixel wand
			;-- void PixelSetAlpha(PixelWand *wandconst double alpha)
			wand	[PixelWand!] ;the pixel wand.
			alpha	[float!] ;the level of transparency: 1.0 is fully opaque and 0.0 is fully transparent.
		]
		PixelSetAlphaQuantum: "PixelSetAlphaQuantum" [
			;== Sets the alpha color of the pixel wand
			;-- void PixelSetAlphaQuantum(PixelWand *wandconst Quantum opacity)
			wand	[PixelWand!] ;the pixel wand.
			opacity	[Quantum!] ;the opacity color.
		]
		PixelSetBlack: "PixelSetBlack" [
			;== Sets the normalized black color of the pixel wand
			;-- void PixelSetBlack(PixelWand *wandconst double black)
			wand	[PixelWand!] ;the pixel wand.
			black	[float!] ;the black color.
		]
		PixelSetBlackQuantum: "PixelSetBlackQuantum" [
			;== Sets the black color of the pixel wand
			;-- void PixelSetBlackQuantum(PixelWand *wandconst Quantum black)
			wand	[PixelWand!] ;the pixel wand.
			black	[Quantum!] ;the black color.
		]
		PixelSetBlue: "PixelSetBlue" [
			;== Sets the normalized blue color of the pixel wand
			;-- void PixelSetBlue(PixelWand *wandconst double blue)
			wand	[PixelWand!] ;the pixel wand.
			blue	[float!] ;the blue color.
		]
		PixelSetBlueQuantum: "PixelSetBlueQuantum" [
			;== Sets the blue color of the pixel wand
			;-- void PixelSetBlueQuantum(PixelWand *wandconst Quantum blue)
			wand	[PixelWand!] ;the pixel wand.
			blue	[Quantum!] ;the blue color.
		]
		PixelSetColor: "PixelSetColor" [
			;== Sets the color of the PixelWand with an ImageMagick color string (e.g. "blue", "#0000ff", "rgb(0,0,255)", "cmyk(100,100,100,10)", etc.)
			;-- MagickBooleanType PixelSetColor(PixelWand *wandconst char *color)
			wand	[PixelWand!] ;the pixel wand.
			color	[c-string!] ;the pixel wand color.
			return: [MagickBooleanType!]
		]
		PixelSetColorCount: "PixelSetColorCount" [
			;== Sets the color count of the pixel wand
			;-- void PixelSetColorCount(PixelWand *wandconst size_t count)
			wand	[PixelWand!] ;the pixel wand.
			count	[size_t!] ;the number of this particular color.
		]
		PixelSetCyan: "PixelSetCyan" [
			;== Sets the normalized cyan color of the pixel wand
			;-- void PixelSetCyan(PixelWand *wandconst double cyan)
			wand	[PixelWand!] ;the pixel wand.
			cyan	[float!] ;the cyan color.
		]
		PixelSetCyanQuantum: "PixelSetCyanQuantum" [
			;== Sets the cyan color of the pixel wand
			;-- void PixelSetCyanQuantum(PixelWand *wandconst Quantum cyan)
			wand	[PixelWand!] ;the pixel wand.
			cyan	[Quantum!] ;the cyan color.
		]
		PixelSetFuzz: "PixelSetFuzz" [
			;== Sets the fuzz value of the pixel wand
			;-- void PixelSetFuzz(PixelWand *wandconst double fuzz)
			wand	[PixelWand!] ;the pixel wand.
			fuzz	[float!] ;the fuzz value.
		]
		PixelSetGreen: "PixelSetGreen" [
			;== Sets the normalized green color of the pixel wand
			;-- void PixelSetGreen(PixelWand *wandconst double green)
			wand	[PixelWand!] ;the pixel wand.
			green	[float!] ;the green color.
		]
		PixelSetGreenQuantum: "PixelSetGreenQuantum" [
			;== Sets the green color of the pixel wand
			;-- void PixelSetGreenQuantum(PixelWand *wandconst Quantum green)
			wand	[PixelWand!] ;the pixel wand.
			green	[Quantum!] ;the green color.
		]
		PixelSetHSL: "PixelSetHSL" [
			;== Sets the normalized HSL color of the pixel wand
			;-- void PixelSetHSL(PixelWand *wandconst double hueconst double saturationconst double lightness)
			wand	[PixelWand!] ;the pixel wand.
			hue	[float!] ;Return the pixel hue saturation and brightness.
			saturation	[float!]
			lightness	[float!]
		]
		PixelSetIndex: "PixelSetIndex" [
			;== Sets the colormap index of the pixel wand
			;-- void PixelSetIndex(PixelWand *wandconst IndexPacket index)
			wand	[PixelWand!] ;the pixel wand.
			index	[IndexPacket!] ;the colormap index.
		]
		PixelSetMagenta: "PixelSetMagenta" [
			;== Sets the normalized magenta color of the pixel wand
			;-- void PixelSetMagenta(PixelWand *wandconst double magenta)
			wand	[PixelWand!] ;the pixel wand.
			magenta	[float!] ;the magenta color.
		]
		PixelSetMagentaQuantum: "PixelSetMagentaQuantum" [
			;== Sets the magenta color of the pixel wand
			;-- void PixelSetMagentaQuantum(PixelWand *wandconst Quantum magenta)
			wand	[PixelWand!] ;the pixel wand.
			magenta	[Quantum!] ;the green magenta.
		]
		PixelSetOpacity: "PixelSetOpacity" [
			;== Sets the normalized opacity color of the pixel wand
			;-- void PixelSetOpacity(PixelWand *wandconst double opacity)
			wand	[PixelWand!] ;the pixel wand.
			opacity	[float!] ;the opacity color.
		]
		PixelSetOpacityQuantum: "PixelSetOpacityQuantum" [
			;== Sets the opacity color of the pixel wand
			;-- void PixelSetOpacityQuantum(PixelWand *wandconst Quantum opacity)
			wand	[PixelWand!] ;the pixel wand.
			opacity	[Quantum!] ;the opacity color.
		]
		PixelSetRed: "PixelSetRed" [
			;== Sets the normalized red color of the pixel wand
			;-- void PixelSetRed(PixelWand *wandconst double red)
			wand	[PixelWand!] ;the pixel wand.
			red	[float!] ;the red color.
		]
		PixelSetRedQuantum: "PixelSetRedQuantum" [
			;== Sets the red color of the pixel wand
			;-- void PixelSetRedQuantum(PixelWand *wandconst Quantum red)
			wand	[PixelWand!] ;the pixel wand.
			red	[Quantum!] ;the red color.
		]
		PixelSetYellow: "PixelSetYellow" [
			;== Sets the normalized yellow color of the pixel wand
			;-- void PixelSetYellow(PixelWand *wandconst double yellow)
			wand	[PixelWand!] ;the pixel wand.
			yellow	[float!] ;the yellow color.
		]
		PixelSetYellowQuantum: "PixelSetYellowQuantum" [
			;== Sets the yellow color of the pixel wand
			;-- void PixelSetYellowQuantum(PixelWand *wandconst Quantum yellow)
			wand	[PixelWand!] ;the pixel wand.
			yellow	[Quantum!] ;the yellow color.
		]


	;==== source: magick-wand.reb ====;

		ClearMagickWand: "ClearMagickWand" [
			;== Clears resources associated with the wand
			;-- void ClearMagickWand(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
		]
		CloneMagickWand: "CloneMagickWand" [
			;== Makes an exact copy of the specified wand
			;-- MagickWand *CloneMagickWand(const MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickWand!]
		]
		DestroyMagickWand: "DestroyMagickWand" [
			;== Deallocates memory associated with an MagickWand
			;-- MagickWand *DestroyMagickWand(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickWand!]
		]
		IsMagickWand: "IsMagickWand" [
			;== Returns MagickTrue if the wand is verified as a magick wand
			;-- MagickBooleanType IsMagickWand(const MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickClearException: "MagickClearException" [
			;== Clears any exceptions associated with the wand
			;-- MagickBooleanType MagickClearException(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickGetException: "MagickGetException" [
			;== Returns the severity reason and description of any error that occurs when using other methods in this API
			;-- char *MagickGetException(const MagickWand *wandExceptionType *severity)
			wand	[MagickWand!] ;the magick wand.
			severity	[ExceptionType!] ;the severity of the error is returned here.
			return: [c-string!]
		]
		MagickGetExceptionType: "MagickGetExceptionType" [
			;== Returns the exception type associated with the wand
			;-- ExceptionType MagickGetExceptionType(const MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [ExceptionType!]
		]
		MagickGetIteratorIndex: "MagickGetIteratorIndex" [
			;== Returns the position of the iterator in the image list
			;-- ssize_t MagickGetIteratorIndex(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [ssize_t!]
		]
		MagickQueryConfigureOption: "MagickQueryConfigureOption" [
			;== Returns the value associated with the specified configure option
			;-- char *MagickQueryConfigureOption(const char *option)
			option	[c-string!] ;the option name.
			return: [c-string!]
		]
		MagickQueryConfigureOptions: "MagickQueryConfigureOptions" [
			;== Returns any configure options that match the specified pattern (e
			;-- char **MagickQueryConfigureOptions(const char *patternsize_t *number_options)
			pattern	[c-string!] ;Specifies a pointer to a text string containing a pattern.
			number_options	[pointer! [size_t!]] ;Returns the number of configure options in the list.
			return: [str-array!]
		]
		MagickQueryFontMetrics: "MagickQueryFontMetrics" [
			;== Returns a 13 element array representing the following font metrics:
			;-- double *MagickQueryFontMetrics(MagickWand *wandconst DrawingWand *drawing_wandconst char *text)
			wand	[MagickWand!] ;the Magick wand.
			drawing_wand	[DrawingWand!] ;the drawing wand.
			text	[c-string!] ;the text.
			return: [pointer! [float!]]
		]
		MagickQueryMultilineFontMetrics: "MagickQueryMultilineFontMetrics" [
			;== Returns a 13 element array representing the following font metrics:
			;-- double *MagickQueryMultilineFontMetrics(MagickWand *wandconst DrawingWand *drawing_wandconst char *text)
			wand	[MagickWand!] ;the Magick wand.
			drawing_wand	[DrawingWand!] ;the drawing wand.
			text	[c-string!] ;the text.
			return: [pointer! [float!]]
		]
		MagickQueryFonts: "MagickQueryFonts" [
			;== Returns any font that match the specified pattern (e
			;-- char **MagickQueryFonts(const char *patternsize_t *number_fonts)
			pattern	[c-string!] ;Specifies a pointer to a text string containing a pattern.
			number_fonts	[pointer! [size_t!]] ;Returns the number of fonts in the list.
			return: [str-array!]
		]
		MagickQueryFormats: "MagickQueryFormats" [
			;== Returns any image formats that match the specified pattern (e
			;-- char **MagickQueryFormats(const char *patternsize_t *number_formats)
			pattern	[c-string!] ;Specifies a pointer to a text string containing a pattern.
			number_formats	[pointer! [size_t!]] ;This integer returns the number of image formats in the list.
			return: [str-array!]
		]
		MagickRelinquishMemory: "MagickRelinquishMemory" [
			;== Relinquishes memory resources returned by such methods as MagickIdentifyImage() MagickGetException() etc
			;-- void *MagickRelinquishMemory(void *resource)
			resource	[c-string!] ;Relinquish the memory associated with this resource.
		]
		MagickResetIterator: "MagickResetIterator" [
			;== Resets the wand iterator
			;-- void MagickResetIterator(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
		]
		MagickSetFirstIterator: "MagickSetFirstIterator" [
			;== Sets the wand iterator to the first image
			;-- void MagickSetFirstIterator(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
		]
		MagickSetIteratorIndex: "MagickSetIteratorIndex" [
			;== Set the iterator to the position in the image list specified with the index parameter
			;-- MagickBooleanType MagickSetIteratorIndex(MagickWand *wandconst ssize_t index)
			wand	[MagickWand!] ;the magick wand.
			index	[ssize_t!] ;the scene number.
			return: [MagickBooleanType!]
		]
		MagickSetLastIterator: "MagickSetLastIterator" [
			;== Sets the wand iterator to the last image
			;-- void MagickSetLastIterator(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
		]
		MagickWandGenesis: "MagickWandGenesis" [
			;== Initializes the MagickWand environment
			;-- void MagickWandGenesis(void)
		]
		MagickWandTerminus: "MagickWandTerminus" [
			;== Terminates the MagickWand environment
			;-- void MagickWandTerminus(void)
		]
		NewMagickWand: "NewMagickWand" [
			;== Returns a wand required for all other methods in the API
			;-- MagickWand *NewMagickWand(void)
			return: [MagickWand!]
		]
		NewMagickWandFromImage: "NewMagickWandFromImage" [
			;== Returns a wand with an image
			;-- MagickWand *NewMagickWandFromImage(const Image *image)
			image	[Image!] ;the image.
			return: [MagickWand!]
		]


	;==== source: magick-image.reb ====;

		GetImageFromMagickWand: "GetImageFromMagickWand" [
			;== Returns the current image from the magick wand
			;-- Image *GetImageFromMagickWand(const MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [Image!]
		]
		MagickAdaptiveBlurImage: "MagickAdaptiveBlurImage" [
			;== Adaptively blurs the image by blurring less intensely near image edges and more intensely far from edges
			;-- MagickBooleanType MagickAdaptiveBlurImage(MagickWand *wandconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			return: [MagickBooleanType!]
		]
		MagickAdaptiveBlurImageChannel: "MagickAdaptiveBlurImageChannel" [
			;== Adaptively blurs the image by blurring less intensely near image edges and more intensely far from edges
			;-- MagickBooleanType MagickAdaptiveBlurImageChannel(MagickWand *wandconst ChannelType channelconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			return: [MagickBooleanType!]
		]
		MagickAdaptiveResizeImage: "MagickAdaptiveResizeImage" [
			;== Adaptively resize image with data dependent triangulation
			;-- MagickBooleanType MagickAdaptiveResizeImage(MagickWand *wand const size_t columnsconst size_t rows)
			wand	[MagickWand!] ;the magick wand.
			columns	[size_t!] ;the number of columns in the scaled image.
			rows	[size_t!] ;the number of rows in the scaled image.
			return: [MagickBooleanType!]
		]
		MagickAdaptiveSharpenImage: "MagickAdaptiveSharpenImage" [
			;== Adaptively sharpens the image by sharpening more intensely near image edges and less intensely far from edges
			;-- MagickBooleanType MagickAdaptiveSharpenImage(MagickWand *wandconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			return: [MagickBooleanType!]
		]
		MagickAdaptiveSharpenImageChannel: "MagickAdaptiveSharpenImageChannel" [
			;== Adaptively sharpens the image by sharpening more intensely near image edges and less intensely far from edges
			;-- MagickBooleanType MagickAdaptiveSharpenImageChannel(MagickWand *wandconst ChannelType channelconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			return: [MagickBooleanType!]
		]
		MagickAdaptiveThresholdImage: "MagickAdaptiveThresholdImage" [
			;== Selects an individual threshold for each pixel based on the range of intensity values in its local neighborhood
			;-- MagickBooleanType MagickAdaptiveThresholdImage(MagickWand *wandconst size_t widthconst size_t heightconst ssize_t offset)
			wand	[MagickWand!] ;the magick wand.
			width	[size_t!] ;the width of the local neighborhood.
			height	[size_t!] ;the height of the local neighborhood.
			offset	[ssize_t!] ;the mean offset.
			return: [MagickBooleanType!]
		]
		MagickAddImage: "MagickAddImage" [
			;== Adds the specified images at the current image location
			;-- MagickBooleanType MagickAddImage(MagickWand *wandconst MagickWand *add_wand)
			wand	[MagickWand!] ;the magick wand.
			add_wand	[MagickWand!] ;A wand that contains images to add at the current image location.
			return: [MagickBooleanType!]
		]
		MagickAddNoiseImage: "MagickAddNoiseImage" [
			;== Adds random noise to the image
			;-- MagickBooleanType MagickAddNoiseImage(MagickWand *wandconst NoiseType noise_type)
			wand	[MagickWand!] ;the magick wand.
			noise_type	[NoiseType!] ;The type of noise: Uniform Gaussian Multiplicative Impulse Laplacian or Poisson.
			return: [MagickBooleanType!]
		]
		MagickAddNoiseImageChannel: "MagickAddNoiseImageChannel" [
			;== Adds random noise to the image
			;-- MagickBooleanType MagickAddNoiseImageChannel(MagickWand *wandconst ChannelType channelconst NoiseType noise_type)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			noise_type	[NoiseType!] ;The type of noise: Uniform Gaussian Multiplicative Impulse Laplacian or Poisson.
			return: [MagickBooleanType!]
		]
		MagickAffineTransformImage: "MagickAffineTransformImage" [
			;== Transforms an image as dictated by the affine matrix of the drawing wand
			;-- MagickBooleanType MagickAffineTransformImage(MagickWand *wandconst DrawingWand *drawing_wand)
			wand	[MagickWand!] ;the magick wand.
			drawing_wand	[DrawingWand!] ;the draw wand.
			return: [MagickBooleanType!]
		]
		MagickAnnotateImage: "MagickAnnotateImage" [
			;== Annotates an image with text
			;-- MagickBooleanType MagickAnnotateImage(MagickWand *wandconst DrawingWand *drawing_wandconst double xconst double yconst double angleconst char *text)
			wand	[MagickWand!] ;the magick wand.
			drawing_wand	[DrawingWand!] ;the draw wand.
			x	[float!] ;x ordinate to left of text
			y	[float!] ;y ordinate to text baseline
			angle	[float!] ;rotate text relative to this angle.
			text	[c-string!] ;text to draw
			return: [MagickBooleanType!]
		]
		MagickAnimateImages: "MagickAnimateImages" [
			;== Animates an image or image sequence
			;-- MagickBooleanType MagickAnimateImages(MagickWand *wandconst char *server_name)
			wand	[MagickWand!] ;the magick wand.
			server_name	[c-string!] ;the X server name.
			return: [MagickBooleanType!]
		]
		MagickAppendImages: "MagickAppendImages" [
			;== Append a set of images
			;-- MagickWand *MagickAppendImages(MagickWand *wandconst MagickBooleanType stack)
			wand	[MagickWand!] ;the magick wand.
			stack	[MagickBooleanType!] ;By default images are stacked left-to-right. Set stack to MagickTrue to stack them top-to-bottom.
			return: [MagickWand!]
		]
		MagickAutoGammaImage: "MagickAutoGammaImage" [
			;== Extracts the 'mean' from the image and adjust the image to try make set its gamma appropriatally
			;-- MagickBooleanType MagickAutoGammaImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickAutoGammaImageChannel: "MagickAutoGammaImageChannel" [
			;== Extracts the 'mean' from the image and adjust the image to try make set its gamma appropriatally
			;-- MagickBooleanType MagickAutoGammaImageChannel(MagickWand *wandconst ChannelType channel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			return: [MagickBooleanType!]
		]
		MagickAutoLevelImage: "MagickAutoLevelImage" [
			;== Adjusts the levels of a particular image channel by scaling the minimum and maximum values to the full quantum range
			;-- MagickBooleanType MagickAutoLevelImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickAutoLevelImageChannel: "MagickAutoLevelImageChannel" [
			;== Adjusts the levels of a particular image channel by scaling the minimum and maximum values to the full quantum range
			;-- MagickBooleanType MagickAutoLevelImageChannel(MagickWand *wandconst ChannelType channel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			return: [MagickBooleanType!]
		]
		MagickBlackThresholdImage: "MagickBlackThresholdImage" [
			;== Is like MagickThresholdImage() but  forces all pixels below the threshold into black while leaving all pixels above the threshold unchanged
			;-- MagickBooleanType MagickBlackThresholdImage(MagickWand *wandconst PixelWand *threshold)
			wand	[MagickWand!] ;the magick wand.
			threshold	[PixelWand!] ;the pixel wand.
			return: [MagickBooleanType!]
		]
		MagickBlueShiftImage: "MagickBlueShiftImage" [
			;== Mutes the colors of the image to simulate a scene at nighttime in the moonlight
			;-- MagickBooleanType MagickBlueShiftImage(MagickWand *wandconst double factor)
			wand	[MagickWand!] ;the magick wand.
			factor	[float!] ;the blue shift factor (default 1.5)
			return: [MagickBooleanType!]
		]
		MagickBlurImage: "MagickBlurImage" [
			;== Blurs an image
			;-- MagickBooleanType MagickBlurImage(MagickWand *wandconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the  in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the  in pixels.
			return: [MagickBooleanType!]
		]
		MagickBlurImageChannel: "MagickBlurImageChannel" [
			;== Blurs an image
			;-- MagickBooleanType MagickBlurImageChannel(MagickWand *wandconst ChannelType channelconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			radius	[float!] ;the radius of the  in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the  in pixels.
			return: [MagickBooleanType!]
		]
		MagickBorderImage: "MagickBorderImage" [
			;== Surrounds the image with a border of the color defined by the bordercolor pixel wand
			;-- MagickBooleanType MagickBorderImage(MagickWand *wandconst PixelWand *bordercolorconst size_t widthconst size_t height)
			wand	[MagickWand!] ;the magick wand.
			bordercolor	[PixelWand!] ;the border color pixel wand.
			width	[size_t!] ;the border width.
			height	[size_t!] ;the border height.
			return: [MagickBooleanType!]
		]
		MagickBrightnessContrastImage: "MagickBrightnessContrastImage" [
			;== To change the brightness and/or contrast of an image
			;-- MagickBooleanType MagickBrightnessContrastImage(MagickWand *wandconst double brightnessconst double contrast)
			wand	[MagickWand!] ;the magick wand.
			brightness	[float!] ;the brightness percent (-100 .. 100).
			contrast	[float!] ;the contrast percent (-100 .. 100).
			return: [MagickBooleanType!]
		]
		MagickBrightnessContrastImageChannel: "MagickBrightnessContrastImageChannel" [
			;== To change the brightness and/or contrast of an image
			;-- MagickBooleanType MagickBrightnessContrastImageChannel(MagickWand *wandconst ChannelType channelconst double brightnessconst double contrast)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			brightness	[float!] ;the brightness percent (-100 .. 100).
			contrast	[float!] ;the contrast percent (-100 .. 100).
			return: [MagickBooleanType!]
		]
		MagickCharcoalImage: "MagickCharcoalImage" [
			;== Simulates a charcoal drawing
			;-- MagickBooleanType MagickCharcoalImage(MagickWand *wandconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			return: [MagickBooleanType!]
		]
		MagickChopImage: "MagickChopImage" [
			;== Removes a region of an image and collapses the image to occupy the removed portion
			;-- MagickBooleanType MagickChopImage(MagickWand *wandconst size_t widthconst size_t heightconst ssize_t xconst ssize_t y)
			wand	[MagickWand!] ;the magick wand.
			width	[size_t!] ;the region width.
			height	[size_t!] ;the region height.
			x	[ssize_t!] ;the region x offset.
			y	[ssize_t!] ;the region y offset.
			return: [MagickBooleanType!]
		]
		MagickClampImage: "MagickClampImage" [
			;== Restricts the color range from 0 to the quantum depth
			;-- MagickBooleanType MagickClampImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickClampImageChannel: "MagickClampImageChannel" [
			;== Restricts the color range from 0 to the quantum depth
			;-- MagickBooleanType MagickClampImageChannel(MagickWand *wandconst ChannelType channel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the channel.
			return: [MagickBooleanType!]
		]
		MagickClipImage: "MagickClipImage" [
			;== Clips along the first path from the 8BIM profile if present
			;-- MagickBooleanType MagickClipImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickClipImagePath: "MagickClipImagePath" [
			;== Clips along the named paths from the 8BIM profile if present
			;-- MagickBooleanType MagickClipImagePath(MagickWand *wandconst char *pathnameconst MagickBooleanType inside)
			wand	[MagickWand!] ;the magick wand.
			pathname	[c-string!] ;name of clipping path resource. If name is preceded by # use clipping path numbered by name.
			inside	[MagickBooleanType!] ;if non-zero later operations take effect inside clipping path. Otherwise later operations take effect outside clipping path.
			return: [MagickBooleanType!]
		]
		MagickClutImage: "MagickClutImage" [
			;== Replaces colors in the image from a color lookup table
			;-- MagickBooleanType MagickClutImage(MagickWand *wandconst MagickWand *clut_wand)
			wand	[MagickWand!] ;the magick wand.
			clut_wand	[MagickWand!]
			return: [MagickBooleanType!]
		]
		MagickClutImageChannel: "MagickClutImageChannel" [
			;== Replaces colors in the image from a color lookup table
			;-- MagickBooleanType MagickClutImageChannel(MagickWand *wandconst ChannelType channelconst MagickWand *clut_wand)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!]
			clut_wand	[MagickWand!]
			return: [MagickBooleanType!]
		]
		MagickCoalesceImages: "MagickCoalesceImages" [
			;== Composites a set of images while respecting any page offsets and disposal methods
			;-- MagickWand *MagickCoalesceImages(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickWand!]
		]
		MagickColorDecisionListImage: "MagickColorDecisionListImage" [
			;== Accepts a lightweight Color Correction Collection (CCC) file which solely contains one or more color corrections and applies the color correction to the image
			;-- MagickBooleanType MagickColorDecisionListImage(MagickWand *wand const char *color_correction_collection)
			wand	[MagickWand!] ;the magick wand.
			color_correction_collection	[c-string!] ;the color correction collection in XML.
			return: [MagickBooleanType!]
		]
		MagickColorizeImage: "MagickColorizeImage" [
			;== Blends the fill color with each pixel in the image
			;-- MagickBooleanType MagickColorizeImage(MagickWand *wandconst PixelWand *colorizeconst PixelWand *opacity)
			wand	[MagickWand!] ;the magick wand.
			colorize	[PixelWand!] ;the colorize pixel wand.
			opacity	[PixelWand!] ;the opacity pixel wand.
			return: [MagickBooleanType!]
		]
		MagickColorMatrixImage: "MagickColorMatrixImage" [
			;== Apply color transformation to an image
			;-- MagickBooleanType MagickColorMatrixImage(MagickWand *wandconst KernelInfo *color_matrix)
			wand	[MagickWand!] ;the magick wand.
			color_matrix	[KernelInfo!] ;the color matrix.
			return: [MagickBooleanType!]
		]
		MagickCombineImages: "MagickCombineImages" [
			;== Combines one or more images into a single image
			;-- MagickWand *MagickCombineImages(MagickWand *wandconst ChannelType channel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the channel.
			return: [MagickWand!]
		]
		MagickCommentImage: "MagickCommentImage" [
			;== Adds a comment to your image
			;-- MagickBooleanType MagickCommentImage(MagickWand *wandconst char *comment)
			wand	[MagickWand!] ;the magick wand.
			comment	[c-string!] ;the image comment.
			return: [MagickBooleanType!]
		]
		MagickCompareImageChannels: "MagickCompareImageChannels" [
			;== Compares one or more image channels of an image to a reconstructed image and returns the difference image
			;-- MagickWand *MagickCompareImageChannels(MagickWand *wandconst MagickWand *referenceconst ChannelType channelconst MetricType metricdouble *distortion)
			wand	[MagickWand!] ;the magick wand.
			reference	[MagickWand!] ;the reference wand.
			channel	[ChannelType!] ;the channel.
			metric	[MetricType!] ;the metric.
			distortion	[pointer! [float!]] ;the computed distortion between the images.
			return: [MagickWand!]
		]
		MagickCompareImageLayers: "MagickCompareImageLayers" [
			;== Compares each image with the next in a sequence and returns the maximum bounding region of any pixel differences it discovers
			;-- MagickWand *MagickCompareImageLayers(MagickWand *wandconst ImageLayerMethod method)
			wand	[MagickWand!] ;the magick wand.
			method	[ImageLayerMethod!] ;the compare method.
			return: [MagickWand!]
		]
		MagickCompareImages: "MagickCompareImages" [
			;== Compares an image to a reconstructed image and returns the specified difference image
			;-- MagickWand *MagickCompareImages(MagickWand *wandconst MagickWand *referenceconst MetricType metricdouble *distortion)
			wand	[MagickWand!] ;the magick wand.
			reference	[MagickWand!] ;the reference wand.
			metric	[MetricType!] ;the metric.
			distortion	[pointer! [float!]] ;the computed distortion between the images.
			return: [MagickWand!]
		]
		MagickCompositeImage: "MagickCompositeImage" [
			;== Composite one image onto another at the specified offset
			;-- MagickBooleanType MagickCompositeImage(MagickWand *wand const MagickWand *source_wandconst CompositeOperator compose const MagickBooleanType clip_to_selfconst ssize_t xconst ssize_t y)
			wand	[MagickWand!] ;the magick wand.
			composite_wand	[MagickWand!]
			compose	[CompositeOperator!] ;This operator affects how the composite is applied to the image.  The default is Over.
			clip_to_self [MagickBooleanType!] ;set to MagickTrue to limit composition to area composed.
			x	[ssize_t!] ;the column offset of the composited image.
			y	[ssize_t!] ;the row offset of the composited image.
			return: [MagickBooleanType!]
		]
		MagickCompositeImageChannel: "MagickCompositeImageChannel" [
			;== Composite one image onto another at the specified offset
			;-- MagickBooleanType MagickCompositeImageChannel(MagickWand *wandconst ChannelType channelconst MagickWand *composite_wandconst CompositeOperator composeconst ssize_t xconst ssize_t y)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!]
			composite_wand	[MagickWand!]
			compose	[CompositeOperator!] ;This operator affects how the composite is applied to the image.  The default is Over.  Choose from these operators:
			x	[ssize_t!] ;the column offset of the composited image.
			y	[ssize_t!] ;the row offset of the composited image.
			return: [MagickBooleanType!]
		]
		MagickContrastImage: "MagickContrastImage" [
			;== Enhances the intensity differences between the lighter and darker elements of the image
			;-- MagickBooleanType MagickContrastImage(MagickWand *wandconst MagickBooleanType sharpen)
			wand	[MagickWand!] ;the magick wand.
			sharpen	[MagickBooleanType!] ;Increase or decrease image contrast.
			return: [MagickBooleanType!]
		]
		MagickContrastStretchImage: "MagickContrastStretchImage" [
			;== Enhances the contrast of a color image by adjusting the pixels color to span the entire range of colors available
			;-- MagickBooleanType MagickContrastStretchImage(MagickWand *wandconst double black_pointconst double white_point)
			wand	[MagickWand!] ;the magick wand.
			black_point	[float!] ;the black point.
			white_point	[float!] ;the white point.
			return: [MagickBooleanType!]
		]
		MagickContrastStretchImageChannel: "MagickContrastStretchImageChannel" [
			;== Enhances the contrast of a color image by adjusting the pixels color to span the entire range of colors available
			;-- MagickBooleanType MagickContrastStretchImageChannel(MagickWand *wandconst ChannelType channelconst double black_pointconst double white_point)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			black_point	[float!] ;the black point.
			white_point	[float!] ;the white point.
			return: [MagickBooleanType!]
		]
		MagickConvolveImage: "MagickConvolveImage" [
			;== Applies a custom convolution kernel to the image
			;-- MagickBooleanType MagickConvolveImage(MagickWand *wandconst size_t orderconst double *kernel)
			wand	[MagickWand!] ;the magick wand.
			order	[size_t!] ;the number of columns and rows in the filter kernel.
			kernel	[pointer! [float!]] ;An array of doubles representing the convolution kernel.
			return: [MagickBooleanType!]
		]
		MagickConvolveImageChannel: "MagickConvolveImageChannel" [
			;== Applies a custom convolution kernel to the image
			;-- MagickBooleanType MagickConvolveImageChannel(MagickWand *wandconst ChannelType channelconst size_t orderconst double *kernel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			order	[size_t!] ;the number of columns and rows in the filter kernel.
			kernel	[pointer! [float!]] ;An array of doubles representing the convolution kernel.
			return: [MagickBooleanType!]
		]
		MagickCropImage: "MagickCropImage" [
			;== Extracts a region of the image
			;-- MagickBooleanType MagickCropImage(MagickWand *wandconst size_t widthconst size_t heightconst ssize_t xconst ssize_t y)
			wand	[MagickWand!] ;the magick wand.
			width	[size_t!] ;the region width.
			height	[size_t!] ;the region height.
			x	[ssize_t!] ;the region x-offset.
			y	[ssize_t!] ;the region y-offset.
			return: [MagickBooleanType!]
		]
		MagickCycleColormapImage: "MagickCycleColormapImage" [
			;== Displaces an image's colormap by a given number of positions
			;-- MagickBooleanType MagickCycleColormapImage(MagickWand *wandconst ssize_t displace)
			wand	[MagickWand!] ;the magick wand.
			displace	[ssize_t!]
			return: [MagickBooleanType!]
		]
		MagickConstituteImage: "MagickConstituteImage" [
			;== Adds an image to the wand comprised of the pixel data you supply
			;-- MagickBooleanType MagickConstituteImage(MagickWand *wandconst size_t columnsconst size_t rowsconst char *mapconst StorageType storagevoid *pixels)
			wand	[MagickWand!] ;the magick wand.
			columns	[size_t!] ;width in pixels of the image.
			rows	[size_t!] ;height in pixels of the image.
			map	[c-string!] ;This string reflects the expected ordering of the pixel array. It can be any combination or order of R = red G = green B = blue A = alpha (0 is transparent) O = opacity (0 is opaque) C = cyan Y = yellow M = magenta K = black I = intensity (for grayscale) P = pad.
			storage	[StorageType!] ;Define the data type of the pixels.  Float and double types are expected to be normalized [0..1] otherwise [0..QuantumRange].  Choose from these types: CharPixel DoublePixel FloatPixel IntegerPixel LongPixel QuantumPixel or ShortPixel.
			pixels	[pointer! [byte!]] ;This array of values contain the pixel components as defined by map and type.  You must preallocate this array where the expected length varies depending on the values of width height map and type.
			return: [MagickBooleanType!]
		]
		MagickDecipherImage: "MagickDecipherImage" [
			;== Converts cipher pixels to plain pixels
			;-- MagickBooleanType MagickDecipherImage(MagickWand *wandconst char *passphrase)
			wand	[MagickWand!] ;the magick wand.
			passphrase	[c-string!] ;the passphrase.
			return: [MagickBooleanType!]
		]
		MagickDeconstructImages: "MagickDeconstructImages" [
			;== Compares each image with the next in a sequence and returns the maximum bounding region of any pixel differences it discovers
			;-- MagickWand *MagickDeconstructImages(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickWand!]
		]
		MagickDeskewImage: "MagickDeskewImage" [
			;== Removes skew from the image
			;-- MagickBooleanType MagickDeskewImage(MagickWand *wandconst double threshold)
			wand	[MagickWand!] ;the magick wand.
			threshold	[float!] ;separate background from foreground.
			return: [MagickBooleanType!]
		]
		MagickDespeckleImage: "MagickDespeckleImage" [
			;== Reduces the speckle noise in an image while perserving the edges of the original image
			;-- MagickBooleanType MagickDespeckleImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickDestroyImage: "MagickDestroyImage" [
			;== Dereferences an image deallocating memory associated with the image if the reference count becomes zero
			;-- Image *MagickDestroyImage(Image *image)
			image	[Image!] ;the image.
			return: [Image!]
		]
		MagickDisplayImage: "MagickDisplayImage" [
			;== Displays an image
			;-- MagickBooleanType MagickDisplayImage(MagickWand *wandconst char *server_name)
			wand	[MagickWand!] ;the magick wand.
			server_name	[c-string!] ;the X server name.
			return: [MagickBooleanType!]
		]
		MagickDisplayImages: "MagickDisplayImages" [
			;== Displays an image or image sequence
			;-- MagickBooleanType MagickDisplayImages(MagickWand *wandconst char *server_name)
			wand	[MagickWand!] ;the magick wand.
			server_name	[c-string!] ;the X server name.
			return: [MagickBooleanType!]
		]
		MagickDistortImage: "MagickDistortImage" [
			;== Distorts an image using various distortion methods by mapping color lookups of the source image to a new destination image usally of the same size as the source image unless 'bestfit' is set to true
			;-- MagickBooleanType MagickDistortImage(MagickWand *wandconst DistortImageMethod methodconst size_t number_argumentsconst double *argumentsconst MagickBooleanType bestfit)
			wand	[MagickWand!]
			method	[DistortImageMethod!] ;the method of image distortion.
			number_arguments	[size_t!] ;the number of arguments given for this distortion method.
			arguments	[pointer! [float!]] ;the arguments for this distortion method.
			bestfit	[MagickBooleanType!] ;Attempt to resize destination to fit distorted source.
			return: [MagickBooleanType!]
		]
		MagickDrawImage: "MagickDrawImage" [
			;== Renders the drawing wand on the current image
			;-- MagickBooleanType MagickDrawImage(MagickWand *wandconst DrawingWand *drawing_wand)
			wand	[MagickWand!] ;the magick wand.
			drawing_wand	[DrawingWand!] ;the draw wand.
			return: [MagickBooleanType!]
		]
		MagickEdgeImage: "MagickEdgeImage" [
			;== Enhance edges within the image with a convolution filter of the given radius
			;-- MagickBooleanType MagickEdgeImage(MagickWand *wandconst double radius)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the pixel neighborhood.
			return: [MagickBooleanType!]
		]
		MagickEmbossImage: "MagickEmbossImage" [
			;== Returns a grayscale image with a three-dimensional effect
			;-- MagickBooleanType MagickEmbossImage(MagickWand *wandconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			return: [MagickBooleanType!]
		]
		MagickEncipherImage: "MagickEncipherImage" [
			;== Converts plaint pixels to cipher pixels
			;-- MagickBooleanType MagickEncipherImage(MagickWand *wandconst char *passphrase)
			wand	[MagickWand!] ;the magick wand.
			passphrase	[c-string!] ;the passphrase.
			return: [MagickBooleanType!]
		]
		MagickEnhanceImage: "MagickEnhanceImage" [
			;== Applies a digital filter that improves the quality of a noisy image
			;-- MagickBooleanType MagickEnhanceImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickEqualizeImage: "MagickEqualizeImage" [
			;== Equalizes the image histogram
			;-- MagickBooleanType MagickEqualizeImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickEqualizeImageChannel: "MagickEqualizeImageChannel" [
			;== Equalizes the image histogram
			;-- MagickBooleanType MagickEqualizeImageChannel(MagickWand *wandconst ChannelType channel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			return: [MagickBooleanType!]
		]
		MagickEvaluateImage: "MagickEvaluateImage" [
			;== Applys an arithmetic relational or logical expression to an image
			;-- MagickBooleanType MagickEvaluateImage(MagickWand *wandconst MagickEvaluateOperator operatorconst double value)
			wand	[MagickWand!] ;the magick wand.
			operator	[MagickEvaluateOperator!]
			value	[float!] ;A value value.
			return: [MagickBooleanType!]
		]
		MagickEvaluateImages: "MagickEvaluateImages" [
			;== Applys an arithmetic relational or logical expression to an image
			;-- MagickBooleanType MagickEvaluateImages(MagickWand *wandconst MagickEvaluateOperator operator)
			wand	[MagickWand!] ;the magick wand.
			operator	[MagickEvaluateOperator!]
			return: [MagickBooleanType!]
		]
		MagickEvaluateImageChannel: "MagickEvaluateImageChannel" [
			;== Applys an arithmetic relational or logical expression to an image
			;-- MagickBooleanType MagickEvaluateImageChannel(MagickWand *wandconst ChannelType channelconst MagickEvaluateOperator opconst double value)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the channel(s).
			op	[MagickEvaluateOperator!] ;A channel operator.
			value	[float!] ;A value value.
			return: [MagickBooleanType!]
		]
		MagickExportImagePixels: "MagickExportImagePixels" [
			;== Extracts pixel data from an image and returns it to you
			;-- MagickBooleanType MagickExportImagePixels(MagickWand *wandconst ssize_t xconst ssize_t yconst size_t columnsconst size_t rowsconst char *mapconst StorageType storagevoid *pixels)
			wand	[MagickWand!] ;the magick wand.
			x	[ssize_t!] ;These values define the perimeter of a region of pixels you want to extract.
			y	[ssize_t!]
			columns	[size_t!]
			rows	[size_t!]
			map	[c-string!] ;This string reflects the expected ordering of the pixel array. It can be any combination or order of R = red G = green B = blue A = alpha (0 is transparent) O = opacity (0 is opaque) C = cyan Y = yellow M = magenta K = black I = intensity (for grayscale) P = pad.
			storage	[StorageType!] ;Define the data type of the pixels.  Float and double types are expected to be normalized [0..1] otherwise [0..QuantumRange].  Choose from these types: CharPixel DoublePixel FloatPixel IntegerPixel LongPixel QuantumPixel or ShortPixel.
			pixels	[pointer! [byte!]] ;This array of values contain the pixel components as defined by map and type.  You must preallocate this array where the expected length varies depending on the values of width height map and type.
			return: [MagickBooleanType!]
		]
		MagickExtentImage: "MagickExtentImage" [
			;== Extends the image as defined by the geometry gravity and wand background color
			;-- MagickBooleanType MagickExtentImage(MagickWand *wandconst size_t widthconst size_t heightconst ssize_t xconst ssize_t y)
			wand	[MagickWand!] ;the magick wand.
			width	[size_t!] ;the region width.
			height	[size_t!] ;the region height.
			x	[ssize_t!] ;the region x offset.
			y	[ssize_t!] ;the region y offset.
			return: [MagickBooleanType!]
		]
		MagickFilterImage: "MagickFilterImage" [
			;== Applies a custom convolution kernel to the image
			;-- MagickBooleanType MagickFilterImage(MagickWand *wandconst KernelInfo *kernel)
			wand	[MagickWand!] ;the magick wand.
			kernel	[KernelInfo!] ;An array of doubles representing the convolution kernel.
			return: [MagickBooleanType!]
		]
		MagickFilterImageChannel: "MagickFilterImageChannel" [
			;== Applies a custom convolution kernel to the image
			;-- MagickBooleanType MagickFilterImageChannel(MagickWand *wandconst ChannelType channelconst KernelInfo *kernel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			kernel	[KernelInfo!] ;An array of doubles representing the convolution kernel.
			return: [MagickBooleanType!]
		]
		MagickFlipImage: "MagickFlipImage" [
			;== Creates a vertical mirror image by reflecting the pixels around the central x-axis
			;-- MagickBooleanType MagickFlipImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickFloodfillPaintImage: "MagickFloodfillPaintImage" [
			;== Changes the color value of any pixel that matches target and is an immediate neighbor
			;-- MagickBooleanType MagickFloodfillPaintImage(MagickWand *wandconst ChannelType channelconst PixelWand *fillconst double fuzzconst PixelWand *bordercolorconst ssize_t xconst ssize_t yconst MagickBooleanType invert)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the channel(s).
			fill	[PixelWand!] ;the floodfill color pixel wand.
			fuzz	[float!] ;By default target must match a particular pixel color exactly.  However in many cases two colors may differ by a small amount. The fuzz member of image defines how much tolerance is acceptable to consider two colors as the same.  For example set fuzz to 10 and the color red at intensities of 100 and 102 respectively are now interpreted as the same color for the purposes of the floodfill.
			bordercolor	[PixelWand!] ;the border color pixel wand.
			x	[ssize_t!] ;the starting location of the operation.
			y	[ssize_t!]
			invert	[MagickBooleanType!] ;paint any pixel that does not match the target color.
			return: [MagickBooleanType!]
		]
		MagickFlopImage: "MagickFlopImage" [
			;== Creates a horizontal mirror image by reflecting the pixels around the central y-axis
			;-- MagickBooleanType MagickFlopImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickForwardFourierTransformImage: "MagickForwardFourierTransformImage" [
			;== Implements the discrete Fourier transform (DFT) of the image either as a magnitude / phase or real / imaginary image pair
			;-- MagickBooleanType MagickForwardFourierTransformImage(MagickWand *wandconst MagickBooleanType magnitude)
			wand	[MagickWand!] ;the magick wand.
			magnitude	[MagickBooleanType!] ;if true return as magnitude / phase pair otherwise a real / imaginary image pair.
			return: [MagickBooleanType!]
		]
		MagickFrameImage: "MagickFrameImage" [
			;== Adds a simulated three-dimensional border around the image
			;-- MagickBooleanType MagickFrameImage(MagickWand *wandconst PixelWand *matte_colorconst size_t widthconst size_t heightconst ssize_t inner_bevelconst ssize_t outer_bevel)
			wand	[MagickWand!] ;the magick wand.
			matte_color	[PixelWand!] ;the frame color pixel wand.
			width	[size_t!] ;the border width.
			height	[size_t!] ;the border height.
			inner_bevel	[ssize_t!] ;the inner bevel width.
			outer_bevel	[ssize_t!] ;the outer bevel width.
			return: [MagickBooleanType!]
		]
		MagickFunctionImage: "MagickFunctionImage" [
			;== Applys an arithmetic relational or logical expression to an image
			;-- MagickBooleanType MagickFunctionImage(MagickWand *wandconst MagickFunction functionconst size_t number_argumentsconst double *arguments)
			wand	[MagickWand!] ;the magick wand.
			function	[MagickFunction!] ;the image function.
			number_arguments	[size_t!] ;the number of function arguments.
			arguments	[pointer! [float!]] ;the function arguments.
			return: [MagickBooleanType!]
		]
		MagickFunctionImageChannel: "MagickFunctionImageChannel" [
			;== Applys an arithmetic relational or logical expression to an image
			;-- MagickBooleanType MagickFunctionImageChannel(MagickWand *wandconst ChannelType channelconst MagickFunction functionconst size_t number_argumentsconst double *arguments)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the channel(s).
			function	[MagickFunction!] ;the image function.
			number_arguments	[size_t!] ;the number of function arguments.
			arguments	[pointer! [float!]] ;the function arguments.
			return: [MagickBooleanType!]
		]
		MagickFxImage: "MagickFxImage" [
			;== Evaluate expression for each pixel in the image
			;-- MagickWand *MagickFxImage(MagickWand *wandconst char *expression)
			wand	[MagickWand!] ;the magick wand.
			expression	[c-string!] ;the expression.
			return: [MagickWand!]
		]
		MagickFxImageChannel: "MagickFxImageChannel" [
			;== Evaluate expression for each pixel in the image
			;-- MagickWand *MagickFxImageChannel(MagickWand *wandconst ChannelType channelconst char *expression)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			expression	[c-string!] ;the expression.
			return: [MagickWand!]
		]
		MagickGammaImage: "MagickGammaImage" [
			;== Gamma-corrects an image
			;-- MagickBooleanType MagickGammaImage(MagickWand *wandconst double gamma)
			wand	[MagickWand!] ;the magick wand.
			gamma	[float!]
			return: [MagickBooleanType!]
		]
		MagickGammaImageChannel: "MagickGammaImageChannel" [
			;== Gamma-corrects an image
			;-- MagickBooleanType MagickGammaImageChannel(MagickWand *wandconst ChannelType channelconst double gamma)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the channel.
			gamma	[float!]
			return: [MagickBooleanType!]
		]
		MagickGaussianBlurImage: "MagickGaussianBlurImage" [
			;== Blurs an image
			;-- MagickBooleanType MagickGaussianBlurImage(MagickWand *wandconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			return: [MagickBooleanType!]
		]
		MagickGaussianBlurImageChannel: "MagickGaussianBlurImageChannel" [
			;== Blurs an image
			;-- MagickBooleanType MagickGaussianBlurImageChannel(MagickWand *wandconst ChannelType channelconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			return: [MagickBooleanType!]
		]
		MagickGetImage: "MagickGetImage" [
			;== Gets the image at the current image index
			;-- MagickWand *MagickGetImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickWand!]
		]
		MagickGetImageAlphaChannel: "MagickGetImageAlphaChannel" [
			;== Returns MagickFalse if the image alpha channel is not activated
			;-- size_t MagickGetImageAlphaChannel(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetImageClipMask: "MagickGetImageClipMask" [
			;== Gets the image clip mask at the current image index
			;-- MagickWand *MagickGetImageClipMask(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickWand!]
		]
		MagickGetImageBackgroundColor: "MagickGetImageBackgroundColor" [
			;== Returns the image background color
			;-- MagickBooleanType MagickGetImageBackgroundColor(MagickWand *wandPixelWand *background_color)
			wand	[MagickWand!] ;the magick wand.
			background_color	[PixelWand!] ;Return the background color.
			return: [MagickBooleanType!]
		]
		MagickGetImageBlob: "MagickGetImageBlob" [
			;== Implements direct to memory image formats
			;-- unsigned char *MagickGetImageBlob(MagickWand *wandsize_t *length)
			wand	[MagickWand!] ;the magick wand.
			length	[pointer! [size_t!]] ;the length of the blob.
			return: [pointer! [byte!]]
		]
		MagickGetImagesBlob: "MagickGetImagesBlob" [
			;== Implements direct to memory image formats
			;-- unsigned char *MagickGetImagesBlob(MagickWand *wandsize_t *length)
			wand	[MagickWand!] ;the magick wand.
			length	[pointer! [size_t!]] ;the length of the blob.
			return: [pointer! [byte!]]
		]
		MagickGetImageBluePrimary: "MagickGetImageBluePrimary" [
			;== Returns the chromaticy blue primary point for the image
			;-- MagickBooleanType MagickGetImageBluePrimary(MagickWand *wanddouble *xdouble *y)
			wand	[MagickWand!] ;the magick wand.
			x	[pointer! [float!]] ;the chromaticity blue primary x-point.
			y	[pointer! [float!]] ;the chromaticity blue primary y-point.
			return: [MagickBooleanType!]
		]
		MagickGetImageBorderColor: "MagickGetImageBorderColor" [
			;== Returns the image border color
			;-- MagickBooleanType MagickGetImageBorderColor(MagickWand *wandPixelWand *border_color)
			wand	[MagickWand!] ;the magick wand.
			border_color	[PixelWand!] ;Return the border color.
			return: [MagickBooleanType!]
		]
		MagickGetImageChannelDepth: "MagickGetImageChannelDepth" [
			;== Gets the depth for one or more image channels
			;-- size_t MagickGetImageChannelDepth(MagickWand *wandconst ChannelType channel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			return: [size_t!]
		]
		MagickGetImageChannelDistortion: "MagickGetImageChannelDistortion" [
			;== Compares one or more image channels of an image to a reconstructed image and returns the specified distortion metric
			;-- MagickBooleanType MagickGetImageChannelDistortion(MagickWand *wandconst MagickWand *referenceconst ChannelType channelconst MetricType metricdouble *distortion)
			wand	[MagickWand!] ;the magick wand.
			reference	[MagickWand!] ;the reference wand.
			channel	[ChannelType!] ;the channel.
			metric	[MetricType!] ;the metric.
			distortion	[pointer! [float!]] ;the computed distortion between the images.
			return: [MagickBooleanType!]
		]
		MagickGetImageDistortions: "MagickGetImageDistortions" [
			;== Compares one or more image channels of an image to a reconstructed image and returns the specified distortion metrics
			;-- double *MagickGetImageDistortions(MagickWand *wandconst MagickWand *referenceconst MetricType metric)
			wand	[MagickWand!] ;the magick wand.
			reference	[MagickWand!] ;the reference wand.
			metric	[MetricType!] ;the metric.
			return: [pointer! [float!]]
		]
		MagickGetImageChannelFeatures: "MagickGetImageChannelFeatures" [
			;== Returns features for each channel in the image in each of four directions (horizontal vertical left and right diagonals) for the specified distance
			;-- ChannelFeatures *MagickGetImageChannelFeatures(MagickWand *wandconst size_t distance)
			wand	[MagickWand!] ;the magick wand.
			distance	[size_t!] ;the distance.
			return: [ChannelFeatures!]
		]
		MagickGetImageChannelKurtosis: "MagickGetImageChannelKurtosis" [
			;== Gets the kurtosis and skewness of one or more image channels
			;-- MagickBooleanType MagickGetImageChannelKurtosis(MagickWand *wandconst ChannelType channeldouble *kurtosisdouble *skewness)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			kurtosis	[pointer! [float!]] ;The kurtosis for the specified channel(s).
			skewness	[pointer! [float!]] ;The skewness for the specified channel(s).
			return: [MagickBooleanType!]
		]
		MagickGetImageChannelMean: "MagickGetImageChannelMean" [
			;== Gets the mean and standard deviation of one or more image channels
			;-- MagickBooleanType MagickGetImageChannelMean(MagickWand *wandconst ChannelType channeldouble *meandouble *standard_deviation)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			mean	[pointer! [float!]] ;The mean pixel value for the specified channel(s).
			standard_deviation	[pointer! [float!]] ;The standard deviation for the specified channel(s).
			return: [MagickBooleanType!]
		]
		MagickGetImageChannelRange: "MagickGetImageChannelRange" [
			;== Gets the range for one or more image channels
			;-- MagickBooleanType MagickGetImageChannelRange(MagickWand *wandconst ChannelType channeldouble *minimadouble *maxima)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			minima	[pointer! [float!]] ;The minimum pixel value for the specified channel(s).
			maxima	[pointer! [float!]] ;The maximum pixel value for the specified channel(s).
			return: [MagickBooleanType!]
		]
		MagickGetImageChannelStatistics: "MagickGetImageChannelStatistics" [
			;== Returns statistics for each channel in the image
			;-- ChannelStatistics *MagickGetImageChannelStatistics(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [ChannelStatistics!]
		]
		MagickGetImageColormapColor: "MagickGetImageColormapColor" [
			;== Returns the color of the specified colormap index
			;-- MagickBooleanType MagickGetImageColormapColor(MagickWand *wandconst size_t indexPixelWand *color)
			wand	[MagickWand!] ;the magick wand.
			index	[size_t!] ;the offset into the image colormap.
			color	[PixelWand!] ;Return the colormap color in this wand.
			return: [MagickBooleanType!]
		]
		MagickGetImageColors: "MagickGetImageColors" [
			;== Gets the number of unique colors in the image
			;-- size_t MagickGetImageColors(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetImageColorspace: "MagickGetImageColorspace" [
			;== Gets the image colorspace
			;-- ColorspaceType MagickGetImageColorspace(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [ColorspaceType!]
		]
		MagickGetImageCompose: "MagickGetImageCompose" [
			;== Returns the composite operator associated with the image
			;-- CompositeOperator MagickGetImageCompose(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [CompositeOperator!]
		]
		MagickGetImageCompression: "MagickGetImageCompression" [
			;== Gets the image compression
			;-- CompressionType MagickGetImageCompression(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [CompressionType!]
		]
		MagickGetImageCompressionQuality: "MagickGetImageCompressionQuality" [
			;== Gets the image compression quality
			;-- size_t MagickGetImageCompressionQuality(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetImageDelay: "MagickGetImageDelay" [
			;== Gets the image delay
			;-- size_t MagickGetImageDelay(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetImageDepth: "MagickGetImageDepth" [
			;== Gets the image depth
			;-- size_t MagickGetImageDepth(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetImageDistortion: "MagickGetImageDistortion" [
			;== Compares an image to a reconstructed image and returns the specified distortion metric
			;-- MagickBooleanType MagickGetImageDistortion(MagickWand *wandconst MagickWand *referenceconst MetricType metricdouble *distortion)
			wand	[MagickWand!] ;the magick wand.
			reference	[MagickWand!] ;the reference wand.
			metric	[MetricType!] ;the metric.
			distortion	[pointer! [float!]] ;the computed distortion between the images.
			return: [MagickBooleanType!]
		]
		MagickGetImageDispose: "MagickGetImageDispose" [
			;== Gets the image disposal method
			;-- DisposeType MagickGetImageDispose(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [DisposeType!]
		]
		MagickGetImageFilename: "MagickGetImageFilename" [
			;== Returns the filename of a particular image in a sequence
			;-- char *MagickGetImageFilename(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [c-string!]
		]
		MagickGetImageFormat: "MagickGetImageFormat" [
			;== Returns the format of a particular image in a sequence
			;-- const char *MagickGetImageFormat(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [c-string!]
		]
		MagickGetImageFuzz: "MagickGetImageFuzz" [
			;== Gets the image fuzz
			;-- double MagickGetImageFuzz(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [float!]
		]
		MagickGetImageGamma: "MagickGetImageGamma" [
			;== Gets the image gamma
			;-- double MagickGetImageGamma(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [float!]
		]
		MagickGetImageGravity: "MagickGetImageGravity" [
			;== Gets the image gravity
			;-- GravityType MagickGetImageGravity(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [GravityType!]
		]
		MagickGetImageGreenPrimary: "MagickGetImageGreenPrimary" [
			;== Returns the chromaticy green primary point
			;-- MagickBooleanType MagickGetImageGreenPrimary(MagickWand *wanddouble *xdouble *y)
			wand	[MagickWand!] ;the magick wand.
			x	[pointer! [float!]] ;the chromaticity green primary x-point.
			y	[pointer! [float!]] ;the chromaticity green primary y-point.
			return: [MagickBooleanType!]
		]
		MagickGetImageHeight: "MagickGetImageHeight" [
			;== Returns the image height
			;-- size_t MagickGetImageHeight(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetImageHistogram: "MagickGetImageHistogram" [
			;== Returns the image histogram as an array of PixelWand wands
			;-- PixelWand **MagickGetImageHistogram(MagickWand *wandsize_t *number_colors)
			wand	[MagickWand!] ;the magick wand.
			number_colors	[pointer! [size_t!]] ;the number of unique colors in the image and the number of pixel wands returned.
			return: [pointer! [integer!]]
		]
		MagickGetImageInterlaceScheme: "MagickGetImageInterlaceScheme" [
			;== Gets the image interlace scheme
			;-- InterlaceType MagickGetImageInterlaceScheme(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [InterlaceType!]
		]
		MagickGetImageInterpolateMethod: "MagickGetImageInterpolateMethod" [
			;== Returns the interpolation method for the sepcified image
			;-- InterpolatePixelMethod MagickGetImageInterpolateMethod(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [InterpolatePixelMethod!]
		]
		MagickGetImageIterations: "MagickGetImageIterations" [
			;== Gets the image iterations
			;-- size_t MagickGetImageIterations(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetImageLength: "MagickGetImageLength" [
			;== Returns the image length in bytes
			;-- MagickBooleanType MagickGetImageLength(MagickWand *wandMagickSizeType *length)
			wand	[MagickWand!] ;the magick wand.
			length	[pointer! [integer!]] ;the image length in bytes.
			return: [MagickBooleanType!]
		]
		MagickGetImagematteColor: "MagickGetImagematteColor" [
			;== Returns the image matte color
			;-- MagickBooleanType MagickGetImagematteColor(MagickWand *wandPixelWand *matte_color)
			wand	[MagickWand!] ;the magick wand.
			matte_color	[PixelWand!] ;Return the matte color.
			return: [MagickBooleanType!]
		]
		MagickGetImageOrientation: "MagickGetImageOrientation" [
			;== Returns the image orientation
			;-- OrientationType MagickGetImageOrientation(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [OrientationType!]
		]
		MagickGetImagePage: "MagickGetImagePage" [
			;== Returns the page geometry associated with the image
			;-- MagickBooleanType MagickGetImagePage(MagickWand *wandsize_t *widthsize_t *heightssize_t *xssize_t *y)
			wand	[MagickWand!] ;the magick wand.
			width	[pointer! [size_t!]] ;the page width.
			height	[pointer! [size_t!]] ;the page height.
			x	[pointer! [ssize_t!]] ;the page x-offset.
			y	[pointer! [ssize_t!]] ;the page y-offset.
			return: [MagickBooleanType!]
		]
		MagickGetImagePixelColor: "MagickGetImagePixelColor" [
			;== Returns the color of the specified pixel
			;-- MagickBooleanType MagickGetImagePixelColor(MagickWand *wandconst ssize_t xconst ssize_t yPixelWand *color)
			wand	[MagickWand!] ;the magick wand.
			x	[ssize_t!] ;the pixel offset into the image.
			y	[ssize_t!]
			color	[PixelWand!] ;Return the colormap color in this wand.
			return: [MagickBooleanType!]
		]
		MagickGetImageRedPrimary: "MagickGetImageRedPrimary" [
			;== Returns the chromaticy red primary point
			;-- MagickBooleanType MagickGetImageRedPrimary(MagickWand *wanddouble *xdouble *y)
			wand	[MagickWand!] ;the magick wand.
			x	[pointer! [float!]] ;the chromaticity red primary x-point.
			y	[pointer! [float!]] ;the chromaticity red primary y-point.
			return: [MagickBooleanType!]
		]
		MagickGetImageRegion: "MagickGetImageRegion" [
			;== Extracts a region of the image and returns it as a a new wand
			;-- MagickWand *MagickGetImageRegion(MagickWand *wandconst size_t widthconst size_t heightconst ssize_t xconst ssize_t y)
			wand	[MagickWand!] ;the magick wand.
			width	[size_t!] ;the region width.
			height	[size_t!] ;the region height.
			x	[ssize_t!] ;the region x offset.
			y	[ssize_t!] ;the region y offset.
			return: [MagickWand!]
		]
		MagickGetImageRenderingIntent: "MagickGetImageRenderingIntent" [
			;== Gets the image rendering intent
			;-- RenderingIntent MagickGetImageRenderingIntent(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [RenderingIntent!]
		]
		MagickGetImageResolution: "MagickGetImageResolution" [
			;== Gets the image X and Y resolution
			;-- MagickBooleanType MagickGetImageResolution(MagickWand *wanddouble *xdouble *y)
			wand	[MagickWand!] ;the magick wand.
			x	[pointer! [float!]] ;the image x-resolution.
			y	[pointer! [float!]] ;the image y-resolution.
			return: [MagickBooleanType!]
		]
		MagickGetImageScene: "MagickGetImageScene" [
			;== Gets the image scene
			;-- size_t MagickGetImageScene(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetImageSignature: "MagickGetImageSignature" [
			;== Generates an SHA-256 message digest for the image pixel stream
			;-- const char MagickGetImageSignature(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [byte!]
		]
		MagickGetImageTicksPerSecond: "MagickGetImageTicksPerSecond" [
			;== Gets the image ticks-per-second
			;-- size_t MagickGetImageTicksPerSecond(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetImageType: "MagickGetImageType" [
			;== Gets the potential image type:
			;-- ImageType MagickGetImageType(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [ImageType!]
		]
		MagickGetImageUnits: "MagickGetImageUnits" [
			;== Gets the image units of resolution
			;-- ResolutionType MagickGetImageUnits(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [ResolutionType!]
		]
		MagickGetImageVirtualPixelMethod: "MagickGetImageVirtualPixelMethod" [
			;== Returns the virtual pixel method for the sepcified image
			;-- VirtualPixelMethod MagickGetImageVirtualPixelMethod(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [VirtualPixelMethod!]
		]
		MagickGetImageWhitePoint: "MagickGetImageWhitePoint" [
			;== Returns the chromaticy white point
			;-- MagickBooleanType MagickGetImageWhitePoint(MagickWand *wanddouble *xdouble *y)
			wand	[MagickWand!] ;the magick wand.
			x	[pointer! [float!]] ;the chromaticity white x-point.
			y	[pointer! [float!]] ;the chromaticity white y-point.
			return: [MagickBooleanType!]
		]
		MagickGetImageWidth: "MagickGetImageWidth" [
			;== Returns the image width
			;-- size_t MagickGetImageWidth(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetNumberImages: "MagickGetNumberImages" [
			;== Returns the number of images associated with a magick wand
			;-- size_t MagickGetNumberImages(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [size_t!]
		]
		MagickGetImageTotalInkDensity: "MagickGetImageTotalInkDensity" [
			;== Gets the image total ink density
			;-- double MagickGetImageTotalInkDensity(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [float!]
		]
		MagickHaldClutImage: "MagickHaldClutImage" [
			;== Replaces colors in the image from a Hald color lookup table
			;-- MagickBooleanType MagickHaldClutImage(MagickWand *wandconst MagickWand *hald_wand)
			wand	[MagickWand!] ;the magick wand.
			hald_wand	[MagickWand!]
			return: [MagickBooleanType!]
		]
		MagickHaldClutImageChannel: "MagickHaldClutImageChannel" [
			;== Replaces colors in the image from a Hald color lookup table
			;-- MagickBooleanType MagickHaldClutImageChannel(MagickWand *wandconst ChannelType channelconst MagickWand *hald_wand)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!]
			hald_wand	[MagickWand!]
			return: [MagickBooleanType!]
		]
		MagickHasNextImage: "MagickHasNextImage" [
			;== Returns MagickTrue if the wand has more images when traversing the list in the forward direction
			;-- MagickBooleanType MagickHasNextImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickHasPreviousImage: "MagickHasPreviousImage" [
			;== Returns MagickTrue if the wand has more images when traversing the list in the reverse direction
			;-- MagickBooleanType MagickHasPreviousImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickIdentifyImage: "MagickIdentifyImage" [
			;== Identifies an image by printing its attributes to the file
			;-- const char *MagickIdentifyImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [c-string!]
		]
		MagickImplodeImage: "MagickImplodeImage" [
			;== Creates a new image that is a copy of an existing one with the image pixels 'implode' by the specified percentage
			;-- MagickBooleanType MagickImplodeImage(MagickWand *wandconst double radius)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!]
			return: [MagickBooleanType!]
		]
		MagickImportImagePixels: "MagickImportImagePixels" [
			;== Accepts pixel datand stores it in the image at the location you specify
			;-- MagickBooleanType MagickImportImagePixels(MagickWand *wandconst ssize_t xconst ssize_t yconst size_t columnsconst size_t rowsconst char *mapconst StorageType storageconst void *pixels)
			wand	[MagickWand!] ;the magick wand.
			x	[ssize_t!] ;These values define the perimeter of a region of pixels you want to define.
			y	[ssize_t!]
			columns	[size_t!]
			rows	[size_t!]
			map	[c-string!] ;This string reflects the expected ordering of the pixel array. It can be any combination or order of R = red G = green B = blue A = alpha (0 is transparent) O = opacity (0 is opaque) C = cyan Y = yellow M = magenta K = black I = intensity (for grayscale) P = pad.
			storage	[StorageType!] ;Define the data type of the pixels.  Float and double types are expected to be normalized [0..1] otherwise [0..QuantumRange].  Choose from these types: CharPixel ShortPixel IntegerPixel LongPixel FloatPixel or DoublePixel.
			pixels	[pointer! [byte!]] ;This array of values contain the pixel components as defined by map and type.  You must preallocate this array where the expected length varies depending on the values of width height map and type.
			return: [MagickBooleanType!]
		]
		MagickInverseFourierTransformImage: "MagickInverseFourierTransformImage" [
			;== Implements the inverse discrete Fourier transform (DFT) of the image either as a magnitude / phase or real / imaginary image pair
			;-- MagickBooleanType MagickInverseFourierTransformImage(MagickWand *magnitude_wandMagickWand *phase_wandconst MagickBooleanType magnitude)
			magnitude_wand	[MagickWand!] ;the magnitude or real wand.
			phase_wand	[MagickWand!] ;the phase or imaginary wand.
			magnitude	[MagickBooleanType!] ;if true return as magnitude / phase pair otherwise a real / imaginary image pair.
			return: [MagickBooleanType!]
		]
		MagickLabelImage: "MagickLabelImage" [
			;== Adds a label to your image
			;-- MagickBooleanType MagickLabelImage(MagickWand *wandconst char *label)
			wand	[MagickWand!] ;the magick wand.
			label	[c-string!] ;the image label.
			return: [MagickBooleanType!]
		]
		MagickLevelImage: "MagickLevelImage" [
			;== Adjusts the levels of an image by scaling the colors falling between specified white and black points to the full available quantum range
			;-- MagickBooleanType MagickLevelImage(MagickWand *wandconst double black_pointconst double gammaconst double white_point)
			wand	[MagickWand!] ;the magick wand.
			black_point	[float!] ;the black point.
			gamma	[float!] ;the gamma.
			white_point	[float!] ;the white point.
			return: [MagickBooleanType!]
		]
		MagickLevelImageChannel: "MagickLevelImageChannel" [
			;== Adjusts the levels of an image by scaling the colors falling between specified white and black points to the full available quantum range
			;-- MagickBooleanType MagickLevelImageChannel(MagickWand *wandconst ChannelType channelconst double black_pointconst double gammaconst double white_point)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;Identify which channel to level: RedChannel GreenChannel
			black_point	[float!] ;the black point.
			gamma	[float!] ;the gamma.
			white_point	[float!] ;the white point.
			return: [MagickBooleanType!]
		]
		MagickLinearStretchImage: "MagickLinearStretchImage" [
			;== Stretches with saturation the image intensity
			;-- MagickBooleanType MagickLinearStretchImage(MagickWand *wandconst double black_pointconst double white_point)
			wand	[MagickWand!] ;the magick wand.
			black_point	[float!] ;the black point.
			white_point	[float!] ;the white point.
			return: [MagickBooleanType!]
		]
		MagickLiquidRescaleImage: "MagickLiquidRescaleImage" [
			;== Rescales image with seam carving
			;-- MagickBooleanType MagickLiquidRescaleImage(MagickWand *wand const size_t columnsconst size_t rows const double delta_xconst double rigidity)
			wand	[MagickWand!] ;the magick wand.
			columns	[size_t!] ;the number of columns in the scaled image.
			rows	[size_t!] ;the number of rows in the scaled image.
			delta_x	[float!] ;maximum seam transversal step (0 means straight seams).
			rigidity	[float!] ;introduce a bias for non-straight seams (typically 0).
			return: [MagickBooleanType!]
		]
		MagickMagnifyImage: "MagickMagnifyImage" [
			;== Is a convenience method that scales an image proportionally to twice its original size
			;-- MagickBooleanType MagickMagnifyImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickMergeImageLayers: "MagickMergeImageLayers" [
			;== Composes all the image layers from the current given image onward to produce a single image of the merged layers
			;-- MagickWand *MagickMergeImageLayers(MagickWand *wandconst ImageLayerMethod method)
			wand	[MagickWand!] ;the magick wand.
			method	[ImageLayerMethod!] ;the method of selecting the size of the initial canvas.
			return: [MagickWand!]
		]
		MagickMinifyImage: "MagickMinifyImage" [
			;== Is a convenience method that scales an image proportionally to one-half its original size
			;-- MagickBooleanType MagickMinifyImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickModulateImage: "MagickModulateImage" [
			;== Lets you control the brightness saturation and hue of an image
			;-- MagickBooleanType MagickModulateImage(MagickWand *wandconst double brightnessconst double saturationconst double hue)
			wand	[MagickWand!] ;the magick wand.
			brightness	[float!] ;the percent change in brighness.
			saturation	[float!] ;the percent change in saturation.
			hue	[float!] ;the percent change in hue.
			return: [MagickBooleanType!]
		]
		MagickMontageImage: "MagickMontageImage" [
			;== Creates a composite image by combining several separate images
			;-- MagickWand *MagickMontageImage(MagickWand *wandconst DrawingWand drawing_wandconst char *tile_geometryconst char *thumbnail_geometryconst MontageMode modeconst char *frame)
			wand	[MagickWand!] ;the magick wand.
			drawing_wand	[DrawingWand!] ;the drawing wand.  The font name size and color are obtained from this wand.
			tile_geometry	[c-string!] ;the number of tiles per row and page (e.g. 6x4+0+0).
			thumbnail_geometry	[c-string!] ;Preferred image size and border size of each thumbnail (e.g. 120x120+4+3>).
			mode	[MontageMode!] ;Thumbnail framing mode: Frame Unframe or Concatenate.
			frame	[c-string!] ;Surround the image with an ornamental border (e.g. 15x15+3+3). The frame color is that of the thumbnail's matte color.
			return: [MagickWand!]
		]
		MagickMorphImages: "MagickMorphImages" [
			;== Method morphs a set of images
			;-- MagickWand *MagickMorphImages(MagickWand *wandconst size_t number_frames)
			wand	[MagickWand!] ;the magick wand.
			number_frames	[size_t!] ;the number of in-between images to generate.
			return: [MagickWand!]
		]
		MagickMorphologyImage: "MagickMorphologyImage" [
			;== Applies a user supplied kernel to the image according to the given mophology method
			;-- MagickBooleanType MagickMorphologyImage(MagickWand *wandMorphologyMethod methodconst ssize_t iterationsKernelInfo *kernel)
			wand	[MagickWand!] ;the magick wand.
			method	[MorphologyMethod!] ;the morphology method to be applied.
			iterations	[ssize_t!] ;apply the operation this many times (or no change). A value of -1 means loop until no change found.  How this is applied may depend on the morphology method.  Typically this is a value of 1.
			kernel	[KernelInfo!] ;An array of doubles representing the morphology kernel.
			return: [MagickBooleanType!]
		]
		MagickMorphologyImageChannel: "MagickMorphologyImageChannel" [
			;== Applies a user supplied kernel to the image according to the given mophology method
			;-- MagickBooleanType MagickMorphologyImageChannel(MagickWand *wandChannelType channelMorphologyMethod methodconst ssize_t iterationsKernelInfo *kernel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			method	[MorphologyMethod!] ;the morphology method to be applied.
			iterations	[ssize_t!] ;apply the operation this many times (or no change). A value of -1 means loop until no change found.  How this is applied may depend on the morphology method.  Typically this is a value of 1.
			kernel	[KernelInfo!] ;An array of doubles representing the morphology kernel.
			return: [MagickBooleanType!]
		]
		MagickMotionBlurImage: "MagickMotionBlurImage" [
			;== Simulates motion blur
			;-- MagickBooleanType MagickMotionBlurImage(MagickWand *wandconst double radiusconst double sigmaconst double angle)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			angle	[float!] ;Apply the effect along this angle.
			return: [MagickBooleanType!]
		]
		MagickMotionBlurImageChannel: "MagickMotionBlurImageChannel" [
			;== Simulates motion blur
			;-- MagickBooleanType MagickMotionBlurImageChannel(MagickWand *wandconst ChannelType channelconst double radiusconst double sigmaconst double angle)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			angle	[float!] ;Apply the effect along this angle.
			return: [MagickBooleanType!]
		]
		MagickNegateImage: "MagickNegateImage" [
			;== Negates the colors in the reference image
			;-- MagickBooleanType MagickNegateImage(MagickWand *wandconst MagickBooleanType gray)
			wand	[MagickWand!] ;the magick wand.
			gray	[MagickBooleanType!] ;If MagickTrue only negate grayscale pixels within the image.
			return: [MagickBooleanType!]
		]
		MagickNegateImageChannel: "MagickNegateImageChannel" [
			;== Negates the colors in the reference image
			;-- MagickBooleanType MagickNegateImageChannel(MagickWand *wandconst ChannelType channelconst MagickBooleanType gray)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			gray	[MagickBooleanType!] ;If MagickTrue only negate grayscale pixels within the image.
			return: [MagickBooleanType!]
		]
		MagickNewImage: "MagickNewImage" [
			;== Adds a blank image canvas of the specified size and background color to the wand
			;-- MagickBooleanType MagickNewImage(MagickWand *wandconst size_t columnsconst size_t rowsconst PixelWand *background)
			wand	[MagickWand!] ;the magick wand.
			columns	[size_t!]
			rows	[size_t!]
			background	[PixelWand!] ;the image color.
			return: [MagickBooleanType!]
		]
		MagickNextImage: "MagickNextImage" [
			;== Associates the next image in the image list with a magick wand
			;-- MagickBooleanType MagickNextImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickNormalizeImage: "MagickNormalizeImage" [
			;== Enhances the contrast of a color image by adjusting the pixels color to span the entire range of colors available
			;-- MagickBooleanType MagickNormalizeImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickNormalizeImageChannel: "MagickNormalizeImageChannel" [
			;== Enhances the contrast of a color image by adjusting the pixels color to span the entire range of colors available
			;-- MagickBooleanType MagickNormalizeImageChannel(MagickWand *wandconst ChannelType channel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			return: [MagickBooleanType!]
		]
		MagickOilPaintImage: "MagickOilPaintImage" [
			;== Applies a special effect filter that simulates an oil painting
			;-- MagickBooleanType MagickOilPaintImage(MagickWand *wandconst double radius)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the circular neighborhood.
			return: [MagickBooleanType!]
		]
		MagickOpaquePaintImage: "MagickOpaquePaintImage" [
			;== Changes any pixel that matches color with the color defined by fill
			;-- MagickBooleanType MagickOpaquePaintImage(MagickWand *wandconst PixelWand *targetconst PixelWand *fillconst double fuzzconst MagickBooleanType invert)
			wand	[MagickWand!] ;the magick wand.
			target	[PixelWand!] ;Change this target color to the fill color within the image.
			fill	[PixelWand!] ;the fill pixel wand.
			fuzz	[float!] ;By default target must match a particular pixel color exactly.  However in many cases two colors may differ by a small amount. The fuzz member of image defines how much tolerance is acceptable to consider two colors as the same.  For example set fuzz to 10 and the color red at intensities of 100 and 102 respectively are now interpreted as the same color for the purposes of the floodfill.
			invert	[MagickBooleanType!] ;paint any pixel that does not match the target color.
			return: [MagickBooleanType!]
		]
		MagickOpaquePaintImageChannel: "MagickOpaquePaintImageChannel" [
			;== Changes any pixel that matches color with the color defined by fill
			;-- MagickBooleanType MagickOpaquePaintImageChannel(MagickWand *wandconst ChannelType channelconst PixelWand *targetconst PixelWand *fillconst double fuzzconst MagickBooleanType invert)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the channel(s).
			target	[PixelWand!] ;Change this target color to the fill color within the image.
			fill	[PixelWand!] ;the fill pixel wand.
			fuzz	[float!] ;By default target must match a particular pixel color exactly.  However in many cases two colors may differ by a small amount. The fuzz member of image defines how much tolerance is acceptable to consider two colors as the same.  For example set fuzz to 10 and the color red at intensities of 100 and 102 respectively are now interpreted as the same color for the purposes of the floodfill.
			invert	[MagickBooleanType!] ;paint any pixel that does not match the target color.
			return: [MagickBooleanType!]
		]
		MagickOptimizeImageLayers: "MagickOptimizeImageLayers" [
			;== Compares each image the GIF disposed forms of the previous image in the sequence
			;-- MagickWand *MagickOptimizeImageLayers(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickWand!]
		]
		;MagickOrderedPosterizeImage: "MagickOrderedPosterizeImage" [
		MagickOrderedPosterizeImage: "MagickOrderedDitherImage" [ ;@@ This was renamed in ImageMagick v7!
			;== Performs an ordered dither based on a number of pre-defined dithering threshold maps but over multiple intensity levels which can be different for different channels according to the input arguments
			;-- MagickBooleanType MagickOrderedPosterizeImage(MagickWand *wandconst char *threshold_map)
			wand	[MagickWand!]
			threshold_map	[c-string!] ;A string containing the name of the threshold dither map to use followed by zero or more numbers representing the number of color levels tho dither between.
			return: [MagickBooleanType!]
		]
		MagickOrderedPosterizeImageChannel: "MagickOrderedPosterizeImageChannel" [
			;== Performs an ordered dither based on a number of pre-defined dithering threshold maps but over multiple intensity levels which can be different for different channels according to the input arguments
			;-- MagickBooleanType MagickOrderedPosterizeImageChannel(MagickWand *wandconst ChannelType channelconst char *threshold_map)
			wand	[MagickWand!]
			channel	[ChannelType!] ;the channel or channels to be thresholded.
			threshold_map	[c-string!] ;A string containing the name of the threshold dither map to use followed by zero or more numbers representing the number of color levels tho dither between.
			return: [MagickBooleanType!]
		]
		MagickPingImage: "MagickPingImage" [
			;== Is like MagickReadImage() except the only valid information returned is the image width height size and format
			;-- MagickBooleanType MagickPingImage(MagickWand *wandconst char *filename)
			wand	[MagickWand!] ;the magick wand.
			filename	[c-string!] ;the image filename.
			return: [MagickBooleanType!]
		]
		MagickPingImageBlob: "MagickPingImageBlob" [
			;== Pings an image or image sequence from a blob
			;-- MagickBooleanType MagickPingImageBlob(MagickWand *wandconst void *blobconst size_t length)
			wand	[MagickWand!] ;the magick wand.
			blob	[pointer! [byte!]] ;the blob.
			length	[size_t!] ;the blob length.
			return: [MagickBooleanType!]
		]
		MagickPingImageFile: "MagickPingImageFile" [
			;== Pings an image or image sequence from an open file descriptor
			;-- MagickBooleanType MagickPingImageFile(MagickWand *wandFILE *file)
			wand	[MagickWand!] ;the magick wand.
			file	[FILE!] ;the file descriptor.
			return: [MagickBooleanType!]
		]
		MagickPolaroidImage: "MagickPolaroidImage" [
			;== Simulates a Polaroid picture
			;-- MagickBooleanType MagickPolaroidImage(MagickWand *wandconst DrawingWand *drawing_wandconst double angle)
			wand	[MagickWand!] ;the magick wand.
			drawing_wand	[DrawingWand!] ;the draw wand.
			angle	[float!] ;Apply the effect along this angle.
			return: [MagickBooleanType!]
		]
		MagickPosterizeImage: "MagickPosterizeImage" [
			;== Reduces the image to a limited number of color level
			;-- MagickBooleanType MagickPosterizeImage(MagickWand *wandconst unsigned levelsconst MagickBooleanType dither)
			wand	[MagickWand!] ;the magick wand.
			levels	[integer!] ;Number of color levels allowed in each channel.  Very low values (2 3 or 4) have the most visible effect.
			dither	[MagickBooleanType!] ;Set this integer value to something other than zero to dither the mapped image.
			return: [MagickBooleanType!]
		]
		MagickPreviewImages: "MagickPreviewImages" [
			;== Tiles 9 thumbnails of the specified image with an image processing operation applied at varying strengths
			;-- MagickWand *MagickPreviewImages(MagickWand *wandconst PreviewType preview)
			wand	[MagickWand!] ;the magick wand.
			preview	[PreviewType!] ;the preview type.
			return: [MagickWand!]
		]
		MagickPreviousImage: "MagickPreviousImage" [
			;== Assocates the previous image in an image list with the magick wand
			;-- MagickBooleanType MagickPreviousImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickQuantizeImage: "MagickQuantizeImage" [
			;== Analyzes the colors within a reference image and chooses a fixed number of colors to represent the image
			;-- MagickBooleanType MagickQuantizeImage(MagickWand *wandconst size_t number_colorsconst ColorspaceType colorspaceconst size_t treedepthconst MagickBooleanType ditherconst MagickBooleanType measure_error)
			wand	[MagickWand!] ;the magick wand.
			number_colors	[size_t!] ;the number of colors.
			colorspace	[ColorspaceType!] ;Perform color reduction in this colorspace typically RGBColorspace.
			treedepth	[size_t!] ;Normally this integer value is zero or one.  A zero or one tells Quantize to choose a optimal tree depth of Log4(number_colors).      A tree of this depth generally allows the best representation of the reference image with the least amount of memory and the fastest computational speed.  In some cases such as an image with low color dispersion (a few number of colors) a value other than Log4(number_colors) is required.  To expand the color tree completely use a value of 8.
			dither	[MagickBooleanType!] ;A value other than zero distributes the difference between an original image and the corresponding color reduced image to neighboring pixels along a Hilbert curve.
			measure_error	[MagickBooleanType!] ;A value other than zero measures the difference between the original and quantized images.  This difference is the total quantization error.  The error is computed by summing over all pixels in an image the distance squared in RGB space between each reference pixel value and its quantized value.
			return: [MagickBooleanType!]
		]
		MagickQuantizeImages: "MagickQuantizeImages" [
			;== Analyzes the colors within a sequence of images and chooses a fixed number of colors to represent the image
			;-- MagickBooleanType MagickQuantizeImages(MagickWand *wandconst size_t number_colorsconst ColorspaceType colorspaceconst size_t treedepthconst MagickBooleanType ditherconst MagickBooleanType measure_error)
			wand	[MagickWand!] ;the magick wand.
			number_colors	[size_t!] ;the number of colors.
			colorspace	[ColorspaceType!] ;Perform color reduction in this colorspace typically RGBColorspace.
			treedepth	[size_t!] ;Normally this integer value is zero or one.  A zero or one tells Quantize to choose a optimal tree depth of Log4(number_colors).      A tree of this depth generally allows the best representation of the reference image with the least amount of memory and the fastest computational speed.  In some cases such as an image with low color dispersion (a few number of colors) a value other than Log4(number_colors) is required.  To expand the color tree completely use a value of 8.
			dither	[MagickBooleanType!] ;A value other than zero distributes the difference between an original image and the corresponding color reduced algorithm to neighboring pixels along a Hilbert curve.
			measure_error	[MagickBooleanType!] ;A value other than zero measures the difference between the original and quantized images.  This difference is the total quantization error.  The error is computed by summing over all pixels in an image the distance squared in RGB space between each reference pixel value and its quantized value.
			return: [MagickBooleanType!]
		]
		MagickRadialBlurImage: "MagickRotationalBlurImage" [
			;== Radial blurs an image
			;-- MagickBooleanType MagickRadialBlurImage(MagickWand *wandconst double angle)
			wand	[MagickWand!] ;the magick wand.
			angle	[float!] ;the angle of the blur in degrees.
			return: [MagickBooleanType!]
		]
		MagickRadialBlurImageChannel: "MagickRotationalBlurImageChannel" [
			;== Radial blurs an image
			;-- MagickBooleanType MagickRadialBlurImageChannel(MagickWand *wandconst ChannelType channelconst double angle)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			angle	[float!] ;the angle of the blur in degrees.
			return: [MagickBooleanType!]
		]
		MagickRaiseImage: "MagickRaiseImage" [
			;== Creates a simulated three-dimensional button-like effect by lightening and darkening the edges of the image
			;-- MagickBooleanType MagickRaiseImage(MagickWand *wandconst size_t widthconst size_t heightconst ssize_t xconst ssize_t yconst MagickBooleanType raise)
			wand	[MagickWand!] ;the magick wand.
			width	[size_t!] ;Define the dimensions of the area to raise.
			height	[size_t!]
			x	[ssize_t!]
			y	[ssize_t!]
			raise	[MagickBooleanType!] ;A value other than zero creates a 3-D raise effect otherwise it has a lowered effect.
			return: [MagickBooleanType!]
		]
		MagickRandomThresholdImage: "MagickRandomThresholdImage" [
			;== Changes the value of individual pixels based on the intensity of each pixel compared to threshold
			;-- MagickBooleanType MagickRandomThresholdImage(MagickWand *wandconst double lowconst double high)
			wand	[MagickWand!] ;the magick wand.
			low	[float!] ;Specify the high and low thresholds.  These values range from 0 to QuantumRange.
			high	[float!]
			return: [MagickBooleanType!]
		]
		MagickRandomThresholdImageChannel: "MagickRandomThresholdImageChannel" [
			;== Changes the value of individual pixels based on the intensity of each pixel compared to threshold
			;-- MagickBooleanType MagickRandomThresholdImageChannel(MagickWand *wandconst ChannelType channelconst double lowconst double high)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			low	[float!] ;Specify the high and low thresholds.  These values range from 0 to QuantumRange.
			high	[float!]
			return: [MagickBooleanType!]
		]
		MagickReadImage: "MagickReadImage" [
			;== Reads an image or image sequence
			;-- MagickBooleanType MagickReadImage(MagickWand *wandconst char *filename)
			wand	[MagickWand!] ;the magick wand.
			filename	[c-string!] ;the image filename.
			return: [MagickBooleanType!]
		]
		MagickReadImageBlob: "MagickReadImageBlob" [
			;== Reads an image or image sequence from a blob
			;-- MagickBooleanType MagickReadImageBlob(MagickWand *wandconst void *blobconst size_t length)
			wand	[MagickWand!] ;the magick wand.
			blob	[pointer! [byte!]] ;the blob.
			length	[size_t!] ;the blob length.
			return: [MagickBooleanType!]
		]
		MagickReadImageFile: "MagickReadImageFile" [
			;== Reads an image or image sequence from an open file descriptor
			;-- MagickBooleanType MagickReadImageFile(MagickWand *wandFILE *file)
			wand	[MagickWand!] ;the magick wand.
			file	[FILE!] ;the file descriptor.
			return: [MagickBooleanType!]
		]
		MagickRemapImage: "MagickRemapImage" [
			;== Replaces the colors of an image with the closest color from a reference image
			;-- MagickBooleanType MagickRemapImage(MagickWand *wandconst MagickWand *remap_wandconst DitherMethod method)
			wand	[MagickWand!] ;the magick wand.
			remap_wand	[MagickWand!]
			method	[DitherMethod!] ;choose from these dither methods: NoDitherMethod RiemersmaDitherMethod or FloydSteinbergDitherMethod.
			return: [MagickBooleanType!]
		]
		MagickRemoveImage: "MagickRemoveImage" [
			;== Removes an image from the image list
			;-- MagickBooleanType MagickRemoveImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickResampleImage: "MagickResampleImage" [
			;== Resample image to desired resolution
			;-- MagickBooleanType MagickResampleImage(MagickWand *wandconst double x_resolutionconst double y_resolutionconst FilterTypes filterconst double blur)
			wand	[MagickWand!] ;the magick wand.
			x_resolution	[float!] ;the new image x resolution.
			y_resolution	[float!] ;the new image y resolution.
			filter	[FilterTypes!] ;Image filter to use.
			blur	[float!] ;the blur factor where > 1 is blurry < 1 is sharp.
			return: [MagickBooleanType!]
		]
		MagickResetImagePage: "MagickResetImagePage" [
			;== Resets the Wand page canvas and position
			;-- MagickBooleanType MagickResetImagePage(MagickWand *wandconst char *page)
			wand	[MagickWand!] ;the magick wand.
			page	[c-string!] ;the relative page specification.
			return: [MagickBooleanType!]
		]
		MagickResizeImage: "MagickResizeImage" [
			;== Scales an image to the desired dimensions with one of these filters:
			;-- MagickBooleanType MagickResizeImage(MagickWand *wandconst size_t columnsconst size_t rowsconst FilterTypes filterconst double blur)
			wand	[MagickWand!] ;the magick wand.
			columns	[size_t!] ;the number of columns in the scaled image.
			rows	[size_t!] ;the number of rows in the scaled image.
			filter	[FilterTypes!] ;Image filter to use.
			blur	[float!] ;the blur factor where > 1 is blurry < 1 is sharp.
			return: [MagickBooleanType!]
		]
		MagickRollImage: "MagickRollImage" [
			;== Offsets an image as defined by x and y
			;-- MagickBooleanType MagickRollImage(MagickWand *wandconst ssize_t xconst size_t y)
			wand	[MagickWand!] ;the magick wand.
			x	[ssize_t!] ;the x offset.
			y	[size_t!] ;the y offset.
			return: [MagickBooleanType!]
		]
		MagickRotateImage: "MagickRotateImage" [
			;== Rotates an image the specified number of degrees
			;-- MagickBooleanType MagickRotateImage(MagickWand *wandconst PixelWand *backgroundconst double degrees)
			wand	[MagickWand!] ;the magick wand.
			background	[PixelWand!] ;the background pixel wand.
			degrees	[float!] ;the number of degrees to rotate the image.
			return: [MagickBooleanType!]
		]
		MagickSampleImage: "MagickSampleImage" [
			;== Scales an image to the desired dimensions with pixel sampling
			;-- MagickBooleanType MagickSampleImage(MagickWand *wandconst size_t columnsconst size_t rows)
			wand	[MagickWand!] ;the magick wand.
			columns	[size_t!] ;the number of columns in the scaled image.
			rows	[size_t!] ;the number of rows in the scaled image.
			return: [MagickBooleanType!]
		]
		MagickScaleImage: "MagickScaleImage" [
			;== Scales the size of an image to the given dimensions
			;-- MagickBooleanType MagickScaleImage(MagickWand *wandconst size_t columnsconst size_t rows)
			wand	[MagickWand!] ;the magick wand.
			columns	[size_t!] ;the number of columns in the scaled image.
			rows	[size_t!] ;the number of rows in the scaled image.
			return: [MagickBooleanType!]
		]
		MagickSegmentImage: "MagickSegmentImage" [
			;== Segments an image by analyzing the histograms of the color components and identifying units that are homogeneous with the fuzzy C-means technique
			;-- MagickBooleanType MagickSegmentImage(MagickWand *wandconst ColorspaceType colorspaceconst MagickBooleanType verboseconst double cluster_thresholdconst double smooth_threshold)
			wand	[MagickWand!] ;the wand.
			colorspace	[ColorspaceType!] ;the image colorspace.
			verbose	[MagickBooleanType!] ;Set to MagickTrue to print detailed information about the identified classes.
			cluster_threshold	[float!] ;This represents the minimum number of pixels contained in a hexahedra before it can be considered valid (expressed as a percentage).
			smooth_threshold	[float!] ;the smoothing threshold eliminates noise in the second derivative of the histogram.  As the value is increased you can expect a smoother second derivative.
			return: [MagickBooleanType!]
		]
		MagickSelectiveBlurImage: "MagickSelectiveBlurImage" [
			;== Selectively blur an image within a contrast threshold
			;-- MagickBooleanType MagickSelectiveBlurImage(MagickWand *wandconst double radiusconst double sigmaconst double threshold)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the gaussian in pixels.
			threshold	[float!] ;only pixels within this contrast threshold are included in the blur operation.
			return: [MagickBooleanType!]
		]
		MagickSelectiveBlurImageChannel: "MagickSelectiveBlurImageChannel" [
			;== Selectively blur an image within a contrast threshold
			;-- MagickBooleanType MagickSelectiveBlurImageChannel(MagickWand *wandconst ChannelType channelconst double radiusconst double sigmaconst double threshold)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			radius	[float!] ;the radius of the gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the gaussian in pixels.
			threshold	[float!] ;only pixels within this contrast threshold are included in the blur operation.
			return: [MagickBooleanType!]
		]
		MagickSeparateImageChannel: "MagickSeparateImageChannel" [
			;== Separates a channel from the image and returns a grayscale image
			;-- MagickBooleanType MagickSeparateImageChannel(MagickWand *wandconst ChannelType channel)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			return: [MagickBooleanType!]
		]
		MagickSepiaToneImage: "MagickSepiaToneImage" [
			;== Applies a special effect to the image similar to the effect achieved in a photo darkroom by sepia toning
			;-- MagickBooleanType MagickSepiaToneImage(MagickWand *wandconst double threshold)
			wand	[MagickWand!] ;the magick wand.
			threshold	[float!] ;Define the extent of the sepia toning.
			return: [MagickBooleanType!]
		]
		MagickSetImage: "MagickSetImage" [
			;== Replaces the last image returned by MagickSetImageIndex() MagickNextImage() MagickPreviousImage() with the images from the specified wand
			;-- MagickBooleanType MagickSetImage(MagickWand *wandconst MagickWand *set_wand)
			wand	[MagickWand!] ;the magick wand.
			set_wand	[MagickWand!] ;the set_wand wand.
			return: [MagickBooleanType!]
		]
		MagickSetImageAlphaChannel: "MagickSetImageAlphaChannel" [
			;== Activates deactivates resets or sets the alpha channel
			;-- MagickBooleanType MagickSetImageAlphaChannel(MagickWand *wandconst AlphaChannelType alpha_type)
			wand	[MagickWand!] ;the magick wand.
			alpha_type	[AlphaChannelType!] ;the alpha channel type: ActivateAlphaChannel DeactivateAlphaChannel OpaqueAlphaChannel or SetAlphaChannel.
			return: [MagickBooleanType!]
		]
		MagickSetImageBackgroundColor: "MagickSetImageBackgroundColor" [
			;== Sets the image background color
			;-- MagickBooleanType MagickSetImageBackgroundColor(MagickWand *wandconst PixelWand *background)
			wand	[MagickWand!] ;the magick wand.
			background	[PixelWand!] ;the background pixel wand.
			return: [MagickBooleanType!]
		]
		MagickSetImageBias: "MagickSetImageBias" [
			;== Sets the image bias for any method that convolves an image (e
			;-- MagickBooleanType MagickSetImageBias(MagickWand *wandconst double bias)
			wand	[MagickWand!] ;the magick wand.
			bias	[float!] ;the image bias.
			return: [MagickBooleanType!]
		]
		MagickSetImageBluePrimary: "MagickSetImageBluePrimary" [
			;== Sets the image chromaticity blue primary point
			;-- MagickBooleanType MagickSetImageBluePrimary(MagickWand *wandconst double xconst double y)
			wand	[MagickWand!] ;the magick wand.
			x	[float!] ;the blue primary x-point.
			y	[float!] ;the blue primary y-point.
			return: [MagickBooleanType!]
		]
		MagickSetImageBorderColor: "MagickSetImageBorderColor" [
			;== Sets the image border color
			;-- MagickBooleanType MagickSetImageBorderColor(MagickWand *wandconst PixelWand *border)
			wand	[MagickWand!] ;the magick wand.
			border	[PixelWand!] ;the border pixel wand.
			return: [MagickBooleanType!]
		]
		MagickSetImageChannelDepth: "MagickSetImageChannelDepth" [
			;== Sets the depth of a particular image channel
			;-- MagickBooleanType MagickSetImageChannelDepth(MagickWand *wandconst ChannelType channelconst size_t depth)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			depth	[size_t!] ;the image depth in bits.
			return: [MagickBooleanType!]
		]
		MagickSetImageClipMask: "MagickSetImageClipMask" [
			;== Sets image clip mask
			;-- MagickBooleanType MagickSetImageClipMask(MagickWand *wandconst MagickWand *clip_mask)
			wand	[MagickWand!] ;the magick wand.
			clip_mask	[MagickWand!] ;the clip_mask wand.
			return: [MagickBooleanType!]
		]
		MagickSetImageColor: "MagickSetImageColor" [
			;== Set the entire wand canvas to the specified color
			;-- MagickBooleanType MagickSetImageColor(MagickWand *wandconst PixelWand *color)
			wand	[MagickWand!] ;the magick wand.
			color	[PixelWand!]
			return: [MagickBooleanType!]
		]
		MagickSetImageColormapColor: "MagickSetImageColormapColor" [
			;== Sets the color of the specified colormap index
			;-- MagickBooleanType MagickSetImageColormapColor(MagickWand *wandconst size_t indexconst PixelWand *color)
			wand	[MagickWand!] ;the magick wand.
			index	[size_t!] ;the offset into the image colormap.
			color	[PixelWand!] ;Return the colormap color in this wand.
			return: [MagickBooleanType!]
		]
		MagickSetImageColorspace: "MagickSetImageColorspace" [
			;== Sets the image colorspace
			;-- MagickBooleanType MagickSetImageColorspace(MagickWand *wandconst ColorspaceType colorspace)
			wand	[MagickWand!] ;the magick wand.
			colorspace	[ColorspaceType!] ;the image colorspace:   UndefinedColorspace RGBColorspace GRAYColorspace TransparentColorspace OHTAColorspace XYZColorspace YCbCrColorspace YCCColorspace YIQColorspace YPbPrColorspace YPbPrColorspace YUVColorspace CMYKColorspace sRGBColorspace HSLColorspace or HWBColorspace.
			return: [MagickBooleanType!]
		]
		MagickSetImageCompose: "MagickSetImageCompose" [
			;== Sets the image composite operator useful for specifying how to composite the image thumbnail when using the MagickMontageImage() method
			;-- MagickBooleanType MagickSetImageCompose(MagickWand *wandconst CompositeOperator compose)
			wand	[MagickWand!] ;the magick wand.
			compose	[CompositeOperator!] ;the image composite operator.
			return: [MagickBooleanType!]
		]
		MagickSetImageCompression: "MagickSetImageCompression" [
			;== Sets the image compression
			;-- MagickBooleanType MagickSetImageCompression(MagickWand *wandconst CompressionType compression)
			wand	[MagickWand!] ;the magick wand.
			compression	[CompressionType!] ;the image compression type.
			return: [MagickBooleanType!]
		]
		MagickSetImageCompressionQuality: "MagickSetImageCompressionQuality" [
			;== Sets the image compression quality
			;-- MagickBooleanType MagickSetImageCompressionQuality(MagickWand *wandconst size_t quality)
			wand	[MagickWand!] ;the magick wand.
			quality	[size_t!] ;the image compression tlityype.
			return: [MagickBooleanType!]
		]
		MagickSetImageDelay: "MagickSetImageDelay" [
			;== Sets the image delay
			;-- MagickBooleanType MagickSetImageDelay(MagickWand *wandconst size_t delay)
			wand	[MagickWand!] ;the magick wand.
			delay	[size_t!] ;the image delay in ticks-per-second units.
			return: [MagickBooleanType!]
		]
		MagickSetImageDepth: "MagickSetImageDepth" [
			;== Sets the image depth
			;-- MagickBooleanType MagickSetImageDepth(MagickWand *wandconst size_t depth)
			wand	[MagickWand!] ;the magick wand.
			depth	[size_t!] ;the image depth in bits: 8 16 or 32.
			return: [MagickBooleanType!]
		]
		MagickSetImageDispose: "MagickSetImageDispose" [
			;== Sets the image disposal method
			;-- MagickBooleanType MagickSetImageDispose(MagickWand *wandconst DisposeType dispose)
			wand	[MagickWand!] ;the magick wand.
			dispose	[DisposeType!] ;the image disposeal type.
			return: [MagickBooleanType!]
		]
		MagickSetImageExtent: "MagickSetImageExtent" [
			;== Sets the image size (i
			;-- MagickBooleanType MagickSetImageExtent(MagickWand *wandconst size_t columnsconst unsigned rows)
			wand	[MagickWand!] ;the magick wand.
			columns	[size_t!] ;The image width in pixels.
			rows	[integer!] ;The image height in pixels.
			return: [MagickBooleanType!]
		]
		MagickSetImageFilename: "MagickSetImageFilename" [
			;== Sets the filename of a particular image in a sequence
			;-- MagickBooleanType MagickSetImageFilename(MagickWand *wandconst char *filename)
			wand	[MagickWand!] ;the magick wand.
			filename	[c-string!] ;the image filename.
			return: [MagickBooleanType!]
		]
		MagickSetImageFormat: "MagickSetImageFormat" [
			;== Sets the format of a particular image in a sequence
			;-- MagickBooleanType MagickSetImageFormat(MagickWand *wandconst char *format)
			wand	[MagickWand!] ;the magick wand.
			format	[c-string!] ;the image format.
			return: [MagickBooleanType!]
		]
		MagickSetImageFuzz: "MagickSetImageFuzz" [
			;== Sets the image fuzz
			;-- MagickBooleanType MagickSetImageFuzz(MagickWand *wandconst double fuzz)
			wand	[MagickWand!] ;the magick wand.
			fuzz	[float!] ;the image fuzz.
			return: [MagickBooleanType!]
		]
		MagickSetImageGamma: "MagickSetImageGamma" [
			;== Sets the image gamma
			;-- MagickBooleanType MagickSetImageGamma(MagickWand *wandconst double gamma)
			wand	[MagickWand!] ;the magick wand.
			gamma	[float!] ;the image gamma.
			return: [MagickBooleanType!]
		]
		MagickSetImageGravity: "MagickSetImageGravity" [
			;== Sets the image gravity type
			;-- MagickBooleanType MagickSetImageGravity(MagickWand *wandconst GravityType gravity)
			wand	[MagickWand!] ;the magick wand.
			gravity	[GravityType!] ;the image interlace scheme: NoInterlace LineInterlace PlaneInterlace PartitionInterlace.
			return: [MagickBooleanType!]
		]
		MagickSetImageGreenPrimary: "MagickSetImageGreenPrimary" [
			;== Sets the image chromaticity green primary point
			;-- MagickBooleanType MagickSetImageGreenPrimary(MagickWand *wandconst double xconst double y)
			wand	[MagickWand!] ;the magick wand.
			x	[float!] ;the green primary x-point.
			y	[float!] ;the green primary y-point.
			return: [MagickBooleanType!]
		]
		MagickSetImageInterlaceScheme: "MagickSetImageInterlaceScheme" [
			;== Sets the image interlace scheme
			;-- MagickBooleanType MagickSetImageInterlaceScheme(MagickWand *wandconst InterlaceType interlace)
			wand	[MagickWand!] ;the magick wand.
			interlace	[InterlaceType!] ;the image interlace scheme: NoInterlace LineInterlace PlaneInterlace PartitionInterlace.
			return: [MagickBooleanType!]
		]
		MagickSetImageInterpolateMethod: "MagickSetImageInterpolateMethod" [
			;== Sets the image interpolate pixel method
			;-- MagickBooleanType MagickSetImageInterpolateMethod(MagickWand *wandconst InterpolatePixelMethod method)
			wand	[MagickWand!] ;the magick wand.
			method	[InterpolatePixelMethod!] ;the image interpole pixel methods: choose from Undefined Average Bicubic Bilinear Filter Integer Mesh NearestNeighbor.
			return: [MagickBooleanType!]
		]
		MagickSetImageIterations: "MagickSetImageIterations" [
			;== Sets the image iterations
			;-- MagickBooleanType MagickSetImageIterations(MagickWand *wandconst size_t iterations)
			wand	[MagickWand!] ;the magick wand.
			iterations	[size_t!]
			return: [MagickBooleanType!]
		]
		MagickSetImageMatte: "MagickSetImageMatte" [
			;== Sets the image matte channel
			;-- MagickBooleanType MagickSetImageMatte(MagickWand *wandconst MagickBooleanType *matte)
			wand	[MagickWand!] ;the magick wand.
			matte	[MagickBooleanType!] ;Set to MagickTrue to enable the image matte channel otherwise MagickFalse.
			return: [MagickBooleanType!]
		]
		MagickSetImageMatteColor: "MagickSetImageMatteColor" [
			;== Sets the image matte color
			;-- MagickBooleanType MagickSetImageMatteColor(MagickWand *wandconst PixelWand *matte)
			wand	[MagickWand!] ;the magick wand.
			matte	[PixelWand!] ;the matte pixel wand.
			return: [MagickBooleanType!]
		]
		;MagickSetImageOpacity: "MagickSetImageOpacity" [
		MagickSetImageOpacity: "MagickSetImageAlpha" [
			;== Sets the image to the specified opacity level
			;-- MagickBooleanType MagickSetImageOpacity(MagickWand *wandconst double alpha)
			wand	[MagickWand!] ;the magick wand.
			alpha	[float!] ;the level of transparency: 1.0 is fully opaque and 0.0 is fully transparent.
			return: [MagickBooleanType!]
		]
		MagickSetImageOrientation: "MagickSetImageOrientation" [
			;== Sets the image orientation
			;-- MagickBooleanType MagickSetImageOrientation(MagickWand *wandconst OrientationType orientation)
			wand	[MagickWand!] ;the magick wand.
			orientation	[OrientationType!] ;the image orientation type.
			return: [MagickBooleanType!]
		]
		MagickSetImagePage: "MagickSetImagePage" [
			;== Sets the page geometry of the image
			;-- MagickBooleanType MagickSetImagePage(MagickWand *wandconst size_t widthconst size_t heightconst ssize_t xconst ssize_t y)
			wand	[MagickWand!] ;the magick wand.
			width	[size_t!] ;the page width.
			height	[size_t!] ;the page height.
			x	[ssize_t!] ;the page x-offset.
			y	[ssize_t!] ;the page y-offset.
			return: [MagickBooleanType!]
		]
		MagickSetImageProgressMonitor: "MagickSetImageProgressMonitor" [
			;== Sets the wand image progress monitor to the specified method and returns the previous progress monitor if any
			;-- MagickProgressMonitor MagickSetImageProgressMonitor(MagickWand *wandconst MagickProgressMonitor progress_monitorvoid *client_data)
			wand	[MagickWand!] ;the magick wand.
			progress_monitor	[?MagickProgressMonitor] ;Specifies a pointer to a method to monitor progress of an image operation.
			client_data	[pointer! [byte!]] ;Specifies a pointer to any client data.
			return: [?MagickProgressMonitor]
		]
		MagickSetImageRedPrimary: "MagickSetImageRedPrimary" [
			;== Sets the image chromaticity red primary point
			;-- MagickBooleanType MagickSetImageRedPrimary(MagickWand *wandconst double xconst double y)
			wand	[MagickWand!] ;the magick wand.
			x	[float!] ;the red primary x-point.
			y	[float!] ;the red primary y-point.
			return: [MagickBooleanType!]
		]
		MagickSetImageRenderingIntent: "MagickSetImageRenderingIntent" [
			;== Sets the image rendering intent
			;-- MagickBooleanType MagickSetImageRenderingIntent(MagickWand *wandconst RenderingIntent rendering_intent)
			wand	[MagickWand!] ;the magick wand.
			rendering_intent	[RenderingIntent!] ;the image rendering intent: UndefinedIntent SaturationIntent PerceptualIntent AbsoluteIntent or RelativeIntent.
			return: [MagickBooleanType!]
		]
		MagickSetImageResolution: "MagickSetImageResolution" [
			;== Sets the image resolution
			;-- MagickBooleanType MagickSetImageResolution(MagickWand *wandconst double x_resolutionconst double y_resolution)
			wand	[MagickWand!] ;the magick wand.
			x_resolution	[float!] ;the image x resolution.
			y_resolution	[float!] ;the image y resolution.
			return: [MagickBooleanType!]
		]
		MagickSetImageScene: "MagickSetImageScene" [
			;== Sets the image scene
			;-- MagickBooleanType MagickSetImageScene(MagickWand *wandconst size_t scene)
			wand	[MagickWand!] ;the magick wand.
			scene	[size_t!]
			return: [MagickBooleanType!]
		]
		MagickSetImageTicksPerSecond: "MagickSetImageTicksPerSecond" [
			;== Sets the image ticks-per-second
			;-- MagickBooleanType MagickSetImageTicksPerSecond(MagickWand *wandconst ssize_t ticks_per-second)
			wand	[MagickWand!] ;the magick wand.
			ticks_per-second	[ssize_t!]
			return: [MagickBooleanType!]
		]
		MagickSetImageType: "MagickSetImageType" [
			;== Sets the image type
			;-- MagickBooleanType MagickSetImageType(MagickWand *wandconst ImageType image_type)
			wand	[MagickWand!] ;the magick wand.
			image_type	[ImageType!] ;the image type:   UndefinedType BilevelType GrayscaleType GrayscaleMatteType PaletteType PaletteMatteType TrueColorType TrueColorMatteType ColorSeparationType ColorSeparationMatteType or OptimizeType.
			return: [MagickBooleanType!]
		]
		MagickSetImageUnits: "MagickSetImageUnits" [
			;== Sets the image units of resolution
			;-- MagickBooleanType MagickSetImageUnits(MagickWand *wandconst ResolutionType units)
			wand	[MagickWand!] ;the magick wand.
			units	[ResolutionType!] ;the image units of resolution : UndefinedResolution PixelsPerInchResolution or PixelsPerCentimeterResolution.
			return: [MagickBooleanType!]
		]
		MagickSetImageVirtualPixelMethod: "MagickSetImageVirtualPixelMethod" [
			;== Sets the image virtual pixel method
			;-- VirtualPixelMethod MagickSetImageVirtualPixelMethod(MagickWand *wandconst VirtualPixelMethod method)
			wand	[MagickWand!] ;the magick wand.
			method	[VirtualPixelMethod!] ;the image virtual pixel method : UndefinedVirtualPixelMethod ConstantVirtualPixelMethod  EdgeVirtualPixelMethod MirrorVirtualPixelMethod or TileVirtualPixelMethod.
			return: [VirtualPixelMethod!]
		]
		MagickSetImageWhitePoint: "MagickSetImageWhitePoint" [
			;== Sets the image chromaticity white point
			;-- MagickBooleanType MagickSetImageWhitePoint(MagickWand *wandconst double xconst double y)
			wand	[MagickWand!] ;the magick wand.
			x	[float!] ;the white x-point.
			y	[float!] ;the white y-point.
			return: [MagickBooleanType!]
		]
		MagickShadeImage: "MagickShadeImage" [
			;== Shines a distant light on an image to create a three-dimensional effect
			;-- MagickBooleanType MagickShadeImage(MagickWand *wandconst MagickBooleanType grayconst double azimuthconst double elevation)
			wand	[MagickWand!] ;the magick wand.
			gray	[MagickBooleanType!] ;A value other than zero shades the intensity of each pixel.
			azimuth	[float!] ;Define the light source direction.
			elevation	[float!]
			return: [MagickBooleanType!]
		]
		MagickShadowImage: "MagickShadowImage" [
			;== Simulates an image shadow
			;-- MagickBooleanType MagickShadowImage(MagickWand *wandconst double opacityconst double sigmaconst ssize_t xconst ssize_t y)
			wand	[MagickWand!] ;the magick wand.
			opacity	[float!] ;percentage transparency.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			x	[ssize_t!] ;the shadow x-offset.
			y	[ssize_t!] ;the shadow y-offset.
			return: [MagickBooleanType!]
		]
		MagickSharpenImage: "MagickSharpenImage" [
			;== Sharpens an image
			;-- MagickBooleanType MagickSharpenImage(MagickWand *wandconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			return: [MagickBooleanType!]
		]
		MagickSharpenImageChannel: "MagickSharpenImageChannel" [
			;== Sharpens an image
			;-- MagickBooleanType MagickSharpenImageChannel(MagickWand *wandconst ChannelType channelconst double radiusconst double sigma)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			return: [MagickBooleanType!]
		]
		MagickShaveImage: "MagickShaveImage" [
			;== Shaves pixels from the image edges
			;-- MagickBooleanType MagickShaveImage(MagickWand *wandconst size_t columnsconst size_t rows)
			wand	[MagickWand!] ;the magick wand.
			columns	[size_t!] ;the number of columns in the scaled image.
			rows	[size_t!] ;the number of rows in the scaled image.
			return: [MagickBooleanType!]
		]
		MagickShearImage: "MagickShearImage" [
			;== Slides one edge of an image along the X or Y axis creating a parallelogram
			;-- MagickBooleanType MagickShearImage(MagickWand *wandconst PixelWand *backgroundconst double x_shearconst double y_shear)
			wand	[MagickWand!] ;the magick wand.
			background	[PixelWand!] ;the background pixel wand.
			x_shear	[float!] ;the number of degrees to shear the image.
			y_shear	[float!]
			return: [MagickBooleanType!]
		]
		MagickSigmoidalContrastImage: "MagickSigmoidalContrastImage" [
			;== Adjusts the contrast of an image with a non-linear sigmoidal contrast algorithm
			;-- MagickBooleanType MagickSigmoidalContrastImage(MagickWand *wandconst MagickBooleanType sharpenconst double alphaconst double beta)
			wand	[MagickWand!] ;the magick wand.
			sharpen	[MagickBooleanType!] ;Increase or decrease image contrast.
			alpha	[float!] ;strength of the contrast the larger the number the more 'threshold-like' it becomes.
			beta	[float!] ;midpoint of the function as a color value 0 to QuantumRange.
			return: [MagickBooleanType!]
		]
		MagickSigmoidalContrastImageChannel: "MagickSigmoidalContrastImageChannel" [
			;== Adjusts the contrast of an image with a non-linear sigmoidal contrast algorithm
			;-- MagickBooleanType MagickSigmoidalContrastImageChannel(MagickWand *wandconst ChannelType channelconst MagickBooleanType sharpenconst double alphaconst double beta)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;Identify which channel to level: RedChannel GreenChannel
			sharpen	[MagickBooleanType!] ;Increase or decrease image contrast.
			alpha	[float!] ;strength of the contrast the larger the number the more 'threshold-like' it becomes.
			beta	[float!] ;midpoint of the function as a color value 0 to QuantumRange.
			return: [MagickBooleanType!]
		]
		MagickSimilarityImage: "MagickSimilarityImage" [
			;== Compares the reference image of the image and returns the best match offset
			;-- MagickWand *MagickSimilarityImage(MagickWand *wandconst MagickWand *referenceRectangeInfo *offsetdouble *similarity)
			wand	[MagickWand!] ;the magick wand.
			reference	[MagickWand!] ;the reference wand.
			offset	[pointer! [integer!]] ;the best match offset of the reference image within the image.
			similarity	[pointer! [float!]] ;the computed similarity between the images.
			return: [MagickWand!]
		]
		MagickSketchImage: "MagickSketchImage" [
			;== Simulates a pencil sketch
			;-- MagickBooleanType MagickSketchImage(MagickWand *wandconst double radiusconst double sigmaconst double angle)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			angle	[float!] ;Apply the effect along this angle.
			return: [MagickBooleanType!]
		]
		MagickSmushImages: "MagickSmushImages" [
			;== Takes all images from the current image pointer to the end of the image list and smushs them to each other top-to-bottom if the stack parameter is true otherwise left-to-right
			;-- MagickWand *MagickSmushImages(MagickWand *wandconst MagickBooleanType stackconst ssize_t offset)
			wand	[MagickWand!] ;the magick wand.
			stack	[MagickBooleanType!] ;By default images are stacked left-to-right. Set stack to MagickTrue to stack them top-to-bottom.
			offset	[ssize_t!] ;minimum distance in pixels between images.
			return: [MagickWand!]
		]
		MagickSolarizeImage: "MagickSolarizeImage" [
			;== Applies a special effect to the image similar to the effect achieved in a photo darkroom by selectively exposing areas of photo sensitive paper to light
			;-- MagickBooleanType MagickSolarizeImage(MagickWand *wandconst double threshold)
			wand	[MagickWand!] ;the magick wand.
			threshold	[float!] ;Define the extent of the solarization.
			return: [MagickBooleanType!]
		]
		MagickSpliceImage: "MagickSpliceImage" [
			;== Splices a solid color into the image
			;-- MagickBooleanType MagickSpliceImage(MagickWand *wandconst size_t widthconst size_t heightconst ssize_t xconst ssize_t y)
			wand	[MagickWand!] ;the magick wand.
			width	[size_t!] ;the region width.
			height	[size_t!] ;the region height.
			x	[ssize_t!] ;the region x offset.
			y	[ssize_t!] ;the region y offset.
			return: [MagickBooleanType!]
		]
		MagickSpreadImage: "MagickSpreadImage" [
			;== Is a special effects method that randomly displaces each pixel in a block defined by the radius parameter
			;-- MagickBooleanType MagickSpreadImage(MagickWand *wandconst double radius)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;Choose a random pixel in a neighborhood of this extent.
			return: [MagickBooleanType!]
		]
		MagickStatisticImage: "MagickStatisticImage" [
			;== Replace each pixel with corresponding statistic from the neighborhood of the specified width and height
			;-- MagickBooleanType MagickStatisticImage(MagickWand *wandconst StatisticType typeconst double widthconst size_t height)
			wand	[MagickWand!] ;the magick wand.
			type	[StatisticType!] ;the statistic type (e.g. median mode etc.).
			width	[float!] ;the width of the pixel neighborhood.
			height	[size_t!] ;the height of the pixel neighborhood.
			return: [MagickBooleanType!]
		]
		MagickStatisticImageChannel: "MagickStatisticImageChannel" [
			;== Replace each pixel with corresponding statistic from the neighborhood of the specified width and height
			;-- MagickBooleanType MagickStatisticImageChannel(MagickWand *wandconst ChannelType channelconst StatisticType typeconst double widthconst size_t height)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			type	[StatisticType!] ;the statistic type (e.g. median mode etc.).
			width	[float!] ;the width of the pixel neighborhood.
			height	[size_t!] ;the height of the pixel neighborhood.
			return: [MagickBooleanType!]
		]
		MagickSteganoImage: "MagickSteganoImage" [
			;== Hides a digital watermark within the image
			;-- MagickWand *MagickSteganoImage(MagickWand *wandconst MagickWand *watermark_wandconst ssize_t offset)
			wand	[MagickWand!] ;the magick wand.
			watermark_wand	[MagickWand!] ;the watermark wand.
			offset	[ssize_t!] ;Start hiding at this offset into the image.
			return: [MagickWand!]
		]
		MagickStereoImage: "MagickStereoImage" [
			;== Composites two images and produces a single image that is the composite of a left and right image of a stereo pair
			;-- MagickWand *MagickStereoImage(MagickWand *wandconst MagickWand *offset_wand)
			wand	[MagickWand!] ;the magick wand.
			offset_wand	[MagickWand!] ;Another image wand.
			return: [MagickWand!]
		]
		MagickStripImage: "MagickStripImage" [
			;== Strips an image of all profiles and comments
			;-- MagickBooleanType MagickStripImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickSwirlImage: "MagickSwirlImage" [
			;== Swirls the pixels about the center of the image where degrees indicates the sweep of the arc through which each pixel is moved
			;-- MagickBooleanType MagickSwirlImage(MagickWand *wandconst double degrees)
			wand	[MagickWand!] ;the magick wand.
			degrees	[float!] ;Define the tightness of the swirling effect.
			return: [MagickBooleanType!]
		]
		MagickTextureImage: "MagickTextureImage" [
			;== Repeatedly tiles the texture image across and down the image canvas
			;-- MagickWand *MagickTextureImage(MagickWand *wandconst MagickWand *texture_wand)
			wand	[MagickWand!] ;the magick wand.
			texture_wand	[MagickWand!] ;the texture wand
			return: [MagickWand!]
		]
		MagickThresholdImage: "MagickThresholdImage" [
			;== Changes the value of individual pixels based on the intensity of each pixel compared to threshold
			;-- MagickBooleanType MagickThresholdImage(MagickWand *wandconst double threshold)
			wand	[MagickWand!] ;the magick wand.
			threshold	[float!] ;Define the threshold value.
			return: [MagickBooleanType!]
		]
		MagickThresholdImageChannel: "MagickThresholdImageChannel" [
			;== Changes the value of individual pixels based on the intensity of each pixel compared to threshold
			;-- MagickBooleanType MagickThresholdImageChannel(MagickWand *wandconst ChannelType channelconst double threshold)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			threshold	[float!] ;Define the threshold value.
			return: [MagickBooleanType!]
		]
		MagickThumbnailImage: "MagickThumbnailImage" [
			;== Changes the size of an image to the given dimensions and removes any associated profiles
			;-- MagickBooleanType MagickThumbnailImage(MagickWand *wandconst size_t columnsconst size_t rows)
			wand	[MagickWand!] ;the magick wand.
			columns	[size_t!] ;the number of columns in the scaled image.
			rows	[size_t!] ;the number of rows in the scaled image.
			return: [MagickBooleanType!]
		]
		MagickTintImage: "MagickTintImage" [
			;== Applies a color vector to each pixel in the image
			;-- MagickBooleanType MagickTintImage(MagickWand *wandconst PixelWand *tintconst PixelWand *opacity)
			wand	[MagickWand!] ;the magick wand.
			tint	[PixelWand!] ;the tint pixel wand.
			opacity	[PixelWand!] ;the opacity pixel wand.
			return: [MagickBooleanType!]
		]
		MagickTransformImage: "MagickTransformImage" [
			;== Is a convenience method that behaves like MagickResizeImage() or MagickCropImage() but accepts scaling and/or cropping information as a region geometry specification
			;-- MagickWand *MagickTransformImage(MagickWand *wandconst char *cropconst char *geometry)
			wand	[MagickWand!] ;the magick wand.
			crop	[c-string!] ;A crop geometry string.  This geometry defines a subregion of the image to crop.
			geometry	[c-string!] ;An image geometry string.  This geometry defines the final size of the image.
			return: [MagickWand!]
		]
		MagickTransformImageColorspace: "MagickTransformImageColorspace" [
			;== Transform the image colorspace
			;-- MagickBooleanType MagickTransformImageColorspace(MagickWand *wandconst ColorspaceType colorspace)
			wand	[MagickWand!] ;the magick wand.
			colorspace	[ColorspaceType!] ;the image colorspace:   UndefinedColorspace RGBColorspace GRAYColorspace TransparentColorspace OHTAColorspace XYZColorspace YCbCrColorspace YCCColorspace YIQColorspace YPbPrColorspace YPbPrColorspace YUVColorspace CMYKColorspace sRGBColorspace HSLColorspace or HWBColorspace.
			return: [MagickBooleanType!]
		]
		MagickTransparentPaintImage: "MagickTransparentPaintImage" [
			;== Changes any pixel that matches color with the color defined by fill
			;-- MagickBooleanType MagickTransparentPaintImage(MagickWand *wandconst PixelWand *targetconst double alphaconst double fuzzconst MagickBooleanType invert)
			wand	[MagickWand!] ;the magick wand.
			target	[PixelWand!] ;Change this target color to specified opacity value within the image.
			alpha	[float!] ;the level of transparency: 1.0 is fully opaque and 0.0 is fully transparent.
			fuzz	[float!] ;By default target must match a particular pixel color exactly.  However in many cases two colors may differ by a small amount. The fuzz member of image defines how much tolerance is acceptable to consider two colors as the same.  For example set fuzz to 10 and the color red at intensities of 100 and 102 respectively are now interpreted as the same color for the purposes of the floodfill.
			invert	[MagickBooleanType!] ;paint any pixel that does not match the target color.
			return: [MagickBooleanType!]
		]
		MagickTransposeImage: "MagickTransposeImage" [
			;== Creates a vertical mirror image by reflecting the pixels around the central x-axis while rotating them 90-degrees
			;-- MagickBooleanType MagickTransposeImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickTransverseImage: "MagickTransverseImage" [
			;== Creates a horizontal mirror image by reflecting the pixels around the central y-axis while rotating them 270-degrees
			;-- MagickBooleanType MagickTransverseImage(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickTrimImage: "MagickTrimImage" [
			;== Remove edges that are the background color from the image
			;-- MagickBooleanType MagickTrimImage(MagickWand *wandconst double fuzz)
			wand	[MagickWand!] ;the magick wand.
			fuzz	[float!] ;By default target must match a particular pixel color exactly.  However in many cases two colors may differ by a small amount. The fuzz member of image defines how much tolerance is acceptable to consider two colors as the same.  For example set fuzz to 10 and the color red at intensities of 100 and 102 respectively are now interpreted as the same color for the purposes of the floodfill.
			return: [MagickBooleanType!]
		]
		MagickUniqueImageColors: "MagickUniqueImageColors" [
			;== Discards all but one of any pixel color
			;-- MagickBooleanType MagickUniqueImageColors(MagickWand *wand)
			wand	[MagickWand!] ;the magick wand.
			return: [MagickBooleanType!]
		]
		MagickUnsharpMaskImage: "MagickUnsharpMaskImage" [
			;== Sharpens an image
			;-- MagickBooleanType MagickUnsharpMaskImage(MagickWand *wandconst double radiusconst double sigmaconst double amountconst double threshold)
			wand	[MagickWand!] ;the magick wand.
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			amount	[float!] ;the percentage of the difference between the original and the blur image that is added back into the original.
			threshold	[float!] ;the threshold in pixels needed to apply the diffence amount.
			return: [MagickBooleanType!]
		]
		MagickUnsharpMaskImageChannel: "MagickUnsharpMaskImageChannel" [
			;== Sharpens an image
			;-- MagickBooleanType MagickUnsharpMaskImageChannel(MagickWand *wandconst ChannelType channelconst double radiusconst double sigmaconst double amountconst double threshold)
			wand	[MagickWand!] ;the magick wand.
			channel	[ChannelType!] ;the image channel(s).
			radius	[float!] ;the radius of the Gaussian in pixels not counting the center pixel.
			sigma	[float!] ;the standard deviation of the Gaussian in pixels.
			amount	[float!] ;the percentage of the difference between the original and the blur image that is added back into the original.
			threshold	[float!] ;the threshold in pixels needed to apply the diffence amount.
			return: [MagickBooleanType!]
		]
		MagickVignetteImage: "MagickVignetteImage" [
			;== Softens the edges of the image in vignette style
			;-- MagickBooleanType MagickVignetteImage(MagickWand *wandconst double black_pointconst double white_pointconst ssize_t xconst ssize_t y)
			wand	[MagickWand!] ;the magick wand.
			black_point	[float!] ;the black point.
			white_point	[float!] ;the white point.
			x	[ssize_t!] ;Define the x and y ellipse offset.
			y	[ssize_t!]
			return: [MagickBooleanType!]
		]
		MagickWaveImage: "MagickWaveImage" [
			;== Creates a 'ripple' effect in the image by shifting the pixels vertically along a sine wave whose amplitude and wavelength is specified by the given parameters
			;-- MagickBooleanType MagickWaveImage(MagickWand *wandconst double amplitudeconst double wave_length)
			wand	[MagickWand!] ;the magick wand.
			amplitude	[float!] ;Define the amplitude and wave length of the sine wave.
			wave_length	[float!]
			return: [MagickBooleanType!]
		]
		MagickWhiteThresholdImage: "MagickWhiteThresholdImage" [
			;== Is like ThresholdImage() but  force all pixels above the threshold into white while leaving all pixels below the threshold unchanged
			;-- MagickBooleanType MagickWhiteThresholdImage(MagickWand *wandconst PixelWand *threshold)
			wand	[MagickWand!] ;the magick wand.
			threshold	[PixelWand!] ;the pixel wand.
			return: [MagickBooleanType!]
		]
		MagickWriteImage: "MagickWriteImage" [
			;== Writes an image to the specified filename
			;-- MagickBooleanType MagickWriteImage(MagickWand *wandconst char *filename)
			wand	[MagickWand!] ;the magick wand.
			filename	[c-string!] ;the image filename.
			return: [MagickBooleanType!]
		]
		MagickWriteImageFile: "MagickWriteImageFile" [
			;== Writes an image to an open file descriptor
			;-- MagickBooleanType MagickWriteImageFile(MagickWand *wandFILE *file)
			wand	[MagickWand!] ;the magick wand.
			file	[FILE!] ;the file descriptor.
			return: [MagickBooleanType!]
		]
		MagickWriteImages: "MagickWriteImages" [
			;== Writes an image or image sequence
			;-- MagickBooleanType MagickWriteImages(MagickWand *wandconst char *filenameconst MagickBooleanType adjoin)
			wand	[MagickWand!] ;the magick wand.
			filename	[c-string!] ;the image filename.
			adjoin	[MagickBooleanType!] ;join images into a single multi-image file.
			return: [MagickBooleanType!]
		]
		MagickWriteImagesFile: "MagickWriteImagesFile" [
			;== Writes an image sequence to an open file descriptor
			;-- MagickBooleanType MagickWriteImagesFile(MagickWand *wandFILE *file)
			wand	[MagickWand!] ;the magick wand.
			file	[FILE!] ;the file descriptor.
			return: [MagickBooleanType!]
		]


	;==== source: drawing-wand.reb ====;

		ClearDrawingWand: "ClearDrawingWand" [
			;== Clears resources associated with the drawing wand
			;-- void ClearDrawingWand(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand to clear.
		]
		CloneDrawingWand: "CloneDrawingWand" [
			;== Makes an exact copy of the specified wand
			;-- DrawingWand *CloneDrawingWand(const DrawingWand *wand)
			wand	[DrawingWand!] ;the magick wand.
			return: [DrawingWand!]
		]
		DestroyDrawingWand: "DestroyDrawingWand" [
			;== Frees all resources associated with the drawing wand
			;-- DrawingWand *DestroyDrawingWand(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand to destroy.
			return: [DrawingWand!]
		]
		DrawAffine: "DrawAffine" [
			;== Adjusts the current affine transformation matrix with the specified affine transformation matrix
			;-- void DrawAffine(DrawingWand *wandconst AffineMatrix *affine)
			wand	[DrawingWand!] ;Drawing wand
			affine	[AffineMatrix!] ;Affine matrix parameters
		]
		DrawAnnotation: "DrawAnnotation" [
			;== Draws text on the image
			;-- void DrawAnnotation(DrawingWand *wandconst double xconst double yconst unsigned char *text)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;x ordinate to left of text
			y	[float!] ;y ordinate to text baseline
			text	[pointer! [byte!]] ;text to draw
		]
		DrawArc: "DrawArc" [
			;== Draws an arc falling within a specified bounding rectangle on the image
			;-- void DrawArc(DrawingWand *wandconst double sxconst double syconst double exconst double eyconst double sdconst double ed)
			wand	[DrawingWand!] ;the drawing wand.
			sx	[float!] ;starting x ordinate of bounding rectangle
			sy	[float!] ;starting y ordinate of bounding rectangle
			ex	[float!] ;ending x ordinate of bounding rectangle
			ey	[float!] ;ending y ordinate of bounding rectangle
			sd	[float!] ;starting degrees of rotation
			ed	[float!] ;ending degrees of rotation
		]
		DrawBezier: "DrawBezier" [
			;== Draws a bezier curve through a set of points on the image
			;-- void DrawBezier(DrawingWand *wandconst size_t number_coordinatesconst PointInfo *coordinates)
			wand	[DrawingWand!] ;the drawing wand.
			number_coordinates	[size_t!] ;number of coordinates
			coordinates	[PointInfo!] ;coordinates
		]
		DrawCircle: "DrawCircle" [
			;== Draws a circle on the image
			;-- void DrawCircle(DrawingWand *wandconst double oxconst double oyconst double px const double py)
			wand	[DrawingWand!] ;the drawing wand.
			ox	[float!] ;origin x ordinate
			oy	[float!] ;origin y ordinate
			px	[float!] ;perimeter x ordinate
			py	[float!] ;perimeter y ordinate
		]
		DrawClearException: "DrawClearException" [
			;== Clear any exceptions associated with the wand
			;-- MagickBooleanType DrawClearException(DrawWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [MagickBooleanType!]
		]
		DrawComposite: "DrawComposite" [
			;== Composites an image onto the current image using the specified composition operator specified position and at the specified size
			;-- MagickBooleanType DrawComposite(DrawingWand *wandconst CompositeOperator composeconst double xconst double yconst double widthconst double heightMagickWand *magick_wand)
			wand	[DrawingWand!] ;the drawing wand.
			compose	[CompositeOperator!] ;composition operator
			x	[float!] ;x ordinate of top left corner
			y	[float!] ;y ordinate of top left corner
			width	[float!] ;Width to resize image to prior to compositing.  Specify zero to use existing width.
			height	[float!] ;Height to resize image to prior to compositing.  Specify zero to use existing height.
			magick_wand	[MagickWand!] ;Image to composite is obtained from this wand.
			return: [MagickBooleanType!]
		]
		DrawColor: "DrawColor" [
			;== Draws color on image using the current fill color starting at specified position and using specified paint method
			;-- void DrawColor(DrawingWand *wandconst double xconst double yconst PaintMethod paint_method)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;x ordinate.
			y	[float!] ;y ordinate.
			paint_method	[PaintMethod!] ;paint method.
		]
		DrawComment: "DrawComment" [
			;== Adds a comment to a vector output stream
			;-- void DrawComment(DrawingWand *wandconst char *comment)
			wand	[DrawingWand!] ;the drawing wand.
			comment	[c-string!] ;comment text
		]
		DrawEllipse: "DrawEllipse" [
			;== Draws an ellipse on the image
			;-- void DrawEllipse(DrawingWand *wandconst double oxconst double oy const double rxconst double ryconst double startconst double end)
			wand	[DrawingWand!] ;the drawing wand.
			ox	[float!] ;origin x ordinate
			oy	[float!] ;origin y ordinate
			rx	[float!] ;radius in x
			ry	[float!] ;radius in y
			start	[float!] ;starting rotation in degrees
			end	[float!] ;ending rotation in degrees
		]
		DrawGetBorderColor: "DrawGetBorderColor" [
			;== Returns the border color used for drawing bordered objects
			;-- void DrawGetBorderColor(const DrawingWand *wandPixelWand *border_color)
			wand	[DrawingWand!] ;the drawing wand.
			border_color	[PixelWand!] ;Return the border color.
		]
		DrawGetClipPath: "DrawGetClipPath" [
			;== Obtains the current clipping path ID
			;-- char *DrawGetClipPath(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [c-string!]
		]
		DrawGetClipRule: "DrawGetClipRule" [
			;== Returns the current polygon fill rule to be used by the clipping path
			;-- FillRule DrawGetClipRule(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [FillRule!]
		]
		DrawGetClipUnits: "DrawGetClipUnits" [
			;== Returns the interpretation of clip path units
			;-- ClipPathUnits DrawGetClipUnits(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [ClipPathUnits!]
		]
		DrawGetException: "DrawGetException" [
			;== Returns the severity reason and description of any error that occurs when using other methods in this API
			;-- char *DrawGetException(const DrawWand *wandExceptionType *severity)
			wand	[DrawingWand!] ;the drawing wand.
			severity	[ExceptionType!] ;the severity of the error is returned here.
			return: [c-string!]
		]
		DrawGetExceptionType: "DrawGetExceptionType" [
			;== The exception type associated with the wand
			;-- ExceptionType DrawGetExceptionType(const DrawWand *wand)
			wand	[DrawingWand!] ;the magick wand.
			return: [ExceptionType!]
		]
		DrawGetFillColor: "DrawGetFillColor" [
			;== Returns the fill color used for drawing filled objects
			;-- void DrawGetFillColor(const DrawingWand *wandPixelWand *fill_color)
			wand	[DrawingWand!] ;the drawing wand.
			fill_color	[PixelWand!] ;Return the fill color.
		]
		DrawGetFillOpacity: "DrawGetFillOpacity" [
			;== Returns the opacity used when drawing using the fill color or fill texture
			;-- double DrawGetFillOpacity(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [float!]
		]
		DrawGetFillRule: "DrawGetFillRule" [
			;== Returns the fill rule used while drawing polygons
			;-- FillRule DrawGetFillRule(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [FillRule!]
		]
		DrawGetFont: "DrawGetFont" [
			;== Returns a null-terminaged string specifying the font used when annotating with text
			;-- char *DrawGetFont(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [c-string!]
		]
		DrawGetFontFamily: "DrawGetFontFamily" [
			;== Returns the font family to use when annotating with text
			;-- char *DrawGetFontFamily(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [c-string!]
		]
		DrawGetFontResolution: "DrawGetFontResolution" [
			;== Gets the image X and Y resolution
			;-- DrawBooleanType DrawGetFontResolution(const DrawingWand *wanddouble *xdouble *y)
			wand	[DrawingWand!] ;the magick wand.
			x	[pointer! [float!]] ;the x-resolution.
			y	[pointer! [float!]] ;the y-resolution.
			return: [MagickBooleanType!]
		]
		DrawGetFontSize: "DrawGetFontSize" [
			;== Returns the font pointsize used when annotating with text
			;-- double DrawGetFontSize(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [float!]
		]
		DrawGetFontStretch: "DrawGetFontStretch" [
			;== Returns the font stretch used when annotating with text
			;-- StretchType DrawGetFontStretch(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [StretchType!]
		]
		DrawGetFontStyle: "DrawGetFontStyle" [
			;== Returns the font style used when annotating with text
			;-- StyleType DrawGetFontStyle(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [StyleType!]
		]
		DrawGetFontWeight: "DrawGetFontWeight" [
			;== Returns the font weight used when annotating with text
			;-- size_t DrawGetFontWeight(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [size_t!]
		]
		DrawGetGravity: "DrawGetGravity" [
			;== Returns the text placement gravity used when annotating with text
			;-- GravityType DrawGetGravity(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [GravityType!]
		]
		DrawGetOpacity: "DrawGetOpacity" [
			;== Returns the opacity used when drawing with the fill or stroke color or texture
			;-- double DrawGetOpacity(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [float!]
		]
		DrawGetStrokeAntialias: "DrawGetStrokeAntialias" [
			;== Returns the current stroke antialias setting
			;-- MagickBooleanType DrawGetStrokeAntialias(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [MagickBooleanType!]
		]
		DrawGetStrokeColor: "DrawGetStrokeColor" [
			;== Returns the color used for stroking object outlines
			;-- void DrawGetStrokeColor(const DrawingWand *wandPixelWand *stroke_color)
			wand	[DrawingWand!] ;the drawing wand.
			stroke_color	[PixelWand!] ;Return the stroke color.
		]
		DrawGetStrokeDashArray: "DrawGetStrokeDashArray" [
			;== Returns an array representing the pattern of dashes and gaps used to stroke paths (see DrawSetStrokeDashArray)
			;-- double *DrawGetStrokeDashArray(const DrawingWand *wandsize_t *number_elements)
			wand	[DrawingWand!] ;the drawing wand.
			number_elements	[pointer! [size_t!]] ;address to place number of elements in dash array
			return: [pointer! [float!]]
		]
		DrawGetStrokeDashOffset: "DrawGetStrokeDashOffset" [
			;== Returns the offset into the dash pattern to start the dash
			;-- double DrawGetStrokeDashOffset(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [float!]
		]
		DrawGetStrokeLineCap: "DrawGetStrokeLineCap" [
			;== Returns the shape to be used at the end of open subpaths when they are stroked
			;-- LineCap DrawGetStrokeLineCap(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [LineCap!]
		]
		DrawGetStrokeLineJoin: "DrawGetStrokeLineJoin" [
			;== Returns the shape to be used at the corners of paths (or other vector shapes) when they are stroked
			;-- LineJoin DrawGetStrokeLineJoin(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [LineJoin!]
		]
		DrawGetStrokeMiterLimit: "DrawGetStrokeMiterLimit" [
			;== Returns the miter limit
			;-- size_t DrawGetStrokeMiterLimit(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [size_t!]
		]
		DrawGetStrokeOpacity: "DrawGetStrokeOpacity" [
			;== Returns the opacity of stroked object outlines
			;-- double DrawGetStrokeOpacity(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [float!]
		]
		DrawGetStrokeWidth: "DrawGetStrokeWidth" [
			;== Returns the width of the stroke used to draw object outlines
			;-- double DrawGetStrokeWidth(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [float!]
		]
		DrawGetTextAlignment: "DrawGetTextAlignment" [
			;== Returns the alignment applied when annotating with text
			;-- AlignType DrawGetTextAlignment(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [AlignType!]
		]
		DrawGetTextAntialias: "DrawGetTextAntialias" [
			;== Returns the current text antialias setting which determines whether text is antialiased
			;-- MagickBooleanType DrawGetTextAntialias(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [MagickBooleanType!]
		]
		DrawGetTextDecoration: "DrawGetTextDecoration" [
			;== Returns the decoration applied when annotating with text
			;-- DecorationType DrawGetTextDecoration(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [DecorationType!]
		]
		DrawGetTextEncoding: "DrawGetTextEncoding" [
			;== Returns a null-terminated string which specifies the code set used for text annotations
			;-- char *DrawGetTextEncoding(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [c-string!]
		]
		DrawGetTextKerning: "DrawGetTextKerning" [
			;== Gets the spacing between characters in text
			;-- double DrawGetTextKerning(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [float!]
		]
		DrawGetTextInterlineSpacing: "DrawGetTextInterlineSpacing" [
			;== Gets the spacing between lines in text
			;-- double DrawGetTextInterlineSpacing(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [float!]
		]
		DrawGetTextInterwordSpacing: "DrawGetTextInterwordSpacing" [
			;== Gets the spacing between words in text
			;-- double DrawGetTextInterwordSpacing(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [float!]
		]
		DrawGetVectorGraphics: "DrawGetVectorGraphics" [
			;== Returns a null-terminated string which specifies the vector graphics generated by any graphics calls made since the wand was instantiated
			;-- char *DrawGetVectorGraphics(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [c-string!]
		]
		DrawGetTextUnderColor: "DrawGetTextUnderColor" [
			;== Returns the color of a background rectangle to place under text annotations
			;-- void DrawGetTextUnderColor(const DrawingWand *wandPixelWand *under_color)
			wand	[DrawingWand!] ;the drawing wand.
			under_color	[PixelWand!] ;Return the under color.
		]
		DrawLine: "DrawLine" [
			;== Draws a line on the image using the current stroke color stroke opacity and stroke width
			;-- void DrawLine(DrawingWand *wandconst double sxconst double syconst double exconst double ey)
			wand	[DrawingWand!] ;the drawing wand.
			sx	[float!] ;starting x ordinate
			sy	[float!] ;starting y ordinate
			ex	[float!] ;ending x ordinate
			ey	[float!] ;ending y ordinate
		]
		DrawMatte: "DrawMatte" [
			;== Paints on the image's opacity channel in order to set effected pixels to transparent
			;-- void DrawMatte(DrawingWand *wandconst double xconst double yconst PaintMethod paint_method)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;x ordinate
			y	[float!] ;y ordinate
			paint_method	[PaintMethod!] ;paint method.
		]
		DrawPathClose: "DrawPathClose" [
			;== Adds a path element to the current path which closes the current subpath by drawing a straight line from the current point to the current subpath's most recent starting point (usually the most recent moveto point)
			;-- void DrawPathClose(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
		]
		DrawPathCurveToAbsolute: "DrawPathCurveToAbsolute" [
			;== Draws a cubic Bezier curve from the current point to (xy) using (x1y1) as the control point at the beginning of the curve and (x2y2) as the control point at the end of the curve using absolute coordinates
			;-- void DrawPathCurveToAbsolute(DrawingWand *wandconst double x1const double y1const double x2const double y2const double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x1	[float!] ;x ordinate of control point for curve beginning
			y1	[float!] ;y ordinate of control point for curve beginning
			x2	[float!] ;x ordinate of control point for curve ending
			y2	[float!] ;y ordinate of control point for curve ending
			x	[float!] ;x ordinate of the end of the curve
			y	[float!] ;y ordinate of the end of the curve
		]
		DrawPathCurveToRelative: "DrawPathCurveToRelative" [
			;== Draws a cubic Bezier curve from the current point to (xy) using (x1y1) as the control point at the beginning of the curve and (x2y2) as the control point at the end of the curve using relative coordinates
			;-- void DrawPathCurveToRelative(DrawingWand *wandconst double x1const double y1const double x2const double y2const double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x1	[float!] ;x ordinate of control point for curve beginning
			y1	[float!] ;y ordinate of control point for curve beginning
			x2	[float!] ;x ordinate of control point for curve ending
			y2	[float!] ;y ordinate of control point for curve ending
			x	[float!] ;x ordinate of the end of the curve
			y	[float!] ;y ordinate of the end of the curve
		]
		DrawPathCurveToQuadraticBezierAbsolute: "DrawPathCurveToQuadraticBezierAbsolute" [
			;== Draws a quadratic Bezier curve from the current point to (xy) using (x1y1) as the control point using absolute coordinates
			;-- void DrawPathCurveToQuadraticBezierAbsolute(DrawingWand *wandconst double x1const double y1const double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x1	[float!] ;x ordinate of the control point
			y1	[float!] ;y ordinate of the control point
			x	[float!] ;x ordinate of final point
			y	[float!] ;y ordinate of final point
		]
		DrawPathCurveToQuadraticBezierRelative: "DrawPathCurveToQuadraticBezierRelative" [
			;== Draws a quadratic Bezier curve from the current point to (xy) using (x1y1) as the control point using relative coordinates
			;-- void DrawPathCurveToQuadraticBezierRelative(DrawingWand *wandconst double x1const double y1const double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x1	[float!] ;x ordinate of the control point
			y1	[float!] ;y ordinate of the control point
			x	[float!] ;x ordinate of final point
			y	[float!] ;y ordinate of final point
		]
		DrawPathCurveToQuadraticBezierSmoothAbsolute: "DrawPathCurveToQuadraticBezierSmoothAbsolute" [
			;== Draws a quadratic Bezier curve (using absolute coordinates) from the current point to (xy)
			;-- void DrawPathCurveToQuadraticBezierSmoothAbsolute(DrawingWand *wandconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;x ordinate of final point
			y	[float!] ;y ordinate of final point
		]
		DrawPathCurveToQuadraticBezierSmoothRelative: "DrawPathCurveToQuadraticBezierSmoothRelative" [
			;== Draws a quadratic Bezier curve (using relative coordinates) from the current point to (xy)
			;-- void DrawPathCurveToQuadraticBezierSmoothRelative(DrawingWand *wandconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;x ordinate of final point
			y	[float!] ;y ordinate of final point
		]
		DrawPathCurveToSmoothAbsolute: "DrawPathCurveToSmoothAbsolute" [
			;== Draws a cubic Bezier curve from the current point to (xy) using absolute coordinates
			;-- void DrawPathCurveToSmoothAbsolute(DrawingWand *wandconst double x2const double y2const double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x2	[float!] ;x ordinate of second control point
			y2	[float!] ;y ordinate of second control point
			x	[float!] ;x ordinate of termination point
			y	[float!] ;y ordinate of termination point
		]
		DrawPathCurveToSmoothRelative: "DrawPathCurveToSmoothRelative" [
			;== Draws a cubic Bezier curve from the current point to (xy) using relative coordinates
			;-- void DrawPathCurveToSmoothRelative(DrawingWand *wandconst double x2const double y2const double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x2	[float!] ;x ordinate of second control point
			y2	[float!] ;y ordinate of second control point
			x	[float!] ;x ordinate of termination point
			y	[float!] ;y ordinate of termination point
		]
		DrawPathEllipticArcAbsolute: "DrawPathEllipticArcAbsolute" [
			;== Draws an elliptical arc from the current point to (x y) using absolute coordinates
			;-- void DrawPathEllipticArcAbsolute(DrawingWand *wandconst double rxconst double ryconst double x_axis_rotationconst MagickBooleanType large_arc_flagconst MagickBooleanType sweep_flagconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			rx	[float!] ;x radius
			ry	[float!] ;y radius
			x_axis_rotation	[float!] ;indicates how the ellipse as a whole is rotated relative to the current coordinate system
			large_arc_flag	[MagickBooleanType!] ;If non-zero (true) then draw the larger of the available arcs
			sweep_flag	[MagickBooleanType!] ;If non-zero (true) then draw the arc matching a clock-wise rotation
			x	[float!]
			y	[float!]
		]
		DrawPathEllipticArcRelative: "DrawPathEllipticArcRelative" [
			;== Draws an elliptical arc from the current point to (x y) using relative coordinates
			;-- void DrawPathEllipticArcRelative(DrawingWand *wandconst double rxconst double ryconst double x_axis_rotationconst MagickBooleanType large_arc_flagconst MagickBooleanType sweep_flagconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			rx	[float!] ;x radius
			ry	[float!] ;y radius
			x_axis_rotation	[float!] ;indicates how the ellipse as a whole is rotated relative to the current coordinate system
			large_arc_flag	[MagickBooleanType!] ;If non-zero (true) then draw the larger of the available arcs
			sweep_flag	[MagickBooleanType!] ;If non-zero (true) then draw the arc matching a clock-wise rotation
			x	[float!]
			y	[float!]
		]
		DrawPathFinish: "DrawPathFinish" [
			;== Terminates the current path
			;-- void DrawPathFinish(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
		]
		DrawPathLineToAbsolute: "DrawPathLineToAbsolute" [
			;== Draws a line path from the current point to the given coordinate using absolute coordinates
			;-- void DrawPathLineToAbsolute(DrawingWand *wandconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;target x ordinate
			y	[float!] ;target y ordinate
		]
		DrawPathLineToRelative: "DrawPathLineToRelative" [
			;== Draws a line path from the current point to the given coordinate using relative coordinates
			;-- void DrawPathLineToRelative(DrawingWand *wandconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;target x ordinate
			y	[float!] ;target y ordinate
		]
		DrawPathLineToHorizontalAbsolute: "DrawPathLineToHorizontalAbsolute" [
			;== Draws a horizontal line path from the current point to the target point using absolute coordinates
			;-- void DrawPathLineToHorizontalAbsolute(DrawingWand *wandconst PathMode modeconst double x)
			wand	[DrawingWand!] ;the drawing wand.
			mode	[PathMode!]
			x	[float!] ;target x ordinate
		]
		DrawPathLineToHorizontalRelative: "DrawPathLineToHorizontalRelative" [
			;== Draws a horizontal line path from the current point to the target point using relative coordinates
			;-- void DrawPathLineToHorizontalRelative(DrawingWand *wandconst double x)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;target x ordinate
		]
		DrawPathLineToVerticalAbsolute: "DrawPathLineToVerticalAbsolute" [
			;== Draws a vertical line path from the current point to the target point using absolute coordinates
			;-- void DrawPathLineToVerticalAbsolute(DrawingWand *wandconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			y	[float!] ;target y ordinate
		]
		DrawPathLineToVerticalRelative: "DrawPathLineToVerticalRelative" [
			;== Draws a vertical line path from the current point to the target point using relative coordinates
			;-- void DrawPathLineToVerticalRelative(DrawingWand *wandconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			y	[float!] ;target y ordinate
		]
		DrawPathMoveToAbsolute: "DrawPathMoveToAbsolute" [
			;== Starts a new sub-path at the given coordinate using absolute coordinates
			;-- void DrawPathMoveToAbsolute(DrawingWand *wandconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;target x ordinate
			y	[float!] ;target y ordinate
		]
		DrawPathMoveToRelative: "DrawPathMoveToRelative" [
			;== Starts a new sub-path at the given coordinate using relative coordinates
			;-- void DrawPathMoveToRelative(DrawingWand *wandconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;target x ordinate
			y	[float!] ;target y ordinate
		]
		DrawPathStart: "DrawPathStart" [
			;== Declares the start of a path drawing list which is terminated by a matching DrawPathFinish() command
			;-- void DrawPathStart(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
		]
		DrawPoint: "DrawPoint" [
			;== Draws a point using the current fill color
			;-- void DrawPoint(DrawingWand *wandconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;target x coordinate
			y	[float!] ;target y coordinate
		]
		DrawPolygon: "DrawPolygon" [
			;== Draws a polygon using the current stroke stroke width and fill color or texture using the specified array of coordinates
			;-- void DrawPolygon(DrawingWand *wandconst size_t number_coordinatesconst PointInfo *coordinates)
			wand	[DrawingWand!] ;the drawing wand.
			number_coordinates	[size_t!] ;number of coordinates
			coordinates	[PointInfo!] ;coordinate array
		]
		DrawPolyline: "DrawPolyline" [
			;== Draws a polyline using the current stroke stroke width and fill color or texture using the specified array of coordinates
			;-- void DrawPolyline(DrawingWand *wandconst size_t number_coordinatesconst PointInfo *coordinates)
			wand	[DrawingWand!] ;the drawing wand.
			number_coordinates	[size_t!] ;number of coordinates
			coordinates	[PointInfo!] ;coordinate array
		]
		DrawPopClipPath: "DrawPopClipPath" [
			;== Terminates a clip path definition
			;-- void DrawPopClipPath(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
		]
		DrawPopDefs: "DrawPopDefs" [
			;== Terminates a definition list
			;-- void DrawPopDefs(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
		]
		DrawPopPattern: "DrawPopPattern" [
			;== Terminates a pattern definition
			;-- MagickBooleanType DrawPopPattern(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [MagickBooleanType!]
		]
		DrawPushClipPath: "DrawPushClipPath" [
			;== Starts a clip path definition which is comprized of any number of drawing commands and terminated by a DrawPopClipPath() command
			;-- void DrawPushClipPath(DrawingWand *wandconst char *clip_mask_id)
			wand	[DrawingWand!] ;the drawing wand.
			clip_mask_id	[c-string!] ;string identifier to associate with the clip path for later use.
		]
		DrawPushDefs: "DrawPushDefs" [
			;== Indicates that commands up to a terminating DrawPopDefs() command create named elements (e
			;-- void DrawPushDefs(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
		]
		DrawPushPattern: "DrawPushPattern" [
			;== Indicates that subsequent commands up to a DrawPopPattern() command comprise the definition of a named pattern
			;-- MagickBooleanType DrawPushPattern(DrawingWand *wandconst char *pattern_idconst double xconst double yconst double widthconst double height)
			wand	[DrawingWand!] ;the drawing wand.
			pattern_id	[c-string!] ;pattern identification for later reference
			x	[float!] ;x ordinate of top left corner
			y	[float!] ;y ordinate of top left corner
			width	[float!] ;width of pattern space
			height	[float!] ;height of pattern space
			return: [MagickBooleanType!]
		]
		DrawRectangle: "DrawRectangle" [
			;== Draws a rectangle given two coordinates and using the current stroke stroke width and fill settings
			;-- void DrawRectangle(DrawingWand *wandconst double x1const double y1const double x2const double y2)
			wand	[DrawingWand!]
			x1	[float!] ;x ordinate of first coordinate
			y1	[float!] ;y ordinate of first coordinate
			x2	[float!] ;x ordinate of second coordinate
			y2	[float!] ;y ordinate of second coordinate
		]
		DrawResetVectorGraphics: "DrawResetVectorGraphics" [
			;== Resets the vector graphics associated with the specified wand
			;-- void DrawResetVectorGraphics(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
		]
		DrawRotate: "DrawRotate" [
			;== Applies the specified rotation to the current coordinate space
			;-- void DrawRotate(DrawingWand *wandconst double degrees)
			wand	[DrawingWand!] ;the drawing wand.
			degrees	[float!] ;degrees of rotation
		]
		DrawRoundRectangle: "DrawRoundRectangle" [
			;== Draws a rounted rectangle given two coordinates x & y corner radiuses and using the current stroke stroke width and fill settings
			;-- void DrawRoundRectangle(DrawingWand *wanddouble x1double y1double x2double y2double rxdouble ry)
			wand	[DrawingWand!] ;the drawing wand.
			x1	[float!] ;x ordinate of first coordinate
			y1	[float!] ;y ordinate of first coordinate
			x2	[float!] ;x ordinate of second coordinate
			y2	[float!] ;y ordinate of second coordinate
			rx	[float!] ;radius of corner in horizontal direction
			ry	[float!] ;radius of corner in vertical direction
		]
		DrawScale: "DrawScale" [
			;== Adjusts the scaling factor to apply in the horizontal and vertical directions to the current coordinate space
			;-- void DrawScale(DrawingWand *wandconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;horizontal scale factor
			y	[float!] ;vertical scale factor
		]
		DrawSetBorderColor: "DrawSetBorderColor" [
			;== Sets the border color to be used for drawing bordered objects
			;-- void DrawSetBorderColor(DrawingWand *wandconst PixelWand *border_wand)
			wand	[DrawingWand!] ;the drawing wand.
			border_wand	[PixelWand!] ;border wand.
		]
		DrawSetClipPath: "DrawSetClipPath" [
			;== Associates a named clipping path with the image
			;-- MagickBooleanType DrawSetClipPath(DrawingWand *wandconst char *clip_mask)
			wand	[DrawingWand!] ;the drawing wand.
			clip_mask	[c-string!] ;name of clipping path to associate with image
			return: [MagickBooleanType!]
		]
		DrawSetClipRule: "DrawSetClipRule" [
			;== Set the polygon fill rule to be used by the clipping path
			;-- void DrawSetClipRule(DrawingWand *wandconst FillRule fill_rule)
			wand	[DrawingWand!] ;the drawing wand.
			fill_rule	[FillRule!] ;fill rule (EvenOddRule or NonZeroRule)
		]
		DrawSetClipUnits: "DrawSetClipUnits" [
			;== Sets the interpretation of clip path units
			;-- void DrawSetClipUnits(DrawingWand *wandconst ClipPathUnits clip_units)
			wand	[DrawingWand!] ;the drawing wand.
			clip_units	[ClipPathUnits!] ;units to use (UserSpace UserSpaceOnUse or ObjectBoundingBox)
		]
		DrawSetFillColor: "DrawSetFillColor" [
			;== Sets the fill color to be used for drawing filled objects
			;-- void DrawSetFillColor(DrawingWand *wandconst PixelWand *fill_wand)
			wand	[DrawingWand!] ;the drawing wand.
			fill_wand	[PixelWand!] ;fill wand.
		]
		DrawSetFillOpacity: "DrawSetFillOpacity" [
			;== Sets the opacity to use when drawing using the fill color or fill texture
			;-- void DrawSetFillOpacity(DrawingWand *wandconst double fill_opacity)
			wand	[DrawingWand!] ;the drawing wand.
			fill_opacity	[float!] ;fill opacity
		]
		DrawSetFontResolution: "DrawSetFontResolution" [
			;== Sets the image resolution
			;-- DrawBooleanType DrawSetFontResolution(DrawingWand *wandconst double x_resolutionconst double y_resolution)
			wand	[DrawingWand!] ;the magick wand.
			x_resolution	[float!] ;the image x resolution.
			y_resolution	[float!] ;the image y resolution.
			return: [MagickBooleanType!]
		]
		DrawSetOpacity: "DrawSetOpacity" [
			;== Sets the opacity to use when drawing using the fill or stroke color or texture
			;-- void DrawSetOpacity(DrawingWand *wandconst double opacity)
			wand	[DrawingWand!] ;the drawing wand.
			opacity	[float!] ;fill opacity
		]
		DrawSetFillPatternURL: "DrawSetFillPatternURL" [
			;== Sets the URL to use as a fill pattern for filling objects
			;-- MagickBooleanType DrawSetFillPatternURL(DrawingWand *wandconst char *fill_url)
			wand	[DrawingWand!] ;the drawing wand.
			fill_url	[c-string!] ;URL to use to obtain fill pattern.
			return: [MagickBooleanType!]
		]
		DrawSetFillRule: "DrawSetFillRule" [
			;== Sets the fill rule to use while drawing polygons
			;-- void DrawSetFillRule(DrawingWand *wandconst FillRule fill_rule)
			wand	[DrawingWand!] ;the drawing wand.
			fill_rule	[FillRule!] ;fill rule (EvenOddRule or NonZeroRule)
		]
		DrawSetFont: "DrawSetFont" [
			;== Sets the fully-sepecified font to use when annotating with text
			;-- MagickBooleanType DrawSetFont(DrawingWand *wandconst char *font_name)
			wand	[DrawingWand!] ;the drawing wand.
			font_name	[c-string!] ;font name
			return: [MagickBooleanType!]
		]
		DrawSetFontFamily: "DrawSetFontFamily" [
			;== Sets the font family to use when annotating with text
			;-- MagickBooleanType DrawSetFontFamily(DrawingWand *wandconst char *font_family)
			wand	[DrawingWand!] ;the drawing wand.
			font_family	[c-string!] ;font family
			return: [MagickBooleanType!]
		]
		DrawSetFontSize: "DrawSetFontSize" [
			;== Sets the font pointsize to use when annotating with text
			;-- void DrawSetFontSize(DrawingWand *wandconst double pointsize)
			wand	[DrawingWand!] ;the drawing wand.
			pointsize	[float!] ;text pointsize
		]
		DrawSetFontStretch: "DrawSetFontStretch" [
			;== Sets the font stretch to use when annotating with text
			;-- void DrawSetFontStretch(DrawingWand *wandconst StretchType font_stretch)
			wand	[DrawingWand!] ;the drawing wand.
			font_stretch	[StretchType!] ;font stretch (NormalStretch UltraCondensedStretch CondensedStretch SemiCondensedStretch SemiExpandedStretch ExpandedStretch ExtraExpandedStretch UltraExpandedStretch AnyStretch)
		]
		DrawSetFontStyle: "DrawSetFontStyle" [
			;== Sets the font style to use when annotating with text
			;-- void DrawSetFontStyle(DrawingWand *wandconst StyleType style)
			wand	[DrawingWand!] ;the drawing wand.
			style	[StyleType!] ;font style (NormalStyle ItalicStyle ObliqueStyle AnyStyle)
		]
		DrawSetFontWeight: "DrawSetFontWeight" [
			;== Sets the font weight to use when annotating with text
			;-- void DrawSetFontWeight(DrawingWand *wandconst size_t font_weight)
			wand	[DrawingWand!] ;the drawing wand.
			font_weight	[size_t!] ;font weight (valid range 100-900)
		]
		DrawSetGravity: "DrawSetGravity" [
			;== Sets the text placement gravity to use when annotating with text
			;-- void DrawSetGravity(DrawingWand *wandconst GravityType gravity)
			wand	[DrawingWand!] ;the drawing wand.
			gravity	[GravityType!] ;positioning gravity (NorthWestGravity NorthGravity NorthEastGravity WestGravity CenterGravity EastGravity SouthWestGravity SouthGravity SouthEastGravity)
		]
		DrawSetStrokeColor: "DrawSetStrokeColor" [
			;== Sets the color used for stroking object outlines
			;-- void DrawSetStrokeColor(DrawingWand *wandconst PixelWand *stroke_wand)
			wand	[DrawingWand!] ;the drawing wand.
			stroke_wand	[PixelWand!] ;stroke wand.
		]
		DrawSetStrokePatternURL: "DrawSetStrokePatternURL" [
			;== Sets the pattern used for stroking object outlines
			;-- MagickBooleanType DrawSetStrokePatternURL(DrawingWand *wandconst char *stroke_url)
			wand	[DrawingWand!] ;the drawing wand.
			stroke_url	[c-string!] ;URL specifying pattern ID (e.g. "#pattern_id")
			return: [MagickBooleanType!]
		]
		DrawSetStrokeAntialias: "DrawSetStrokeAntialias" [
			;== Controls whether stroked outlines are antialiased
			;-- void DrawSetStrokeAntialias(DrawingWand *wandconst MagickBooleanType stroke_antialias)
			wand	[DrawingWand!] ;the drawing wand.
			stroke_antialias	[MagickBooleanType!] ;set to false (zero) to disable antialiasing
		]
		DrawSetStrokeDashArray: "DrawSetStrokeDashArray" [
			;== Specifies the pattern of dashes and gaps used to stroke paths
			;-- MagickBooleanType DrawSetStrokeDashArray(DrawingWand *wandconst size_t number_elementsconst double *dash_array)
			wand	[DrawingWand!] ;the drawing wand.
			number_elements	[size_t!] ;number of elements in dash array
			dash_array	[pointer! [float!]] ;dash array values
			return: [MagickBooleanType!]
		]
		DrawSetStrokeDashOffset: "DrawSetStrokeDashOffset" [
			;== Specifies the offset into the dash pattern to start the dash
			;-- void DrawSetStrokeDashOffset(DrawingWand *wandconst double dash_offset)
			wand	[DrawingWand!] ;the drawing wand.
			dash_offset	[float!] ;dash offset
		]
		DrawSetStrokeLineCap: "DrawSetStrokeLineCap" [
			;== Specifies the shape to be used at the end of open subpaths when they are stroked
			;-- void DrawSetStrokeLineCap(DrawingWand *wandconst LineCap linecap)
			wand	[DrawingWand!] ;the drawing wand.
			linecap	[LineCap!] ;linecap style
		]
		DrawSetStrokeLineJoin: "DrawSetStrokeLineJoin" [
			;== Specifies the shape to be used at the corners of paths (or other vector shapes) when they are stroked
			;-- void DrawSetStrokeLineJoin(DrawingWand *wandconst LineJoin linejoin)
			wand	[DrawingWand!] ;the drawing wand.
			linejoin	[LineJoin!] ;line join style
		]
		DrawSetStrokeMiterLimit: "DrawSetStrokeMiterLimit" [
			;== Specifies the miter limit
			;-- void DrawSetStrokeMiterLimit(DrawingWand *wandconst size_t miterlimit)
			wand	[DrawingWand!] ;the drawing wand.
			miterlimit	[size_t!] ;miter limit
		]
		DrawSetStrokeOpacity: "DrawSetStrokeOpacity" [
			;== Specifies the opacity of stroked object outlines
			;-- void DrawSetStrokeOpacity(DrawingWand *wandconst double stroke_opacity)
			wand	[DrawingWand!] ;the drawing wand.
			stroke_opacity	[float!] ;stroke opacity.  The value 1.0 is opaque.
		]
		DrawSetStrokeWidth: "DrawSetStrokeWidth" [
			;== Sets the width of the stroke used to draw object outlines
			;-- void DrawSetStrokeWidth(DrawingWand *wandconst double stroke_width)
			wand	[DrawingWand!] ;the drawing wand.
			stroke_width	[float!] ;stroke width
		]
		DrawSetTextAlignment: "DrawSetTextAlignment" [
			;== Specifies a text alignment to be applied when annotating with text
			;-- void DrawSetTextAlignment(DrawingWand *wandconst AlignType alignment)
			wand	[DrawingWand!] ;the drawing wand.
			alignment	[AlignType!] ;text alignment.  One of UndefinedAlign LeftAlign CenterAlign or RightAlign.
		]
		DrawSetTextAntialias: "DrawSetTextAntialias" [
			;== Controls whether text is antialiased
			;-- void DrawSetTextAntialias(DrawingWand *wandconst MagickBooleanType text_antialias)
			wand	[DrawingWand!] ;the drawing wand.
			text_antialias	[MagickBooleanType!] ;antialias boolean. Set to false (0) to disable antialiasing.
		]
		DrawSetTextDecoration: "DrawSetTextDecoration" [
			;== Specifies a decoration to be applied when annotating with text
			;-- void DrawSetTextDecoration(DrawingWand *wandconst DecorationType decoration)
			wand	[DrawingWand!] ;the drawing wand.
			decoration	[DecorationType!] ;text decoration.  One of NoDecoration UnderlineDecoration OverlineDecoration or LineThroughDecoration
		]
		DrawSetTextEncoding: "DrawSetTextEncoding" [
			;== Specifies the code set to use for text annotations
			;-- void DrawSetTextEncoding(DrawingWand *wandconst char *encoding)
			wand	[DrawingWand!] ;the drawing wand.
			encoding	[c-string!] ;character string specifying text encoding
		]
		DrawSetTextKerning: "DrawSetTextKerning" [
			;== Sets the spacing between characters in text
			;-- void DrawSetTextKerning(DrawingWand *wandconst double kerning)
			wand	[DrawingWand!] ;the drawing wand.
			kerning	[float!] ;text kerning
		]
		DrawSetTextInterlineSpacing: "DrawSetTextInterlineSpacing" [
			;== Sets the spacing between line in text
			;-- void DrawSetTextInterlineSpacing(DrawingWand *wandconst double interline_spacing)
			wand	[DrawingWand!] ;the drawing wand.
			interline_spacing	[float!] ;text line spacing
		]
		DrawSetTextInterwordSpacing: "DrawSetTextInterwordSpacing" [
			;== Sets the spacing between words in text
			;-- void DrawSetTextInterwordSpacing(DrawingWand *wandconst double interword_spacing)
			wand	[DrawingWand!] ;the drawing wand.
			interword_spacing	[float!] ;text word spacing
		]
		DrawSetTextUnderColor: "DrawSetTextUnderColor" [
			;== Specifies the color of a background rectangle to place under text annotations
			;-- void DrawSetTextUnderColor(DrawingWand *wandconst PixelWand *under_wand)
			wand	[DrawingWand!] ;the drawing wand.
			under_wand	[PixelWand!] ;text under wand.
		]
		DrawSetVectorGraphics: "DrawSetVectorGraphics" [
			;== Sets the vector graphics associated with the specified wand
			;-- MagickBooleanType DrawSetVectorGraphics(DrawingWand *wandconst char *xml)
			wand	[DrawingWand!] ;the drawing wand.
			xml	[c-string!] ;the drawing wand XML.
			return: [MagickBooleanType!]
		]
		DrawSkewX: "DrawSkewX" [
			;== Skews the current coordinate system in the horizontal direction
			;-- void DrawSkewX(DrawingWand *wandconst double degrees)
			wand	[DrawingWand!] ;the drawing wand.
			degrees	[float!] ;number of degrees to skew the coordinates
		]
		DrawSkewY: "DrawSkewY" [
			;== Skews the current coordinate system in the vertical direction
			;-- void DrawSkewY(DrawingWand *wandconst double degrees)
			wand	[DrawingWand!] ;the drawing wand.
			degrees	[float!] ;number of degrees to skew the coordinates
		]
		DrawTranslate: "DrawTranslate" [
			;== Applies a translation to the current coordinate system which moves the coordinate system origin to the specified coordinate
			;-- void DrawTranslate(DrawingWand *wandconst double xconst double y)
			wand	[DrawingWand!] ;the drawing wand.
			x	[float!] ;new x ordinate for coordinate system origin
			y	[float!] ;new y ordinate for coordinate system origin
		]
		DrawSetViewbox: "DrawSetViewbox" [
			;== Sets the overall canvas size to be recorded with the drawing vector data
			;-- void DrawSetViewbox(DrawingWand *wandsize_t x1size_t y1size_t x2size_t y2)
			wand	[DrawingWand!] ;the drawing wand.
			x1	[size_t!] ;left x ordinate
			y1	[size_t!] ;top y ordinate
			x2	[size_t!] ;right x ordinate
			y2	[size_t!] ;bottom y ordinate
		]
		IsDrawingWand: "IsDrawingWand" [
			;== Returns MagickTrue if the wand is verified as a drawing wand
			;-- MagickBooleanType IsDrawingWand(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [MagickBooleanType!]
		]
		NewDrawingWand: "NewDrawingWand" [
			;== Returns a drawing wand required for all other methods in the API
			;-- DrawingWand NewDrawingWand(void)
			return: [DrawingWand!]
		]
		PeekDrawingWand: "PeekDrawingWand" [
			;== Returns the current drawing wand
			;-- DrawInfo *PeekDrawingWand(const DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [pointer! [integer!]]
		]
		PopDrawingWand: "PopDrawingWand" [
			;== Destroys the current drawing wand and returns to the previously pushed drawing wand
			;-- MagickBooleanType PopDrawingWand(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [MagickBooleanType!]
		]
		PushDrawingWand: "PushDrawingWand" [
			;== Clones the current drawing wand to create a new drawing wand
			;-- MagickBooleanType PushDrawingWand(DrawingWand *wand)
			wand	[DrawingWand!] ;the drawing wand.
			return: [MagickBooleanType!]
		]
	]
]
