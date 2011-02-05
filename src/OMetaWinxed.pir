# Begin generated code

.namespace [ ]

.sub '_fail' :anon :immediate

.annotate 'file', 'ometa-base.winxed'
.annotate 'line', 3
# Body
# {
.annotate 'line', 4
# var fail: $P1
box $P1, "match failed"
.annotate 'line', 5
.return($P1)
# }
.annotate 'line', 6

.end # _fail


.sub 'fail' :anon

.annotate 'line', 8
# Body
# {
.annotate 'line', 9
.const 'Sub' $P2 = '_fail'
.annotate 'line', 10
# var e: $P1
new $P1, [ 'Exception' ]
.annotate 'line', 11
setattribute $P1, 'message', $P2
.annotate 'line', 12
setattribute $P1, 'payload', $P2
.annotate 'line', 13
.return($P1)
# }
.annotate 'line', 14

.end # fail


.sub 'is_sequenceable' :anon
.param pmc __ARG_1

.annotate 'line', 16
# Body
# {
.annotate 'line', 17
isa $I1, __ARG_1, 'String'
if $I1 goto __label_2
isa $I1, __ARG_1, 'ResizablePMCArray'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 18
.return(1)
goto __label_1
__label_0: # else
.annotate 'line', 20
.return(0)
__label_1: # endif
# }
.annotate 'line', 21

.end # is_sequenceable


.sub 'typeof' :anon
.param pmc __ARG_1

.annotate 'line', 23
# Body
# {
.annotate 'line', 24
# var t: $P1
null $P1
.annotate 'line', 25
# pirop typeof
typeof $P1, __ARG_1
.annotate 'line', 26
.return($P1)
# }
.annotate 'line', 27

.end # typeof

