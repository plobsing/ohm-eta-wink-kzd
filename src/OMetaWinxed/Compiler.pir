# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ ]

.sub 'escapeStringFor' :anon :immediate
# Body
# {
.annotate 'file', 'stage2.winxed'
.annotate 'line', 3
# var ret: $P1
    new $P1, [ 'FixedStringArray' ], 256
# for loop
.annotate 'line', 5
# c: $I1
    null $I1
  __label_3: # for condition
# predefined elements
    elements $I2, $P1
    ge $I1, $I2, __label_2
.annotate 'line', 6
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
    $P1[$I1] = $S1
  __label_1: # for iteration
.annotate 'line', 5
    set $I3, $I1
    inc $I1
    goto __label_3
  __label_2: # for end
.annotate 'line', 7
    $P1[92] = '\\'
.annotate 'line', 8
    $P1[34] = '\"'
.annotate 'line', 9
    $P1[39] = "\\'"
.annotate 'line', 10
    $P1[13] = '\r'
.annotate 'line', 11
    $P1[10] = '\n'
.annotate 'line', 12
    $P1[9] = '\t'
.annotate 'line', 14
    .return($P1)
# }
.annotate 'line', 15

.end # escapeStringFor


.sub 'escapeChar' :subid('WSubId_993')
        .param string __ARG_1
# Body
# {
.annotate 'line', 18
.const 'Sub' WSubId_1 = 'escapeStringFor'
.annotate 'line', 19
# charCode: $I1
# predefined ord
    ord $I1, __ARG_1
.annotate 'line', 20
    le $I1, 255, __label_2
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
    goto __label_1
  __label_2:
    $S1 = WSubId_1[$I1]
  __label_1:
    .return($S1)
# }
.annotate 'line', 21

.end # escapeChar


.sub 'toProgramString' :subid('WSubId_995')
        .param string __ARG_1
.const 'Sub' WSubId_993 = "WSubId_993"
# Body
# {
.annotate 'line', 24
# var cs: $P1
    new $P1, ['StringBuilder']
.annotate 'line', 25
# pirop push
    push $P1, '"'
.annotate 'line', 26
    box $P2, __ARG_1
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $S1, $P3
# {
.annotate 'line', 27
    $P4 = WSubId_993($S1)
    set $S1, $P4
.annotate 'line', 28
# pirop push
    push $P1, $S1
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 30
# pirop push
    push $P1, '"'
# predefined string
.annotate 'line', 31
    set $S2, $P1
    .return($S2)
# }
.annotate 'line', 32

.end # toProgramString


.sub 'unescape' :subid('WSubId_994')
        .param string __ARG_1
# Body
# {
.annotate 'line', 35
# predefined substr
    substr $S2, __ARG_1, 0, 1
    ne $S2, "\\", __label_1
# {
.annotate 'line', 36
# c: $S1
# predefined substr
    substr $S1, __ARG_1, 1, 1
# switch
.annotate 'line', 37
    set $S2, $S1
    set $S3, "\\"
    if $S2 == $S3 goto __label_5
    set $S3, "r"
    if $S2 == $S3 goto __label_6
    set $S3, "n"
    if $S2 == $S3 goto __label_7
    set $S3, "t"
    if $S2 == $S3 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 38
    .return("\\")
  __label_6: # case
.annotate 'line', 39
    .return("\r")
  __label_7: # case
.annotate 'line', 40
    .return("\n")
  __label_8: # case
.annotate 'line', 41
    .return("\t")
  __label_4: # default
.annotate 'line', 42
    .return($S1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 45
    .return(__ARG_1)
# }
  __label_2: # endif
# }
.annotate 'line', 47

.end # unescape

.namespace [ 'JumpTable' ]

.sub 'init_pmc' :method :vtable
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 56
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'choices', $P2
.annotate 'line', 57
    getattribute $P1, self, 'choice'
    self.'add'($P1)
.annotate 'line', 58
    null $P1
    setattribute self, 'choice', $P1
# }
.annotate 'line', 59

.end # init_pmc


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 62
# c: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 63
# var t: $P1
    $P1 = __ARG_1[1]
.annotate 'line', 64
    getattribute $P3, self, 'choices'
    $P2 = $P3[$S1]
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 65
    getattribute $P6, self, 'choices'
    $P5 = $P6[$S1]
    $P4 = $P5[0]
    getattribute $P7, self, 'choiceOp'
    ne $P4, $P7, __label_3
.annotate 'line', 66
    getattribute $P9, self, 'choices'
    $P8 = $P9[$S1]
    $P8.'push'($P1)
    goto __label_4
  __label_3: # else
.annotate 'line', 68
    getattribute $P10, self, 'choices'
    root_new $P11, ['parrot';'ResizablePMCArray']
    getattribute $P13, self, 'choiceOp'
    push $P11, $P13
    getattribute $P15, self, 'choices'
    $P14 = $P15[$S1]
    push $P11, $P14
    push $P11, $P1
    $P10[$S1] = $P11
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 70
    getattribute $P2, self, 'choices'
    $P2[$S1] = $P1
# }
  __label_2: # endif
# }
.annotate 'line', 72

.end # add


.sub 'toTree' :method
# Body
# {
.annotate 'line', 75
# var r: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P3, 'JumpTable'
    push $P1, $P3
.annotate 'line', 76
    getattribute $P3, self, 'choices'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 77
    root_new $P5, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, $P2
    box $P6, $S1
    push $P5, $P6
    getattribute $P8, self, 'choices'
    $P7 = $P8[$P2]
    push $P5, $P7
    $P1.'push'($P5)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 78
    .return($P1)
# }
.annotate 'line', 79

.end # toTree

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'JumpTable' ]
.annotate 'line', 51
    addattribute $P0, 'choiceOp'
.annotate 'line', 52
    addattribute $P0, 'choices'
.annotate 'line', 53
    addattribute $P0, 'choice'
.end
.namespace [ 'WinxedParser' ]

.sub 'fromTo' :subid('WSubId_2') :method
.annotate 'line', 82
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_3
    .tailcall $P4(self)
# }

.end # fromTo


.sub '' :anon :subid('WSubId_3') :outer('WSubId_2')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_1'
    __ARG_1.'_applyWithArgs'("seq", $P3)
    newclosure $P3, WSubId_4
    __ARG_1.'_many'($P3)
    find_lex $P3, '__WLEX_2'
    .tailcall __ARG_1.'_applyWithArgs'("seq", $P3)
# }

.end # WSubId_3


.sub '' :anon :subid('WSubId_4') :outer('WSubId_3')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_5 = "WSubId_5"
# Body
# {
    newclosure $P2, WSubId_5
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_4


.sub '' :anon :subid('WSubId_5') :outer('WSubId_4')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
    newclosure $P2, WSubId_6
    __ARG_3.'_not'($P2)
    .tailcall __ARG_3.'_apply'("char")
# }

.end # WSubId_5


.sub '' :anon :subid('WSubId_6') :outer('WSubId_5')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
# Body
# {
    find_lex $P2, '__WLEX_2'
    .tailcall __ARG_4.'_applyWithArgs'("seq", $P2)
# }

.end # WSubId_6


.sub 'space' :subid('WSubId_7') :method
.const 'Sub' WSubId_8 = "WSubId_8"
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_10 = "WSubId_10"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_8
    set $P3, WSubId_9
    set $P4, WSubId_10
    .tailcall self.'_or'($P2, $P3, $P4)
# }

.end # space


.sub '' :anon :subid('WSubId_8') :outer('WSubId_7')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_superApplyWithArgs'("Parser", 'space')
# }

.end # WSubId_8


.sub '' :anon :subid('WSubId_9') :outer('WSubId_7')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_applyWithArgs'("fromTo", "//", "\n")
# }

.end # WSubId_9


.sub '' :anon :subid('WSubId_10') :outer('WSubId_7')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("fromTo", "/*", "*/")
# }

.end # WSubId_10


.sub 'nameFirst' :subid('WSubId_11') :method
.const 'Sub' WSubId_12 = "WSubId_12"
.const 'Sub' WSubId_13 = "WSubId_13"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_12
    set $P3, WSubId_13
    .tailcall self.'_or'($P2, $P3)
# }

.end # nameFirst


.sub '' :anon :subid('WSubId_12') :outer('WSubId_11')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("letter")
# }

.end # WSubId_12


.sub '' :anon :subid('WSubId_13') :outer('WSubId_11')
        .param pmc __ARG_2
.const 'Sub' WSubId_14 = "WSubId_14"
# Body
# {
    set $P1, WSubId_14
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_13


.sub '' :anon :subid('WSubId_14') :outer('WSubId_13')
        .param pmc __ARG_3
# Body
# {
# switch
    $P1 = __ARG_3.'_apply'('anything')
    set $S1, $P1
    set $S2, "_"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return("_")
  __label_2: # default
    $P2 = __ARG_3.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_14


.sub 'nameRest' :subid('WSubId_15') :method
.const 'Sub' WSubId_16 = "WSubId_16"
.const 'Sub' WSubId_17 = "WSubId_17"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_16
    set $P3, WSubId_17
    .tailcall self.'_or'($P2, $P3)
# }

.end # nameRest


.sub '' :anon :subid('WSubId_16') :outer('WSubId_15')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("nameFirst")
# }

.end # WSubId_16


.sub '' :anon :subid('WSubId_17') :outer('WSubId_15')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("digit")
# }

.end # WSubId_17


.sub 'iName' :subid('WSubId_18') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_19 = "WSubId_19"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_19
    .tailcall $P3(self)
# }

.end # iName


.sub '' :anon :subid('WSubId_19') :outer('WSubId_18')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_applyWithArgs'("firstAndRest", "nameFirst", "nameRest")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, "", $P2
    .return($S1)
# }

.end # WSubId_19


.sub 'isKeyword' :subid('WSubId_20') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_21
    .tailcall $P3(self)
# }

.end # isKeyword


.sub '' :anon :subid('WSubId_21') :outer('WSubId_20')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P3, '__WLEX_1'
    $P2 = __ARG_1.'_isKeyword'($P3)
    .tailcall __ARG_1.'_pred'($P2)
# }

.end # WSubId_21


.sub 'keyword' :subid('WSubId_22') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_23 = "WSubId_23"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var k: $P2
    null $P2
    newclosure $P3, WSubId_23
    .tailcall $P3(self)
# }

.end # keyword


.sub '' :anon :subid('WSubId_23') :outer('WSubId_22')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("iName")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    __ARG_1.'_applyWithArgs'("isKeyword", $P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    find_lex $P5, '__WLEX_1'
    push $P2, $P5
    .return($P2)
# }

.end # WSubId_23


.sub 'nameTok' :subid('WSubId_24') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_25 = "WSubId_25"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var n: $P2
    null $P2
    newclosure $P3, WSubId_25
    .tailcall $P3(self)
# }

.end # nameTok


.sub '' :anon :subid('WSubId_25') :outer('WSubId_24')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("iName")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "name"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_25


.sub 'hexDigit' :subid('WSubId_26') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_27 = "WSubId_27"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var v: $P3
    null $P3
    newclosure $P4, WSubId_27
    .tailcall $P4(self)
# }

.end # hexDigit


.sub '' :anon :subid('WSubId_27') :outer('WSubId_26')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("char")
store_lex '__WLEX_1', $P3
    $P4 = __ARG_1["hexDigits"]
    find_lex $P6, '__WLEX_1'
    $P5 = $P6.'toLowerCase'()
    $P3 = $P4.'indexOf'($P5)
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_2'
    set $I2, $P3
    isge $I1, $I2, 0
    __ARG_1.'_pred'($I1)
    find_lex $P3, '__WLEX_2'
    .return($P3)
# }

.end # WSubId_27


.sub 'hexLit' :subid('WSubId_28') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_29 = "WSubId_29"
.const 'Sub' WSubId_31 = "WSubId_31"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var n: $P2
    null $P2
# var d: $P3
    null $P3
    newclosure $P4, WSubId_29
    set $P5, WSubId_31
    .tailcall self.'_or'($P4, $P5)
# }

.end # hexLit


.sub '' :anon :subid('WSubId_29') :outer('WSubId_28')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_30 = "WSubId_30"
# Body
# {
    newclosure $P3, WSubId_30
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_29


.sub '' :anon :subid('WSubId_30') :outer('WSubId_29')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("hexLit")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_2.'_apply'("hexDigit")
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_1'
    set $N2, $P3
    mul $N1, $N2, 16
    find_lex $P4, '__WLEX_2'
    set $I2, $N1
    set $I3, $P4
    add $I1, $I2, $I3
    .return($I1)
# }

.end # WSubId_30


.sub '' :anon :subid('WSubId_31') :outer('WSubId_28')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("hexDigit")
# }

.end # WSubId_31


.sub 'number' :subid('WSubId_32') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_33 = "WSubId_33"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var n: $P2
    null $P2
# var ws: $P3
    null $P3
# var fs: $P4
    null $P4
    newclosure $P5, WSubId_33
    newclosure $P6, WSubId_36
    .tailcall self.'_or'($P5, $P6)
# }

.end # number


.sub '' :anon :subid('WSubId_33') :outer('WSubId_32')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_34 = "WSubId_34"
# Body
# {
    newclosure $P2, WSubId_34
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_33


.sub '' :anon :subid('WSubId_34') :outer('WSubId_33')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_35 = "WSubId_35"
# Body
# {
# switch
    $P2 = __ARG_2.'_apply'('anything')
    set $S1, $P2
    set $S2, "0"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_35
    .tailcall $P3(__ARG_2)
  __label_2: # default
    $P4 = __ARG_2.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_34


.sub '' :anon :subid('WSubId_35') :outer('WSubId_34')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("exactly", "x")
    $P2 = __ARG_3.'_apply'("hexLit")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "number"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_35


.sub '' :anon :subid('WSubId_36') :outer('WSubId_32')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
    newclosure $P3, WSubId_37
    .tailcall $P3(__ARG_4)
# }

.end # WSubId_36


.sub '' :anon :subid('WSubId_37') :outer('WSubId_36')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
    set $P4, WSubId_38
    $P3 = __ARG_5.'_many1'($P4)
store_lex '__WLEX_2', $P3
    set $P4, WSubId_39
    set $P5, WSubId_42
    $P3 = __ARG_5.'_or'($P4, $P5)
store_lex '__WLEX_3', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "number"
    push $P3, $P4
# predefined float
    find_lex $P5, '__WLEX_2'
# predefined join
    join $S1, "", $P5
    find_lex $P6, '__WLEX_3'
# predefined join
    join $S2, "", $P6
    concat $S3, $S1, "."
    concat $S3, $S3, $S2
    set $N1, $S3
    box $P4, $N1
    push $P3, $P4
    .return($P3)
# }

.end # WSubId_37


.sub '' :anon :subid('WSubId_38') :outer('WSubId_37')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("digit")
# }

.end # WSubId_38


.sub '' :anon :subid('WSubId_39') :outer('WSubId_37')
        .param pmc __ARG_7
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
    set $P1, WSubId_40
    .tailcall $P1(__ARG_7)
# }

.end # WSubId_39


.sub '' :anon :subid('WSubId_40') :outer('WSubId_39')
        .param pmc __ARG_8
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
# switch
    $P1 = __ARG_8.'_apply'('anything')
    set $S1, $P1
    set $S2, "."
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    set $P2, WSubId_41
    .tailcall __ARG_8.'_many1'($P2)
  __label_2: # default
    $P3 = __ARG_8.'_fail'()
    throw $P3
  __label_1: # switch end
# }

.end # WSubId_40


.sub '' :anon :subid('WSubId_41') :outer('WSubId_40')
        .param pmc __ARG_9
# Body
# {
    .tailcall __ARG_9.'_apply'("digit")
# }

.end # WSubId_41


.sub '' :anon :subid('WSubId_42') :outer('WSubId_37')
        .param pmc __ARG_10
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
    set $P1, WSubId_43
    .tailcall $P1(__ARG_10)
# }

.end # WSubId_42


.sub '' :anon :subid('WSubId_43') :outer('WSubId_42')
        .param pmc __ARG_11
# Body
# {
    __ARG_11.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    .return($P1)
# }

.end # WSubId_43


.sub 'escapeChar' :subid('WSubId_44') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var c: $P2
    null $P2
    newclosure $P3, WSubId_45
    .tailcall $P3(self)
# }

.end # escapeChar


.sub '' :anon :subid('WSubId_45') :outer('WSubId_44')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_994 = "WSubId_994"
# Body
# {
    __ARG_1.'_applyWithArgs'("exactly", "\\")
    $P2 = __ARG_1.'_apply'("char")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "\\", $S1
    .tailcall WSubId_994($S2)
# }

.end # WSubId_45


.sub 'str' :subid('WSubId_46') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var cs: $P2
    null $P2
# var n: $P3
    null $P3
    newclosure $P4, WSubId_47
    newclosure $P5, WSubId_71
    .tailcall self.'_or'($P4, $P5)
# }

.end # str


.sub '' :anon :subid('WSubId_47') :outer('WSubId_46')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
    newclosure $P2, WSubId_48
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_47


.sub '' :anon :subid('WSubId_48') :outer('WSubId_47')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_49 = "WSubId_49"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
# switch
    $P2 = __ARG_2.'_apply'('anything')
    set $S1, $P2
    set $S2, "\""
    if $S1 == $S2 goto __label_3
    set $S2, "'"
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_49
    newclosure $P4, WSubId_58
    .tailcall __ARG_2.'_or'($P3, $P4)
  __label_4: # case
    newclosure $P5, WSubId_65
    .tailcall $P5(__ARG_2)
  __label_2: # default
    $P6 = __ARG_2.'_fail'()
    throw $P6
  __label_1: # switch end
# }

.end # WSubId_48


.sub '' :anon :subid('WSubId_49') :outer('WSubId_48')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_50 = "WSubId_50"
# Body
# {
    newclosure $P2, WSubId_50
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_49


.sub '' :anon :subid('WSubId_50') :outer('WSubId_49')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
# switch
    $P2 = __ARG_4.'_apply'('anything')
    set $S1, $P2
    set $S2, "\""
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_51
    .tailcall $P3(__ARG_4)
  __label_2: # default
    $P4 = __ARG_4.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_50


.sub '' :anon :subid('WSubId_51') :outer('WSubId_50')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
    __ARG_5.'_applyWithArgs'("exactly", "\"")
    set $P3, WSubId_52
    $P2 = __ARG_5.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_5.'_applyWithArgs'("exactly", "\"")
    __ARG_5.'_applyWithArgs'("exactly", "\"")
    __ARG_5.'_applyWithArgs'("exactly", "\"")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "str"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
# predefined join
    join $S1, "", $P4
    box $P3, $S1
    push $P2, $P3
    .return($P2)
# }

.end # WSubId_51


.sub '' :anon :subid('WSubId_52') :outer('WSubId_51')
        .param pmc __ARG_6
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
    set $P1, WSubId_53
    set $P2, WSubId_54
    .tailcall __ARG_6.'_or'($P1, $P2)
# }

.end # WSubId_52


.sub '' :anon :subid('WSubId_53') :outer('WSubId_52')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("escapeChar")
# }

.end # WSubId_53


.sub '' :anon :subid('WSubId_54') :outer('WSubId_52')
        .param pmc __ARG_8
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
    set $P1, WSubId_55
    .tailcall $P1(__ARG_8)
# }

.end # WSubId_54


.sub '' :anon :subid('WSubId_55') :outer('WSubId_54')
        .param pmc __ARG_9
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
    set $P1, WSubId_56
    __ARG_9.'_not'($P1)
    .tailcall __ARG_9.'_apply'("char")
# }

.end # WSubId_55


.sub '' :anon :subid('WSubId_56') :outer('WSubId_55')
        .param pmc __ARG_10
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
    set $P1, WSubId_57
    .tailcall $P1(__ARG_10)
# }

.end # WSubId_56


.sub '' :anon :subid('WSubId_57') :outer('WSubId_56')
        .param pmc __ARG_11
# Body
# {
    __ARG_11.'_applyWithArgs'("exactly", "\"")
    __ARG_11.'_applyWithArgs'("exactly", "\"")
    __ARG_11.'_applyWithArgs'("exactly", "\"")
    .return("\"\"\"")
# }

.end # WSubId_57


.sub '' :anon :subid('WSubId_58') :outer('WSubId_48')
        .param pmc __ARG_12
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
    newclosure $P2, WSubId_59
    .tailcall $P2(__ARG_12)
# }

.end # WSubId_58


.sub '' :anon :subid('WSubId_59') :outer('WSubId_58')
        .param pmc __ARG_13
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
    set $P3, WSubId_60
    $P2 = __ARG_13.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_13.'_applyWithArgs'("exactly", "\"")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "str"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
# predefined join
    join $S1, "", $P4
    box $P3, $S1
    push $P2, $P3
    .return($P2)
# }

.end # WSubId_59


.sub '' :anon :subid('WSubId_60') :outer('WSubId_59')
        .param pmc __ARG_14
.const 'Sub' WSubId_61 = "WSubId_61"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
    set $P1, WSubId_61
    set $P2, WSubId_62
    .tailcall __ARG_14.'_or'($P1, $P2)
# }

.end # WSubId_60


.sub '' :anon :subid('WSubId_61') :outer('WSubId_60')
        .param pmc __ARG_15
# Body
# {
    .tailcall __ARG_15.'_apply'("escapeChar")
# }

.end # WSubId_61


.sub '' :anon :subid('WSubId_62') :outer('WSubId_60')
        .param pmc __ARG_16
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
    set $P1, WSubId_63
    .tailcall $P1(__ARG_16)
# }

.end # WSubId_62


.sub '' :anon :subid('WSubId_63') :outer('WSubId_62')
        .param pmc __ARG_17
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
    set $P1, WSubId_64
    __ARG_17.'_not'($P1)
    .tailcall __ARG_17.'_apply'("char")
# }

.end # WSubId_63


.sub '' :anon :subid('WSubId_64') :outer('WSubId_63')
        .param pmc __ARG_18
# Body
# {
    .tailcall __ARG_18.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_64


.sub '' :anon :subid('WSubId_65') :outer('WSubId_48')
        .param pmc __ARG_19
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
    set $P3, WSubId_66
    $P2 = __ARG_19.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_19.'_applyWithArgs'("exactly", "'")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "str"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
# predefined join
    join $S1, "", $P4
    box $P3, $S1
    push $P2, $P3
    .return($P2)
# }

.end # WSubId_65


.sub '' :anon :subid('WSubId_66') :outer('WSubId_65')
        .param pmc __ARG_20
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
    set $P1, WSubId_67
    set $P2, WSubId_68
    .tailcall __ARG_20.'_or'($P1, $P2)
# }

.end # WSubId_66


.sub '' :anon :subid('WSubId_67') :outer('WSubId_66')
        .param pmc __ARG_21
# Body
# {
    .tailcall __ARG_21.'_apply'("escapeChar")
# }

.end # WSubId_67


.sub '' :anon :subid('WSubId_68') :outer('WSubId_66')
        .param pmc __ARG_22
.const 'Sub' WSubId_69 = "WSubId_69"
# Body
# {
    set $P1, WSubId_69
    .tailcall $P1(__ARG_22)
# }

.end # WSubId_68


.sub '' :anon :subid('WSubId_69') :outer('WSubId_68')
        .param pmc __ARG_23
.const 'Sub' WSubId_70 = "WSubId_70"
# Body
# {
    set $P1, WSubId_70
    __ARG_23.'_not'($P1)
    .tailcall __ARG_23.'_apply'("char")
# }

.end # WSubId_69


.sub '' :anon :subid('WSubId_70') :outer('WSubId_69')
        .param pmc __ARG_24
# Body
# {
    .tailcall __ARG_24.'_applyWithArgs'("exactly", "'")
# }

.end # WSubId_70


.sub '' :anon :subid('WSubId_71') :outer('WSubId_46')
        .param pmc __ARG_25
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_72 = "WSubId_72"
# Body
# {
    newclosure $P2, WSubId_72
    .tailcall $P2(__ARG_25)
# }

.end # WSubId_71


.sub '' :anon :subid('WSubId_72') :outer('WSubId_71')
        .param pmc __ARG_26
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_73 = "WSubId_73"
# Body
# {
    set $P2, WSubId_73
    $P2(__ARG_26)
    $P2 = __ARG_26.'_apply'("iName")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "str"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_72


.sub '' :anon :subid('WSubId_73') :outer('WSubId_72')
        .param pmc __ARG_27
# Body
# {
# switch
    $P1 = __ARG_27.'_apply'('anything')
    set $S1, $P1
    set $S2, "#"
    if $S1 == $S2 goto __label_3
    set $S2, "`"
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
    .return("#")
  __label_4: # case
    .return("`")
  __label_2: # default
    $P2 = __ARG_27.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_73


.sub 'special' :subid('WSubId_74') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_75 = "WSubId_75"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var s: $P2
    null $P2
    newclosure $P3, WSubId_75
    .tailcall $P3(self)
# }

.end # special


.sub '' :anon :subid('WSubId_75') :outer('WSubId_74')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
    set $P3, WSubId_76
    $P2 = $P3(__ARG_1)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    find_lex $P5, '__WLEX_1'
    push $P2, $P5
    .return($P2)
# }

.end # WSubId_75


.sub '' :anon :subid('WSubId_76') :outer('WSubId_75')
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_106 = "WSubId_106"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_114 = "WSubId_114"
# Body
# {
# switch
    $P1 = __ARG_2.'_apply'('anything')
    set $S1, $P1
    set $S2, "("
    if $S1 == $S2 goto __label_3
    set $S2, ")"
    if $S1 == $S2 goto __label_4
    set $S2, "{"
    if $S1 == $S2 goto __label_5
    set $S2, "}"
    if $S1 == $S2 goto __label_6
    set $S2, "["
    if $S1 == $S2 goto __label_7
    set $S2, "]"
    if $S1 == $S2 goto __label_8
    set $S2, ","
    if $S1 == $S2 goto __label_9
    set $S2, ";"
    if $S1 == $S2 goto __label_10
    set $S2, "?"
    if $S1 == $S2 goto __label_11
    set $S2, ":"
    if $S1 == $S2 goto __label_12
    set $S2, "!"
    if $S1 == $S2 goto __label_13
    set $S2, "="
    if $S1 == $S2 goto __label_14
    set $S2, ">"
    if $S1 == $S2 goto __label_15
    set $S2, "<"
    if $S1 == $S2 goto __label_16
    set $S2, "+"
    if $S1 == $S2 goto __label_17
    set $S2, "-"
    if $S1 == $S2 goto __label_18
    set $S2, "*"
    if $S1 == $S2 goto __label_19
    set $S2, "/"
    if $S1 == $S2 goto __label_20
    set $S2, "%"
    if $S1 == $S2 goto __label_21
    set $S2, "&"
    if $S1 == $S2 goto __label_22
    set $S2, "|"
    if $S1 == $S2 goto __label_23
    set $S2, "."
    if $S1 == $S2 goto __label_24
    goto __label_2
  __label_3: # case
    .return("(")
  __label_4: # case
    .return(")")
  __label_5: # case
    .return("{")
  __label_6: # case
    .return("}")
  __label_7: # case
    .return("[")
  __label_8: # case
    .return("]")
  __label_9: # case
    .return(",")
  __label_10: # case
    .return(";")
  __label_11: # case
    .return("?")
  __label_12: # case
    .return(":")
  __label_13: # case
    set $P2, WSubId_77
    set $P3, WSubId_82
    .tailcall __ARG_2.'_or'($P2, $P3)
  __label_14: # case
    set $P4, WSubId_83
    set $P5, WSubId_88
    .tailcall __ARG_2.'_or'($P4, $P5)
  __label_15: # case
    set $P6, WSubId_89
    set $P7, WSubId_91
    .tailcall __ARG_2.'_or'($P6, $P7)
  __label_16: # case
    set $P8, WSubId_92
    set $P9, WSubId_94
    .tailcall __ARG_2.'_or'($P8, $P9)
  __label_17: # case
    set $P10, WSubId_95
    set $P11, WSubId_97
    .tailcall __ARG_2.'_or'($P10, $P11)
  __label_18: # case
    set $P12, WSubId_98
    set $P13, WSubId_100
    .tailcall __ARG_2.'_or'($P12, $P13)
  __label_19: # case
    set $P14, WSubId_101
    set $P15, WSubId_103
    .tailcall __ARG_2.'_or'($P14, $P15)
  __label_20: # case
    set $P16, WSubId_104
    set $P17, WSubId_106
    .tailcall __ARG_2.'_or'($P16, $P17)
  __label_21: # case
    set $P18, WSubId_107
    set $P19, WSubId_109
    .tailcall __ARG_2.'_or'($P18, $P19)
  __label_22: # case
    set $P20, WSubId_110
    .tailcall $P20(__ARG_2)
  __label_23: # case
    set $P21, WSubId_114
    .tailcall $P21(__ARG_2)
  __label_24: # case
    .return(".")
  __label_2: # default
    $P22 = __ARG_2.'_fail'()
    throw $P22
  __label_1: # switch end
# }

.end # WSubId_76


.sub '' :anon :subid('WSubId_77') :outer('WSubId_76')
        .param pmc __ARG_3
.const 'Sub' WSubId_78 = "WSubId_78"
# Body
# {
    set $P1, WSubId_78
    .tailcall $P1(__ARG_3)
# }

.end # WSubId_77


.sub '' :anon :subid('WSubId_78') :outer('WSubId_77')
        .param pmc __ARG_4
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_81 = "WSubId_81"
# Body
# {
# switch
    $P1 = __ARG_4.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    set $P2, WSubId_79
    set $P3, WSubId_81
    .tailcall __ARG_4.'_or'($P2, $P3)
  __label_2: # default
    $P4 = __ARG_4.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_78


.sub '' :anon :subid('WSubId_79') :outer('WSubId_78')
        .param pmc __ARG_5
.const 'Sub' WSubId_80 = "WSubId_80"
# Body
# {
    set $P1, WSubId_80
    .tailcall $P1(__ARG_5)
# }

.end # WSubId_79


.sub '' :anon :subid('WSubId_80') :outer('WSubId_79')
        .param pmc __ARG_6
# Body
# {
# switch
    $P1 = __ARG_6.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return("!==")
  __label_2: # default
    $P2 = __ARG_6.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_80


.sub '' :anon :subid('WSubId_81') :outer('WSubId_78')
        .param pmc __ARG_7
# Body
# {
    .return("!=")
# }

.end # WSubId_81


.sub '' :anon :subid('WSubId_82') :outer('WSubId_76')
        .param pmc __ARG_8
# Body
# {
    .return("!")
# }

.end # WSubId_82


.sub '' :anon :subid('WSubId_83') :outer('WSubId_76')
        .param pmc __ARG_9
.const 'Sub' WSubId_84 = "WSubId_84"
# Body
# {
    set $P1, WSubId_84
    .tailcall $P1(__ARG_9)
# }

.end # WSubId_83


.sub '' :anon :subid('WSubId_84') :outer('WSubId_83')
        .param pmc __ARG_10
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_87 = "WSubId_87"
# Body
# {
# switch
    $P1 = __ARG_10.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    set $P2, WSubId_85
    set $P3, WSubId_87
    .tailcall __ARG_10.'_or'($P2, $P3)
  __label_2: # default
    $P4 = __ARG_10.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_84


.sub '' :anon :subid('WSubId_85') :outer('WSubId_84')
        .param pmc __ARG_11
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
    set $P1, WSubId_86
    .tailcall $P1(__ARG_11)
# }

.end # WSubId_85


.sub '' :anon :subid('WSubId_86') :outer('WSubId_85')
        .param pmc __ARG_12
# Body
# {
# switch
    $P1 = __ARG_12.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return("===")
  __label_2: # default
    $P2 = __ARG_12.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_86


.sub '' :anon :subid('WSubId_87') :outer('WSubId_84')
        .param pmc __ARG_13
# Body
# {
    .return("==")
# }

.end # WSubId_87


.sub '' :anon :subid('WSubId_88') :outer('WSubId_76')
        .param pmc __ARG_14
# Body
# {
    .return("=")
# }

.end # WSubId_88


.sub '' :anon :subid('WSubId_89') :outer('WSubId_76')
        .param pmc __ARG_15
.const 'Sub' WSubId_90 = "WSubId_90"
# Body
# {
    set $P1, WSubId_90
    .tailcall $P1(__ARG_15)
# }

.end # WSubId_89


.sub '' :anon :subid('WSubId_90') :outer('WSubId_89')
        .param pmc __ARG_16
# Body
# {
# switch
    $P1 = __ARG_16.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return(">=")
  __label_2: # default
    $P2 = __ARG_16.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_90


.sub '' :anon :subid('WSubId_91') :outer('WSubId_76')
        .param pmc __ARG_17
# Body
# {
    .return(">")
# }

.end # WSubId_91


.sub '' :anon :subid('WSubId_92') :outer('WSubId_76')
        .param pmc __ARG_18
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
    set $P1, WSubId_93
    .tailcall $P1(__ARG_18)
# }

.end # WSubId_92


.sub '' :anon :subid('WSubId_93') :outer('WSubId_92')
        .param pmc __ARG_19
# Body
# {
# switch
    $P1 = __ARG_19.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return("<=")
  __label_2: # default
    $P2 = __ARG_19.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_93


.sub '' :anon :subid('WSubId_94') :outer('WSubId_76')
        .param pmc __ARG_20
# Body
# {
    .return("<")
# }

.end # WSubId_94


.sub '' :anon :subid('WSubId_95') :outer('WSubId_76')
        .param pmc __ARG_21
.const 'Sub' WSubId_96 = "WSubId_96"
# Body
# {
    set $P1, WSubId_96
    .tailcall $P1(__ARG_21)
# }

.end # WSubId_95


.sub '' :anon :subid('WSubId_96') :outer('WSubId_95')
        .param pmc __ARG_22
# Body
# {
# switch
    $P1 = __ARG_22.'_apply'('anything')
    set $S1, $P1
    set $S2, "+"
    if $S1 == $S2 goto __label_3
    set $S2, "="
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
    .return("++")
  __label_4: # case
    .return("+=")
  __label_2: # default
    $P2 = __ARG_22.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_96


.sub '' :anon :subid('WSubId_97') :outer('WSubId_76')
        .param pmc __ARG_23
# Body
# {
    .return("+")
# }

.end # WSubId_97


.sub '' :anon :subid('WSubId_98') :outer('WSubId_76')
        .param pmc __ARG_24
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
    set $P1, WSubId_99
    .tailcall $P1(__ARG_24)
# }

.end # WSubId_98


.sub '' :anon :subid('WSubId_99') :outer('WSubId_98')
        .param pmc __ARG_25
# Body
# {
# switch
    $P1 = __ARG_25.'_apply'('anything')
    set $S1, $P1
    set $S2, "-"
    if $S1 == $S2 goto __label_3
    set $S2, "="
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
    .return("--")
  __label_4: # case
    .return("-=")
  __label_2: # default
    $P2 = __ARG_25.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_99


.sub '' :anon :subid('WSubId_100') :outer('WSubId_76')
        .param pmc __ARG_26
# Body
# {
    .return("-")
# }

.end # WSubId_100


.sub '' :anon :subid('WSubId_101') :outer('WSubId_76')
        .param pmc __ARG_27
.const 'Sub' WSubId_102 = "WSubId_102"
# Body
# {
    set $P1, WSubId_102
    .tailcall $P1(__ARG_27)
# }

.end # WSubId_101


.sub '' :anon :subid('WSubId_102') :outer('WSubId_101')
        .param pmc __ARG_28
# Body
# {
# switch
    $P1 = __ARG_28.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return("*=")
  __label_2: # default
    $P2 = __ARG_28.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_102


.sub '' :anon :subid('WSubId_103') :outer('WSubId_76')
        .param pmc __ARG_29
# Body
# {
    .return("*")
# }

.end # WSubId_103


.sub '' :anon :subid('WSubId_104') :outer('WSubId_76')
        .param pmc __ARG_30
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
    set $P1, WSubId_105
    .tailcall $P1(__ARG_30)
# }

.end # WSubId_104


.sub '' :anon :subid('WSubId_105') :outer('WSubId_104')
        .param pmc __ARG_31
# Body
# {
# switch
    $P1 = __ARG_31.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return("/=")
  __label_2: # default
    $P2 = __ARG_31.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_105


.sub '' :anon :subid('WSubId_106') :outer('WSubId_76')
        .param pmc __ARG_32
# Body
# {
    .return("/")
# }

.end # WSubId_106


.sub '' :anon :subid('WSubId_107') :outer('WSubId_76')
        .param pmc __ARG_33
.const 'Sub' WSubId_108 = "WSubId_108"
# Body
# {
    set $P1, WSubId_108
    .tailcall $P1(__ARG_33)
# }

.end # WSubId_107


.sub '' :anon :subid('WSubId_108') :outer('WSubId_107')
        .param pmc __ARG_34
# Body
# {
# switch
    $P1 = __ARG_34.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return("%=")
  __label_2: # default
    $P2 = __ARG_34.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_108


.sub '' :anon :subid('WSubId_109') :outer('WSubId_76')
        .param pmc __ARG_35
# Body
# {
    .return("%")
# }

.end # WSubId_109


.sub '' :anon :subid('WSubId_110') :outer('WSubId_76')
        .param pmc __ARG_36
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_113 = "WSubId_113"
# Body
# {
# switch
    $P1 = __ARG_36.'_apply'('anything')
    set $S1, $P1
    set $S2, "&"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    set $P2, WSubId_111
    set $P3, WSubId_113
    .tailcall __ARG_36.'_or'($P2, $P3)
  __label_2: # default
    $P4 = __ARG_36.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_110


.sub '' :anon :subid('WSubId_111') :outer('WSubId_110')
        .param pmc __ARG_37
.const 'Sub' WSubId_112 = "WSubId_112"
# Body
# {
    set $P1, WSubId_112
    .tailcall $P1(__ARG_37)
# }

.end # WSubId_111


.sub '' :anon :subid('WSubId_112') :outer('WSubId_111')
        .param pmc __ARG_38
# Body
# {
# switch
    $P1 = __ARG_38.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return("&&=")
  __label_2: # default
    $P2 = __ARG_38.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_112


.sub '' :anon :subid('WSubId_113') :outer('WSubId_110')
        .param pmc __ARG_39
# Body
# {
    .return("&&")
# }

.end # WSubId_113


.sub '' :anon :subid('WSubId_114') :outer('WSubId_76')
        .param pmc __ARG_40
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_117 = "WSubId_117"
# Body
# {
# switch
    $P1 = __ARG_40.'_apply'('anything')
    set $S1, $P1
    set $S2, "|"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    set $P2, WSubId_115
    set $P3, WSubId_117
    .tailcall __ARG_40.'_or'($P2, $P3)
  __label_2: # default
    $P4 = __ARG_40.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_114


.sub '' :anon :subid('WSubId_115') :outer('WSubId_114')
        .param pmc __ARG_41
.const 'Sub' WSubId_116 = "WSubId_116"
# Body
# {
    set $P1, WSubId_116
    .tailcall $P1(__ARG_41)
# }

.end # WSubId_115


.sub '' :anon :subid('WSubId_116') :outer('WSubId_115')
        .param pmc __ARG_42
# Body
# {
# switch
    $P1 = __ARG_42.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return("||=")
  __label_2: # default
    $P2 = __ARG_42.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_116


.sub '' :anon :subid('WSubId_117') :outer('WSubId_114')
        .param pmc __ARG_43
# Body
# {
    .return("||")
# }

.end # WSubId_117


.sub 'tok' :subid('WSubId_118') :method
.const 'Sub' WSubId_119 = "WSubId_119"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_119
    .tailcall $P2(self)
# }

.end # tok


.sub '' :anon :subid('WSubId_119') :outer('WSubId_118')
        .param pmc __ARG_1
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_121 = "WSubId_121"
.const 'Sub' WSubId_122 = "WSubId_122"
.const 'Sub' WSubId_123 = "WSubId_123"
.const 'Sub' WSubId_124 = "WSubId_124"
# Body
# {
    __ARG_1.'_apply'("spaces")
    set $P1, WSubId_120
    set $P2, WSubId_121
    set $P3, WSubId_122
    set $P4, WSubId_123
    set $P5, WSubId_124
    .tailcall __ARG_1.'_or'($P1, $P2, $P3, $P4, $P5)
# }

.end # WSubId_119


.sub '' :anon :subid('WSubId_120') :outer('WSubId_119')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("keyword")
# }

.end # WSubId_120


.sub '' :anon :subid('WSubId_121') :outer('WSubId_119')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("nameTok")
# }

.end # WSubId_121


.sub '' :anon :subid('WSubId_122') :outer('WSubId_119')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("number")
# }

.end # WSubId_122


.sub '' :anon :subid('WSubId_123') :outer('WSubId_119')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("str")
# }

.end # WSubId_123


.sub '' :anon :subid('WSubId_124') :outer('WSubId_119')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("special")
# }

.end # WSubId_124


.sub 'toks' :subid('WSubId_125') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_126 = "WSubId_126"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var ts: $P2
    null $P2
    newclosure $P3, WSubId_126
    .tailcall $P3(self)
# }

.end # toks


.sub '' :anon :subid('WSubId_126') :outer('WSubId_125')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_127 = "WSubId_127"
# Body
# {
    set $P3, WSubId_127
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_1.'_apply'("spaces")
    __ARG_1.'_apply'("end")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_126


.sub '' :anon :subid('WSubId_127') :outer('WSubId_126')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("token")
# }

.end # WSubId_127


.sub 'token' :subid('WSubId_128') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_129 = "WSubId_129"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var tt: $P2
    null $P2
# var t: $P3
    null $P3
    newclosure $P4, WSubId_129
    .tailcall $P4(self)
# }

.end # token


.sub '' :anon :subid('WSubId_129') :outer('WSubId_128')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("tok")
store_lex '__WLEX_2', $P3
    find_lex $P4, '__WLEX_2'
    $P3 = $P4[0]
    find_lex $P5, '__WLEX_1'
    iseq $I1, $P3, $P5
    __ARG_1.'_pred'($I1)
    find_lex $P4, '__WLEX_2'
    $P3 = $P4[1]
    .return($P3)
# }

.end # WSubId_129


.sub 'name' :subid('WSubId_130') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_131 = "WSubId_131"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var t: $P2
    null $P2
    newclosure $P3, WSubId_131
    .tailcall $P3(self)
# }

.end # name


.sub '' :anon :subid('WSubId_131') :outer('WSubId_130')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_apply'("spaces")
    $P2 = __ARG_1.'_apply'("nameTok")
store_lex '__WLEX_1', $P2
    find_lex $P3, '__WLEX_1'
    $P2 = $P3[1]
    .return($P2)
# }

.end # WSubId_131


.sub 'expr' :subid('WSubId_132') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_133 = "WSubId_133"
# Body
# {
# var fromIdx: $P1
    getattribute $P6, self, 'input'
    getattribute $P1, $P6, 'idx'
# var e: $P2
    null $P2
# var t: $P3
    null $P3
# var f: $P4
    null $P4
# var rhs: $P5
    null $P5
    newclosure $P6, WSubId_133
    .tailcall $P6(self)
# }

.end # expr


.sub '' :anon :subid('WSubId_133') :outer('WSubId_132')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_4'
.const 'Sub' WSubId_134 = "WSubId_134"
.const 'Sub' WSubId_136 = "WSubId_136"
.const 'Sub' WSubId_138 = "WSubId_138"
.const 'Sub' WSubId_140 = "WSubId_140"
.const 'Sub' WSubId_142 = "WSubId_142"
.const 'Sub' WSubId_144 = "WSubId_144"
.const 'Sub' WSubId_146 = "WSubId_146"
.const 'Sub' WSubId_148 = "WSubId_148"
.const 'Sub' WSubId_150 = "WSubId_150"
.const 'Sub' WSubId_152 = "WSubId_152"
# Body
# {
    $P5 = __ARG_1.'_apply'("orExpr")
store_lex '__WLEX_1', $P5
    newclosure $P5, WSubId_134
    newclosure $P6, WSubId_136
    newclosure $P7, WSubId_138
    newclosure $P8, WSubId_140
    newclosure $P9, WSubId_142
    newclosure $P10, WSubId_144
    newclosure $P11, WSubId_146
    newclosure $P12, WSubId_148
    newclosure $P13, WSubId_150
    newclosure $P14, WSubId_152
    .tailcall __ARG_1.'_or'($P5, $P6, $P7, $P8, $P9, $P10, $P11, $P12, $P13, $P14)
# }

.end # WSubId_133


.sub '' :anon :subid('WSubId_134') :outer('WSubId_133')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_1'
.const 'Sub' WSubId_135 = "WSubId_135"
# Body
# {
    newclosure $P4, WSubId_135
    .tailcall $P4(__ARG_2)
# }

.end # WSubId_134


.sub '' :anon :subid('WSubId_135') :outer('WSubId_134')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "?")
    $P4 = __ARG_3.'_apply'("expr")
