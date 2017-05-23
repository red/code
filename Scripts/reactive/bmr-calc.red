Red [
	Title:   "BMR (Basal Metabolic Rate) Calculator"
	Author:  "Gregg Irwin"
	File: 	 %bmr-calc.red
	Needs:	 View
	Comment: {
		An experiment in reactivity and data modeling.

		145 lines with blanks and comments removed.

		TBD: Caloric calcs based on activity level.

		References:
			https://doc.red-lang.org/reactivity.html
			https://en.wikipedia.org/wiki/Harris%E2%80%93Benedict_equation
			https://en.wikipedia.org/wiki/Basal_metabolic_rate
	}
]

;-------------------------------------------------------------------------------
; Generic functions

inch-to-cm: func [val][val * 2.54]
cm-to-inch: func [val][val / 2.54]
lb-to-kg:   func [val][val / 2.20462]
kg-to-lb:   func [val][val * 2.20462]

linear-interpolate: func [
    src-min  [number!]
    src-max  [number!]
    dest-min [number!]
    dest-max [number!]
    value    [number!]
][
    add dest-min ((value - src-min) / (src-max - src-min) * (dest-max - dest-min))
]

;-------------------------------------------------------------------------------
; Data Ranges

; This may seem a bit confusing. It looks like these are dialected code,
; but they're not. They're just data blocks. The words 'from and 'to will
; be used to look up data, but the unit designations, in this case, are
; strictly informational (and optional).

; This was my first approach.
;height-range: [from 100 cm to 250 cm]
;weight-range: [from  45 kg to 160 kg]
;weight-range: [from 45 to 160 kg]		; works the same as the one above
;age-range:    [from 5 to 125 years]
;
;map-range: func ["Map slider val to semantic range" range val][
;	to integer! linear-interpolate 0% 100% range/from range/to val
;]

; Then I decided to structure it more during a refactoring pass.
data-ranges: [
	height [from 100 to 250 cm]
	weight [from  45 to 160 kg]
	age    [from   5 to 125 years]
]

map-range: func [
	"Map slider val to semantic range"
	range [word!] "data-ranges key [height weight age]"
	val   [percent!]
	/local rng
][
	; With the extra level in the ranges data, the one-liner is a bit much.
	;  to integer! linear-interpolate 0% 100% data-ranges/:range/from data-ranges/:range/to val
	; Making it 2 lines seems worth it in this case.
	rng: data-ranges/:range
	; If we did this in multiple places, it would make sense to break
	; out the interpolation of 0-100% into a function. Not worth it now.
	to integer! linear-interpolate 0% 100% rng/from rng/to val
]

;!! The big difference in the above choice is what the calls look like.
;	In one case you use the actual reference (`height-range`) because
;	you're passing the range block itself. In the other you use a word
;	to select the range by name (`'height`). This matters because it
;	affects the calling site. Of course, you could allow either type
;	of value and look up by key if they pass a word, but that's really
;	overkill for a small app like this.
;
;		cm: map-range height-range val
;	vs
;		cm: map-range data-ranges/height val
;	vs
;		cm: map-range 'height val
;
;	The latter hides more details from the caller, because it doesn't
;	have to know anything about how ranges are defined. The second
;	approach is what you might see in a standard OOP model. One thing
;	to keep in mind, as you design, is how large your app/system is,
;	and whether it needs to be composed with other parts.

;-------------------------------------------------------------------------------
; Data Functions

; This is another unusual approach, at a glance. Normally you might
; expect these functions to convert the value to a normalized result
; (e.g. normalize height to cm). Then you would convert that to other
; unit types and format it elsewhere. That matches the Single
; Responsibility Principle, or very granular cohesion. And I do like
; simple functions. But the simpler each function is, remember, the
; more of them you need, and the more combinations there are in how
; you connect them. 
;
; This approach is more like knowledge-based programming, in that you
; provide input and get back something like symbolic results. It's
; not quite like the coupling of code and data in OOP, because you
; are just calling a function and getting back a result each time.
;
; An obvious argument against this model is that your functions are
; doing extra work, calculating results that may never be used, and
; allocating and reducing a block, rather than just returning a
; simple numeric result. Suspend judgement, if you can, until you've
; read the entire program to see how it all works together as a
; whole. You may still not like it, but Red gives you the ability
; to structure your solution however you want.

to-height: function [
	"Convert a slider value to height data"
	val [percent!]
][
	cm: map-range 'height val
	inches: to integer! cm-to-inch cm
	reduce [
		'cm cm
		'in inches
		'ft-in reduce ['ft inches / 12  'in mod inches 12]
		'formed-imperial imp: rejoin [inches / 12 {'} mod inches 12 {"}]
		'formed-metric   met: rejoin [cm 'cm]
		'formed rejoin [imp " / " met]
	]
]

