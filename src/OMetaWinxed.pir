# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ ]

.sub '_fail' :anon :immediate
# Body
# {
.annotate 'file', 'ometa-base.winxed'
.annotate 'line', 4
# var fail: $P1
    box $P1, "match failed"
.annotate 'line', 5
    .return($P1)
# }
.annotate 'line', 6

.end # _fail


.sub 'fail' :anon
# Body
# {
.annotate 'line', 9
.const 'Sub' WSubId_1 = '_fail'
.annotate 'line', 10
# var e: $P1
    new $P1, [ 'Exception' ]
.annotate 'line', 11
    setattribute $P1, 'message', WSubId_1
.annotate 'line', 12
    setattribute $P1, 'payload', WSubId_1
.annotate 'line', 13
    .return($P1)
# }
.annotate 'line', 14

.end # fail


.sub 'is_sequenceable' :anon
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 17
    isa $I1, __ARG_1, [ 'String' ]
    if $I1 goto __label_3
    isa $I1, __ARG_1, [ 'ResizablePMCArray' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 18
    .return(1)
    goto __label_2
  __label_1: # else
.annotate 'line', 20
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 21

.end # is_sequenceable

.namespace [ 'Failer' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Failer' ]
.annotate 'line', 24
    addattribute $P0, 'used'
.end
.namespace [ 'OMInputStream' ]

.sub 'init_pmc' :method :vtable
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 35
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'memo', $P2
.annotate 'line', 36
    getattribute $P1, self, 'tl'
    if_null $P1, __label_1
# {
.annotate 'line', 37
    getattribute $P4, self, 'tl'
    getattribute $P3, $P4, 'lst'
    setattribute self, 'lst', $P3
.annotate 'line', 38
    getattribute $P3, self, 'tl'
    getattribute $P2, $P3, 'idx'
    setattribute self, 'idx', $P2
# }
  __label_1: # endif
# }
.annotate 'line', 40

.end # init_pmc


.sub 'head' :method
# Body
# {
.annotate 'line', 41
    getattribute $P1, self, 'hd'
    .return($P1)
# }

.end # head


.sub 'tail' :method
# Body
# {
.annotate 'line', 42
    getattribute $P1, self, 'tl'
    .return($P1)
# }

.end # tail


.sub 'type' :method
# Body
# {
.annotate 'line', 44
    getattribute $P2, self, 'lst'
# predefined typeof
    typeof $P1, $P2
    .return($P1)
# }
.annotate 'line', 45

.end # type


.sub 'upTo' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 47
# var ans: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 48
# var curr: $P2
    set $P2, self
  __label_2: # while
.annotate 'line', 49
    eq $P2, __ARG_1, __label_1
# {
.annotate 'line', 50
    $P3 = $P2.'head'()
    $P1.'push'($P3)
.annotate 'line', 51
    $P2 = $P2.'tail'()
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 53
    getattribute $P3, self, 'type'
    set $S1, $P3
    ne $S1, 'String', __label_3
.annotate 'line', 54
    .tailcall $P1.'join'('')
    goto __label_4
  __label_3: # else
.annotate 'line', 56
    .return($P1)
  __label_4: # endif
# }
.annotate 'line', 57

.end # upTo

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMInputStream' ]
.annotate 'line', 28
    addattribute $P0, 'memo'
.annotate 'line', 29
    addattribute $P0, 'lst'
.annotate 'line', 30
    addattribute $P0, 'idx'
.annotate 'line', 31
    addattribute $P0, 'hd'
.annotate 'line', 32
    addattribute $P0, 'tl'
.end
.namespace [ 'OMInputStreamEnd' ]

.sub 'head' :method
# Body
# {
.annotate 'line', 62
.const 'Sub' WSubId_2 = 'fail'
.annotate 'line', 63
    $P1 = WSubId_2()
    throw $P1
# }
.annotate 'line', 64

.end # head


.sub 'tail' :method
# Body
# {
.annotate 'line', 66
.const 'Sub' WSubId_3 = 'fail'
.annotate 'line', 67
    $P1 = WSubId_3()
    throw $P1
# }
.annotate 'line', 68

.end # tail

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMInputStreamEnd' ]
.annotate 'line', 60
    get_class $P1, [ 'OMInputStream' ]
    addparent $P0, $P1
.end
.namespace [ 'ListOMInputStream' ]

.sub 'init_pmc' :method :vtable
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 73
    getattribute $P3, self, 'lst'
    getattribute $P4, self, 'idx'
    $P2 = $P3[$P4]
    setattribute self, 'hd', $P2
# }
.annotate 'line', 74

.end # init_pmc


.sub 'head' :method
# Body
# {
.annotate 'line', 75
    getattribute $P1, self, 'hd'
    .return($P1)
# }

.end # head


.sub 'tail' :method
# Body
# {
.annotate 'line', 77
.const 'Sub' WSubId_4 = 'makeListOMInputStream'
.annotate 'line', 78
    getattribute $P1, self, 'tl'
    unless_null $P1, __label_1
.annotate 'line', 79
    getattribute $P4, self, 'lst'
    getattribute $P5, self, 'idx'
    set $I2, $P5
    add $I1, $I2, 1
    $P3 = WSubId_4($P4, $I1)
    setattribute self, 'tl', $P3
  __label_1: # endif
.annotate 'line', 80
    getattribute $P1, self, 'tl'
    .return($P1)
# }
.annotate 'line', 81

.end # tail

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ListOMInputStream' ]
.annotate 'line', 71
    get_class $P1, [ 'OMInputStream' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'makeListOMInputStream' :anon
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 85
# var klass: $P1
# predefined elements
    elements $I1, __ARG_1
    ge __ARG_2, $I1, __label_2
    set $S1, 'ListOMInputStream'
    goto __label_1
  __label_2:
    set $S1, 'OMInputStreamEnd'
  __label_1:
# predefined get_class
    get_class $P1, $S1
.annotate 'line', 87
# var obj: $P2
    $P2 = $P1.'new'(__ARG_1 :named('lst'), __ARG_2 :named('idx'))
.annotate 'line', 88
    .return($P2)
# }
.annotate 'line', 89

.end # makeListOMInputStream

.namespace [ 'OMInputStreamProxy' ]

.sub 'head' :method
# Body
# {
.annotate 'line', 94
    getattribute $P1, self, 'target'
    .tailcall $P1.'head'()
# }

.end # head


.sub 'type' :method
# Body
# {
.annotate 'line', 95
    getattribute $P1, self, 'target'
    .tailcall $P1.'type'()
# }

.end # type


.sub 'upTo' :method
# Body
# {
.annotate 'line', 96
    getattribute $P1, self, 'target'
    .tailcall $P1.'upTo'()
# }

.end # upTo


.sub 'tail' :method
# Body
# {
.annotate 'line', 98
# var tail: $P1
    getattribute $P3, self, 'target'
    $P1 = $P3.'tail'()
.annotate 'line', 99
# var proxy: $P2
    root_new $P3, ['parrot';'Hash']
    getattribute $P6, self, 'target'
    $P5 = $P6.'tail'()
    $P3['target'] = $P5
    new $P2, [ 'OMInputStreamProxy' ], $P3
.annotate 'line', 100
    .return($P2)
# }
.annotate 'line', 101

.end # tail

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMInputStreamProxy' ]
.annotate 'line', 92
    get_class $P1, [ 'OMInputStream' ]
    addparent $P0, $P1
.annotate 'line', 93
    addattribute $P0, 'target'
.end
.namespace [ 'OMeta' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 110
.const 'Sub' WSubId_5 = '_fail'
.annotate 'line', 111
    setattribute self, 'fail', WSubId_5
# }
.annotate 'line', 112

.end # init


.sub 'init_pmc' :method :vtable
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 115
.const 'Sub' WSubId_6 = '_fail'
.annotate 'line', 116
    setattribute self, 'fail', WSubId_6
.annotate 'line', 117
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'stash', $P2
# }
.annotate 'line', 118

.end # init_pmc


.sub 'get_pmc_keyed' :method :vtable
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 121
    getattribute $P2, self, 'stash'
    $P1 = $P2[__ARG_1]
    .return($P1)
# }
.annotate 'line', 122

.end # get_pmc_keyed


.sub 'get_pmc_keyed_str' :method :vtable
        .param string __ARG_1
# Body
# {
.annotate 'line', 125
    getattribute $P2, self, 'stash'
    $P1 = $P2[__ARG_1]
    .return($P1)
# }
.annotate 'line', 126

.end # get_pmc_keyed_str


.sub 'get_string_keyed' :method :vtable
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 129
    getattribute $P2, self, 'stash'
    $P1 = $P2[__ARG_1]
    .return($P1)
# }
.annotate 'line', 130

.end # get_string_keyed


.sub 'get_integer_keyed' :method :vtable
        .param pmc __ARG_1
# Body
# {
# predefined int
.annotate 'line', 133
    getattribute $P1, self, 'stash'
    $I1 = $P1[__ARG_1]
    .return($I1)
# }
.annotate 'line', 134

.end # get_integer_keyed


.sub 'set_pmc_keyed' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 137
    getattribute $P1, self, 'stash'
    $P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 138

.end # set_pmc_keyed


.sub 'set_pmc_keyed_str' :method :vtable
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 141
    getattribute $P1, self, 'stash'
    $P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 142

.end # set_pmc_keyed_str


.sub 'set_string_keyed' :method :vtable
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 145
    getattribute $P1, self, 'stash'
    $P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 146

.end # set_string_keyed


.sub 'set_integer_keyed' :method :vtable
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 149
    getattribute $P1, self, 'stash'
    $P1[__ARG_1] = __ARG_2
# }
.annotate 'line', 150

.end # set_integer_keyed


.sub '_fail' :method
# Body
# {
.annotate 'line', 153
.const 'Sub' WSubId_7 = 'fail'
.annotate 'line', 154
    .tailcall WSubId_7()
# }
.annotate 'line', 155

.end # _fail


.sub '_apply' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 158
.const 'Sub' WSubId_8 = 'fail'
.annotate 'line', 159
.const 'Sub' WSubId_9 = '_fail'
.annotate 'line', 160
# var memoRec: $P1
    getattribute $P11, self, 'input'
    getattribute $P10, $P11, 'memo'
    $P1 = $P10[__ARG_1]
.annotate 'line', 161
    unless_null $P1, __label_1
# {
.annotate 'line', 162
# var origInput: $P2
    getattribute $P2, self, 'input'
.annotate 'line', 163
# var failer: $P3
    new $P3, [ 'Failer' ]
.annotate 'line', 164
# var method: $P4
    null $P4
.annotate 'line', 166
# try: create handler
    new $P10, 'ExceptionHandler'
    set_label $P10, __label_3
    push_eh $P10
# try: begin
# {
# predefined find_method
    find_method $P4, self, __ARG_1
# }
# try: end
    pop_eh
    goto __label_4
# catch
  __label_3:
    .get_results($P5)
    finalize $P5
    pop_eh
# {
.annotate 'line', 167
    concat $S1, 'tried to apply undefined rule "', __ARG_1
    concat $S1, $S1, '"'
# predefined die
    die $S1
# }
# catch end
  __label_4:
.annotate 'line', 169
    getattribute $P11, self, 'input'
    getattribute $P10, $P11, 'memo'
    $P10[__ARG_1] = $P3
.annotate 'line', 170
# var ans: $P6
    root_new $P10, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P6 = self.$P4($P10 :flat)
.annotate 'line', 171
    getattribute $P10, $P2, 'memo'
.annotate 'line', 172
    root_new $P1, ['parrot';'Hash']
    $P1['ans'] = $P6
    getattribute $P13, self, 'input'
    $P1['nextInput'] = $P13
.annotate 'line', 171
    $P10[__ARG_1] = $P1
.annotate 'line', 174
    getattribute $P10, $P3, 'used'
    if_null $P10, __label_5
    unless $P10 goto __label_5
# {
.annotate 'line', 175
# var sentinel: $P7
    getattribute $P7, self, 'input'
  __label_7: # Infinite loop
.annotate 'line', 176
# {
.annotate 'line', 177
# try: create handler
    new $P10, 'ExceptionHandler'
    set_label $P10, __label_8
    push_eh $P10
# try: begin
# {
.annotate 'line', 178
    setattribute self, 'input', $P2
.annotate 'line', 179
# var ans: $P8
    root_new $P10, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P8 = self.$P4($P10 :flat)
.annotate 'line', 180
    getattribute $P10, self, 'input'
    ne_addr $P10, $P7, __label_10
.annotate 'line', 181
    $P11 = WSubId_8()
    throw $P11
  __label_10: # endif
.annotate 'line', 182
    $P1['ans'] = $P8
.annotate 'line', 183
    getattribute $P10, self, 'input'
    $P1['nextInput'] = $P10
# }
# try: end
    pop_eh
    goto __label_9
.annotate 'line', 177
# catch
  __label_8:
    .get_results($P9)
    finalize $P9
    pop_eh
# {
.annotate 'line', 185
    getattribute $P10, $P9, 'payload'
    eq_addr $P10, WSubId_9, __label_11
.annotate 'line', 186
# pirop rethrow
    rethrow $P9
  __label_11: # endif
    goto __label_6 # break
.annotate 'line', 187
# }
# catch end
  __label_9:
# }
    goto __label_7
  __label_6: # Infinite loop end
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 191
    isa $I1, $P1, [ 'Failer' ]
    unless $I1 goto __label_12
# {
.annotate 'line', 192
    box $P10, 1
    setattribute $P1, 'used', $P10
.annotate 'line', 193
    $P10 = WSubId_8()
    throw $P10
# }
  __label_12: # endif
  __label_2: # endif
.annotate 'line', 195
    $P11 = $P1['nextInput']
    setattribute self, 'input', $P11
.annotate 'line', 196
    $P10 = $P1['ans']
    .return($P10)
# }
.annotate 'line', 197

.end # _apply


.sub '_applyWithArgs' :method
        .param string __ARG_1
        .param pmc __ARG_2 :slurpy
# Body
# {
# for loop
.annotate 'line', 200
# i: $I1
# predefined elements
    elements $I2, __ARG_2
    sub $I1, $I2, 1
  __label_3: # for condition
    lt $I1, 0, __label_2
.annotate 'line', 201
    $P2 = __ARG_2[$I1]
    self.'_prependInput'($P2)
  __label_1: # for iteration
.annotate 'line', 200
    set $I3, $I1
    dec $I1
    goto __label_3
  __label_2: # for end
.annotate 'line', 202
# var method: $P1
# predefined find_method
    find_method $P1, self, __ARG_1
.annotate 'line', 203
    root_new $P3, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P2 = self.$P1($P3 :flat)
    .return($P2)
# }
.annotate 'line', 204

.end # _applyWithArgs


.sub '_superApplyWithArgs' :method
        .param string __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3 :slurpy
# Body
# {
# for loop
.annotate 'line', 207
# i: $I1
# predefined elements
    elements $I2, __ARG_3
    sub $I1, $I2, 1
  __label_3: # for condition
    lt $I1, 0, __label_2
.annotate 'line', 208
    $P3 = __ARG_3[$I1]
    self.'_prependInput'($P3)
  __label_1: # for iteration
.annotate 'line', 207
    set $I3, $I1
    dec $I1
    goto __label_3
  __label_2: # for end
.annotate 'line', 209
# var klass: $P1
# predefined get_class
    get_class $P1, __ARG_1
.annotate 'line', 210
# var method: $P2
    $P2 = $P1.'find_method'(__ARG_2)
.annotate 'line', 211
    root_new $P4, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P3 = self.$P2($P4 :flat)
    .return($P3)
# }
.annotate 'line', 212

.end # _superApplyWithArgs


.sub '_prependInput' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 215
    root_new $P3, ['parrot';'Hash']
    $P3['hd'] = __ARG_1
    getattribute $P6, self, 'input'
    $P3['tl'] = $P6
    new $P2, [ 'OMInputStream' ], $P3
    setattribute self, 'input', $P2
# }
.annotate 'line', 216

.end # _prependInput


.sub 'memoizeParameterizedRules' :method
# Body
# {
# predefined die
.annotate 'line', 219
    die "TODO"
# }
.annotate 'line', 220

.end # memoizeParameterizedRules


.sub '_pred' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 223
.const 'Sub' WSubId_10 = 'fail'
.annotate 'line', 224
    unless __ARG_1 goto __label_1
.annotate 'line', 225
    .return(1)
  __label_1: # endif
.annotate 'line', 226
    $P1 = WSubId_10()
    throw $P1
# }
.annotate 'line', 227

.end # _pred


.sub '_not' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 230
.const 'Sub' WSubId_11 = 'fail'
.annotate 'line', 231
.const 'Sub' WSubId_12 = '_fail'
.annotate 'line', 232
# var origInput: $P1
    getattribute $P1, self, 'input'
.annotate 'line', 233
# try: create handler
    new $P3, 'ExceptionHandler'
    set_label $P3, __label_1
    push_eh $P3
# try: begin
# {
    root_new $P4, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P6 = self.__ARG_1($P4 :flat)
# }
# try: end
    pop_eh
    goto __label_2
# catch
  __label_1:
    .get_results($P2)
    finalize $P2
    pop_eh
# {
.annotate 'line', 235
    getattribute $P3, $P2, 'payload'
    eq_addr $P3, WSubId_12, __label_3
.annotate 'line', 236
# pirop rethrow
    rethrow $P2
  __label_3: # endif
.annotate 'line', 237
    setattribute self, 'input', $P1
.annotate 'line', 238
    .return(1)
# }
# catch end
  __label_2:
.annotate 'line', 240
    $P3 = WSubId_11()
    throw $P3
# }
.annotate 'line', 241

.end # _not


.sub '_lookahead' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 244
# var origInput: $P1
    getattribute $P1, self, 'input'
.annotate 'line', 245
# var result: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P2 = self.__ARG_1($P3 :flat)
.annotate 'line', 246
    setattribute self, 'input', $P1
.annotate 'line', 247
    .return($P2)
# }
.annotate 'line', 248

.end # _lookahead


.sub '_or' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 251
.const 'Sub' WSubId_13 = 'fail'
.annotate 'line', 252
.const 'Sub' WSubId_14 = '_fail'
.annotate 'line', 253
# var origInput: $P1
    getattribute $P1, self, 'input'
.annotate 'line', 254
    if_null __ARG_1, __label_2
    iter $P4, __ARG_1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 255
# try: create handler
    new $P5, 'ExceptionHandler'
    set_label $P5, __label_3
    push_eh $P5
# try: begin
# {
.annotate 'line', 256
    setattribute self, 'input', $P1
.annotate 'line', 257
    root_new $P6, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P5 = self.$P2($P6 :flat)
    .return($P5)
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 255
# catch
  __label_3:
    .get_results($P3)
    finalize $P3
    pop_eh
# {
.annotate 'line', 259
    getattribute $P5, $P3, 'payload'
    eq_addr $P5, WSubId_14, __label_5
.annotate 'line', 260
# pirop rethrow
    rethrow $P3
  __label_5: # endif
# }
# catch end
  __label_4:
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 263
    $P5 = WSubId_13()
    throw $P5
# }
.annotate 'line', 264

.end # _or


.sub '_xor' :method
        .param string __ARG_1
        .param pmc __ARG_2 :slurpy
# Body
# {
.annotate 'line', 267
.const 'Sub' WSubId_15 = 'fail'
.annotate 'line', 268
.const 'Sub' WSubId_16 = '_fail'
.annotate 'line', 269
# var origInput: $P1
    getattribute $P1, self, 'input'
.annotate 'line', 270
# var ans: $P2
    null $P2
.annotate 'line', 271
# var newInput: $P3
    null $P3
.annotate 'line', 272
    if_null __ARG_2, __label_2
    iter $P6, __ARG_2
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 273
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_3
    push_eh $P7
# try: begin
# {
.annotate 'line', 274
    setattribute self, 'input', $P1
.annotate 'line', 275
    root_new $P7, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P2 = self.$P4($P7 :flat)
.annotate 'line', 276
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 277
    concat $S1, 'more than one choice matched by "exclusive-OR" in ', __ARG_1
# predefined die
    die $S1
  __label_5: # endif
.annotate 'line', 278
    getattribute $P3, self, 'input'
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 273
# catch
  __label_3:
    .get_results($P5)
    finalize $P5
    pop_eh
# {
.annotate 'line', 280
    getattribute $P7, $P5, 'payload'
    eq_addr $P7, WSubId_16, __label_6
.annotate 'line', 281
# pirop rethrow
    rethrow $P5
  __label_6: # endif
# }
# catch end
  __label_4:
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 284
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 285
    setattribute self, 'input', $P3
.annotate 'line', 286
    .return($P2)
# }
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 288
    $P7 = WSubId_15()
    throw $P7
# }
  __label_8: # endif
# }
.annotate 'line', 290

.end # _xor


.sub 'disableXORs' :method
# Body
# {
# predefined die
.annotate 'line', 293
    die "TODO"
# }
.annotate 'line', 294

.end # disableXORs


.sub '_opt' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 297
.const 'Sub' WSubId_17 = '_fail'
.annotate 'line', 298
# var origInput: $P1
    getattribute $P1, self, 'input'
.annotate 'line', 299
# var ans: $P2
    null $P2
.annotate 'line', 300
# try: create handler
    new $P4, 'ExceptionHandler'
    set_label $P4, __label_1
    push_eh $P4
# try: begin
# {
    root_new $P5, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P2 = self.__ARG_1($P5 :flat)
# }
# try: end
    pop_eh
    goto __label_2
# catch
  __label_1:
    .get_results($P3)
    finalize $P3
    pop_eh
# {
.annotate 'line', 302
    getattribute $P4, $P3, 'payload'
    eq_addr $P4, WSubId_17, __label_3
.annotate 'line', 303
# pirop rethrow
    rethrow $P3
  __label_3: # endif
.annotate 'line', 304
    setattribute self, 'input', $P1
# }
# catch end
  __label_2:
.annotate 'line', 306
    .return($P2)
# }
.annotate 'line', 307

.end # _opt


.sub '_many' :method
        .param pmc __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 310
.const 'Sub' WSubId_18 = '_fail'
.annotate 'line', 311
# var ans: $P1
    unless __ARG_3 goto __label_2
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_2
    set $P1, $P4
    goto __label_1
  __label_2:
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P1, $P6
  __label_1:
  __label_4: # Infinite loop
.annotate 'line', 312
# {
.annotate 'line', 313
# var origInput: $P2
    getattribute $P2, self, 'input'
.annotate 'line', 314
# try: create handler
    new $P4, 'ExceptionHandler'
    set_label $P4, __label_5
    push_eh $P4
# try: begin
# {
    root_new $P6, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P5 = self.__ARG_1($P6 :flat)
    $P1.'push'($P5)
# }
# try: end
    pop_eh
    goto __label_6
# catch
  __label_5:
    .get_results($P3)
    finalize $P3
    pop_eh
# {
.annotate 'line', 316
    getattribute $P4, $P3, 'payload'
    eq_addr $P4, WSubId_18, __label_7
.annotate 'line', 317
# pirop rethrow
    rethrow $P3
  __label_7: # endif
.annotate 'line', 318
    setattribute self, 'input', $P2
.annotate 'line', 319
    .return($P1)
# }
# catch end
  __label_6:
# }
    goto __label_4
  __label_3: # Infinite loop end
# }
.annotate 'line', 322

.end # _many


.sub '_many1' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 325
    root_new $P2, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P1 = self.__ARG_1($P2 :flat)
    .tailcall self.'_many'(__ARG_1, $P1)
# }
.annotate 'line', 326

.end # _many1


.sub '_form' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 329
.const 'Sub' WSubId_19 = 'fail'
.annotate 'line', 330
.const 'Sub' WSubId_20 = 'is_sequenceable'
.annotate 'line', 331
.const 'Sub' WSubId_21 = 'makeListOMInputStream'
.annotate 'line', 332
# var v: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 333
    $P4 = WSubId_20($P1)
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 334
    $P5 = WSubId_19()
    throw $P5
  __label_1: # endif
.annotate 'line', 335
# var origInput: $P2
    getattribute $P2, self, 'input'
# {
.annotate 'line', 337
    $P5 = WSubId_21($P1)
    setattribute self, 'input', $P5
.annotate 'line', 338
# var r: $P3
    root_new $P4, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P3 = self.__ARG_1($P4 :flat)
.annotate 'line', 339
    self.'_apply'('end')
# }
.annotate 'line', 341
    setattribute self, 'input', $P2
.annotate 'line', 342
    .return($P1)
# }
.annotate 'line', 343

.end # _form


.sub '_consumedBy' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 346
# var origInput: $P1
    getattribute $P1, self, 'input'
.annotate 'line', 347
    root_new $P2, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P4 = self.__ARG_1($P2 :flat)
.annotate 'line', 348
    getattribute $P2, self, 'input'
    .tailcall $P1.'upTo'($P2)
# }
.annotate 'line', 349

.end # _consumedBy


.sub '_idxConsumedBy' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 352
# var origInput: $P1
    getattribute $P1, self, 'input'
.annotate 'line', 353
    root_new $P2, ['parrot';'ResizablePMCArray']
# predefined callmethodwithargs
    $P4 = self.__ARG_1($P2 :flat)
.annotate 'line', 354
    root_new $P2, ['parrot';'Hash']
.annotate 'line', 355
    getattribute $P4, $P1, 'idx'
    $P2['fromIdx'] = $P4
.annotate 'line', 356
    getattribute $P7, self, 'input'
    getattribute $P6, $P7, 'idx'
    $P2['toIdx'] = $P6
.annotate 'line', 354
    .return($P2)
# }
.annotate 'line', 358

.end # _idxConsumedBy


.sub '_interleave' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
# predefined die
.annotate 'line', 361
    die "TODO"
# }
.annotate 'line', 362

.end # _interleave


.sub '_currIdx' :method
# Body
# {
.annotate 'line', 364
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    .return($P1)
# }

.end # _currIdx


.sub 'anything' :method
# Body
# {
.annotate 'line', 367
# var ans: $P1
    getattribute $P2, self, 'input'
    $P1 = $P2.'head'()
.annotate 'line', 368
    getattribute $P4, self, 'input'
    $P3 = $P4.'tail'()
    setattribute self, 'input', $P3
.annotate 'line', 369
    .return($P1)
# }
.annotate 'line', 370

.end # anything


.sub 'end' :subid('WSubId_22') :method
.const 'Sub' WSubId_23 = "WSubId_23"
# Body
# {
.annotate 'line', 373
    set $P1, WSubId_23
    .tailcall self.'_not'($P1)
# }
.annotate 'line', 374

.end # end


.sub '' :anon :subid('WSubId_23') :outer('WSubId_22')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 373
    __ARG_1.'_apply'('anything')
# }

.end # WSubId_23


.sub 'pos' :method
# Body
# {
.annotate 'line', 376
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    .return($P1)
# }

.end # pos


.sub 'empty' :method
# Body
# {
.annotate 'line', 378
    .return(1)
# }

.end # empty


.sub 'apply' :method
# Body
# {
.annotate 'line', 381
    $P1 = self.'_apply'('anything')
    .tailcall self.'_apply'($P1)
# }
.annotate 'line', 382

.end # apply


.sub 'foreign' :method
# Body
# {
.annotate 'line', 385
# var g: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 386
# var r: $P2
    $P2 = self.'_apply'('anything')
.annotate 'line', 387
# var proxy: $P3
    root_new $P6, ['parrot';'Hash']
    getattribute $P8, self, 'input'
    $P6['target'] = $P8
    new $P3, [ 'OMInputStreamProxy' ], $P6
.annotate 'line', 388
# var gi: $P4
# predefined get_class
    get_class $P6, $P1
    $P4 = $P6.'new'($P3 :named('input'))
.annotate 'line', 389
# var ans: $P5
    $P5 = $P4.'_apply'($P2)
.annotate 'line', 390
    getattribute $P8, $P4, 'input'
    getattribute $P7, $P8, 'target'
    setattribute self, 'input', $P7
.annotate 'line', 391
    .return($P5)
# }
.annotate 'line', 392

.end # foreign


.sub 'exactly' :method
# Body
# {
.annotate 'line', 395
.const 'Sub' WSubId_24 = 'fail'
.annotate 'line', 396
# var wanted: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 397
    $P2 = self.'_apply'('anything')
    ne $P2, $P1, __label_1
.annotate 'line', 398
    .return($P1)
  __label_1: # endif
.annotate 'line', 399
    $P2 = WSubId_24()
    throw $P2
# }
.annotate 'line', 400

.end # exactly


.sub 'null' :method
# Body
# {
.annotate 'line', 403
# var ans: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 404
    isnull $I1, $P1
    self.'_pred'($I1)
.annotate 'line', 405
    .return($P1)
# }
.annotate 'line', 406

.end # null


.sub 'number' :method
# Body
# {
.annotate 'line', 409
# var ans: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 410
    isa $I1, $P1, [ 'Number' ]
    self.'_pred'($I1)
.annotate 'line', 411
    .return($P1)
# }
.annotate 'line', 412

.end # number


.sub 'string' :method
# Body
# {
.annotate 'line', 415
# var ans: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 416
    isa $I1, $P1, [ 'String' ]
    self.'_pred'($I1)
.annotate 'line', 417
    .return($P1)
# }
.annotate 'line', 418

.end # string


.sub 'char' :method
# Body
# {
.annotate 'line', 421
# var ans: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 422
    isa $I1, $P1, [ 'String' ]
    unless $I1 goto __label_1
    set $S1, $P1
# predefined length
    length $I2, $S1
    iseq $I1, $I2, 1
  __label_1:
    self.'_pred'($I1)
.annotate 'line', 423
    .return($P1)
# }
.annotate 'line', 424

.end # char


.sub '_cclass_char' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 427
# c: $S1
    $P1 = self.'_apply'('char')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 428
# pred: $I1
    null $I1
.annotate 'line', 429
# pirop is_cclass
    is_cclass $I1, __ARG_1, $S1, 0
.annotate 'line', 430
    self.'_pred'($I1)
.annotate 'line', 431
    .return($S1)
# }
.annotate 'line', 432

.end # _cclass_char


.sub 'space' :method
# Body
# {
.annotate 'line', 434
    .tailcall self.'_cclass_char'(32)
# }

.end # space


.sub 'spaces' :subid('WSubId_25') :method
.const 'Sub' WSubId_26 = "WSubId_26"
# Body
# {
.annotate 'line', 437
    set $P1, WSubId_26
    .tailcall self.'_many'($P1)
# }
.annotate 'line', 438

.end # spaces


.sub '' :anon :subid('WSubId_26') :outer('WSubId_25')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 437
    .tailcall __ARG_1.'_apply'('space')
# }

.end # WSubId_26


.sub 'digit' :method
# Body
# {
.annotate 'line', 440
    .tailcall self.'_cclass_char'(8)
# }

.end # digit


.sub 'hexdigit' :method
# Body
# {
.annotate 'line', 442
    .tailcall self.'_cclass_char'(16)
# }

.end # hexdigit


.sub 'lower' :method
# Body
# {
.annotate 'line', 444
    .tailcall self.'_cclass_char'(2)
# }

.end # lower


.sub 'upper' :method
# Body
# {
.annotate 'line', 446
    .tailcall self.'_cclass_char'(1)
# }

.end # upper


.sub 'letter' :method
# Body
# {
.annotate 'line', 448
    .tailcall self.'_cclass_char'(4)
# }

.end # letter


.sub 'letterOrDigit' :method
# Body
# {
.annotate 'line', 450
    .tailcall self.'_cclass_char'(2048)
# }

.end # letterOrDigit


.sub 'firstAndRest' :subid('WSubId_27') :method
.annotate 'line', 452
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_28 = "WSubId_28"
# Body
# {
.annotate 'line', 453
# var first: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 454
# var rest: $P2
    $P2 = self.'_apply'('anything')
.annotate 'line', 455
    newclosure $P3, WSubId_28
    $P4 = self.'_apply'($P1)
    .tailcall self.'_many'($P3, $P4)
# }
.annotate 'line', 456

.end # firstAndRest


.sub '' :anon :subid('WSubId_28') :outer('WSubId_27')
        .param pmc __ARG_1
.annotate 'line', 455
    find_lex $P1, '__WLEX_1'
# Body
# {
    .tailcall __ARG_1.'_apply'($P1)
# }

.end # WSubId_28


.sub 'seq' :method
# Body
# {
.annotate 'line', 459
# var xs: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 460
    if_null $P1, __label_2
    iter $P3, $P1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 461
    self.'_applyWithArgs'('exactly', $P2)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 462
    .return($P1)
# }
.annotate 'line', 463

.end # seq


.sub 'notLast' :subid('WSubId_29') :method
.annotate 'line', 465
.lex '__WLEX_1', $P1
.const 'Sub' WSubId_30 = "WSubId_30"
# Body
# {
.annotate 'line', 466
# var rule: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 467
# var ans: $P2
    $P2 = self.'_apply'($P1)
.annotate 'line', 468
    newclosure $P3, WSubId_30
    self.'_lookahead'($P3)
.annotate 'line', 469
    .return($P2)
# }
.annotate 'line', 470

.end # notLast


.sub '' :anon :subid('WSubId_30') :outer('WSubId_29')
        .param pmc __ARG_1
.annotate 'line', 468
    find_lex $P1, '__WLEX_1'
# Body
# {
    .tailcall __ARG_1.'_apply'($P1)
# }

.end # WSubId_30


.sub '_genericMatch' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 473
.const 'Sub' WSubId_31 = '_fail'
.annotate 'line', 474
# var m: $P1
# predefined typeof
    typeof $P5, self
    $P1 = $P5.'new'(__ARG_1 :named('input'))
.annotate 'line', 475
# try: create handler
    new $P5, 'ExceptionHandler'
    set_label $P5, __label_1
    push_eh $P5
# try: begin
# {
.annotate 'line', 477
# var result: $P2
    null $P2
.annotate 'line', 478
    unless_null __ARG_3, __label_3
.annotate 'line', 479
    $P2 = $P1.'_apply'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 481
    $P2 = $P1.'_applyWithArgs'(__ARG_2, __ARG_3 :flat)
  __label_4: # endif
.annotate 'line', 482
    .return($P2)
# }
# try: end
    pop_eh
    goto __label_2
.annotate 'line', 475
# catch
  __label_1:
    .get_results($P3)
    finalize $P3
    pop_eh
# {
.annotate 'line', 484
    getattribute $P5, $P3, 'payload'
    issame $I1, $P5, WSubId_31
    unless $I1 goto __label_6
    isnull $I1, __ARG_4
    not $I1
  __label_6:
    unless $I1 goto __label_5
# {
.annotate 'line', 485
# var input: $P4
    getattribute $P4, $P1, 'input'
.annotate 'line', 486
    getattribute $P5, $P4, 'idx'
    if_null $P5, __label_7
# {
  __label_9: # while
.annotate 'line', 487
    getattribute $P6, $P4, 'tl'
    isnull $I1, $P6
    not $I1
    unless $I1 goto __label_10
    getattribute $P8, $P4, 'tl'
    getattribute $P7, $P8, 'idx'
    isnull $I1, $P7
    not $I1
  __label_10:
    unless $I1 goto __label_8
.annotate 'line', 488
    getattribute $P4, $P4, 'tl'
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 489
    getattribute $P5, $P4, 'idx'
    dec $P5
# }
  __label_7: # endif
.annotate 'line', 491
    getattribute $P5, $P4, 'idx'
    .tailcall __ARG_4($P1, $P5)
# }
  __label_5: # endif
.annotate 'line', 493
# pirop rethrow
    rethrow $P3
# }
# catch end
  __label_2:
# }
.annotate 'line', 495

.end # _genericMatch


.sub 'match' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3 :optional
        .param pmc __ARG_4 :optional
# Body
# {
.annotate 'line', 498
.const 'Sub' WSubId_32 = 'makeListOMInputStream'
.annotate 'line', 499
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_1
    $P1 = WSubId_32($P2)
    .tailcall self.'_genericMatch'($P1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 500

.end # match


.sub 'matchAll' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3 :optional
        .param pmc __ARG_4 :optional
# Body
# {
.annotate 'line', 503
.const 'Sub' WSubId_33 = 'makeListOMInputStream'
.annotate 'line', 504
    $P1 = WSubId_33(__ARG_1)
    .tailcall self.'_genericMatch'($P1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 505

.end # matchAll

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMeta' ]
.annotate 'line', 105
    addattribute $P0, 'input'
.annotate 'line', 106
    addattribute $P0, 'fail'
.annotate 'line', 107
    addattribute $P0, 'stash'
.end
.namespace [ 'Parser' ]

.sub 'listOf' :subid('WSubId_34') :method
.annotate 'line', 509
.lex '__WLEX_1', $P1
.lex '__WLEX_2', $P2
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 510
# var rule: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 511
# var delim: $P2
    $P2 = self.'_apply'('anything')
.annotate 'line', 512
    newclosure $P3, WSubId_35
.annotate 'line', 520
    set $P4, WSubId_37
.annotate 'line', 512
    .tailcall self.'_or'($P3, $P4)
# }
.annotate 'line', 522

.end # listOf


.sub '' :anon :subid('WSubId_35') :outer('WSubId_34')
        .param pmc __ARG_1
.annotate 'line', 512
    find_lex $P2, '__WLEX_1'
    find_lex $P3, '__WLEX_2'
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 513
# var ans: $P1
    $P1 = __ARG_1.'_apply'($P2)
.annotate 'line', 514
    newclosure $P4, WSubId_36
.annotate 'line', 514
    .tailcall __ARG_1.'_many'($P4, $P1)
# }
.annotate 'line', 519

.end # WSubId_35


.sub '' :anon :subid('WSubId_36') :outer('WSubId_35')
        .param pmc __ARG_2
.annotate 'line', 514
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
.annotate 'line', 515
    __ARG_2.'_applyWithArgs'('token', $P1)
.annotate 'line', 516
    .tailcall __ARG_2.'_apply'($P2)
# }
.annotate 'line', 517

.end # WSubId_36


.sub '' :anon :subid('WSubId_37') :outer('WSubId_34')
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 520
    root_new $P1, ['parrot';'ResizablePMCArray']
    .return($P1)
# }

.end # WSubId_37


.sub 'token' :method
# Body
# {
.annotate 'line', 524
# var cs: $P1
    $P1 = self.'_apply'('anything')
.annotate 'line', 525
    self.'_apply'('spaces')
.annotate 'line', 526
    .tailcall self.'_applyWithArgs'('seq', $P1)
# }
.annotate 'line', 527

.end # token

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Parser' ]
.annotate 'line', 508
    get_class $P1, [ 'OMeta' ]
    addparent $P0, $P1
.end
# End generated code