store_lex '__WLEX_2', $P4
    __ARG_3.'_applyWithArgs'("token", ":")
    $P4 = __ARG_3.'_apply'("expr")
store_lex '__WLEX_3', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "condExpr"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    push $P4, $P6
    find_lex $P7, '__WLEX_2'
    push $P4, $P7
    find_lex $P8, '__WLEX_3'
    push $P4, $P8
    .return($P4)
# }

.end # WSubId_135


.sub '' :anon :subid('WSubId_136') :outer('WSubId_133')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_137 = "WSubId_137"
# Body
# {
    newclosure $P3, WSubId_137
    .tailcall $P3(__ARG_4)
# }

.end # WSubId_136


.sub '' :anon :subid('WSubId_137') :outer('WSubId_136')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_5.'_applyWithArgs'("token", "=")
    $P3 = __ARG_5.'_apply'("expr")
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "set"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_4'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_137


.sub '' :anon :subid('WSubId_138') :outer('WSubId_133')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_139 = "WSubId_139"
# Body
# {
    newclosure $P3, WSubId_139
    .tailcall $P3(__ARG_6)
# }

.end # WSubId_138


.sub '' :anon :subid('WSubId_139') :outer('WSubId_138')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_7.'_applyWithArgs'("token", "+=")
    $P3 = __ARG_7.'_apply'("expr")
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "mset"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    box $P4, "+"
    push $P3, $P4
    find_lex $P6, '__WLEX_4'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_139


.sub '' :anon :subid('WSubId_140') :outer('WSubId_133')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_141 = "WSubId_141"
# Body
# {
    newclosure $P3, WSubId_141
    .tailcall $P3(__ARG_8)
# }

.end # WSubId_140


.sub '' :anon :subid('WSubId_141') :outer('WSubId_140')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_9.'_applyWithArgs'("token", "-=")
    $P3 = __ARG_9.'_apply'("expr")
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "mset"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    box $P4, "-"
    push $P3, $P4
    find_lex $P6, '__WLEX_4'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_141


.sub '' :anon :subid('WSubId_142') :outer('WSubId_133')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_143 = "WSubId_143"
# Body
# {
    newclosure $P3, WSubId_143
    .tailcall $P3(__ARG_10)
# }

.end # WSubId_142


.sub '' :anon :subid('WSubId_143') :outer('WSubId_142')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_11.'_applyWithArgs'("token", "*=")
    $P3 = __ARG_11.'_apply'("expr")
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "mset"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    box $P4, "*"
    push $P3, $P4
    find_lex $P6, '__WLEX_4'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_143


.sub '' :anon :subid('WSubId_144') :outer('WSubId_133')
        .param pmc __ARG_12
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_145 = "WSubId_145"
# Body
# {
    newclosure $P3, WSubId_145
    .tailcall $P3(__ARG_12)
# }

.end # WSubId_144


.sub '' :anon :subid('WSubId_145') :outer('WSubId_144')
        .param pmc __ARG_13
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_13.'_applyWithArgs'("token", "/=")
    $P3 = __ARG_13.'_apply'("expr")
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "mset"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    box $P4, "/"
    push $P3, $P4
    find_lex $P6, '__WLEX_4'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_145


.sub '' :anon :subid('WSubId_146') :outer('WSubId_133')
        .param pmc __ARG_14
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_147 = "WSubId_147"
# Body
# {
    newclosure $P3, WSubId_147
    .tailcall $P3(__ARG_14)
# }

.end # WSubId_146


.sub '' :anon :subid('WSubId_147') :outer('WSubId_146')
        .param pmc __ARG_15
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_15.'_applyWithArgs'("token", "%=")
    $P3 = __ARG_15.'_apply'("expr")
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "mset"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    box $P4, "%"
    push $P3, $P4
    find_lex $P6, '__WLEX_4'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_147


.sub '' :anon :subid('WSubId_148') :outer('WSubId_133')
        .param pmc __ARG_16
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_149 = "WSubId_149"
# Body
# {
    newclosure $P3, WSubId_149
    .tailcall $P3(__ARG_16)
# }

.end # WSubId_148


.sub '' :anon :subid('WSubId_149') :outer('WSubId_148')
        .param pmc __ARG_17
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_17.'_applyWithArgs'("token", "&&=")
    $P3 = __ARG_17.'_apply'("expr")
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "mset"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    box $P4, "&&"
    push $P3, $P4
    find_lex $P6, '__WLEX_4'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_149


.sub '' :anon :subid('WSubId_150') :outer('WSubId_133')
        .param pmc __ARG_18
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_151 = "WSubId_151"
# Body
# {
    newclosure $P3, WSubId_151
    .tailcall $P3(__ARG_18)
# }

.end # WSubId_150


.sub '' :anon :subid('WSubId_151') :outer('WSubId_150')
        .param pmc __ARG_19
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_19.'_applyWithArgs'("token", "||=")
    $P3 = __ARG_19.'_apply'("expr")
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "mset"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    box $P4, "||"
    push $P3, $P4
    find_lex $P6, '__WLEX_4'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_151


.sub '' :anon :subid('WSubId_152') :outer('WSubId_133')
        .param pmc __ARG_20
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_153 = "WSubId_153"
# Body
# {
    newclosure $P2, WSubId_153
    .tailcall $P2(__ARG_20)
# }

.end # WSubId_152


.sub '' :anon :subid('WSubId_153') :outer('WSubId_152')
        .param pmc __ARG_21
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_21.'_apply'("empty")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_153


.sub 'orExpr' :subid('WSubId_154') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_155 = "WSubId_155"
.const 'Sub' WSubId_157 = "WSubId_157"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_155
    set $P5, WSubId_157
    .tailcall self.'_or'($P4, $P5)
# }

.end # orExpr


.sub '' :anon :subid('WSubId_155') :outer('WSubId_154')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_156 = "WSubId_156"
# Body
# {
    newclosure $P3, WSubId_156
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_155


