# Begin generated code

.namespace [ ]

.sub 'fail' :anon :immediate

.annotate 'file', 'ometa-base.winxed'
.annotate 'line', 3
# Body
# {
# predefined Error
.annotate 'line', 4
root_new $P1, ['parrot';'Exception']
$P1['message'] = 'failed match'
.return($P1)
# }
.annotate 'line', 5

.end # fail


.sub 'is_sequenceable' :anon
.param pmc __ARG_1

.annotate 'line', 7
# Body
# {
.annotate 'line', 8
isa $I1, __ARG_1, 'String'
if $I1 goto __label_2
isa $I1, __ARG_1, 'ResizablePMCArray'
__label_2:
unless $I1 goto __label_0
.annotate 'line', 9
.return(1)
goto __label_1
__label_0: # else
.annotate 'line', 11
.return(0)
__label_1: # endif
# }
.annotate 'line', 12

.end # is_sequenceable


.sub 'typeof' :anon
.param pmc __ARG_1

.annotate 'line', 14
# Body
# {
.annotate 'line', 15
# var t: $P1
null $P1
.annotate 'line', 16
# pirop typeof
typeof $P1, __ARG_1
.annotate 'line', 17
.return($P1)
# }
.annotate 'line', 18

.end # typeof

.namespace [ 'Failer' ]
.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Failer' ]
.annotate 'line', 21
addattribute $P0, 'used'
.end
.namespace [ 'OMInputStream' ]

.sub 'init_pmc' :method :vtable
.param pmc __ARG_1

.annotate 'line', 31
# Body
# {
.annotate 'line', 32
root_new $P2, ['parrot';'Hash']
setattribute self, 'memo', $P2
.annotate 'line', 33
getattribute $P1, self, 'tl'
if_null $P1, __label_0
# {
.annotate 'line', 34
getattribute $P3, self, 'tl'
getattribute $P4, $P3, 'lst'
setattribute self, 'lst', $P4
.annotate 'line', 35
getattribute $P4, self, 'tl'
getattribute $P5, $P4, 'idx'
setattribute self, 'idx', $P5
# }
__label_0: # endif
# }
.annotate 'line', 37

.end # init_pmc


.sub 'head' :method

.annotate 'line', 38
# Body
# {
getattribute $P1, self, 'hd'
.return($P1)
# }

.end # head


.sub 'tail' :method

.annotate 'line', 39
# Body
# {
getattribute $P1, self, 'tl'
.return($P1)
# }

.end # tail


.sub 'type' :method

.annotate 'line', 40
# Body
# {
.annotate 'line', 41
.const 'Sub' $P1 = 'typeof'
.annotate 'line', 42
getattribute $P2, self, 'lst'
.tailcall $P1($P2)
# }
.annotate 'line', 43

.end # type


.sub 'upTo' :method
.param pmc __ARG_1

.annotate 'line', 44
# Body
# {
.annotate 'line', 45
# var ans: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 46
# var curr: $P2
set $P2, self
__label_1: # while
.annotate 'line', 47
eq $P2, __ARG_1, __label_0
# {
.annotate 'line', 48
$P3 = $P2.'head'()
$P1.'push'($P3)
.annotate 'line', 49
$P2 = $P2.'tail'()
# }
goto __label_1
__label_0: # endwhile
.annotate 'line', 51
getattribute $P4, self, 'type'
set $S1, $P4
ne $S1, 'String', __label_2
.annotate 'line', 52
.tailcall $P1.'join'('')
goto __label_3
__label_2: # else
.annotate 'line', 54
.return($P1)
__label_3: # endif
# }
.annotate 'line', 55

.end # upTo

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMInputStream' ]
.annotate 'line', 25
addattribute $P0, 'memo'
.annotate 'line', 26
addattribute $P0, 'lst'
.annotate 'line', 27
addattribute $P0, 'idx'
.annotate 'line', 28
addattribute $P0, 'hd'
.annotate 'line', 29
addattribute $P0, 'tl'
.end
.namespace [ 'OMInputStreamEnd' ]

.sub 'head' :method

.annotate 'line', 59
# Body
# {
.annotate 'line', 60
.const 'Sub' $P1 = 'fail'
.annotate 'line', 61
throw $P1
# }
.annotate 'line', 62

.end # head


.sub 'tail' :method

.annotate 'line', 63
# Body
# {
.annotate 'line', 64
.const 'Sub' $P1 = 'fail'
.annotate 'line', 65
throw $P1
# }
.annotate 'line', 66

.end # tail

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMInputStreamEnd' ]
.annotate 'line', 58
get_class $P1, [ 'OMInputStream' ]
addparent $P0, $P1
.end
.namespace [ 'ListOMInputStream' ]

.sub 'init_pmc' :method :vtable
.param pmc __ARG_1

.annotate 'line', 70
# Body
# {
.annotate 'line', 71
getattribute $P3, self, 'lst'
getattribute $P4, self, 'idx'
$P2 = $P3[$P4]
setattribute self, 'hd', $P2
# }
.annotate 'line', 72