to-weight: function [
	"Convert a slider value to weight data"
	val [percent!]
][
	kg: map-range 'weight val
	lb: to integer! kg-to-lb kg
	reduce [
		'kg kg
		'lb lb
		'formed-imperial imp: rejoin [lb 'lb]
		'formed-metric   met: rejoin [kg 'kg]
		'formed rejoin [imp " / " met]
	]
]

; This func could just return the age in years, since there is no
; other way we want to represent it, as with the metric/imperial
; values. We *could* set our age range in days, and calc years and
; months from that if we wanted. Something to think about.
to-age: function [
	"Convert a slider value to age data"
	val [percent!]
][
	; Not including months in this, though we could. `Map-range` truncates
	; results to integers, so there's no decimal component to get the month
	; part from without changing that. 
	yr: map-range 'age val
	;mo: round 12 * mod yr 1
	reduce [
		'yr yr
		;'yr-mo reduce ['yr round yr 'mo mo]
		'formed rejoin [yr " years"]
	]
]

;-------------------------------------------------------------------------------
; BMR Formulae

; The commented formulae are taken directly from Wikipedia. The Red code
; to implement them mimics their format for easy comparison.

; The same technique is used here as with data-ranges. The last element
; in the result is 'kcal/day, which is strictly informative, making the
; data more self-documenting.

bmr-calc-1918: func [
	"The original Harris–Benedict equations published in 1918 and 1919"
	height [block!]
	weight [block!]
	age    [block!]
][
	;Women	BMR = 655.1 + ( 9.563 × weight in kg ) + ( 1.850 × height in cm ) – ( 4.676 × age in years )
	;Men	BMR =  66.5 + ( 13.75 × weight in kg ) + ( 5.003 × height in cm ) – ( 6.755 × age in years )
	reduce [
		'female to integer! (655.1 + (9.563 * weight/kg) + (1.850 * height/cm) - (4.676 * age/yr)) 'kcal/day
		'male   to integer! ( 66.5 + (13.75 * weight/kg) + (5.003 * height/cm) - (6.755 * age/yr)) 'kcal/day
	]
]

bmr-calc-1984: func [
	"The Harris–Benedict equations revised by Roza and Shizgal in 1984"
	height [block!]
	weight [block!]
	age    [block!]
][
	;Women	BMR = 447.593 + (9.247 × weight in kg) + (3.098 × height in cm) - (4.330 × age in years)
	;Men	BMR = 88.362 + (13.397 × weight in kg) + (4.799 × height in cm) - (5.677 × age in years)
	reduce [
		'female to integer! (447.593 + ( 9.247 * weight/kg) + (3.098 * height/cm) - (4.330 * age/yr)) 'kcal/day
		'male   to integer! ( 88.362 + (13.397 * weight/kg) + (4.799 * height/cm) - (5.677 * age/yr)) 'kcal/day
	]
]

bmr-calc-1990: func [
	"The Harris–Benedict equations revised by Mifflin and St Jeor in 1990"
	height [block!]
	weight [block!]
	age    [block!]
	/local base-bmr
][
	;Women	BMR = (10 × weight in kg) + (6,25 × height in cm) - (5 × age in years) - 161
	;Men	BMR = (10 × weight in kg) + (6,25 × height in cm) - (5 × age in years) + 5
	; The formula layout made it easy to see that there's a common
	; sub-expression in each.
	base-bmr: to integer! (10 * weight/kg) + (6.25 * height/cm) - (5 * age/yr)
	reduce [
		'female (base-bmr - 161) 'kcal/day
		'male   (base-bmr + 5)   'kcal/day
	]
]

;-------------------------------------------------------------------------------
; Data Structures