.sub '' :anon :subid('WSubId_156') :outer('WSubId_155')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("orExpr")
store_lex '__WLEX_1', $P3
    __ARG_2.'_applyWithArgs'("token", "||")
    $P3 = __ARG_2.'_apply'("andExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "||"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_156


.sub '' :anon :subid('WSubId_157') :outer('WSubId_154')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("andExpr")
# }

.end # WSubId_157


.sub 'andExpr' :subid('WSubId_158') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_159 = "WSubId_159"
.const 'Sub' WSubId_161 = "WSubId_161"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_159
    set $P5, WSubId_161
    .tailcall self.'_or'($P4, $P5)
# }

.end # andExpr


.sub '' :anon :subid('WSubId_159') :outer('WSubId_158')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_160 = "WSubId_160"
# Body
# {
    newclosure $P3, WSubId_160
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_159


.sub '' :anon :subid('WSubId_160') :outer('WSubId_159')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("andExpr")
store_lex '__WLEX_1', $P3
    __ARG_2.'_applyWithArgs'("token", "&&")
    $P3 = __ARG_2.'_apply'("eqExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "&&"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_160


.sub '' :anon :subid('WSubId_161') :outer('WSubId_158')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("eqExpr")
# }

.end # WSubId_161


.sub 'eqExpr' :subid('WSubId_162') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_163 = "WSubId_163"
.const 'Sub' WSubId_173 = "WSubId_173"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_163
    set $P5, WSubId_173
    .tailcall self.'_or'($P4, $P5)
# }

.end # eqExpr


.sub '' :anon :subid('WSubId_163') :outer('WSubId_162')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_164 = "WSubId_164"
# Body
# {
    newclosure $P3, WSubId_164
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_163


.sub '' :anon :subid('WSubId_164') :outer('WSubId_163')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_165 = "WSubId_165"
.const 'Sub' WSubId_167 = "WSubId_167"
.const 'Sub' WSubId_169 = "WSubId_169"
.const 'Sub' WSubId_171 = "WSubId_171"
# Body
# {
    $P3 = __ARG_2.'_apply'("eqExpr")
store_lex '__WLEX_1', $P3
    newclosure $P3, WSubId_165
    newclosure $P4, WSubId_167
    newclosure $P5, WSubId_169
    newclosure $P6, WSubId_171
    .tailcall __ARG_2.'_or'($P3, $P4, $P5, $P6)
# }

.end # WSubId_164


.sub '' :anon :subid('WSubId_165') :outer('WSubId_164')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_166 = "WSubId_166"
# Body
# {
    newclosure $P3, WSubId_166
    .tailcall $P3(__ARG_3)
# }

.end # WSubId_165


.sub '' :anon :subid('WSubId_166') :outer('WSubId_165')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "==")
    $P3 = __ARG_4.'_apply'("relExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "=="
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_166


.sub '' :anon :subid('WSubId_167') :outer('WSubId_164')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_168 = "WSubId_168"
# Body
# {
    newclosure $P3, WSubId_168
    .tailcall $P3(__ARG_5)
# }

.end # WSubId_167


.sub '' :anon :subid('WSubId_168') :outer('WSubId_167')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_6.'_applyWithArgs'("token", "!=")
    $P3 = __ARG_6.'_apply'("relExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "!="
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_168


.sub '' :anon :subid('WSubId_169') :outer('WSubId_164')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_170 = "WSubId_170"
# Body
# {
    newclosure $P3, WSubId_170
    .tailcall $P3(__ARG_7)
# }

.end # WSubId_169


.sub '' :anon :subid('WSubId_170') :outer('WSubId_169')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_8.'_applyWithArgs'("token", "===")
    $P3 = __ARG_8.'_apply'("relExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "==="
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_170


.sub '' :anon :subid('WSubId_171') :outer('WSubId_164')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_172 = "WSubId_172"
# Body
# {
    newclosure $P3, WSubId_172
    .tailcall $P3(__ARG_9)
# }

.end # WSubId_171


.sub '' :anon :subid('WSubId_172') :outer('WSubId_171')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_10.'_applyWithArgs'("token", "!==")
    $P3 = __ARG_10.'_apply'("relExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "!=="
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_172


.sub '' :anon :subid('WSubId_173') :outer('WSubId_162')
        .param pmc __ARG_11
# Body
# {
    .tailcall __ARG_11.'_apply'("relExpr")
# }

.end # WSubId_173


.sub 'relExpr' :subid('WSubId_174') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_175 = "WSubId_175"
.const 'Sub' WSubId_187 = "WSubId_187"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_175
    set $P5, WSubId_187
    .tailcall self.'_or'($P4, $P5)
# }

.end # relExpr


.sub '' :anon :subid('WSubId_175') :outer('WSubId_174')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_176 = "WSubId_176"
# Body
# {
    newclosure $P3, WSubId_176
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_175


.sub '' :anon :subid('WSubId_176') :outer('WSubId_175')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_177 = "WSubId_177"
.const 'Sub' WSubId_179 = "WSubId_179"
.const 'Sub' WSubId_181 = "WSubId_181"
.const 'Sub' WSubId_183 = "WSubId_183"
.const 'Sub' WSubId_185 = "WSubId_185"
# Body
# {
    $P3 = __ARG_2.'_apply'("relExpr")
store_lex '__WLEX_1', $P3
    newclosure $P3, WSubId_177
    newclosure $P4, WSubId_179
    newclosure $P5, WSubId_181
    newclosure $P6, WSubId_183
    newclosure $P7, WSubId_185
    .tailcall __ARG_2.'_or'($P3, $P4, $P5, $P6, $P7)
# }

.end # WSubId_176


.sub '' :anon :subid('WSubId_177') :outer('WSubId_176')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_178 = "WSubId_178"
# Body
# {
    newclosure $P3, WSubId_178
    .tailcall $P3(__ARG_3)
# }

.end # WSubId_177


.sub '' :anon :subid('WSubId_178') :outer('WSubId_177')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", ">")
    $P3 = __ARG_4.'_apply'("addExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, ">"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_178


.sub '' :anon :subid('WSubId_179') :outer('WSubId_176')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_180 = "WSubId_180"
# Body
# {
    newclosure $P3, WSubId_180
    .tailcall $P3(__ARG_5)
# }

.end # WSubId_179


.sub '' :anon :subid('WSubId_180') :outer('WSubId_179')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_6.'_applyWithArgs'("token", ">=")
    $P3 = __ARG_6.'_apply'("addExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, ">="
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_180


.sub '' :anon :subid('WSubId_181') :outer('WSubId_176')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_182 = "WSubId_182"
# Body
# {
    newclosure $P3, WSubId_182
    .tailcall $P3(__ARG_7)
# }

.end # WSubId_181


.sub '' :anon :subid('WSubId_182') :outer('WSubId_181')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_8.'_applyWithArgs'("token", "<")
    $P3 = __ARG_8.'_apply'("addExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "<"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_182


.sub '' :anon :subid('WSubId_183') :outer('WSubId_176')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_184 = "WSubId_184"
# Body
# {
    newclosure $P3, WSubId_184
    .tailcall $P3(__ARG_9)
# }

.end # WSubId_183


.sub '' :anon :subid('WSubId_184') :outer('WSubId_183')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_10.'_applyWithArgs'("token", "<=")
    $P3 = __ARG_10.'_apply'("addExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "<="
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_184


.sub '' :anon :subid('WSubId_185') :outer('WSubId_176')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_186 = "WSubId_186"
# Body
# {
    newclosure $P3, WSubId_186
    .tailcall $P3(__ARG_11)
# }

.end # WSubId_185


.sub '' :anon :subid('WSubId_186') :outer('WSubId_185')
        .param pmc __ARG_12
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_12.'_applyWithArgs'("token", "instanceof")
    $P3 = __ARG_12.'_apply'("addExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "instanceof"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_186


.sub '' :anon :subid('WSubId_187') :outer('WSubId_174')
        .param pmc __ARG_13
# Body
# {
    .tailcall __ARG_13.'_apply'("addExpr")
# }

.end # WSubId_187


.sub 'addExpr' :subid('WSubId_188') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_189 = "WSubId_189"
.const 'Sub' WSubId_191 = "WSubId_191"
.const 'Sub' WSubId_193 = "WSubId_193"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_189
    newclosure $P5, WSubId_191
    set $P6, WSubId_193
    .tailcall self.'_or'($P4, $P5, $P6)
# }

.end # addExpr


.sub '' :anon :subid('WSubId_189') :outer('WSubId_188')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_190 = "WSubId_190"
# Body
# {
    newclosure $P3, WSubId_190
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_189


.sub '' :anon :subid('WSubId_190') :outer('WSubId_189')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("addExpr")
store_lex '__WLEX_1', $P3
    __ARG_2.'_applyWithArgs'("token", "+")
    $P3 = __ARG_2.'_apply'("mulExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "+"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_190


.sub '' :anon :subid('WSubId_191') :outer('WSubId_188')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_192 = "WSubId_192"
# Body
# {
    newclosure $P3, WSubId_192
    .tailcall $P3(__ARG_3)
# }

.end # WSubId_191


.sub '' :anon :subid('WSubId_192') :outer('WSubId_191')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_4.'_apply'("addExpr")
store_lex '__WLEX_1', $P3
    __ARG_4.'_applyWithArgs'("token", "-")
    $P3 = __ARG_4.'_apply'("mulExpr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "-"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_192


.sub '' :anon :subid('WSubId_193') :outer('WSubId_188')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("mulExpr")
# }

.end # WSubId_193


.sub 'mulExpr' :subid('WSubId_194') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_195 = "WSubId_195"
.const 'Sub' WSubId_197 = "WSubId_197"
.const 'Sub' WSubId_199 = "WSubId_199"
.const 'Sub' WSubId_201 = "WSubId_201"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_195
    newclosure $P5, WSubId_197
    newclosure $P6, WSubId_199
    set $P7, WSubId_201
    .tailcall self.'_or'($P4, $P5, $P6, $P7)
# }

.end # mulExpr


.sub '' :anon :subid('WSubId_195') :outer('WSubId_194')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_196 = "WSubId_196"
# Body
# {
    newclosure $P3, WSubId_196
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_195


.sub '' :anon :subid('WSubId_196') :outer('WSubId_195')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("mulExpr")
store_lex '__WLEX_1', $P3
    __ARG_2.'_applyWithArgs'("token", "*")
    $P3 = __ARG_2.'_apply'("unary")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "*"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_196


.sub '' :anon :subid('WSubId_197') :outer('WSubId_194')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_198 = "WSubId_198"
# Body
# {
    newclosure $P3, WSubId_198
    .tailcall $P3(__ARG_3)
# }

.end # WSubId_197


.sub '' :anon :subid('WSubId_198') :outer('WSubId_197')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_4.'_apply'("mulExpr")
store_lex '__WLEX_1', $P3
    __ARG_4.'_applyWithArgs'("token", "/")
    $P3 = __ARG_4.'_apply'("unary")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "/"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_198


.sub '' :anon :subid('WSubId_199') :outer('WSubId_194')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_200 = "WSubId_200"
# Body
# {
    newclosure $P3, WSubId_200
    .tailcall $P3(__ARG_5)
# }

.end # WSubId_199


.sub '' :anon :subid('WSubId_200') :outer('WSubId_199')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_6.'_apply'("mulExpr")
store_lex '__WLEX_1', $P3
    __ARG_6.'_applyWithArgs'("token", "%")
    $P3 = __ARG_6.'_apply'("unary")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binop"
    push $P3, $P4
    box $P4, "%"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_200


.sub '' :anon :subid('WSubId_201') :outer('WSubId_194')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("unary")
# }

.end # WSubId_201


.sub 'unary' :subid('WSubId_202') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_203 = "WSubId_203"
.const 'Sub' WSubId_205 = "WSubId_205"
.const 'Sub' WSubId_207 = "WSubId_207"
.const 'Sub' WSubId_209 = "WSubId_209"
.const 'Sub' WSubId_211 = "WSubId_211"
.const 'Sub' WSubId_213 = "WSubId_213"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var p: $P2
    null $P2
    newclosure $P3, WSubId_203
    newclosure $P4, WSubId_205
    newclosure $P5, WSubId_207
    newclosure $P6, WSubId_209
    newclosure $P7, WSubId_211
    set $P8, WSubId_213
    .tailcall self.'_or'($P3, $P4, $P5, $P6, $P7, $P8)
# }

.end # unary


.sub '' :anon :subid('WSubId_203') :outer('WSubId_202')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_204 = "WSubId_204"
# Body
# {
    newclosure $P2, WSubId_204
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_203


.sub '' :anon :subid('WSubId_204') :outer('WSubId_203')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "-")
    $P2 = __ARG_2.'_apply'("postfix")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "unop"
    push $P2, $P3
    box $P3, "-"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_204


.sub '' :anon :subid('WSubId_205') :outer('WSubId_202')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_206 = "WSubId_206"
# Body
# {
    newclosure $P2, WSubId_206
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_205


.sub '' :anon :subid('WSubId_206') :outer('WSubId_205')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "+")
    $P2 = __ARG_4.'_apply'("postfix")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "unop"
    push $P2, $P3
    box $P3, "+"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_206


.sub '' :anon :subid('WSubId_207') :outer('WSubId_202')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_208 = "WSubId_208"
# Body
# {
    newclosure $P2, WSubId_208
    .tailcall $P2(__ARG_5)
# }

.end # WSubId_207


.sub '' :anon :subid('WSubId_208') :outer('WSubId_207')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_6.'_applyWithArgs'("token", "++")
    $P2 = __ARG_6.'_apply'("postfix")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "preop"
    push $P2, $P3
    box $P3, "++"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_208


.sub '' :anon :subid('WSubId_209') :outer('WSubId_202')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_210 = "WSubId_210"
# Body
# {
    newclosure $P2, WSubId_210
    .tailcall $P2(__ARG_7)
# }

.end # WSubId_209


.sub '' :anon :subid('WSubId_210') :outer('WSubId_209')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_8.'_applyWithArgs'("token", "--")
    $P2 = __ARG_8.'_apply'("postfix")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "preop"
    push $P2, $P3
    box $P3, "--"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_210


.sub '' :anon :subid('WSubId_211') :outer('WSubId_202')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_212 = "WSubId_212"
# Body
# {
    newclosure $P2, WSubId_212
    .tailcall $P2(__ARG_9)
# }

.end # WSubId_211


.sub '' :anon :subid('WSubId_212') :outer('WSubId_211')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_10.'_applyWithArgs'("token", "!")
    $P2 = __ARG_10.'_apply'("unary")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "unop"
    push $P2, $P3
    box $P3, "!"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_212


.sub '' :anon :subid('WSubId_213') :outer('WSubId_202')
        .param pmc __ARG_11
# Body
# {
    .tailcall __ARG_11.'_apply'("postfix")
# }

.end # WSubId_213


.sub 'postfix' :subid('WSubId_214') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_215 = "WSubId_215"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var p: $P2
    null $P2
    newclosure $P3, WSubId_215
    .tailcall $P3(self)
# }

.end # postfix


.sub '' :anon :subid('WSubId_215') :outer('WSubId_214')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_216 = "WSubId_216"
.const 'Sub' WSubId_218 = "WSubId_218"
.const 'Sub' WSubId_220 = "WSubId_220"
# Body
# {
    $P2 = __ARG_1.'_apply'("primExpr")
store_lex '__WLEX_1', $P2
    newclosure $P2, WSubId_216
    newclosure $P3, WSubId_218
    newclosure $P4, WSubId_220
    .tailcall __ARG_1.'_or'($P2, $P3, $P4)
# }

.end # WSubId_215


.sub '' :anon :subid('WSubId_216') :outer('WSubId_215')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_217 = "WSubId_217"
# Body
# {
    newclosure $P2, WSubId_217
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_216


.sub '' :anon :subid('WSubId_217') :outer('WSubId_216')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "++")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "postop"
    push $P2, $P3
    box $P3, "++"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_217


.sub '' :anon :subid('WSubId_218') :outer('WSubId_215')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_219 = "WSubId_219"
# Body
# {
    newclosure $P2, WSubId_219
    .tailcall $P2(__ARG_4)
# }

.end # WSubId_218


.sub '' :anon :subid('WSubId_219') :outer('WSubId_218')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_5.'_applyWithArgs'("token", "--")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "postop"
    push $P2, $P3
    box $P3, "--"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_219


.sub '' :anon :subid('WSubId_220') :outer('WSubId_215')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_221 = "WSubId_221"
# Body
# {
    newclosure $P2, WSubId_221
    .tailcall $P2(__ARG_6)
# }

.end # WSubId_220


.sub '' :anon :subid('WSubId_221') :outer('WSubId_220')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_7.'_apply'("empty")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_221


.sub 'primExpr' :subid('WSubId_222') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.lex '__WLEX_5', $P6
.const 'Sub' WSubId_223 = "WSubId_223"
.const 'Sub' WSubId_233 = "WSubId_233"
# Body
# {
# var fromIdx: $P1
    getattribute $P7, self, 'input'
    getattribute $P1, $P7, 'idx'
# var p: $P2
    null $P2
# var i: $P3
    null $P3
# var m: $P4
    null $P4
# var as: $P5
    null $P5
# var f: $P6
    null $P6
    newclosure $P7, WSubId_223
    set $P8, WSubId_233
    .tailcall self.'_or'($P7, $P8)
# }

.end # primExpr


.sub '' :anon :subid('WSubId_223') :outer('WSubId_222')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_4'
    find_lex $P5, '__WLEX_5'
.const 'Sub' WSubId_224 = "WSubId_224"
# Body
# {
    newclosure $P6, WSubId_224
    .tailcall $P6(__ARG_1)
# }

.end # WSubId_223


.sub '' :anon :subid('WSubId_224') :outer('WSubId_223')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_4'
    find_lex $P5, '__WLEX_5'
.const 'Sub' WSubId_225 = "WSubId_225"
.const 'Sub' WSubId_227 = "WSubId_227"
.const 'Sub' WSubId_229 = "WSubId_229"
.const 'Sub' WSubId_231 = "WSubId_231"
# Body
# {
    $P6 = __ARG_2.'_apply'("primExpr")
store_lex '__WLEX_1', $P6
    newclosure $P6, WSubId_225
    newclosure $P7, WSubId_227
    newclosure $P8, WSubId_229
    newclosure $P9, WSubId_231
    .tailcall __ARG_2.'_or'($P6, $P7, $P8, $P9)
# }

.end # WSubId_224


.sub '' :anon :subid('WSubId_225') :outer('WSubId_224')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_226 = "WSubId_226"
# Body
# {
    newclosure $P3, WSubId_226
    .tailcall $P3(__ARG_3)
# }

.end # WSubId_225


.sub '' :anon :subid('WSubId_226') :outer('WSubId_225')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "[")
    $P3 = __ARG_4.'_apply'("expr")
store_lex '__WLEX_2', $P3
    __ARG_4.'_applyWithArgs'("token", "]")
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "getp"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_1'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_226


.sub '' :anon :subid('WSubId_227') :outer('WSubId_224')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_4'
    find_lex $P3, '__WLEX_1'
.const 'Sub' WSubId_228 = "WSubId_228"
# Body
# {
    newclosure $P4, WSubId_228
    .tailcall $P4(__ARG_5)
# }

.end # WSubId_227


.sub '' :anon :subid('WSubId_228') :outer('WSubId_227')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_4'
    find_lex $P3, '__WLEX_1'
# Body
# {
    __ARG_6.'_applyWithArgs'("token", ".")
    $P4 = __ARG_6.'_apply'("name")
store_lex '__WLEX_3', $P4
    __ARG_6.'_applyWithArgs'("token", "(")
    $P4 = __ARG_6.'_applyWithArgs'("listOf", "expr", ",")
store_lex '__WLEX_4', $P4
    __ARG_6.'_applyWithArgs'("token", ")")
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "send"
    push $P4, $P5
    find_lex $P6, '__WLEX_3'
    push $P4, $P6
    find_lex $P7, '__WLEX_1'
    push $P4, $P7
    find_lex $P8, '__WLEX_4'
    .tailcall $P4.'append'($P8)
# }

.end # WSubId_228


.sub '' :anon :subid('WSubId_229') :outer('WSubId_224')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_5'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_230 = "WSubId_230"
# Body
# {
    newclosure $P3, WSubId_230
    .tailcall $P3(__ARG_7)
# }

.end # WSubId_229


.sub '' :anon :subid('WSubId_230') :outer('WSubId_229')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_5'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_8.'_applyWithArgs'("token", ".")
    $P3 = __ARG_8.'_apply'("name")
store_lex '__WLEX_5', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "geta"
    push $P3, $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    box $P6, "get"
    push $P5, $P6
    find_lex $P7, '__WLEX_5'
    push $P5, $P7
    push $P3, $P5
    find_lex $P8, '__WLEX_1'
    push $P3, $P8
    .return($P3)
# }

.end # WSubId_230


.sub '' :anon :subid('WSubId_231') :outer('WSubId_224')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_232 = "WSubId_232"
# Body
# {
    newclosure $P3, WSubId_232
    .tailcall $P3(__ARG_9)
# }

.end # WSubId_231


.sub '' :anon :subid('WSubId_232') :outer('WSubId_231')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_10.'_applyWithArgs'("token", "(")
    $P3 = __ARG_10.'_applyWithArgs'("listOf", "expr", ",")
store_lex '__WLEX_4', $P3
    __ARG_10.'_applyWithArgs'("token", ")")
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "call"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_4'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_232


.sub '' :anon :subid('WSubId_233') :outer('WSubId_222')
        .param pmc __ARG_11
# Body
# {
    .tailcall __ARG_11.'_apply'("primExprHd")
# }

.end # WSubId_233


.sub 'primExprHd' :subid('WSubId_234') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.lex '__WLEX_5', $P6
.const 'Sub' WSubId_235 = "WSubId_235"
.const 'Sub' WSubId_237 = "WSubId_237"
.const 'Sub' WSubId_239 = "WSubId_239"
.const 'Sub' WSubId_241 = "WSubId_241"
.const 'Sub' WSubId_243 = "WSubId_243"
.const 'Sub' WSubId_244 = "WSubId_244"
.const 'Sub' WSubId_252 = "WSubId_252"
.const 'Sub' WSubId_254 = "WSubId_254"
.const 'Sub' WSubId_256 = "WSubId_256"
.const 'Sub' WSubId_257 = "WSubId_257"
# Body
# {
# var fromIdx: $P1
    getattribute $P7, self, 'input'
    getattribute $P1, $P7, 'idx'
# var e: $P2
    null $P2
# var n: $P3
    null $P3
# var s: $P4
    null $P4
# var cls: $P5
    null $P5
# var es: $P6
    null $P6
    newclosure $P7, WSubId_235
    set $P8, WSubId_237
    newclosure $P9, WSubId_239
    newclosure $P10, WSubId_241
    set $P11, WSubId_243
    newclosure $P12, WSubId_244
    newclosure $P13, WSubId_252
    newclosure $P14, WSubId_254
    set $P15, WSubId_256
    newclosure $P16, WSubId_257
    .tailcall self.'_or'($P7, $P8, $P9, $P10, $P11, $P12, $P13, $P14, $P15, $P16)
# }

.end # primExprHd


.sub '' :anon :subid('WSubId_235') :outer('WSubId_234')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_236 = "WSubId_236"
# Body
# {
    newclosure $P2, WSubId_236
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_235


.sub '' :anon :subid('WSubId_236') :outer('WSubId_235')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "(")
    $P2 = __ARG_2.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_2.'_applyWithArgs'("token", ")")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_236


.sub '' :anon :subid('WSubId_237') :outer('WSubId_234')
        .param pmc __ARG_3
.const 'Sub' WSubId_238 = "WSubId_238"
# Body
# {
    set $P1, WSubId_238
    .tailcall $P1(__ARG_3)
# }

.end # WSubId_237


.sub '' :anon :subid('WSubId_238') :outer('WSubId_237')
        .param pmc __ARG_4
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "self")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "self"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_238


.sub '' :anon :subid('WSubId_239') :outer('WSubId_234')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_240 = "WSubId_240"
# Body
# {
    newclosure $P2, WSubId_240
    .tailcall $P2(__ARG_5)
# }

.end # WSubId_239


.sub '' :anon :subid('WSubId_240') :outer('WSubId_239')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_6.'_applyWithArgs'("token", "number")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "number"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_240


.sub '' :anon :subid('WSubId_241') :outer('WSubId_234')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_3'
.const 'Sub' WSubId_242 = "WSubId_242"
# Body
# {
    newclosure $P2, WSubId_242
    .tailcall $P2(__ARG_7)
# }

.end # WSubId_241


.sub '' :anon :subid('WSubId_242') :outer('WSubId_241')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_3'
# Body
# {
    $P2 = __ARG_8.'_applyWithArgs'("token", "str")
store_lex '__WLEX_3', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "string"
    push $P2, $P3
    find_lex $P4, '__WLEX_3'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_242


.sub '' :anon :subid('WSubId_243') :outer('WSubId_234')
        .param pmc __ARG_9
# Body
# {
    .tailcall __ARG_9.'_apply'("anonFunc")
# }

.end # WSubId_243


.sub '' :anon :subid('WSubId_244') :outer('WSubId_234')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_1'
.const 'Sub' WSubId_245 = "WSubId_245"
# Body
# {
    newclosure $P4, WSubId_245
    .tailcall $P4(__ARG_10)
# }

.end # WSubId_244


.sub '' :anon :subid('WSubId_245') :outer('WSubId_244')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_1'
.const 'Sub' WSubId_246 = "WSubId_246"
.const 'Sub' WSubId_247 = "WSubId_247"
.const 'Sub' WSubId_249 = "WSubId_249"
.const 'Sub' WSubId_250 = "WSubId_250"
# Body
# {
    __ARG_11.'_applyWithArgs'("token", "new")
    set $P5, WSubId_246
    newclosure $P6, WSubId_247
    $P4 = __ARG_11.'_or'($P5, $P6)
store_lex '__WLEX_4', $P4
    __ARG_11.'_applyWithArgs'("token", "(")
    set $P5, WSubId_249
    set $P6, WSubId_250
    $P4 = __ARG_11.'_or'($P5, $P6)
store_lex '__WLEX_1', $P4
    __ARG_11.'_applyWithArgs'("token", ")")
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "new"
    push $P4, $P5
    find_lex $P6, '__WLEX_4'
    push $P4, $P6
    box $P5, 1
    push $P4, $P5
    find_lex $P7, '__WLEX_1'
    push $P4, $P7
    .return($P4)
# }

.end # WSubId_245


.sub '' :anon :subid('WSubId_246') :outer('WSubId_245')
        .param pmc __ARG_12
# Body
# {
    .tailcall __ARG_12.'_apply'("name")
# }

.end # WSubId_246


.sub '' :anon :subid('WSubId_247') :outer('WSubId_245')
        .param pmc __ARG_13
    find_lex $P1, '__WLEX_3'
.const 'Sub' WSubId_248 = "WSubId_248"
# Body
# {
    newclosure $P2, WSubId_248
    .tailcall $P2(__ARG_13)
# }

.end # WSubId_247


.sub '' :anon :subid('WSubId_248') :outer('WSubId_247')
        .param pmc __ARG_14
    find_lex $P1, '__WLEX_3'
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    $P2 = __ARG_14.'_applyWithArgs'("token", "str")
store_lex '__WLEX_3', $P2
    find_lex $P2, '__WLEX_3'
    .tailcall WSubId_995($P2)
# }

.end # WSubId_248


.sub '' :anon :subid('WSubId_249') :outer('WSubId_245')
        .param pmc __ARG_15
# Body
# {
    .tailcall __ARG_15.'_apply'("expr")
# }

.end # WSubId_249


.sub '' :anon :subid('WSubId_250') :outer('WSubId_245')
        .param pmc __ARG_16
.const 'Sub' WSubId_251 = "WSubId_251"
# Body
# {
    set $P1, WSubId_251
    .tailcall $P1(__ARG_16)
# }

.end # WSubId_250


.sub '' :anon :subid('WSubId_251') :outer('WSubId_250')
        .param pmc __ARG_17
# Body
# {
    __ARG_17.'_apply'("empty")
    null $P1
    .return($P1)
# }

.end # WSubId_251


.sub '' :anon :subid('WSubId_252') :outer('WSubId_234')
        .param pmc __ARG_18
    find_lex $P1, '__WLEX_4'
.const 'Sub' WSubId_253 = "WSubId_253"
# Body
# {
    newclosure $P2, WSubId_253
    .tailcall $P2(__ARG_18)
# }

.end # WSubId_252


.sub '' :anon :subid('WSubId_253') :outer('WSubId_252')
        .param pmc __ARG_19
    find_lex $P1, '__WLEX_4'
# Body
# {
    __ARG_19.'_applyWithArgs'("token", "new")
    $P2 = __ARG_19.'_apply'("name")
store_lex '__WLEX_4', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "new"
    push $P2, $P3
    find_lex $P4, '__WLEX_4'
    push $P2, $P4
    box $P3, 0
    push $P2, $P3
    .return($P2)
# }

.end # WSubId_253


.sub '' :anon :subid('WSubId_254') :outer('WSubId_234')
        .param pmc __ARG_20
    find_lex $P1, '__WLEX_5'
.const 'Sub' WSubId_255 = "WSubId_255"
# Body
# {
    newclosure $P2, WSubId_255
    .tailcall $P2(__ARG_20)
# }

.end # WSubId_254


.sub '' :anon :subid('WSubId_255') :outer('WSubId_254')
        .param pmc __ARG_21
    find_lex $P1, '__WLEX_5'
# Body
# {
    __ARG_21.'_applyWithArgs'("token", "[")
    $P2 = __ARG_21.'_applyWithArgs'("listOf", "expr", ",")
store_lex '__WLEX_5', $P2
    __ARG_21.'_applyWithArgs'("token", "]")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "arr"
    push $P2, $P3
    find_lex $P4, '__WLEX_5'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_255


.sub '' :anon :subid('WSubId_256') :outer('WSubId_234')
        .param pmc __ARG_22
# Body
# {
    .tailcall __ARG_22.'_apply'("json")
# }

.end # WSubId_256


.sub '' :anon :subid('WSubId_257') :outer('WSubId_234')
        .param pmc __ARG_23
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_258 = "WSubId_258"
# Body
# {
    newclosure $P2, WSubId_258
    .tailcall $P2(__ARG_23)
# }

.end # WSubId_257


.sub '' :anon :subid('WSubId_258') :outer('WSubId_257')
        .param pmc __ARG_24
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_24.'_apply'("name")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "get"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_258


.sub 'json' :subid('WSubId_259') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_260 = "WSubId_260"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var bs: $P2
    null $P2
    newclosure $P3, WSubId_260
    .tailcall $P3(self)
# }

.end # json


.sub '' :anon :subid('WSubId_260') :outer('WSubId_259')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "{")
    $P2 = __ARG_1.'_applyWithArgs'("listOf", "jsonBinding", ",")
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("token", "}")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "json"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_260


.sub 'jsonBinding' :subid('WSubId_261') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_262 = "WSubId_262"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var n: $P2
    null $P2
# var v: $P3
    null $P3
    newclosure $P4, WSubId_262
    .tailcall $P4(self)
# }

.end # jsonBinding


.sub '' :anon :subid('WSubId_262') :outer('WSubId_261')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("jsonPropName")
store_lex '__WLEX_1', $P3
    __ARG_1.'_applyWithArgs'("token", ":")
    $P3 = __ARG_1.'_apply'("expr")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "binding"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_262


.sub 'jsonPropName' :subid('WSubId_263') :method
.const 'Sub' WSubId_264 = "WSubId_264"
.const 'Sub' WSubId_265 = "WSubId_265"
.const 'Sub' WSubId_266 = "WSubId_266"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_264
    set $P3, WSubId_265
    set $P4, WSubId_266
    .tailcall self.'_or'($P2, $P3, $P4)
# }

.end # jsonPropName


.sub '' :anon :subid('WSubId_264') :outer('WSubId_263')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_applyWithArgs'("token", "number")
# }

.end # WSubId_264


.sub '' :anon :subid('WSubId_265') :outer('WSubId_263')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_applyWithArgs'("token", "str")
# }

.end # WSubId_265


.sub '' :anon :subid('WSubId_266') :outer('WSubId_263')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("name")
# }

.end # WSubId_266


.sub 'formal' :subid('WSubId_267') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_268 = "WSubId_268"
.const 'Sub' WSubId_270 = "WSubId_270"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var v: $P2
    null $P2
    newclosure $P3, WSubId_268
    set $P4, WSubId_270
    .tailcall self.'_or'($P3, $P4)
# }

.end # formal


.sub '' :anon :subid('WSubId_268') :outer('WSubId_267')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_269 = "WSubId_269"
# Body
# {
    newclosure $P2, WSubId_269
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_268


.sub '' :anon :subid('WSubId_269') :outer('WSubId_268')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("var")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, " ", $P2
    .return($S1)
# }

.end # WSubId_269


.sub '' :anon :subid('WSubId_270') :outer('WSubId_267')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("name")
# }

.end # WSubId_270


.sub 'anonFunc' :subid('WSubId_271') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_272 = "WSubId_272"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var f: $P2
    null $P2
    newclosure $P3, WSubId_272
    .tailcall $P3(self)
# }

.end # anonFunc


.sub '' :anon :subid('WSubId_272') :outer('WSubId_271')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "function")
    $P2 = __ARG_1.'_apply'("funcRest")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "anonfunc"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_272


.sub 'funcRest' :subid('WSubId_273') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_274 = "WSubId_274"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var fs: $P2
    null $P2
# var ss: $P3
    null $P3
    newclosure $P4, WSubId_274
    .tailcall $P4(self)
# }

.end # funcRest


.sub '' :anon :subid('WSubId_274') :outer('WSubId_273')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "(")
    $P3 = __ARG_1.'_applyWithArgs'("listOf", "formal", ",")
store_lex '__WLEX_1', $P3
    __ARG_1.'_applyWithArgs'("token", ")")
    __ARG_1.'_applyWithArgs'("token", "{")
    $P3 = __ARG_1.'_apply'("srcElems")
store_lex '__WLEX_2', $P3
    __ARG_1.'_applyWithArgs'("token", "}")
    root_new $P3, ['parrot';'ResizablePMCArray']
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_274


.sub 'sc' :method
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    .tailcall self.'_applyWithArgs'("token", ";")
# }

.end # sc


.sub 'block' :subid('WSubId_275') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_276 = "WSubId_276"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var ss: $P2
    null $P2
    newclosure $P3, WSubId_276
    .tailcall $P3(self)
# }

.end # block


.sub '' :anon :subid('WSubId_276') :outer('WSubId_275')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "{")
    $P2 = __ARG_1.'_apply'("srcElems")
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("token", "}")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_276


.sub 'var' :subid('WSubId_277') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_278 = "WSubId_278"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var t: $P2
    null $P2
# var n: $P3
    null $P3
    newclosure $P4, WSubId_278
    .tailcall $P4(self)
# }

.end # var


.sub '' :anon :subid('WSubId_278') :outer('WSubId_277')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_279 = "WSubId_279"
.const 'Sub' WSubId_280 = "WSubId_280"
.const 'Sub' WSubId_281 = "WSubId_281"
.const 'Sub' WSubId_282 = "WSubId_282"
# Body
# {
    set $P4, WSubId_279
    set $P5, WSubId_280
    set $P6, WSubId_281
    set $P7, WSubId_282
    $P3 = __ARG_1.'_or'($P4, $P5, $P6, $P7)
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("name")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_278


.sub '' :anon :subid('WSubId_279') :outer('WSubId_278')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_applyWithArgs'("token", "var")
# }

.end # WSubId_279


.sub '' :anon :subid('WSubId_280') :outer('WSubId_278')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("token", "string")
# }

.end # WSubId_280


.sub '' :anon :subid('WSubId_281') :outer('WSubId_278')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_applyWithArgs'("token", "int")
# }

.end # WSubId_281


.sub '' :anon :subid('WSubId_282') :outer('WSubId_278')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_applyWithArgs'("token", "num")
# }

.end # WSubId_282


.sub 'varInit' :subid('WSubId_283') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_284 = "WSubId_284"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var v: $P2
    null $P2
# var i: $P3
    null $P3
    newclosure $P4, WSubId_284
    .tailcall $P4(self)
# }

.end # varInit


.sub '' :anon :subid('WSubId_284') :outer('WSubId_283')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_285 = "WSubId_285"
.const 'Sub' WSubId_287 = "WSubId_287"
# Body
# {
    $P3 = __ARG_1.'_apply'("var")
store_lex '__WLEX_1', $P3
    set $P4, WSubId_285
    set $P5, WSubId_287
    $P3 = __ARG_1.'_or'($P4, $P5)
store_lex '__WLEX_2', $P3
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "varinit"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    $P3 = $P4.'append'($P6)
    root_new $P7, ['parrot';'ResizablePMCArray']
    find_lex $P9, '__WLEX_2'
    push $P7, $P9
    .tailcall $P3.'append'($P7)
# }

.end # WSubId_284


.sub '' :anon :subid('WSubId_285') :outer('WSubId_284')
        .param pmc __ARG_2
.const 'Sub' WSubId_286 = "WSubId_286"
# Body
# {
    set $P1, WSubId_286
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_285


.sub '' :anon :subid('WSubId_286') :outer('WSubId_285')
        .param pmc __ARG_3
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "=")
    .tailcall __ARG_3.'_apply'("expr")
# }

.end # WSubId_286


.sub '' :anon :subid('WSubId_287') :outer('WSubId_284')
        .param pmc __ARG_4
.const 'Sub' WSubId_288 = "WSubId_288"
# Body
# {
    set $P1, WSubId_288
    .tailcall $P1(__ARG_4)
# }

.end # WSubId_287


.sub '' :anon :subid('WSubId_288') :outer('WSubId_287')
        .param pmc __ARG_5
# Body
# {
    __ARG_5.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, "null"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_288


.sub 'varNoInit' :subid('WSubId_289') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_290 = "WSubId_290"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var v: $P2
    null $P2
    newclosure $P3, WSubId_290
    .tailcall $P3(self)
# }

.end # varNoInit


.sub '' :anon :subid('WSubId_290') :outer('WSubId_289')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("var")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "var"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_290


.sub 'stmt' :subid('WSubId_291') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.lex '__WLEX_5', $P6
.lex '__WLEX_6', $P7
.lex '__WLEX_7', $P8
.lex '__WLEX_8', $P9
.lex '__WLEX_9', $P10
.lex '__WLEX_10', $P11
.lex '__WLEX_11', $P12
.lex '__WLEX_12', $P13
.const 'Sub' WSubId_292 = "WSubId_292"
.const 'Sub' WSubId_293 = "WSubId_293"
.const 'Sub' WSubId_295 = "WSubId_295"
.const 'Sub' WSubId_301 = "WSubId_301"
.const 'Sub' WSubId_303 = "WSubId_303"
.const 'Sub' WSubId_305 = "WSubId_305"
.const 'Sub' WSubId_317 = "WSubId_317"
.const 'Sub' WSubId_321 = "WSubId_321"
.const 'Sub' WSubId_328 = "WSubId_328"
.const 'Sub' WSubId_330 = "WSubId_330"
.const 'Sub' WSubId_332 = "WSubId_332"
.const 'Sub' WSubId_334 = "WSubId_334"
.const 'Sub' WSubId_336 = "WSubId_336"
.const 'Sub' WSubId_341 = "WSubId_341"
.const 'Sub' WSubId_343 = "WSubId_343"
.const 'Sub' WSubId_345 = "WSubId_345"
.const 'Sub' WSubId_347 = "WSubId_347"
.const 'Sub' WSubId_349 = "WSubId_349"
# Body
# {
# var fromIdx: $P1
    getattribute $P14, self, 'input'
    getattribute $P1, $P14, 'idx'
# var r: $P2
    null $P2
# var c: $P3
    null $P3
# var t: $P4
    null $P4
# var f: $P5
    null $P5
# var s: $P6
    null $P6
# var i: $P7
    null $P7
# var u: $P8
    null $P8
# var v: $P9
    null $P9
# var e: $P10
    null $P10
# var cs: $P11
    null $P11
# var n: $P12
    null $P12
# var fqn: $P13
    null $P13
    set $P14, WSubId_292
    newclosure $P15, WSubId_293
    newclosure $P16, WSubId_295
    newclosure $P17, WSubId_301
    newclosure $P18, WSubId_303
    newclosure $P19, WSubId_305
    newclosure $P20, WSubId_317
    newclosure $P21, WSubId_321
    set $P22, WSubId_328
    set $P23, WSubId_330
    newclosure $P24, WSubId_332
    newclosure $P25, WSubId_334
    newclosure $P26, WSubId_336
    newclosure $P27, WSubId_341
    newclosure $P28, WSubId_343
    newclosure $P29, WSubId_345
    newclosure $P30, WSubId_347
    set $P31, WSubId_349
    .tailcall self.'_or'($P14, $P15, $P16, $P17, $P18, $P19, $P20, $P21, $P22, $P23, $P24, $P25, $P26, $P27, $P28, $P29, $P30, $P31)
# }

.end # stmt


.sub '' :anon :subid('WSubId_292') :outer('WSubId_291')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("block")
# }

.end # WSubId_292


.sub '' :anon :subid('WSubId_293') :outer('WSubId_291')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_294 = "WSubId_294"
# Body
# {
    newclosure $P2, WSubId_294
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_293


.sub '' :anon :subid('WSubId_294') :outer('WSubId_293')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_3.'_apply'("varInit")
store_lex '__WLEX_1', $P2
    __ARG_3.'_apply'("sc")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_294


.sub '' :anon :subid('WSubId_295') :outer('WSubId_291')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_4'
.const 'Sub' WSubId_296 = "WSubId_296"
# Body
# {
    newclosure $P4, WSubId_296
    .tailcall $P4(__ARG_4)
# }

.end # WSubId_295


.sub '' :anon :subid('WSubId_296') :outer('WSubId_295')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_4'
.const 'Sub' WSubId_297 = "WSubId_297"
.const 'Sub' WSubId_299 = "WSubId_299"
# Body
# {
    __ARG_5.'_applyWithArgs'("token", "if")
    __ARG_5.'_applyWithArgs'("token", "(")
    $P4 = __ARG_5.'_apply'("expr")
store_lex '__WLEX_2', $P4
    __ARG_5.'_applyWithArgs'("token", ")")
    $P4 = __ARG_5.'_apply'("stmt")
store_lex '__WLEX_3', $P4
    set $P5, WSubId_297
    set $P6, WSubId_299
    $P4 = __ARG_5.'_or'($P5, $P6)
store_lex '__WLEX_4', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "if"
    push $P4, $P5
    find_lex $P6, '__WLEX_2'
    push $P4, $P6
    find_lex $P7, '__WLEX_3'
    push $P4, $P7
    find_lex $P8, '__WLEX_4'
    push $P4, $P8
    .return($P4)
# }

.end # WSubId_296


.sub '' :anon :subid('WSubId_297') :outer('WSubId_296')
        .param pmc __ARG_6
.const 'Sub' WSubId_298 = "WSubId_298"
# Body
# {
    set $P1, WSubId_298
    .tailcall $P1(__ARG_6)
# }

.end # WSubId_297


.sub '' :anon :subid('WSubId_298') :outer('WSubId_297')
        .param pmc __ARG_7
# Body
# {
    __ARG_7.'_applyWithArgs'("token", "else")
    .tailcall __ARG_7.'_apply'("stmt")
# }

.end # WSubId_298


.sub '' :anon :subid('WSubId_299') :outer('WSubId_296')
        .param pmc __ARG_8
.const 'Sub' WSubId_300 = "WSubId_300"
# Body
# {
    set $P1, WSubId_300
    .tailcall $P1(__ARG_8)
# }

.end # WSubId_299


.sub '' :anon :subid('WSubId_300') :outer('WSubId_299')
        .param pmc __ARG_9
# Body
# {
    __ARG_9.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, ""
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_300


.sub '' :anon :subid('WSubId_301') :outer('WSubId_291')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_5'
.const 'Sub' WSubId_302 = "WSubId_302"
# Body
# {
    newclosure $P3, WSubId_302
    .tailcall $P3(__ARG_10)
# }

.end # WSubId_301


.sub '' :anon :subid('WSubId_302') :outer('WSubId_301')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_5'
# Body
# {
    __ARG_11.'_applyWithArgs'("token", "while")
    __ARG_11.'_applyWithArgs'("token", "(")
    $P3 = __ARG_11.'_apply'("expr")
store_lex '__WLEX_2', $P3
    __ARG_11.'_applyWithArgs'("token", ")")
    $P3 = __ARG_11.'_apply'("stmt")
store_lex '__WLEX_5', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "while"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_5'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_302


.sub '' :anon :subid('WSubId_303') :outer('WSubId_291')
        .param pmc __ARG_12
    find_lex $P1, '__WLEX_5'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_304 = "WSubId_304"
# Body
# {
    newclosure $P3, WSubId_304
    .tailcall $P3(__ARG_12)
# }

.end # WSubId_303


.sub '' :anon :subid('WSubId_304') :outer('WSubId_303')
        .param pmc __ARG_13
    find_lex $P1, '__WLEX_5'
    find_lex $P2, '__WLEX_2'
# Body
# {
    __ARG_13.'_applyWithArgs'("token", "do")
    $P3 = __ARG_13.'_apply'("stmt")
store_lex '__WLEX_5', $P3
    __ARG_13.'_applyWithArgs'("token", "while")
    __ARG_13.'_applyWithArgs'("token", "(")
    $P3 = __ARG_13.'_apply'("expr")
store_lex '__WLEX_2', $P3
    __ARG_13.'_applyWithArgs'("token", ")")
    __ARG_13.'_apply'("sc")
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "doWhile"
    push $P3, $P4
    find_lex $P5, '__WLEX_5'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_304


.sub '' :anon :subid('WSubId_305') :outer('WSubId_291')
        .param pmc __ARG_14
    find_lex $P1, '__WLEX_6'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_7'
    find_lex $P4, '__WLEX_5'
.const 'Sub' WSubId_306 = "WSubId_306"
# Body
# {
    newclosure $P5, WSubId_306
    .tailcall $P5(__ARG_14)
# }

.end # WSubId_305


.sub '' :anon :subid('WSubId_306') :outer('WSubId_305')
        .param pmc __ARG_15
    find_lex $P1, '__WLEX_6'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_7'
    find_lex $P4, '__WLEX_5'
.const 'Sub' WSubId_307 = "WSubId_307"
.const 'Sub' WSubId_308 = "WSubId_308"
.const 'Sub' WSubId_309 = "WSubId_309"
.const 'Sub' WSubId_311 = "WSubId_311"
.const 'Sub' WSubId_312 = "WSubId_312"
.const 'Sub' WSubId_314 = "WSubId_314"
.const 'Sub' WSubId_315 = "WSubId_315"
# Body
# {
    __ARG_15.'_applyWithArgs'("token", "for")
    __ARG_15.'_applyWithArgs'("token", "(")
    set $P6, WSubId_307
    set $P7, WSubId_308
    set $P8, WSubId_309
    $P5 = __ARG_15.'_or'($P6, $P7, $P8)
store_lex '__WLEX_6', $P5
    __ARG_15.'_applyWithArgs'("token", ";")
    set $P6, WSubId_311
    set $P7, WSubId_312
    $P5 = __ARG_15.'_or'($P6, $P7)
store_lex '__WLEX_2', $P5
    __ARG_15.'_applyWithArgs'("token", ";")
    set $P6, WSubId_314
    set $P7, WSubId_315
    $P5 = __ARG_15.'_or'($P6, $P7)
store_lex '__WLEX_7', $P5
    __ARG_15.'_applyWithArgs'("token", ")")
    $P5 = __ARG_15.'_apply'("stmt")
store_lex '__WLEX_5', $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
    box $P6, "for"
    push $P5, $P6
    find_lex $P7, '__WLEX_6'
    push $P5, $P7
    find_lex $P8, '__WLEX_2'
    push $P5, $P8
    find_lex $P9, '__WLEX_7'
    push $P5, $P9
    find_lex $P10, '__WLEX_5'
    push $P5, $P10
    .return($P5)
# }

.end # WSubId_306


.sub '' :anon :subid('WSubId_307') :outer('WSubId_306')
        .param pmc __ARG_16
# Body
# {
    .tailcall __ARG_16.'_apply'("varInit")
# }

.end # WSubId_307


.sub '' :anon :subid('WSubId_308') :outer('WSubId_306')
        .param pmc __ARG_17
# Body
# {
    .tailcall __ARG_17.'_apply'("expr")
# }

.end # WSubId_308


.sub '' :anon :subid('WSubId_309') :outer('WSubId_306')
        .param pmc __ARG_18
.const 'Sub' WSubId_310 = "WSubId_310"
# Body
# {
    set $P1, WSubId_310
    .tailcall $P1(__ARG_18)
# }

.end # WSubId_309


.sub '' :anon :subid('WSubId_310') :outer('WSubId_309')
        .param pmc __ARG_19
# Body
# {
    __ARG_19.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, "null"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_310


.sub '' :anon :subid('WSubId_311') :outer('WSubId_306')
        .param pmc __ARG_20
# Body
# {
    .tailcall __ARG_20.'_apply'("expr")
# }

.end # WSubId_311


.sub '' :anon :subid('WSubId_312') :outer('WSubId_306')
        .param pmc __ARG_21
.const 'Sub' WSubId_313 = "WSubId_313"
# Body
# {
    set $P1, WSubId_313
    .tailcall $P1(__ARG_21)
# }

.end # WSubId_312


.sub '' :anon :subid('WSubId_313') :outer('WSubId_312')
        .param pmc __ARG_22
# Body
# {
    __ARG_22.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, "true"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_313


.sub '' :anon :subid('WSubId_314') :outer('WSubId_306')
        .param pmc __ARG_23
# Body
# {
    .tailcall __ARG_23.'_apply'("expr")
# }

.end # WSubId_314


.sub '' :anon :subid('WSubId_315') :outer('WSubId_306')
        .param pmc __ARG_24
.const 'Sub' WSubId_316 = "WSubId_316"
# Body
# {
    set $P1, WSubId_316
    .tailcall $P1(__ARG_24)
# }

.end # WSubId_315


.sub '' :anon :subid('WSubId_316') :outer('WSubId_315')
        .param pmc __ARG_25
# Body
# {
    __ARG_25.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, "null"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_316


.sub '' :anon :subid('WSubId_317') :outer('WSubId_291')
        .param pmc __ARG_26
    find_lex $P1, '__WLEX_8'
    find_lex $P2, '__WLEX_9'
    find_lex $P3, '__WLEX_5'
.const 'Sub' WSubId_318 = "WSubId_318"
# Body
# {
    newclosure $P4, WSubId_318
    .tailcall $P4(__ARG_26)
# }

.end # WSubId_317


.sub '' :anon :subid('WSubId_318') :outer('WSubId_317')
        .param pmc __ARG_27
    find_lex $P1, '__WLEX_8'
    find_lex $P2, '__WLEX_9'
    find_lex $P3, '__WLEX_5'
.const 'Sub' WSubId_319 = "WSubId_319"
.const 'Sub' WSubId_320 = "WSubId_320"
# Body
# {
    __ARG_27.'_applyWithArgs'("token", "for")
    __ARG_27.'_applyWithArgs'("token", "(")
    set $P5, WSubId_319
    set $P6, WSubId_320
    $P4 = __ARG_27.'_or'($P5, $P6)
store_lex '__WLEX_8', $P4
    __ARG_27.'_applyWithArgs'("token", "in")
    $P4 = __ARG_27.'_apply'("expr")
store_lex '__WLEX_9', $P4
    __ARG_27.'_applyWithArgs'("token", ")")
    $P4 = __ARG_27.'_apply'("stmt")
store_lex '__WLEX_5', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "forIn"
    push $P4, $P5
    find_lex $P6, '__WLEX_8'
    push $P4, $P6
    find_lex $P7, '__WLEX_9'
    push $P4, $P7
    find_lex $P8, '__WLEX_5'
    push $P4, $P8
    .return($P4)
# }

.end # WSubId_318


.sub '' :anon :subid('WSubId_319') :outer('WSubId_318')
        .param pmc __ARG_28
# Body
# {
    .tailcall __ARG_28.'_apply'("varNoInit")
# }

.end # WSubId_319


.sub '' :anon :subid('WSubId_320') :outer('WSubId_318')
        .param pmc __ARG_29
# Body
# {
    .tailcall __ARG_29.'_apply'("expr")
# }

.end # WSubId_320


.sub '' :anon :subid('WSubId_321') :outer('WSubId_291')
        .param pmc __ARG_30
    find_lex $P1, '__WLEX_9'
    find_lex $P2, '__WLEX_10'
    find_lex $P3, '__WLEX_2'
.const 'Sub' WSubId_322 = "WSubId_322"
# Body
# {
    newclosure $P4, WSubId_322
    .tailcall $P4(__ARG_30)
# }

.end # WSubId_321


.sub '' :anon :subid('WSubId_322') :outer('WSubId_321')
        .param pmc __ARG_31
    find_lex $P1, '__WLEX_9'
    find_lex $P2, '__WLEX_10'
    find_lex $P3, '__WLEX_2'
.const 'Sub' WSubId_323 = "WSubId_323"
# Body
# {
    __ARG_31.'_applyWithArgs'("token", "switch")
    __ARG_31.'_applyWithArgs'("token", "(")
    $P4 = __ARG_31.'_apply'("expr")
store_lex '__WLEX_9', $P4
    __ARG_31.'_applyWithArgs'("token", ")")
    __ARG_31.'_applyWithArgs'("token", "{")
    newclosure $P5, WSubId_323
    $P4 = __ARG_31.'_many'($P5)
store_lex '__WLEX_10', $P4
    __ARG_31.'_applyWithArgs'("token", "}")
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "switch"
    push $P4, $P5
    find_lex $P6, '__WLEX_9'
    push $P4, $P6
    find_lex $P7, '__WLEX_10'
    .tailcall $P4.'append'($P7)
# }

.end # WSubId_322


.sub '' :anon :subid('WSubId_323') :outer('WSubId_322')
        .param pmc __ARG_32
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_10'
.const 'Sub' WSubId_324 = "WSubId_324"
.const 'Sub' WSubId_326 = "WSubId_326"
# Body
# {
    newclosure $P3, WSubId_324
    newclosure $P4, WSubId_326
    .tailcall __ARG_32.'_or'($P3, $P4)
# }

.end # WSubId_323


.sub '' :anon :subid('WSubId_324') :outer('WSubId_323')
        .param pmc __ARG_33
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_10'
.const 'Sub' WSubId_325 = "WSubId_325"
# Body
# {
    newclosure $P3, WSubId_325
    .tailcall $P3(__ARG_33)
# }

.end # WSubId_324


.sub '' :anon :subid('WSubId_325') :outer('WSubId_324')
        .param pmc __ARG_34
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_10'
# Body
# {
    __ARG_34.'_applyWithArgs'("token", "case")
    $P3 = __ARG_34.'_apply'("expr")
store_lex '__WLEX_2', $P3
    __ARG_34.'_applyWithArgs'("token", ":")
    $P3 = __ARG_34.'_apply'("srcElems")
store_lex '__WLEX_10', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "case"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_10'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_325


.sub '' :anon :subid('WSubId_326') :outer('WSubId_323')
        .param pmc __ARG_35
    find_lex $P1, '__WLEX_10'
.const 'Sub' WSubId_327 = "WSubId_327"
# Body
# {
    newclosure $P2, WSubId_327
    .tailcall $P2(__ARG_35)
# }

.end # WSubId_326


.sub '' :anon :subid('WSubId_327') :outer('WSubId_326')
        .param pmc __ARG_36
    find_lex $P1, '__WLEX_10'
# Body
# {
    __ARG_36.'_applyWithArgs'("token", "default")
    __ARG_36.'_applyWithArgs'("token", ":")
    $P2 = __ARG_36.'_apply'("srcElems")
store_lex '__WLEX_10', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "default"
    push $P2, $P3
    find_lex $P4, '__WLEX_10'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_327


.sub '' :anon :subid('WSubId_328') :outer('WSubId_291')
        .param pmc __ARG_37
.const 'Sub' WSubId_329 = "WSubId_329"
# Body
# {
    set $P1, WSubId_329
    .tailcall $P1(__ARG_37)
# }

.end # WSubId_328


.sub '' :anon :subid('WSubId_329') :outer('WSubId_328')
        .param pmc __ARG_38
# Body
# {
    __ARG_38.'_applyWithArgs'("token", "break")
    __ARG_38.'_apply'("sc")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "break"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_329


.sub '' :anon :subid('WSubId_330') :outer('WSubId_291')
        .param pmc __ARG_39
.const 'Sub' WSubId_331 = "WSubId_331"
# Body
# {
    set $P1, WSubId_331
    .tailcall $P1(__ARG_39)
# }

.end # WSubId_330


.sub '' :anon :subid('WSubId_331') :outer('WSubId_330')
        .param pmc __ARG_40
# Body
# {
    __ARG_40.'_applyWithArgs'("token", "continue")
    __ARG_40.'_apply'("sc")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "continue"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_331


.sub '' :anon :subid('WSubId_332') :outer('WSubId_291')
        .param pmc __ARG_41
    find_lex $P1, '__WLEX_9'
.const 'Sub' WSubId_333 = "WSubId_333"
# Body
# {
    newclosure $P2, WSubId_333
    .tailcall $P2(__ARG_41)
# }

.end # WSubId_332


.sub '' :anon :subid('WSubId_333') :outer('WSubId_332')
        .param pmc __ARG_42
    find_lex $P1, '__WLEX_9'
# Body
# {
    __ARG_42.'_applyWithArgs'("token", "throw")
    $P2 = __ARG_42.'_apply'("expr")
store_lex '__WLEX_9', $P2
    __ARG_42.'_apply'("sc")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "throw"
    push $P2, $P3
    find_lex $P4, '__WLEX_9'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_333


.sub '' :anon :subid('WSubId_334') :outer('WSubId_291')
        .param pmc __ARG_43
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_9'
    find_lex $P3, '__WLEX_2'
.const 'Sub' WSubId_335 = "WSubId_335"
# Body
# {
    newclosure $P4, WSubId_335
    .tailcall $P4(__ARG_43)
# }

.end # WSubId_334


.sub '' :anon :subid('WSubId_335') :outer('WSubId_334')
        .param pmc __ARG_44
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_9'
    find_lex $P3, '__WLEX_2'
# Body
# {
    __ARG_44.'_applyWithArgs'("token", "try")
    $P4 = __ARG_44.'_apply'("block")
store_lex '__WLEX_3', $P4
    __ARG_44.'_applyWithArgs'("token", "catch")
    __ARG_44.'_applyWithArgs'("token", "(")
    $P4 = __ARG_44.'_apply'("name")
store_lex '__WLEX_9', $P4
    __ARG_44.'_applyWithArgs'("token", ")")
    $P4 = __ARG_44.'_apply'("block")
store_lex '__WLEX_2', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "try"
    push $P4, $P5
    find_lex $P6, '__WLEX_3'
    push $P4, $P6
    find_lex $P7, '__WLEX_9'
    push $P4, $P7
    find_lex $P8, '__WLEX_2'
    push $P4, $P8
    .return($P4)
# }

.end # WSubId_335


.sub '' :anon :subid('WSubId_336') :outer('WSubId_291')
        .param pmc __ARG_45
    find_lex $P1, '__WLEX_9'
.const 'Sub' WSubId_337 = "WSubId_337"
# Body
# {
    newclosure $P2, WSubId_337
    .tailcall $P2(__ARG_45)
# }

.end # WSubId_336


.sub '' :anon :subid('WSubId_337') :outer('WSubId_336')
        .param pmc __ARG_46
    find_lex $P1, '__WLEX_9'
.const 'Sub' WSubId_338 = "WSubId_338"
.const 'Sub' WSubId_339 = "WSubId_339"
# Body
# {
    __ARG_46.'_applyWithArgs'("token", "return")
    set $P3, WSubId_338
    set $P4, WSubId_339
    $P2 = __ARG_46.'_or'($P3, $P4)
store_lex '__WLEX_9', $P2
    __ARG_46.'_apply'("sc")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "return"
    push $P2, $P3
    find_lex $P4, '__WLEX_9'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_337


.sub '' :anon :subid('WSubId_338') :outer('WSubId_337')
        .param pmc __ARG_47
# Body
# {
    .tailcall __ARG_47.'_apply'("expr")
# }

.end # WSubId_338


.sub '' :anon :subid('WSubId_339') :outer('WSubId_337')
        .param pmc __ARG_48
.const 'Sub' WSubId_340 = "WSubId_340"
# Body
# {
    set $P1, WSubId_340
    .tailcall $P1(__ARG_48)
# }

.end # WSubId_339


.sub '' :anon :subid('WSubId_340') :outer('WSubId_339')
        .param pmc __ARG_49
# Body
# {
    __ARG_49.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    null $P3
    push $P1, $P3
    .return($P1)
# }

.end # WSubId_340


.sub '' :anon :subid('WSubId_341') :outer('WSubId_291')
        .param pmc __ARG_50
    find_lex $P1, '__WLEX_9'
.const 'Sub' WSubId_342 = "WSubId_342"
# Body
# {
    newclosure $P2, WSubId_342
    .tailcall $P2(__ARG_50)
# }

.end # WSubId_341


.sub '' :anon :subid('WSubId_342') :outer('WSubId_341')
        .param pmc __ARG_51
    find_lex $P1, '__WLEX_9'
# Body
# {
    $P2 = __ARG_51.'_apply'("expr")
store_lex '__WLEX_9', $P2
    __ARG_51.'_apply'("sc")
    find_lex $P2, '__WLEX_9'
    .return($P2)
# }

.end # WSubId_342


.sub '' :anon :subid('WSubId_343') :outer('WSubId_291')
        .param pmc __ARG_52
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_11'
.const 'Sub' WSubId_344 = "WSubId_344"
# Body
# {
    newclosure $P3, WSubId_344
    .tailcall $P3(__ARG_52)
# }

.end # WSubId_343


.sub '' :anon :subid('WSubId_344') :outer('WSubId_343')
        .param pmc __ARG_53
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_11'
# Body
# {
    __ARG_53.'_applyWithArgs'("token", "using")
    $P3 = __ARG_53.'_applyWithArgs'("token", "static")
store_lex '__WLEX_3', $P3
    $P3 = __ARG_53.'_apply'("name")
store_lex '__WLEX_11', $P3
    __ARG_53.'_apply'("sc")
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "using"
    push $P3, $P4
    find_lex $P5, '__WLEX_11'
    push $P3, $P5
    find_lex $P6, '__WLEX_3'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_344


.sub '' :anon :subid('WSubId_345') :outer('WSubId_291')
        .param pmc __ARG_54
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_12'
.const 'Sub' WSubId_346 = "WSubId_346"
# Body
# {
    newclosure $P3, WSubId_346
    .tailcall $P3(__ARG_54)
# }

.end # WSubId_345


.sub '' :anon :subid('WSubId_346') :outer('WSubId_345')
        .param pmc __ARG_55
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_12'
# Body
# {
    __ARG_55.'_applyWithArgs'("token", "using")
    $P3 = __ARG_55.'_applyWithArgs'("token", "extern")
store_lex '__WLEX_3', $P3
    $P3 = __ARG_55.'_applyWithArgs'("listOf", "name", ".")
store_lex '__WLEX_12', $P3
    __ARG_55.'_apply'("sc")
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "using"
    push $P3, $P4
    find_lex $P5, '__WLEX_12'
# predefined join
    join $S1, ".", $P5
    box $P4, $S1
    push $P3, $P4
    find_lex $P6, '__WLEX_3'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_346


.sub '' :anon :subid('WSubId_347') :outer('WSubId_291')
        .param pmc __ARG_56
    find_lex $P1, '__WLEX_12'
.const 'Sub' WSubId_348 = "WSubId_348"
# Body
# {
    newclosure $P2, WSubId_348
    .tailcall $P2(__ARG_56)
# }

.end # WSubId_347


.sub '' :anon :subid('WSubId_348') :outer('WSubId_347')
        .param pmc __ARG_57
    find_lex $P1, '__WLEX_12'
# Body
# {
    __ARG_57.'_applyWithArgs'("token", "using")
    $P2 = __ARG_57.'_applyWithArgs'("listOf", "name", ".")
store_lex '__WLEX_12', $P2
    __ARG_57.'_apply'("sc")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "using"
    push $P2, $P3
    find_lex $P4, '__WLEX_12'
# predefined join
    join $S1, ".", $P4
    box $P3, $S1
    push $P2, $P3
    null $P5
    push $P2, $P5
    .return($P2)
# }

.end # WSubId_348


.sub '' :anon :subid('WSubId_349') :outer('WSubId_291')
        .param pmc __ARG_58
.const 'Sub' WSubId_350 = "WSubId_350"
# Body
# {
    set $P1, WSubId_350
    .tailcall $P1(__ARG_58)
# }

.end # WSubId_349


.sub '' :anon :subid('WSubId_350') :outer('WSubId_349')
        .param pmc __ARG_59
# Body
# {
    __ARG_59.'_applyWithArgs'("token", ";")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, "null"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_350


.sub 'classRest' :subid('WSubId_351') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_352 = "WSubId_352"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var es: $P2
    null $P2
    newclosure $P3, WSubId_352
    .tailcall $P3(self)
# }

.end # classRest


.sub '' :anon :subid('WSubId_352') :outer('WSubId_351')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_353 = "WSubId_353"
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "{")
    set $P3, WSubId_353
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("token", "}")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "begin"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_352


