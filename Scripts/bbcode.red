Red [
	Title: "BBcode"
	Purpose: {Basic BBCode implementation. For more info about BBCode check http://en.wikipedia.org/wiki/BBCode}
	Date: 20-Sep-2017/12:21:59+02:00
	Name: 'bbcode
	Version: 0.3.0
	History: [
		0.1.0  5-Jan-2009 "initial Rebol version"
		0.2.0 19-Feb-2012 "review"
		0.2.1 22-Aug-2012 "added [hr] and [anchor]"
		0.3.0 20-Sep-2017 "added [style] and ported to Red"
	]
	File:    %bbcode.red
	Exports: [bbcode]
	Author:  "David 'Oldes' Oliva"
	Tabs: 4
	Usage: [
		test-cases: [
{text [b]bold[/b] abc}                   {<p>text <b>bold</b> abc</p>}
{text [b]bold [i]italic[/b]}             {<p>text <b>bold <i>italic</i></b></p>}
{[s]strikethrough text[/s]}              {<p><s>strikethrough text</s></p>}
{[url]http://example.org[/url]}          {<p><a href="http://example.org">http://example.org</a></p>}
{[url=http://example]Test[/url]}         {<p><a href="http://example">Test</a></p>}
{[url=http://example][b]Test[/url]}      {<p><a href="http://example"><b>Test</b></a></p>}
{[url='/bla/ bla.jpg' rel=images]}       {<p><a href="/bla/ bla.jpg" rel="images"></a></p>}
{[b][ul][li]Jenny[/li][li]Alex[/li][li]Beth[/li][/ul][/b]}
								         {<p><b><ul><li>Jenny</li><li>Alex</li><li>Beth</li></ul></b></p>}
{[ul][li]bla[li]bla}                     {<ul><li>bla</li><li>bla</li></ul>}
{text[ul][li]bla[li]bla}                 {<p>text</p><ul><li>bla</li><li>bla</li></ul>}
{[ul][li][b]bla[li]bla}                  {<ul><li><b>bla</b></li><li>bla</li></ul>}
{[ul][li]bla[li][ol][li]bla[/ol]}        {<ul><li>bla</li><li><ol><li>bla</li></ol></li></ul>}
{[ul][*]bla^/^/bla}                      {<ul><li><p>bla</p>^/^/<p>bla</p></li></ul>}
{[ul][*]bla[*]bla}                       {<ul><li>bla</li><li>bla</li></ul>}
{[code]xx[b]yy[/b]zz[/code]}             {<p><code>xx[b]yy[/b]zz</code></p>}
{[list][*]aaa[*]bbb[/list]}              {<ul><li>aaa</li><li>bbb</li></ul>}
{[list=a][*]aaa[*]bbb[/list]}            {<ol style="list-style-type: lower-alpha;"><li>aaa</li><li>bbb</li></ol>}
{[list=A][*]aaa[*]bbb[/list]}            {<ol style="list-style-type: upper-alpha;"><li>aaa</li><li>bbb</li></ol>}
{[/b]}                                   {<p></p>}
{[quote]blabla}                          {<p><fieldset><blockquote>blabla</blockquote></fieldset></p>}
{[quote=Carl]blabla}                     {<p><fieldset><legend>Carl</legend><blockquote>blabla</blockquote></fieldset></p>}
{[img]http://www.google.com/intl/en_ALL/images/logo.gif[/img]}
								         {<p><img src="http://www.google.com/intl/en_ALL/images/logo.gif" alt=""></p>}
{[url=http://http://www.google.com/][img]http://www.google.com/intl/en_ALL/images/logo.gif[/url][/img]}
								         {<p><a href="http://http://www.google.com/"><img src="http://www.google.com/intl/en_ALL/images/logo.gif" alt=""></a></p>}
{[img]1.gif [img]2.gif}                  {<p><img src="1.gif" alt=""> <img src="2.gif" alt=""></p>}
{text [size=tiny]tiny}                   {<p>text <span style="font-size: xx-small;">tiny</span></p>}
{[h1]header[/h1]}                        {<h1>header</h1>}
{[color]ee[/color][color=#F00]red[color=#00FF00]green}
								         {<p>ee<span style="color: #F00;">red<span style="color: #00FF00;">green</span></span></p>}
{<a>}                                    {<p>&lt;a></p>}
{multi^/line}                            {<p>multi^/line</p>}
{invalid [size]size[/size]}              {<p>invalid <span>size</span></p>}
{[align=right]right}                     {<p><div style="text-align: right;">right</div></p>}
{[email]x@x.cz[/email] [email=x@x.cz]email [b]me[/email]}
								         {<p><a href="mailto:x@x.cz">x@x.cz</a> <a href="mailto:x@x.cz">email <b>me</b></a></p>}

{[u]underlined[/u]}                      {<p><u>underlined</u></p>}
{[h3=underline]Portréty [b]X}            {<h3 class="underline">Portréty <b>X</b></h3>}
{[img=680x300]pozvanka.jpg}              {<p><img width=680 height=300 src="pozvanka.jpg" alt=""></p>}
{[img width="680"]pozvanka.jpg}          {<p><img width=680 src="pozvanka.jpg" alt=""></p>}
{[img=680x317 alt=images]pozvanka.jpg}   {<p><img width=680 height=317 src="pozvanka.jpg" alt="images"></p>}
{[img size="680x300" alt='pozvanka na "vystavu"']pozvanka.jpg}
								         {<p><img width=680 height=300 src="pozvanka.jpg" alt="pozvanka na &quot;vystavu&quot;"></p>}
{[img width="680" height="300" alt="pozvanka na vystavu"]pozvanka.jpg}
								         {<p><img width=680 height=300 src="pozvanka.jpg" alt="pozvanka na vystavu"></p>}
;{[img resize=680x0]pozvanka.jpg[/]} {<img width=680 height=300 src="pozvanka.jpg" alt="">}
{[h2=title]stylised title[/h2]}          {<h2 class="title">stylised title</h2>}
{text^/on one line ^/second line}        {<p>text^/on one line <br>^/second line</p>}
{par 1^/^/par 2}                         {<p>par 1</p>^/^/<p>par 2</p>}
{[script][/script]}                      {<p>[script]</p>}
{[url=http://][h1=]bla}                  {<p><a href="http://"><h1>bla</h1></a></p>}
{[ul][*][url]http://test[*]foo[/]}       {<ul><li><a href="http://test">http://test</a></li><li>foo</li></ul>}
{[hr]}                                   {<p><hr></p>}
{[hr 10]}                                {<p><hr style="width:10"></p>}
{[hr10%]}                                {<p><hr style="width:10%"></p>}
{[anchor]foo[/anchor]}                   {<p><a name="foo"></a></p>}
{[class=underline]foo}                   {<p><span class="underline">foo</span></p>}
{[style color="red"]Text[/style][b]foo}  {<p><span style="color:red;">Text</style><b>foo</b></p>}
{[code Red]view [button "hello"][/code]} {<p><code class="Red">view [button "hello"]</code></p>}

{[csv class=vysledky]
name	number	position
foo	1	2
boo	2	1
[/csv]} {<table class="vysledky">^/<tr><th>name</th><th>number</th><th>position</th></tr>^/<tr><td>foo</td><td>1</td><td>2</td></tr>^/<tr><td>boo</td><td>2</td><td>1</td></tr>^/</table>}

{[csv divider=';' align='center' coltype='lcr' widths='100 20 *']
name;number;position
foo;1;2
[/csv]
}       {<table align="center">^/<col align="left">^/<col align="center">^/<col align="right">^/<tr><th width=100>name</th><th width=20>number</th><th>position</th></tr>^/<tr><td>foo</td><td>1</td><td>2</td></tr>^/</table>^/}
		]
		errors: copy []
		foreach [src result] test-cases [
			print ["<==" src]
			print ["==>" tmp: bbcode src]
			print either tmp = result ["OK"][repend/only errors [src tmp] rejoin ["ERR " result]]
			print "---"
		]
		unless empty? errors [
			print ["ERRORS:" mold new-line/all errors true]
		]
	]
	Type: [tool dialect function]
	Library: [
		level:    'advanced
		platform: 'all
		type:     [tool dialect function]
		domain:   [dialects files html markup parse text text-processing web]
	]
	Rights:  "Copyright (C) 2017 David 'Oldes' Oliva. All rights reserved."
	License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
]

ctx-bbcode: context [
	ch_normal:    complement charset "[<^M^/"
	ch_space: charset [#"^A" - #" " #"^(7F)"]
	ch_attribute:  complement charset {"'<>]}
	ch_attribute1: complement charset {'<>]}
	ch_attribute2: complement charset {"<>]}
	ch_attribute3: union complement ch_space ch_attribute
	ch_attribute4: complement charset { ]<>}
	ch_digits: charset [#"0" - #"9"]
	ch_hexa:   charset [#"a" - #"f" #"A" - #"F" #"0" - #"9"]
	ch_name:   charset [#"a" - #"z" #"A" - #"Z" #"*" #"0" - #"9"]
	ch_url:    charset [#"a" - #"z" #"A" - #"Z" #"0" - #"9" "./:~+-%#\_=&?@"]
	ch_safe-value-chars: complement charset {'"}
	
	opened-tags: copy []
	rl_newline: ["^M^/" | "^/"]
	rl_attribute: [
		(short-attr: none)
		any ch_space #"=" any ch_space [
			#"'" copy short-attr any ch_attribute1 #"'"
			|
			#"^"" copy short-attr any ch_attribute2 #"^""
			|
			copy short-attr any ch_attribute4
		]
		any ch_space
	]
	rl_attributes: [
		(clear attributes)
		opt rl_attribute
		any [
			any ch_space
			copy tmp some ch_name any ch_space #"=" any ch_space [
				#"^"" copy attr any ch_attribute2 #"^""
				|
				#"'"  copy attr any ch_attribute1 #"'"
				|
				copy attr any ch_attribute4
			] any ch_space
			(
				repend attributes [tmp attr]
				tmp: attr: none
			)
		]
	]
	allow-html-tags?: false
	short-attr:       none
	attr:             none
	attributes:       make hash! 20
	html:             copy ""
	
	get-attribute: func[name /default value /local tmp][
		all [
			tmp: select/skip attributes name 2
			tmp: encode-value tmp
			default
			error? try [tmp: to type? value tmp]
		]
		any [tmp value] 
	]
	form-attribute: func[name /default value][
		either value: either default [
			get-attribute/default name value
		][  get-attribute name ][
			rejoin [#" " name {="} value {"}]
		][  ""]
	]
	encode-value: func[value [any-string!] /local out tmp][
		out: copy ""
		parse value [
			any [
				pos: ;(probe pos)
				[ 
					#"'" (append out "&apos;") |
					#"^"" (append out "&quot;")
				]
				|
				copy tmp some ch_safe-value-chars (append out tmp)
			]
		]
		out
	]
	close-tags: func[/only to-tag][
		opened-tags: tail opened-tags
		while [not empty? opened-tags: back opened-tags][
			tag: opened-tags/1
			append html case [
				tag = "url" ["</a>"]
				find ["list" "color" "quote" "size" "align" "email"] tag [""]
				
				true [
					rejoin ["</" tag ">"]
				]
			]
			remove opened-tags
			if tag = to-tag [break]
		]
		opened-tags: head opened-tags
	]
	form-size: func[/local size out][
		out: copy ""
		case/all [
			all [
				none? short-attr
				empty? attributes
			][  return out ]
			
			any [
				all [
					size: get-attribute "size"
					not error? try [size: to pair! size]
				]
				all [
					short-attr
					not error? try [size: to pair! short-attr]
					size <> 0x0
				]
			][
				return rejoin [
					either size/x > 0 [ rejoin [" width="  size/x] ][""]
					either size/y > 0 [ rejoin [" height=" size/y] ][""]
				]
			]
			
			all [
				size: get-attribute "resize"
				not error? try [size: to pair! size]
			][
				return rejoin [
					either size/x > 0 [ rejoin [" width="  size/x] ][""]
					either size/y > 0 [ rejoin [" height=" size/y] ][""]
				]
			]
			
			all [
				not error? try [size: to integer! get-attribute "width"]
				size > 0
			][
				append out rejoin [" width=" size]
			]
			
			all [
				not error? try [size: to integer! get-attribute "height"]
				size > 0
			][
				append out rejoin [" height=" size]
			]
		]
		any [out ""]
	]
	
	close-p-if-possible: func[ /local p] [
		if all[
			not empty? opened-tags
			"p" = last opened-tags
		][
			close-tags/only "p"
			if "<p></p>" = p: skip tail html -7 [
				clear p
			]
		]
	]
	emit-tag-p: does [
		append html "<p>"
		append opened-tags "p"
	]
	emit-tag: func[tag][
		insert tail html either block? tag [rejoin tag][tag]
	]

	emit-tag-csv: function[
		spec [string!]
	][
		ch_divider: charset get-attribute/default "divider" "^-"
		ch_notDivider: complement union ch_divider charset "^/^M"
		row: copy ""
		data: none
		trim/head/tail spec
		
		close-p-if-possible
		close-tags
		emit-tag [{<table} form-attribute "class" form-attribute "align" form-attribute "style" {>^/}]
		if widths: get-attribute "widths" [
			error? try [widths: load widths]
		]
		if align: get-attribute "coltype" [
			parse align [
				some [
					  #"c" (emit-tag {<col align="center">^/})
					| #"l" (emit-tag {<col align="left">^/}) 
					| #"r" (emit-tag {<col align="right">^/})
					| #"j" (emit-tag {<col align="justify">^/})
				]
			]
		]
		rl_data: [
			copy data any ch_notDivider
		]
		datatag: "th"
		rowNum: 0
		colNum: 0
		get-col-width: does [
			colNum: colNum + 1
			either all [
				rowNum = 1
				block? widths
				col-width: pick widths colNum
				integer? col-width
			][
				rejoin [" width=" col-width]
			][ "" ]
		]
		parse spec [
			some [
				(
					clear row
					rowNum: rowNum + 1
				)
				any ch_space
				some [
					rl_data
					1 ch_divider
					(
						append row rejoin [{<} datatag get-col-width {>} data {</} datatag {>}]
					)
				]
				rl_data
				[rl_newline | end](
					append row rejoin [{<} datatag get-col-width {>} data {</} datatag {>}]
					datatag: "td"
					emit-tag ["<tr>" row "</tr>^/"]
				)
			]
		]
		emit-tag "</table>"
	]
	
	enabled-tags: [
		"b" "i" "s" "u" "del" "h1" "h2" "h3" "h4" "h5" "span" "class"
		"ins" "dd" "dt" "ol" "ul" "li" "url" "list" "*" "br" "hr"
		"color" "quote" "img" "size" "rebol" "align" "email" "style"
	]
	
	bbcode: func[
		"Converts BBCode markup into HTML"
		code [string! binary! file! url!] "Input with BBCode tags"
		/local tmp tag pos
	][
		clear html
		if any [file? code url? code][code: read/binary code]
		emit-tag-p
		parse code [
			any [
				(attr: none)
				copy tmp some ch_normal (append html tmp)
				|
				"[url]" copy tmp some ch_url opt "[/url]" (
					emit-tag [{<a href="} encode-value tmp {">} tmp {</a>}]
				)
				|
				"[anchor]" copy tmp any ch_url opt "[/anchor]" (
					emit-tag [{<a name="} encode-value tmp {"></a>}]
				)
				|
				"[email]" copy tmp some ch_url opt "[/email]" (
					emit-tag [{<a href="mailto:} encode-value tmp {">} tmp {</a>}]
				)
				|
				"[img" opt rl_attributes #"]" copy tmp some ch_url opt "[/img]" (
					emit-tag [{<img} form-size { src="} encode-value tmp {"} form-attribute/default "alt" ""  {>}]
				) 
				|
				"[code" any ch_space opt #"=" any ch_space copy attr to #"]" 1 skip copy tmp to "[/code]" thru "]" (
					emit-tag either empty? attr [
						[{<code>} tmp {</code>}]
					][
						[{<code class="} attr {">} tmp {</code>}]
					]
				)
				|
				"[/]" (
					close-tags
				)
				|
				"[br]" (emit-tag "<br>")
				|
				"[hr" any ch_space copy tmp [any ch_digits opt #"%"] any ch_space "]" (
					emit-tag either empty? tmp ["<hr>"][
						rejoin [{<hr style="width:} tmp {">}]
					]
				)
				|
				"[csv" opt rl_attributes #"]" copy tmp to "[/csv" (emit-tag-csv tmp)
				|
				#"[" [
					;normal opening tags
					copy tag some ch_name opt rl_attributes         
					#"]" (
						if tag = "*" [tag: "li"]
						append html either find enabled-tags tag [
							if find ["li"] tag [
								;closed already opened tag
								if all [
									tmp: find/last opened-tags tag 
									none? find tmp "ol"
									none? find tmp "ul"
								][
									close-tags/only tag
								]
							]
							
							switch/default tag [
								"url"  [
									append opened-tags "a"
									rejoin [{<a href="} encode-value short-attr {"} form-attribute "rel" {>}]
								]
								"color" [
									either all [short-attr parse short-attr [
										#"#" [6 ch_hexa | 3 ch_hexa]
									]][
										append opened-tags "span"
										rejoin [{<span style="color: } short-attr {;">}]
									][
										;;Should the invalid tag be visible?
										;rejoin either attr [
										;   ["[" tag "=" attr "]"]
										;][ ["[" tag "]"] ]
										""
									]
								]
								"quote" [
									append opened-tags ["fieldset" "blockquote"]
									either short-attr [
										rejoin [{<fieldset><legend>} short-attr {</legend><blockquote>}]
									][
										{<fieldset><blockquote>}
									]
								]
								"list" [
									if none? short-attr [short-attr: ""]
									close-p-if-possible
									parse/case short-attr [
										[
											  "a" (tmp: {<ol style="list-style-type: lower-alpha;">})
											| "A" (tmp: {<ol style="list-style-type: upper-alpha;">})
											| "i" (tmp: {<ol style="list-style-type: lower-roman;">})
											| "I" (tmp: {<ol style="list-style-type: upper-roman;">})
											| "1" (tmp: {<ol style="list-style-type: decimal;">})
										] (append opened-tags "ol")
										| (append opened-tags "ul" tmp: {<ul>})
									]
									tmp
								]
								"size" [
									if none? short-attr [short-attr: ""]
									parse short-attr [
										[
											  ["tiny" | "xx-small" | "-2"] (tmp: {<span style="font-size: xx-small;">})
											| ["x-small" | "-1"]         (tmp: {<span style="font-size: x-small;">})
											| ["small" | "normal" | "0"] (tmp: {<span style="font-size: small;">})
											| ["medium" | "1"]           (tmp: {<span style="font-size: medium;">})
											| ["large"  | "2"]           (tmp: {<span style="font-size: large;">})
											| ["x-large" | "huge" | "3"] (tmp: {<span style="font-size: x-large;">})
											| ["xx-large" | "4"]         (tmp: {<span style="font-size: xx-large;">})
											
										] end
										;TODO: other number values (pt,px,em)?
										| to end (tmp: {<span>})
									]
									append opened-tags "span"
									tmp
								]
								"align" [
									if none? short-attr [short-attr: ""]
									parse short-attr [
										[
											  ["right"   | "r"] (tmp: {<div style="text-align: right;">})
											| ["left"    | "l"] (tmp: {<div style="text-align: left;">})
											| ["center"  | "c"] (tmp: {<div style="text-align: center;">})
											| ["justify" | "j"] (tmp: {<div style="text-align: justify;">})
										] end
										| to end (tmp: {<div>})
									]
									append opened-tags "div"
									tmp
								]
								"email" [
									either error? try [tmp: to-email short-attr][""][
										append opened-tags "a"
										rejoin [{<a href="mailto:} encode-value tmp {">}]
									]
								]
								"class" [
									if none? short-attr [short-attr: ""]
									tmp: rejoin [{<span class="} short-attr {">}]
									append opened-tags "span"
									tmp
								]
								"style" [
									tmp: copy {<span style="}
									foreach [a v] attributes [ append tmp rejoin [a #":" v #";"] ]
									append tmp {">}
									append opened-tags "style"
									tmp
								]
							][
								if find ["h1" "h2" "h3" "h4" "h5" "ul" "ol"] tag [
									close-p-if-possible
								]
								append opened-tags tag
								rejoin either empty? short-attr [
									["<" tag ">"]
								][  ["<" tag { class="} encode-value short-attr {">}] ]
							]
							
						][
							rejoin ["[" tag "]"]
						]
					)
					
					|
					;closing tags
					#"/" 
					copy tag some ch_name
					#"]" (
						either tmp: find/last opened-tags tag [
							close-tags/only tag
						][
							;;unopened tag, hidden by default, uncomment next line if you don't want to hide it
							;append html rejoin [{[/} tag {]}] 
						]
					)
					| (append html "[")
				]
				|
				#"<" (append html either allow-html-tags? ["<"]["&lt;"])
				|
				2 rl_newline (
					either any [
						pos: find/last opened-tags "ul"
						pos: find/last opened-tags "ol"
					][
						if all [
							pos: find/last pos "li"
							none? find pos "p"
						][
							insert next pos "p" 
							insert find/last/tail html "<li>" "<p>"
							close-tags/only "p"
						]
					][
						close-tags/only "p"
					]
					
					append html "^/^/"
					emit-tag-p
				)
				|
				pos: rl_newline (
					case [
						#" " = pos/(-1) [append html "<br>^/"]
						true [append html lf]
					]
				)
			]
		]
		unless empty? opened-tags [
			close-tags
		]
		copy html
	]
]
bbcode: get in ctx-bbcode 'bbcode