.end # init_pmc


.sub 'head' :method

.annotate 'line', 73
# Body
# {
getattribute $P1, self, 'hd'
.return($P1)
# }

.end # head


.sub 'tail' :method

.annotate 'line', 74
# Body
# {
.annotate 'line', 75
.const 'Sub' $P1 = 'makeListOMInputStream'
.annotate 'line', 76
getattribute $P2, self, 'tl'
unless_null $P2, __label_0
.annotate 'line', 77
getattribute $P5, self, 'lst'
getattribute $P6, self, 'idx'
set $I2, $P6
add $I1, $I2, 1
$P4 = $P1($P5, $I1)
setattribute self, 'tl', $P4
__label_0: # endif
.annotate 'line', 78
getattribute $P2, self, 'tl'
.return($P2)
# }
.annotate 'line', 79

.end # tail

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'ListOMInputStream' ]
.annotate 'line', 69
get_class $P1, [ 'OMInputStream' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'makeListOMInputStream' :anon
.param pmc __ARG_1
.param int __ARG_2 :optional

.annotate 'line', 82
# Body
# {
.annotate 'line', 83
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
.annotate 'line', 85
# var obj: $P2
$P2 = $P1.'new'(__ARG_1 :named('lst'), __ARG_2 :named('idx'))
.annotate 'line', 86
.return($P2)
# }
.annotate 'line', 87

.end # makeListOMInputStream

.namespace [ 'OMInputStreamProxy' ]

.sub 'head' :method

.annotate 'line', 92
# Body
# {
getattribute $P1, self, 'target'
.tailcall $P1.'head'()
# }

.end # head


.sub 'type' :method

.annotate 'line', 93
# Body
# {
getattribute $P1, self, 'target'
.tailcall $P1.'type'()
# }

.end # type


.sub 'upTo' :method

.annotate 'line', 94
# Body
# {
getattribute $P1, self, 'target'
.tailcall $P1.'upTo'()
# }

.end # upTo


.sub 'tail' :method

.annotate 'line', 95
# Body
# {
.annotate 'line', 96
# var tail: $P1
getattribute $P3, self, 'target'
$P1 = $P3.'tail'()
.annotate 'line', 97
# var proxy: $P2
root_new $P3, ['parrot';'Hash']
getattribute $P5, self, 'target'
$P4 = $P5.'tail'()
$P3['target'] = $P4
new $P2, [ 'OMInputStreamProxy' ], $P3
.annotate 'line', 98
.return($P2)
# }
.annotate 'line', 99

.end # tail

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMInputStreamProxy' ]
.annotate 'line', 90
get_class $P1, [ 'OMInputStream' ]
addparent $P0, $P1
.annotate 'line', 91
addattribute $P0, 'target'
.end
.namespace [ 'OMeta' ]

.sub 'init' :method :vtable

.annotate 'line', 107
# Body
# {
.annotate 'line', 108
.const 'Sub' $P1 = 'fail'
.annotate 'line', 109
setattribute self, 'fail', $P1
# }
.annotate 'line', 110

.end # init


.sub 'init_pmc' :method :vtable
.param pmc __ARG_1

.annotate 'line', 112
# Body
# {
.annotate 'line', 113
.const 'Sub' $P1 = 'fail'
.annotate 'line', 114
setattribute self, 'fail', $P1
.annotate 'line', 115
root_new $P3, ['parrot';'Hash']
setattribute self, 'stash', $P3
# }
.annotate 'line', 116

.end # init_pmc


.sub 'get_pmc_keyed' :method :vtable
.param pmc __ARG_1

.annotate 'line', 118
# Body
# {
.annotate 'line', 119
getattribute $P2, self, 'stash'
$P1 = $P2[__ARG_1]
.return($P1)
# }
.annotate 'line', 120

.end # get_pmc_keyed


.sub 'get_pmc_keyed_str' :method :vtable
.param string __ARG_1

.annotate 'line', 122
# Body
# {
.annotate 'line', 123
getattribute $P2, self, 'stash'
$P1 = $P2[__ARG_1]
.return($P1)
# }
.annotate 'line', 124

.end # get_pmc_keyed_str


.sub 'get_string_keyed' :method :vtable
.param pmc __ARG_1

.annotate 'line', 126
# Body
# {
.annotate 'line', 127
getattribute $P2, self, 'stash'
$P1 = $P2[__ARG_1]
.return($P1)
# }
.annotate 'line', 128

.end # get_string_keyed


.sub 'get_integer_keyed' :method :vtable
.param pmc __ARG_1

.annotate 'line', 130
# Body
# {
# predefined int
.annotate 'line', 131
getattribute $P1, self, 'stash'
$I1 = $P1[__ARG_1]
.return($I1)
# }
.annotate 'line', 132

.end # get_integer_keyed


.sub 'set_pmc_keyed' :method :vtable
.param pmc __ARG_1
.param pmc __ARG_2

.annotate 'line', 134
# Body
# {
.annotate 'line', 135
getattribute $P1, self, 'stash'
$P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 136

.end # set_pmc_keyed


.sub 'set_pmc_keyed_str' :method :vtable
.param string __ARG_1
.param pmc __ARG_2

.annotate 'line', 138
# Body
# {
.annotate 'line', 139
getattribute $P1, self, 'stash'
$P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 140

.end # set_pmc_keyed_str


.sub 'set_string_keyed' :method :vtable
.param pmc __ARG_1
.param string __ARG_2

.annotate 'line', 142
# Body
# {
.annotate 'line', 143
getattribute $P1, self, 'stash'
$P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 144

.end # set_string_keyed


.sub 'set_integer_keyed' :method :vtable
.param pmc __ARG_1
.param int __ARG_2

.annotate 'line', 146
# Body
# {
.annotate 'line', 147
getattribute $P1, self, 'stash'
$P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 148

.end # set_integer_keyed


.sub '_apply' :method
.param string __ARG_1

.annotate 'line', 150
# Body
# {
.annotate 'line', 151
.const 'Sub' $P10 = 'fail'
.annotate 'line', 152
# var memoRec: $P1
getattribute $P11, self, 'input'
getattribute $P12, $P11, 'memo'
$P1 = $P12[__ARG_1]
.annotate 'line', 153
unless_null $P1, __label_0
# {
.annotate 'line', 154
# var origInput: $P2
getattribute $P2, self, 'input'
.annotate 'line', 155
# var failer: $P3
new $P3, [ 'Failer' ]
.annotate 'line', 156
# var method: $P4
null $P4
.annotate 'line', 158
# try: create handler
new $P11, 'ExceptionHandler'
set_label $P11, __label_2
push_eh $P11
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
.annotate 'line', 159
# predefined die
die $S1
# }
# catch end
__label_3:
.annotate 'line', 161
getattribute $P12, self, 'input'
getattribute $P13, $P12, 'memo'
$P13[__ARG_1] = $P3
.annotate 'line', 162
# var ans: $P6
root_new $P13, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P6 = self.$P4($P13 :flat)
.annotate 'line', 163
getattribute $P14, $P2, 'memo'
.annotate 'line', 164
root_new $P1, ['parrot';'Hash']
$P1['ans'] = $P6
getattribute $P15, self, 'input'
$P1['nextInput'] = $P15
.annotate 'line', 163
$P14[__ARG_1] = $P1
.annotate 'line', 166
getattribute $P15, $P3, 'used'
if_null $P15, __label_4
unless $P15 goto __label_4
# {
.annotate 'line', 167
# var sentinel: $P7
getattribute $P7, self, 'input'
__label_6: # Infinite loop
.annotate 'line', 168
# {
.annotate 'line', 169
# try: create handler
new $P16, 'ExceptionHandler'
set_label $P16, __label_7
push_eh $P16
# try: begin
# {
.annotate 'line', 170
setattribute self, 'input', $P2
.annotate 'line', 171
# var ans: $P8
root_new $P16, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P8 = self.$P4($P16 :flat)
.annotate 'line', 172
getattribute $P18, self, 'input'
ne_addr $P18, $P7, __label_9
.annotate 'line', 173
throw $P10
__label_9: # endif
.annotate 'line', 174
$P1['ans'] = $P8
.annotate 'line', 175
getattribute $P18, self, 'input'
$P1['nextInput'] = $P18
# }
# try: end
pop_eh
goto __label_8
.annotate 'line', 169
# catch
__label_7:
.get_results($P9)
finalize $P9
pop_eh
# {
.annotate 'line', 177
eq_addr $P9, $P10, __label_10
.annotate 'line', 178
throw $P9
__label_10: # endif
goto __label_5 # break
.annotate 'line', 179
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
.annotate 'line', 183
isa $I1, $P1, 'Failer'
unless $I1 goto __label_11
# {
box $P19, 1
.annotate 'line', 184
setattribute $P1, 'used', $P19
.annotate 'line', 185
throw $P10
# }
__label_11: # endif
__label_1: # endif
.annotate 'line', 187
$P20 = $P1['nextInput']
setattribute self, 'input', $P20
$P20 = $P1['ans']
.annotate 'line', 188
.return($P20)
# }
.annotate 'line', 189

.end # _apply


.sub '_applyWithArgs' :method
.param string __ARG_1
.param pmc __ARG_2 :slurpy

.annotate 'line', 191
# Body
# {
# for loop
.annotate 'line', 192
# int i: $I1
# predefined elements
elements $I2, __ARG_2
sub $I1, $I2, 1
__label_2: # for condition
lt $I1, 0, __label_1
.annotate 'line', 193
$P2 = __ARG_2[$I1]
self.'_prependInput'($P2)
__label_0: # for iteration
set $I3, $I1
.annotate 'line', 192
dec $I1
goto __label_2
__label_1: # for end
.annotate 'line', 194
# var method: $P1
# predefined find_method
find_method $P1, self, __ARG_1
.annotate 'line', 195
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P2 = self.$P1($P3 :flat)
.return($P2)
# }
.annotate 'line', 196

.end # _applyWithArgs


.sub '_superApplyWithArgs' :method
.param string __ARG_1
.param string __ARG_2
.param pmc __ARG_3 :slurpy

.annotate 'line', 198
# Body
# {
# for loop
.annotate 'line', 199
# int i: $I1
# predefined elements
elements $I2, __ARG_3
sub $I1, $I2, 1
__label_2: # for condition
lt $I1, 0, __label_1
.annotate 'line', 200
$P3 = __ARG_3[$I1]
self.'_prependInput'($P3)
__label_0: # for iteration
set $I3, $I1
.annotate 'line', 199
dec $I1
goto __label_2
__label_1: # for end
.annotate 'line', 201
# var klass: $P1
# predefined get_class
get_class $P1, __ARG_1
.annotate 'line', 202
# var method: $P2
$P2 = $P1.'find_method'(__ARG_2)
.annotate 'line', 203
root_new $P4, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P3 = self.$P2($P4 :flat)
.return($P3)
# }
.annotate 'line', 204

.end # _superApplyWithArgs


.sub '_prependInput' :method
.param pmc __ARG_1

.annotate 'line', 206
# Body
# {
.annotate 'line', 207
root_new $P3, ['parrot';'Hash']
$P3['hd'] = __ARG_1
getattribute $P4, self, 'input'
$P3['tl'] = $P4
new $P2, [ 'OMInputStream' ], $P3
setattribute self, 'input', $P2
# }
.annotate 'line', 208

.end # _prependInput


.sub 'memoizeParameterizedRules' :method

.annotate 'line', 210
# Body
# {
# predefined die
.annotate 'line', 211
die "TODO"
# }
.annotate 'line', 212

.end # memoizeParameterizedRules


.sub '_pred' :method
.param int __ARG_1

.annotate 'line', 214
# Body
# {
.annotate 'line', 215
.const 'Sub' $P1 = 'fail'
unless __ARG_1 goto __label_0
.annotate 'line', 217
.return(1)
__label_0: # endif
.annotate 'line', 218
throw $P1
# }
.annotate 'line', 219

.end # _pred


.sub '_not' :method
.param pmc __ARG_1

.annotate 'line', 221
# Body
# {
.annotate 'line', 222
.const 'Sub' $P3 = 'fail'
.annotate 'line', 223
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 224
# try: create handler
new $P4, 'ExceptionHandler'
set_label $P4, __label_0
push_eh $P4
# try: begin
# {
root_new $P5, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P7 = self.__ARG_1($P5 :flat)
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
.annotate 'line', 226
eq_addr $P2, $P3, __label_2
.annotate 'line', 227
throw $P2
__label_2: # endif
.annotate 'line', 228
setattribute self, 'input', $P1
.annotate 'line', 229
.return(1)
# }
# catch end
__label_1:
.annotate 'line', 231
throw $P3
# }
.annotate 'line', 232

.end # _not


.sub '_lookahead' :method
.param pmc __ARG_1

.annotate 'line', 234
# Body
# {
.annotate 'line', 235
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 236
# var result: $P2
root_new $P3, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P2 = self.__ARG_1($P3 :flat)
.annotate 'line', 237
setattribute self, 'input', $P1
.annotate 'line', 238
.return($P2)
# }
.annotate 'line', 239

.end # _lookahead


.sub '_or' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 241
# Body
# {
.annotate 'line', 242
.const 'Sub' $P4 = 'fail'
.annotate 'line', 243
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 244
iter $P5, __ARG_1
set $P5, 0
__label_0: # for iteration
unless $P5 goto __label_1
shift $P2, $P5
# {
.annotate 'line', 245
# try: create handler
new $P6, 'ExceptionHandler'
set_label $P6, __label_2
push_eh $P6
# try: begin
# {
.annotate 'line', 246
setattribute self, 'input', $P1
.annotate 'line', 247
root_new $P7, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P6 = self.$P2($P7 :flat)
.return($P6)
# }
# try: end
pop_eh
goto __label_3
.annotate 'line', 245
# catch
__label_2:
.get_results($P3)
finalize $P3
pop_eh
# {
.annotate 'line', 249
eq_addr $P3, $P4, __label_4
.annotate 'line', 250
throw $P3
__label_4: # endif
# }
# catch end
__label_3:
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 253
throw $P4
# }
.annotate 'line', 254

.end # _or


.sub '_xor' :method
.param string __ARG_1
.param pmc __ARG_2 :slurpy

.annotate 'line', 256
# Body
# {
.annotate 'line', 257
.const 'Sub' $P6 = 'fail'
.annotate 'line', 258
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 259
# var ans: $P2
null $P2
.annotate 'line', 260
# var newInput: $P3
null $P3
.annotate 'line', 261
iter $P7, __ARG_2
set $P7, 0
__label_0: # for iteration
unless $P7 goto __label_1
shift $P4, $P7
# {
.annotate 'line', 262
# try: create handler
new $P8, 'ExceptionHandler'
set_label $P8, __label_2
push_eh $P8
# try: begin
# {
.annotate 'line', 263
setattribute self, 'input', $P1
.annotate 'line', 264
root_new $P8, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P2 = self.$P4($P8 :flat)
if_null $P3, __label_4
unless $P3 goto __label_4
concat $S1, 'more than one choice matched by "exclusive-OR" in ', __ARG_1
.annotate 'line', 266
# predefined die
die $S1
__label_4: # endif
.annotate 'line', 267
getattribute $P3, self, 'input'
# }
# try: end
pop_eh
goto __label_3
.annotate 'line', 262
# catch
__label_2:
.get_results($P5)
finalize $P5
pop_eh
# {
.annotate 'line', 269
eq_addr $P5, $P6, __label_5
.annotate 'line', 270
throw $P5
__label_5: # endif
# }
# catch end
__label_3:
# }
goto __label_0
__label_1: # endfor
if_null $P3, __label_6
unless $P3 goto __label_6
.annotate 'line', 273
# {
.annotate 'line', 274
setattribute self, 'input', $P3
.annotate 'line', 275
.return($P2)
# }
goto __label_7
__label_6: # else
# {
.annotate 'line', 277
throw $P6
# }
__label_7: # endif
# }
.annotate 'line', 279

.end # _xor


.sub 'disableXORs' :method

.annotate 'line', 281
# Body
# {
# predefined die
.annotate 'line', 282
die "TODO"
# }
.annotate 'line', 283

.end # disableXORs


.sub '_opt' :method
.param pmc __ARG_1

.annotate 'line', 285
# Body
# {
.annotate 'line', 286
.const 'Sub' $P4 = 'fail'
.annotate 'line', 287
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 288
# var ans: $P2
null $P2
.annotate 'line', 289
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
.annotate 'line', 291
eq_addr $P3, $P4, __label_2
.annotate 'line', 292
throw $P3
__label_2: # endif
.annotate 'line', 293
setattribute self, 'input', $P1
# }
# catch end
__label_1:
.annotate 'line', 295
.return($P2)
# }
.annotate 'line', 296

.end # _opt


.sub '_many' :method
.param pmc __ARG_1
.param pmc __ARG_2 :optional
.param int __ARG_3 :opt_flag

.annotate 'line', 298
# Body
# {
.annotate 'line', 299
.const 'Sub' $P4 = 'fail'
.annotate 'line', 300
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
.annotate 'line', 301
# {
.annotate 'line', 302
# var origInput: $P2
getattribute $P2, self, 'input'
.annotate 'line', 303
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
.annotate 'line', 305
eq_addr $P3, $P4, __label_6
.annotate 'line', 306
throw $P3
__label_6: # endif
.annotate 'line', 307
setattribute self, 'input', $P2
.annotate 'line', 308
.return($P1)
# }
# catch end
__label_5:
# }
goto __label_3
__label_2: # Infinite loop end
# }
.annotate 'line', 311

.end # _many


.sub '_many1' :method
.param pmc __ARG_1

.annotate 'line', 313
# Body
# {
.annotate 'line', 314
root_new $P2, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P1 = self.__ARG_1($P2 :flat)
.tailcall self.'_many'(__ARG_1, $P1)
# }
.annotate 'line', 315

.end # _many1


.sub '_form' :method
.param pmc __ARG_1

.annotate 'line', 317
# Body
# {
.annotate 'line', 318
.const 'Sub' $P4 = 'fail'
.annotate 'line', 319
.const 'Sub' $P5 = 'is_sequenceable'
.annotate 'line', 320
.const 'Sub' $P6 = 'makeListOMInputStream'
.annotate 'line', 321
# var v: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 322
$P7 = $P5($P1)
isfalse $I1, $P7
unless $I1 goto __label_0
.annotate 'line', 323
throw $P4
__label_0: # endif
.annotate 'line', 324
# var origInput: $P2
getattribute $P2, self, 'input'
# {
.annotate 'line', 326
$P8 = $P6($P1)
setattribute self, 'input', $P8
.annotate 'line', 327
# var r: $P3
root_new $P8, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P3 = self.__ARG_1($P8 :flat)
.annotate 'line', 328
self.'_apply'('end')
# }
.annotate 'line', 330
setattribute self, 'input', $P2
.annotate 'line', 331
.return($P1)
# }
.annotate 'line', 332

.end # _form


.sub '_consumedBy' :method
.param pmc __ARG_1

.annotate 'line', 334
# Body
# {
.annotate 'line', 335
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 336
root_new $P2, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P4 = self.__ARG_1($P2 :flat)
.annotate 'line', 337
getattribute $P2, self, 'input'
.tailcall $P1.'upTo'($P2)
# }
.annotate 'line', 338

.end # _consumedBy


.sub '_idxConsumedBy' :method
.param pmc __ARG_1

.annotate 'line', 340
# Body
# {
.annotate 'line', 341
# var origInput: $P1
getattribute $P1, self, 'input'
.annotate 'line', 342
root_new $P2, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
$P4 = self.__ARG_1($P2 :flat)
.annotate 'line', 343
root_new $P2, ['parrot';'Hash']
.annotate 'line', 344
getattribute $P3, $P1, 'idx'
$P2['fromIdx'] = $P3
.annotate 'line', 345
getattribute $P4, self, 'input'
getattribute $P5, $P4, 'idx'
$P2['toIdx'] = $P5
.annotate 'line', 343
.return($P2)
# }
.annotate 'line', 347

.end # _idxConsumedBy


.sub '_interleave' :method
.param pmc __ARG_1 :slurpy

.annotate 'line', 349
# Body
# {
# predefined die
.annotate 'line', 350
die "TODO"
# }
.annotate 'line', 351

.end # _interleave


.sub '_currIdx' :method

.annotate 'line', 353
# Body
# {
getattribute $P1, self, 'input'
getattribute $P2, $P1, 'idx'
.return($P2)
# }

.end # _currIdx


.sub 'anything' :method

.annotate 'line', 355
# Body
# {
.annotate 'line', 356
# var ans: $P1
getattribute $P2, self, 'input'
$P1 = $P2.'head'()
.annotate 'line', 357
getattribute $P4, self, 'input'
$P3 = $P4.'tail'()
setattribute self, 'input', $P3
.annotate 'line', 358
.return($P1)
# }
.annotate 'line', 359

.end # anything


.sub 'end' :subid('WSubId_1') :method

.annotate 'line', 361
# Body
# {
.annotate 'line', 362
.const 'Sub' $P2 = 'WSubId_2'
newclosure $P1, $P2
.tailcall self.'_not'($P1)
# }
.annotate 'line', 363

.end # end


.sub '' :anon :subid('WSubId_2') :outer('WSubId_1')
.param pmc __ARG_1

.annotate 'line', 362
# Body
# {
__ARG_1.'_apply'('anything')
# }

.end # WSubId_2


.sub 'pos' :method

.annotate 'line', 365
# Body
# {
getattribute $P1, self, 'input'
getattribute $P2, $P1, 'idx'
.return($P2)
# }

.end # pos


.sub 'empty' :method

.annotate 'line', 367
# Body
# {
.return(1)
# }

.end # empty


.sub 'apply' :method

.annotate 'line', 369
# Body
# {
.annotate 'line', 370
$P1 = self.'_apply'('anything')
.tailcall self.'_apply'($P1)
# }
.annotate 'line', 371

.end # apply


.sub 'foreign' :method

.annotate 'line', 373
# Body
# {
.annotate 'line', 374
# var g: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 375
# var r: $P2
$P2 = self.'_apply'('anything')
.annotate 'line', 376
# var proxy: $P3
root_new $P6, ['parrot';'Hash']
getattribute $P7, self, 'input'
$P6['target'] = $P7
new $P3, [ 'OMInputStreamProxy' ], $P6
.annotate 'line', 377
# var gi: $P4
set $S1, $P1
# predefined get_class
get_class $P6, $S1
$P4 = $P6.'new'($P3 :named('input'))
.annotate 'line', 378
# var ans: $P5
$P5 = $P4.'_apply'($P2)
.annotate 'line', 379
getattribute $P8, $P4, 'input'
getattribute $P9, $P8, 'target'
setattribute self, 'input', $P9
.annotate 'line', 380
.return($P5)
# }
.annotate 'line', 381

.end # foreign


.sub 'exactly' :method

.annotate 'line', 383
# Body
# {
.annotate 'line', 384
.const 'Sub' $P2 = 'fail'
.annotate 'line', 385
# var wanted: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 386
$P3 = self.'_apply'('anything')
ne $P3, $P1, __label_0
.annotate 'line', 387
.return($P1)
__label_0: # endif
.annotate 'line', 388
throw $P2
# }
.annotate 'line', 389

.end # exactly


.sub 'null' :method

.annotate 'line', 391
# Body
# {
.annotate 'line', 392
# var ans: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 393
isnull $I1, $P1
self.'_pred'($I1)
.annotate 'line', 394
.return($P1)
# }
.annotate 'line', 395

.end # null


.sub 'number' :method

.annotate 'line', 397
# Body
# {
.annotate 'line', 398
# var ans: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 399
isa $I1, $P1, 'Number'
self.'_pred'($I1)
.annotate 'line', 400
.return($P1)
# }
.annotate 'line', 401

.end # number


.sub 'string' :method

.annotate 'line', 403
# Body
# {
.annotate 'line', 404
# var ans: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 405
isa $I1, $P1, 'String'
self.'_pred'($I1)
.annotate 'line', 406
.return($P1)
# }
.annotate 'line', 407

.end # string


.sub 'char' :method

.annotate 'line', 409
# Body
# {
.annotate 'line', 410
# var ans: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 411
isa $I1, $P1, 'String'
unless $I1 goto __label_0
set $S1, $P1
# predefined length
length $I2, $S1
iseq $I1, $I2, 1
__label_0:
self.'_pred'($I1)
.annotate 'line', 412
.return($P1)
# }
.annotate 'line', 413

.end # char


.sub '_cclass_char' :method
.param int __ARG_1

.annotate 'line', 415
# Body
# {
.annotate 'line', 416
# string c: $S1
$P1 = self.'_apply'('char')
null $S1
if_null $P1, __label_0
set $S1, $P1
__label_0:
.annotate 'line', 417
# int pred: $I1
null $I1
.annotate 'line', 418
# pirop is_cclass
is_cclass $I1, __ARG_1, $S1, 0
.annotate 'line', 419
self.'_pred'($I1)
.annotate 'line', 420
.return($S1)
# }
.annotate 'line', 421

.end # _cclass_char


.sub 'space' :method

.annotate 'line', 423
# Body
# {
.tailcall self.'_cclass_char'(32)
# }

.end # space


.sub 'spaces' :subid('WSubId_3') :method

.annotate 'line', 425
# Body
# {
.annotate 'line', 426
.const 'Sub' $P2 = 'WSubId_4'
newclosure $P1, $P2
.tailcall self.'_many'($P1)
# }
.annotate 'line', 427

.end # spaces


.sub '' :anon :subid('WSubId_4') :outer('WSubId_3')
.param pmc __ARG_1

.annotate 'line', 426
# Body
# {
.tailcall __ARG_1.'_apply'('space')
# }

.end # WSubId_4


.sub 'digit' :method

.annotate 'line', 429
# Body
# {
.tailcall self.'_cclass_char'(8)
# }

.end # digit


.sub 'hexdigit' :method

.annotate 'line', 431
# Body
# {
.tailcall self.'_cclass_char'(16)
# }

.end # hexdigit


.sub 'lower' :method

.annotate 'line', 433
# Body
# {
.tailcall self.'_cclass_char'(2)
# }

.end # lower


.sub 'upper' :method

.annotate 'line', 435
# Body
# {
.tailcall self.'_cclass_char'(1)
# }

.end # upper


.sub 'letter' :method

.annotate 'line', 437
# Body
# {
.tailcall self.'_cclass_char'(4)
# }

.end # letter


.sub 'letterOrDigit' :method

.annotate 'line', 439
# Body
# {
.tailcall self.'_cclass_char'(2048)
# }

.end # letterOrDigit


.sub 'firstAndRest' :subid('WSubId_5') :method

.annotate 'line', 441
.lex '__WLEX_1', $P2
# Body
# {
.annotate 'line', 442
# var first: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 443
# var rest: $P2
$P2 = self.'_apply'('anything')
.annotate 'line', 444
.const 'Sub' $P4 = 'WSubId_6'
newclosure $P3, $P4
$P5 = self.'_apply'($P1)
.tailcall self.'_many'($P3, $P5)
# }
.annotate 'line', 445

.end # firstAndRest


.sub '' :anon :subid('WSubId_6') :outer('WSubId_5')
.param pmc __ARG_1

.annotate 'line', 444
$P1 = find_lex '__WLEX_1'
# Body
# {
.tailcall __ARG_1.'_apply'($P1)
# }

.end # WSubId_6


.sub 'seq' :method

.annotate 'line', 447
# Body
# {
.annotate 'line', 448
# var xs: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 449
iter $P3, $P1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
.annotate 'line', 450
self.'_applyWithArgs'('exactly', $P2)
goto __label_0
__label_1: # endfor
.annotate 'line', 451
.return($P1)
# }
.annotate 'line', 452

.end # seq


.sub 'notLast' :subid('WSubId_7') :method

.annotate 'line', 454
.lex '__WLEX_1', $P1
# Body
# {
.annotate 'line', 455
# var rule: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 456
# var ans: $P2
$P2 = self.'_apply'($P1)
.annotate 'line', 457
.const 'Sub' $P4 = 'WSubId_8'
newclosure $P3, $P4
self.'_lookahead'($P3)
.annotate 'line', 458
.return($P2)
# }
.annotate 'line', 459

.end # notLast


.sub '' :anon :subid('WSubId_8') :outer('WSubId_7')
.param pmc __ARG_1

.annotate 'line', 457
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

.annotate 'line', 461
# Body
# {
.annotate 'line', 462
.const 'Sub' $P5 = 'fail'
.annotate 'line', 463
.const 'Sub' $P6 = 'typeof'
.annotate 'line', 464
# var m: $P1
$P7 = $P6(self)
$P1 = $P7.'new'(__ARG_1 :named('input'), $P5 :named('fail'))
.annotate 'line', 465
# try: create handler
new $P7, 'ExceptionHandler'
set_label $P7, __label_0
push_eh $P7
# try: begin
# {
.annotate 'line', 467
# var result: $P2
null $P2
.annotate 'line', 468
unless_null __ARG_3, __label_2
.annotate 'line', 469
$P2 = $P1.'_apply'(__ARG_2)
goto __label_3
__label_2: # else
.annotate 'line', 471
$P2 = $P1.'_applyWithArgs'(__ARG_2, __ARG_3 :flat)
__label_3: # endif
.annotate 'line', 472
.return($P2)
# }
# try: end
pop_eh
goto __label_1
.annotate 'line', 465
# catch
__label_0:
.get_results($P3)
finalize $P3
pop_eh
# {
.annotate 'line', 474
issame $I1, $P3, $P5
unless $I1 goto __label_5
isnull $I1, __ARG_4
not $I1
__label_5:
unless $I1 goto __label_4
# {
.annotate 'line', 475
# var input: $P4
getattribute $P4, $P1, 'input'
.annotate 'line', 476
getattribute $P8, $P4, 'idx'
if_null $P8, __label_6
# {
__label_8: # while
.annotate 'line', 477
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
.annotate 'line', 478
getattribute $P4, $P4, 'tl'
goto __label_8
__label_7: # endwhile
.annotate 'line', 479
getattribute $P8, $P4, 'idx'
dec $P8
# }
__label_6: # endif
.annotate 'line', 481
getattribute $P9, $P4, 'idx'
.tailcall __ARG_4($P1, $P9)
# }
__label_4: # endif
.annotate 'line', 483
throw $P3
# }
# catch end
__label_1:
# }
.annotate 'line', 485

.end # _genericMatch


.sub 'match' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param pmc __ARG_4 :optional

.annotate 'line', 487
# Body
# {
.annotate 'line', 488
.const 'Sub' $P1 = 'makeListOMInputStream'
.annotate 'line', 489
root_new $P3, ['parrot';'ResizablePMCArray']
$P3.'push'(__ARG_1)
$P2 = $P1($P3)
.tailcall self.'_genericMatch'($P2, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 490

.end # match


.sub 'matchAll' :method
.param pmc __ARG_1
.param pmc __ARG_2
.param pmc __ARG_3 :optional
.param pmc __ARG_4 :optional

.annotate 'line', 492
# Body
# {
.annotate 'line', 493
.const 'Sub' $P1 = 'makeListOMInputStream'
.annotate 'line', 494
$P2 = $P1(__ARG_1)
.tailcall self.'_genericMatch'($P2, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 495

.end # matchAll

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMeta' ]
.annotate 'line', 103
addattribute $P0, 'input'
.annotate 'line', 104
addattribute $P0, 'fail'
.annotate 'line', 105
addattribute $P0, 'stash'
.end
.namespace [ 'Parser' ]

.sub 'listOf' :subid('WSubId_9') :method

.annotate 'line', 499
.lex '__WLEX_1', $P1
.lex '__WLEX_2', $P2
# Body
# {
.annotate 'line', 500
# var rule: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 501
# var delim: $P2
$P2 = self.'_apply'('anything')
.annotate 'line', 502
.const 'Sub' $P4 = 'WSubId_10'
newclosure $P3, $P4
.annotate 'line', 510
.const 'Sub' $P6 = 'WSubId_12'
newclosure $P5, $P6
.annotate 'line', 502
.tailcall self.'_or'($P3, $P5)
# }
.annotate 'line', 512

.end # listOf


.sub '' :anon :subid('WSubId_10') :outer('WSubId_9')
.param pmc __ARG_1

.annotate 'line', 502
$P2 = find_lex '__WLEX_1'
$P3 = find_lex '__WLEX_2'
# Body
# {
.annotate 'line', 503
# var ans: $P1
$P1 = __ARG_1.'_apply'($P2)
.annotate 'line', 504
.const 'Sub' $P5 = 'WSubId_11'
newclosure $P4, $P5
.annotate 'line', 504
.tailcall __ARG_1.'_many'($P4, $P1)
# }
.annotate 'line', 509

.end # WSubId_10


.sub '' :anon :subid('WSubId_11') :outer('WSubId_10')
.param pmc __ARG_2

.annotate 'line', 504
$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.annotate 'line', 505
__ARG_2.'_applyWithArgs'('token', $P1)
.annotate 'line', 506
.tailcall __ARG_2.'_apply'($P2)
# }
.annotate 'line', 507

.end # WSubId_11


.sub '' :anon :subid('WSubId_12') :outer('WSubId_9')
.param pmc __ARG_3

.annotate 'line', 510
# Body
# {
root_new $P1, ['parrot';'ResizablePMCArray']
.return($P1)
# }

.end # WSubId_12


.sub 'token' :method

.annotate 'line', 513
# Body
# {
.annotate 'line', 514
# var cs: $P1
$P1 = self.'_apply'('anything')
.annotate 'line', 515
self.'_apply'('spaces')
.annotate 'line', 516
.tailcall self.'_applyWithArgs'('seq', $P1)
# }
.annotate 'line', 517

.end # token

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'Parser' ]
.annotate 'line', 498
get_class $P1, [ 'OMeta' ]
addparent $P0, $P1
.end
# End generated code