.sub '' :anon :subid('WSubId_353') :outer('WSubId_352')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("classElem")
# }

.end # WSubId_353


.sub 'classBases' :subid('WSubId_354') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_355 = "WSubId_355"
.const 'Sub' WSubId_357 = "WSubId_357"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var bs: $P2
    null $P2
    newclosure $P3, WSubId_355
    set $P4, WSubId_357
    .tailcall self.'_or'($P3, $P4)
# }

.end # classBases


.sub '' :anon :subid('WSubId_355') :outer('WSubId_354')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_356 = "WSubId_356"
# Body
# {
    newclosure $P2, WSubId_356
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_355


.sub '' :anon :subid('WSubId_356') :outer('WSubId_355')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", ":")
    $P2 = __ARG_2.'_applyWithArgs'("listOf", "name", ",")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_356


.sub '' :anon :subid('WSubId_357') :outer('WSubId_354')
        .param pmc __ARG_3
.const 'Sub' WSubId_358 = "WSubId_358"
# Body
# {
    set $P1, WSubId_358
    .tailcall $P1(__ARG_3)
# }

.end # WSubId_357


.sub '' :anon :subid('WSubId_358') :outer('WSubId_357')
        .param pmc __ARG_4
# Body
# {
    __ARG_4.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    .return($P1)
# }

.end # WSubId_358


.sub 'classVar' :subid('WSubId_359') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_360 = "WSubId_360"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var v: $P2
    null $P2
    newclosure $P3, WSubId_360
    .tailcall $P3(self)
# }

.end # classVar


.sub '' :anon :subid('WSubId_360') :outer('WSubId_359')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("var")
store_lex '__WLEX_1', $P2
    find_lex $P3, '__WLEX_1'
    $P2 = $P3[0]
    set $S1, $P2
    iseq $I1, $S1, "var"
    __ARG_1.'_pred'($I1)
    __ARG_1.'_apply'("sc")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "var"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_360


.sub 'classElem' :subid('WSubId_361') :method
.const 'Sub' WSubId_362 = "WSubId_362"
.const 'Sub' WSubId_363 = "WSubId_363"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_362
    set $P3, WSubId_363
    .tailcall self.'_or'($P2, $P3)
# }

.end # classElem


.sub '' :anon :subid('WSubId_362') :outer('WSubId_361')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("funcDecl")
# }

.end # WSubId_362


.sub '' :anon :subid('WSubId_363') :outer('WSubId_361')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("classVar")
# }

.end # WSubId_363


.sub 'flag' :subid('WSubId_364') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P4
.lex '__WLEX_3', $P3
.const 'Sub' WSubId_365 = "WSubId_365"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var n: $P2
    null $P2
# var arg: $P3
    null $P3
# var b: $P4
    null $P4
    newclosure $P5, WSubId_365
    .tailcall $P5(self)
# }

.end # flag


.sub '' :anon :subid('WSubId_365') :outer('WSubId_364')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_366 = "WSubId_366"
.const 'Sub' WSubId_368 = "WSubId_368"
# Body
# {
    $P4 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P4
    newclosure $P5, WSubId_366
    set $P6, WSubId_368
    $P4 = __ARG_1.'_or'($P5, $P6)
store_lex '__WLEX_2', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "flag"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    push $P4, $P6
    find_lex $P7, '__WLEX_2'
    push $P4, $P7
    .return($P4)
# }

.end # WSubId_365


.sub '' :anon :subid('WSubId_366') :outer('WSubId_365')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_3'
.const 'Sub' WSubId_367 = "WSubId_367"
# Body
# {
    newclosure $P2, WSubId_367
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_366


.sub '' :anon :subid('WSubId_367') :outer('WSubId_366')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_3'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "(")
    $P2 = __ARG_3.'_apply'("expr")
store_lex '__WLEX_3', $P2
    __ARG_3.'_applyWithArgs'("token", ")")
    find_lex $P2, '__WLEX_3'
    .return($P2)
# }

.end # WSubId_367


.sub '' :anon :subid('WSubId_368') :outer('WSubId_365')
        .param pmc __ARG_4
.const 'Sub' WSubId_369 = "WSubId_369"
# Body
# {
    set $P1, WSubId_369
    .tailcall $P1(__ARG_4)
# }

.end # WSubId_368


.sub '' :anon :subid('WSubId_369') :outer('WSubId_368')
        .param pmc __ARG_5
# Body
# {
    __ARG_5.'_apply'("empty")
    null $P1
    .return($P1)
# }

.end # WSubId_369


.sub 'flagsList' :subid('WSubId_370') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_371 = "WSubId_371"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var fs: $P2
    null $P2
    newclosure $P3, WSubId_371
    .tailcall $P3(self)
# }

.end # flagsList


.sub '' :anon :subid('WSubId_371') :outer('WSubId_370')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "[")
    $P2 = __ARG_1.'_applyWithArgs'("listOf", "flag", ",")
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("token", "]")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "flaglist"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_371


.sub 'funcDecl' :subid('WSubId_372') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_373 = "WSubId_373"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var n: $P2
    null $P2
# var flags: $P3
    null $P3
# var f: $P4
    null $P4
    newclosure $P5, WSubId_373
    .tailcall $P5(self)
# }

.end # funcDecl


.sub '' :anon :subid('WSubId_373') :outer('WSubId_372')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_374 = "WSubId_374"
.const 'Sub' WSubId_375 = "WSubId_375"
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "function")
    $P4 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P4
    set $P5, WSubId_374
    set $P6, WSubId_375
    $P4 = __ARG_1.'_or'($P5, $P6)
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("funcRest")
store_lex '__WLEX_3', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "funcdecl"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    push $P4, $P6
    find_lex $P7, '__WLEX_2'
    push $P4, $P7
    find_lex $P8, '__WLEX_3'
    .tailcall $P4.'append'($P8)
# }

.end # WSubId_373


.sub '' :anon :subid('WSubId_374') :outer('WSubId_373')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("flagsList")
# }

.end # WSubId_374


.sub '' :anon :subid('WSubId_375') :outer('WSubId_373')
        .param pmc __ARG_3
.const 'Sub' WSubId_376 = "WSubId_376"
# Body
# {
    set $P1, WSubId_376
    .tailcall $P1(__ARG_3)
# }

.end # WSubId_375


.sub '' :anon :subid('WSubId_376') :outer('WSubId_375')
        .param pmc __ARG_4
# Body
# {
    __ARG_4.'_apply'("empty")
    null $P1
    .return($P1)
# }

.end # WSubId_376


.sub 'classDecl' :subid('WSubId_377') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_378 = "WSubId_378"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var n: $P2
    null $P2
# var bs: $P3
    null $P3
# var c: $P4
    null $P4
    newclosure $P5, WSubId_378
    .tailcall $P5(self)
# }

.end # classDecl


.sub '' :anon :subid('WSubId_378') :outer('WSubId_377')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "class")
    $P4 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("classBases")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("classRest")
store_lex '__WLEX_3', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "classdecl"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    push $P4, $P6
    find_lex $P7, '__WLEX_2'
    push $P4, $P7
    find_lex $P8, '__WLEX_3'
    push $P4, $P8
    .return($P4)
# }

.end # WSubId_378


.sub 'srcElems' :subid('WSubId_379') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_380 = "WSubId_380"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var ss: $P2
    null $P2
    newclosure $P3, WSubId_380
    .tailcall $P3(self)
# }

.end # srcElems


.sub '' :anon :subid('WSubId_380') :outer('WSubId_379')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_381 = "WSubId_381"
# Body
# {
    set $P3, WSubId_381
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "begin"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_380


.sub '' :anon :subid('WSubId_381') :outer('WSubId_380')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("stmt")
# }

.end # WSubId_381


.sub 'topElem' :subid('WSubId_382') :method
.const 'Sub' WSubId_383 = "WSubId_383"
.const 'Sub' WSubId_384 = "WSubId_384"
.const 'Sub' WSubId_385 = "WSubId_385"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_383
    set $P3, WSubId_384
    set $P4, WSubId_385
    .tailcall self.'_or'($P2, $P3, $P4)
# }

.end # topElem


.sub '' :anon :subid('WSubId_383') :outer('WSubId_382')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("funcDecl")
# }

.end # WSubId_383


.sub '' :anon :subid('WSubId_384') :outer('WSubId_382')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("classDecl")
# }

.end # WSubId_384


.sub '' :anon :subid('WSubId_385') :outer('WSubId_382')
        .param pmc __ARG_3
.const 'Sub' WSubId_386 = "WSubId_386"
# Body
# {
    set $P1, WSubId_386
    .tailcall $P1(__ARG_3)
# }

.end # WSubId_385


.sub '' :anon :subid('WSubId_386') :outer('WSubId_385')
        .param pmc __ARG_4
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "ometa")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "ometa"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_386


.sub 'topLevel' :subid('WSubId_387') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_388 = "WSubId_388"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var es: $P2
    null $P2
    newclosure $P3, WSubId_388
    .tailcall $P3(self)
# }

.end # topLevel


.sub '' :anon :subid('WSubId_388') :outer('WSubId_387')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_389 = "WSubId_389"
# Body
# {
    set $P3, WSubId_389
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_1.'_apply'("spaces")
    __ARG_1.'_apply'("end")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "top"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_388


.sub '' :anon :subid('WSubId_389') :outer('WSubId_388')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("topElem")
# }

.end # WSubId_389

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedParser' ]
    get_class $P1, [ 'Parser' ]
    addparent $P0, $P1
.end
.namespace [ 'WinxedSemActionParser' ]

.sub 'curlySemAction' :subid('WSubId_390') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P4
.lex '__WLEX_3', $P3
.const 'Sub' WSubId_391 = "WSubId_391"
.const 'Sub' WSubId_393 = "WSubId_393"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var r: $P2
    null $P2
# var s: $P3
    null $P3
# var ss: $P4
    null $P4
    newclosure $P5, WSubId_391
    newclosure $P6, WSubId_393
    .tailcall self.'_or'($P5, $P6)
# }

.end # curlySemAction


.sub '' :anon :subid('WSubId_391') :outer('WSubId_390')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_392 = "WSubId_392"
# Body
# {
    newclosure $P2, WSubId_392
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_391


.sub '' :anon :subid('WSubId_392') :outer('WSubId_391')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "{")
    $P2 = __ARG_2.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_2.'_applyWithArgs'("token", "}")
    __ARG_2.'_apply'("spaces")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_392


.sub '' :anon :subid('WSubId_393') :outer('WSubId_390')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_1'
.const 'Sub' WSubId_394 = "WSubId_394"
# Body
# {
    newclosure $P4, WSubId_394
    .tailcall $P4(__ARG_3)
# }

.end # WSubId_393


.sub '' :anon :subid('WSubId_394') :outer('WSubId_393')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_1'
.const 'Sub' WSubId_395 = "WSubId_395"
.const 'Sub' WSubId_400 = "WSubId_400"
.const 'Sub' WSubId_402 = "WSubId_402"
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "{")
    newclosure $P5, WSubId_395
    $P4 = __ARG_4.'_many'($P5)
store_lex '__WLEX_2', $P4
    newclosure $P5, WSubId_400
    set $P6, WSubId_402
    $P4 = __ARG_4.'_or'($P5, $P6)
store_lex '__WLEX_3', $P4
    find_lex $P4, '__WLEX_2'
    find_lex $P5, '__WLEX_3'
    $P4.'push'($P5)
    __ARG_4.'_applyWithArgs'("token", "}")
    __ARG_4.'_apply'("spaces")
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "call"
    push $P4, $P5
    root_new $P6, ['parrot';'ResizablePMCArray']
    box $P7, "anonfunc"
    push $P6, $P7
    root_new $P8, ['parrot';'ResizablePMCArray']
    box $P9, "self"
    push $P8, $P9
    push $P6, $P8
    root_new $P11, ['parrot';'ResizablePMCArray']
    box $P12, "begin"
    push $P11, $P12
    find_lex $P13, '__WLEX_2'
    $P10 = $P11.'append'($P13)
    push $P6, $P10
    push $P4, $P6
    root_new $P14, ['parrot';'ResizablePMCArray']
    box $P15, "self"
    push $P14, $P15
    push $P4, $P14
    .return($P4)
# }

.end # WSubId_394


.sub '' :anon :subid('WSubId_395') :outer('WSubId_394')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_3'
.const 'Sub' WSubId_396 = "WSubId_396"
# Body
# {
    newclosure $P2, WSubId_396
    .tailcall $P2(__ARG_5)
# }

.end # WSubId_395


.sub '' :anon :subid('WSubId_396') :outer('WSubId_395')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_3'
.const 'Sub' WSubId_397 = "WSubId_397"
# Body
# {
    $P2 = __ARG_6.'_apply'("stmt")
store_lex '__WLEX_3', $P2
    set $P2, WSubId_397
    __ARG_6.'_lookahead'($P2)
    find_lex $P2, '__WLEX_3'
    .return($P2)
# }

.end # WSubId_396


.sub '' :anon :subid('WSubId_397') :outer('WSubId_396')
        .param pmc __ARG_7
.const 'Sub' WSubId_398 = "WSubId_398"
.const 'Sub' WSubId_399 = "WSubId_399"
# Body
# {
    set $P1, WSubId_398
    set $P2, WSubId_399
    .tailcall __ARG_7.'_or'($P1, $P2)
# }

.end # WSubId_397


.sub '' :anon :subid('WSubId_398') :outer('WSubId_397')
        .param pmc __ARG_8
# Body
# {
    .tailcall __ARG_8.'_apply'("expr")
# }

.end # WSubId_398


.sub '' :anon :subid('WSubId_399') :outer('WSubId_397')
        .param pmc __ARG_9
# Body
# {
    .tailcall __ARG_9.'_apply'("stmt")
# }

.end # WSubId_399


.sub '' :anon :subid('WSubId_400') :outer('WSubId_394')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_401 = "WSubId_401"
# Body
# {
    newclosure $P2, WSubId_401
    .tailcall $P2(__ARG_10)
# }

.end # WSubId_400


.sub '' :anon :subid('WSubId_401') :outer('WSubId_400')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_11.'_apply'("expr")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "return"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_401


.sub '' :anon :subid('WSubId_402') :outer('WSubId_394')
        .param pmc __ARG_12
# Body
# {
    .tailcall __ARG_12.'_apply'("stmt")
# }

.end # WSubId_402


.sub 'semAction' :subid('WSubId_403') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_404 = "WSubId_404"
.const 'Sub' WSubId_405 = "WSubId_405"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    set $P3, WSubId_404
    newclosure $P4, WSubId_405
    .tailcall self.'_or'($P3, $P4)
# }

.end # semAction


.sub '' :anon :subid('WSubId_404') :outer('WSubId_403')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("curlySemAction")
# }

.end # WSubId_404


.sub '' :anon :subid('WSubId_405') :outer('WSubId_403')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_406 = "WSubId_406"
# Body
# {
    newclosure $P2, WSubId_406
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_405


.sub '' :anon :subid('WSubId_406') :outer('WSubId_405')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_3.'_apply'("primExpr")
store_lex '__WLEX_1', $P2
    __ARG_3.'_apply'("spaces")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_406

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedSemActionParser' ]
    get_class $P1, [ 'WinxedParser' ]
    addparent $P0, $P1
.end
.namespace [ 'WinxedTranslator' ]

.sub 'trans' :subid('WSubId_407') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_408 = "WSubId_408"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var t: $P2
    null $P2
# var ans: $P3
    null $P3
    newclosure $P4, WSubId_408
    .tailcall $P4(self)
# }

.end # trans


.sub '' :anon :subid('WSubId_408') :outer('WSubId_407')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_409 = "WSubId_409"
# Body
# {
    newclosure $P3, WSubId_409
    __ARG_1.'_form'($P3)
    find_lex $P3, '__WLEX_2'
    .return($P3)
# }

.end # WSubId_408


.sub '' :anon :subid('WSubId_409') :outer('WSubId_408')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_410 = "WSubId_410"
# Body
# {
    newclosure $P3, WSubId_410
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_409


.sub '' :anon :subid('WSubId_410') :outer('WSubId_409')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P3
    find_lex $P4, '__WLEX_1'
    $P3 = __ARG_3.'_applyWithArgs'("apply", $P4)
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_410


.sub 'curlyTrans' :subid('WSubId_411') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_412 = "WSubId_412"
.const 'Sub' WSubId_416 = "WSubId_416"
.const 'Sub' WSubId_421 = "WSubId_421"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var r: $P2
    null $P2
# var rs: $P3
    null $P3
    newclosure $P4, WSubId_412
    newclosure $P5, WSubId_416
    newclosure $P6, WSubId_421
    .tailcall self.'_or'($P4, $P5, $P6)
# }

.end # curlyTrans


.sub '' :anon :subid('WSubId_412') :outer('WSubId_411')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_413 = "WSubId_413"
# Body
# {
    newclosure $P2, WSubId_413
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_412


.sub '' :anon :subid('WSubId_413') :outer('WSubId_412')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_414 = "WSubId_414"
# Body
# {
    newclosure $P2, WSubId_414
    __ARG_2.'_form'($P2)
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_413


.sub '' :anon :subid('WSubId_414') :outer('WSubId_413')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_415 = "WSubId_415"
# Body
# {
    newclosure $P2, WSubId_415
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_414


.sub '' :anon :subid('WSubId_415') :outer('WSubId_414')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("exactly", "begin")
    $P2 = __ARG_4.'_apply'("curlyTrans")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_415


.sub '' :anon :subid('WSubId_416') :outer('WSubId_411')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_417 = "WSubId_417"
# Body
# {
    newclosure $P2, WSubId_417
    .tailcall $P2(__ARG_5)
# }

.end # WSubId_416


.sub '' :anon :subid('WSubId_417') :outer('WSubId_416')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_418 = "WSubId_418"
# Body
# {
    newclosure $P2, WSubId_418
    __ARG_6.'_form'($P2)
    find_lex $P2, '__WLEX_2'
# predefined join
    join $S1, "", $P2
    concat $S2, "{", $S1
    concat $S2, $S2, "}"
    .return($S2)
# }

.end # WSubId_417


.sub '' :anon :subid('WSubId_418') :outer('WSubId_417')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_419 = "WSubId_419"
# Body
# {
    newclosure $P2, WSubId_419
    .tailcall $P2(__ARG_7)
# }

.end # WSubId_418


.sub '' :anon :subid('WSubId_419') :outer('WSubId_418')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_420 = "WSubId_420"
# Body
# {
    __ARG_8.'_applyWithArgs'("exactly", "begin")
    set $P3, WSubId_420
    $P2 = __ARG_8.'_many'($P3)
store_lex '__WLEX_2', $P2
    .return(0)
# }

.end # WSubId_419


.sub '' :anon :subid('WSubId_420') :outer('WSubId_419')
        .param pmc __ARG_9
# Body
# {
    .tailcall __ARG_9.'_apply'("blockSemiTrans")
# }

.end # WSubId_420


.sub '' :anon :subid('WSubId_421') :outer('WSubId_411')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_422 = "WSubId_422"
# Body
# {
    newclosure $P2, WSubId_422
    .tailcall $P2(__ARG_10)
# }

.end # WSubId_421


.sub '' :anon :subid('WSubId_422') :outer('WSubId_421')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_11.'_apply'("blockSemiTrans")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "{", $S1
    concat $S2, $S2, "}"
    .return($S2)
# }

.end # WSubId_422


.sub 'blockSemiTrans' :subid('WSubId_423') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_424 = "WSubId_424"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var r: $P3
    null $P3
    newclosure $P4, WSubId_424
    .tailcall $P4(self)
# }

.end # blockSemiTrans


.sub '' :anon :subid('WSubId_424') :outer('WSubId_423')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_425 = "WSubId_425"
.const 'Sub' WSubId_427 = "WSubId_427"
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    newclosure $P4, WSubId_425
    newclosure $P5, WSubId_427
    $P3 = __ARG_1.'_or'($P4, $P5)
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_2'
    .return($P3)
# }

.end # WSubId_424


.sub '' :anon :subid('WSubId_425') :outer('WSubId_424')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_426 = "WSubId_426"
# Body
# {
    newclosure $P2, WSubId_426
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_425


.sub '' :anon :subid('WSubId_426') :outer('WSubId_425')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
# predefined length
    length $I2, $S1
    isgt $I1, $I2, 0
    unless $I1 goto __label_1
    find_lex $P4, '__WLEX_1'
    find_lex $P5, '__WLEX_1'
    set $S2, $P5
# predefined length
    length $I4, $S2
    sub $I3, $I4, 1
    $P3 = $P4[$I3]
    set $S3, $P3
    iseq $I1, $S3, "}"
  __label_1:
    __ARG_3.'_pred'($I1)
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_426


.sub '' :anon :subid('WSubId_427') :outer('WSubId_424')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_428 = "WSubId_428"
# Body
# {
    newclosure $P2, WSubId_428
    .tailcall $P2(__ARG_4)
# }

.end # WSubId_427


.sub '' :anon :subid('WSubId_428') :outer('WSubId_427')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_5.'_apply'("empty")
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, $S1, ";"
    .return($S2)
# }

.end # WSubId_428


.sub 'self' :method
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    .return("self")
# }

.end # self


.sub 'break' :method
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    .return("break")
# }

.end # break


.sub 'continue' :method
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    .return("continue")
# }

.end # continue


.sub 'number' :subid('WSubId_429') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_430 = "WSubId_430"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var n: $P2
    null $P2
    newclosure $P3, WSubId_430
    .tailcall $P3(self)
# }

.end # number


.sub '' :anon :subid('WSubId_430') :outer('WSubId_429')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_430


.sub 'string' :subid('WSubId_431') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_432 = "WSubId_432"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var s: $P2
    null $P2
    newclosure $P3, WSubId_432
    .tailcall $P3(self)
# }

.end # string


.sub '' :anon :subid('WSubId_432') :outer('WSubId_431')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall WSubId_995($P2)
# }

.end # WSubId_432


.sub 'arr' :subid('WSubId_433') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_434 = "WSubId_434"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_434
    .tailcall $P3(self)
# }

.end # arr


.sub '' :anon :subid('WSubId_434') :outer('WSubId_433')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_435 = "WSubId_435"
# Body
# {
    set $P3, WSubId_435
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    concat $S2, "[", $S1
    concat $S2, $S2, "]"
    .return($S2)
# }

.end # WSubId_434


.sub '' :anon :subid('WSubId_435') :outer('WSubId_434')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_435


.sub 'unop' :subid('WSubId_436') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_437 = "WSubId_437"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var op: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_437
    .tailcall $P4(self)
# }

.end # unop


.sub '' :anon :subid('WSubId_437') :outer('WSubId_436')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, "(", $S1
    concat $S3, $S3, " "
    concat $S3, $S3, $S2
    concat $S3, $S3, ")"
    .return($S3)
# }

.end # WSubId_437


.sub 'getp' :subid('WSubId_438') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_439 = "WSubId_439"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var fd: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_439
    .tailcall $P4(self)
# }

.end # getp


.sub '' :anon :subid('WSubId_439') :outer('WSubId_438')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_2'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S2, $P4
    concat $S3, $S1, "["
    concat $S3, $S3, $S2
    concat $S3, $S3, "]"
    .return($S3)
# }

.end # WSubId_439


.sub 'geta' :subid('WSubId_440') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_441 = "WSubId_441"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var fd: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_441
    .tailcall $P4(self)
# }

.end # geta


.sub '' :anon :subid('WSubId_441') :outer('WSubId_440')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_2'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S2, $P4
    concat $S3, $S1, "."
    concat $S3, $S3, $S2
    .return($S3)
# }

.end # WSubId_441


.sub 'get' :subid('WSubId_442') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_443 = "WSubId_443"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_443
    .tailcall $P3(self)
# }

.end # get


.sub '' :anon :subid('WSubId_443') :outer('WSubId_442')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_443


.sub 'set' :subid('WSubId_444') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_445 = "WSubId_445"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var lhs: $P2
    null $P2
# var rhs: $P3
    null $P3
    newclosure $P4, WSubId_445
    .tailcall $P4(self)
# }

.end # set


.sub '' :anon :subid('WSubId_445') :outer('WSubId_444')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, "(", $S1
    concat $S3, $S3, "="
    concat $S3, $S3, $S2
    concat $S3, $S3, ")"
    .return($S3)
# }

.end # WSubId_445


.sub 'mset' :subid('WSubId_446') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_447 = "WSubId_447"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var lhs: $P2
    null $P2
# var op: $P3
    null $P3
# var rhs: $P4
    null $P4
    newclosure $P5, WSubId_447
    .tailcall $P5(self)
# }

.end # mset


.sub '' :anon :subid('WSubId_447') :outer('WSubId_446')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
# predefined string
    find_lex $P6, '__WLEX_3'
    set $S3, $P6
    concat $S4, "(", $S1
    concat $S4, $S4, $S2
    concat $S4, $S4, "="
    concat $S4, $S4, $S3
    concat $S4, $S4, ")"
    .return($S4)
# }

.end # WSubId_447


.sub 'binop' :subid('WSubId_448') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_449 = "WSubId_449"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var op: $P2
    null $P2
# var x: $P3
    null $P3
# var y: $P4
    null $P4
    newclosure $P5, WSubId_449
    .tailcall $P5(self)
# }

.end # binop


.sub '' :anon :subid('WSubId_449') :outer('WSubId_448')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S1, $P4
# predefined string
    find_lex $P5, '__WLEX_1'
    set $S2, $P5
# predefined string
    find_lex $P6, '__WLEX_3'
    set $S3, $P6
    concat $S4, "(", $S1
    concat $S4, $S4, " "
    concat $S4, $S4, $S2
    concat $S4, $S4, " "
    concat $S4, $S4, $S3
    concat $S4, $S4, ")"
    .return($S4)
# }

.end # WSubId_449


.sub 'preop' :subid('WSubId_450') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_451 = "WSubId_451"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var op: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_451
    .tailcall $P4(self)
# }

.end # preop


.sub '' :anon :subid('WSubId_451') :outer('WSubId_450')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, $S1, $S2
    .return($S3)
# }

.end # WSubId_451


.sub 'postop' :subid('WSubId_452') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_453 = "WSubId_453"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var op: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_453
    .tailcall $P4(self)
# }

.end # postop


.sub '' :anon :subid('WSubId_453') :outer('WSubId_452')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_2'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S2, $P4
    concat $S3, $S1, $S2
    .return($S3)
# }

.end # WSubId_453


.sub 'return' :subid('WSubId_454') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_455 = "WSubId_455"
.const 'Sub' WSubId_457 = "WSubId_457"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    set $P3, WSubId_455
    newclosure $P4, WSubId_457
    .tailcall self.'_or'($P3, $P4)
# }

.end # return


.sub '' :anon :subid('WSubId_455') :outer('WSubId_454')
        .param pmc __ARG_1
.const 'Sub' WSubId_456 = "WSubId_456"
# Body
# {
    set $P1, WSubId_456
    .tailcall $P1(__ARG_1)
# }

.end # WSubId_455


.sub '' :anon :subid('WSubId_456') :outer('WSubId_455')
        .param pmc __ARG_2
# Body
# {
    __ARG_2.'_apply'("null")
    .return("return")
# }

.end # WSubId_456


.sub '' :anon :subid('WSubId_457') :outer('WSubId_454')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_458 = "WSubId_458"
# Body
# {
    newclosure $P2, WSubId_458
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_457


.sub '' :anon :subid('WSubId_458') :outer('WSubId_457')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_4.'_apply'("trans")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "return ", $S1
    .return($S2)
# }

.end # WSubId_458


.sub 'if' :subid('WSubId_459') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_460 = "WSubId_460"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var cond: $P2
    null $P2
# var t: $P3
    null $P3
# var e: $P4
    null $P4
    newclosure $P5, WSubId_460
    .tailcall $P5(self)
# }

.end # if


.sub '' :anon :subid('WSubId_460') :outer('WSubId_459')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
# predefined string
    find_lex $P6, '__WLEX_3'
    set $S3, $P6
    concat $S4, "if(", $S1
    concat $S4, $S4, ")"
    concat $S4, $S4, $S2
    concat $S4, $S4, "else"
    concat $S4, $S4, $S3
    .return($S4)
# }

.end # WSubId_460


.sub 'condExpr' :subid('WSubId_461') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_462 = "WSubId_462"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var cond: $P2
    null $P2
# var t: $P3
    null $P3
# var e: $P4
    null $P4
    newclosure $P5, WSubId_462
    .tailcall $P5(self)
# }

.end # condExpr


.sub '' :anon :subid('WSubId_462') :outer('WSubId_461')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
# predefined string
    find_lex $P6, '__WLEX_3'
    set $S3, $P6
    concat $S4, "(", $S1
    concat $S4, $S4, "?"
    concat $S4, $S4, $S2
    concat $S4, $S4, ":"
    concat $S4, $S4, $S3
    concat $S4, $S4, ")"
    .return($S4)
