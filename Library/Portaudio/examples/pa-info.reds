Red/System [
	Title:   "Red/System Portaudio info"
	Author:  "Oldes"
	File: 	 %pa-info.reds
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https:;//github.com/red/red/blob/master/BSD-3-License.txt"
]

#include %../portaudio.reds

print-line ["version: " Pa_GetVersion " => " Pa_GetVersionText]
paInfo: Pa_GetVersionInfo
print-line [paInfo/versionMajor #"." paInfo/versionMinor #"." paInfo/versionSubMinor]

res: Pa_Initialize

if paNoError <> res [
	print-line ["PA initialization failed: " res " - " Pa_GetErrorText res]
	quit -1
]

apiCount: Pa_GetHostApiCount
print-line ["Pa_GetHostApiCount: " apiCount " default: " Pa_GetDefaultHostApi]

apiInfo: declare PaHostApiInfo!
deviceInfo: declare PaDeviceInfo!

n: 0 m: 0 i: 0 num: 0
while [n < apiCount][
	apiInfo: Pa_GetHostApiInfo n
	print-line ["### HostApiInfo [" n #"]"]
	print-line ["^-structVersion: " apiInfo/structVersion]
	print-line ["^-type: " apiInfo/type]
	print-line ["^-name: " apiInfo/name]
	num: apiInfo/deviceCount
	print-line ["^-deviceCount: " num]
	print-line ["^-defaultInputDevice: " apiInfo/defaultInputDevice]
	print-line ["^-defaultOutputDevice: " apiInfo/defaultOutputDevice]

	;list device infos:
	m: 0
	while [m < num][
		i: Pa_HostApiDeviceIndexToDeviceIndex n m
		deviceInfo: Pa_GetDeviceInfo i 

		print-line ["^-### DeviceInfo [" m " / " i #"]"]
		print-line ["^-^-name: " deviceInfo/name]
		print-line ["^-^-maxInputChannels: " deviceInfo/maxInputChannels]
		print-line ["^-^-maxOutputChannels: " deviceInfo/maxOutputChannels]
		print-line ["^-^-defaultLowInputLatency: " deviceInfo/defaultLowInputLatency]
		print-line ["^-^-defaultLowOutputLatency: " deviceInfo/defaultLowOutputLatency]
		print-line ["^-^-defaultHighInputLatency: " deviceInfo/defaultHighInputLatency]
		print-line ["^-^-defaultHighOutputLatency: " deviceInfo/defaultHighOutputLatency]
		print-line ["^-^-defaultSampleRate: " deviceInfo/defaultSampleRate]
		m: m + 1
		print lf
	]
	
	n: n + 1
	print lf
]

print-line ["DirectSound API index: " Pa_HostApiTypeIdToHostApiIndex paDirectSound lf]

deviceCount: Pa_GetDeviceCount
print-line ["Pa_GetDeviceCount: " deviceCount 
	" defaultIn: " Pa_GetDefaultInputDevice
	" defaultOut: " Pa_GetDefaultOutputDevice
]

Pa_Terminate