.namespace [ 'Failer' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Failer' ]
.annotate 'line', 30
addattribute $P0, 'used'
.end
.namespace [ 'OMInputStream' ]

.sub 'init_pmc' :method :vtable
.param pmc __ARG_1

.annotate 'line', 40
# Body
# {
.annotate 'line', 41
root_new $P2, ['parrot';'Hash']
setattribute self, 'memo', $P2
.annotate 'line', 42
getattribute $P1, self, 'tl'
if_null $P1, __label_0
# {
.annotate 'line', 43
getattribute $P3, self, 'tl'
getattribute $P4, $P3, 'lst'
setattribute self, 'lst', $P4
.annotate 'line', 44
getattribute $P4, self, 'tl'
getattribute $P5, $P4, 'idx'
setattribute self, 'idx', $P5
# }
__label_0: # endif
# }
.annotate 'line', 46

.end # init_pmc


.sub 'head' :method

.annotate 'line', 47
# Body
# {
getattribute $P1, self, 'hd'
.return($P1)
# }

.end # head


.sub 'tail' :method

.annotate 'line', 48
# Body
# {
getattribute $P1, self, 'tl'
.return($P1)
# }

.end # tail


.sub 'type' :method

.annotate 'line', 49
# Body
# {
.annotate 'line', 50
.const 'Sub' $P1 = 'typeof'
.annotate 'line', 51
getattribute $P2, self, 'lst'
.tailcall $P1($P2)
# }
.annotate 'line', 52

.end # type


.sub 'upTo' :method
.param pmc __ARG_1

.annotate 'line', 53
# Body
# {
.annotate 'line', 54
# var ans: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 55
# var curr: $P2
set $P2, self
__label_1: # while
.annotate 'line', 56
eq $P2, __ARG_1, __label_0
# {
.annotate 'line', 57
$P3 = $P2.'head'()
$P1.'push'($P3)
.annotate 'line', 58
$P2 = $P2.'tail'()
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 60
getattribute $P4, self, 'type'
set $S1, $P4
ne $S1, 'String', __label_2
.annotate 'line', 61
.tailcall $P1.'join'('')
goto __label_3
__label_2: # else
.annotate 'line', 63
.return($P1)
__label_3: # endif
# }
.annotate 'line', 64

.end # upTo

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMInputStream' ]
.annotate 'line', 34
addattribute $P0, 'memo'
.annotate 'line', 35
addattribute $P0, 'lst'
.annotate 'line', 36
addattribute $P0, 'idx'
.annotate 'line', 37
addattribute $P0, 'hd'
.annotate 'line', 38
addattribute $P0, 'tl'
.end
.namespace [ 'OMInputStreamEnd' ]

.sub 'head' :method

.annotate 'line', 68
# Body
# {
.annotate 'line', 69
.const 'Sub' $P1 = 'fail'
.annotate 'line', 70
$P2 = $P1()
throw $P2
# }
.annotate 'line', 71

.end # head


.sub 'tail' :method

.annotate 'line', 72
# Body
# {
.annotate 'line', 73
.const 'Sub' $P1 = 'fail'
.annotate 'line', 74
$P2 = $P1()
throw $P2
# }
.annotate 'line', 75

.end # tail

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMInputStreamEnd' ]
.annotate 'line', 67
get_class $P1, [ 'OMInputStream' ]
addparent $P0, $P1
.end
.namespace [ 'ListOMInputStream' ]

.sub 'init_pmc' :method :vtable
.param pmc __ARG_1

.annotate 'line', 79
# Body
# {
.annotate 'line', 80
getattribute $P3, self, 'lst'
getattribute $P4, self, 'idx'
$P2 = $P3[$P4]
setattribute self, 'hd', $P2
# }
.annotate 'line', 81

.end # init_pmc


.sub 'head' :method

.annotate 'line', 82
# Body
# {
getattribute $P1, self, 'hd'
.return($P1)
# }

.end # head


.sub 'tail' :method

.annotate 'line', 83
# Body
# {
.annotate 'line', 84
.const 'Sub' $P1 = 'makeListOMInputStream'
.annotate 'line', 85
getattribute $P2, self, 'tl'
unless_null $P2, __label_0
.annotate 'line', 86
getattribute $P5, self, 'lst'
getattribute $P6, self, 'idx'
set $I2, $P6
add $I1, $I2, 1
$P4 = $P1($P5, $I1)
setattribute self, 'tl', $P4
__label_0: # endif
.annotate 'line', 87
getattribute $P2, self, 'tl'
.return($P2)
# }
.annotate 'line', 88

.end # tail

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ListOMInputStream' ]
.annotate 'line', 78
get_class $P1, [ 'OMInputStream' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'makeListOMInputStream' :anon
.param pmc __ARG_1
.param int __ARG_2 :optional

.annotate 'line', 91
# Body
# {
.annotate 'line', 92
# var klass: $P1
# predefined elements
elements $I1, __ARG_1
ge __ARG_2, $I1, __label_1
set $S1, 'ListOMInputStream'
goto __label_0
__label_1:
set $S1, 'OMInputStreamEnd'
__label_0:
# predefined get_class
get_class $P1, $S1
.annotate 'line', 94
# var obj: $P2
$P2 = $P1.'new'(__ARG_1 :named('lst'), __ARG_2 :named('idx'))
.annotate 'line', 95
.return($P2)
# }
.annotate 'line', 96

.end # makeListOMInputStream

.namespace [ 'OMInputStreamProxy' ]

.sub 'head' :method

.annotate 'line', 101
# Body
# {
getattribute $P1, self, 'target'
.tailcall $P1.'head'()
# }

.end # head


.sub 'type' :method

.annotate 'line', 102
# Body
# {
getattribute $P1, self, 'target'
.tailcall $P1.'type'()
# }

.end # type


.sub 'upTo' :method

.annotate 'line', 103
# Body
# {
getattribute $P1, self, 'target'
.tailcall $P1.'upTo'()
# }

.end # upTo


.sub 'tail' :method

.annotate 'line', 104
# Body
# {
.annotate 'line', 105
# var tail: $P1
getattribute $P3, self, 'target'
$P1 = $P3.'tail'()
.annotate 'line', 106
# var proxy: $P2
root_new $P3, ['parrot';'Hash']
getattribute $P5, self, 'target'
$P4 = $P5.'tail'()
$P3['target'] = $P4
new $P2, [ 'OMInputStreamProxy' ], $P3
.annotate 'line', 107
.return($P2)
# }
.annotate 'line', 108

.end # tail

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMInputStreamProxy' ]
.annotate 'line', 99
get_class $P1, [ 'OMInputStream' ]
addparent $P0, $P1
.annotate 'line', 100
addattribute $P0, 'target'
.end
.namespace [ 'OMeta' ]

.sub 'init' :method :vtable

.annotate 'line', 116
# Body
# {
.annotate 'line', 117
.const 'Sub' $P1 = '_fail'
.annotate 'line', 118
setattribute self, 'fail', $P1
# }
.annotate 'line', 119

.end # init


.sub 'init_pmc' :method :vtable
.param pmc __ARG_1

.annotate 'line', 121
# Body
# {
.annotate 'line', 122
.const 'Sub' $P1 = '_fail'
.annotate 'line', 123
setattribute self, 'fail', $P1
.annotate 'line', 124
root_new $P3, ['parrot';'Hash']
setattribute self, 'stash', $P3
# }
.annotate 'line', 125

.end # init_pmc


.sub 'get_pmc_keyed' :method :vtable
.param pmc __ARG_1

.annotate 'line', 127
# Body
# {
.annotate 'line', 128
getattribute $P2, self, 'stash'
$P1 = $P2[__ARG_1]
.return($P1)
# }
.annotate 'line', 129

.end # get_pmc_keyed


.sub 'get_pmc_keyed_str' :method :vtable
.param string __ARG_1

.annotate 'line', 131
# Body
# {
.annotate 'line', 132
getattribute $P2, self, 'stash'
$P1 = $P2[__ARG_1]
.return($P1)
# }
.annotate 'line', 133

.end # get_pmc_keyed_str


.sub 'get_string_keyed' :method :vtable
.param pmc __ARG_1

.annotate 'line', 135
# Body
# {
.annotate 'line', 136
getattribute $P2, self, 'stash'
$P1 = $P2[__ARG_1]
.return($P1)
# }
.annotate 'line', 137

.end # get_string_keyed


.sub 'get_integer_keyed' :method :vtable
.param pmc __ARG_1

.annotate 'line', 139
# Body
# {
# predefined int
.annotate 'line', 140
getattribute $P1, self, 'stash'
$I1 = $P1[__ARG_1]
.return($I1)
# }
.annotate 'line', 141

.end # get_integer_keyed


.sub 'set_pmc_keyed' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 143
# Body
# {
.annotate 'line', 144
getattribute $P1, self, 'stash'
$P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 145

.end # set_pmc_keyed


.sub 'set_pmc_keyed_str' :method :vtable
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 147
# Body
# {
.annotate 'line', 148
getattribute $P1, self, 'stash'
$P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 149

.end # set_pmc_keyed_str


.sub 'set_string_keyed' :method :vtable
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 151
# Body
# {
.annotate 'line', 152
getattribute $P1, self, 'stash'
$P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 153

.end # set_string_keyed


.sub 'set_integer_keyed' :method :vtable
.param pmc __ARG_1
.param int __ARG_2

.annotate 'line', 155
# Body
# {
.annotate 'line', 156
getattribute $P1, self, 'stash'
$P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 157

.end # set_integer_keyed


.sub '_fail' :method

.annotate 'line', 159
# Body
# {
.annotate 'line', 160
.const 'Sub' $P1 = 'fail'
.annotate 'line', 161
.tailcall $P1()
# }
.annotate 'line', 162

.end # _fail


.sub '_apply' :method
.param string __ARG_1

.annotate 'line', 164
# Body
# {
.annotate 'line', 165
.const 'Sub' $P10 = 'fail'
.annotate 'line', 166
.const 'Sub' $P11 = '_fail'
.annotate 'line', 167
# var memoRec: $P1
getattribute $P12, self, 'input'
getattribute $P13, $P12, 'memo'
$P1 = $P13[__ARG_1]
.annotate 'line', 168
unless_null $P1, __label_0
# {
.annotate 'line', 169
# var origInput: $P2
getattribute $P2, self, 'input'
.annotate 'line', 170
# var failer: $P3
new $P3, [ 'Failer' ]
.annotate 'line', 171
# var method: $P4
null $P4
.annotate 'line', 173
# try: create handler
new $P12, 'ExceptionHandler'
set_label $P12, __label_2
push_eh $P12
# try: begin
# {
# predefined find_method
find_method $P4, self, __ARG_1
# }
# try: end
pop_eh
goto __label_3
# catch
__label_2:
.get_results($P5)
finalize $P5
pop_eh
# {
concat $S1, 'tried to apply undefined rule "', __ARG_1
concat $S1, $S1, '"'
.annotate 'line', 174
# predefined die
die $S1
# }
# catch end
__label_3:
.annotate 'line', 176
getattribute $P13, self, 'input'
getattribute $P14, $P13, 'memo'
$P14[__ARG_1] = $P3
.annotate 'line', 177
# var ans: $P6
root_new $P14, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P6 = self.$P4($P14 :flat)
.annotate 'line', 178
getattribute $P15, $P2, 'memo'
.annotate 'line', 179
root_new $P1, ['parrot';'Hash']
$P1['ans'] = $P6
getattribute $P16, self, 'input'
$P1['nextInput'] = $P16
.annotate 'line', 178
$P15[__ARG_1] = $P1
.annotate 'line', 181
getattribute $P16, $P3, 'used'
if_null $P16, __label_4
unless $P16 goto __label_4
# {
.annotate 'line', 182
# var sentinel: $P7
getattribute $P7, self, 'input'
__label_6: # Infinite loop
.annotate 'line', 183
# {
.annotate 'line', 184
# try: create handler
new $P17, 'ExceptionHandler'
set_label $P17, __label_7
push_eh $P17
# try: begin
# {
.annotate 'line', 185
setattribute self, 'input', $P2
.annotate 'line', 186
# var ans: $P8
root_new $P17, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P8 = self.$P4($P17 :flat)
.annotate 'line', 187
getattribute $P19, self, 'input'
ne_addr $P19, $P7, __label_9
.annotate 'line', 188
$P20 = $P10()
throw $P20
__label_9: # endif
.annotate 'line', 189
$P1['ans'] = $P8
.annotate 'line', 190
getattribute $P19, self, 'input'
$P1['nextInput'] = $P19
# }
# try: end
pop_eh
goto __label_8
.annotate 'line', 184
# catch
__label_7:
.get_results($P9)
finalize $P9
pop_eh
# {
.annotate 'line', 192
getattribute $P20, $P9, 'payload'
eq_addr $P20, $P11, __label_10
.annotate 'line', 193
# pirop rethrow
rethrow $P9
__label_10: # endif
goto __label_5 # break
.annotate 'line', 194
# }
# catch end
__label_8:
# }
goto __label_6
__label_5: # Infinite loop end
# }
__label_4: # endif
# }
goto __label_1
__label_0: # else
.annotate 'line', 198
isa $I1, $P1, 'Failer'
unless $I1 goto __label_11
# {
box $P21, 1
.annotate 'line', 199
setattribute $P1, 'used', $P21
.annotate 'line', 200
$P21 = $P10()
throw $P21
# }
__label_11: # endif
__label_1: # endif
.annotate 'line', 202
$P23 = $P1['nextInput']
setattribute self, 'input', $P23
$P22 = $P1['ans']
.annotate 'line', 203
.return($P22)
# }
.annotate 'line', 204

.end # _apply


.sub '_applyWithArgs' :method
.param string __ARG_1
.param pmc __ARG_2 :slurpy

.annotate 'line', 206
# Body
# {
# for loop
.annotate 'line', 207
# int i: $I1
# predefined elements
elements $I2, __ARG_2
sub $I1, $I2, 1
__label_2: # for condition
lt $I1, 0, __label_1
.annotate 'line', 208
$P2 = __ARG_2[$I1]
self.'_prependInput'($P2)
__label_0: # for iteration
set $I3, $I1
.annotate 'line', 207
dec $I1
goto __label_2
__label_1: # for end
.annotate 'line', 209
# var method: $P1
# predefined find_method
find_method $P1, self, __ARG_1
.annotate 'line', 210
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P2 = self.$P1($P3 :flat)
.return($P2)
# }
.annotate 'line', 211

.end # _applyWithArgs


.sub '_superApplyWithArgs' :method
.param string __ARG_1
.param string __ARG_2
.param pmc __ARG_3 :slurpy

.annotate 'line', 213
# Body
# {
# for loop
.annotate 'line', 214
# int i: $I1
# predefined elements
elements $I2, __ARG_3
sub $I1, $I2, 1
__label_2: # for condition
lt $I1, 0, __label_1
.annotate 'line', 215
$P3 = __ARG_3[$I1]
self.'_prependInput'($P3)
__label_0: # for iteration
set $I3, $I1
.annotate 'line', 214
dec $I1
goto __label_2
__label_1: # for end
.annotate 'line', 216
# var klass: $P1
# predefined get_class
get_class $P1, __ARG_1
.annotate 'line', 217
# var method: $P2
$P2 = $P1.'find_method'(__ARG_2)
.annotate 'line', 218
root_new $P4, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P3 = self.$P2($P4 :flat)
.return($P3)
# }
.annotate 'line', 219

.end # _superApplyWithArgs


.sub '_prependInput' :method
.param pmc __ARG_1

.annotate 'line', 221
# Body
# {
.annotate 'line', 222
root_new $P3, ['parrot';'Hash']
$P3['hd'] = __ARG_1
getattribute $P4, self, 'input'
$P3['tl'] = $P4
new $P2, [ 'OMInputStream' ], $P3
setattribute self, 'input', $P2
# }
.annotate 'line', 223

.end # _prependInput


.sub 'memoizeParameterizedRules' :method

.annotate 'line', 225
# Body
# {
# predefined die
.annotate 'line', 226
die "TODO"
# }
.annotate 'line', 227

.end # memoizeParameterizedRules


.sub '_pred' :method
.param int __ARG_1

.annotate 'line', 229
# Body
# {
.annotate 'line', 230
.const 'Sub' $P1 = 'fail'
unless __ARG_1 goto __label_0
.annotate 'line', 232
.return(1)
__label_0: # endif
.annotate 'line', 233
$P2 = $P1()
throw $P2
# }
.annotate 'line', 234

.end # _pred


.sub '_not' :method
.param pmc __ARG_1

.annotate 'line', 236
# Body
# {
.annotate 'line', 237
.const 'Sub' $P3 = 'fail'
.annotate 'line', 238
.const 'Sub' $P4 = '_fail'
.annotate 'line', 239
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 240
# try: create handler
new $P5, 'ExceptionHandler'
set_label $P5, __label_0
push_eh $P5
# try: begin
# {
root_new $P6, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P8 = self.__ARG_1($P6 :flat)
# }
# try: end
pop_eh
goto __label_1
# catch
__label_0:
.get_results($P2)
finalize $P2
pop_eh
# {
.annotate 'line', 242
getattribute $P5, $P2, 'payload'
eq_addr $P5, $P4, __label_2
.annotate 'line', 243
# pirop rethrow
rethrow $P2
__label_2: # endif
.annotate 'line', 244
setattribute self, 'input', $P1
.annotate 'line', 245
.return(1)
# }
# catch end
__label_1:
.annotate 'line', 247
$P7 = $P3()
throw $P7
# }
.annotate 'line', 248

.end # _not


.sub '_lookahead' :method
.param pmc __ARG_1

.annotate 'line', 250
# Body
# {
.annotate 'line', 251
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 252
# var result: $P2
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P2 = self.__ARG_1($P3 :flat)
.annotate 'line', 253
setattribute self, 'input', $P1
.annotate 'line', 254
.return($P2)
# }
.annotate 'line', 255

.end # _lookahead


.sub '_or' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 257
# Body
# {
.annotate 'line', 258
.const 'Sub' $P4 = 'fail'
.annotate 'line', 259
.const 'Sub' $P5 = '_fail'
.annotate 'line', 260
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 261
iter $P6, __ARG_1
set $P6, 0
__label_0: # for iteration
unless $P6 goto __label_1
shift $P2, $P6
# {
.annotate 'line', 262
# try: create handler
new $P7, 'ExceptionHandler'
set_label $P7, __label_2
push_eh $P7
# try: begin
# {
.annotate 'line', 263
setattribute self, 'input', $P1
.annotate 'line', 264
root_new $P8, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P7 = self.$P2($P8 :flat)
.return($P7)
# }
# try: end
pop_eh
goto __label_3
.annotate 'line', 262
# catch
__label_2:
.get_results($P3)
finalize $P3
pop_eh
# {
.annotate 'line', 266
getattribute $P9, $P3, 'payload'
eq_addr $P9, $P5, __label_4
.annotate 'line', 267
# pirop rethrow
rethrow $P3
__label_4: # endif
# }
# catch end
__label_3:
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 270
$P10 = $P4()
throw $P10
# }
.annotate 'line', 271

.end # _or


.sub '_xor' :method
.param string __ARG_1
.param pmc __ARG_2 :slurpy

.annotate 'line', 273
# Body
# {
.annotate 'line', 274
.const 'Sub' $P6 = 'fail'
.annotate 'line', 275
.const 'Sub' $P7 = '_fail'
.annotate 'line', 276
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 277
# var ans: $P2
null $P2
.annotate 'line', 278
# var newInput: $P3
null $P3
.annotate 'line', 279
iter $P8, __ARG_2
set $P8, 0
__label_0: # for iteration
unless $P8 goto __label_1
shift $P4, $P8
# {
.annotate 'line', 280
# try: create handler
new $P9, 'ExceptionHandler'
set_label $P9, __label_2
push_eh $P9
# try: begin
# {
.annotate 'line', 281
setattribute self, 'input', $P1
.annotate 'line', 282
root_new $P9, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P2 = self.$P4($P9 :flat)
if_null $P3, __label_4
unless $P3 goto __label_4
concat $S1, 'more than one choice matched by "exclusive-OR" in ', __ARG_1
.annotate 'line', 284
# predefined die
die $S1
__label_4: # endif
.annotate 'line', 285
getattribute $P3, self, 'input'
# }
# try: end
pop_eh
goto __label_3
.annotate 'line', 280
# catch
__label_2:
.get_results($P5)
finalize $P5
pop_eh
# {
.annotate 'line', 287
getattribute $P11, $P5, 'payload'
eq_addr $P11, $P7, __label_5
.annotate 'line', 288
# pirop rethrow
rethrow $P5
__label_5: # endif
# }
# catch end
__label_3:
# }
goto __label_0
__label_1: # endfor
if_null $P3, __label_6
unless $P3 goto __label_6
.annotate 'line', 291
# {
.annotate 'line', 292
setattribute self, 'input', $P3
.annotate 'line', 293
.return($P2)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 295
$P12 = $P6()
throw $P12
# }
__label_7: # endif
# }
.annotate 'line', 297

.end # _xor


.sub 'disableXORs' :method

.annotate 'line', 299
# Body
# {
# predefined die
.annotate 'line', 300
die "TODO"
# }
.annotate 'line', 301

.end # disableXORs


.sub '_opt' :method
.param pmc __ARG_1

.annotate 'line', 303
# Body
# {
.annotate 'line', 304
.const 'Sub' $P4 = '_fail'
.annotate 'line', 305
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 306
# var ans: $P2
null $P2
.annotate 'line', 307
# try: create handler
new $P5, 'ExceptionHandler'
set_label $P5, __label_0
push_eh $P5
# try: begin
# {
root_new $P6, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P2 = self.__ARG_1($P6 :flat)
# }
# try: end
pop_eh
goto __label_1
# catch
__label_0:
.get_results($P3)
finalize $P3
pop_eh
# {
.annotate 'line', 309
getattribute $P5, $P3, 'payload'
eq_addr $P5, $P4, __label_2
.annotate 'line', 310
# pirop rethrow
rethrow $P3
__label_2: # endif
.annotate 'line', 311
setattribute self, 'input', $P1
# }
# catch end
__label_1:
.annotate 'line', 313
.return($P2)
# }
.annotate 'line', 314

.end # _opt


.sub '_many' :method
.param pmc __ARG_1
.param pmc __ARG_2 :optional
.param int __ARG_3 :opt_flag

.annotate 'line', 316
# Body
# {
.annotate 'line', 317
.const 'Sub' $P4 = '_fail'
.annotate 'line', 318
# var ans: $P1
unless __ARG_3 goto __label_1
root_new $P5, ['parrot';'ResizablePMCArray']
$P5.'push'(__ARG_2)
set $P1, $P5
goto __label_0
__label_1:
root_new $P7, ['parrot';'ResizablePMCArray']
set $P1, $P7
__label_0:
__label_3: # Infinite loop
.annotate 'line', 319
# {
.annotate 'line', 320
# var origInput: $P2
getattribute $P2, self, 'input'
.annotate 'line', 321
# try: create handler
new $P5, 'ExceptionHandler'
set_label $P5, __label_4
push_eh $P5
# try: begin
# {
root_new $P7, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P6 = self.__ARG_1($P7 :flat)
$P1.'push'($P6)
# }
# try: end
pop_eh
goto __label_5
# catch
__label_4:
.get_results($P3)
finalize $P3
pop_eh
# {
.annotate 'line', 323
getattribute $P9, $P3, 'payload'
eq_addr $P9, $P4, __label_6
.annotate 'line', 324
# pirop rethrow
rethrow $P3
__label_6: # endif
.annotate 'line', 325
setattribute self, 'input', $P2
.annotate 'line', 326
.return($P1)
# }
# catch end
__label_5:
# }
goto __label_3
__label_2: # Infinite loop end
# }
.annotate 'line', 329

.end # _many


.sub '_many1' :method
.param pmc __ARG_1

.annotate 'line', 331
# Body
# {
.annotate 'line', 332
root_new $P2, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P1 = self.__ARG_1($P2 :flat)
.tailcall self.'_many'(__ARG_1, $P1)
# }
.annotate 'line', 333

.end # _many1


.sub '_form' :method
.param pmc __ARG_1

.annotate 'line', 335
# Body
# {
.annotate 'line', 336
.const 'Sub' $P4 = 'fail'
.annotate 'line', 337
.const 'Sub' $P5 = 'is_sequenceable'
.annotate 'line', 338
.const 'Sub' $P6 = 'makeListOMInputStream'
.annotate 'line', 339
# var v: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 340
$P7 = $P5($P1)
isfalse $I1, $P7
unless $I1 goto __label_0
.annotate 'line', 341
$P8 = $P4()
throw $P8
__label_0: # endif
.annotate 'line', 342
# var origInput: $P2
getattribute $P2, self, 'input'
# {
.annotate 'line', 344
$P8 = $P6($P1)
setattribute self, 'input', $P8
.annotate 'line', 345
# var r: $P3
root_new $P9, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P3 = self.__ARG_1($P9 :flat)
.annotate 'line', 346
self.'_apply'('end')
# }
.annotate 'line', 348
setattribute self, 'input', $P2
.annotate 'line', 349
.return($P1)
# }
.annotate 'line', 350

.end # _form


.sub '_consumedBy' :method
.param pmc __ARG_1

.annotate 'line', 352
# Body
# {
.annotate 'line', 353
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 354
root_new $P2, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P4 = self.__ARG_1($P2 :flat)
.annotate 'line', 355
getattribute $P2, self, 'input'
.tailcall $P1.'upTo'($P2)
# }
.annotate 'line', 356

.end # _consumedBy


.sub '_idxConsumedBy' :method
.param pmc __ARG_1

.annotate 'line', 358
# Body
# {
.annotate 'line', 359
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 360
root_new $P2, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P4 = self.__ARG_1($P2 :flat)
.annotate 'line', 361
root_new $P2, ['parrot';'Hash']
.annotate 'line', 362
getattribute $P3, $P1, 'idx'
$P2['fromIdx'] = $P3
.annotate 'line', 363
getattribute $P4, self, 'input'
getattribute $P5, $P4, 'idx'
$P2['toIdx'] = $P5
.annotate 'line', 361
.return($P2)
# }
.annotate 'line', 365

.end # _idxConsumedBy


.sub '_interleave' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 367
# Body
# {
# predefined die
.annotate 'line', 368
die "TODO"
# }
.annotate 'line', 369

.end # _interleave


.sub '_currIdx' :method

.annotate 'line', 371
# Body
# {
getattribute $P1, self, 'input'
getattribute $P2, $P1, 'idx'
.return($P2)
# }

.end # _currIdx


.sub 'anything' :method

.annotate 'line', 373
# Body
# {
.annotate 'line', 374
# var ans: $P1
getattribute $P2, self, 'input'
$P1 = $P2.'head'()
.annotate 'line', 375
getattribute $P4, self, 'input'
$P3 = $P4.'tail'()
setattribute self, 'input', $P3
.annotate 'line', 376
.return($P1)
# }
.annotate 'line', 377

.end # anything


.sub 'end' :subid('WSubId_1') :method

.annotate 'line', 379
# Body
# {
.annotate 'line', 380
.const 'Sub' $P2 = 'WSubId_2'
newclosure $P1, $P2
.tailcall self.'_not'($P1)
# }
.annotate 'line', 381

.end # end


.sub '' :anon :subid('WSubId_2') :outer('WSubId_1')
.param pmc __ARG_1

.annotate 'line', 380
# Body
# {
__ARG_1.'_apply'('anything')
# }

.end # WSubId_2


.sub 'pos' :method

.annotate 'line', 383
# Body
# {
getattribute $P1, self, 'input'
getattribute $P2, $P1, 'idx'
.return($P2)
# }

.end # pos


.sub 'empty' :method

.annotate 'line', 385
# Body
# {
.return(1)
# }

.end # empty


.sub 'apply' :method

.annotate 'line', 387
# Body
# {
.annotate 'line', 388
$P1 = self.'_apply'('anything')
.tailcall self.'_apply'($P1)
# }
.annotate 'line', 389

.end # apply


.sub 'foreign' :method

.annotate 'line', 391
# Body
# {
.annotate 'line', 392
# var g: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 393
# var r: $P2
$P2 = self.'_apply'('anything')
.annotate 'line', 394
# var proxy: $P3
root_new $P6, ['parrot';'Hash']
getattribute $P7, self, 'input'
$P6['target'] = $P7
new $P3, [ 'OMInputStreamProxy' ], $P6
.annotate 'line', 395
# var gi: $P4
set $S1, $P1
# predefined get_class
get_class $P6, $S1
$P4 = $P6.'new'($P3 :named('input'))
.annotate 'line', 396
# var ans: $P5
$P5 = $P4.'_apply'($P2)
.annotate 'line', 397
getattribute $P8, $P4, 'input'
getattribute $P9, $P8, 'target'
setattribute self, 'input', $P9
.annotate 'line', 398
.return($P5)
# }
.annotate 'line', 399

.end # foreign


.sub 'exactly' :method

.annotate 'line', 401
# Body
# {
.annotate 'line', 402
.const 'Sub' $P2 = 'fail'
.annotate 'line', 403
# var wanted: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 404
$P3 = self.'_apply'('anything')
ne $P3, $P1, __label_0
.annotate 'line', 405
.return($P1)
__label_0: # endif
.annotate 'line', 406
$P3 = $P2()
throw $P3
# }
.annotate 'line', 407

.end # exactly


.sub 'null' :method

.annotate 'line', 409
# Body
# {
.annotate 'line', 410
# var ans: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 411
isnull $I1, $P1
self.'_pred'($I1)
.annotate 'line', 412
.return($P1)
# }
.annotate 'line', 413

.end # null


.sub 'number' :method

.annotate 'line', 415
# Body
# {
.annotate 'line', 416
# var ans: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 417
isa $I1, $P1, 'Number'
self.'_pred'($I1)
.annotate 'line', 418
.return($P1)
# }
.annotate 'line', 419

.end # number


.sub 'string' :method

.annotate 'line', 421
# Body
# {
.annotate 'line', 422
# var ans: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 423
isa $I1, $P1, 'String'
self.'_pred'($I1)
.annotate 'line', 424
.return($P1)
# }
.annotate 'line', 425

.end # string


.sub 'char' :method

.annotate 'line', 427
# Body
# {
.annotate 'line', 428
# var ans: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 429
isa $I1, $P1, 'String'
unless $I1 goto __label_0
set $S1, $P1
# predefined length
length $I2, $S1
iseq $I1, $I2, 1
__label_0:
self.'_pred'($I1)
.annotate 'line', 430
.return($P1)
# }
.annotate 'line', 431

.end # char


.sub '_cclass_char' :method
.param int __ARG_1

.annotate 'line', 433
# Body
# {
.annotate 'line', 434
# string c: $S1
$P1 = self.'_apply'('char')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 435
# int pred: $I1
null $I1
.annotate 'line', 436
# pirop is_cclass
is_cclass $I1, __ARG_1, $S1, 0
.annotate 'line', 437
self.'_pred'($I1)
.annotate 'line', 438
.return($S1)
# }
.annotate 'line', 439

.end # _cclass_char


.sub 'space' :method

.annotate 'line', 441
# Body
# {
.tailcall self.'_cclass_char'(32)
# }

.end # space


.sub 'spaces' :subid('WSubId_3') :method

.annotate 'line', 443
# Body
# {
.annotate 'line', 444
.const 'Sub' $P2 = 'WSubId_4'
newclosure $P1, $P2
.tailcall self.'_many'($P1)
# }
.annotate 'line', 445

.end # spaces


.sub '' :anon :subid('WSubId_4') :outer('WSubId_3')
.param pmc __ARG_1

.annotate 'line', 444
# Body
# {
.tailcall __ARG_1.'_apply'('space')
# }

.end # WSubId_4


.sub 'digit' :method

.annotate 'line', 447
# Body
# {
.tailcall self.'_cclass_char'(8)
# }

.end # digit


.sub 'hexdigit' :method

.annotate 'line', 449
# Body
# {
.tailcall self.'_cclass_char'(16)
# }

.end # hexdigit


.sub 'lower' :method

.annotate 'line', 451
# Body
# {
.tailcall self.'_cclass_char'(2)
# }

.end # lower


.sub 'upper' :method

.annotate 'line', 453
# Body
# {
.tailcall self.'_cclass_char'(1)
# }

.end # upper


.sub 'letter' :method

.annotate 'line', 455
# Body
# {
.tailcall self.'_cclass_char'(4)
# }

.end # letter


.sub 'letterOrDigit' :method

.annotate 'line', 457
# Body
# {
.tailcall self.'_cclass_char'(2048)
# }

.end # letterOrDigit


.sub 'firstAndRest' :subid('WSubId_5') :method

.annotate 'line', 459
.lex '__WLEX_1', $P2
# Body
# {
.annotate 'line', 460
# var first: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 461
# var rest: $P2
$P2 = self.'_apply'('anything')
.annotate 'line', 462
.const 'Sub' $P4 = 'WSubId_6'
newclosure $P3, $P4
$P5 = self.'_apply'($P1)
.tailcall self.'_many'($P3, $P5)
# }
.annotate 'line', 463

.end # firstAndRest


.sub '' :anon :subid('WSubId_6') :outer('WSubId_5')
.param pmc __ARG_1

.annotate 'line', 462
$P1 = find_lex '__WLEX_1'
# Body
# {
.tailcall __ARG_1.'_apply'($P1)
# }

.end # WSubId_6


.sub 'seq' :method

.annotate 'line', 465
# Body
# {
.annotate 'line', 466
# var xs: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 467
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 468
self.'_applyWithArgs'('exactly', $P2)
goto __label_0
__label_1: # endfor
.annotate 'line', 469
.return($P1)
# }
.annotate 'line', 470

.end # seq


.sub 'notLast' :subid('WSubId_7') :method

.annotate 'line', 472
.lex '__WLEX_1', $P1
# Body
# {
.annotate 'line', 473
# var rule: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 474
# var ans: $P2
$P2 = self.'_apply'($P1)
.annotate 'line', 475
.const 'Sub' $P4 = 'WSubId_8'
newclosure $P3, $P4
self.'_lookahead'($P3)
.annotate 'line', 476
.return($P2)
# }
.annotate 'line', 477

.end # notLast


.sub '' :anon :subid('WSubId_8') :outer('WSubId_7')
.param pmc __ARG_1

.annotate 'line', 475
$P1 = find_lex '__WLEX_1'
# Body
# {
.tailcall __ARG_1.'_apply'($P1)
# }

.end # WSubId_8


.sub '_genericMatch' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3
.param pmc __ARG_4

.annotate 'line', 479
# Body
# {
.annotate 'line', 480
.const 'Sub' $P5 = '_fail'
.annotate 'line', 481
.const 'Sub' $P6 = 'typeof'
.annotate 'line', 482
# var m: $P1
$P7 = $P6(self)
$P1 = $P7.'new'(__ARG_1 :named('input'))
.annotate 'line', 483
# try: create handler
new $P7, 'ExceptionHandler'
set_label $P7, __label_0
push_eh $P7
# try: begin
# {
.annotate 'line', 485
# var result: $P2
null $P2
.annotate 'line', 486
unless_null __ARG_3, __label_2
.annotate 'line', 487
$P2 = $P1.'_apply'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 489
$P2 = $P1.'_applyWithArgs'(__ARG_2, __ARG_3 :flat)
__label_3: # endif
.annotate 'line', 490
.return($P2)
# }
# try: end
pop_eh
goto __label_1
.annotate 'line', 483
# catch
__label_0:
.get_results($P3)
finalize $P3
pop_eh
# {
.annotate 'line', 492
getattribute $P8, $P3, 'payload'
issame $I1, $P8, $P5
unless $I1 goto __label_5
isnull $I1, __ARG_4
not $I1
__label_5:
unless $I1 goto __label_4
# {
.annotate 'line', 493
# var input: $P4
getattribute $P4, $P1, 'input'
.annotate 'line', 494
getattribute $P8, $P4, 'idx'
if_null $P8, __label_6
# {
__label_8: # while
.annotate 'line', 495
getattribute $P9, $P4, 'tl'
isnull $I1, $P9
not $I1
unless $I1 goto __label_9
getattribute $P10, $P4, 'tl'
getattribute $P11, $P10, 'idx'
isnull $I1, $P11
not $I1
__label_9:
unless $I1 goto __label_7
.annotate 'line', 496
getattribute $P4, $P4, 'tl'
goto __label_8
__label_7: # endwhile
.annotate 'line', 497
getattribute $P9, $P4, 'idx'
dec $P9
# }
__label_6: # endif
.annotate 'line', 499
getattribute $P10, $P4, 'idx'
.tailcall __ARG_4($P1, $P10)
# }
__label_4: # endif
.annotate 'line', 501
# pirop rethrow
rethrow $P3
# }
# catch end
__label_1:
# }
.annotate 'line', 503

.end # _genericMatch


.sub 'match' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param pmc __ARG_4 :optional

.annotate 'line', 505
# Body
# {
.annotate 'line', 506
.const 'Sub' $P1 = 'makeListOMInputStream'
.annotate 'line', 507
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
$P2 = $P1($P3)
.tailcall self.'_genericMatch'($P2, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 508

.end # match


.sub 'matchAll' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param pmc __ARG_4 :optional

.annotate 'line', 510
# Body
# {
.annotate 'line', 511
.const 'Sub' $P1 = 'makeListOMInputStream'
.annotate 'line', 512
$P2 = $P1(__ARG_1)
.tailcall self.'_genericMatch'($P2, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 513

.end # matchAll

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMeta' ]
.annotate 'line', 112
addattribute $P0, 'input'
.annotate 'line', 113
addattribute $P0, 'fail'
.annotate 'line', 114
addattribute $P0, 'stash'
.end
.namespace [ 'Parser' ]

.sub 'listOf' :subid('WSubId_9') :method

.annotate 'line', 517
.lex '__WLEX_1', $P1
.lex '__WLEX_2', $P2
# Body
# {
.annotate 'line', 518
# var rule: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 519
# var delim: $P2
$P2 = self.'_apply'('anything')
.annotate 'line', 520
.const 'Sub' $P4 = 'WSubId_10'
newclosure $P3, $P4
.annotate 'line', 528
.const 'Sub' $P6 = 'WSubId_12'
newclosure $P5, $P6
.annotate 'line', 520
.tailcall self.'_or'($P3, $P5)
# }
.annotate 'line', 530

.end # listOf


.sub '' :anon :subid('WSubId_10') :outer('WSubId_9')
.param pmc __ARG_1

.annotate 'line', 520
$P2 = find_lex '__WLEX_1'
$P3 = find_lex '__WLEX_2'
# Body
# {
.annotate 'line', 521
# var ans: $P1
$P1 = __ARG_1.'_apply'($P2)
.annotate 'line', 522
.const 'Sub' $P5 = 'WSubId_11'
newclosure $P4, $P5
.annotate 'line', 522
.tailcall __ARG_1.'_many'($P4, $P1)
# }
.annotate 'line', 527

.end # WSubId_10


.sub '' :anon :subid('WSubId_11') :outer('WSubId_10')
.param pmc __ARG_2

.annotate 'line', 522
$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.annotate 'line', 523
__ARG_2.'_applyWithArgs'('token', $P1)
.annotate 'line', 524
.tailcall __ARG_2.'_apply'($P2)
# }
.annotate 'line', 525

.end # WSubId_11


.sub '' :anon :subid('WSubId_12') :outer('WSubId_9')
.param pmc __ARG_3

.annotate 'line', 528
# Body
# {
root_new $P1, ['parrot';'ResizablePMCArray']
.return($P1)
# }

.end # WSubId_12


.sub 'token' :method

.annotate 'line', 531
# Body
# {
.annotate 'line', 532
# var cs: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 533
self.'_apply'('spaces')
.annotate 'line', 534
.tailcall self.'_applyWithArgs'('seq', $P1)
# }
.annotate 'line', 535

.end # token

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Parser' ]
.annotate 'line', 516
get_class $P1, [ 'OMeta' ]
addparent $P0, $P1
.end
# End generated code