# }

.end # WSubId_462


.sub 'while' :subid('WSubId_463') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_464 = "WSubId_464"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var cond: $P2
    null $P2
# var body: $P3
    null $P3
    newclosure $P4, WSubId_464
    .tailcall $P4(self)
# }

.end # while


.sub '' :anon :subid('WSubId_464') :outer('WSubId_463')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, "while(", $S1
    concat $S3, $S3, ")"
    concat $S3, $S3, $S2
    .return($S3)
# }

.end # WSubId_464


.sub 'doWhile' :subid('WSubId_465') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_466 = "WSubId_466"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var body: $P2
    null $P2
# var cond: $P3
    null $P3
    newclosure $P4, WSubId_466
    .tailcall $P4(self)
# }

.end # doWhile


.sub '' :anon :subid('WSubId_466') :outer('WSubId_465')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, "do", $S1
    concat $S3, $S3, "while("
    concat $S3, $S3, $S2
    concat $S3, $S3, ")"
    .return($S3)
# }

.end # WSubId_466


.sub 'for' :subid('WSubId_467') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_468 = "WSubId_468"
# Body
# {
# var fromIdx: $P1
    getattribute $P6, self, 'input'
    getattribute $P1, $P6, 'idx'
# var init: $P2
    null $P2
# var cond: $P3
    null $P3
# var upd: $P4
    null $P4
# var body: $P5
    null $P5
    newclosure $P6, WSubId_468
    .tailcall $P6(self)
# }

.end # for


.sub '' :anon :subid('WSubId_468') :outer('WSubId_467')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_4'
# Body
# {
    $P5 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P5
    $P5 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P5
    $P5 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P5
    $P5 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_4', $P5
# predefined string
    find_lex $P5, '__WLEX_1'
    set $S1, $P5
# predefined string
    find_lex $P6, '__WLEX_2'
    set $S2, $P6
# predefined string
    find_lex $P7, '__WLEX_3'
    set $S3, $P7
# predefined string
    find_lex $P8, '__WLEX_4'
    set $S4, $P8
    concat $S5, "for(", $S1
    concat $S5, $S5, ";"
    concat $S5, $S5, $S2
    concat $S5, $S5, ";"
    concat $S5, $S5, $S3
    concat $S5, $S5, ")"
    concat $S5, $S5, $S4
    .return($S5)
# }

.end # WSubId_468


.sub 'forIn' :subid('WSubId_469') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_470 = "WSubId_470"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var x: $P2
    null $P2
# var arr: $P3
    null $P3
# var body: $P4
    null $P4
    newclosure $P5, WSubId_470
    .tailcall $P5(self)
# }

.end # forIn


.sub '' :anon :subid('WSubId_470') :outer('WSubId_469')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
# predefined string
    find_lex $P6, '__WLEX_3'
    set $S3, $P6
    concat $S4, "for(", $S1
    concat $S4, $S4, " in "
    concat $S4, $S4, $S2
    concat $S4, $S4, ")"
    concat $S4, $S4, $S3
    .return($S4)
# }

.end # WSubId_470


.sub 'using' :subid('WSubId_471') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_472 = "WSubId_472"
.const 'Sub' WSubId_474 = "WSubId_474"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var name: $P2
    null $P2
# var type: $P3
    null $P3
    newclosure $P4, WSubId_472
    newclosure $P5, WSubId_474
    .tailcall self.'_or'($P4, $P5)
# }

.end # using


.sub '' :anon :subid('WSubId_472') :outer('WSubId_471')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_473 = "WSubId_473"
# Body
# {
    newclosure $P2, WSubId_473
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_472


.sub '' :anon :subid('WSubId_473') :outer('WSubId_472')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P2
    __ARG_2.'_apply'("null")
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "using ", $S1
    .return($S2)
# }

.end # WSubId_473


.sub '' :anon :subid('WSubId_474') :outer('WSubId_471')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_475 = "WSubId_475"
# Body
# {
    newclosure $P3, WSubId_475
    .tailcall $P3(__ARG_3)
# }

.end # WSubId_474


.sub '' :anon :subid('WSubId_475') :outer('WSubId_474')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_2'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S2, $P4
    concat $S3, "using ", $S1
    concat $S3, $S3, " "
    concat $S3, $S3, $S2
    .return($S3)
# }

.end # WSubId_475


.sub 'begin' :subid('WSubId_476') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_477 = "WSubId_477"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_477
    .tailcall $P3(self)
# }

.end # begin


.sub '' :anon :subid('WSubId_477') :outer('WSubId_476')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_478 = "WSubId_478"
# Body
# {
    set $P3, WSubId_478
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, "", $P2
    concat $S2, "{", $S1
    concat $S2, $S2, "}"
    .return($S2)
# }

.end # WSubId_477


.sub '' :anon :subid('WSubId_478') :outer('WSubId_477')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("blockSemiTrans")
# }

.end # WSubId_478


.sub 'top' :subid('WSubId_479') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_480 = "WSubId_480"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_480
    .tailcall $P3(self)
# }

.end # top


.sub '' :anon :subid('WSubId_480') :outer('WSubId_479')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_481 = "WSubId_481"
# Body
# {
    set $P3, WSubId_481
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, "", $P2
    .return($S1)
# }

.end # WSubId_480


.sub '' :anon :subid('WSubId_481') :outer('WSubId_480')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_481


.sub 'flag' :subid('WSubId_482') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_483 = "WSubId_483"
.const 'Sub' WSubId_485 = "WSubId_485"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var name: $P2
    null $P2
# var arg: $P3
    null $P3
    newclosure $P4, WSubId_483
    newclosure $P5, WSubId_485
    .tailcall self.'_or'($P4, $P5)
# }

.end # flag


.sub '' :anon :subid('WSubId_483') :outer('WSubId_482')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_484 = "WSubId_484"
# Body
# {
    newclosure $P2, WSubId_484
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_483


.sub '' :anon :subid('WSubId_484') :outer('WSubId_483')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P2
    __ARG_2.'_apply'("null")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_484


.sub '' :anon :subid('WSubId_485') :outer('WSubId_482')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_486 = "WSubId_486"
# Body
# {
    newclosure $P3, WSubId_486
    .tailcall $P3(__ARG_3)
# }

.end # WSubId_485


.sub '' :anon :subid('WSubId_486') :outer('WSubId_485')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, $S1, "("
    concat $S3, $S3, $S2
    concat $S3, $S3, ")"
    .return($S3)
# }

.end # WSubId_486


.sub 'flaglist' :subid('WSubId_487') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_488 = "WSubId_488"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var fs: $P2
    null $P2
    newclosure $P3, WSubId_488
    .tailcall $P3(self)
# }

.end # flaglist


.sub '' :anon :subid('WSubId_488') :outer('WSubId_487')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_489 = "WSubId_489"
# Body
# {
    set $P3, WSubId_489
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    .return($S1)
# }

.end # WSubId_488


.sub '' :anon :subid('WSubId_489') :outer('WSubId_488')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_489


.sub 'anonfunc' :subid('WSubId_490') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_491 = "WSubId_491"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var args: $P2
    null $P2
# var body: $P3
    null $P3
    newclosure $P4, WSubId_491
    .tailcall $P4(self)
# }

.end # anonfunc


.sub '' :anon :subid('WSubId_491') :outer('WSubId_490')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_1'
# predefined join
    join $S1, ",", $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, "(function (", $S1
    concat $S3, $S3, ")"
    concat $S3, $S3, $S2
    concat $S3, $S3, ")"
    .return($S3)
# }

.end # WSubId_491


.sub 'funcdecl' :subid('WSubId_492') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_493 = "WSubId_493"
.const 'Sub' WSubId_495 = "WSubId_495"
# Body
# {
# var fromIdx: $P1
    getattribute $P6, self, 'input'
    getattribute $P1, $P6, 'idx'
# var name: $P2
    null $P2
# var args: $P3
    null $P3
# var body: $P4
    null $P4
# var flags: $P5
    null $P5
    newclosure $P6, WSubId_493
    newclosure $P7, WSubId_495
    .tailcall self.'_or'($P6, $P7)
# }

.end # funcdecl


.sub '' :anon :subid('WSubId_493') :outer('WSubId_492')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_494 = "WSubId_494"
# Body
# {
    newclosure $P4, WSubId_494
    .tailcall $P4(__ARG_1)
# }

.end # WSubId_493


.sub '' :anon :subid('WSubId_494') :outer('WSubId_493')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P4
    __ARG_2.'_apply'("null")
    $P4 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_2.'_apply'("curlyTrans")
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
    find_lex $P5, '__WLEX_2'
# predefined join
    join $S2, ",", $P5
# predefined string
    find_lex $P6, '__WLEX_3'
    set $S3, $P6
    concat $S4, "function ", $S1
    concat $S4, $S4, "("
    concat $S4, $S4, $S2
    concat $S4, $S4, ")"
    concat $S4, $S4, $S3
    .return($S4)
# }

.end # WSubId_494


.sub '' :anon :subid('WSubId_495') :outer('WSubId_492')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_4'
    find_lex $P3, '__WLEX_2'
    find_lex $P4, '__WLEX_3'
.const 'Sub' WSubId_496 = "WSubId_496"
# Body
# {
    newclosure $P5, WSubId_496
    .tailcall $P5(__ARG_3)
# }

.end # WSubId_495


.sub '' :anon :subid('WSubId_496') :outer('WSubId_495')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_4'
    find_lex $P3, '__WLEX_2'
    find_lex $P4, '__WLEX_3'
# Body
# {
    $P5 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_1', $P5
    $P5 = __ARG_4.'_apply'("trans")
store_lex '__WLEX_4', $P5
    $P5 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_2', $P5
    $P5 = __ARG_4.'_apply'("curlyTrans")
store_lex '__WLEX_3', $P5
# predefined string
    find_lex $P5, '__WLEX_1'
    set $S1, $P5
# predefined string
    find_lex $P6, '__WLEX_4'
    set $S2, $P6
    find_lex $P7, '__WLEX_2'
# predefined join
    join $S3, ",", $P7
# predefined string
    find_lex $P8, '__WLEX_3'
    set $S4, $P8
    concat $S5, "function ", $S1
    concat $S5, $S5, "["
    concat $S5, $S5, $S2
    concat $S5, $S5, "]("
    concat $S5, $S5, $S3
    concat $S5, $S5, ")"
    concat $S5, $S5, $S4
    .return($S5)
# }

.end # WSubId_496


.sub 'classdecl' :subid('WSubId_497') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_498 = "WSubId_498"
.const 'Sub' WSubId_501 = "WSubId_501"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var name: $P2
    null $P2
# var body: $P3
    null $P3
# var bases: $P4
    null $P4
    newclosure $P5, WSubId_498
    newclosure $P6, WSubId_501
    .tailcall self.'_or'($P5, $P6)
# }

.end # classdecl


.sub '' :anon :subid('WSubId_498') :outer('WSubId_497')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_499 = "WSubId_499"
# Body
# {
    newclosure $P3, WSubId_499
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_498


.sub '' :anon :subid('WSubId_499') :outer('WSubId_498')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_500 = "WSubId_500"
# Body
# {
    $P3 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P3
    set $P3, WSubId_500
    __ARG_2.'_form'($P3)
    $P3 = __ARG_2.'_apply'("curlyTrans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, "class ", $S1
    concat $S3, $S3, $S2
    .return($S3)
# }

.end # WSubId_499


.sub '' :anon :subid('WSubId_500') :outer('WSubId_499')
        .param pmc __ARG_3
# Body
# {
    .return()
# }

.end # WSubId_500


.sub '' :anon :subid('WSubId_501') :outer('WSubId_497')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_2'
.const 'Sub' WSubId_502 = "WSubId_502"
# Body
# {
    newclosure $P4, WSubId_502
    .tailcall $P4(__ARG_4)
# }

.end # WSubId_501


.sub '' :anon :subid('WSubId_502') :outer('WSubId_501')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_2'
# Body
# {
    $P4 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_3', $P4
    $P4 = __ARG_5.'_apply'("curlyTrans")
store_lex '__WLEX_2', $P4
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
    find_lex $P5, '__WLEX_3'
# predefined join
    join $S2, ",", $P5
# predefined string
    find_lex $P6, '__WLEX_2'
    set $S3, $P6
    concat $S4, "class ", $S1
    concat $S4, $S4, ":"
    concat $S4, $S4, $S2
    concat $S4, $S4, $S3
    .return($S4)
# }

.end # WSubId_502


.sub 'call' :subid('WSubId_503') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_504 = "WSubId_504"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var fn: $P2
    null $P2
# var args: $P3
    null $P3
    newclosure $P4, WSubId_504
    .tailcall $P4(self)
# }

.end # call


.sub '' :anon :subid('WSubId_504') :outer('WSubId_503')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_505 = "WSubId_505"
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    set $P4, WSubId_505
    $P3 = __ARG_1.'_many'($P4)
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
    find_lex $P4, '__WLEX_2'
# predefined join
    join $S2, ",", $P4
    concat $S3, $S1, "("
    concat $S3, $S3, $S2
    concat $S3, $S3, ")"
    .return($S3)
# }

.end # WSubId_504


.sub '' :anon :subid('WSubId_505') :outer('WSubId_504')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_505


.sub 'send' :subid('WSubId_506') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_507 = "WSubId_507"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var msg: $P2
    null $P2
# var recv: $P3
    null $P3
# var args: $P4
    null $P4
    newclosure $P5, WSubId_507
    .tailcall $P5(self)
# }

.end # send


.sub '' :anon :subid('WSubId_507') :outer('WSubId_506')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_508 = "WSubId_508"
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P4
    set $P5, WSubId_508
    $P4 = __ARG_1.'_many'($P5)
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S1, $P4
# predefined string
    find_lex $P5, '__WLEX_1'
    set $S2, $P5
    find_lex $P6, '__WLEX_3'
# predefined join
    join $S3, ",", $P6
    concat $S4, $S1, "."
    concat $S4, $S4, $S2
    concat $S4, $S4, "("
    concat $S4, $S4, $S3
    concat $S4, $S4, ")"
    .return($S4)
# }

.end # WSubId_507


.sub '' :anon :subid('WSubId_508') :outer('WSubId_507')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_508


.sub 'new' :subid('WSubId_509') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_510 = "WSubId_510"
.const 'Sub' WSubId_512 = "WSubId_512"
.const 'Sub' WSubId_514 = "WSubId_514"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var cls: $P2
    null $P2
# var arg: $P3
    null $P3
    newclosure $P4, WSubId_510
    newclosure $P5, WSubId_512
    newclosure $P6, WSubId_514
    .tailcall self.'_or'($P4, $P5, $P6)
# }

.end # new


.sub '' :anon :subid('WSubId_510') :outer('WSubId_509')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_511 = "WSubId_511"
# Body
# {
    newclosure $P2, WSubId_511
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_510


.sub '' :anon :subid('WSubId_511') :outer('WSubId_510')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P2
    __ARG_2.'_applyWithArgs'("exactly", 0)
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "new ", $S1
    .return($S2)
# }

.end # WSubId_511


.sub '' :anon :subid('WSubId_512') :outer('WSubId_509')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_513 = "WSubId_513"
# Body
# {
    newclosure $P2, WSubId_513
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_512


.sub '' :anon :subid('WSubId_513') :outer('WSubId_512')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_1', $P2
    __ARG_4.'_applyWithArgs'("exactly", 1)
    __ARG_4.'_apply'("null")
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "new ", $S1
    concat $S2, $S2, "()"
    .return($S2)
# }

.end # WSubId_513


.sub '' :anon :subid('WSubId_514') :outer('WSubId_509')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_515 = "WSubId_515"
# Body
# {
    newclosure $P3, WSubId_515
    .tailcall $P3(__ARG_5)
# }

.end # WSubId_514


.sub '' :anon :subid('WSubId_515') :outer('WSubId_514')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_6.'_apply'("anything")
store_lex '__WLEX_1', $P3
    __ARG_6.'_applyWithArgs'("exactly", 1)
    $P3 = __ARG_6.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, "new ", $S1
    concat $S3, $S3, "("
    concat $S3, $S3, $S2
    concat $S3, $S3, ")"
    .return($S3)
# }

.end # WSubId_515


.sub 'var' :subid('WSubId_516') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_517 = "WSubId_517"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var type: $P2
    null $P2
# var name: $P3
    null $P3
    newclosure $P4, WSubId_517
    .tailcall $P4(self)
# }

.end # var


.sub '' :anon :subid('WSubId_517') :outer('WSubId_516')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, $S1, " "
    concat $S3, $S3, $S2
    .return($S3)
# }

.end # WSubId_517


.sub 'varinit' :subid('WSubId_518') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_519 = "WSubId_519"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var type: $P2
    null $P2
# var name: $P3
    null $P3
# var init: $P4
    null $P4
    newclosure $P5, WSubId_519
    .tailcall $P5(self)
# }

.end # varinit


.sub '' :anon :subid('WSubId_519') :outer('WSubId_518')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
# predefined string
    find_lex $P6, '__WLEX_3'
    set $S3, $P6
    concat $S4, $S1, " "
    concat $S4, $S4, $S2
    concat $S4, $S4, " = "
    concat $S4, $S4, $S3
    .return($S4)
# }

.end # WSubId_519


.sub 'throw' :subid('WSubId_520') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_521 = "WSubId_521"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_521
    .tailcall $P3(self)
# }

.end # throw


.sub '' :anon :subid('WSubId_521') :outer('WSubId_520')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "throw ", $S1
    .return($S2)
# }

.end # WSubId_521


.sub 'try' :subid('WSubId_522') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_523 = "WSubId_523"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var x: $P2
    null $P2
# var name: $P3
    null $P3
# var c: $P4
    null $P4
    newclosure $P5, WSubId_523
    .tailcall $P5(self)
# }

.end # try


.sub '' :anon :subid('WSubId_523') :outer('WSubId_522')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
# predefined string
    find_lex $P6, '__WLEX_3'
    set $S3, $P6
    concat $S4, "try ", $S1
    concat $S4, $S4, "catch("
    concat $S4, $S4, $S2
    concat $S4, $S4, ")"
    concat $S4, $S4, $S3
    .return($S4)
# }

.end # WSubId_523


.sub 'json' :subid('WSubId_524') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_525 = "WSubId_525"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var props: $P2
    null $P2
    newclosure $P3, WSubId_525
    .tailcall $P3(self)
# }

.end # json


.sub '' :anon :subid('WSubId_525') :outer('WSubId_524')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_526 = "WSubId_526"
# Body
# {
    set $P3, WSubId_526
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    concat $S2, "({", $S1
    concat $S2, $S2, "})"
    .return($S2)
# }

.end # WSubId_525


.sub '' :anon :subid('WSubId_526') :outer('WSubId_525')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_526


.sub 'binding' :subid('WSubId_527') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_528 = "WSubId_528"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var name: $P2
    null $P2
# var val: $P3
    null $P3
    newclosure $P4, WSubId_528
    .tailcall $P4(self)
# }

.end # binding


.sub '' :anon :subid('WSubId_528') :outer('WSubId_527')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P4, '__WLEX_1'
    $P3 = WSubId_995($P4)
    set $S1, $P3
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
    concat $S3, $S1, ": "
    concat $S3, $S3, $S2
    .return($S3)
# }

.end # WSubId_528


.sub 'switch' :subid('WSubId_529') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_530 = "WSubId_530"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var cases: $P3
    null $P3
    newclosure $P4, WSubId_530
    .tailcall $P4(self)
# }

.end # switch


.sub '' :anon :subid('WSubId_530') :outer('WSubId_529')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_531 = "WSubId_531"
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    set $P4, WSubId_531
    $P3 = __ARG_1.'_many'($P4)
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
    find_lex $P4, '__WLEX_2'
# predefined join
    join $S2, ";", $P4
    concat $S3, "switch(", $S1
    concat $S3, $S3, "){"
    concat $S3, $S3, $S2
    concat $S3, $S3, "}"
    .return($S3)
# }

.end # WSubId_530


.sub '' :anon :subid('WSubId_531') :outer('WSubId_530')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_531


.sub 'case' :subid('WSubId_532') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_533 = "WSubId_533"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_533
    .tailcall $P4(self)
# }

.end # case


.sub '' :anon :subid('WSubId_533') :outer('WSubId_532')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, "case ", $S1
    concat $S3, $S3, ": "
    concat $S3, $S3, $S2
    .return($S3)
# }

.end # WSubId_533


.sub 'default' :subid('WSubId_534') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_535 = "WSubId_535"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var y: $P2
    null $P2
    newclosure $P3, WSubId_535
    .tailcall $P3(self)
# }

.end # default


.sub '' :anon :subid('WSubId_535') :outer('WSubId_534')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "default: ", $S1
    .return($S2)
# }

.end # WSubId_535

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedTranslator' ]
    get_class $P1, [ 'OMeta' ]
    addparent $P0, $P1
.end
.namespace [ 'OMetaParser' ]

.sub 'fromTo' :subid('WSubId_536') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_537 = "WSubId_537"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_537
    .tailcall $P4(self)
# }

.end # fromTo


.sub '' :anon :subid('WSubId_537') :outer('WSubId_536')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_538 = "WSubId_538"
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_1'
    __ARG_1.'_applyWithArgs'("seq", $P3)
    newclosure $P3, WSubId_538
    __ARG_1.'_many'($P3)
    find_lex $P3, '__WLEX_2'
    .tailcall __ARG_1.'_applyWithArgs'("seq", $P3)
# }

.end # WSubId_537


.sub '' :anon :subid('WSubId_538') :outer('WSubId_537')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_539 = "WSubId_539"
# Body
# {
    newclosure $P2, WSubId_539
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_538


.sub '' :anon :subid('WSubId_539') :outer('WSubId_538')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_540 = "WSubId_540"
# Body
# {
    newclosure $P2, WSubId_540
    __ARG_3.'_not'($P2)
    .tailcall __ARG_3.'_apply'("char")
# }

.end # WSubId_539


.sub '' :anon :subid('WSubId_540') :outer('WSubId_539')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
# Body
# {
    find_lex $P2, '__WLEX_2'
    .tailcall __ARG_4.'_applyWithArgs'("seq", $P2)
# }

.end # WSubId_540


.sub 'space' :subid('WSubId_541') :method
.const 'Sub' WSubId_542 = "WSubId_542"
.const 'Sub' WSubId_543 = "WSubId_543"
.const 'Sub' WSubId_544 = "WSubId_544"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_542
    set $P3, WSubId_543
    set $P4, WSubId_544
    .tailcall self.'_or'($P2, $P3, $P4)
# }

.end # space


.sub '' :anon :subid('WSubId_542') :outer('WSubId_541')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_superApplyWithArgs'("Parser", 'space')
# }

.end # WSubId_542


.sub '' :anon :subid('WSubId_543') :outer('WSubId_541')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_applyWithArgs'("fromTo", "//", "\n")
# }

.end # WSubId_543


.sub '' :anon :subid('WSubId_544') :outer('WSubId_541')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("fromTo", "/*", "*/")
# }

.end # WSubId_544


.sub 'nameFirst' :subid('WSubId_545') :method
.const 'Sub' WSubId_546 = "WSubId_546"
.const 'Sub' WSubId_548 = "WSubId_548"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_546
    set $P3, WSubId_548
    .tailcall self.'_or'($P2, $P3)
# }

.end # nameFirst


.sub '' :anon :subid('WSubId_546') :outer('WSubId_545')
        .param pmc __ARG_1
.const 'Sub' WSubId_547 = "WSubId_547"
# Body
# {
    set $P1, WSubId_547
    .tailcall $P1(__ARG_1)
# }

.end # WSubId_546


.sub '' :anon :subid('WSubId_547') :outer('WSubId_546')
        .param pmc __ARG_2
# Body
# {
# switch
    $P1 = __ARG_2.'_apply'('anything')
    set $S1, $P1
    set $S2, "_"
    if $S1 == $S2 goto __label_3
    set $S2, "$"
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
    .return("_")
  __label_4: # case
    .return("$")
  __label_2: # default
    $P2 = __ARG_2.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_547


.sub '' :anon :subid('WSubId_548') :outer('WSubId_545')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("letter")
# }

.end # WSubId_548


.sub 'nameRest' :subid('WSubId_549') :method
.const 'Sub' WSubId_550 = "WSubId_550"
.const 'Sub' WSubId_551 = "WSubId_551"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_550
    set $P3, WSubId_551
    .tailcall self.'_or'($P2, $P3)
# }

.end # nameRest


.sub '' :anon :subid('WSubId_550') :outer('WSubId_549')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("nameFirst")
# }

.end # WSubId_550


.sub '' :anon :subid('WSubId_551') :outer('WSubId_549')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("digit")
# }

.end # WSubId_551


.sub 'tsName' :subid('WSubId_552') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_553 = "WSubId_553"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_553
    .tailcall $P3(self)
# }

.end # tsName


.sub '' :anon :subid('WSubId_553') :outer('WSubId_552')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_applyWithArgs'("firstAndRest", "nameFirst", "nameRest")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, "", $P2
    .return($S1)
# }

.end # WSubId_553


.sub 'name' :subid('WSubId_554') :method
.const 'Sub' WSubId_555 = "WSubId_555"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_555
    .tailcall $P2(self)
# }

.end # name


.sub '' :anon :subid('WSubId_555') :outer('WSubId_554')
        .param pmc __ARG_1
# Body
# {
    __ARG_1.'_apply'("spaces")
    .tailcall __ARG_1.'_apply'("tsName")
# }

.end # WSubId_555


.sub 'eChar' :subid('WSubId_556') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_557 = "WSubId_557"
.const 'Sub' WSubId_560 = "WSubId_560"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var c: $P2
    null $P2
    newclosure $P3, WSubId_557
    set $P4, WSubId_560
    .tailcall self.'_or'($P3, $P4)
# }

.end # eChar


.sub '' :anon :subid('WSubId_557') :outer('WSubId_556')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_558 = "WSubId_558"
# Body
# {
    newclosure $P2, WSubId_558
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_557


.sub '' :anon :subid('WSubId_558') :outer('WSubId_557')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_559 = "WSubId_559"
# Body
# {
# switch
    $P2 = __ARG_2.'_apply'('anything')
    set $S1, $P2
    set $S2, "\\"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_559
    .tailcall $P3(__ARG_2)
  __label_2: # default
    $P4 = __ARG_2.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_558


.sub '' :anon :subid('WSubId_559') :outer('WSubId_558')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_994 = "WSubId_994"
# Body
# {
    $P2 = __ARG_3.'_apply'("char")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "\\", $S1
    .tailcall WSubId_994($S2)
# }

.end # WSubId_559


.sub '' :anon :subid('WSubId_560') :outer('WSubId_556')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("char")
# }

.end # WSubId_560


.sub 'tsString' :subid('WSubId_561') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_562 = "WSubId_562"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_562
    .tailcall $P3(self)
# }

.end # tsString


.sub '' :anon :subid('WSubId_562') :outer('WSubId_561')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_563 = "WSubId_563"
# Body
# {
    __ARG_1.'_applyWithArgs'("exactly", "'")
    set $P3, WSubId_563
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("exactly", "'")
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, "", $P2
    .return($S1)
# }

.end # WSubId_562


.sub '' :anon :subid('WSubId_563') :outer('WSubId_562')
        .param pmc __ARG_2
.const 'Sub' WSubId_564 = "WSubId_564"
# Body
# {
    set $P1, WSubId_564
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_563


.sub '' :anon :subid('WSubId_564') :outer('WSubId_563')
        .param pmc __ARG_3
.const 'Sub' WSubId_565 = "WSubId_565"
# Body
# {
    set $P1, WSubId_565
    __ARG_3.'_not'($P1)
    .tailcall __ARG_3.'_apply'("eChar")
# }

.end # WSubId_564


.sub '' :anon :subid('WSubId_565') :outer('WSubId_564')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_applyWithArgs'("exactly", "'")
# }

.end # WSubId_565


.sub 'characters' :subid('WSubId_566') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_567 = "WSubId_567"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_567
    .tailcall $P3(self)
# }

.end # characters


.sub '' :anon :subid('WSubId_567') :outer('WSubId_566')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_568 = "WSubId_568"
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    __ARG_1.'_applyWithArgs'("exactly", "`")
    __ARG_1.'_applyWithArgs'("exactly", "`")
    set $P3, WSubId_568
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("exactly", "'")
    __ARG_1.'_applyWithArgs'("exactly", "'")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "App"
    push $P2, $P3
    box $P3, "seq"
    push $P2, $P3
    find_lex $P5, '__WLEX_1'
# predefined join
    join $S1, "", $P5
    $P4 = WSubId_995($S1)
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_567


.sub '' :anon :subid('WSubId_568') :outer('WSubId_567')
        .param pmc __ARG_2
.const 'Sub' WSubId_569 = "WSubId_569"
# Body
# {
    set $P1, WSubId_569
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_568


.sub '' :anon :subid('WSubId_569') :outer('WSubId_568')
        .param pmc __ARG_3
.const 'Sub' WSubId_570 = "WSubId_570"
# Body
# {
    set $P1, WSubId_570
    __ARG_3.'_not'($P1)
    .tailcall __ARG_3.'_apply'("eChar")
# }

.end # WSubId_569


.sub '' :anon :subid('WSubId_570') :outer('WSubId_569')
        .param pmc __ARG_4
.const 'Sub' WSubId_571 = "WSubId_571"
# Body
# {
    set $P1, WSubId_571
    .tailcall $P1(__ARG_4)
# }

.end # WSubId_570


.sub '' :anon :subid('WSubId_571') :outer('WSubId_570')
        .param pmc __ARG_5
# Body
# {
    __ARG_5.'_applyWithArgs'("exactly", "'")
    .tailcall __ARG_5.'_applyWithArgs'("exactly", "'")
# }

.end # WSubId_571


.sub 'sCharacters' :subid('WSubId_572') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_573 = "WSubId_573"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_573
    .tailcall $P3(self)
# }

.end # sCharacters


.sub '' :anon :subid('WSubId_573') :outer('WSubId_572')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_574 = "WSubId_574"
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    __ARG_1.'_applyWithArgs'("exactly", "\"")
    set $P3, WSubId_574
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("exactly", "\"")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "App"
    push $P2, $P3
    box $P3, "token"
    push $P2, $P3
    find_lex $P5, '__WLEX_1'
# predefined join
    join $S1, "", $P5
    $P4 = WSubId_995($S1)
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_573


.sub '' :anon :subid('WSubId_574') :outer('WSubId_573')
        .param pmc __ARG_2
.const 'Sub' WSubId_575 = "WSubId_575"
# Body
# {
    set $P1, WSubId_575
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_574


.sub '' :anon :subid('WSubId_575') :outer('WSubId_574')
        .param pmc __ARG_3
.const 'Sub' WSubId_576 = "WSubId_576"
# Body
# {
    set $P1, WSubId_576
    __ARG_3.'_not'($P1)
    .tailcall __ARG_3.'_apply'("eChar")
# }

.end # WSubId_575


.sub '' :anon :subid('WSubId_576') :outer('WSubId_575')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_576


.sub 'string' :subid('WSubId_577') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_578 = "WSubId_578"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_578
    .tailcall $P3(self)
# }

.end # string


.sub '' :anon :subid('WSubId_578') :outer('WSubId_577')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_579 = "WSubId_579"
.const 'Sub' WSubId_582 = "WSubId_582"
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    set $P3, WSubId_579
    set $P4, WSubId_582
    $P2 = __ARG_1.'_or'($P3, $P4)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "App"
    push $P2, $P3
    box $P3, "exactly"
    push $P2, $P3
    find_lex $P5, '__WLEX_1'
    $P4 = WSubId_995($P5)
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_578


.sub '' :anon :subid('WSubId_579') :outer('WSubId_578')
        .param pmc __ARG_2
.const 'Sub' WSubId_580 = "WSubId_580"
# Body
# {
    set $P1, WSubId_580
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_579


.sub '' :anon :subid('WSubId_580') :outer('WSubId_579')
        .param pmc __ARG_3
.const 'Sub' WSubId_581 = "WSubId_581"
# Body
# {
    set $P1, WSubId_581
    $P1(__ARG_3)
    .tailcall __ARG_3.'_apply'("tsName")
# }

.end # WSubId_580


.sub '' :anon :subid('WSubId_581') :outer('WSubId_580')
        .param pmc __ARG_4
# Body
# {
# switch
    $P1 = __ARG_4.'_apply'('anything')
    set $S1, $P1
    set $S2, "#"
    if $S1 == $S2 goto __label_3
    set $S2, "`"
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
    .return("#")
  __label_4: # case
    .return("`")
  __label_2: # default
    $P2 = __ARG_4.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_581


.sub '' :anon :subid('WSubId_582') :outer('WSubId_578')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("tsString")
# }

.end # WSubId_582


.sub 'number' :subid('WSubId_583') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_584 = "WSubId_584"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var sign: $P2
    null $P2
# var ds: $P3
    null $P3
    newclosure $P4, WSubId_584
    .tailcall $P4(self)
# }

.end # number


.sub '' :anon :subid('WSubId_584') :outer('WSubId_583')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_585 = "WSubId_585"
.const 'Sub' WSubId_587 = "WSubId_587"
.const 'Sub' WSubId_589 = "WSubId_589"
# Body
# {
    set $P4, WSubId_585
    set $P5, WSubId_587
    $P3 = __ARG_1.'_or'($P4, $P5)
store_lex '__WLEX_1', $P3
    set $P4, WSubId_589
    $P3 = __ARG_1.'_many1'($P4)
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "App"
    push $P3, $P4
    box $P4, "exactly"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    find_lex $P6, '__WLEX_2'
# predefined join
    join $S1, "", $P6
    set $I2, $P5
    set $I3, $S1
    add $I1, $I2, $I3
    box $P4, $I1
    push $P3, $P4
    .return($P3)
# }

.end # WSubId_584


.sub '' :anon :subid('WSubId_585') :outer('WSubId_584')
        .param pmc __ARG_2
.const 'Sub' WSubId_586 = "WSubId_586"
# Body
# {
    set $P1, WSubId_586
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_585


.sub '' :anon :subid('WSubId_586') :outer('WSubId_585')
        .param pmc __ARG_3
# Body
# {
# switch
    $P1 = __ARG_3.'_apply'('anything')
    set $S1, $P1
    set $S2, "-"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    .return("-")
  __label_2: # default
    $P2 = __ARG_3.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_586


.sub '' :anon :subid('WSubId_587') :outer('WSubId_584')
        .param pmc __ARG_4
.const 'Sub' WSubId_588 = "WSubId_588"
# Body
# {
    set $P1, WSubId_588
    .tailcall $P1(__ARG_4)
# }

.end # WSubId_587


.sub '' :anon :subid('WSubId_588') :outer('WSubId_587')
        .param pmc __ARG_5
# Body
# {
    __ARG_5.'_apply'("empty")
    .return("")
# }

.end # WSubId_588


.sub '' :anon :subid('WSubId_589') :outer('WSubId_584')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("digit")
# }

.end # WSubId_589


.sub 'keyword' :subid('WSubId_590') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_591 = "WSubId_591"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_591
    .tailcall $P3(self)
# }

.end # keyword


.sub '' :anon :subid('WSubId_591') :outer('WSubId_590')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_592 = "WSubId_592"
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    __ARG_1.'_applyWithArgs'("token", $P2)
    set $P2, WSubId_592
    __ARG_1.'_not'($P2)
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_591


.sub '' :anon :subid('WSubId_592') :outer('WSubId_591')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("letterOrDigit")
# }

.end # WSubId_592


.sub 'args' :subid('WSubId_593') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_594 = "WSubId_594"
.const 'Sub' WSubId_597 = "WSubId_597"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_594
    set $P4, WSubId_597
    .tailcall self.'_or'($P3, $P4)
# }

.end # args


.sub '' :anon :subid('WSubId_594') :outer('WSubId_593')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_595 = "WSubId_595"
# Body
# {
    newclosure $P2, WSubId_595
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_594


.sub '' :anon :subid('WSubId_595') :outer('WSubId_594')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_596 = "WSubId_596"
# Body
# {
# switch
    $P2 = __ARG_2.'_apply'('anything')
    set $S1, $P2
    set $S2, "("
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_596
    .tailcall $P3(__ARG_2)
  __label_2: # default
    $P4 = __ARG_2.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_595


.sub '' :anon :subid('WSubId_596') :outer('WSubId_595')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_3.'_applyWithArgs'("listOf", "hostExpr", ",")
store_lex '__WLEX_1', $P2
    __ARG_3.'_applyWithArgs'("token", ")")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_596


.sub '' :anon :subid('WSubId_597') :outer('WSubId_593')
        .param pmc __ARG_4
.const 'Sub' WSubId_598 = "WSubId_598"
# Body
# {
    set $P1, WSubId_598
    .tailcall $P1(__ARG_4)
# }

.end # WSubId_597


.sub '' :anon :subid('WSubId_598') :outer('WSubId_597')
        .param pmc __ARG_5
# Body
# {
    __ARG_5.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    .return($P1)
# }

.end # WSubId_598


.sub 'application' :subid('WSubId_599') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_600 = "WSubId_600"
.const 'Sub' WSubId_602 = "WSubId_602"
.const 'Sub' WSubId_604 = "WSubId_604"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var rule: $P2
    null $P2
# var as: $P3
    null $P3
# var grm: $P4
    null $P4
    newclosure $P5, WSubId_600
    newclosure $P6, WSubId_602
    newclosure $P7, WSubId_604
    .tailcall self.'_or'($P5, $P6, $P7)
# }

.end # application


.sub '' :anon :subid('WSubId_600') :outer('WSubId_599')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_601 = "WSubId_601"
# Body
# {
    newclosure $P3, WSubId_601
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_600


.sub '' :anon :subid('WSubId_601') :outer('WSubId_600')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "^")
    $P3 = __ARG_2.'_apply'("name")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_2.'_apply'("args")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "App"
    push $P3, $P4
    box $P4, "super"
    push $P3, $P4