; This is where things get more interesting. A little explanation on
; the background. I started the app so I could get more practical
; experience with Red's reactivity system. As is often the case with
; new things, I stumbled a bit. I knew I wanted a global data structure
; that would reactively update from the UI and, in turn, update other
; parts of the UI. e.g., you move a slider, that updates a value in the
; data, which in turn shows up as calculated output data in the UI. 
;
; The problem I hit was that defining the reactive relations statically
; is *really* easy, but doesn't work for forward references. That is, if
; you have a field in an object that uses `is` to react to a slider in 
; the UI, the UI has to be defined first. If you then have an output
; label that refers to the data in its `react` block, the data hasn't 
; been defined yet. 
;
; Red lets you define reactive relations dynamically, but I wanted to 
; see if I could do it without that. Well, first I headed down that 
; path, but it seemed overly complex for this. Maybe someone will look
; at my approach here and show how a dynamic reactivity version is 
; better.
;
; To make this work, there is just one little non-reactive cheat in
; place, and one thing I might be able to eliminate with deep reactors
; later if I want. The cheat is that one reaction forces an update to
; a data value to trigger other reactions. This way the data doesn't 
; have to refer to anything in the UI. Wait! That makes it a "feature".
;
; This is where reactions are sourced. When any of the height/weight/age
; values change, the bmr-* reactions trigger. In turn, other reactors
; can "watch" for those changes. 
data: make reactor! [
	; Prime the fields from the middle of our value ranges. Empirical
	; choices for the defaults. They are magic numbers, duped in the 
	; UI code. For a larger app I would probably set up a defaults
	; structure for both to reference.
	height: to-height 50%
	weight: to-weight 30%
	age:    to-age    38%
	; Calculated results
	; Originally I had these in an external reactor!, and had a reactive
	; formula here (an `is` block) that updated it. Then I made the 
	; results reactor use `is` blocks so this object didn't know anything
	; about it. Finally, I just included these fields here, so it's self-
	; contained and the code is slightly simpler.
	bmr-1918: is [bmr-calc-1918 height weight age]
	bmr-1984: is [bmr-calc-1984 height weight age]
	bmr-1990: is [bmr-calc-1990 height weight age]
]


;-------------------------------------------------------------------------------
; UI

; You'll note that there is no option to select a target sex. I had one
; initially, started writing the funcs to calc BMR based on that, and
; included it in the data strucuture. Then I decided the sliders made
; the app more exploratory in nature and having all the data calculated
; all the time led to displaying it. All the BMR calc apps I found have
; a field for sex, and fields to enter values directly. We could do that
; as well, but there is value in different approaches.

view/no-wait [
	style label: text 50
	style out-lbl: text 75 right
	
	;!! Assigning to the `data` fields in the react blocks triggers calcs.
	;	Here you can see how the structured values in data are used to 
	;	good effect. Rather than the UI forming and joining values, 
	;	converting units, etc., it just asks for the formed value. Sort of
	;	how some OO systems have a standard `to-string` method for objects.
	label "Height" sld-ht: slider 50%  out-lbl react [
		data/height: to-height sld-ht/data
		face/text: data/height/formed
	] return
	label "Weight" sld-wt: slider 30%  out-lbl react [
		data/weight: to-weight sld-wt/data
		face/text: data/weight/formed
	] return
	label "Age" sld-age: slider 38%  out-lbl react [
		data/age: to-age sld-age/data
		face/text: data/age/formed
	] return
	pad 0x15

; Make the output look something like this:
;				1918	1984	1990
;	Female								kcal/day
;	Male								kcal/day
	style cell: text 50 center
	style hdr:  cell bold

	; This is where there's a bit of a trick. Red's reactive system is
	; new, and may address this in the future, or someone may have a better
	; solution with a different architecture. The trick is having the base
	; data/bmr-19* refs in each react block. This is needed because the
	; reference to the nested value (e.g. data/bmr-1918/female) does *not*
	; work by itself. That is, we're telling Red to monitor a field *within*
	; a reactive formula source and which doesn't work (currently).
	; I'm sure we'll see more capabilities built on top of the base reactive
	; system in the future. For example, the ability to define styles that
	; contain reaction blocks, and a way to reference dynamic sources. In
	; the meantime, if you have a lot of faces, you can also generate your
	; View layout specs dynamically, which is often a good solution. Let the
	; data drive your GUI.
	label bold "Formula" hdr "1918" hdr "1984" hdr "1990" return
	label "Female"
		cell react [data/bmr-1918  face/text: form data/bmr-1918/female]
		cell react [data/bmr-1984  face/text: form data/bmr-1984/female]
		cell react [data/bmr-1990  face/text: form data/bmr-1990/female]
		label "kcal/day"
		return
	label "Male"
		cell react [data/bmr-1918  face/text: form data/bmr-1918/male]
		cell react [data/bmr-1984  face/text: form data/bmr-1984/male]
		cell react [data/bmr-1990  face/text: form data/bmr-1990/male]
		label "kcal/day"
		return

]

; Start the UI event loop
do-events

;-------------------------------------------------------------------------------
; Conclusion

; Red's reactive system is going to be a lot of fun to experiment with. I'm
; anxious to try new things with it, like the following-balls demo. It's 
; impressive how small the implementation is, for the power it gives us.
; See: https://github.com/red/red/blob/master/environment/reactivity.red
;
; It gives us some new tools for thinking, though the concepts have been 
; around for a long time.
; 
; Happy Reducing!