# predefined string
    find_lex $P5, '__WLEX_1'
    set $S1, $P5
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    box $P4, $S2
    push $P3, $P4
    find_lex $P6, '__WLEX_2'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_601


.sub '' :anon :subid('WSubId_602') :outer('WSubId_599')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_1'
    find_lex $P3, '__WLEX_2'
.const 'Sub' WSubId_603 = "WSubId_603"
# Body
# {
    newclosure $P4, WSubId_603
    .tailcall $P4(__ARG_3)
# }

.end # WSubId_602


.sub '' :anon :subid('WSubId_603') :outer('WSubId_602')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_1'
    find_lex $P3, '__WLEX_2'
# Body
# {
    $P4 = __ARG_4.'_apply'("name")
store_lex '__WLEX_3', $P4
    __ARG_4.'_applyWithArgs'("token", ".")
    $P4 = __ARG_4.'_apply'("name")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_4.'_apply'("args")
store_lex '__WLEX_2', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "App"
    push $P4, $P5
    box $P5, "foreign"
    push $P4, $P5
# predefined string
    find_lex $P6, '__WLEX_3'
    set $S1, $P6
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    box $P5, $S2
    push $P4, $P5
# predefined string
    find_lex $P7, '__WLEX_1'
    set $S3, $P7
    concat $S4, "'", $S3
    concat $S4, $S4, "'"
    box $P5, $S4
    push $P4, $P5
    find_lex $P8, '__WLEX_2'
    .tailcall $P4.'append'($P8)
# }

.end # WSubId_603


.sub '' :anon :subid('WSubId_604') :outer('WSubId_599')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_605 = "WSubId_605"
# Body
# {
    newclosure $P3, WSubId_605
    .tailcall $P3(__ARG_5)
# }

.end # WSubId_604


.sub '' :anon :subid('WSubId_605') :outer('WSubId_604')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_6.'_apply'("name")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_6.'_apply'("args")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "App"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_605


.sub 'hostExpr' :subid('WSubId_606') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_607 = "WSubId_607"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_607
    .tailcall $P3(self)
# }

.end # hostExpr


.sub '' :anon :subid('WSubId_607') :outer('WSubId_606')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_applyWithArgs'("foreign", 'WinxedSemActionParser', 'expr')
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_1.'_applyWithArgs'("foreign", 'WinxedTranslator', 'trans', $P2)
# }

.end # WSubId_607


.sub 'curlyHostExpr' :subid('WSubId_608') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_609 = "WSubId_609"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_609
    .tailcall $P3(self)
# }

.end # curlyHostExpr


.sub '' :anon :subid('WSubId_609') :outer('WSubId_608')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_applyWithArgs'("foreign", 'WinxedSemActionParser', 'curlySemAction')
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_1.'_applyWithArgs'("foreign", 'WinxedTranslator', 'trans', $P2)
# }

.end # WSubId_609


.sub 'primHostExpr' :subid('WSubId_610') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_611 = "WSubId_611"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_611
    .tailcall $P3(self)
# }

.end # primHostExpr


.sub '' :anon :subid('WSubId_611') :outer('WSubId_610')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_applyWithArgs'("foreign", 'WinxedSemActionParser', 'semAction')
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_1.'_applyWithArgs'("foreign", 'WinxedTranslator', 'trans', $P2)
# }

.end # WSubId_611


.sub 'atomicHostExpr' :subid('WSubId_612') :method
.const 'Sub' WSubId_613 = "WSubId_613"
.const 'Sub' WSubId_614 = "WSubId_614"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_613
    set $P3, WSubId_614
    .tailcall self.'_or'($P2, $P3)
# }

.end # atomicHostExpr


.sub '' :anon :subid('WSubId_613') :outer('WSubId_612')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("curlyHostExpr")
# }

.end # WSubId_613


.sub '' :anon :subid('WSubId_614') :outer('WSubId_612')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("primHostExpr")
# }

.end # WSubId_614


.sub 'semAction' :subid('WSubId_615') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_616 = "WSubId_616"
.const 'Sub' WSubId_618 = "WSubId_618"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_616
    newclosure $P4, WSubId_618
    .tailcall self.'_or'($P3, $P4)
# }

.end # semAction


.sub '' :anon :subid('WSubId_616') :outer('WSubId_615')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_617 = "WSubId_617"
# Body
# {
    newclosure $P2, WSubId_617
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_616


.sub '' :anon :subid('WSubId_617') :outer('WSubId_616')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("curlyHostExpr")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Act"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_617


.sub '' :anon :subid('WSubId_618') :outer('WSubId_615')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_619 = "WSubId_619"
# Body
# {
    newclosure $P2, WSubId_619
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_618


.sub '' :anon :subid('WSubId_619') :outer('WSubId_618')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "!")
    $P2 = __ARG_4.'_apply'("atomicHostExpr")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Act"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_619


.sub 'arrSemAction' :subid('WSubId_620') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_621 = "WSubId_621"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_621
    .tailcall $P3(self)
# }

.end # arrSemAction


.sub '' :anon :subid('WSubId_621') :outer('WSubId_620')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "->")
    $P2 = __ARG_1.'_apply'("atomicHostExpr")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Act"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_621


.sub 'semPred' :subid('WSubId_622') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_623 = "WSubId_623"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_623
    .tailcall $P3(self)
# }

.end # semPred


.sub '' :anon :subid('WSubId_623') :outer('WSubId_622')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "?")
    $P2 = __ARG_1.'_apply'("atomicHostExpr")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Pred"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_623


.sub 'expr' :subid('WSubId_624') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_625 = "WSubId_625"
.const 'Sub' WSubId_629 = "WSubId_629"
.const 'Sub' WSubId_633 = "WSubId_633"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var xs: $P3
    null $P3
    newclosure $P4, WSubId_625
    newclosure $P5, WSubId_629
    set $P6, WSubId_633
    .tailcall self.'_or'($P4, $P5, $P6)
# }

.end # expr


.sub '' :anon :subid('WSubId_625') :outer('WSubId_624')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_626 = "WSubId_626"
# Body
# {
    newclosure $P3, WSubId_626
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_625


.sub '' :anon :subid('WSubId_626') :outer('WSubId_625')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_627 = "WSubId_627"
# Body
# {
    $P3 = __ARG_2.'_applyWithArgs'("expr5", 1)
store_lex '__WLEX_1', $P3
    set $P4, WSubId_627
    $P3 = __ARG_2.'_many1'($P4)
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "Or"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_626


.sub '' :anon :subid('WSubId_627') :outer('WSubId_626')
        .param pmc __ARG_3
.const 'Sub' WSubId_628 = "WSubId_628"
# Body
# {
    set $P1, WSubId_628
    .tailcall $P1(__ARG_3)
# }

.end # WSubId_627


.sub '' :anon :subid('WSubId_628') :outer('WSubId_627')
        .param pmc __ARG_4
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "|")
    .tailcall __ARG_4.'_applyWithArgs'("expr5", 1)
# }

.end # WSubId_628


.sub '' :anon :subid('WSubId_629') :outer('WSubId_624')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_630 = "WSubId_630"
# Body
# {
    newclosure $P3, WSubId_630
    .tailcall $P3(__ARG_5)
# }

.end # WSubId_629


.sub '' :anon :subid('WSubId_630') :outer('WSubId_629')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_631 = "WSubId_631"
# Body
# {
    $P3 = __ARG_6.'_applyWithArgs'("expr5", 1)
store_lex '__WLEX_1', $P3
    set $P4, WSubId_631
    $P3 = __ARG_6.'_many1'($P4)
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "XOr"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_630


.sub '' :anon :subid('WSubId_631') :outer('WSubId_630')
        .param pmc __ARG_7
.const 'Sub' WSubId_632 = "WSubId_632"
# Body
# {
    set $P1, WSubId_632
    .tailcall $P1(__ARG_7)
# }

.end # WSubId_631


.sub '' :anon :subid('WSubId_632') :outer('WSubId_631')
        .param pmc __ARG_8
# Body
# {
    __ARG_8.'_applyWithArgs'("token", "||")
    .tailcall __ARG_8.'_applyWithArgs'("expr5", 1)
# }

.end # WSubId_632


.sub '' :anon :subid('WSubId_633') :outer('WSubId_624')
        .param pmc __ARG_9
# Body
# {
    .tailcall __ARG_9.'_applyWithArgs'("expr5", 0)
# }

.end # WSubId_633


.sub 'expr5' :subid('WSubId_634') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_635 = "WSubId_635"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var ne: $P2
    null $P2
# var x: $P3
    null $P3
# var xs: $P4
    null $P4
    newclosure $P5, WSubId_635
    .tailcall $P5(self)
# }

.end # expr5


.sub '' :anon :subid('WSubId_635') :outer('WSubId_634')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_636 = "WSubId_636"
.const 'Sub' WSubId_640 = "WSubId_640"
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    newclosure $P4, WSubId_636
    newclosure $P5, WSubId_640
    .tailcall __ARG_1.'_or'($P4, $P5)
# }

.end # WSubId_635


.sub '' :anon :subid('WSubId_636') :outer('WSubId_635')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_637 = "WSubId_637"
# Body
# {
    newclosure $P3, WSubId_637
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_636


.sub '' :anon :subid('WSubId_637') :outer('WSubId_636')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_638 = "WSubId_638"
# Body
# {
    $P3 = __ARG_3.'_apply'("interleavePart")
store_lex '__WLEX_2', $P3
    set $P4, WSubId_638
    $P3 = __ARG_3.'_many1'($P4)
store_lex '__WLEX_3', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "Interleave"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_3'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_637


.sub '' :anon :subid('WSubId_638') :outer('WSubId_637')
        .param pmc __ARG_4
.const 'Sub' WSubId_639 = "WSubId_639"
# Body
# {
    set $P1, WSubId_639
    .tailcall $P1(__ARG_4)
# }

.end # WSubId_638


.sub '' :anon :subid('WSubId_639') :outer('WSubId_638')
        .param pmc __ARG_5
# Body
# {
    __ARG_5.'_applyWithArgs'("token", "&&")
    .tailcall __ARG_5.'_apply'("interleavePart")
# }

.end # WSubId_639


.sub '' :anon :subid('WSubId_640') :outer('WSubId_635')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
# Body
# {
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_6.'_applyWithArgs'("expr4", $P2)
# }

.end # WSubId_640


.sub 'interleavePart' :subid('WSubId_641') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_642 = "WSubId_642"
.const 'Sub' WSubId_644 = "WSubId_644"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var part: $P2
    null $P2
    newclosure $P3, WSubId_642
    newclosure $P4, WSubId_644
    .tailcall self.'_or'($P3, $P4)
# }

.end # interleavePart


.sub '' :anon :subid('WSubId_642') :outer('WSubId_641')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_643 = "WSubId_643"
# Body
# {
    newclosure $P2, WSubId_643
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_642


.sub '' :anon :subid('WSubId_643') :outer('WSubId_642')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "(")
    $P2 = __ARG_2.'_applyWithArgs'("expr4", 1)
store_lex '__WLEX_1', $P2
    __ARG_2.'_applyWithArgs'("token", ")")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "1"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_643


.sub '' :anon :subid('WSubId_644') :outer('WSubId_641')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_645 = "WSubId_645"
# Body
# {
    newclosure $P2, WSubId_645
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_644


.sub '' :anon :subid('WSubId_645') :outer('WSubId_644')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_4.'_applyWithArgs'("expr4", 1)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_4.'_applyWithArgs'("modedIPart", $P2)
# }

.end # WSubId_645


.sub 'modedIPart' :subid('WSubId_646') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_647 = "WSubId_647"
.const 'Sub' WSubId_653 = "WSubId_653"
.const 'Sub' WSubId_659 = "WSubId_659"
.const 'Sub' WSubId_665 = "WSubId_665"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var part: $P2
    null $P2
    newclosure $P3, WSubId_647
    newclosure $P4, WSubId_653
    newclosure $P5, WSubId_659
    newclosure $P6, WSubId_665
    .tailcall self.'_or'($P3, $P4, $P5, $P6)
# }

.end # modedIPart


.sub '' :anon :subid('WSubId_647') :outer('WSubId_646')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_648 = "WSubId_648"
# Body
# {
    newclosure $P2, WSubId_648
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_647


.sub '' :anon :subid('WSubId_648') :outer('WSubId_647')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_649 = "WSubId_649"
# Body
# {
    newclosure $P2, WSubId_649
    __ARG_2.'_form'($P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "*"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_648


.sub '' :anon :subid('WSubId_649') :outer('WSubId_648')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_650 = "WSubId_650"
# Body
# {
    newclosure $P2, WSubId_650
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_649


.sub '' :anon :subid('WSubId_650') :outer('WSubId_649')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_651 = "WSubId_651"
# Body
# {
    __ARG_4.'_applyWithArgs'("exactly", "And")
    newclosure $P2, WSubId_651
    .tailcall __ARG_4.'_form'($P2)
# }

.end # WSubId_650


.sub '' :anon :subid('WSubId_651') :outer('WSubId_650')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_652 = "WSubId_652"
# Body
# {
    newclosure $P2, WSubId_652
    .tailcall $P2(__ARG_5)
# }

.end # WSubId_651


.sub '' :anon :subid('WSubId_652') :outer('WSubId_651')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_6.'_applyWithArgs'("exactly", "Many")
    $P2 = __ARG_6.'_apply'("anything")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_652


.sub '' :anon :subid('WSubId_653') :outer('WSubId_646')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_654 = "WSubId_654"
# Body
# {
    newclosure $P2, WSubId_654
    .tailcall $P2(__ARG_7)
# }

.end # WSubId_653


.sub '' :anon :subid('WSubId_654') :outer('WSubId_653')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_655 = "WSubId_655"
# Body
# {
    newclosure $P2, WSubId_655
    __ARG_8.'_form'($P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "+"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_654


.sub '' :anon :subid('WSubId_655') :outer('WSubId_654')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_656 = "WSubId_656"
# Body
# {
    newclosure $P2, WSubId_656
    .tailcall $P2(__ARG_9)
# }

.end # WSubId_655


.sub '' :anon :subid('WSubId_656') :outer('WSubId_655')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_657 = "WSubId_657"
# Body
# {
    __ARG_10.'_applyWithArgs'("exactly", "And")
    newclosure $P2, WSubId_657
    .tailcall __ARG_10.'_form'($P2)
# }

.end # WSubId_656


.sub '' :anon :subid('WSubId_657') :outer('WSubId_656')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_658 = "WSubId_658"
# Body
# {
    newclosure $P2, WSubId_658
    .tailcall $P2(__ARG_11)
# }

.end # WSubId_657


.sub '' :anon :subid('WSubId_658') :outer('WSubId_657')
        .param pmc __ARG_12
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_12.'_applyWithArgs'("exactly", "Many1")
    $P2 = __ARG_12.'_apply'("anything")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_658


.sub '' :anon :subid('WSubId_659') :outer('WSubId_646')
        .param pmc __ARG_13
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_660 = "WSubId_660"
# Body
# {
    newclosure $P2, WSubId_660
    .tailcall $P2(__ARG_13)
# }

.end # WSubId_659


.sub '' :anon :subid('WSubId_660') :outer('WSubId_659')
        .param pmc __ARG_14
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_661 = "WSubId_661"
# Body
# {
    newclosure $P2, WSubId_661
    __ARG_14.'_form'($P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "?"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_660


.sub '' :anon :subid('WSubId_661') :outer('WSubId_660')
        .param pmc __ARG_15
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_662 = "WSubId_662"
# Body
# {
    newclosure $P2, WSubId_662
    .tailcall $P2(__ARG_15)
# }

.end # WSubId_661


.sub '' :anon :subid('WSubId_662') :outer('WSubId_661')
        .param pmc __ARG_16
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_663 = "WSubId_663"
# Body
# {
    __ARG_16.'_applyWithArgs'("exactly", "And")
    newclosure $P2, WSubId_663
    .tailcall __ARG_16.'_form'($P2)
# }

.end # WSubId_662


.sub '' :anon :subid('WSubId_663') :outer('WSubId_662')
        .param pmc __ARG_17
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_664 = "WSubId_664"
# Body
# {
    newclosure $P2, WSubId_664
    .tailcall $P2(__ARG_17)
# }

.end # WSubId_663


.sub '' :anon :subid('WSubId_664') :outer('WSubId_663')
        .param pmc __ARG_18
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_18.'_applyWithArgs'("exactly", "Opt")
    $P2 = __ARG_18.'_apply'("anything")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_664


.sub '' :anon :subid('WSubId_665') :outer('WSubId_646')
        .param pmc __ARG_19
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_666 = "WSubId_666"
# Body
# {
    newclosure $P2, WSubId_666
    .tailcall $P2(__ARG_19)
# }

.end # WSubId_665


.sub '' :anon :subid('WSubId_666') :outer('WSubId_665')
        .param pmc __ARG_20
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_20.'_apply'("anything")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "1"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_666


.sub 'expr4' :subid('WSubId_667') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_668 = "WSubId_668"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var ne: $P2
    null $P2
# var xs: $P3
    null $P3
# var act: $P4
    null $P4
    newclosure $P5, WSubId_668
    .tailcall $P5(self)
# }

.end # expr4


.sub '' :anon :subid('WSubId_668') :outer('WSubId_667')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_669 = "WSubId_669"
.const 'Sub' WSubId_672 = "WSubId_672"
.const 'Sub' WSubId_675 = "WSubId_675"
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    newclosure $P4, WSubId_669
    newclosure $P5, WSubId_672
    newclosure $P6, WSubId_675
    .tailcall __ARG_1.'_or'($P4, $P5, $P6)
# }

.end # WSubId_668


.sub '' :anon :subid('WSubId_669') :outer('WSubId_668')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_670 = "WSubId_670"
# Body
# {
    newclosure $P3, WSubId_670
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_669


.sub '' :anon :subid('WSubId_670') :outer('WSubId_669')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_671 = "WSubId_671"
# Body
# {
    set $P4, WSubId_671
    $P3 = __ARG_3.'_many'($P4)
store_lex '__WLEX_2', $P3
    $P3 = __ARG_3.'_apply'("arrSemAction")
store_lex '__WLEX_3', $P3
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "And"
    push $P4, $P5
    find_lex $P6, '__WLEX_2'
    $P3 = $P4.'append'($P6)
    root_new $P7, ['parrot';'ResizablePMCArray']
    find_lex $P9, '__WLEX_3'
    push $P7, $P9
    .tailcall $P3.'append'($P7)
# }

.end # WSubId_670


.sub '' :anon :subid('WSubId_671') :outer('WSubId_670')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("expr3")
# }

.end # WSubId_671


.sub '' :anon :subid('WSubId_672') :outer('WSubId_668')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_673 = "WSubId_673"
# Body
# {
    newclosure $P3, WSubId_673
    .tailcall $P3(__ARG_5)
# }

.end # WSubId_672


.sub '' :anon :subid('WSubId_673') :outer('WSubId_672')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_674 = "WSubId_674"
# Body
# {
    find_lex $P3, '__WLEX_1'
    __ARG_6.'_pred'($P3)
    set $P4, WSubId_674
    $P3 = __ARG_6.'_many1'($P4)
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "And"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    .tailcall $P3.'append'($P5)
# }

.end # WSubId_673


.sub '' :anon :subid('WSubId_674') :outer('WSubId_673')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("expr3")
# }

.end # WSubId_674


.sub '' :anon :subid('WSubId_675') :outer('WSubId_668')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_676 = "WSubId_676"
# Body
# {
    newclosure $P3, WSubId_676
    .tailcall $P3(__ARG_8)
# }

.end # WSubId_675


.sub '' :anon :subid('WSubId_676') :outer('WSubId_675')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_677 = "WSubId_677"
# Body
# {
    find_lex $P3, '__WLEX_1'
    set $I2, $P3
    iseq $I1, $I2, 0
    __ARG_9.'_pred'($I1)
    set $P4, WSubId_677
    $P3 = __ARG_9.'_many'($P4)
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "And"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    .tailcall $P3.'append'($P5)
# }

.end # WSubId_676


.sub '' :anon :subid('WSubId_677') :outer('WSubId_676')
        .param pmc __ARG_10
# Body
# {
    .tailcall __ARG_10.'_apply'("expr3")
# }

.end # WSubId_677


.sub 'optIter' :subid('WSubId_678') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_679 = "WSubId_679"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_679
    .tailcall $P3(self)
# }

.end # optIter


.sub '' :anon :subid('WSubId_679') :outer('WSubId_678')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_680 = "WSubId_680"
.const 'Sub' WSubId_682 = "WSubId_682"
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    newclosure $P2, WSubId_680
    newclosure $P3, WSubId_682
    .tailcall __ARG_1.'_or'($P2, $P3)
# }

.end # WSubId_679


.sub '' :anon :subid('WSubId_680') :outer('WSubId_679')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_681 = "WSubId_681"
# Body
# {
    newclosure $P2, WSubId_681
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_680


.sub '' :anon :subid('WSubId_681') :outer('WSubId_680')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
# switch
    $P2 = __ARG_3.'_apply'('anything')
    set $S1, $P2
    set $S2, "*"
    if $S1 == $S2 goto __label_3
    set $S2, "+"
    if $S1 == $S2 goto __label_4
    set $S2, "?"
    if $S1 == $S2 goto __label_5
    goto __label_2
  __label_3: # case
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "Many"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    .return($P3)
  __label_4: # case
    root_new $P6, ['parrot';'ResizablePMCArray']
    box $P7, "Many1"
    push $P6, $P7
    find_lex $P8, '__WLEX_1'
    push $P6, $P8
    .return($P6)
  __label_5: # case
    root_new $P9, ['parrot';'ResizablePMCArray']
    box $P10, "Opt"
    push $P9, $P10
    find_lex $P11, '__WLEX_1'
    push $P9, $P11
    .return($P9)
  __label_2: # default
    $P12 = __ARG_3.'_fail'()
    throw $P12
  __label_1: # switch end
# }

.end # WSubId_681


.sub '' :anon :subid('WSubId_682') :outer('WSubId_679')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_683 = "WSubId_683"
# Body
# {
    newclosure $P2, WSubId_683
    .tailcall $P2(__ARG_4)
# }

.end # WSubId_682


.sub '' :anon :subid('WSubId_683') :outer('WSubId_682')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_5.'_apply'("empty")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_683


.sub 'optBind' :subid('WSubId_684') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_685 = "WSubId_685"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var n: $P3
    null $P3
    newclosure $P4, WSubId_685
    .tailcall $P4(self)
# }

.end # optBind


.sub '' :anon :subid('WSubId_685') :outer('WSubId_684')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_686 = "WSubId_686"
.const 'Sub' WSubId_690 = "WSubId_690"
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    newclosure $P3, WSubId_686
    newclosure $P4, WSubId_690
    .tailcall __ARG_1.'_or'($P3, $P4)
# }

.end # WSubId_685


.sub '' :anon :subid('WSubId_686') :outer('WSubId_685')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_687 = "WSubId_687"
# Body
# {
    newclosure $P3, WSubId_687
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_686


.sub '' :anon :subid('WSubId_687') :outer('WSubId_686')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_688 = "WSubId_688"
# Body
# {
# switch
    $P3 = __ARG_3.'_apply'('anything')
    set $S1, $P3
    set $S2, ":"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P4, WSubId_688
    .tailcall $P4(__ARG_3)
  __label_2: # default
    $P5 = __ARG_3.'_fail'()
    throw $P5
  __label_1: # switch end
# }

.end # WSubId_687


.sub '' :anon :subid('WSubId_688') :outer('WSubId_687')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_689 = "WSubId_689"
# Body
# {
    $P3 = __ARG_4.'_apply'("name")
store_lex '__WLEX_2', $P3
    newclosure $P3, WSubId_689
    .tailcall $P3(__ARG_4)
# }

.end # WSubId_688


.sub '' :anon :subid('WSubId_689') :outer('WSubId_688')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    $P3 = __ARG_5["locals"]
    find_lex $P4, '__WLEX_2'
    $P3.'push'($P4)
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "Set"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_1'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_689


.sub '' :anon :subid('WSubId_690') :outer('WSubId_685')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_691 = "WSubId_691"
# Body
# {
    newclosure $P2, WSubId_691
    .tailcall $P2(__ARG_6)
# }

.end # WSubId_690


.sub '' :anon :subid('WSubId_691') :outer('WSubId_690')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_7.'_apply'("empty")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_691


.sub 'expr3' :subid('WSubId_692') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P4
.lex '__WLEX_3', $P3
.const 'Sub' WSubId_693 = "WSubId_693"
.const 'Sub' WSubId_696 = "WSubId_696"
.const 'Sub' WSubId_701 = "WSubId_701"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var n: $P2
    null $P2
# var x: $P3
    null $P3
# var e: $P4
    null $P4
    newclosure $P5, WSubId_693
    newclosure $P6, WSubId_696
    set $P7, WSubId_701
    .tailcall self.'_or'($P5, $P6, $P7)
# }

.end # expr3


.sub '' :anon :subid('WSubId_693') :outer('WSubId_692')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_694 = "WSubId_694"
# Body
# {
    newclosure $P2, WSubId_694
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_693


.sub '' :anon :subid('WSubId_694') :outer('WSubId_693')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_695 = "WSubId_695"
# Body
# {
    __ARG_2.'_applyWithArgs'("token", ":")
    $P2 = __ARG_2.'_apply'("name")
store_lex '__WLEX_1', $P2
    newclosure $P2, WSubId_695
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_694


.sub '' :anon :subid('WSubId_695') :outer('WSubId_694')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_3["locals"]
    find_lex $P3, '__WLEX_1'
    $P2.'push'($P3)
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Set"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    box $P6, "App"
    push $P5, $P6
    box $P6, "anything"
    push $P5, $P6
    push $P2, $P5
    .return($P2)
# }

.end # WSubId_695


.sub '' :anon :subid('WSubId_696') :outer('WSubId_692')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_697 = "WSubId_697"
# Body
# {
    newclosure $P3, WSubId_697
    .tailcall $P3(__ARG_4)
# }

.end # WSubId_696


.sub '' :anon :subid('WSubId_697') :outer('WSubId_696')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_698 = "WSubId_698"
.const 'Sub' WSubId_700 = "WSubId_700"
# Body
# {
    newclosure $P4, WSubId_698
    set $P5, WSubId_700
    $P3 = __ARG_5.'_or'($P4, $P5)
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_2'
    .tailcall __ARG_5.'_applyWithArgs'("optBind", $P3)
# }

.end # WSubId_697


.sub '' :anon :subid('WSubId_698') :outer('WSubId_697')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_3'
.const 'Sub' WSubId_699 = "WSubId_699"
# Body
# {
    newclosure $P2, WSubId_699
    .tailcall $P2(__ARG_6)
# }

.end # WSubId_698


.sub '' :anon :subid('WSubId_699') :outer('WSubId_698')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_3'
# Body
# {
    $P2 = __ARG_7.'_apply'("expr2")
store_lex '__WLEX_3', $P2
    find_lex $P2, '__WLEX_3'
    .tailcall __ARG_7.'_applyWithArgs'("optIter", $P2)
# }

.end # WSubId_699


.sub '' :anon :subid('WSubId_700') :outer('WSubId_697')
        .param pmc __ARG_8
# Body
# {
    .tailcall __ARG_8.'_apply'("semAction")
# }

.end # WSubId_700


.sub '' :anon :subid('WSubId_701') :outer('WSubId_692')
        .param pmc __ARG_9
# Body
# {
    .tailcall __ARG_9.'_apply'("semPred")
# }

.end # WSubId_701


.sub 'expr2' :subid('WSubId_702') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_703 = "WSubId_703"
.const 'Sub' WSubId_705 = "WSubId_705"
.const 'Sub' WSubId_707 = "WSubId_707"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_703
    newclosure $P4, WSubId_705
    set $P5, WSubId_707
    .tailcall self.'_or'($P3, $P4, $P5)
# }

.end # expr2


.sub '' :anon :subid('WSubId_703') :outer('WSubId_702')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_704 = "WSubId_704"
# Body
# {
    newclosure $P2, WSubId_704
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_703


.sub '' :anon :subid('WSubId_704') :outer('WSubId_703')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "~")
    $P2 = __ARG_2.'_apply'("expr2")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Not"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_704


.sub '' :anon :subid('WSubId_705') :outer('WSubId_702')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_706 = "WSubId_706"
# Body
# {
    newclosure $P2, WSubId_706
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_705


.sub '' :anon :subid('WSubId_706') :outer('WSubId_705')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "&")
    $P2 = __ARG_4.'_apply'("expr1")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Lookahead"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_706


.sub '' :anon :subid('WSubId_707') :outer('WSubId_702')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("expr1")
# }

.end # WSubId_707


.sub 'expr1' :subid('WSubId_708') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_709 = "WSubId_709"
.const 'Sub' WSubId_710 = "WSubId_710"
.const 'Sub' WSubId_715 = "WSubId_715"
.const 'Sub' WSubId_721 = "WSubId_721"
.const 'Sub' WSubId_723 = "WSubId_723"
.const 'Sub' WSubId_725 = "WSubId_725"
.const 'Sub' WSubId_727 = "WSubId_727"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    set $P3, WSubId_709
    newclosure $P4, WSubId_710
    set $P5, WSubId_715
    newclosure $P6, WSubId_721
    newclosure $P7, WSubId_723
    newclosure $P8, WSubId_725
    newclosure $P9, WSubId_727
    .tailcall self.'_or'($P3, $P4, $P5, $P6, $P7, $P8, $P9)
# }

.end # expr1


.sub '' :anon :subid('WSubId_709') :outer('WSubId_708')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("application")
# }

.end # WSubId_709


.sub '' :anon :subid('WSubId_710') :outer('WSubId_708')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_711 = "WSubId_711"
# Body
# {
    newclosure $P2, WSubId_711
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_710


.sub '' :anon :subid('WSubId_711') :outer('WSubId_710')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_712 = "WSubId_712"
.const 'Sub' WSubId_713 = "WSubId_713"
.const 'Sub' WSubId_714 = "WSubId_714"
# Body
# {
    set $P3, WSubId_712
    set $P4, WSubId_713
    set $P5, WSubId_714
    $P2 = __ARG_3.'_or'($P3, $P4, $P5)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "App"
    push $P2, $P3
    box $P3, "exactly"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_711


.sub '' :anon :subid('WSubId_712') :outer('WSubId_711')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_applyWithArgs'("keyword", "null")
# }

.end # WSubId_712


.sub '' :anon :subid('WSubId_713') :outer('WSubId_711')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_applyWithArgs'("keyword", "true")
# }

.end # WSubId_713


.sub '' :anon :subid('WSubId_714') :outer('WSubId_711')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_applyWithArgs'("keyword", "false")
# }

.end # WSubId_714


.sub '' :anon :subid('WSubId_715') :outer('WSubId_708')
        .param pmc __ARG_7
.const 'Sub' WSubId_716 = "WSubId_716"
# Body
# {
    set $P1, WSubId_716
    .tailcall $P1(__ARG_7)
# }

.end # WSubId_715


.sub '' :anon :subid('WSubId_716') :outer('WSubId_715')
        .param pmc __ARG_8
.const 'Sub' WSubId_717 = "WSubId_717"
.const 'Sub' WSubId_718 = "WSubId_718"
.const 'Sub' WSubId_719 = "WSubId_719"
.const 'Sub' WSubId_720 = "WSubId_720"
# Body
# {
    __ARG_8.'_apply'("spaces")
    set $P1, WSubId_717
    set $P2, WSubId_718
    set $P3, WSubId_719
    set $P4, WSubId_720
    .tailcall __ARG_8.'_or'($P1, $P2, $P3, $P4)
# }

.end # WSubId_716


.sub '' :anon :subid('WSubId_717') :outer('WSubId_716')
        .param pmc __ARG_9
# Body
# {
    .tailcall __ARG_9.'_apply'("characters")
# }

.end # WSubId_717


.sub '' :anon :subid('WSubId_718') :outer('WSubId_716')
        .param pmc __ARG_10
# Body
# {
    .tailcall __ARG_10.'_apply'("sCharacters")
# }

.end # WSubId_718


.sub '' :anon :subid('WSubId_719') :outer('WSubId_716')
        .param pmc __ARG_11
# Body
# {
    .tailcall __ARG_11.'_apply'("string")
# }

.end # WSubId_719


.sub '' :anon :subid('WSubId_720') :outer('WSubId_716')
        .param pmc __ARG_12
# Body
# {
    .tailcall __ARG_12.'_apply'("number")
# }

.end # WSubId_720


.sub '' :anon :subid('WSubId_721') :outer('WSubId_708')
        .param pmc __ARG_13
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_722 = "WSubId_722"
# Body
# {
    newclosure $P2, WSubId_722
    .tailcall $P2(__ARG_13)
# }

.end # WSubId_721


.sub '' :anon :subid('WSubId_722') :outer('WSubId_721')
        .param pmc __ARG_14
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_14.'_applyWithArgs'("token", "[")
    $P2 = __ARG_14.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_14.'_applyWithArgs'("token", "]")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Form"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_722


.sub '' :anon :subid('WSubId_723') :outer('WSubId_708')
        .param pmc __ARG_15
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_724 = "WSubId_724"
# Body
# {
    newclosure $P2, WSubId_724
    .tailcall $P2(__ARG_15)
# }

.end # WSubId_723


.sub '' :anon :subid('WSubId_724') :outer('WSubId_723')
        .param pmc __ARG_16
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_16.'_applyWithArgs'("token", "<")
    $P2 = __ARG_16.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_16.'_applyWithArgs'("token", ">")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "ConsBy"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_724


.sub '' :anon :subid('WSubId_725') :outer('WSubId_708')
        .param pmc __ARG_17
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_726 = "WSubId_726"
# Body
# {
    newclosure $P2, WSubId_726
    .tailcall $P2(__ARG_17)
# }

.end # WSubId_725


.sub '' :anon :subid('WSubId_726') :outer('WSubId_725')
        .param pmc __ARG_18
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_18.'_applyWithArgs'("token", "@<")
    $P2 = __ARG_18.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_18.'_applyWithArgs'("token", ">")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "IdxConsBy"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_726


.sub '' :anon :subid('WSubId_727') :outer('WSubId_708')
        .param pmc __ARG_19
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_728 = "WSubId_728"
# Body
# {
    newclosure $P2, WSubId_728
    .tailcall $P2(__ARG_19)
# }

.end # WSubId_727


.sub '' :anon :subid('WSubId_728') :outer('WSubId_727')
        .param pmc __ARG_20
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_20.'_applyWithArgs'("token", "(")
    $P2 = __ARG_20.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_20.'_applyWithArgs'("token", ")")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_728


.sub 'ruleName' :subid('WSubId_729') :method
.const 'Sub' WSubId_730 = "WSubId_730"
.const 'Sub' WSubId_731 = "WSubId_731"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_730
    set $P3, WSubId_731
    .tailcall self.'_or'($P2, $P3)
# }

.end # ruleName


.sub '' :anon :subid('WSubId_730') :outer('WSubId_729')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("name")
# }

.end # WSubId_730


.sub '' :anon :subid('WSubId_731') :outer('WSubId_729')
        .param pmc __ARG_2
.const 'Sub' WSubId_732 = "WSubId_732"
# Body
# {
    set $P1, WSubId_732
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_731


.sub '' :anon :subid('WSubId_732') :outer('WSubId_731')
        .param pmc __ARG_3
# Body
# {
    __ARG_3.'_apply'("spaces")
    .tailcall __ARG_3.'_apply'("tsString")
# }

.end # WSubId_732


.sub 'rule' :subid('WSubId_733') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_734 = "WSubId_734"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var n: $P2
    null $P2
# var x: $P3
    null $P3
# var xs: $P4
    null $P4
    newclosure $P5, WSubId_734
    .tailcall $P5(self)
# }

.end # rule


.sub '' :anon :subid('WSubId_734') :outer('WSubId_733')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_735 = "WSubId_735"
.const 'Sub' WSubId_736 = "WSubId_736"
# Body
# {
    newclosure $P4, WSubId_735
    __ARG_1.'_lookahead'($P4)
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "fromIdx=self.input.idx"
    push $P4, $P5
    __ARG_1["locals"] = $P4
    find_lex $P5, '__WLEX_1'
    $P4 = __ARG_1.'_applyWithArgs'("rulePart", $P5)
store_lex '__WLEX_2', $P4
    newclosure $P5, WSubId_736
    $P4 = __ARG_1.'_many'($P5)
store_lex '__WLEX_3', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "Rule"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    push $P4, $P6
    $P7 = __ARG_1["locals"]
    push $P4, $P7
    root_new $P9, ['parrot';'ResizablePMCArray']
    box $P10, "Or"
    push $P9, $P10
    find_lex $P11, '__WLEX_2'
    push $P9, $P11
    find_lex $P12, '__WLEX_3'
    $P8 = $P9.'append'($P12)
    push $P4, $P8
    .return($P4)
# }

.end # WSubId_734


.sub '' :anon :subid('WSubId_735') :outer('WSubId_734')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("ruleName")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_735


.sub '' :anon :subid('WSubId_736') :outer('WSubId_734')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_737 = "WSubId_737"
# Body
# {
    newclosure $P2, WSubId_737
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_736


.sub '' :anon :subid('WSubId_737') :outer('WSubId_736')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", ",")
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_4.'_applyWithArgs'("rulePart", $P2)
# }

.end # WSubId_737


.sub 'rulePart' :subid('WSubId_738') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_739 = "WSubId_739"
# Body
# {
# var fromIdx: $P1
    getattribute $P6, self, 'input'
    getattribute $P1, $P6, 'idx'
# var rn: $P2
    null $P2
# var n: $P3
    null $P3
# var b1: $P4
    null $P4
# var b2: $P5
    null $P5
    newclosure $P6, WSubId_739
    .tailcall $P6(self)
# }

.end # rulePart


.sub '' :anon :subid('WSubId_739') :outer('WSubId_738')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_4'
.const 'Sub' WSubId_740 = "WSubId_740"
.const 'Sub' WSubId_742 = "WSubId_742"
# Body
# {
    $P5 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P5
    $P5 = __ARG_1.'_apply'("ruleName")
store_lex '__WLEX_2', $P5
    find_lex $P5, '__WLEX_2'
    find_lex $P6, '__WLEX_1'
    iseq $I1, $P5, $P6
    __ARG_1.'_pred'($I1)
    $P5 = __ARG_1.'_apply'("expr4")
store_lex '__WLEX_3', $P5
    newclosure $P5, WSubId_740
    newclosure $P6, WSubId_742
    .tailcall __ARG_1.'_or'($P5, $P6)
# }

.end # WSubId_739


.sub '' :anon :subid('WSubId_740') :outer('WSubId_739')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_741 = "WSubId_741"
# Body
# {
    newclosure $P3, WSubId_741
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_740


.sub '' :anon :subid('WSubId_741') :outer('WSubId_740')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_3'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "=")
    $P3 = __ARG_3.'_apply'("expr")
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "And"
    push $P3, $P4
    find_lex $P5, '__WLEX_3'
    push $P3, $P5
    find_lex $P6, '__WLEX_4'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_741


.sub '' :anon :subid('WSubId_742') :outer('WSubId_739')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_3'
.const 'Sub' WSubId_743 = "WSubId_743"
# Body
# {
    newclosure $P2, WSubId_743
    .tailcall $P2(__ARG_4)
# }

.end # WSubId_742


.sub '' :anon :subid('WSubId_743') :outer('WSubId_742')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_3'
# Body
# {
    __ARG_5.'_apply'("empty")
    find_lex $P2, '__WLEX_3'
    .return($P2)
# }

.end # WSubId_743


.sub 'grammar' :subid('WSubId_744') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_745 = "WSubId_745"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var n: $P2
    null $P2
# var sn: $P3
    null $P3
# var rs: $P4
    null $P4
    newclosure $P5, WSubId_745
    .tailcall $P5(self)
# }

.end # grammar


.sub '' :anon :subid('WSubId_745') :outer('WSubId_744')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_746 = "WSubId_746"
.const 'Sub' WSubId_748 = "WSubId_748"
# Body
# {
    __ARG_1.'_applyWithArgs'("keyword", "ometa")
    $P4 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P4
    set $P5, WSubId_746
    set $P6, WSubId_748
    $P4 = __ARG_1.'_or'($P5, $P6)
store_lex '__WLEX_2', $P4
    __ARG_1.'_applyWithArgs'("token", "{")
    $P4 = __ARG_1.'_applyWithArgs'("listOf", "rule", ",")
store_lex '__WLEX_3', $P4
    __ARG_1.'_applyWithArgs'("token", "}")
    root_new $P5, ['parrot';'ResizablePMCArray']
    box $P6, "Grammar"
    push $P5, $P6
    find_lex $P7, '__WLEX_1'
    push $P5, $P7
    find_lex $P8, '__WLEX_2'
    push $P5, $P8
    find_lex $P9, '__WLEX_3'
    $P4 = $P5.'append'($P9)
    .tailcall __ARG_1.'_applyWithArgs'("foreign", 'OMetaOptimizer', 'optimizeGrammar', $P4)
# }

.end # WSubId_745


.sub '' :anon :subid('WSubId_746') :outer('WSubId_745')
        .param pmc __ARG_2
.const 'Sub' WSubId_747 = "WSubId_747"
# Body
# {
    set $P1, WSubId_747
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_746


.sub '' :anon :subid('WSubId_747') :outer('WSubId_746')
        .param pmc __ARG_3
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "<:")
    .tailcall __ARG_3.'_apply'("name")
# }

.end # WSubId_747


.sub '' :anon :subid('WSubId_748') :outer('WSubId_745')
        .param pmc __ARG_4
.const 'Sub' WSubId_749 = "WSubId_749"
# Body
# {
    set $P1, WSubId_749
    .tailcall $P1(__ARG_4)
# }

.end # WSubId_748


.sub '' :anon :subid('WSubId_749') :outer('WSubId_748')
        .param pmc __ARG_5
# Body
# {
    __ARG_5.'_apply'("empty")
    .return("OMeta")
# }

.end # WSubId_749

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMetaParser' ]
    get_class $P1, [ 'Parser' ]
    addparent $P0, $P1
.end
.namespace [ 'OMetaTranslator' ]

.sub 'App' :subid('WSubId_750') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_751 = "WSubId_751"
.const 'Sub' WSubId_755 = "WSubId_755"
.const 'Sub' WSubId_758 = "WSubId_758"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var args: $P2
    null $P2
# var rule: $P3
    null $P3
    newclosure $P4, WSubId_751
    newclosure $P5, WSubId_755
    newclosure $P6, WSubId_758
    .tailcall self.'_or'($P4, $P5, $P6)
# }

.end # App


.sub '' :anon :subid('WSubId_751') :outer('WSubId_750')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_752 = "WSubId_752"
# Body
# {
    newclosure $P2, WSubId_752
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_751


.sub '' :anon :subid('WSubId_752') :outer('WSubId_751')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_753 = "WSubId_753"
# Body
# {
# switch
    $P2 = __ARG_2.'_apply'('anything')
    set $S1, $P2
    set $S2, "super"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_753
    .tailcall $P3(__ARG_2)
  __label_2: # default
    $P4 = __ARG_2.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_752


.sub '' :anon :subid('WSubId_753') :outer('WSubId_752')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_754 = "WSubId_754"
# Body
# {
    set $P3, WSubId_754
    $P2 = __ARG_3.'_many1'($P3)
store_lex '__WLEX_1', $P2
# predefined string
    $S1 = __ARG_3["sName"]
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S2, ",", $P2
    concat $S3, "self._superApplyWithArgs(\"", $S1
    concat $S3, $S3, "\","
    concat $S3, $S3, $S2
    concat $S3, $S3, ")"
    .return($S3)
# }

.end # WSubId_753


.sub '' :anon :subid('WSubId_754') :outer('WSubId_753')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("anything")
# }

.end # WSubId_754


.sub '' :anon :subid('WSubId_755') :outer('WSubId_750')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_756 = "WSubId_756"
# Body
# {
    newclosure $P3, WSubId_756
    .tailcall $P3(__ARG_5)
# }

.end # WSubId_755


.sub '' :anon :subid('WSubId_756') :outer('WSubId_755')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_757 = "WSubId_757"
# Body
# {
    $P3 = __ARG_6.'_apply'("anything")
store_lex '__WLEX_2', $P3
    set $P4, WSubId_757
    $P3 = __ARG_6.'_many1'($P4)
store_lex '__WLEX_1', $P3
# predefined string
    find_lex $P3, '__WLEX_2'
    set $S1, $P3
    find_lex $P4, '__WLEX_1'
# predefined join
    join $S2, ",", $P4
    concat $S3, "self._applyWithArgs(\"", $S1
    concat $S3, $S3, "\","
    concat $S3, $S3, $S2
    concat $S3, $S3, ")"
    .return($S3)
# }

.end # WSubId_756


.sub '' :anon :subid('WSubId_757') :outer('WSubId_756')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("anything")
# }

.end # WSubId_757


.sub '' :anon :subid('WSubId_758') :outer('WSubId_750')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_759 = "WSubId_759"
# Body
# {
    newclosure $P2, WSubId_759
    .tailcall $P2(__ARG_8)
# }

.end # WSubId_758


.sub '' :anon :subid('WSubId_759') :outer('WSubId_758')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_9.'_apply'("anything")
store_lex '__WLEX_2', $P2
# predefined string
    find_lex $P2, '__WLEX_2'
    set $S1, $P2
    concat $S2, "self._apply(\"", $S1
    concat $S2, $S2, "\")"
    .return($S2)
# }

.end # WSubId_759


.sub 'Act' :subid('WSubId_760') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_761 = "WSubId_761"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var expr: $P2
    null $P2
    newclosure $P3, WSubId_761
    .tailcall $P3(self)
# }

.end # Act


.sub '' :anon :subid('WSubId_761') :outer('WSubId_760')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_761


.sub 'Pred' :subid('WSubId_762') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_763 = "WSubId_763"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var expr: $P2
    null $P2
    newclosure $P3, WSubId_763
    .tailcall $P3(self)
# }

.end # Pred


.sub '' :anon :subid('WSubId_763') :outer('WSubId_762')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "self._pred(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_763


.sub 'Or' :subid('WSubId_764') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_765 = "WSubId_765"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_765
    .tailcall $P3(self)
# }

.end # Or


.sub '' :anon :subid('WSubId_765') :outer('WSubId_764')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_766 = "WSubId_766"
# Body
# {
    set $P3, WSubId_766
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    concat $S2, "self._or(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_765


.sub '' :anon :subid('WSubId_766') :outer('WSubId_765')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("transFn")
# }

.end # WSubId_766


.sub 'XOr' :subid('WSubId_767') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_768 = "WSubId_768"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_768
    .tailcall $P3(self)
# }

.end # XOr


.sub '' :anon :subid('WSubId_768') :outer('WSubId_767')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_769 = "WSubId_769"
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    set $P3, WSubId_769
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    $P4 = __ARG_1["name"]
    set $I3, $P4
    set $I4, "."
    add $I2, $I3, $I4
    $P5 = __ARG_1["rName"]
    set $I5, $P5
    add $I1, $I2, $I5
    $P3 = WSubId_995($I1)
    $P2.'unshift'($P3)
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    concat $S2, "self._xor(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_768


.sub '' :anon :subid('WSubId_769') :outer('WSubId_768')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("transFn")
# }

.end # WSubId_769


.sub 'And' :subid('WSubId_770') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_771 = "WSubId_771"
.const 'Sub' WSubId_774 = "WSubId_774"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var xs: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_771
    set $P5, WSubId_774
    .tailcall self.'_or'($P4, $P5)
# }

.end # And


.sub '' :anon :subid('WSubId_771') :outer('WSubId_770')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_772 = "WSubId_772"
# Body
# {
    newclosure $P3, WSubId_772
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_771


.sub '' :anon :subid('WSubId_772') :outer('WSubId_771')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_773 = "WSubId_773"
# Body
# {
    set $P4, WSubId_773
    $P3 = __ARG_2.'_many'($P4)
store_lex '__WLEX_1', $P3
    $P3 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_1'
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S1, $P4
    concat $S2, "return ", $S1
    $P3.'push'($S2)
    find_lex $P3, '__WLEX_1'
# predefined join
    join $S1, ";", $P3
    concat $S2, "(function(var self){", $S1
    concat $S2, $S2, ";})(self)"
    .return($S2)
# }

.end # WSubId_772


.sub '' :anon :subid('WSubId_773') :outer('WSubId_772')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("notLast", "trans")
# }

.end # WSubId_773


.sub '' :anon :subid('WSubId_774') :outer('WSubId_770')
        .param pmc __ARG_4
# Body
# {
    .return("")
# }

.end # WSubId_774


.sub 'Opt' :subid('WSubId_775') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_776 = "WSubId_776"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_776
    .tailcall $P3(self)
# }

.end # Opt


.sub '' :anon :subid('WSubId_776') :outer('WSubId_775')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "self._opt(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_776


.sub 'Many' :subid('WSubId_777') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_778 = "WSubId_778"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_778
    .tailcall $P3(self)
# }

.end # Many


.sub '' :anon :subid('WSubId_778') :outer('WSubId_777')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "self._many(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_778


.sub 'Many1' :subid('WSubId_779') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_780 = "WSubId_780"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_780
    .tailcall $P3(self)
# }

.end # Many1


.sub '' :anon :subid('WSubId_780') :outer('WSubId_779')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "self._many1(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_780


.sub 'Not' :subid('WSubId_781') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_782 = "WSubId_782"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_782
    .tailcall $P3(self)
# }

.end # Not


.sub '' :anon :subid('WSubId_782') :outer('WSubId_781')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "self._not(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_782


.sub 'Lookahead' :subid('WSubId_783') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_784 = "WSubId_784"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_784
    .tailcall $P3(self)
# }

.end # Lookahead


.sub '' :anon :subid('WSubId_784') :outer('WSubId_783')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "self._lookahead(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_784


.sub 'Form' :subid('WSubId_785') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_786 = "WSubId_786"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_786
    .tailcall $P3(self)
# }

.end # Form


.sub '' :anon :subid('WSubId_786') :outer('WSubId_785')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "self._form(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_786


.sub 'ConsBy' :subid('WSubId_787') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_788 = "WSubId_788"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_788
    .tailcall $P3(self)
# }

.end # ConsBy


.sub '' :anon :subid('WSubId_788') :outer('WSubId_787')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "self._consumedBy(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_788


.sub 'IdxConsBy' :subid('WSubId_789') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_790 = "WSubId_790"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_790
    .tailcall $P3(self)
# }

.end # IdxConsBy


.sub '' :anon :subid('WSubId_790') :outer('WSubId_789')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "self._idxConsumedBy(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_790


.sub 'Set' :subid('WSubId_791') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_792 = "WSubId_792"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var n: $P2
    null $P2
# var v: $P3
    null $P3
    newclosure $P4, WSubId_792
    .tailcall $P4(self)
# }

.end # Set


.sub '' :anon :subid('WSubId_792') :outer('WSubId_791')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P3, '__WLEX_1'
    set $S1, $P3
# predefined string
    find_lex $P4, '__WLEX_2'
    set $S2, $P4
    concat $S3, $S1, "="
    concat $S3, $S3, $S2
    .return($S3)
# }

.end # WSubId_792


.sub 'JumpTable' :subid('WSubId_793') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_794 = "WSubId_794"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var cases: $P2
    null $P2
    newclosure $P3, WSubId_794
    .tailcall $P3(self)
# }

.end # JumpTable


.sub '' :anon :subid('WSubId_794') :outer('WSubId_793')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_795 = "WSubId_795"
# Body
# {
    set $P3, WSubId_795
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_1.'jumpTableCode'($P2)
# }

.end # WSubId_794


.sub '' :anon :subid('WSubId_795') :outer('WSubId_794')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("jtCase")
# }

.end # WSubId_795


.sub 'Interleave' :subid('WSubId_796') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_797 = "WSubId_797"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_797
    .tailcall $P3(self)
# }

.end # Interleave


.sub '' :anon :subid('WSubId_797') :outer('WSubId_796')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_798 = "WSubId_798"
# Body
# {
    set $P3, WSubId_798
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    concat $S2, "self._interleave(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_797


.sub '' :anon :subid('WSubId_798') :outer('WSubId_797')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("intPart")
# }

.end # WSubId_798


.sub 'Rule' :subid('WSubId_799') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_800 = "WSubId_800"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var name: $P2
    null $P2
# var ls: $P3
    null $P3
# var body: $P4
    null $P4
    newclosure $P5, WSubId_800
    .tailcall $P5(self)
# }

.end # Rule


.sub '' :anon :subid('WSubId_800') :outer('WSubId_799')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    find_lex $P4, '__WLEX_1'
    __ARG_1["rName"] = $P4
    $P4 = __ARG_1.'_apply'("locals")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
# predefined string
    find_lex $P6, '__WLEX_3'
    set $S3, $P6
    concat $S4, "function ", $S1
    concat $S4, $S4, "(){"
    concat $S4, $S4, $S2
    concat $S4, $S4, "return "
    concat $S4, $S4, $S3
    concat $S4, $S4, ";}"
    .return($S4)
# }

.end # WSubId_800


.sub 'Grammar' :subid('WSubId_801') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_802 = "WSubId_802"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var name: $P2
    null $P2
# var sName: $P3
    null $P3
# var rules: $P4
    null $P4
    newclosure $P5, WSubId_802
    .tailcall $P5(self)
# }

.end # Grammar


.sub '' :anon :subid('WSubId_802') :outer('WSubId_801')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_803 = "WSubId_803"
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P4
    find_lex $P4, '__WLEX_1'
    __ARG_1["name"] = $P4
    find_lex $P4, '__WLEX_2'
    __ARG_1["sName"] = $P4
    set $P5, WSubId_803
    $P4 = __ARG_1.'_many'($P5)
store_lex '__WLEX_3', $P4
# predefined string
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
    find_lex $P6, '__WLEX_3'
# predefined join
    join $S3, "", $P6
    concat $S4, "class ", $S1
    concat $S4, $S4, " : "
    concat $S4, $S4, $S2
    concat $S4, $S4, " {"
    concat $S4, $S4, $S3
    concat $S4, $S4, "}"
    .return($S4)
# }

.end # WSubId_802


.sub '' :anon :subid('WSubId_803') :outer('WSubId_802')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_803


.sub 'intPart' :subid('WSubId_804') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_805 = "WSubId_805"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var mode: $P2
    null $P2
# var part: $P3
    null $P3
    newclosure $P4, WSubId_805
    .tailcall $P4(self)
# }

.end # intPart


.sub '' :anon :subid('WSubId_805') :outer('WSubId_804')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_806 = "WSubId_806"
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    newclosure $P3, WSubId_806
    __ARG_1.'_form'($P3)
    find_lex $P4, '__WLEX_1'
    $P3 = WSubId_995($P4)
    set $I2, $P3
    set $I3, ","
    add $I1, $I2, $I3
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
    set $S3, $I1
    concat $S1, $S3, $S2
    .return($S1)
# }

.end # WSubId_805


.sub '' :anon :subid('WSubId_806') :outer('WSubId_805')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_807 = "WSubId_807"
# Body
# {
    newclosure $P3, WSubId_807
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_806


.sub '' :anon :subid('WSubId_807') :outer('WSubId_806')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_3.'_apply'("transFn")
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_807


.sub 'jtCase' :subid('WSubId_808') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_809 = "WSubId_809"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var e: $P3
    null $P3
    newclosure $P4, WSubId_809
    .tailcall $P4(self)
# }

.end # jtCase


.sub '' :anon :subid('WSubId_809') :outer('WSubId_808')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_810 = "WSubId_810"
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    newclosure $P3, WSubId_810
    __ARG_1.'_form'($P3)
    root_new $P3, ['parrot';'ResizablePMCArray']
    find_lex $P6, '__WLEX_1'
    $P5 = WSubId_995($P6)
    push $P3, $P5
    find_lex $P7, '__WLEX_2'
    push $P3, $P7
    .return($P3)
# }

.end # WSubId_809


.sub '' :anon :subid('WSubId_810') :outer('WSubId_809')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_811 = "WSubId_811"
# Body
# {
    newclosure $P3, WSubId_811
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_810


.sub '' :anon :subid('WSubId_811') :outer('WSubId_810')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_3.'_apply'("trans")
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_811


.sub 'local' :subid('WSubId_812') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_813 = "WSubId_813"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var n: $P2
    null $P2
    newclosure $P3, WSubId_813
    .tailcall $P3(self)
# }

.end # local


.sub '' :anon :subid('WSubId_813') :outer('WSubId_812')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_814 = "WSubId_814"
.const 'Sub' WSubId_816 = "WSubId_816"
# Body
# {
    $P2 = __ARG_1.'_apply'("string")
store_lex '__WLEX_1', $P2
    newclosure $P2, WSubId_814
    newclosure $P3, WSubId_816
    .tailcall __ARG_1.'_or'($P2, $P3)
# }

.end # WSubId_813


.sub '' :anon :subid('WSubId_814') :outer('WSubId_813')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_815 = "WSubId_815"
# Body
# {
    newclosure $P2, WSubId_815
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_814


.sub '' :anon :subid('WSubId_815') :outer('WSubId_814')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P3 = __ARG_3["seen"]
    find_lex $P4, '__WLEX_1'
    $P2 = $P3[$P4]
    isnull $I1, $P2
    not $I1
    __ARG_3.'_pred'($I1)
    .return("")
# }

.end # WSubId_815


.sub '' :anon :subid('WSubId_816') :outer('WSubId_813')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_817 = "WSubId_817"
# Body
# {
    newclosure $P2, WSubId_817
    .tailcall $P2(__ARG_4)
# }

.end # WSubId_816


.sub '' :anon :subid('WSubId_817') :outer('WSubId_816')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_5["seen"]
    find_lex $P3, '__WLEX_1'
    $P2[$P3] = 1
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "volatile var ", $S1
    concat $S2, $S2, " ;"
    .return($S2)
# }

.end # WSubId_817


.sub 'locals' :subid('WSubId_818') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_819 = "WSubId_819"
.const 'Sub' WSubId_823 = "WSubId_823"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var vs: $P2
    null $P2
    newclosure $P3, WSubId_819
    set $P4, WSubId_823
    .tailcall self.'_or'($P3, $P4)
# }

.end # locals


.sub '' :anon :subid('WSubId_819') :outer('WSubId_818')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_820 = "WSubId_820"
# Body
# {
    newclosure $P2, WSubId_820
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_819


.sub '' :anon :subid('WSubId_820') :outer('WSubId_819')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_821 = "WSubId_821"
# Body
# {
    root_new $P2, ['parrot';'Hash']
    __ARG_2["seen"] = $P2
    newclosure $P2, WSubId_821
    __ARG_2.'_form'($P2)
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, "", $P2
    .return($S1)
# }

.end # WSubId_820


.sub '' :anon :subid('WSubId_821') :outer('WSubId_820')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_822 = "WSubId_822"
# Body
# {
    set $P3, WSubId_822
    $P2 = __ARG_3.'_many1'($P3)
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_821


.sub '' :anon :subid('WSubId_822') :outer('WSubId_821')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("local")
# }

.end # WSubId_822


.sub '' :anon :subid('WSubId_823') :outer('WSubId_818')
        .param pmc __ARG_5
.const 'Sub' WSubId_824 = "WSubId_824"
# Body
# {
    set $P1, WSubId_824
    .tailcall $P1(__ARG_5)
# }

.end # WSubId_823


.sub '' :anon :subid('WSubId_824') :outer('WSubId_823')
        .param pmc __ARG_6
.const 'Sub' WSubId_825 = "WSubId_825"
# Body
# {
    set $P1, WSubId_825
    __ARG_6.'_form'($P1)
    .return("")
# }

.end # WSubId_824


.sub '' :anon :subid('WSubId_825') :outer('WSubId_824')
        .param pmc __ARG_7
# Body
# {
    .return()
# }

.end # WSubId_825


.sub 'trans' :subid('WSubId_826') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_827 = "WSubId_827"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var t: $P2
    null $P2
# var ans: $P3
    null $P3
    newclosure $P4, WSubId_827
    .tailcall $P4(self)
# }

.end # trans


.sub '' :anon :subid('WSubId_827') :outer('WSubId_826')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_828 = "WSubId_828"
# Body
# {
    newclosure $P3, WSubId_828
    __ARG_1.'_form'($P3)
    find_lex $P3, '__WLEX_2'
    .return($P3)
# }

.end # WSubId_827


.sub '' :anon :subid('WSubId_828') :outer('WSubId_827')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_829 = "WSubId_829"
# Body
# {
    newclosure $P3, WSubId_829
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_828


.sub '' :anon :subid('WSubId_829') :outer('WSubId_828')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P3
    find_lex $P4, '__WLEX_1'
    $P3 = __ARG_3.'_applyWithArgs'("apply", $P4)
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_829


.sub 'transFn' :subid('WSubId_830') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_831 = "WSubId_831"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_831
    .tailcall $P3(self)
# }

.end # transFn


.sub '' :anon :subid('WSubId_831') :outer('WSubId_830')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "(function(var self){return ", $S1
    concat $S2, $S2, ";})"
    .return($S2)
# }

.end # WSubId_831

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMetaTranslator' ]
    get_class $P1, [ 'OMeta' ]
    addparent $P0, $P1
.end
.namespace [ 'OMetaWinxedParser' ]

.sub 'topElem' :subid('WSubId_832') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_833 = "WSubId_833"
.const 'Sub' WSubId_835 = "WSubId_835"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_833
    set $P4, WSubId_835
    .tailcall self.'_or'($P3, $P4)
# }

.end # topElem


.sub '' :anon :subid('WSubId_833') :outer('WSubId_832')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_834 = "WSubId_834"
# Body
# {
    newclosure $P2, WSubId_834
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_833


.sub '' :anon :subid('WSubId_834') :outer('WSubId_833')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_apply'("spaces")
    $P2 = __ARG_2.'_applyWithArgs'("foreign", 'OMetaParser', 'grammar')
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_834


.sub '' :anon :subid('WSubId_835') :outer('WSubId_832')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_superApplyWithArgs'("WinxedParser", 'topElem')
# }

.end # WSubId_835

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMetaWinxedParser' ]
    get_class $P1, [ 'WinxedParser' ]
    addparent $P0, $P1
.end
.namespace [ 'OMetaWinxedTranslator' ]

.sub 'Grammar' :method
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    .tailcall self.'_applyWithArgs'("foreign", 'OMetaTranslator', 'Grammar')
# }

.end # Grammar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMetaWinxedTranslator' ]
    get_class $P1, [ 'WinxedTranslator' ]
    addparent $P0, $P1
.end
.namespace [ 'NullOptimization' ]

.sub 'setHelped' :method
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    self["_didSomething"] = 1
    .return(1)
# }

.end # setHelped


.sub 'helped' :method
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    $P2 = self["_didSomething"]
    .tailcall self.'_pred'($P2)
# }

.end # helped


.sub 'trans' :subid('WSubId_836') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_837 = "WSubId_837"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var t: $P2
    null $P2
# var ans: $P3
    null $P3
    newclosure $P4, WSubId_837
    .tailcall $P4(self)
# }

.end # trans


.sub '' :anon :subid('WSubId_837') :outer('WSubId_836')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_838 = "WSubId_838"
# Body
# {
    newclosure $P3, WSubId_838
    __ARG_1.'_form'($P3)
    find_lex $P3, '__WLEX_2'
    .return($P3)
# }

.end # WSubId_837


.sub '' :anon :subid('WSubId_838') :outer('WSubId_837')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_839 = "WSubId_839"
# Body
# {
    newclosure $P3, WSubId_839
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_838


.sub '' :anon :subid('WSubId_839') :outer('WSubId_838')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P3
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
# predefined find_method
    find_method $P3, __ARG_3, $S1
    isnull $I1, $P3
    not $I1
    __ARG_3.'_pred'($I1)
    find_lex $P4, '__WLEX_1'
    $P3 = __ARG_3.'_applyWithArgs'("apply", $P4)
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_839


.sub 'optimize' :subid('WSubId_840') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_841 = "WSubId_841"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_841
    .tailcall $P3(self)
# }

.end # optimize


.sub '' :anon :subid('WSubId_841') :outer('WSubId_840')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    __ARG_1.'_apply'("helped")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_841


.sub 'App' :subid('WSubId_842') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_843 = "WSubId_843"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var rule: $P2
    null $P2
# var args: $P3
    null $P3
    newclosure $P4, WSubId_843
    .tailcall $P4(self)
# }

.end # App


.sub '' :anon :subid('WSubId_843') :outer('WSubId_842')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_844 = "WSubId_844"
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    set $P4, WSubId_844
    $P3 = __ARG_1.'_many'($P4)
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "App"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_843


.sub '' :anon :subid('WSubId_844') :outer('WSubId_843')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("anything")
# }

.end # WSubId_844


.sub 'Act' :subid('WSubId_845') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_846 = "WSubId_846"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var expr: $P2
    null $P2
    newclosure $P3, WSubId_846
    .tailcall $P3(self)
# }

.end # Act


.sub '' :anon :subid('WSubId_846') :outer('WSubId_845')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Act"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_846


.sub 'Pred' :subid('WSubId_847') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_848 = "WSubId_848"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var expr: $P2
    null $P2
    newclosure $P3, WSubId_848
    .tailcall $P3(self)
# }

.end # Pred


.sub '' :anon :subid('WSubId_848') :outer('WSubId_847')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Pred"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_848


.sub 'Or' :subid('WSubId_849') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_850 = "WSubId_850"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_850
    .tailcall $P3(self)
# }

.end # Or


.sub '' :anon :subid('WSubId_850') :outer('WSubId_849')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_851 = "WSubId_851"
# Body
# {
    set $P3, WSubId_851
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Or"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_850


.sub '' :anon :subid('WSubId_851') :outer('WSubId_850')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_851


.sub 'XOr' :subid('WSubId_852') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_853 = "WSubId_853"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_853
    .tailcall $P3(self)
# }

.end # XOr


.sub '' :anon :subid('WSubId_853') :outer('WSubId_852')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_854 = "WSubId_854"
# Body
# {
    set $P3, WSubId_854
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "XOr"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_853


.sub '' :anon :subid('WSubId_854') :outer('WSubId_853')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_854


.sub 'And' :subid('WSubId_855') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_856 = "WSubId_856"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_856
    .tailcall $P3(self)
# }

.end # And


.sub '' :anon :subid('WSubId_856') :outer('WSubId_855')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_857 = "WSubId_857"
# Body
# {
    set $P3, WSubId_857
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "And"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_856


.sub '' :anon :subid('WSubId_857') :outer('WSubId_856')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_857


.sub 'Opt' :subid('WSubId_858') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_859 = "WSubId_859"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_859
    .tailcall $P3(self)
# }

.end # Opt


.sub '' :anon :subid('WSubId_859') :outer('WSubId_858')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Opt"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_859


.sub 'Many' :subid('WSubId_860') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_861 = "WSubId_861"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_861
    .tailcall $P3(self)
# }

.end # Many


.sub '' :anon :subid('WSubId_861') :outer('WSubId_860')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Many"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_861


.sub 'Many1' :subid('WSubId_862') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_863 = "WSubId_863"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_863
    .tailcall $P3(self)
# }

.end # Many1


.sub '' :anon :subid('WSubId_863') :outer('WSubId_862')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Many1"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_863


.sub 'Set' :subid('WSubId_864') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_865 = "WSubId_865"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var n: $P2
    null $P2
# var v: $P3
    null $P3
    newclosure $P4, WSubId_865
    .tailcall $P4(self)
# }

.end # Set


.sub '' :anon :subid('WSubId_865') :outer('WSubId_864')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "Set"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_865


.sub 'Not' :subid('WSubId_866') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_867 = "WSubId_867"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_867
    .tailcall $P3(self)
# }

.end # Not


.sub '' :anon :subid('WSubId_867') :outer('WSubId_866')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Not"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_867


.sub 'Lookahead' :subid('WSubId_868') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_869 = "WSubId_869"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_869
    .tailcall $P3(self)
# }

.end # Lookahead


.sub '' :anon :subid('WSubId_869') :outer('WSubId_868')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Lookahead"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_869


.sub 'Form' :subid('WSubId_870') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_871 = "WSubId_871"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_871
    .tailcall $P3(self)
# }

.end # Form


.sub '' :anon :subid('WSubId_871') :outer('WSubId_870')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Form"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_871


.sub 'ConsBy' :subid('WSubId_872') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_873 = "WSubId_873"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_873
    .tailcall $P3(self)
# }

.end # ConsBy


.sub '' :anon :subid('WSubId_873') :outer('WSubId_872')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "ConsBy"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_873


.sub 'IdxConsBy' :subid('WSubId_874') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_875 = "WSubId_875"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_875
    .tailcall $P3(self)
# }

.end # IdxConsBy


.sub '' :anon :subid('WSubId_875') :outer('WSubId_874')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "IdxConsBy"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_875


.sub 'JumpTable' :subid('WSubId_876') :method
.lex '__WLEX_1', $P4
.lex '__WLEX_2', $P2
.lex '__WLEX_3', $P3
.const 'Sub' WSubId_877 = "WSubId_877"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var c: $P2
    null $P2
# var e: $P3
    null $P3
# var ces: $P4
    null $P4
    newclosure $P5, WSubId_877
    .tailcall $P5(self)
# }

.end # JumpTable


.sub '' :anon :subid('WSubId_877') :outer('WSubId_876')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_878 = "WSubId_878"
# Body
# {
    newclosure $P5, WSubId_878
    $P4 = __ARG_1.'_many'($P5)
store_lex '__WLEX_1', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "JumpTable"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    .tailcall $P4.'append'($P6)
# }

.end # WSubId_877


.sub '' :anon :subid('WSubId_878') :outer('WSubId_877')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_879 = "WSubId_879"
# Body
# {
    newclosure $P3, WSubId_879
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_878


.sub '' :anon :subid('WSubId_879') :outer('WSubId_878')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_880 = "WSubId_880"
# Body
# {
    newclosure $P3, WSubId_880
    __ARG_3.'_form'($P3)
    root_new $P3, ['parrot';'ResizablePMCArray']
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_3'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_879


.sub '' :anon :subid('WSubId_880') :outer('WSubId_879')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_881 = "WSubId_881"
# Body
# {
    newclosure $P3, WSubId_881
    .tailcall $P3(__ARG_4)
# }

.end # WSubId_880


.sub '' :anon :subid('WSubId_881') :outer('WSubId_880')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
# Body
# {
    $P3 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_2', $P3
    $P3 = __ARG_5.'_apply'("trans")
store_lex '__WLEX_3', $P3
    .return(0)
# }

.end # WSubId_881


.sub 'Interleave' :subid('WSubId_882') :method
.lex '__WLEX_1', $P4
.lex '__WLEX_2', $P2
.lex '__WLEX_3', $P3
.const 'Sub' WSubId_883 = "WSubId_883"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var m: $P2
    null $P2
# var p: $P3
    null $P3
# var xs: $P4
    null $P4
    newclosure $P5, WSubId_883
    .tailcall $P5(self)
# }

.end # Interleave


.sub '' :anon :subid('WSubId_883') :outer('WSubId_882')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_884 = "WSubId_884"
# Body
# {
    newclosure $P5, WSubId_884
    $P4 = __ARG_1.'_many'($P5)
store_lex '__WLEX_1', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "Interleave"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    .tailcall $P4.'append'($P6)
# }

.end # WSubId_883


.sub '' :anon :subid('WSubId_884') :outer('WSubId_883')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_885 = "WSubId_885"
# Body
# {
    newclosure $P3, WSubId_885
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_884


.sub '' :anon :subid('WSubId_885') :outer('WSubId_884')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_886 = "WSubId_886"
# Body
# {
    newclosure $P3, WSubId_886
    __ARG_3.'_form'($P3)
    root_new $P3, ['parrot';'ResizablePMCArray']
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_3'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_885


.sub '' :anon :subid('WSubId_886') :outer('WSubId_885')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_887 = "WSubId_887"
# Body
# {
    newclosure $P3, WSubId_887
    .tailcall $P3(__ARG_4)
# }

.end # WSubId_886


.sub '' :anon :subid('WSubId_887') :outer('WSubId_886')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
# Body
# {
    $P3 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_2', $P3
    $P3 = __ARG_5.'_apply'("trans")
store_lex '__WLEX_3', $P3
    .return(0)
# }

.end # WSubId_887


.sub 'Rule' :subid('WSubId_888') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_889 = "WSubId_889"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var name: $P2
    null $P2
# var ls: $P3
    null $P3
# var body: $P4
    null $P4
    newclosure $P5, WSubId_889
    .tailcall $P5(self)
# }

.end # Rule


.sub '' :anon :subid('WSubId_889') :outer('WSubId_888')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "Rule"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    push $P4, $P6
    find_lex $P7, '__WLEX_2'
    push $P4, $P7
    find_lex $P8, '__WLEX_3'
    push $P4, $P8
    .return($P4)
# }

.end # WSubId_889

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullOptimization' ]
    get_class $P1, [ 'OMeta' ]
    addparent $P0, $P1
.end
.namespace [ 'AssociativeOptimization' ]

.sub 'And' :subid('WSubId_890') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_891 = "WSubId_891"
.const 'Sub' WSubId_893 = "WSubId_893"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var xs: $P3
    null $P3
    newclosure $P4, WSubId_891
    newclosure $P5, WSubId_893
    .tailcall self.'_or'($P4, $P5)
# }

.end # And


.sub '' :anon :subid('WSubId_891') :outer('WSubId_890')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_892 = "WSubId_892"
# Body
# {
    newclosure $P2, WSubId_892
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_891


.sub '' :anon :subid('WSubId_892') :outer('WSubId_891')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_1', $P2
    __ARG_2.'_apply'("end")
    __ARG_2.'_apply'("setHelped")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_892


.sub '' :anon :subid('WSubId_893') :outer('WSubId_890')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_894 = "WSubId_894"
# Body
# {
    newclosure $P2, WSubId_894
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_893


.sub '' :anon :subid('WSubId_894') :outer('WSubId_893')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_4.'_applyWithArgs'("transInside", "And")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "And"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_894


.sub 'Or' :subid('WSubId_895') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_896 = "WSubId_896"
.const 'Sub' WSubId_898 = "WSubId_898"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var xs: $P3
    null $P3
    newclosure $P4, WSubId_896
    newclosure $P5, WSubId_898
    .tailcall self.'_or'($P4, $P5)
# }

.end # Or


.sub '' :anon :subid('WSubId_896') :outer('WSubId_895')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_897 = "WSubId_897"
# Body
# {
    newclosure $P2, WSubId_897
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_896


.sub '' :anon :subid('WSubId_897') :outer('WSubId_896')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_1', $P2
    __ARG_2.'_apply'("end")
    __ARG_2.'_apply'("setHelped")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_897


.sub '' :anon :subid('WSubId_898') :outer('WSubId_895')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_899 = "WSubId_899"
# Body
# {
    newclosure $P2, WSubId_899
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_898


.sub '' :anon :subid('WSubId_899') :outer('WSubId_898')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_4.'_applyWithArgs'("transInside", "Or")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Or"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_899


.sub 'XOr' :subid('WSubId_900') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_901 = "WSubId_901"
.const 'Sub' WSubId_903 = "WSubId_903"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var xs: $P3
    null $P3
    newclosure $P4, WSubId_901
    newclosure $P5, WSubId_903
    .tailcall self.'_or'($P4, $P5)
# }

.end # XOr


.sub '' :anon :subid('WSubId_901') :outer('WSubId_900')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_902 = "WSubId_902"
# Body
# {
    newclosure $P2, WSubId_902
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_901


.sub '' :anon :subid('WSubId_902') :outer('WSubId_901')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_1', $P2
    __ARG_2.'_apply'("end")
    __ARG_2.'_apply'("setHelped")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_902


.sub '' :anon :subid('WSubId_903') :outer('WSubId_900')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_904 = "WSubId_904"
# Body
# {
    newclosure $P2, WSubId_904
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_903


.sub '' :anon :subid('WSubId_904') :outer('WSubId_903')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_4.'_applyWithArgs'("transInside", "XOr")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "XOr"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_904


.sub 'transInside' :subid('WSubId_905') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_906 = "WSubId_906"
# Body
# {
# var fromIdx: $P1
    getattribute $P6, self, 'input'
    getattribute $P1, $P6, 'idx'
# var t: $P2
    null $P2
# var xs: $P3
    null $P3
# var ys: $P4
    null $P4
# var x: $P5
    null $P5
    newclosure $P6, WSubId_906
    .tailcall $P6(self)
# }

.end # transInside


.sub '' :anon :subid('WSubId_906') :outer('WSubId_905')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_4'
.const 'Sub' WSubId_907 = "WSubId_907"
.const 'Sub' WSubId_911 = "WSubId_911"
.const 'Sub' WSubId_913 = "WSubId_913"
# Body
# {
    $P5 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P5
    newclosure $P5, WSubId_907
    newclosure $P6, WSubId_911
    set $P7, WSubId_913
    .tailcall __ARG_1.'_or'($P5, $P6, $P7)
# }

.end # WSubId_906


.sub '' :anon :subid('WSubId_907') :outer('WSubId_906')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_908 = "WSubId_908"
# Body
# {
    newclosure $P4, WSubId_908
    .tailcall $P4(__ARG_2)
# }

.end # WSubId_907


.sub '' :anon :subid('WSubId_908') :outer('WSubId_907')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_909 = "WSubId_909"
# Body
# {
    newclosure $P4, WSubId_909
    __ARG_3.'_form'($P4)
    find_lex $P5, '__WLEX_1'
    $P4 = __ARG_3.'_applyWithArgs'("transInside", $P5)
store_lex '__WLEX_3', $P4
    __ARG_3.'_apply'("setHelped")
    find_lex $P4, '__WLEX_2'
    find_lex $P5, '__WLEX_3'
    .tailcall $P4.'append'($P5)
# }

.end # WSubId_908


.sub '' :anon :subid('WSubId_909') :outer('WSubId_908')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_910 = "WSubId_910"
# Body
# {
    newclosure $P3, WSubId_910
    .tailcall $P3(__ARG_4)
# }

.end # WSubId_909


.sub '' :anon :subid('WSubId_910') :outer('WSubId_909')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    find_lex $P3, '__WLEX_1'
    __ARG_5.'_applyWithArgs'("exactly", $P3)
    find_lex $P4, '__WLEX_1'
    $P3 = __ARG_5.'_applyWithArgs'("transInside", $P4)
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_910


.sub '' :anon :subid('WSubId_911') :outer('WSubId_906')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_1'
.const 'Sub' WSubId_912 = "WSubId_912"
# Body
# {
    newclosure $P4, WSubId_912
    .tailcall $P4(__ARG_6)
# }

.end # WSubId_911


.sub '' :anon :subid('WSubId_912') :outer('WSubId_911')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_1'
# Body
# {
    $P4 = __ARG_7.'_apply'("trans")
store_lex '__WLEX_4', $P4
    find_lex $P5, '__WLEX_1'
    $P4 = __ARG_7.'_applyWithArgs'("transInside", $P5)
store_lex '__WLEX_2', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    find_lex $P6, '__WLEX_4'
    push $P4, $P6
    find_lex $P7, '__WLEX_2'
    .tailcall $P4.'append'($P7)
# }

.end # WSubId_912


.sub '' :anon :subid('WSubId_913') :outer('WSubId_906')
        .param pmc __ARG_8
# Body
# {
    root_new $P1, ['parrot';'ResizablePMCArray']
    .return($P1)
# }

.end # WSubId_913

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'AssociativeOptimization' ]
    get_class $P1, [ 'NullOptimization' ]
    addparent $P0, $P1
.end
.namespace [ 'SeqInliner' ]

.sub 'App' :subid('WSubId_914') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_915 = "WSubId_915"
.const 'Sub' WSubId_918 = "WSubId_918"
# Body
# {
# var fromIdx: $P1
    getattribute $P6, self, 'input'
    getattribute $P1, $P6, 'idx'
# var s: $P2
    null $P2
# var cs: $P3
    null $P3
# var rule: $P4
    null $P4
# var args: $P5
    null $P5
    newclosure $P6, WSubId_915
    newclosure $P7, WSubId_918
    .tailcall self.'_or'($P6, $P7)
# }

.end # App


.sub '' :anon :subid('WSubId_915') :outer('WSubId_914')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_916 = "WSubId_916"
# Body
# {
    newclosure $P3, WSubId_916
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_915


.sub '' :anon :subid('WSubId_916') :outer('WSubId_915')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_917 = "WSubId_917"
# Body
# {
# switch
    $P3 = __ARG_2.'_apply'('anything')
    set $S1, $P3
    set $S2, "seq"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P4, WSubId_917
    .tailcall $P4(__ARG_2)
  __label_2: # default
    $P5 = __ARG_2.'_fail'()
    throw $P5
  __label_1: # switch end
# }

.end # WSubId_916


.sub '' :anon :subid('WSubId_917') :outer('WSubId_916')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P3
    __ARG_3.'_apply'("end")
    find_lex $P4, '__WLEX_1'
    $P3 = __ARG_3.'_applyWithArgs'("seqString", $P4)
store_lex '__WLEX_2', $P3
    __ARG_3.'_apply'("setHelped")
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "And"
    push $P4, $P5
    find_lex $P6, '__WLEX_2'
    $P3 = $P4.'append'($P6)
    root_new $P7, ['parrot';'ResizablePMCArray']
    root_new $P9, ['parrot';'ResizablePMCArray']
    box $P10, "Act"
    push $P9, $P10
    find_lex $P11, '__WLEX_1'
    push $P9, $P11
    push $P7, $P9
    .tailcall $P3.'append'($P7)
# }

.end # WSubId_917


.sub '' :anon :subid('WSubId_918') :outer('WSubId_914')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_4'
.const 'Sub' WSubId_919 = "WSubId_919"
# Body
# {
    newclosure $P3, WSubId_919
    .tailcall $P3(__ARG_4)
# }

.end # WSubId_918


.sub '' :anon :subid('WSubId_919') :outer('WSubId_918')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_4'
.const 'Sub' WSubId_920 = "WSubId_920"
# Body
# {
    $P3 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_3', $P3
    set $P4, WSubId_920
    $P3 = __ARG_5.'_many'($P4)
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "App"
    push $P3, $P4
    find_lex $P5, '__WLEX_3'
    push $P3, $P5
    find_lex $P6, '__WLEX_4'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_919


.sub '' :anon :subid('WSubId_920') :outer('WSubId_919')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("anything")
# }

.end # WSubId_920


.sub 'inlineChar' :subid('WSubId_921') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_922 = "WSubId_922"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var c: $P2
    null $P2
    newclosure $P3, WSubId_922
    .tailcall $P3(self)
# }

.end # inlineChar


.sub '' :anon :subid('WSubId_922') :outer('WSubId_921')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_923 = "WSubId_923"
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    $P2 = __ARG_1.'_applyWithArgs'("foreign", 'OMetaParser', 'eChar')
store_lex '__WLEX_1', $P2
    set $P2, WSubId_923
    __ARG_1.'_not'($P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "App"
    push $P2, $P3
    box $P3, "exactly"
    push $P2, $P3
    find_lex $P5, '__WLEX_1'
    $P4 = WSubId_995($P5)
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_922


.sub '' :anon :subid('WSubId_923') :outer('WSubId_922')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("end")
# }

.end # WSubId_923


.sub 'seqString' :subid('WSubId_924') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_925 = "WSubId_925"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var s: $P2
    null $P2
# var cs: $P3
    null $P3
    newclosure $P4, WSubId_925
    .tailcall $P4(self)
# }

.end # seqString


.sub '' :anon :subid('WSubId_925') :outer('WSubId_924')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_926 = "WSubId_926"
.const 'Sub' WSubId_928 = "WSubId_928"
.const 'Sub' WSubId_933 = "WSubId_933"
# Body
# {
    newclosure $P3, WSubId_926
    __ARG_1.'_lookahead'($P3)
    newclosure $P3, WSubId_928
    newclosure $P4, WSubId_933
    .tailcall __ARG_1.'_or'($P3, $P4)
# }

.end # WSubId_925


.sub '' :anon :subid('WSubId_926') :outer('WSubId_925')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_927 = "WSubId_927"
# Body
# {
    newclosure $P2, WSubId_927
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_926


.sub '' :anon :subid('WSubId_927') :outer('WSubId_926')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    isa $I1, $P2, "String"
    .tailcall __ARG_3.'_pred'($I1)
# }

.end # WSubId_927


.sub '' :anon :subid('WSubId_928') :outer('WSubId_925')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_929 = "WSubId_929"
# Body
# {
    newclosure $P2, WSubId_929
    .tailcall $P2(__ARG_4)
# }

.end # WSubId_928


.sub '' :anon :subid('WSubId_929') :outer('WSubId_928')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_930 = "WSubId_930"
# Body
# {
    newclosure $P2, WSubId_930
    __ARG_5.'_form'($P2)
    find_lex $P2, '__WLEX_2'
    .return($P2)
# }

.end # WSubId_929


.sub '' :anon :subid('WSubId_930') :outer('WSubId_929')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_931 = "WSubId_931"
# Body
# {
    newclosure $P2, WSubId_931
    .tailcall $P2(__ARG_6)
# }

.end # WSubId_930


.sub '' :anon :subid('WSubId_931') :outer('WSubId_930')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_932 = "WSubId_932"
# Body
# {
    __ARG_7.'_applyWithArgs'("exactly", "\"")
    set $P3, WSubId_932
    $P2 = __ARG_7.'_many'($P3)
store_lex '__WLEX_2', $P2
    .tailcall __ARG_7.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_931


.sub '' :anon :subid('WSubId_932') :outer('WSubId_931')
        .param pmc __ARG_8
# Body
# {
    .tailcall __ARG_8.'_apply'("inlineChar")
# }

.end # WSubId_932


.sub '' :anon :subid('WSubId_933') :outer('WSubId_925')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_934 = "WSubId_934"
# Body
# {
    newclosure $P2, WSubId_934
    .tailcall $P2(__ARG_9)
# }

.end # WSubId_933


.sub '' :anon :subid('WSubId_934') :outer('WSubId_933')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_935 = "WSubId_935"
# Body
# {
    newclosure $P2, WSubId_935
    __ARG_10.'_form'($P2)
    find_lex $P2, '__WLEX_2'
    .return($P2)
# }

.end # WSubId_934


.sub '' :anon :subid('WSubId_935') :outer('WSubId_934')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_936 = "WSubId_936"
# Body
# {
    newclosure $P2, WSubId_936
    .tailcall $P2(__ARG_11)
# }

.end # WSubId_935


.sub '' :anon :subid('WSubId_936') :outer('WSubId_935')
        .param pmc __ARG_12
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_937 = "WSubId_937"
# Body
# {
    __ARG_12.'_applyWithArgs'("exactly", "'")
    set $P3, WSubId_937
    $P2 = __ARG_12.'_many'($P3)
store_lex '__WLEX_2', $P2
    .tailcall __ARG_12.'_applyWithArgs'("exactly", "'")
# }

.end # WSubId_936


.sub '' :anon :subid('WSubId_937') :outer('WSubId_936')
        .param pmc __ARG_13
# Body
# {
    .tailcall __ARG_13.'_apply'("inlineChar")
# }

.end # WSubId_937

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SeqInliner' ]
    get_class $P1, [ 'NullOptimization' ]
    addparent $P0, $P1
.end
.namespace [ 'JumpTableOptimization' ]

.sub 'Or' :subid('WSubId_938') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_939 = "WSubId_939"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var cs: $P2
    null $P2
    newclosure $P3, WSubId_939
    .tailcall $P3(self)
# }

.end # Or


.sub '' :anon :subid('WSubId_939') :outer('WSubId_938')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_940 = "WSubId_940"
# Body
# {
    set $P3, WSubId_940
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Or"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_939


.sub '' :anon :subid('WSubId_940') :outer('WSubId_939')
        .param pmc __ARG_2
.const 'Sub' WSubId_941 = "WSubId_941"
.const 'Sub' WSubId_942 = "WSubId_942"
# Body
# {
    set $P1, WSubId_941
    set $P2, WSubId_942
    .tailcall __ARG_2.'_or'($P1, $P2)
# }

.end # WSubId_940


.sub '' :anon :subid('WSubId_941') :outer('WSubId_940')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("jtChoices", "Or")
# }

.end # WSubId_941


.sub '' :anon :subid('WSubId_942') :outer('WSubId_940')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("trans")
# }

.end # WSubId_942


.sub 'XOr' :subid('WSubId_943') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_944 = "WSubId_944"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var cs: $P2
    null $P2
    newclosure $P3, WSubId_944
    .tailcall $P3(self)
# }

.end # XOr


.sub '' :anon :subid('WSubId_944') :outer('WSubId_943')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_945 = "WSubId_945"
# Body
# {
    set $P3, WSubId_945
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "XOr"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_944


.sub '' :anon :subid('WSubId_945') :outer('WSubId_944')
        .param pmc __ARG_2
.const 'Sub' WSubId_946 = "WSubId_946"
.const 'Sub' WSubId_947 = "WSubId_947"
# Body
# {
    set $P1, WSubId_946
    set $P2, WSubId_947
    .tailcall __ARG_2.'_or'($P1, $P2)
# }

.end # WSubId_945


.sub '' :anon :subid('WSubId_946') :outer('WSubId_945')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("jtChoices", "XOr")
# }

.end # WSubId_946


.sub '' :anon :subid('WSubId_947') :outer('WSubId_945')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("trans")
# }

.end # WSubId_947


.sub 'quotedString' :subid('WSubId_948') :method
.lex '__WLEX_1', $P3
.lex '__WLEX_2', $P2
.const 'Sub' WSubId_949 = "WSubId_949"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var c: $P2
    null $P2
# var cs: $P3
    null $P3
    newclosure $P4, WSubId_949
    .tailcall $P4(self)
# }

.end # quotedString


.sub '' :anon :subid('WSubId_949') :outer('WSubId_948')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_950 = "WSubId_950"
.const 'Sub' WSubId_951 = "WSubId_951"
# Body
# {
    set $P3, WSubId_950
    __ARG_1.'_lookahead'($P3)
    newclosure $P3, WSubId_951
    __ARG_1.'_form'($P3)
    find_lex $P3, '__WLEX_1'
# predefined join
    join $S1, "", $P3
    .return($S1)
# }

.end # WSubId_949


.sub '' :anon :subid('WSubId_950') :outer('WSubId_949')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("string")
# }

.end # WSubId_950


.sub '' :anon :subid('WSubId_951') :outer('WSubId_949')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_952 = "WSubId_952"
# Body
# {
    newclosure $P3, WSubId_952
    .tailcall $P3(__ARG_3)
# }

.end # WSubId_951


.sub '' :anon :subid('WSubId_952') :outer('WSubId_951')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_953 = "WSubId_953"
.const 'Sub' WSubId_957 = "WSubId_957"
# Body
# {
# switch
    $P3 = __ARG_4.'_apply'('anything')
    set $S1, $P3
    set $S2, "\""
    if $S1 == $S2 goto __label_3
    set $S2, "'"
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
    newclosure $P4, WSubId_953
    .tailcall $P4(__ARG_4)
  __label_4: # case
    newclosure $P5, WSubId_957
    .tailcall $P5(__ARG_4)
  __label_2: # default
    $P6 = __ARG_4.'_fail'()
    throw $P6
  __label_1: # switch end
# }

.end # WSubId_952


.sub '' :anon :subid('WSubId_953') :outer('WSubId_952')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_954 = "WSubId_954"
# Body
# {
    newclosure $P4, WSubId_954
    $P3 = __ARG_5.'_many'($P4)
store_lex '__WLEX_1', $P3
    .tailcall __ARG_5.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_953


.sub '' :anon :subid('WSubId_954') :outer('WSubId_953')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_955 = "WSubId_955"
# Body
# {
    newclosure $P2, WSubId_955
    .tailcall $P2(__ARG_6)
# }

.end # WSubId_954


.sub '' :anon :subid('WSubId_955') :outer('WSubId_954')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_956 = "WSubId_956"
# Body
# {
    $P2 = __ARG_7.'_applyWithArgs'("foreign", 'OMetaParser', 'eChar')
store_lex '__WLEX_2', $P2
    set $P2, WSubId_956
    __ARG_7.'_not'($P2)
    find_lex $P2, '__WLEX_2'
    .return($P2)
# }

.end # WSubId_955


.sub '' :anon :subid('WSubId_956') :outer('WSubId_955')
        .param pmc __ARG_8
# Body
# {
    .tailcall __ARG_8.'_apply'("end")
# }

.end # WSubId_956


.sub '' :anon :subid('WSubId_957') :outer('WSubId_952')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_958 = "WSubId_958"
# Body
# {
    newclosure $P4, WSubId_958
    $P3 = __ARG_9.'_many'($P4)
store_lex '__WLEX_1', $P3
    .tailcall __ARG_9.'_applyWithArgs'("exactly", "'")
# }

.end # WSubId_957


.sub '' :anon :subid('WSubId_958') :outer('WSubId_957')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_959 = "WSubId_959"
# Body
# {
    newclosure $P2, WSubId_959
    .tailcall $P2(__ARG_10)
# }

.end # WSubId_958


.sub '' :anon :subid('WSubId_959') :outer('WSubId_958')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_960 = "WSubId_960"
# Body
# {
    $P2 = __ARG_11.'_applyWithArgs'("foreign", 'OMetaParser', 'eChar')
store_lex '__WLEX_2', $P2
    set $P2, WSubId_960
    __ARG_11.'_not'($P2)
    find_lex $P2, '__WLEX_2'
    .return($P2)
# }

.end # WSubId_959


.sub '' :anon :subid('WSubId_960') :outer('WSubId_959')
        .param pmc __ARG_12
# Body
# {
    .tailcall __ARG_12.'_apply'("end")
# }

.end # WSubId_960


.sub 'jtChoice' :subid('WSubId_961') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_962 = "WSubId_962"
.const 'Sub' WSubId_969 = "WSubId_969"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var rest: $P3
    null $P3
    newclosure $P4, WSubId_962
    newclosure $P5, WSubId_969
    .tailcall self.'_or'($P4, $P5)
# }

.end # jtChoice


.sub '' :anon :subid('WSubId_962') :outer('WSubId_961')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_963 = "WSubId_963"
# Body
# {
    newclosure $P3, WSubId_963
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_962


.sub '' :anon :subid('WSubId_963') :outer('WSubId_962')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_964 = "WSubId_964"
# Body
# {
    newclosure $P3, WSubId_964
    __ARG_2.'_form'($P3)
    root_new $P3, ['parrot';'ResizablePMCArray']
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    root_new $P7, ['parrot';'ResizablePMCArray']
    box $P8, "And"
    push $P7, $P8
    find_lex $P9, '__WLEX_2'
    $P6 = $P7.'append'($P9)
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_963


.sub '' :anon :subid('WSubId_964') :outer('WSubId_963')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_965 = "WSubId_965"
# Body
# {
    newclosure $P3, WSubId_965
    .tailcall $P3(__ARG_3)
# }

.end # WSubId_964


.sub '' :anon :subid('WSubId_965') :outer('WSubId_964')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_966 = "WSubId_966"
.const 'Sub' WSubId_968 = "WSubId_968"
# Body
# {
    __ARG_4.'_applyWithArgs'("exactly", "And")
    newclosure $P3, WSubId_966
    __ARG_4.'_form'($P3)
    set $P4, WSubId_968
    $P3 = __ARG_4.'_many'($P4)
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_965


.sub '' :anon :subid('WSubId_966') :outer('WSubId_965')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_967 = "WSubId_967"
# Body
# {
    newclosure $P2, WSubId_967
    .tailcall $P2(__ARG_5)
# }

.end # WSubId_966


.sub '' :anon :subid('WSubId_967') :outer('WSubId_966')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_6.'_applyWithArgs'("exactly", "App")
    __ARG_6.'_applyWithArgs'("exactly", "exactly")
    $P2 = __ARG_6.'_apply'("quotedString")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_967


.sub '' :anon :subid('WSubId_968') :outer('WSubId_965')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("anything")
# }

.end # WSubId_968


.sub '' :anon :subid('WSubId_969') :outer('WSubId_961')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_970 = "WSubId_970"
# Body
# {
    newclosure $P2, WSubId_970
    .tailcall $P2(__ARG_8)
# }

.end # WSubId_969


.sub '' :anon :subid('WSubId_970') :outer('WSubId_969')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_971 = "WSubId_971"
.const 'Sub' WSubId_995 = "WSubId_995"
# Body
# {
    newclosure $P2, WSubId_971
    __ARG_9.'_form'($P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    box $P6, "Act"
    push $P5, $P6
    find_lex $P8, '__WLEX_1'
    $P7 = WSubId_995($P8)
    push $P5, $P7
    push $P2, $P5
    .return($P2)
# }

.end # WSubId_970


.sub '' :anon :subid('WSubId_971') :outer('WSubId_970')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_972 = "WSubId_972"
# Body
# {
    newclosure $P2, WSubId_972
    .tailcall $P2(__ARG_10)
# }

.end # WSubId_971


.sub '' :anon :subid('WSubId_972') :outer('WSubId_971')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_11.'_applyWithArgs'("exactly", "App")
    __ARG_11.'_applyWithArgs'("exactly", "exactly")
    $P2 = __ARG_11.'_apply'("quotedString")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_972


.sub 'jtChoices' :subid('WSubId_973') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_974 = "WSubId_974"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var op: $P2
    null $P2
# var c: $P3
    null $P3
# var jt: $P4
    null $P4
    newclosure $P5, WSubId_974
    .tailcall $P5(self)
# }

.end # jtChoices


.sub '' :anon :subid('WSubId_974') :outer('WSubId_973')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_975 = "WSubId_975"
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("jtChoice")
store_lex '__WLEX_2', $P4
    root_new $P5, ['parrot';'Hash']
    find_lex $P7, '__WLEX_1'
    $P5["choiceOp"] = $P7
    find_lex $P9, '__WLEX_2'
    $P5["choice"] = $P9
    new $P4, [ "JumpTable" ], $P5
store_lex '__WLEX_3', $P4
    newclosure $P4, WSubId_975
    __ARG_1.'_many'($P4)
    __ARG_1.'_apply'("setHelped")
    find_lex $P4, '__WLEX_3'
    .tailcall $P4.'toTree'()
# }

.end # WSubId_974


.sub '' :anon :subid('WSubId_975') :outer('WSubId_974')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_976 = "WSubId_976"
# Body
# {
    newclosure $P3, WSubId_976
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_975


.sub '' :anon :subid('WSubId_976') :outer('WSubId_975')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
# Body
# {
    $P3 = __ARG_3.'_apply'("jtChoice")
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_2'
    .tailcall $P3.'add'($P4)
# }

.end # WSubId_976

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'JumpTableOptimization' ]
    get_class $P1, [ 'NullOptimization' ]
    addparent $P0, $P1
.end
.namespace [ 'OMetaOptimizer' ]

.sub 'optimizeGrammar' :subid('WSubId_977') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_978 = "WSubId_978"
# Body
# {
# var fromIdx: $P1
    getattribute $P5, self, 'input'
    getattribute $P1, $P5, 'idx'
# var n: $P2
    null $P2
# var sn: $P3
    null $P3
# var rs: $P4
    null $P4
    newclosure $P5, WSubId_978
    .tailcall $P5(self)
# }

.end # optimizeGrammar


.sub '' :anon :subid('WSubId_978') :outer('WSubId_977')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_979 = "WSubId_979"
# Body
# {
    newclosure $P4, WSubId_979
    __ARG_1.'_form'($P4)
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "Grammar"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    push $P4, $P6
    find_lex $P7, '__WLEX_2'
    push $P4, $P7
    find_lex $P8, '__WLEX_3'
    .tailcall $P4.'append'($P8)
# }

.end # WSubId_978


.sub '' :anon :subid('WSubId_979') :outer('WSubId_978')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_980 = "WSubId_980"
# Body
# {
    newclosure $P4, WSubId_980
    .tailcall $P4(__ARG_2)
# }

.end # WSubId_979


.sub '' :anon :subid('WSubId_980') :outer('WSubId_979')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_981 = "WSubId_981"
# Body
# {
    __ARG_3.'_applyWithArgs'("exactly", "Grammar")
    $P4 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_2', $P4
    set $P5, WSubId_981
    $P4 = __ARG_3.'_many'($P5)
store_lex '__WLEX_3', $P4
    .return(0)
# }

.end # WSubId_980


.sub '' :anon :subid('WSubId_981') :outer('WSubId_980')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("optimizeRule")
# }

.end # WSubId_981


.sub 'optimizeRule' :subid('WSubId_982') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_983 = "WSubId_983"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_983
    .tailcall $P3(self)
# }

.end # optimizeRule


.sub '' :anon :subid('WSubId_983') :outer('WSubId_982')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_984 = "WSubId_984"
.const 'Sub' WSubId_985 = "WSubId_985"
.const 'Sub' WSubId_986 = "WSubId_986"
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    newclosure $P2, WSubId_984
    set $P3, WSubId_985
    __ARG_1.'_or'($P2, $P3)
    newclosure $P2, WSubId_986
    __ARG_1.'_many'($P2)
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_983


.sub '' :anon :subid('WSubId_984') :outer('WSubId_983')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    find_lex $P3, '__WLEX_1'
    $P2 = __ARG_2.'_applyWithArgs'("foreign", 'SeqInliner', 'optimize', $P3)
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_984


.sub '' :anon :subid('WSubId_985') :outer('WSubId_983')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("empty")
# }

.end # WSubId_985


.sub '' :anon :subid('WSubId_986') :outer('WSubId_983')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_987 = "WSubId_987"
.const 'Sub' WSubId_988 = "WSubId_988"
# Body
# {
    newclosure $P2, WSubId_987
    newclosure $P3, WSubId_988
    .tailcall __ARG_4.'_or'($P2, $P3)
# }

.end # WSubId_986


.sub '' :anon :subid('WSubId_987') :outer('WSubId_986')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
# Body
# {
    find_lex $P3, '__WLEX_1'
    $P2 = __ARG_5.'_applyWithArgs'("foreign", 'AssociativeOptimization', 'optimize', $P3)
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_987


.sub '' :anon :subid('WSubId_988') :outer('WSubId_986')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
# Body
# {
    find_lex $P3, '__WLEX_1'
    $P2 = __ARG_6.'_applyWithArgs'("foreign", 'JumpTableOptimization', 'optimize', $P3)
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_988

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMetaOptimizer' ]
    get_class $P1, [ 'OMeta' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'keywords_hash' :anon :immediate
# Body
# {
.annotate 'line', 84
# var keywords: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P3, "break"
    push $P1, $P3
    box $P3, "case"
    push $P1, $P3
    box $P3, "catch"
    push $P1, $P3
    box $P3, "continue"
    push $P1, $P3
    box $P3, "default"
    push $P1, $P3
    box $P3, "do"
    push $P1, $P3
    box $P3, "else"
    push $P1, $P3
    box $P3, "for"
    push $P1, $P3
    box $P3, "function"
    push $P1, $P3
    box $P3, "if"
    push $P1, $P3
    box $P3, "in"
    push $P1, $P3
    box $P3, "instanceof"
    push $P1, $P3
    box $P3, "new"
    push $P1, $P3
    box $P3, "return"
    push $P1, $P3
    box $P3, "switch"
    push $P1, $P3
    box $P3, "self"
    push $P1, $P3
    box $P3, "throw"
    push $P1, $P3
    box $P3, "try"
    push $P1, $P3
    box $P3, "var"
    push $P1, $P3
    box $P3, "while"
    push $P1, $P3
    box $P3, "ometa"
    push $P1, $P3
    box $P3, "class"
    push $P1, $P3
    box $P3, "using"
    push $P1, $P3
    box $P3, "extern"
    push $P1, $P3
    box $P3, "static"
    push $P1, $P3
    box $P3, "string"
    push $P1, $P3
    box $P3, "int"
    push $P1, $P3
    box $P3, "num"
    push $P1, $P3
.annotate 'line', 88
# var hsh: $P2
    root_new $P2, ['parrot';'Hash']
.annotate 'line', 89
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
.annotate 'line', 90
    $P2[$S1] = $S1
    goto __label_1
  __label_2: # endfor
.annotate 'line', 92
    .return($P2)
# }
.annotate 'line', 93

.end # keywords_hash


.sub '_isKeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 97
.const 'Sub' WSubId_989 = 'keywords_hash'
.annotate 'line', 98
    $P1 = WSubId_989[__ARG_1]
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $I1, 1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
    .return($I1)
# }
.annotate 'line', 99

.end # _isKeyword


.sub 'load' :anon :load :multi()
# Body
# {
.annotate 'line', 102
.const 'Sub' WSubId_990 = '_isKeyword'
# predefined get_class
.annotate 'line', 103
    get_class $P1, 'WinxedParser'
    $P1.'add_method'('_isKeyword', WSubId_990)
# }
.annotate 'line', 104

.end # load


.sub 'jumpTableCode' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 110
# var buf: $P1
    new $P1, ['StringBuilder']
.annotate 'line', 111
# pirop push
    push $P1, "(function(var self){switch(self._apply('anything')){"
.annotate 'line', 112
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
# {
.annotate 'line', 113
# s: $S1
# predefined string
    $S2 = $P2[0]
# predefined string
    $S3 = $P2[1]
    concat $S1, "case ", $S2
    concat $S1, $S1, ":return "
    concat $S1, $S1, $S3
    concat $S1, $S1, ";"
.annotate 'line', 114
# pirop push
    push $P1, $S1
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 116
# pirop push
    push $P1, "default: throw self._fail();}})(self)"
# predefined string
.annotate 'line', 117
    set $S2, $P1
    .return($S2)
# }
.annotate 'line', 118

.end # jumpTableCode


.sub 'load' :anon :load :multi()
# Body
# {
.annotate 'line', 121
.const 'Sub' WSubId_991 = 'jumpTableCode'
# predefined get_class
.annotate 'line', 122
    get_class $P1, 'OMetaTranslator'
    $P1.'add_method'('jumpTableCode', WSubId_991)
# }
.annotate 'line', 123

.end # load


.sub 'nullopt_init_pmc' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 130
# var x: $P1
    box $P1, 0
.annotate 'line', 131
    self['_didSomething'] = $P1
# }
.annotate 'line', 132

.end # nullopt_init_pmc


.sub 'load' :anon :load :multi()
# Body
# {
.annotate 'line', 135
.const 'Sub' WSubId_992 = 'nullopt_init_pmc'
# predefined get_class
.annotate 'line', 136
    get_class $P1, 'NullOptimization'
    $P1.'add_vtable_override'('init_pmc', WSubId_992)
# }
.annotate 'line', 137

.end # load

# End generated code
