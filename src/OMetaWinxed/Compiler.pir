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


.sub 'escapeChar' :subid('WSubId_783')
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


.sub 'toProgramString' :subid('WSubId_785')
        .param string __ARG_1
.const 'Sub' WSubId_783 = "WSubId_783"
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
    $P4 = WSubId_783($S1)
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


.sub 'unescape' :subid('WSubId_784')
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
    __ARG_2.'_not'($P2)
    .tailcall __ARG_2.'_apply'("char")
# }

.end # WSubId_4


.sub '' :anon :subid('WSubId_5') :outer('WSubId_4')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
# Body
# {
    find_lex $P2, '__WLEX_2'
    .tailcall __ARG_3.'_applyWithArgs'("seq", $P2)
# }

.end # WSubId_5


.sub 'space' :subid('WSubId_6') :method
.const 'Sub' WSubId_7 = "WSubId_7"
.const 'Sub' WSubId_8 = "WSubId_8"
.const 'Sub' WSubId_9 = "WSubId_9"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_7
    set $P3, WSubId_8
    set $P4, WSubId_9
    .tailcall self.'_or'($P2, $P3, $P4)
# }

.end # space


.sub '' :anon :subid('WSubId_7') :outer('WSubId_6')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_superApplyWithArgs'("Parser", 'space')
# }

.end # WSubId_7


.sub '' :anon :subid('WSubId_8') :outer('WSubId_6')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_applyWithArgs'("fromTo", "//", "\n")
# }

.end # WSubId_8


.sub '' :anon :subid('WSubId_9') :outer('WSubId_6')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("fromTo", "/*", "*/")
# }

.end # WSubId_9


.sub 'nameFirst' :subid('WSubId_10') :method
.const 'Sub' WSubId_11 = "WSubId_11"
.const 'Sub' WSubId_12 = "WSubId_12"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_11
    set $P3, WSubId_12
    .tailcall self.'_or'($P2, $P3)
# }

.end # nameFirst


.sub '' :anon :subid('WSubId_11') :outer('WSubId_10')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("letter")
# }

.end # WSubId_11


.sub '' :anon :subid('WSubId_12') :outer('WSubId_10')
        .param pmc __ARG_2
.const 'Sub' WSubId_13 = "WSubId_13"
# Body
# {
    set $P1, WSubId_13
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_12


.sub '' :anon :subid('WSubId_13') :outer('WSubId_12')
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

.end # WSubId_13


.sub 'nameRest' :subid('WSubId_14') :method
.const 'Sub' WSubId_15 = "WSubId_15"
.const 'Sub' WSubId_16 = "WSubId_16"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_15
    set $P3, WSubId_16
    .tailcall self.'_or'($P2, $P3)
# }

.end # nameRest


.sub '' :anon :subid('WSubId_15') :outer('WSubId_14')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("nameFirst")
# }

.end # WSubId_15


.sub '' :anon :subid('WSubId_16') :outer('WSubId_14')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("digit")
# }

.end # WSubId_16


.sub 'iName' :subid('WSubId_17') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_18 = "WSubId_18"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_18
    .tailcall $P3(self)
# }

.end # iName


.sub '' :anon :subid('WSubId_18') :outer('WSubId_17')
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

.end # WSubId_18


.sub 'isKeyword' :subid('WSubId_19') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_20 = "WSubId_20"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_20
    .tailcall $P3(self)
# }

.end # isKeyword


.sub '' :anon :subid('WSubId_20') :outer('WSubId_19')
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

.end # WSubId_20


.sub 'keyword' :subid('WSubId_21') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var k: $P2
    null $P2
    newclosure $P3, WSubId_22
    .tailcall $P3(self)
# }

.end # keyword


.sub '' :anon :subid('WSubId_22') :outer('WSubId_21')
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

.end # WSubId_22


.sub 'nameTok' :subid('WSubId_23') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_24 = "WSubId_24"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var n: $P2
    null $P2
    newclosure $P3, WSubId_24
    .tailcall $P3(self)
# }

.end # nameTok


.sub '' :anon :subid('WSubId_24') :outer('WSubId_23')
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

.end # WSubId_24


.sub 'hexDigit' :subid('WSubId_25') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_26 = "WSubId_26"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var v: $P3
    null $P3
    newclosure $P4, WSubId_26
    .tailcall $P4(self)
# }

.end # hexDigit


.sub '' :anon :subid('WSubId_26') :outer('WSubId_25')
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

.end # WSubId_26


.sub 'hexLit' :subid('WSubId_27') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_29 = "WSubId_29"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var n: $P2
    null $P2
# var d: $P3
    null $P3
    newclosure $P4, WSubId_28
    set $P5, WSubId_29
    .tailcall self.'_or'($P4, $P5)
# }

.end # hexLit


.sub '' :anon :subid('WSubId_28') :outer('WSubId_27')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("hexLit")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("hexDigit")
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

.end # WSubId_28


.sub '' :anon :subid('WSubId_29') :outer('WSubId_27')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("hexDigit")
# }

.end # WSubId_29


.sub 'number' :subid('WSubId_30') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_31 = "WSubId_31"
.const 'Sub' WSubId_34 = "WSubId_34"
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
    newclosure $P5, WSubId_31
    newclosure $P6, WSubId_34
    .tailcall self.'_or'($P5, $P6)
# }

.end # number


.sub '' :anon :subid('WSubId_31') :outer('WSubId_30')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_32 = "WSubId_32"
# Body
# {
    newclosure $P2, WSubId_32
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_31


.sub '' :anon :subid('WSubId_32') :outer('WSubId_31')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_33 = "WSubId_33"
# Body
# {
# switch
    $P2 = __ARG_2.'_apply'('anything')
    set $S1, $P2
    set $S2, "0"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_33
    .tailcall $P3(__ARG_2)
  __label_2: # default
    $P4 = __ARG_2.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_32


.sub '' :anon :subid('WSubId_33') :outer('WSubId_32')
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

.end # WSubId_33


.sub '' :anon :subid('WSubId_34') :outer('WSubId_30')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
    set $P4, WSubId_35
    $P3 = __ARG_4.'_many1'($P4)
store_lex '__WLEX_2', $P3
    set $P4, WSubId_36
    set $P5, WSubId_39
    $P3 = __ARG_4.'_or'($P4, $P5)
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

.end # WSubId_34


.sub '' :anon :subid('WSubId_35') :outer('WSubId_34')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("digit")
# }

.end # WSubId_35


.sub '' :anon :subid('WSubId_36') :outer('WSubId_34')
        .param pmc __ARG_6
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
    set $P1, WSubId_37
    .tailcall $P1(__ARG_6)
# }

.end # WSubId_36


.sub '' :anon :subid('WSubId_37') :outer('WSubId_36')
        .param pmc __ARG_7
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
# switch
    $P1 = __ARG_7.'_apply'('anything')
    set $S1, $P1
    set $S2, "."
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    set $P2, WSubId_38
    .tailcall __ARG_7.'_many1'($P2)
  __label_2: # default
    $P3 = __ARG_7.'_fail'()
    throw $P3
  __label_1: # switch end
# }

.end # WSubId_37


.sub '' :anon :subid('WSubId_38') :outer('WSubId_37')
        .param pmc __ARG_8
# Body
# {
    .tailcall __ARG_8.'_apply'("digit")
# }

.end # WSubId_38


.sub '' :anon :subid('WSubId_39') :outer('WSubId_34')
        .param pmc __ARG_9
# Body
# {
    __ARG_9.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    .return($P1)
# }

.end # WSubId_39


.sub 'escapeChar' :subid('WSubId_40') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var c: $P2
    null $P2
    newclosure $P3, WSubId_41
    .tailcall $P3(self)
# }

.end # escapeChar


.sub '' :anon :subid('WSubId_41') :outer('WSubId_40')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_784 = "WSubId_784"
# Body
# {
    __ARG_1.'_applyWithArgs'("exactly", "\\")
    $P2 = __ARG_1.'_apply'("char")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "\\", $S1
    .tailcall WSubId_784($S2)
# }

.end # WSubId_41


.sub 'str' :subid('WSubId_42') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var cs: $P2
    null $P2
# var n: $P3
    null $P3
    newclosure $P4, WSubId_43
    newclosure $P5, WSubId_62
    .tailcall self.'_or'($P4, $P5)
# }

.end # str


.sub '' :anon :subid('WSubId_43') :outer('WSubId_42')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
    newclosure $P2, WSubId_44
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_43


.sub '' :anon :subid('WSubId_44') :outer('WSubId_43')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_57 = "WSubId_57"
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
    newclosure $P3, WSubId_45
    newclosure $P4, WSubId_52
    .tailcall __ARG_2.'_or'($P3, $P4)
  __label_4: # case
    newclosure $P5, WSubId_57
    .tailcall $P5(__ARG_2)
  __label_2: # default
    $P6 = __ARG_2.'_fail'()
    throw $P6
  __label_1: # switch end
# }

.end # WSubId_44


.sub '' :anon :subid('WSubId_45') :outer('WSubId_44')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
    newclosure $P2, WSubId_46
    .tailcall $P2(__ARG_3)
# }

.end # WSubId_45


.sub '' :anon :subid('WSubId_46') :outer('WSubId_45')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_47 = "WSubId_47"
# Body
# {
# switch
    $P2 = __ARG_4.'_apply'('anything')
    set $S1, $P2
    set $S2, "\""
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_47
    .tailcall $P3(__ARG_4)
  __label_2: # default
    $P4 = __ARG_4.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_46


.sub '' :anon :subid('WSubId_47') :outer('WSubId_46')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_48 = "WSubId_48"
# Body
# {
    __ARG_5.'_applyWithArgs'("exactly", "\"")
    set $P3, WSubId_48
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

.end # WSubId_47


.sub '' :anon :subid('WSubId_48') :outer('WSubId_47')
        .param pmc __ARG_6
.const 'Sub' WSubId_49 = "WSubId_49"
.const 'Sub' WSubId_50 = "WSubId_50"
# Body
# {
    set $P1, WSubId_49
    set $P2, WSubId_50
    .tailcall __ARG_6.'_or'($P1, $P2)
# }

.end # WSubId_48


.sub '' :anon :subid('WSubId_49') :outer('WSubId_48')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("escapeChar")
# }

.end # WSubId_49


.sub '' :anon :subid('WSubId_50') :outer('WSubId_48')
        .param pmc __ARG_8
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
    set $P1, WSubId_51
    __ARG_8.'_not'($P1)
    .tailcall __ARG_8.'_apply'("char")
# }

.end # WSubId_50


.sub '' :anon :subid('WSubId_51') :outer('WSubId_50')
        .param pmc __ARG_9
# Body
# {
    __ARG_9.'_applyWithArgs'("exactly", "\"")
    __ARG_9.'_applyWithArgs'("exactly", "\"")
    __ARG_9.'_applyWithArgs'("exactly", "\"")
    .return("\"\"\"")
# }

.end # WSubId_51


.sub '' :anon :subid('WSubId_52') :outer('WSubId_44')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
    set $P3, WSubId_53
    $P2 = __ARG_10.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_10.'_applyWithArgs'("exactly", "\"")
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

.end # WSubId_52


.sub '' :anon :subid('WSubId_53') :outer('WSubId_52')
        .param pmc __ARG_11
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
    set $P1, WSubId_54
    set $P2, WSubId_55
    .tailcall __ARG_11.'_or'($P1, $P2)
# }

.end # WSubId_53


.sub '' :anon :subid('WSubId_54') :outer('WSubId_53')
        .param pmc __ARG_12
# Body
# {
    .tailcall __ARG_12.'_apply'("escapeChar")
# }

.end # WSubId_54


.sub '' :anon :subid('WSubId_55') :outer('WSubId_53')
        .param pmc __ARG_13
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
    set $P1, WSubId_56
    __ARG_13.'_not'($P1)
    .tailcall __ARG_13.'_apply'("char")
# }

.end # WSubId_55


.sub '' :anon :subid('WSubId_56') :outer('WSubId_55')
        .param pmc __ARG_14
# Body
# {
    .tailcall __ARG_14.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_56


.sub '' :anon :subid('WSubId_57') :outer('WSubId_44')
        .param pmc __ARG_15
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
    set $P3, WSubId_58
    $P2 = __ARG_15.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_15.'_applyWithArgs'("exactly", "'")
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

.end # WSubId_57


.sub '' :anon :subid('WSubId_58') :outer('WSubId_57')
        .param pmc __ARG_16
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
    set $P1, WSubId_59
    set $P2, WSubId_60
    .tailcall __ARG_16.'_or'($P1, $P2)
# }

.end # WSubId_58


.sub '' :anon :subid('WSubId_59') :outer('WSubId_58')
        .param pmc __ARG_17
# Body
# {
    .tailcall __ARG_17.'_apply'("escapeChar")
# }

.end # WSubId_59


.sub '' :anon :subid('WSubId_60') :outer('WSubId_58')
        .param pmc __ARG_18
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
    set $P1, WSubId_61
    __ARG_18.'_not'($P1)
    .tailcall __ARG_18.'_apply'("char")
# }

.end # WSubId_60


.sub '' :anon :subid('WSubId_61') :outer('WSubId_60')
        .param pmc __ARG_19
# Body
# {
    .tailcall __ARG_19.'_applyWithArgs'("exactly", "'")
# }

.end # WSubId_61


.sub '' :anon :subid('WSubId_62') :outer('WSubId_42')
        .param pmc __ARG_20
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
    set $P2, WSubId_63
    $P2(__ARG_20)
    $P2 = __ARG_20.'_apply'("iName")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "str"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_62


.sub '' :anon :subid('WSubId_63') :outer('WSubId_62')
        .param pmc __ARG_21
# Body
# {
# switch
    $P1 = __ARG_21.'_apply'('anything')
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
    $P2 = __ARG_21.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_63


.sub 'special' :subid('WSubId_64') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var s: $P2
    null $P2
    newclosure $P3, WSubId_65
    .tailcall $P3(self)
# }

.end # special


.sub '' :anon :subid('WSubId_65') :outer('WSubId_64')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
    set $P3, WSubId_66
    $P2 = $P3(__ARG_1)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    find_lex $P5, '__WLEX_1'
    push $P2, $P5
    .return($P2)
# }

.end # WSubId_65


.sub '' :anon :subid('WSubId_66') :outer('WSubId_65')
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_90 = "WSubId_90"
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_104 = "WSubId_104"
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
    set $P2, WSubId_67
    set $P3, WSubId_72
    .tailcall __ARG_2.'_or'($P2, $P3)
  __label_14: # case
    set $P4, WSubId_73
    set $P5, WSubId_78
    .tailcall __ARG_2.'_or'($P4, $P5)
  __label_15: # case
    set $P6, WSubId_79
    set $P7, WSubId_81
    .tailcall __ARG_2.'_or'($P6, $P7)
  __label_16: # case
    set $P8, WSubId_82
    set $P9, WSubId_84
    .tailcall __ARG_2.'_or'($P8, $P9)
  __label_17: # case
    set $P10, WSubId_85
    set $P11, WSubId_87
    .tailcall __ARG_2.'_or'($P10, $P11)
  __label_18: # case
    set $P12, WSubId_88
    set $P13, WSubId_90
    .tailcall __ARG_2.'_or'($P12, $P13)
  __label_19: # case
    set $P14, WSubId_91
    set $P15, WSubId_93
    .tailcall __ARG_2.'_or'($P14, $P15)
  __label_20: # case
    set $P16, WSubId_94
    set $P17, WSubId_96
    .tailcall __ARG_2.'_or'($P16, $P17)
  __label_21: # case
    set $P18, WSubId_97
    set $P19, WSubId_99
    .tailcall __ARG_2.'_or'($P18, $P19)
  __label_22: # case
    set $P20, WSubId_100
    .tailcall $P20(__ARG_2)
  __label_23: # case
    set $P21, WSubId_104
    .tailcall $P21(__ARG_2)
  __label_24: # case
    .return(".")
  __label_2: # default
    $P22 = __ARG_2.'_fail'()
    throw $P22
  __label_1: # switch end
# }

.end # WSubId_66


.sub '' :anon :subid('WSubId_67') :outer('WSubId_66')
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
    set $P1, WSubId_68
    .tailcall $P1(__ARG_3)
# }

.end # WSubId_67


.sub '' :anon :subid('WSubId_68') :outer('WSubId_67')
        .param pmc __ARG_4
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
# switch
    $P1 = __ARG_4.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    set $P2, WSubId_69
    set $P3, WSubId_71
    .tailcall __ARG_4.'_or'($P2, $P3)
  __label_2: # default
    $P4 = __ARG_4.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_68


.sub '' :anon :subid('WSubId_69') :outer('WSubId_68')
        .param pmc __ARG_5
.const 'Sub' WSubId_70 = "WSubId_70"
# Body
# {
    set $P1, WSubId_70
    .tailcall $P1(__ARG_5)
# }

.end # WSubId_69


.sub '' :anon :subid('WSubId_70') :outer('WSubId_69')
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

.end # WSubId_70


.sub '' :anon :subid('WSubId_71') :outer('WSubId_68')
        .param pmc __ARG_7
# Body
# {
    .return("!=")
# }

.end # WSubId_71


.sub '' :anon :subid('WSubId_72') :outer('WSubId_66')
        .param pmc __ARG_8
# Body
# {
    .return("!")
# }

.end # WSubId_72


.sub '' :anon :subid('WSubId_73') :outer('WSubId_66')
        .param pmc __ARG_9
.const 'Sub' WSubId_74 = "WSubId_74"
# Body
# {
    set $P1, WSubId_74
    .tailcall $P1(__ARG_9)
# }

.end # WSubId_73


.sub '' :anon :subid('WSubId_74') :outer('WSubId_73')
        .param pmc __ARG_10
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_77 = "WSubId_77"
# Body
# {
# switch
    $P1 = __ARG_10.'_apply'('anything')
    set $S1, $P1
    set $S2, "="
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    set $P2, WSubId_75
    set $P3, WSubId_77
    .tailcall __ARG_10.'_or'($P2, $P3)
  __label_2: # default
    $P4 = __ARG_10.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_74


.sub '' :anon :subid('WSubId_75') :outer('WSubId_74')
        .param pmc __ARG_11
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
    set $P1, WSubId_76
    .tailcall $P1(__ARG_11)
# }

.end # WSubId_75


.sub '' :anon :subid('WSubId_76') :outer('WSubId_75')
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

.end # WSubId_76


.sub '' :anon :subid('WSubId_77') :outer('WSubId_74')
        .param pmc __ARG_13
# Body
# {
    .return("==")
# }

.end # WSubId_77


.sub '' :anon :subid('WSubId_78') :outer('WSubId_66')
        .param pmc __ARG_14
# Body
# {
    .return("=")
# }

.end # WSubId_78


.sub '' :anon :subid('WSubId_79') :outer('WSubId_66')
        .param pmc __ARG_15
.const 'Sub' WSubId_80 = "WSubId_80"
# Body
# {
    set $P1, WSubId_80
    .tailcall $P1(__ARG_15)
# }

.end # WSubId_79


.sub '' :anon :subid('WSubId_80') :outer('WSubId_79')
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

.end # WSubId_80


.sub '' :anon :subid('WSubId_81') :outer('WSubId_66')
        .param pmc __ARG_17
# Body
# {
    .return(">")
# }

.end # WSubId_81


.sub '' :anon :subid('WSubId_82') :outer('WSubId_66')
        .param pmc __ARG_18
.const 'Sub' WSubId_83 = "WSubId_83"
# Body
# {
    set $P1, WSubId_83
    .tailcall $P1(__ARG_18)
# }

.end # WSubId_82


.sub '' :anon :subid('WSubId_83') :outer('WSubId_82')
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

.end # WSubId_83


.sub '' :anon :subid('WSubId_84') :outer('WSubId_66')
        .param pmc __ARG_20
# Body
# {
    .return("<")
# }

.end # WSubId_84


.sub '' :anon :subid('WSubId_85') :outer('WSubId_66')
        .param pmc __ARG_21
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
    set $P1, WSubId_86
    .tailcall $P1(__ARG_21)
# }

.end # WSubId_85


.sub '' :anon :subid('WSubId_86') :outer('WSubId_85')
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

.end # WSubId_86


.sub '' :anon :subid('WSubId_87') :outer('WSubId_66')
        .param pmc __ARG_23
# Body
# {
    .return("+")
# }

.end # WSubId_87


.sub '' :anon :subid('WSubId_88') :outer('WSubId_66')
        .param pmc __ARG_24
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
    set $P1, WSubId_89
    .tailcall $P1(__ARG_24)
# }

.end # WSubId_88


.sub '' :anon :subid('WSubId_89') :outer('WSubId_88')
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

.end # WSubId_89


.sub '' :anon :subid('WSubId_90') :outer('WSubId_66')
        .param pmc __ARG_26
# Body
# {
    .return("-")
# }

.end # WSubId_90


.sub '' :anon :subid('WSubId_91') :outer('WSubId_66')
        .param pmc __ARG_27
.const 'Sub' WSubId_92 = "WSubId_92"
# Body
# {
    set $P1, WSubId_92
    .tailcall $P1(__ARG_27)
# }

.end # WSubId_91


.sub '' :anon :subid('WSubId_92') :outer('WSubId_91')
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

.end # WSubId_92


.sub '' :anon :subid('WSubId_93') :outer('WSubId_66')
        .param pmc __ARG_29
# Body
# {
    .return("*")
# }

.end # WSubId_93


.sub '' :anon :subid('WSubId_94') :outer('WSubId_66')
        .param pmc __ARG_30
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
    set $P1, WSubId_95
    .tailcall $P1(__ARG_30)
# }

.end # WSubId_94


.sub '' :anon :subid('WSubId_95') :outer('WSubId_94')
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

.end # WSubId_95


.sub '' :anon :subid('WSubId_96') :outer('WSubId_66')
        .param pmc __ARG_32
# Body
# {
    .return("/")
# }

.end # WSubId_96


.sub '' :anon :subid('WSubId_97') :outer('WSubId_66')
        .param pmc __ARG_33
.const 'Sub' WSubId_98 = "WSubId_98"
# Body
# {
    set $P1, WSubId_98
    .tailcall $P1(__ARG_33)
# }

.end # WSubId_97


.sub '' :anon :subid('WSubId_98') :outer('WSubId_97')
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

.end # WSubId_98


.sub '' :anon :subid('WSubId_99') :outer('WSubId_66')
        .param pmc __ARG_35
# Body
# {
    .return("%")
# }

.end # WSubId_99


.sub '' :anon :subid('WSubId_100') :outer('WSubId_66')
        .param pmc __ARG_36
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_103 = "WSubId_103"
# Body
# {
# switch
    $P1 = __ARG_36.'_apply'('anything')
    set $S1, $P1
    set $S2, "&"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    set $P2, WSubId_101
    set $P3, WSubId_103
    .tailcall __ARG_36.'_or'($P2, $P3)
  __label_2: # default
    $P4 = __ARG_36.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_100


.sub '' :anon :subid('WSubId_101') :outer('WSubId_100')
        .param pmc __ARG_37
.const 'Sub' WSubId_102 = "WSubId_102"
# Body
# {
    set $P1, WSubId_102
    .tailcall $P1(__ARG_37)
# }

.end # WSubId_101


.sub '' :anon :subid('WSubId_102') :outer('WSubId_101')
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

.end # WSubId_102


.sub '' :anon :subid('WSubId_103') :outer('WSubId_100')
        .param pmc __ARG_39
# Body
# {
    .return("&&")
# }

.end # WSubId_103


.sub '' :anon :subid('WSubId_104') :outer('WSubId_66')
        .param pmc __ARG_40
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_107 = "WSubId_107"
# Body
# {
# switch
    $P1 = __ARG_40.'_apply'('anything')
    set $S1, $P1
    set $S2, "|"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    set $P2, WSubId_105
    set $P3, WSubId_107
    .tailcall __ARG_40.'_or'($P2, $P3)
  __label_2: # default
    $P4 = __ARG_40.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_104


.sub '' :anon :subid('WSubId_105') :outer('WSubId_104')
        .param pmc __ARG_41
.const 'Sub' WSubId_106 = "WSubId_106"
# Body
# {
    set $P1, WSubId_106
    .tailcall $P1(__ARG_41)
# }

.end # WSubId_105


.sub '' :anon :subid('WSubId_106') :outer('WSubId_105')
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

.end # WSubId_106


.sub '' :anon :subid('WSubId_107') :outer('WSubId_104')
        .param pmc __ARG_43
# Body
# {
    .return("||")
# }

.end # WSubId_107


.sub 'tok' :subid('WSubId_108') :method
.const 'Sub' WSubId_109 = "WSubId_109"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_109
    .tailcall $P2(self)
# }

.end # tok


.sub '' :anon :subid('WSubId_109') :outer('WSubId_108')
        .param pmc __ARG_1
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_114 = "WSubId_114"
# Body
# {
    __ARG_1.'_apply'("spaces")
    set $P1, WSubId_110
    set $P2, WSubId_111
    set $P3, WSubId_112
    set $P4, WSubId_113
    set $P5, WSubId_114
    .tailcall __ARG_1.'_or'($P1, $P2, $P3, $P4, $P5)
# }

.end # WSubId_109


.sub '' :anon :subid('WSubId_110') :outer('WSubId_109')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("keyword")
# }

.end # WSubId_110


.sub '' :anon :subid('WSubId_111') :outer('WSubId_109')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("nameTok")
# }

.end # WSubId_111


.sub '' :anon :subid('WSubId_112') :outer('WSubId_109')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("number")
# }

.end # WSubId_112


.sub '' :anon :subid('WSubId_113') :outer('WSubId_109')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("str")
# }

.end # WSubId_113


.sub '' :anon :subid('WSubId_114') :outer('WSubId_109')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("special")
# }

.end # WSubId_114


.sub 'toks' :subid('WSubId_115') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_116 = "WSubId_116"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var ts: $P2
    null $P2
    newclosure $P3, WSubId_116
    .tailcall $P3(self)
# }

.end # toks


.sub '' :anon :subid('WSubId_116') :outer('WSubId_115')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_117 = "WSubId_117"
# Body
# {
    set $P3, WSubId_117
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_1.'_apply'("spaces")
    __ARG_1.'_apply'("end")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_116


.sub '' :anon :subid('WSubId_117') :outer('WSubId_116')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("token")
# }

.end # WSubId_117


.sub 'token' :subid('WSubId_118') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_119 = "WSubId_119"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var tt: $P2
    null $P2
# var t: $P3
    null $P3
    newclosure $P4, WSubId_119
    .tailcall $P4(self)
# }

.end # token


.sub '' :anon :subid('WSubId_119') :outer('WSubId_118')
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

.end # WSubId_119


.sub 'name' :subid('WSubId_120') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_121 = "WSubId_121"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var t: $P2
    null $P2
    newclosure $P3, WSubId_121
    .tailcall $P3(self)
# }

.end # name


.sub '' :anon :subid('WSubId_121') :outer('WSubId_120')
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

.end # WSubId_121


.sub 'expr' :subid('WSubId_122') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_123 = "WSubId_123"
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
    newclosure $P6, WSubId_123
    .tailcall $P6(self)
# }

.end # expr


.sub '' :anon :subid('WSubId_123') :outer('WSubId_122')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_4'
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_125 = "WSubId_125"
.const 'Sub' WSubId_126 = "WSubId_126"
.const 'Sub' WSubId_127 = "WSubId_127"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_130 = "WSubId_130"
.const 'Sub' WSubId_131 = "WSubId_131"
.const 'Sub' WSubId_132 = "WSubId_132"
.const 'Sub' WSubId_133 = "WSubId_133"
# Body
# {
    $P5 = __ARG_1.'_apply'("orExpr")
store_lex '__WLEX_1', $P5
    newclosure $P5, WSubId_124
    newclosure $P6, WSubId_125
    newclosure $P7, WSubId_126
    newclosure $P8, WSubId_127
    newclosure $P9, WSubId_128
    newclosure $P10, WSubId_129
    newclosure $P11, WSubId_130
    newclosure $P12, WSubId_131
    newclosure $P13, WSubId_132
    newclosure $P14, WSubId_133
    .tailcall __ARG_1.'_or'($P5, $P6, $P7, $P8, $P9, $P10, $P11, $P12, $P13, $P14)
# }

.end # WSubId_123


.sub '' :anon :subid('WSubId_124') :outer('WSubId_123')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "?")
    $P4 = __ARG_2.'_apply'("expr")
store_lex '__WLEX_2', $P4
    __ARG_2.'_applyWithArgs'("token", ":")
    $P4 = __ARG_2.'_apply'("expr")
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

.end # WSubId_124


.sub '' :anon :subid('WSubId_125') :outer('WSubId_123')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "=")
    $P3 = __ARG_3.'_apply'("expr")
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

.end # WSubId_125


.sub '' :anon :subid('WSubId_126') :outer('WSubId_123')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "+=")
    $P3 = __ARG_4.'_apply'("expr")
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

.end # WSubId_126


.sub '' :anon :subid('WSubId_127') :outer('WSubId_123')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_5.'_applyWithArgs'("token", "-=")
    $P3 = __ARG_5.'_apply'("expr")
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

.end # WSubId_127


.sub '' :anon :subid('WSubId_128') :outer('WSubId_123')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_6.'_applyWithArgs'("token", "*=")
    $P3 = __ARG_6.'_apply'("expr")
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

.end # WSubId_128


.sub '' :anon :subid('WSubId_129') :outer('WSubId_123')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_7.'_applyWithArgs'("token", "/=")
    $P3 = __ARG_7.'_apply'("expr")
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

.end # WSubId_129


.sub '' :anon :subid('WSubId_130') :outer('WSubId_123')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_8.'_applyWithArgs'("token", "%=")
    $P3 = __ARG_8.'_apply'("expr")
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

.end # WSubId_130


.sub '' :anon :subid('WSubId_131') :outer('WSubId_123')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_9.'_applyWithArgs'("token", "&&=")
    $P3 = __ARG_9.'_apply'("expr")
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

.end # WSubId_131


.sub '' :anon :subid('WSubId_132') :outer('WSubId_123')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_10.'_applyWithArgs'("token", "||=")
    $P3 = __ARG_10.'_apply'("expr")
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

.end # WSubId_132


.sub '' :anon :subid('WSubId_133') :outer('WSubId_123')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_11.'_apply'("empty")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_133


.sub 'orExpr' :subid('WSubId_134') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_135 = "WSubId_135"
.const 'Sub' WSubId_136 = "WSubId_136"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_135
    set $P5, WSubId_136
    .tailcall self.'_or'($P4, $P5)
# }

.end # orExpr


.sub '' :anon :subid('WSubId_135') :outer('WSubId_134')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("orExpr")
store_lex '__WLEX_1', $P3
    __ARG_1.'_applyWithArgs'("token", "||")
    $P3 = __ARG_1.'_apply'("andExpr")
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

.end # WSubId_135


.sub '' :anon :subid('WSubId_136') :outer('WSubId_134')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("andExpr")
# }

.end # WSubId_136


.sub 'andExpr' :subid('WSubId_137') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_138 = "WSubId_138"
.const 'Sub' WSubId_139 = "WSubId_139"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_138
    set $P5, WSubId_139
    .tailcall self.'_or'($P4, $P5)
# }

.end # andExpr


.sub '' :anon :subid('WSubId_138') :outer('WSubId_137')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("andExpr")
store_lex '__WLEX_1', $P3
    __ARG_1.'_applyWithArgs'("token", "&&")
    $P3 = __ARG_1.'_apply'("eqExpr")
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

.end # WSubId_138


.sub '' :anon :subid('WSubId_139') :outer('WSubId_137')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("eqExpr")
# }

.end # WSubId_139


.sub 'eqExpr' :subid('WSubId_140') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_141 = "WSubId_141"
.const 'Sub' WSubId_146 = "WSubId_146"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_141
    set $P5, WSubId_146
    .tailcall self.'_or'($P4, $P5)
# }

.end # eqExpr


.sub '' :anon :subid('WSubId_141') :outer('WSubId_140')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_142 = "WSubId_142"
.const 'Sub' WSubId_143 = "WSubId_143"
.const 'Sub' WSubId_144 = "WSubId_144"
.const 'Sub' WSubId_145 = "WSubId_145"
# Body
# {
    $P3 = __ARG_1.'_apply'("eqExpr")
store_lex '__WLEX_1', $P3
    newclosure $P3, WSubId_142
    newclosure $P4, WSubId_143
    newclosure $P5, WSubId_144
    newclosure $P6, WSubId_145
    .tailcall __ARG_1.'_or'($P3, $P4, $P5, $P6)
# }

.end # WSubId_141


.sub '' :anon :subid('WSubId_142') :outer('WSubId_141')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "==")
    $P3 = __ARG_2.'_apply'("relExpr")
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

.end # WSubId_142


.sub '' :anon :subid('WSubId_143') :outer('WSubId_141')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "!=")
    $P3 = __ARG_3.'_apply'("relExpr")
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

.end # WSubId_143


.sub '' :anon :subid('WSubId_144') :outer('WSubId_141')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "===")
    $P3 = __ARG_4.'_apply'("relExpr")
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

.end # WSubId_144


.sub '' :anon :subid('WSubId_145') :outer('WSubId_141')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_5.'_applyWithArgs'("token", "!==")
    $P3 = __ARG_5.'_apply'("relExpr")
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

.end # WSubId_145


.sub '' :anon :subid('WSubId_146') :outer('WSubId_140')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("relExpr")
# }

.end # WSubId_146


.sub 'relExpr' :subid('WSubId_147') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_148 = "WSubId_148"
.const 'Sub' WSubId_154 = "WSubId_154"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_148
    set $P5, WSubId_154
    .tailcall self.'_or'($P4, $P5)
# }

.end # relExpr


.sub '' :anon :subid('WSubId_148') :outer('WSubId_147')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_149 = "WSubId_149"
.const 'Sub' WSubId_150 = "WSubId_150"
.const 'Sub' WSubId_151 = "WSubId_151"
.const 'Sub' WSubId_152 = "WSubId_152"
.const 'Sub' WSubId_153 = "WSubId_153"
# Body
# {
    $P3 = __ARG_1.'_apply'("relExpr")
store_lex '__WLEX_1', $P3
    newclosure $P3, WSubId_149
    newclosure $P4, WSubId_150
    newclosure $P5, WSubId_151
    newclosure $P6, WSubId_152
    newclosure $P7, WSubId_153
    .tailcall __ARG_1.'_or'($P3, $P4, $P5, $P6, $P7)
# }

.end # WSubId_148


.sub '' :anon :subid('WSubId_149') :outer('WSubId_148')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", ">")
    $P3 = __ARG_2.'_apply'("addExpr")
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

.end # WSubId_149


.sub '' :anon :subid('WSubId_150') :outer('WSubId_148')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", ">=")
    $P3 = __ARG_3.'_apply'("addExpr")
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

.end # WSubId_150


.sub '' :anon :subid('WSubId_151') :outer('WSubId_148')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "<")
    $P3 = __ARG_4.'_apply'("addExpr")
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

.end # WSubId_151


.sub '' :anon :subid('WSubId_152') :outer('WSubId_148')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_5.'_applyWithArgs'("token", "<=")
    $P3 = __ARG_5.'_apply'("addExpr")
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

.end # WSubId_152


.sub '' :anon :subid('WSubId_153') :outer('WSubId_148')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_6.'_applyWithArgs'("token", "instanceof")
    $P3 = __ARG_6.'_apply'("addExpr")
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

.end # WSubId_153


.sub '' :anon :subid('WSubId_154') :outer('WSubId_147')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("addExpr")
# }

.end # WSubId_154


.sub 'addExpr' :subid('WSubId_155') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_156 = "WSubId_156"
.const 'Sub' WSubId_157 = "WSubId_157"
.const 'Sub' WSubId_158 = "WSubId_158"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_156
    newclosure $P5, WSubId_157
    set $P6, WSubId_158
    .tailcall self.'_or'($P4, $P5, $P6)
# }

.end # addExpr


.sub '' :anon :subid('WSubId_156') :outer('WSubId_155')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("addExpr")
store_lex '__WLEX_1', $P3
    __ARG_1.'_applyWithArgs'("token", "+")
    $P3 = __ARG_1.'_apply'("mulExpr")
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

.end # WSubId_156


.sub '' :anon :subid('WSubId_157') :outer('WSubId_155')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("addExpr")
store_lex '__WLEX_1', $P3
    __ARG_2.'_applyWithArgs'("token", "-")
    $P3 = __ARG_2.'_apply'("mulExpr")
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

.end # WSubId_157


.sub '' :anon :subid('WSubId_158') :outer('WSubId_155')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("mulExpr")
# }

.end # WSubId_158


.sub 'mulExpr' :subid('WSubId_159') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_160 = "WSubId_160"
.const 'Sub' WSubId_161 = "WSubId_161"
.const 'Sub' WSubId_162 = "WSubId_162"
.const 'Sub' WSubId_163 = "WSubId_163"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_160
    newclosure $P5, WSubId_161
    newclosure $P6, WSubId_162
    set $P7, WSubId_163
    .tailcall self.'_or'($P4, $P5, $P6, $P7)
# }

.end # mulExpr


.sub '' :anon :subid('WSubId_160') :outer('WSubId_159')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_1.'_apply'("mulExpr")
store_lex '__WLEX_1', $P3
    __ARG_1.'_applyWithArgs'("token", "*")
    $P3 = __ARG_1.'_apply'("unary")
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

.end # WSubId_160


.sub '' :anon :subid('WSubId_161') :outer('WSubId_159')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("mulExpr")
store_lex '__WLEX_1', $P3
    __ARG_2.'_applyWithArgs'("token", "/")
    $P3 = __ARG_2.'_apply'("unary")
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

.end # WSubId_161


.sub '' :anon :subid('WSubId_162') :outer('WSubId_159')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_3.'_apply'("mulExpr")
store_lex '__WLEX_1', $P3
    __ARG_3.'_applyWithArgs'("token", "%")
    $P3 = __ARG_3.'_apply'("unary")
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

.end # WSubId_162


.sub '' :anon :subid('WSubId_163') :outer('WSubId_159')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("unary")
# }

.end # WSubId_163


.sub 'unary' :subid('WSubId_164') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_165 = "WSubId_165"
.const 'Sub' WSubId_166 = "WSubId_166"
.const 'Sub' WSubId_167 = "WSubId_167"
.const 'Sub' WSubId_168 = "WSubId_168"
.const 'Sub' WSubId_169 = "WSubId_169"
.const 'Sub' WSubId_170 = "WSubId_170"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var p: $P2
    null $P2
    newclosure $P3, WSubId_165
    newclosure $P4, WSubId_166
    newclosure $P5, WSubId_167
    newclosure $P6, WSubId_168
    newclosure $P7, WSubId_169
    set $P8, WSubId_170
    .tailcall self.'_or'($P3, $P4, $P5, $P6, $P7, $P8)
# }

.end # unary


.sub '' :anon :subid('WSubId_165') :outer('WSubId_164')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "-")
    $P2 = __ARG_1.'_apply'("postfix")
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

.end # WSubId_165


.sub '' :anon :subid('WSubId_166') :outer('WSubId_164')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "+")
    $P2 = __ARG_2.'_apply'("postfix")
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

.end # WSubId_166


.sub '' :anon :subid('WSubId_167') :outer('WSubId_164')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "++")
    $P2 = __ARG_3.'_apply'("postfix")
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

.end # WSubId_167


.sub '' :anon :subid('WSubId_168') :outer('WSubId_164')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "--")
    $P2 = __ARG_4.'_apply'("postfix")
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

.end # WSubId_168


.sub '' :anon :subid('WSubId_169') :outer('WSubId_164')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_5.'_applyWithArgs'("token", "!")
    $P2 = __ARG_5.'_apply'("unary")
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

.end # WSubId_169


.sub '' :anon :subid('WSubId_170') :outer('WSubId_164')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("postfix")
# }

.end # WSubId_170


.sub 'postfix' :subid('WSubId_171') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_172 = "WSubId_172"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var p: $P2
    null $P2
    newclosure $P3, WSubId_172
    .tailcall $P3(self)
# }

.end # postfix


.sub '' :anon :subid('WSubId_172') :outer('WSubId_171')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_173 = "WSubId_173"
.const 'Sub' WSubId_174 = "WSubId_174"
.const 'Sub' WSubId_175 = "WSubId_175"
# Body
# {
    $P2 = __ARG_1.'_apply'("primExpr")
store_lex '__WLEX_1', $P2
    newclosure $P2, WSubId_173
    newclosure $P3, WSubId_174
    newclosure $P4, WSubId_175
    .tailcall __ARG_1.'_or'($P2, $P3, $P4)
# }

.end # WSubId_172


.sub '' :anon :subid('WSubId_173') :outer('WSubId_172')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "++")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "postop"
    push $P2, $P3
    box $P3, "++"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_173


.sub '' :anon :subid('WSubId_174') :outer('WSubId_172')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "--")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "postop"
    push $P2, $P3
    box $P3, "--"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_174


.sub '' :anon :subid('WSubId_175') :outer('WSubId_172')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_4.'_apply'("empty")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_175


.sub 'primExpr' :subid('WSubId_176') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.lex '__WLEX_5', $P6
.const 'Sub' WSubId_177 = "WSubId_177"
.const 'Sub' WSubId_182 = "WSubId_182"
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
    newclosure $P7, WSubId_177
    set $P8, WSubId_182
    .tailcall self.'_or'($P7, $P8)
# }

.end # primExpr


.sub '' :anon :subid('WSubId_177') :outer('WSubId_176')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_4'
    find_lex $P5, '__WLEX_5'
.const 'Sub' WSubId_178 = "WSubId_178"
.const 'Sub' WSubId_179 = "WSubId_179"
.const 'Sub' WSubId_180 = "WSubId_180"
.const 'Sub' WSubId_181 = "WSubId_181"
# Body
# {
    $P6 = __ARG_1.'_apply'("primExpr")
store_lex '__WLEX_1', $P6
    newclosure $P6, WSubId_178
    newclosure $P7, WSubId_179
    newclosure $P8, WSubId_180
    newclosure $P9, WSubId_181
    .tailcall __ARG_1.'_or'($P6, $P7, $P8, $P9)
# }

.end # WSubId_177


.sub '' :anon :subid('WSubId_178') :outer('WSubId_177')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "[")
    $P3 = __ARG_2.'_apply'("expr")
store_lex '__WLEX_2', $P3
    __ARG_2.'_applyWithArgs'("token", "]")
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "getp"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_1'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_178


.sub '' :anon :subid('WSubId_179') :outer('WSubId_177')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_4'
    find_lex $P3, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", ".")
    $P4 = __ARG_3.'_apply'("name")
store_lex '__WLEX_3', $P4
    __ARG_3.'_applyWithArgs'("token", "(")
    $P4 = __ARG_3.'_applyWithArgs'("listOf", "expr", ",")
store_lex '__WLEX_4', $P4
    __ARG_3.'_applyWithArgs'("token", ")")
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

.end # WSubId_179


.sub '' :anon :subid('WSubId_180') :outer('WSubId_177')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_5'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_4.'_applyWithArgs'("token", ".")
    $P3 = __ARG_4.'_apply'("name")
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

.end # WSubId_180


.sub '' :anon :subid('WSubId_181') :outer('WSubId_177')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_1'
# Body
# {
    __ARG_5.'_applyWithArgs'("token", "(")
    $P3 = __ARG_5.'_applyWithArgs'("listOf", "expr", ",")
store_lex '__WLEX_4', $P3
    __ARG_5.'_applyWithArgs'("token", ")")
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "call"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_4'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_181


.sub '' :anon :subid('WSubId_182') :outer('WSubId_176')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("primExprHd")
# }

.end # WSubId_182


.sub 'primExprHd' :subid('WSubId_183') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.lex '__WLEX_5', $P6
.const 'Sub' WSubId_184 = "WSubId_184"
.const 'Sub' WSubId_185 = "WSubId_185"
.const 'Sub' WSubId_186 = "WSubId_186"
.const 'Sub' WSubId_187 = "WSubId_187"
.const 'Sub' WSubId_188 = "WSubId_188"
.const 'Sub' WSubId_189 = "WSubId_189"
.const 'Sub' WSubId_194 = "WSubId_194"
.const 'Sub' WSubId_195 = "WSubId_195"
.const 'Sub' WSubId_196 = "WSubId_196"
.const 'Sub' WSubId_197 = "WSubId_197"
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
    newclosure $P7, WSubId_184
    set $P8, WSubId_185
    newclosure $P9, WSubId_186
    newclosure $P10, WSubId_187
    set $P11, WSubId_188
    newclosure $P12, WSubId_189
    newclosure $P13, WSubId_194
    newclosure $P14, WSubId_195
    set $P15, WSubId_196
    newclosure $P16, WSubId_197
    .tailcall self.'_or'($P7, $P8, $P9, $P10, $P11, $P12, $P13, $P14, $P15, $P16)
# }

.end # primExprHd


.sub '' :anon :subid('WSubId_184') :outer('WSubId_183')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "(")
    $P2 = __ARG_1.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("token", ")")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_184


.sub '' :anon :subid('WSubId_185') :outer('WSubId_183')
        .param pmc __ARG_2
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "self")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "self"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_185


.sub '' :anon :subid('WSubId_186') :outer('WSubId_183')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_3.'_applyWithArgs'("token", "number")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "number"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_186


.sub '' :anon :subid('WSubId_187') :outer('WSubId_183')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_3'
# Body
# {
    $P2 = __ARG_4.'_applyWithArgs'("token", "str")
store_lex '__WLEX_3', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "string"
    push $P2, $P3
    find_lex $P4, '__WLEX_3'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_187


.sub '' :anon :subid('WSubId_188') :outer('WSubId_183')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("anonFunc")
# }

.end # WSubId_188


.sub '' :anon :subid('WSubId_189') :outer('WSubId_183')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_1'
.const 'Sub' WSubId_190 = "WSubId_190"
.const 'Sub' WSubId_191 = "WSubId_191"
.const 'Sub' WSubId_192 = "WSubId_192"
.const 'Sub' WSubId_193 = "WSubId_193"
# Body
# {
    __ARG_6.'_applyWithArgs'("token", "new")
    set $P5, WSubId_190
    newclosure $P6, WSubId_191
    $P4 = __ARG_6.'_or'($P5, $P6)
store_lex '__WLEX_4', $P4
    __ARG_6.'_applyWithArgs'("token", "(")
    set $P5, WSubId_192
    set $P6, WSubId_193
    $P4 = __ARG_6.'_or'($P5, $P6)
store_lex '__WLEX_1', $P4
    __ARG_6.'_applyWithArgs'("token", ")")
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

.end # WSubId_189


.sub '' :anon :subid('WSubId_190') :outer('WSubId_189')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("name")
# }

.end # WSubId_190


.sub '' :anon :subid('WSubId_191') :outer('WSubId_189')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_3'
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    $P2 = __ARG_8.'_applyWithArgs'("token", "str")
store_lex '__WLEX_3', $P2
    find_lex $P2, '__WLEX_3'
    .tailcall WSubId_785($P2)
# }

.end # WSubId_191


.sub '' :anon :subid('WSubId_192') :outer('WSubId_189')
        .param pmc __ARG_9
# Body
# {
    .tailcall __ARG_9.'_apply'("expr")
# }

.end # WSubId_192


.sub '' :anon :subid('WSubId_193') :outer('WSubId_189')
        .param pmc __ARG_10
# Body
# {
    __ARG_10.'_apply'("empty")
    null $P1
    .return($P1)
# }

.end # WSubId_193


.sub '' :anon :subid('WSubId_194') :outer('WSubId_183')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_4'
# Body
# {
    __ARG_11.'_applyWithArgs'("token", "new")
    $P2 = __ARG_11.'_apply'("name")
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

.end # WSubId_194


.sub '' :anon :subid('WSubId_195') :outer('WSubId_183')
        .param pmc __ARG_12
    find_lex $P1, '__WLEX_5'
# Body
# {
    __ARG_12.'_applyWithArgs'("token", "[")
    $P2 = __ARG_12.'_applyWithArgs'("listOf", "expr", ",")
store_lex '__WLEX_5', $P2
    __ARG_12.'_applyWithArgs'("token", "]")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "arr"
    push $P2, $P3
    find_lex $P4, '__WLEX_5'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_195


.sub '' :anon :subid('WSubId_196') :outer('WSubId_183')
        .param pmc __ARG_13
# Body
# {
    .tailcall __ARG_13.'_apply'("json")
# }

.end # WSubId_196


.sub '' :anon :subid('WSubId_197') :outer('WSubId_183')
        .param pmc __ARG_14
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_14.'_apply'("name")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "get"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_197


.sub 'json' :subid('WSubId_198') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_199 = "WSubId_199"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var bs: $P2
    null $P2
    newclosure $P3, WSubId_199
    .tailcall $P3(self)
# }

.end # json


.sub '' :anon :subid('WSubId_199') :outer('WSubId_198')
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

.end # WSubId_199


.sub 'jsonBinding' :subid('WSubId_200') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_201 = "WSubId_201"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var n: $P2
    null $P2
# var v: $P3
    null $P3
    newclosure $P4, WSubId_201
    .tailcall $P4(self)
# }

.end # jsonBinding


.sub '' :anon :subid('WSubId_201') :outer('WSubId_200')
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

.end # WSubId_201


.sub 'jsonPropName' :subid('WSubId_202') :method
.const 'Sub' WSubId_203 = "WSubId_203"
.const 'Sub' WSubId_204 = "WSubId_204"
.const 'Sub' WSubId_205 = "WSubId_205"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_203
    set $P3, WSubId_204
    set $P4, WSubId_205
    .tailcall self.'_or'($P2, $P3, $P4)
# }

.end # jsonPropName


.sub '' :anon :subid('WSubId_203') :outer('WSubId_202')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_applyWithArgs'("token", "number")
# }

.end # WSubId_203


.sub '' :anon :subid('WSubId_204') :outer('WSubId_202')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_applyWithArgs'("token", "str")
# }

.end # WSubId_204


.sub '' :anon :subid('WSubId_205') :outer('WSubId_202')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("name")
# }

.end # WSubId_205


.sub 'formal' :subid('WSubId_206') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_207 = "WSubId_207"
.const 'Sub' WSubId_208 = "WSubId_208"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var v: $P2
    null $P2
    newclosure $P3, WSubId_207
    set $P4, WSubId_208
    .tailcall self.'_or'($P3, $P4)
# }

.end # formal


.sub '' :anon :subid('WSubId_207') :outer('WSubId_206')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("var")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, " ", $P2
    .return($S1)
# }

.end # WSubId_207


.sub '' :anon :subid('WSubId_208') :outer('WSubId_206')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("name")
# }

.end # WSubId_208


.sub 'anonFunc' :subid('WSubId_209') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_210 = "WSubId_210"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var f: $P2
    null $P2
    newclosure $P3, WSubId_210
    .tailcall $P3(self)
# }

.end # anonFunc


.sub '' :anon :subid('WSubId_210') :outer('WSubId_209')
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

.end # WSubId_210


.sub 'funcRest' :subid('WSubId_211') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_212 = "WSubId_212"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var fs: $P2
    null $P2
# var ss: $P3
    null $P3
    newclosure $P4, WSubId_212
    .tailcall $P4(self)
# }

.end # funcRest


.sub '' :anon :subid('WSubId_212') :outer('WSubId_211')
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

.end # WSubId_212


.sub 'sc' :method
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    .tailcall self.'_applyWithArgs'("token", ";")
# }

.end # sc


.sub 'block' :subid('WSubId_213') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_214 = "WSubId_214"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var ss: $P2
    null $P2
    newclosure $P3, WSubId_214
    .tailcall $P3(self)
# }

.end # block


.sub '' :anon :subid('WSubId_214') :outer('WSubId_213')
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

.end # WSubId_214


.sub 'var' :subid('WSubId_215') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_216 = "WSubId_216"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var t: $P2
    null $P2
# var n: $P3
    null $P3
    newclosure $P4, WSubId_216
    .tailcall $P4(self)
# }

.end # var


.sub '' :anon :subid('WSubId_216') :outer('WSubId_215')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_217 = "WSubId_217"
.const 'Sub' WSubId_218 = "WSubId_218"
.const 'Sub' WSubId_219 = "WSubId_219"
.const 'Sub' WSubId_220 = "WSubId_220"
# Body
# {
    set $P4, WSubId_217
    set $P5, WSubId_218
    set $P6, WSubId_219
    set $P7, WSubId_220
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

.end # WSubId_216


.sub '' :anon :subid('WSubId_217') :outer('WSubId_216')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_applyWithArgs'("token", "var")
# }

.end # WSubId_217


.sub '' :anon :subid('WSubId_218') :outer('WSubId_216')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("token", "string")
# }

.end # WSubId_218


.sub '' :anon :subid('WSubId_219') :outer('WSubId_216')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_applyWithArgs'("token", "int")
# }

.end # WSubId_219


.sub '' :anon :subid('WSubId_220') :outer('WSubId_216')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_applyWithArgs'("token", "num")
# }

.end # WSubId_220


.sub 'varInit' :subid('WSubId_221') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_222 = "WSubId_222"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var v: $P2
    null $P2
# var i: $P3
    null $P3
    newclosure $P4, WSubId_222
    .tailcall $P4(self)
# }

.end # varInit


.sub '' :anon :subid('WSubId_222') :outer('WSubId_221')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_223 = "WSubId_223"
.const 'Sub' WSubId_224 = "WSubId_224"
# Body
# {
    $P3 = __ARG_1.'_apply'("var")
store_lex '__WLEX_1', $P3
    set $P4, WSubId_223
    set $P5, WSubId_224
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

.end # WSubId_222


.sub '' :anon :subid('WSubId_223') :outer('WSubId_222')
        .param pmc __ARG_2
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "=")
    .tailcall __ARG_2.'_apply'("expr")
# }

.end # WSubId_223


.sub '' :anon :subid('WSubId_224') :outer('WSubId_222')
        .param pmc __ARG_3
# Body
# {
    __ARG_3.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, "null"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_224


.sub 'varNoInit' :subid('WSubId_225') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_226 = "WSubId_226"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var v: $P2
    null $P2
    newclosure $P3, WSubId_226
    .tailcall $P3(self)
# }

.end # varNoInit


.sub '' :anon :subid('WSubId_226') :outer('WSubId_225')
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

.end # WSubId_226


.sub 'stmt' :subid('WSubId_227') :method
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
.const 'Sub' WSubId_228 = "WSubId_228"
.const 'Sub' WSubId_229 = "WSubId_229"
.const 'Sub' WSubId_230 = "WSubId_230"
.const 'Sub' WSubId_233 = "WSubId_233"
.const 'Sub' WSubId_234 = "WSubId_234"
.const 'Sub' WSubId_235 = "WSubId_235"
.const 'Sub' WSubId_243 = "WSubId_243"
.const 'Sub' WSubId_246 = "WSubId_246"
.const 'Sub' WSubId_250 = "WSubId_250"
.const 'Sub' WSubId_251 = "WSubId_251"
.const 'Sub' WSubId_252 = "WSubId_252"
.const 'Sub' WSubId_253 = "WSubId_253"
.const 'Sub' WSubId_254 = "WSubId_254"
.const 'Sub' WSubId_257 = "WSubId_257"
.const 'Sub' WSubId_258 = "WSubId_258"
.const 'Sub' WSubId_259 = "WSubId_259"
.const 'Sub' WSubId_260 = "WSubId_260"
.const 'Sub' WSubId_261 = "WSubId_261"
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
    set $P14, WSubId_228
    newclosure $P15, WSubId_229
    newclosure $P16, WSubId_230
    newclosure $P17, WSubId_233
    newclosure $P18, WSubId_234
    newclosure $P19, WSubId_235
    newclosure $P20, WSubId_243
    newclosure $P21, WSubId_246
    set $P22, WSubId_250
    set $P23, WSubId_251
    newclosure $P24, WSubId_252
    newclosure $P25, WSubId_253
    newclosure $P26, WSubId_254
    newclosure $P27, WSubId_257
    newclosure $P28, WSubId_258
    newclosure $P29, WSubId_259
    newclosure $P30, WSubId_260
    set $P31, WSubId_261
    .tailcall self.'_or'($P14, $P15, $P16, $P17, $P18, $P19, $P20, $P21, $P22, $P23, $P24, $P25, $P26, $P27, $P28, $P29, $P30, $P31)
# }

.end # stmt


.sub '' :anon :subid('WSubId_228') :outer('WSubId_227')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("block")
# }

.end # WSubId_228


.sub '' :anon :subid('WSubId_229') :outer('WSubId_227')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("varInit")
store_lex '__WLEX_1', $P2
    __ARG_2.'_apply'("sc")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_229


.sub '' :anon :subid('WSubId_230') :outer('WSubId_227')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_4'
.const 'Sub' WSubId_231 = "WSubId_231"
.const 'Sub' WSubId_232 = "WSubId_232"
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "if")
    __ARG_3.'_applyWithArgs'("token", "(")
    $P4 = __ARG_3.'_apply'("expr")
store_lex '__WLEX_2', $P4
    __ARG_3.'_applyWithArgs'("token", ")")
    $P4 = __ARG_3.'_apply'("stmt")
store_lex '__WLEX_3', $P4
    set $P5, WSubId_231
    set $P6, WSubId_232
    $P4 = __ARG_3.'_or'($P5, $P6)
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

.end # WSubId_230


.sub '' :anon :subid('WSubId_231') :outer('WSubId_230')
        .param pmc __ARG_4
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "else")
    .tailcall __ARG_4.'_apply'("stmt")
# }

.end # WSubId_231


.sub '' :anon :subid('WSubId_232') :outer('WSubId_230')
        .param pmc __ARG_5
# Body
# {
    __ARG_5.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, ""
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_232


.sub '' :anon :subid('WSubId_233') :outer('WSubId_227')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_5'
# Body
# {
    __ARG_6.'_applyWithArgs'("token", "while")
    __ARG_6.'_applyWithArgs'("token", "(")
    $P3 = __ARG_6.'_apply'("expr")
store_lex '__WLEX_2', $P3
    __ARG_6.'_applyWithArgs'("token", ")")
    $P3 = __ARG_6.'_apply'("stmt")
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

.end # WSubId_233


.sub '' :anon :subid('WSubId_234') :outer('WSubId_227')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_5'
    find_lex $P2, '__WLEX_2'
# Body
# {
    __ARG_7.'_applyWithArgs'("token", "do")
    $P3 = __ARG_7.'_apply'("stmt")
store_lex '__WLEX_5', $P3
    __ARG_7.'_applyWithArgs'("token", "while")
    __ARG_7.'_applyWithArgs'("token", "(")
    $P3 = __ARG_7.'_apply'("expr")
store_lex '__WLEX_2', $P3
    __ARG_7.'_applyWithArgs'("token", ")")
    __ARG_7.'_apply'("sc")
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "doWhile"
    push $P3, $P4
    find_lex $P5, '__WLEX_5'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_234


.sub '' :anon :subid('WSubId_235') :outer('WSubId_227')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_6'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_7'
    find_lex $P4, '__WLEX_5'
.const 'Sub' WSubId_236 = "WSubId_236"
.const 'Sub' WSubId_237 = "WSubId_237"
.const 'Sub' WSubId_238 = "WSubId_238"
.const 'Sub' WSubId_239 = "WSubId_239"
.const 'Sub' WSubId_240 = "WSubId_240"
.const 'Sub' WSubId_241 = "WSubId_241"
.const 'Sub' WSubId_242 = "WSubId_242"
# Body
# {
    __ARG_8.'_applyWithArgs'("token", "for")
    __ARG_8.'_applyWithArgs'("token", "(")
    set $P6, WSubId_236
    set $P7, WSubId_237
    set $P8, WSubId_238
    $P5 = __ARG_8.'_or'($P6, $P7, $P8)
store_lex '__WLEX_6', $P5
    __ARG_8.'_applyWithArgs'("token", ";")
    set $P6, WSubId_239
    set $P7, WSubId_240
    $P5 = __ARG_8.'_or'($P6, $P7)
store_lex '__WLEX_2', $P5
    __ARG_8.'_applyWithArgs'("token", ";")
    set $P6, WSubId_241
    set $P7, WSubId_242
    $P5 = __ARG_8.'_or'($P6, $P7)
store_lex '__WLEX_7', $P5
    __ARG_8.'_applyWithArgs'("token", ")")
    $P5 = __ARG_8.'_apply'("stmt")
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

.end # WSubId_235


.sub '' :anon :subid('WSubId_236') :outer('WSubId_235')
        .param pmc __ARG_9
# Body
# {
    .tailcall __ARG_9.'_apply'("varInit")
# }

.end # WSubId_236


.sub '' :anon :subid('WSubId_237') :outer('WSubId_235')
        .param pmc __ARG_10
# Body
# {
    .tailcall __ARG_10.'_apply'("expr")
# }

.end # WSubId_237


.sub '' :anon :subid('WSubId_238') :outer('WSubId_235')
        .param pmc __ARG_11
# Body
# {
    __ARG_11.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, "null"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_238


.sub '' :anon :subid('WSubId_239') :outer('WSubId_235')
        .param pmc __ARG_12
# Body
# {
    .tailcall __ARG_12.'_apply'("expr")
# }

.end # WSubId_239


.sub '' :anon :subid('WSubId_240') :outer('WSubId_235')
        .param pmc __ARG_13
# Body
# {
    __ARG_13.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, "true"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_240


.sub '' :anon :subid('WSubId_241') :outer('WSubId_235')
        .param pmc __ARG_14
# Body
# {
    .tailcall __ARG_14.'_apply'("expr")
# }

.end # WSubId_241


.sub '' :anon :subid('WSubId_242') :outer('WSubId_235')
        .param pmc __ARG_15
# Body
# {
    __ARG_15.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, "null"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_242


.sub '' :anon :subid('WSubId_243') :outer('WSubId_227')
        .param pmc __ARG_16
    find_lex $P1, '__WLEX_8'
    find_lex $P2, '__WLEX_9'
    find_lex $P3, '__WLEX_5'
.const 'Sub' WSubId_244 = "WSubId_244"
.const 'Sub' WSubId_245 = "WSubId_245"
# Body
# {
    __ARG_16.'_applyWithArgs'("token", "for")
    __ARG_16.'_applyWithArgs'("token", "(")
    set $P5, WSubId_244
    set $P6, WSubId_245
    $P4 = __ARG_16.'_or'($P5, $P6)
store_lex '__WLEX_8', $P4
    __ARG_16.'_applyWithArgs'("token", "in")
    $P4 = __ARG_16.'_apply'("expr")
store_lex '__WLEX_9', $P4
    __ARG_16.'_applyWithArgs'("token", ")")
    $P4 = __ARG_16.'_apply'("stmt")
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

.end # WSubId_243


.sub '' :anon :subid('WSubId_244') :outer('WSubId_243')
        .param pmc __ARG_17
# Body
# {
    .tailcall __ARG_17.'_apply'("varNoInit")
# }

.end # WSubId_244


.sub '' :anon :subid('WSubId_245') :outer('WSubId_243')
        .param pmc __ARG_18
# Body
# {
    .tailcall __ARG_18.'_apply'("expr")
# }

.end # WSubId_245


.sub '' :anon :subid('WSubId_246') :outer('WSubId_227')
        .param pmc __ARG_19
    find_lex $P1, '__WLEX_9'
    find_lex $P2, '__WLEX_10'
    find_lex $P3, '__WLEX_2'
.const 'Sub' WSubId_247 = "WSubId_247"
# Body
# {
    __ARG_19.'_applyWithArgs'("token", "switch")
    __ARG_19.'_applyWithArgs'("token", "(")
    $P4 = __ARG_19.'_apply'("expr")
store_lex '__WLEX_9', $P4
    __ARG_19.'_applyWithArgs'("token", ")")
    __ARG_19.'_applyWithArgs'("token", "{")
    newclosure $P5, WSubId_247
    $P4 = __ARG_19.'_many'($P5)
store_lex '__WLEX_10', $P4
    __ARG_19.'_applyWithArgs'("token", "}")
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "switch"
    push $P4, $P5
    find_lex $P6, '__WLEX_9'
    push $P4, $P6
    find_lex $P7, '__WLEX_10'
    .tailcall $P4.'append'($P7)
# }

.end # WSubId_246


.sub '' :anon :subid('WSubId_247') :outer('WSubId_246')
        .param pmc __ARG_20
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_10'
.const 'Sub' WSubId_248 = "WSubId_248"
.const 'Sub' WSubId_249 = "WSubId_249"
# Body
# {
    newclosure $P3, WSubId_248
    newclosure $P4, WSubId_249
    .tailcall __ARG_20.'_or'($P3, $P4)
# }

.end # WSubId_247


.sub '' :anon :subid('WSubId_248') :outer('WSubId_247')
        .param pmc __ARG_21
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_10'
# Body
# {
    __ARG_21.'_applyWithArgs'("token", "case")
    $P3 = __ARG_21.'_apply'("expr")
store_lex '__WLEX_2', $P3
    __ARG_21.'_applyWithArgs'("token", ":")
    $P3 = __ARG_21.'_apply'("srcElems")
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

.end # WSubId_248


.sub '' :anon :subid('WSubId_249') :outer('WSubId_247')
        .param pmc __ARG_22
    find_lex $P1, '__WLEX_10'
# Body
# {
    __ARG_22.'_applyWithArgs'("token", "default")
    __ARG_22.'_applyWithArgs'("token", ":")
    $P2 = __ARG_22.'_apply'("srcElems")
store_lex '__WLEX_10', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "default"
    push $P2, $P3
    find_lex $P4, '__WLEX_10'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_249


.sub '' :anon :subid('WSubId_250') :outer('WSubId_227')
        .param pmc __ARG_23
# Body
# {
    __ARG_23.'_applyWithArgs'("token", "break")
    __ARG_23.'_apply'("sc")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "break"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_250


.sub '' :anon :subid('WSubId_251') :outer('WSubId_227')
        .param pmc __ARG_24
# Body
# {
    __ARG_24.'_applyWithArgs'("token", "continue")
    __ARG_24.'_apply'("sc")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "continue"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_251


.sub '' :anon :subid('WSubId_252') :outer('WSubId_227')
        .param pmc __ARG_25
    find_lex $P1, '__WLEX_9'
# Body
# {
    __ARG_25.'_applyWithArgs'("token", "throw")
    $P2 = __ARG_25.'_apply'("expr")
store_lex '__WLEX_9', $P2
    __ARG_25.'_apply'("sc")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "throw"
    push $P2, $P3
    find_lex $P4, '__WLEX_9'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_252


.sub '' :anon :subid('WSubId_253') :outer('WSubId_227')
        .param pmc __ARG_26
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_9'
    find_lex $P3, '__WLEX_2'
# Body
# {
    __ARG_26.'_applyWithArgs'("token", "try")
    $P4 = __ARG_26.'_apply'("block")
store_lex '__WLEX_3', $P4
    __ARG_26.'_applyWithArgs'("token", "catch")
    __ARG_26.'_applyWithArgs'("token", "(")
    $P4 = __ARG_26.'_apply'("name")
store_lex '__WLEX_9', $P4
    __ARG_26.'_applyWithArgs'("token", ")")
    $P4 = __ARG_26.'_apply'("block")
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

.end # WSubId_253


.sub '' :anon :subid('WSubId_254') :outer('WSubId_227')
        .param pmc __ARG_27
    find_lex $P1, '__WLEX_9'
.const 'Sub' WSubId_255 = "WSubId_255"
.const 'Sub' WSubId_256 = "WSubId_256"
# Body
# {
    __ARG_27.'_applyWithArgs'("token", "return")
    set $P3, WSubId_255
    set $P4, WSubId_256
    $P2 = __ARG_27.'_or'($P3, $P4)
store_lex '__WLEX_9', $P2
    __ARG_27.'_apply'("sc")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "return"
    push $P2, $P3
    find_lex $P4, '__WLEX_9'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_254


.sub '' :anon :subid('WSubId_255') :outer('WSubId_254')
        .param pmc __ARG_28
# Body
# {
    .tailcall __ARG_28.'_apply'("expr")
# }

.end # WSubId_255


.sub '' :anon :subid('WSubId_256') :outer('WSubId_254')
        .param pmc __ARG_29
# Body
# {
    __ARG_29.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    null $P3
    push $P1, $P3
    .return($P1)
# }

.end # WSubId_256


.sub '' :anon :subid('WSubId_257') :outer('WSubId_227')
        .param pmc __ARG_30
    find_lex $P1, '__WLEX_9'
# Body
# {
    $P2 = __ARG_30.'_apply'("expr")
store_lex '__WLEX_9', $P2
    __ARG_30.'_apply'("sc")
    find_lex $P2, '__WLEX_9'
    .return($P2)
# }

.end # WSubId_257


.sub '' :anon :subid('WSubId_258') :outer('WSubId_227')
        .param pmc __ARG_31
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_11'
# Body
# {
    __ARG_31.'_applyWithArgs'("token", "using")
    $P3 = __ARG_31.'_applyWithArgs'("token", "static")
store_lex '__WLEX_3', $P3
    $P3 = __ARG_31.'_apply'("name")
store_lex '__WLEX_11', $P3
    __ARG_31.'_apply'("sc")
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "using"
    push $P3, $P4
    find_lex $P5, '__WLEX_11'
    push $P3, $P5
    find_lex $P6, '__WLEX_3'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_258


.sub '' :anon :subid('WSubId_259') :outer('WSubId_227')
        .param pmc __ARG_32
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_12'
# Body
# {
    __ARG_32.'_applyWithArgs'("token", "using")
    $P3 = __ARG_32.'_applyWithArgs'("token", "extern")
store_lex '__WLEX_3', $P3
    $P3 = __ARG_32.'_applyWithArgs'("listOf", "name", ".")
store_lex '__WLEX_12', $P3
    __ARG_32.'_apply'("sc")
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

.end # WSubId_259


.sub '' :anon :subid('WSubId_260') :outer('WSubId_227')
        .param pmc __ARG_33
    find_lex $P1, '__WLEX_12'
# Body
# {
    __ARG_33.'_applyWithArgs'("token", "using")
    $P2 = __ARG_33.'_applyWithArgs'("listOf", "name", ".")
store_lex '__WLEX_12', $P2
    __ARG_33.'_apply'("sc")
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

.end # WSubId_260


.sub '' :anon :subid('WSubId_261') :outer('WSubId_227')
        .param pmc __ARG_34
# Body
# {
    __ARG_34.'_applyWithArgs'("token", ";")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "get"
    push $P1, $P2
    box $P2, "null"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_261


.sub 'classRest' :subid('WSubId_262') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_263 = "WSubId_263"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var es: $P2
    null $P2
    newclosure $P3, WSubId_263
    .tailcall $P3(self)
# }

.end # classRest


.sub '' :anon :subid('WSubId_263') :outer('WSubId_262')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_264 = "WSubId_264"
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "{")
    set $P3, WSubId_264
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("token", "}")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "begin"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_263


.sub '' :anon :subid('WSubId_264') :outer('WSubId_263')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("classElem")
# }

.end # WSubId_264


.sub 'classBases' :subid('WSubId_265') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_266 = "WSubId_266"
.const 'Sub' WSubId_267 = "WSubId_267"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var bs: $P2
    null $P2
    newclosure $P3, WSubId_266
    set $P4, WSubId_267
    .tailcall self.'_or'($P3, $P4)
# }

.end # classBases


.sub '' :anon :subid('WSubId_266') :outer('WSubId_265')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", ":")
    $P2 = __ARG_1.'_applyWithArgs'("listOf", "name", ",")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_266


.sub '' :anon :subid('WSubId_267') :outer('WSubId_265')
        .param pmc __ARG_2
# Body
# {
    __ARG_2.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    .return($P1)
# }

.end # WSubId_267


.sub 'classVar' :subid('WSubId_268') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_269 = "WSubId_269"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var v: $P2
    null $P2
    newclosure $P3, WSubId_269
    .tailcall $P3(self)
# }

.end # classVar


.sub '' :anon :subid('WSubId_269') :outer('WSubId_268')
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

.end # WSubId_269


.sub 'classElem' :subid('WSubId_270') :method
.const 'Sub' WSubId_271 = "WSubId_271"
.const 'Sub' WSubId_272 = "WSubId_272"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_271
    set $P3, WSubId_272
    .tailcall self.'_or'($P2, $P3)
# }

.end # classElem


.sub '' :anon :subid('WSubId_271') :outer('WSubId_270')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("funcDecl")
# }

.end # WSubId_271


.sub '' :anon :subid('WSubId_272') :outer('WSubId_270')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("classVar")
# }

.end # WSubId_272


.sub 'flag' :subid('WSubId_273') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P4
.lex '__WLEX_3', $P3
.const 'Sub' WSubId_274 = "WSubId_274"
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
    newclosure $P5, WSubId_274
    .tailcall $P5(self)
# }

.end # flag


.sub '' :anon :subid('WSubId_274') :outer('WSubId_273')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_275 = "WSubId_275"
.const 'Sub' WSubId_276 = "WSubId_276"
# Body
# {
    $P4 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P4
    newclosure $P5, WSubId_275
    set $P6, WSubId_276
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

.end # WSubId_274


.sub '' :anon :subid('WSubId_275') :outer('WSubId_274')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_3'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "(")
    $P2 = __ARG_2.'_apply'("expr")
store_lex '__WLEX_3', $P2
    __ARG_2.'_applyWithArgs'("token", ")")
    find_lex $P2, '__WLEX_3'
    .return($P2)
# }

.end # WSubId_275


.sub '' :anon :subid('WSubId_276') :outer('WSubId_274')
        .param pmc __ARG_3
# Body
# {
    __ARG_3.'_apply'("empty")
    null $P1
    .return($P1)
# }

.end # WSubId_276


.sub 'flagsList' :subid('WSubId_277') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_278 = "WSubId_278"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var fs: $P2
    null $P2
    newclosure $P3, WSubId_278
    .tailcall $P3(self)
# }

.end # flagsList


.sub '' :anon :subid('WSubId_278') :outer('WSubId_277')
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

.end # WSubId_278


.sub 'funcDecl' :subid('WSubId_279') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_280 = "WSubId_280"
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
    newclosure $P5, WSubId_280
    .tailcall $P5(self)
# }

.end # funcDecl


.sub '' :anon :subid('WSubId_280') :outer('WSubId_279')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_281 = "WSubId_281"
.const 'Sub' WSubId_282 = "WSubId_282"
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "function")
    $P4 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P4
    set $P5, WSubId_281
    set $P6, WSubId_282
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

.end # WSubId_280


.sub '' :anon :subid('WSubId_281') :outer('WSubId_280')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("flagsList")
# }

.end # WSubId_281


.sub '' :anon :subid('WSubId_282') :outer('WSubId_280')
        .param pmc __ARG_3
# Body
# {
    __ARG_3.'_apply'("empty")
    null $P1
    .return($P1)
# }

.end # WSubId_282


.sub 'classDecl' :subid('WSubId_283') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_284 = "WSubId_284"
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
    newclosure $P5, WSubId_284
    .tailcall $P5(self)
# }

.end # classDecl


.sub '' :anon :subid('WSubId_284') :outer('WSubId_283')
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

.end # WSubId_284


.sub 'srcElems' :subid('WSubId_285') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_286 = "WSubId_286"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var ss: $P2
    null $P2
    newclosure $P3, WSubId_286
    .tailcall $P3(self)
# }

.end # srcElems


.sub '' :anon :subid('WSubId_286') :outer('WSubId_285')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_287 = "WSubId_287"
# Body
# {
    set $P3, WSubId_287
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "begin"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_286


.sub '' :anon :subid('WSubId_287') :outer('WSubId_286')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("stmt")
# }

.end # WSubId_287


.sub 'topElem' :subid('WSubId_288') :method
.const 'Sub' WSubId_289 = "WSubId_289"
.const 'Sub' WSubId_290 = "WSubId_290"
.const 'Sub' WSubId_291 = "WSubId_291"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_289
    set $P3, WSubId_290
    set $P4, WSubId_291
    .tailcall self.'_or'($P2, $P3, $P4)
# }

.end # topElem


.sub '' :anon :subid('WSubId_289') :outer('WSubId_288')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("funcDecl")
# }

.end # WSubId_289


.sub '' :anon :subid('WSubId_290') :outer('WSubId_288')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("classDecl")
# }

.end # WSubId_290


.sub '' :anon :subid('WSubId_291') :outer('WSubId_288')
        .param pmc __ARG_3
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "ometa")
    root_new $P1, ['parrot';'ResizablePMCArray']
    box $P2, "ometa"
    push $P1, $P2
    .return($P1)
# }

.end # WSubId_291


.sub 'topLevel' :subid('WSubId_292') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_293 = "WSubId_293"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var es: $P2
    null $P2
    newclosure $P3, WSubId_293
    .tailcall $P3(self)
# }

.end # topLevel


.sub '' :anon :subid('WSubId_293') :outer('WSubId_292')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_294 = "WSubId_294"
# Body
# {
    set $P3, WSubId_294
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

.end # WSubId_293


.sub '' :anon :subid('WSubId_294') :outer('WSubId_293')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("topElem")
# }

.end # WSubId_294

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedParser' ]
    get_class $P1, [ 'Parser' ]
    addparent $P0, $P1
.end
.namespace [ 'WinxedSemActionParser' ]

.sub 'curlySemAction' :subid('WSubId_295') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P4
.lex '__WLEX_3', $P3
.const 'Sub' WSubId_296 = "WSubId_296"
.const 'Sub' WSubId_297 = "WSubId_297"
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
    newclosure $P5, WSubId_296
    newclosure $P6, WSubId_297
    .tailcall self.'_or'($P5, $P6)
# }

.end # curlySemAction


.sub '' :anon :subid('WSubId_296') :outer('WSubId_295')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "{")
    $P2 = __ARG_1.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("token", "}")
    __ARG_1.'_apply'("spaces")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_296


.sub '' :anon :subid('WSubId_297') :outer('WSubId_295')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_1'
.const 'Sub' WSubId_298 = "WSubId_298"
.const 'Sub' WSubId_302 = "WSubId_302"
.const 'Sub' WSubId_303 = "WSubId_303"
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "{")
    newclosure $P5, WSubId_298
    $P4 = __ARG_2.'_many'($P5)
store_lex '__WLEX_2', $P4
    newclosure $P5, WSubId_302
    set $P6, WSubId_303
    $P4 = __ARG_2.'_or'($P5, $P6)
store_lex '__WLEX_3', $P4
    find_lex $P4, '__WLEX_2'
    find_lex $P5, '__WLEX_3'
    $P4.'push'($P5)
    __ARG_2.'_applyWithArgs'("token", "}")
    __ARG_2.'_apply'("spaces")
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

.end # WSubId_297


.sub '' :anon :subid('WSubId_298') :outer('WSubId_297')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_3'
.const 'Sub' WSubId_299 = "WSubId_299"
# Body
# {
    $P2 = __ARG_3.'_apply'("stmt")
store_lex '__WLEX_3', $P2
    set $P2, WSubId_299
    __ARG_3.'_lookahead'($P2)
    find_lex $P2, '__WLEX_3'
    .return($P2)
# }

.end # WSubId_298


.sub '' :anon :subid('WSubId_299') :outer('WSubId_298')
        .param pmc __ARG_4
.const 'Sub' WSubId_300 = "WSubId_300"
.const 'Sub' WSubId_301 = "WSubId_301"
# Body
# {
    set $P1, WSubId_300
    set $P2, WSubId_301
    .tailcall __ARG_4.'_or'($P1, $P2)
# }

.end # WSubId_299


.sub '' :anon :subid('WSubId_300') :outer('WSubId_299')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("expr")
# }

.end # WSubId_300


.sub '' :anon :subid('WSubId_301') :outer('WSubId_299')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("stmt")
# }

.end # WSubId_301


.sub '' :anon :subid('WSubId_302') :outer('WSubId_297')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_7.'_apply'("expr")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "return"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_302


.sub '' :anon :subid('WSubId_303') :outer('WSubId_297')
        .param pmc __ARG_8
# Body
# {
    .tailcall __ARG_8.'_apply'("stmt")
# }

.end # WSubId_303


.sub 'semAction' :subid('WSubId_304') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_305 = "WSubId_305"
.const 'Sub' WSubId_306 = "WSubId_306"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    set $P3, WSubId_305
    newclosure $P4, WSubId_306
    .tailcall self.'_or'($P3, $P4)
# }

.end # semAction


.sub '' :anon :subid('WSubId_305') :outer('WSubId_304')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("curlySemAction")
# }

.end # WSubId_305


.sub '' :anon :subid('WSubId_306') :outer('WSubId_304')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("primExpr")
store_lex '__WLEX_1', $P2
    __ARG_2.'_apply'("spaces")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_306

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedSemActionParser' ]
    get_class $P1, [ 'WinxedParser' ]
    addparent $P0, $P1
.end
.namespace [ 'WinxedTranslator' ]

.sub 'trans' :subid('WSubId_307') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_308 = "WSubId_308"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var t: $P2
    null $P2
# var ans: $P3
    null $P3
    newclosure $P4, WSubId_308
    .tailcall $P4(self)
# }

.end # trans


.sub '' :anon :subid('WSubId_308') :outer('WSubId_307')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_309 = "WSubId_309"
# Body
# {
    newclosure $P3, WSubId_309
    __ARG_1.'_form'($P3)
    find_lex $P3, '__WLEX_2'
    .return($P3)
# }

.end # WSubId_308


.sub '' :anon :subid('WSubId_309') :outer('WSubId_308')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P3
    find_lex $P4, '__WLEX_1'
    $P3 = __ARG_2.'_applyWithArgs'("apply", $P4)
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_309


.sub 'curlyTrans' :subid('WSubId_310') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_311 = "WSubId_311"
.const 'Sub' WSubId_313 = "WSubId_313"
.const 'Sub' WSubId_316 = "WSubId_316"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var r: $P2
    null $P2
# var rs: $P3
    null $P3
    newclosure $P4, WSubId_311
    newclosure $P5, WSubId_313
    newclosure $P6, WSubId_316
    .tailcall self.'_or'($P4, $P5, $P6)
# }

.end # curlyTrans


.sub '' :anon :subid('WSubId_311') :outer('WSubId_310')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_312 = "WSubId_312"
# Body
# {
    newclosure $P2, WSubId_312
    __ARG_1.'_form'($P2)
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_311


.sub '' :anon :subid('WSubId_312') :outer('WSubId_311')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("exactly", "begin")
    $P2 = __ARG_2.'_apply'("curlyTrans")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_312


.sub '' :anon :subid('WSubId_313') :outer('WSubId_310')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_314 = "WSubId_314"
# Body
# {
    newclosure $P2, WSubId_314
    __ARG_3.'_form'($P2)
    find_lex $P2, '__WLEX_2'
# predefined join
    join $S1, "", $P2
    concat $S2, "{", $S1
    concat $S2, $S2, "}"
    .return($S2)
# }

.end # WSubId_313


.sub '' :anon :subid('WSubId_314') :outer('WSubId_313')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_315 = "WSubId_315"
# Body
# {
    __ARG_4.'_applyWithArgs'("exactly", "begin")
    set $P3, WSubId_315
    $P2 = __ARG_4.'_many'($P3)
store_lex '__WLEX_2', $P2
    .return(0)
# }

.end # WSubId_314


.sub '' :anon :subid('WSubId_315') :outer('WSubId_314')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("blockSemiTrans")
# }

.end # WSubId_315


.sub '' :anon :subid('WSubId_316') :outer('WSubId_310')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_6.'_apply'("blockSemiTrans")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "{", $S1
    concat $S2, $S2, "}"
    .return($S2)
# }

.end # WSubId_316


.sub 'blockSemiTrans' :subid('WSubId_317') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_318 = "WSubId_318"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var r: $P3
    null $P3
    newclosure $P4, WSubId_318
    .tailcall $P4(self)
# }

.end # blockSemiTrans


.sub '' :anon :subid('WSubId_318') :outer('WSubId_317')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_319 = "WSubId_319"
.const 'Sub' WSubId_320 = "WSubId_320"
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    newclosure $P4, WSubId_319
    newclosure $P5, WSubId_320
    $P3 = __ARG_1.'_or'($P4, $P5)
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_2'
    .return($P3)
# }

.end # WSubId_318


.sub '' :anon :subid('WSubId_319') :outer('WSubId_318')
        .param pmc __ARG_2
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
    __ARG_2.'_pred'($I1)
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_319


.sub '' :anon :subid('WSubId_320') :outer('WSubId_318')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_3.'_apply'("empty")
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, $S1, ";"
    .return($S2)
# }

.end # WSubId_320


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


.sub 'number' :subid('WSubId_321') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_322 = "WSubId_322"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var n: $P2
    null $P2
    newclosure $P3, WSubId_322
    .tailcall $P3(self)
# }

.end # number


.sub '' :anon :subid('WSubId_322') :outer('WSubId_321')
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

.end # WSubId_322


.sub 'string' :subid('WSubId_323') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_324 = "WSubId_324"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var s: $P2
    null $P2
    newclosure $P3, WSubId_324
    .tailcall $P3(self)
# }

.end # string


.sub '' :anon :subid('WSubId_324') :outer('WSubId_323')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall WSubId_785($P2)
# }

.end # WSubId_324


.sub 'arr' :subid('WSubId_325') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_326 = "WSubId_326"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_326
    .tailcall $P3(self)
# }

.end # arr


.sub '' :anon :subid('WSubId_326') :outer('WSubId_325')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_327 = "WSubId_327"
# Body
# {
    set $P3, WSubId_327
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    concat $S2, "[", $S1
    concat $S2, $S2, "]"
    .return($S2)
# }

.end # WSubId_326


.sub '' :anon :subid('WSubId_327') :outer('WSubId_326')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_327


.sub 'unop' :subid('WSubId_328') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_329 = "WSubId_329"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var op: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_329
    .tailcall $P4(self)
# }

.end # unop


.sub '' :anon :subid('WSubId_329') :outer('WSubId_328')
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

.end # WSubId_329


.sub 'getp' :subid('WSubId_330') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_331 = "WSubId_331"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var fd: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_331
    .tailcall $P4(self)
# }

.end # getp


.sub '' :anon :subid('WSubId_331') :outer('WSubId_330')
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

.end # WSubId_331


.sub 'geta' :subid('WSubId_332') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_333 = "WSubId_333"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var fd: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_333
    .tailcall $P4(self)
# }

.end # geta


.sub '' :anon :subid('WSubId_333') :outer('WSubId_332')
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

.end # WSubId_333


.sub 'get' :subid('WSubId_334') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_335 = "WSubId_335"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_335
    .tailcall $P3(self)
# }

.end # get


.sub '' :anon :subid('WSubId_335') :outer('WSubId_334')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_335


.sub 'set' :subid('WSubId_336') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_337 = "WSubId_337"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var lhs: $P2
    null $P2
# var rhs: $P3
    null $P3
    newclosure $P4, WSubId_337
    .tailcall $P4(self)
# }

.end # set


.sub '' :anon :subid('WSubId_337') :outer('WSubId_336')
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

.end # WSubId_337


.sub 'mset' :subid('WSubId_338') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_339 = "WSubId_339"
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
    newclosure $P5, WSubId_339
    .tailcall $P5(self)
# }

.end # mset


.sub '' :anon :subid('WSubId_339') :outer('WSubId_338')
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

.end # WSubId_339


.sub 'binop' :subid('WSubId_340') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_341 = "WSubId_341"
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
    newclosure $P5, WSubId_341
    .tailcall $P5(self)
# }

.end # binop


.sub '' :anon :subid('WSubId_341') :outer('WSubId_340')
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

.end # WSubId_341


.sub 'preop' :subid('WSubId_342') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_343 = "WSubId_343"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var op: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_343
    .tailcall $P4(self)
# }

.end # preop


.sub '' :anon :subid('WSubId_343') :outer('WSubId_342')
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

.end # WSubId_343


.sub 'postop' :subid('WSubId_344') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_345 = "WSubId_345"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var op: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_345
    .tailcall $P4(self)
# }

.end # postop


.sub '' :anon :subid('WSubId_345') :outer('WSubId_344')
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

.end # WSubId_345


.sub 'return' :subid('WSubId_346') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_347 = "WSubId_347"
.const 'Sub' WSubId_348 = "WSubId_348"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    set $P3, WSubId_347
    newclosure $P4, WSubId_348
    .tailcall self.'_or'($P3, $P4)
# }

.end # return


.sub '' :anon :subid('WSubId_347') :outer('WSubId_346')
        .param pmc __ARG_1
# Body
# {
    __ARG_1.'_apply'("null")
    .return("return")
# }

.end # WSubId_347


.sub '' :anon :subid('WSubId_348') :outer('WSubId_346')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "return ", $S1
    .return($S2)
# }

.end # WSubId_348


.sub 'if' :subid('WSubId_349') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_350 = "WSubId_350"
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
    newclosure $P5, WSubId_350
    .tailcall $P5(self)
# }

.end # if


.sub '' :anon :subid('WSubId_350') :outer('WSubId_349')
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

.end # WSubId_350


.sub 'condExpr' :subid('WSubId_351') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_352 = "WSubId_352"
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
    newclosure $P5, WSubId_352
    .tailcall $P5(self)
# }

.end # condExpr


.sub '' :anon :subid('WSubId_352') :outer('WSubId_351')
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

.end # WSubId_352


.sub 'while' :subid('WSubId_353') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_354 = "WSubId_354"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var cond: $P2
    null $P2
# var body: $P3
    null $P3
    newclosure $P4, WSubId_354
    .tailcall $P4(self)
# }

.end # while


.sub '' :anon :subid('WSubId_354') :outer('WSubId_353')
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

.end # WSubId_354


.sub 'doWhile' :subid('WSubId_355') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_356 = "WSubId_356"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var body: $P2
    null $P2
# var cond: $P3
    null $P3
    newclosure $P4, WSubId_356
    .tailcall $P4(self)
# }

.end # doWhile


.sub '' :anon :subid('WSubId_356') :outer('WSubId_355')
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

.end # WSubId_356


.sub 'for' :subid('WSubId_357') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_358 = "WSubId_358"
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
    newclosure $P6, WSubId_358
    .tailcall $P6(self)
# }

.end # for


.sub '' :anon :subid('WSubId_358') :outer('WSubId_357')
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

.end # WSubId_358


.sub 'forIn' :subid('WSubId_359') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_360 = "WSubId_360"
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
    newclosure $P5, WSubId_360
    .tailcall $P5(self)
# }

.end # forIn


.sub '' :anon :subid('WSubId_360') :outer('WSubId_359')
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

.end # WSubId_360


.sub 'using' :subid('WSubId_361') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_362 = "WSubId_362"
.const 'Sub' WSubId_363 = "WSubId_363"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var name: $P2
    null $P2
# var type: $P3
    null $P3
    newclosure $P4, WSubId_362
    newclosure $P5, WSubId_363
    .tailcall self.'_or'($P4, $P5)
# }

.end # using


.sub '' :anon :subid('WSubId_362') :outer('WSubId_361')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    __ARG_1.'_apply'("null")
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "using ", $S1
    .return($S2)
# }

.end # WSubId_362


.sub '' :anon :subid('WSubId_363') :outer('WSubId_361')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_2.'_apply'("anything")
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

.end # WSubId_363


.sub 'begin' :subid('WSubId_364') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_365 = "WSubId_365"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_365
    .tailcall $P3(self)
# }

.end # begin


.sub '' :anon :subid('WSubId_365') :outer('WSubId_364')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_366 = "WSubId_366"
# Body
# {
    set $P3, WSubId_366
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, "", $P2
    concat $S2, "{", $S1
    concat $S2, $S2, "}"
    .return($S2)
# }

.end # WSubId_365


.sub '' :anon :subid('WSubId_366') :outer('WSubId_365')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("blockSemiTrans")
# }

.end # WSubId_366


.sub 'top' :subid('WSubId_367') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_368 = "WSubId_368"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_368
    .tailcall $P3(self)
# }

.end # top


.sub '' :anon :subid('WSubId_368') :outer('WSubId_367')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_369 = "WSubId_369"
# Body
# {
    set $P3, WSubId_369
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, "", $P2
    .return($S1)
# }

.end # WSubId_368


.sub '' :anon :subid('WSubId_369') :outer('WSubId_368')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_369


.sub 'flag' :subid('WSubId_370') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_371 = "WSubId_371"
.const 'Sub' WSubId_372 = "WSubId_372"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var name: $P2
    null $P2
# var arg: $P3
    null $P3
    newclosure $P4, WSubId_371
    newclosure $P5, WSubId_372
    .tailcall self.'_or'($P4, $P5)
# }

.end # flag


.sub '' :anon :subid('WSubId_371') :outer('WSubId_370')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    __ARG_1.'_apply'("null")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_371


.sub '' :anon :subid('WSubId_372') :outer('WSubId_370')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_2.'_apply'("anything")
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

.end # WSubId_372


.sub 'flaglist' :subid('WSubId_373') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_374 = "WSubId_374"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var fs: $P2
    null $P2
    newclosure $P3, WSubId_374
    .tailcall $P3(self)
# }

.end # flaglist


.sub '' :anon :subid('WSubId_374') :outer('WSubId_373')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_375 = "WSubId_375"
# Body
# {
    set $P3, WSubId_375
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    .return($S1)
# }

.end # WSubId_374


.sub '' :anon :subid('WSubId_375') :outer('WSubId_374')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_375


.sub 'anonfunc' :subid('WSubId_376') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_377 = "WSubId_377"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var args: $P2
    null $P2
# var body: $P3
    null $P3
    newclosure $P4, WSubId_377
    .tailcall $P4(self)
# }

.end # anonfunc


.sub '' :anon :subid('WSubId_377') :outer('WSubId_376')
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

.end # WSubId_377


.sub 'funcdecl' :subid('WSubId_378') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_379 = "WSubId_379"
.const 'Sub' WSubId_380 = "WSubId_380"
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
    newclosure $P6, WSubId_379
    newclosure $P7, WSubId_380
    .tailcall self.'_or'($P6, $P7)
# }

.end # funcdecl


.sub '' :anon :subid('WSubId_379') :outer('WSubId_378')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    __ARG_1.'_apply'("null")
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P4
    $P4 = __ARG_1.'_apply'("curlyTrans")
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

.end # WSubId_379


.sub '' :anon :subid('WSubId_380') :outer('WSubId_378')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_4'
    find_lex $P3, '__WLEX_2'
    find_lex $P4, '__WLEX_3'
# Body
# {
    $P5 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P5
    $P5 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_4', $P5
    $P5 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_2', $P5
    $P5 = __ARG_2.'_apply'("curlyTrans")
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

.end # WSubId_380


.sub 'classdecl' :subid('WSubId_381') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_382 = "WSubId_382"
.const 'Sub' WSubId_384 = "WSubId_384"
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
    newclosure $P5, WSubId_382
    newclosure $P6, WSubId_384
    .tailcall self.'_or'($P5, $P6)
# }

.end # classdecl


.sub '' :anon :subid('WSubId_382') :outer('WSubId_381')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_383 = "WSubId_383"
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    set $P3, WSubId_383
    __ARG_1.'_form'($P3)
    $P3 = __ARG_1.'_apply'("curlyTrans")
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

.end # WSubId_382


.sub '' :anon :subid('WSubId_383') :outer('WSubId_382')
        .param pmc __ARG_2
# Body
# {
    .return()
# }

.end # WSubId_383


.sub '' :anon :subid('WSubId_384') :outer('WSubId_381')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_3'
    find_lex $P3, '__WLEX_2'
# Body
# {
    $P4 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_3', $P4
    $P4 = __ARG_3.'_apply'("curlyTrans")
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

.end # WSubId_384


.sub 'call' :subid('WSubId_385') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_386 = "WSubId_386"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var fn: $P2
    null $P2
# var args: $P3
    null $P3
    newclosure $P4, WSubId_386
    .tailcall $P4(self)
# }

.end # call


.sub '' :anon :subid('WSubId_386') :outer('WSubId_385')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_387 = "WSubId_387"
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    set $P4, WSubId_387
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

.end # WSubId_386


.sub '' :anon :subid('WSubId_387') :outer('WSubId_386')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_387


.sub 'send' :subid('WSubId_388') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_389 = "WSubId_389"
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
    newclosure $P5, WSubId_389
    .tailcall $P5(self)
# }

.end # send


.sub '' :anon :subid('WSubId_389') :outer('WSubId_388')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_390 = "WSubId_390"
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P4
    set $P5, WSubId_390
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

.end # WSubId_389


.sub '' :anon :subid('WSubId_390') :outer('WSubId_389')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_390


.sub 'new' :subid('WSubId_391') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_392 = "WSubId_392"
.const 'Sub' WSubId_393 = "WSubId_393"
.const 'Sub' WSubId_394 = "WSubId_394"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var cls: $P2
    null $P2
# var arg: $P3
    null $P3
    newclosure $P4, WSubId_392
    newclosure $P5, WSubId_393
    newclosure $P6, WSubId_394
    .tailcall self.'_or'($P4, $P5, $P6)
# }

.end # new


.sub '' :anon :subid('WSubId_392') :outer('WSubId_391')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("exactly", 0)
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "new ", $S1
    .return($S2)
# }

.end # WSubId_392


.sub '' :anon :subid('WSubId_393') :outer('WSubId_391')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P2
    __ARG_2.'_applyWithArgs'("exactly", 1)
    __ARG_2.'_apply'("null")
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "new ", $S1
    concat $S2, $S2, "()"
    .return($S2)
# }

.end # WSubId_393


.sub '' :anon :subid('WSubId_394') :outer('WSubId_391')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P3
    __ARG_3.'_applyWithArgs'("exactly", 1)
    $P3 = __ARG_3.'_apply'("trans")
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

.end # WSubId_394


.sub 'var' :subid('WSubId_395') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_396 = "WSubId_396"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var type: $P2
    null $P2
# var name: $P3
    null $P3
    newclosure $P4, WSubId_396
    .tailcall $P4(self)
# }

.end # var


.sub '' :anon :subid('WSubId_396') :outer('WSubId_395')
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

.end # WSubId_396


.sub 'varinit' :subid('WSubId_397') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_398 = "WSubId_398"
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
    newclosure $P5, WSubId_398
    .tailcall $P5(self)
# }

.end # varinit


.sub '' :anon :subid('WSubId_398') :outer('WSubId_397')
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

.end # WSubId_398


.sub 'throw' :subid('WSubId_399') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_400 = "WSubId_400"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_400
    .tailcall $P3(self)
# }

.end # throw


.sub '' :anon :subid('WSubId_400') :outer('WSubId_399')
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

.end # WSubId_400


.sub 'try' :subid('WSubId_401') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_402 = "WSubId_402"
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
    newclosure $P5, WSubId_402
    .tailcall $P5(self)
# }

.end # try


.sub '' :anon :subid('WSubId_402') :outer('WSubId_401')
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

.end # WSubId_402


.sub 'json' :subid('WSubId_403') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_404 = "WSubId_404"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var props: $P2
    null $P2
    newclosure $P3, WSubId_404
    .tailcall $P3(self)
# }

.end # json


.sub '' :anon :subid('WSubId_404') :outer('WSubId_403')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_405 = "WSubId_405"
# Body
# {
    set $P3, WSubId_405
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    concat $S2, "({", $S1
    concat $S2, $S2, "})"
    .return($S2)
# }

.end # WSubId_404


.sub '' :anon :subid('WSubId_405') :outer('WSubId_404')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_405


.sub 'binding' :subid('WSubId_406') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_407 = "WSubId_407"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var name: $P2
    null $P2
# var val: $P3
    null $P3
    newclosure $P4, WSubId_407
    .tailcall $P4(self)
# }

.end # binding


.sub '' :anon :subid('WSubId_407') :outer('WSubId_406')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P3
# predefined string
    find_lex $P4, '__WLEX_1'
    $P3 = WSubId_785($P4)
    set $S1, $P3
# predefined string
    find_lex $P5, '__WLEX_2'
    set $S2, $P5
    concat $S3, $S1, ": "
    concat $S3, $S3, $S2
    .return($S3)
# }

.end # WSubId_407


.sub 'switch' :subid('WSubId_408') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_409 = "WSubId_409"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var cases: $P3
    null $P3
    newclosure $P4, WSubId_409
    .tailcall $P4(self)
# }

.end # switch


.sub '' :anon :subid('WSubId_409') :outer('WSubId_408')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_410 = "WSubId_410"
# Body
# {
    $P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P3
    set $P4, WSubId_410
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

.end # WSubId_409


.sub '' :anon :subid('WSubId_410') :outer('WSubId_409')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_410


.sub 'case' :subid('WSubId_411') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_412 = "WSubId_412"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_412
    .tailcall $P4(self)
# }

.end # case


.sub '' :anon :subid('WSubId_412') :outer('WSubId_411')
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

.end # WSubId_412


.sub 'default' :subid('WSubId_413') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_414 = "WSubId_414"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var y: $P2
    null $P2
    newclosure $P3, WSubId_414
    .tailcall $P3(self)
# }

.end # default


.sub '' :anon :subid('WSubId_414') :outer('WSubId_413')
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

.end # WSubId_414

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedTranslator' ]
    get_class $P1, [ 'OMeta' ]
    addparent $P0, $P1
.end
.namespace [ 'OMetaParser' ]

.sub 'fromTo' :subid('WSubId_415') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_416 = "WSubId_416"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_416
    .tailcall $P4(self)
# }

.end # fromTo


.sub '' :anon :subid('WSubId_416') :outer('WSubId_415')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_417 = "WSubId_417"
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_1'
    __ARG_1.'_applyWithArgs'("seq", $P3)
    newclosure $P3, WSubId_417
    __ARG_1.'_many'($P3)
    find_lex $P3, '__WLEX_2'
    .tailcall __ARG_1.'_applyWithArgs'("seq", $P3)
# }

.end # WSubId_416


.sub '' :anon :subid('WSubId_417') :outer('WSubId_416')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_418 = "WSubId_418"
# Body
# {
    newclosure $P2, WSubId_418
    __ARG_2.'_not'($P2)
    .tailcall __ARG_2.'_apply'("char")
# }

.end # WSubId_417


.sub '' :anon :subid('WSubId_418') :outer('WSubId_417')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
# Body
# {
    find_lex $P2, '__WLEX_2'
    .tailcall __ARG_3.'_applyWithArgs'("seq", $P2)
# }

.end # WSubId_418


.sub 'space' :subid('WSubId_419') :method
.const 'Sub' WSubId_420 = "WSubId_420"
.const 'Sub' WSubId_421 = "WSubId_421"
.const 'Sub' WSubId_422 = "WSubId_422"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_420
    set $P3, WSubId_421
    set $P4, WSubId_422
    .tailcall self.'_or'($P2, $P3, $P4)
# }

.end # space


.sub '' :anon :subid('WSubId_420') :outer('WSubId_419')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_superApplyWithArgs'("Parser", 'space')
# }

.end # WSubId_420


.sub '' :anon :subid('WSubId_421') :outer('WSubId_419')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_applyWithArgs'("fromTo", "//", "\n")
# }

.end # WSubId_421


.sub '' :anon :subid('WSubId_422') :outer('WSubId_419')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("fromTo", "/*", "*/")
# }

.end # WSubId_422


.sub 'nameFirst' :subid('WSubId_423') :method
.const 'Sub' WSubId_424 = "WSubId_424"
.const 'Sub' WSubId_426 = "WSubId_426"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_424
    set $P3, WSubId_426
    .tailcall self.'_or'($P2, $P3)
# }

.end # nameFirst


.sub '' :anon :subid('WSubId_424') :outer('WSubId_423')
        .param pmc __ARG_1
.const 'Sub' WSubId_425 = "WSubId_425"
# Body
# {
    set $P1, WSubId_425
    .tailcall $P1(__ARG_1)
# }

.end # WSubId_424


.sub '' :anon :subid('WSubId_425') :outer('WSubId_424')
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

.end # WSubId_425


.sub '' :anon :subid('WSubId_426') :outer('WSubId_423')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("letter")
# }

.end # WSubId_426


.sub 'nameRest' :subid('WSubId_427') :method
.const 'Sub' WSubId_428 = "WSubId_428"
.const 'Sub' WSubId_429 = "WSubId_429"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_428
    set $P3, WSubId_429
    .tailcall self.'_or'($P2, $P3)
# }

.end # nameRest


.sub '' :anon :subid('WSubId_428') :outer('WSubId_427')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("nameFirst")
# }

.end # WSubId_428


.sub '' :anon :subid('WSubId_429') :outer('WSubId_427')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("digit")
# }

.end # WSubId_429


.sub 'tsName' :subid('WSubId_430') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_431 = "WSubId_431"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_431
    .tailcall $P3(self)
# }

.end # tsName


.sub '' :anon :subid('WSubId_431') :outer('WSubId_430')
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

.end # WSubId_431


.sub 'name' :subid('WSubId_432') :method
.const 'Sub' WSubId_433 = "WSubId_433"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_433
    .tailcall $P2(self)
# }

.end # name


.sub '' :anon :subid('WSubId_433') :outer('WSubId_432')
        .param pmc __ARG_1
# Body
# {
    __ARG_1.'_apply'("spaces")
    .tailcall __ARG_1.'_apply'("tsName")
# }

.end # WSubId_433


.sub 'eChar' :subid('WSubId_434') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_435 = "WSubId_435"
.const 'Sub' WSubId_438 = "WSubId_438"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var c: $P2
    null $P2
    newclosure $P3, WSubId_435
    set $P4, WSubId_438
    .tailcall self.'_or'($P3, $P4)
# }

.end # eChar


.sub '' :anon :subid('WSubId_435') :outer('WSubId_434')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_436 = "WSubId_436"
# Body
# {
    newclosure $P2, WSubId_436
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_435


.sub '' :anon :subid('WSubId_436') :outer('WSubId_435')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_437 = "WSubId_437"
# Body
# {
# switch
    $P2 = __ARG_2.'_apply'('anything')
    set $S1, $P2
    set $S2, "\\"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_437
    .tailcall $P3(__ARG_2)
  __label_2: # default
    $P4 = __ARG_2.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_436


.sub '' :anon :subid('WSubId_437') :outer('WSubId_436')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_784 = "WSubId_784"
# Body
# {
    $P2 = __ARG_3.'_apply'("char")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "\\", $S1
    .tailcall WSubId_784($S2)
# }

.end # WSubId_437


.sub '' :anon :subid('WSubId_438') :outer('WSubId_434')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("char")
# }

.end # WSubId_438


.sub 'tsString' :subid('WSubId_439') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_440 = "WSubId_440"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_440
    .tailcall $P3(self)
# }

.end # tsString


.sub '' :anon :subid('WSubId_440') :outer('WSubId_439')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_441 = "WSubId_441"
# Body
# {
    __ARG_1.'_applyWithArgs'("exactly", "'")
    set $P3, WSubId_441
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("exactly", "'")
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, "", $P2
    .return($S1)
# }

.end # WSubId_440


.sub '' :anon :subid('WSubId_441') :outer('WSubId_440')
        .param pmc __ARG_2
.const 'Sub' WSubId_442 = "WSubId_442"
# Body
# {
    set $P1, WSubId_442
    __ARG_2.'_not'($P1)
    .tailcall __ARG_2.'_apply'("eChar")
# }

.end # WSubId_441


.sub '' :anon :subid('WSubId_442') :outer('WSubId_441')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("exactly", "'")
# }

.end # WSubId_442


.sub 'characters' :subid('WSubId_443') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_444 = "WSubId_444"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_444
    .tailcall $P3(self)
# }

.end # characters


.sub '' :anon :subid('WSubId_444') :outer('WSubId_443')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_445 = "WSubId_445"
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    __ARG_1.'_applyWithArgs'("exactly", "`")
    __ARG_1.'_applyWithArgs'("exactly", "`")
    set $P3, WSubId_445
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
    $P4 = WSubId_785($S1)
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_444


.sub '' :anon :subid('WSubId_445') :outer('WSubId_444')
        .param pmc __ARG_2
.const 'Sub' WSubId_446 = "WSubId_446"
# Body
# {
    set $P1, WSubId_446
    __ARG_2.'_not'($P1)
    .tailcall __ARG_2.'_apply'("eChar")
# }

.end # WSubId_445


.sub '' :anon :subid('WSubId_446') :outer('WSubId_445')
        .param pmc __ARG_3
# Body
# {
    __ARG_3.'_applyWithArgs'("exactly", "'")
    .tailcall __ARG_3.'_applyWithArgs'("exactly", "'")
# }

.end # WSubId_446


.sub 'sCharacters' :subid('WSubId_447') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_448 = "WSubId_448"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_448
    .tailcall $P3(self)
# }

.end # sCharacters


.sub '' :anon :subid('WSubId_448') :outer('WSubId_447')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_449 = "WSubId_449"
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    __ARG_1.'_applyWithArgs'("exactly", "\"")
    set $P3, WSubId_449
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
    $P4 = WSubId_785($S1)
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_448


.sub '' :anon :subid('WSubId_449') :outer('WSubId_448')
        .param pmc __ARG_2
.const 'Sub' WSubId_450 = "WSubId_450"
# Body
# {
    set $P1, WSubId_450
    __ARG_2.'_not'($P1)
    .tailcall __ARG_2.'_apply'("eChar")
# }

.end # WSubId_449


.sub '' :anon :subid('WSubId_450') :outer('WSubId_449')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_450


.sub 'string' :subid('WSubId_451') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_452 = "WSubId_452"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_452
    .tailcall $P3(self)
# }

.end # string


.sub '' :anon :subid('WSubId_452') :outer('WSubId_451')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_453 = "WSubId_453"
.const 'Sub' WSubId_455 = "WSubId_455"
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    set $P3, WSubId_453
    set $P4, WSubId_455
    $P2 = __ARG_1.'_or'($P3, $P4)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "App"
    push $P2, $P3
    box $P3, "exactly"
    push $P2, $P3
    find_lex $P5, '__WLEX_1'
    $P4 = WSubId_785($P5)
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_452


.sub '' :anon :subid('WSubId_453') :outer('WSubId_452')
        .param pmc __ARG_2
.const 'Sub' WSubId_454 = "WSubId_454"
# Body
# {
    set $P1, WSubId_454
    $P1(__ARG_2)
    .tailcall __ARG_2.'_apply'("tsName")
# }

.end # WSubId_453


.sub '' :anon :subid('WSubId_454') :outer('WSubId_453')
        .param pmc __ARG_3
# Body
# {
# switch
    $P1 = __ARG_3.'_apply'('anything')
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
    $P2 = __ARG_3.'_fail'()
    throw $P2
  __label_1: # switch end
# }

.end # WSubId_454


.sub '' :anon :subid('WSubId_455') :outer('WSubId_452')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("tsString")
# }

.end # WSubId_455


.sub 'number' :subid('WSubId_456') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_457 = "WSubId_457"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var sign: $P2
    null $P2
# var ds: $P3
    null $P3
    newclosure $P4, WSubId_457
    .tailcall $P4(self)
# }

.end # number


.sub '' :anon :subid('WSubId_457') :outer('WSubId_456')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_458 = "WSubId_458"
.const 'Sub' WSubId_460 = "WSubId_460"
.const 'Sub' WSubId_461 = "WSubId_461"
# Body
# {
    set $P4, WSubId_458
    set $P5, WSubId_460
    $P3 = __ARG_1.'_or'($P4, $P5)
store_lex '__WLEX_1', $P3
    set $P4, WSubId_461
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

.end # WSubId_457


.sub '' :anon :subid('WSubId_458') :outer('WSubId_457')
        .param pmc __ARG_2
.const 'Sub' WSubId_459 = "WSubId_459"
# Body
# {
    set $P1, WSubId_459
    .tailcall $P1(__ARG_2)
# }

.end # WSubId_458


.sub '' :anon :subid('WSubId_459') :outer('WSubId_458')
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

.end # WSubId_459


.sub '' :anon :subid('WSubId_460') :outer('WSubId_457')
        .param pmc __ARG_4
# Body
# {
    __ARG_4.'_apply'("empty")
    .return("")
# }

.end # WSubId_460


.sub '' :anon :subid('WSubId_461') :outer('WSubId_457')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("digit")
# }

.end # WSubId_461


.sub 'keyword' :subid('WSubId_462') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_463 = "WSubId_463"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_463
    .tailcall $P3(self)
# }

.end # keyword


.sub '' :anon :subid('WSubId_463') :outer('WSubId_462')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_464 = "WSubId_464"
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    __ARG_1.'_applyWithArgs'("token", $P2)
    set $P2, WSubId_464
    __ARG_1.'_not'($P2)
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_463


.sub '' :anon :subid('WSubId_464') :outer('WSubId_463')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("letterOrDigit")
# }

.end # WSubId_464


.sub 'args' :subid('WSubId_465') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_466 = "WSubId_466"
.const 'Sub' WSubId_469 = "WSubId_469"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_466
    set $P4, WSubId_469
    .tailcall self.'_or'($P3, $P4)
# }

.end # args


.sub '' :anon :subid('WSubId_466') :outer('WSubId_465')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_467 = "WSubId_467"
# Body
# {
    newclosure $P2, WSubId_467
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_466


.sub '' :anon :subid('WSubId_467') :outer('WSubId_466')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_468 = "WSubId_468"
# Body
# {
# switch
    $P2 = __ARG_2.'_apply'('anything')
    set $S1, $P2
    set $S2, "("
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_468
    .tailcall $P3(__ARG_2)
  __label_2: # default
    $P4 = __ARG_2.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_467


.sub '' :anon :subid('WSubId_468') :outer('WSubId_467')
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

.end # WSubId_468


.sub '' :anon :subid('WSubId_469') :outer('WSubId_465')
        .param pmc __ARG_4
# Body
# {
    __ARG_4.'_apply'("empty")
    root_new $P1, ['parrot';'ResizablePMCArray']
    .return($P1)
# }

.end # WSubId_469


.sub 'application' :subid('WSubId_470') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_471 = "WSubId_471"
.const 'Sub' WSubId_472 = "WSubId_472"
.const 'Sub' WSubId_473 = "WSubId_473"
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
    newclosure $P5, WSubId_471
    newclosure $P6, WSubId_472
    newclosure $P7, WSubId_473
    .tailcall self.'_or'($P5, $P6, $P7)
# }

.end # application


.sub '' :anon :subid('WSubId_471') :outer('WSubId_470')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "^")
    $P3 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("args")
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

.end # WSubId_471


.sub '' :anon :subid('WSubId_472') :outer('WSubId_470')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_1'
    find_lex $P3, '__WLEX_2'
# Body
# {
    $P4 = __ARG_2.'_apply'("name")
store_lex '__WLEX_3', $P4
    __ARG_2.'_applyWithArgs'("token", ".")
    $P4 = __ARG_2.'_apply'("name")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_2.'_apply'("args")
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

.end # WSubId_472


.sub '' :anon :subid('WSubId_473') :outer('WSubId_470')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_3.'_apply'("name")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_3.'_apply'("args")
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "App"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_473


.sub 'hostExpr' :subid('WSubId_474') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_475 = "WSubId_475"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_475
    .tailcall $P3(self)
# }

.end # hostExpr


.sub '' :anon :subid('WSubId_475') :outer('WSubId_474')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_applyWithArgs'("foreign", 'WinxedSemActionParser', 'expr')
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_1.'_applyWithArgs'("foreign", 'WinxedTranslator', 'trans', $P2)
# }

.end # WSubId_475


.sub 'curlyHostExpr' :subid('WSubId_476') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_477 = "WSubId_477"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_477
    .tailcall $P3(self)
# }

.end # curlyHostExpr


.sub '' :anon :subid('WSubId_477') :outer('WSubId_476')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_applyWithArgs'("foreign", 'WinxedSemActionParser', 'curlySemAction')
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_1.'_applyWithArgs'("foreign", 'WinxedTranslator', 'trans', $P2)
# }

.end # WSubId_477


.sub 'primHostExpr' :subid('WSubId_478') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_479 = "WSubId_479"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_479
    .tailcall $P3(self)
# }

.end # primHostExpr


.sub '' :anon :subid('WSubId_479') :outer('WSubId_478')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_applyWithArgs'("foreign", 'WinxedSemActionParser', 'semAction')
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_1.'_applyWithArgs'("foreign", 'WinxedTranslator', 'trans', $P2)
# }

.end # WSubId_479


.sub 'atomicHostExpr' :subid('WSubId_480') :method
.const 'Sub' WSubId_481 = "WSubId_481"
.const 'Sub' WSubId_482 = "WSubId_482"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_481
    set $P3, WSubId_482
    .tailcall self.'_or'($P2, $P3)
# }

.end # atomicHostExpr


.sub '' :anon :subid('WSubId_481') :outer('WSubId_480')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("curlyHostExpr")
# }

.end # WSubId_481


.sub '' :anon :subid('WSubId_482') :outer('WSubId_480')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("primHostExpr")
# }

.end # WSubId_482


.sub 'semAction' :subid('WSubId_483') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_484 = "WSubId_484"
.const 'Sub' WSubId_485 = "WSubId_485"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_484
    newclosure $P4, WSubId_485
    .tailcall self.'_or'($P3, $P4)
# }

.end # semAction


.sub '' :anon :subid('WSubId_484') :outer('WSubId_483')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("curlyHostExpr")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Act"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_484


.sub '' :anon :subid('WSubId_485') :outer('WSubId_483')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "!")
    $P2 = __ARG_2.'_apply'("atomicHostExpr")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Act"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_485


.sub 'arrSemAction' :subid('WSubId_486') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_487 = "WSubId_487"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_487
    .tailcall $P3(self)
# }

.end # arrSemAction


.sub '' :anon :subid('WSubId_487') :outer('WSubId_486')
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

.end # WSubId_487


.sub 'semPred' :subid('WSubId_488') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_489 = "WSubId_489"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_489
    .tailcall $P3(self)
# }

.end # semPred


.sub '' :anon :subid('WSubId_489') :outer('WSubId_488')
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

.end # WSubId_489


.sub 'expr' :subid('WSubId_490') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_491 = "WSubId_491"
.const 'Sub' WSubId_493 = "WSubId_493"
.const 'Sub' WSubId_495 = "WSubId_495"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var xs: $P3
    null $P3
    newclosure $P4, WSubId_491
    newclosure $P5, WSubId_493
    set $P6, WSubId_495
    .tailcall self.'_or'($P4, $P5, $P6)
# }

.end # expr


.sub '' :anon :subid('WSubId_491') :outer('WSubId_490')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_492 = "WSubId_492"
# Body
# {
    $P3 = __ARG_1.'_applyWithArgs'("expr5", 1)
store_lex '__WLEX_1', $P3
    set $P4, WSubId_492
    $P3 = __ARG_1.'_many1'($P4)
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "Or"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_491


.sub '' :anon :subid('WSubId_492') :outer('WSubId_491')
        .param pmc __ARG_2
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "|")
    .tailcall __ARG_2.'_applyWithArgs'("expr5", 1)
# }

.end # WSubId_492


.sub '' :anon :subid('WSubId_493') :outer('WSubId_490')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_494 = "WSubId_494"
# Body
# {
    $P3 = __ARG_3.'_applyWithArgs'("expr5", 1)
store_lex '__WLEX_1', $P3
    set $P4, WSubId_494
    $P3 = __ARG_3.'_many1'($P4)
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "XOr"
    push $P3, $P4
    find_lex $P5, '__WLEX_1'
    push $P3, $P5
    find_lex $P6, '__WLEX_2'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_493


.sub '' :anon :subid('WSubId_494') :outer('WSubId_493')
        .param pmc __ARG_4
# Body
# {
    __ARG_4.'_applyWithArgs'("token", "||")
    .tailcall __ARG_4.'_applyWithArgs'("expr5", 1)
# }

.end # WSubId_494


.sub '' :anon :subid('WSubId_495') :outer('WSubId_490')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_applyWithArgs'("expr5", 0)
# }

.end # WSubId_495


.sub 'expr5' :subid('WSubId_496') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_497 = "WSubId_497"
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
    newclosure $P5, WSubId_497
    .tailcall $P5(self)
# }

.end # expr5


.sub '' :anon :subid('WSubId_497') :outer('WSubId_496')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_498 = "WSubId_498"
.const 'Sub' WSubId_500 = "WSubId_500"
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    newclosure $P4, WSubId_498
    newclosure $P5, WSubId_500
    .tailcall __ARG_1.'_or'($P4, $P5)
# }

.end # WSubId_497


.sub '' :anon :subid('WSubId_498') :outer('WSubId_497')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_499 = "WSubId_499"
# Body
# {
    $P3 = __ARG_2.'_apply'("interleavePart")
store_lex '__WLEX_2', $P3
    set $P4, WSubId_499
    $P3 = __ARG_2.'_many1'($P4)
store_lex '__WLEX_3', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "Interleave"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_3'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_498


.sub '' :anon :subid('WSubId_499') :outer('WSubId_498')
        .param pmc __ARG_3
# Body
# {
    __ARG_3.'_applyWithArgs'("token", "&&")
    .tailcall __ARG_3.'_apply'("interleavePart")
# }

.end # WSubId_499


.sub '' :anon :subid('WSubId_500') :outer('WSubId_497')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_4.'_applyWithArgs'("expr4", $P2)
# }

.end # WSubId_500


.sub 'interleavePart' :subid('WSubId_501') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_502 = "WSubId_502"
.const 'Sub' WSubId_503 = "WSubId_503"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var part: $P2
    null $P2
    newclosure $P3, WSubId_502
    newclosure $P4, WSubId_503
    .tailcall self.'_or'($P3, $P4)
# }

.end # interleavePart


.sub '' :anon :subid('WSubId_502') :outer('WSubId_501')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "(")
    $P2 = __ARG_1.'_applyWithArgs'("expr4", 1)
store_lex '__WLEX_1', $P2
    __ARG_1.'_applyWithArgs'("token", ")")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "1"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_502


.sub '' :anon :subid('WSubId_503') :outer('WSubId_501')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_applyWithArgs'("expr4", 1)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_2.'_applyWithArgs'("modedIPart", $P2)
# }

.end # WSubId_503


.sub 'modedIPart' :subid('WSubId_504') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_505 = "WSubId_505"
.const 'Sub' WSubId_508 = "WSubId_508"
.const 'Sub' WSubId_511 = "WSubId_511"
.const 'Sub' WSubId_514 = "WSubId_514"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var part: $P2
    null $P2
    newclosure $P3, WSubId_505
    newclosure $P4, WSubId_508
    newclosure $P5, WSubId_511
    newclosure $P6, WSubId_514
    .tailcall self.'_or'($P3, $P4, $P5, $P6)
# }

.end # modedIPart


.sub '' :anon :subid('WSubId_505') :outer('WSubId_504')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_506 = "WSubId_506"
# Body
# {
    newclosure $P2, WSubId_506
    __ARG_1.'_form'($P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "*"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_505


.sub '' :anon :subid('WSubId_506') :outer('WSubId_505')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_507 = "WSubId_507"
# Body
# {
    __ARG_2.'_applyWithArgs'("exactly", "And")
    newclosure $P2, WSubId_507
    .tailcall __ARG_2.'_form'($P2)
# }

.end # WSubId_506


.sub '' :anon :subid('WSubId_507') :outer('WSubId_506')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("exactly", "Many")
    $P2 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_507


.sub '' :anon :subid('WSubId_508') :outer('WSubId_504')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_509 = "WSubId_509"
# Body
# {
    newclosure $P2, WSubId_509
    __ARG_4.'_form'($P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "+"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_508


.sub '' :anon :subid('WSubId_509') :outer('WSubId_508')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_510 = "WSubId_510"
# Body
# {
    __ARG_5.'_applyWithArgs'("exactly", "And")
    newclosure $P2, WSubId_510
    .tailcall __ARG_5.'_form'($P2)
# }

.end # WSubId_509


.sub '' :anon :subid('WSubId_510') :outer('WSubId_509')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_6.'_applyWithArgs'("exactly", "Many1")
    $P2 = __ARG_6.'_apply'("anything")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_510


.sub '' :anon :subid('WSubId_511') :outer('WSubId_504')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_512 = "WSubId_512"
# Body
# {
    newclosure $P2, WSubId_512
    __ARG_7.'_form'($P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "?"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_511


.sub '' :anon :subid('WSubId_512') :outer('WSubId_511')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_513 = "WSubId_513"
# Body
# {
    __ARG_8.'_applyWithArgs'("exactly", "And")
    newclosure $P2, WSubId_513
    .tailcall __ARG_8.'_form'($P2)
# }

.end # WSubId_512


.sub '' :anon :subid('WSubId_513') :outer('WSubId_512')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_9.'_applyWithArgs'("exactly", "Opt")
    $P2 = __ARG_9.'_apply'("anything")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_513


.sub '' :anon :subid('WSubId_514') :outer('WSubId_504')
        .param pmc __ARG_10
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_10.'_apply'("anything")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "1"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_514


.sub 'expr4' :subid('WSubId_515') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_516 = "WSubId_516"
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
    newclosure $P5, WSubId_516
    .tailcall $P5(self)
# }

.end # expr4


.sub '' :anon :subid('WSubId_516') :outer('WSubId_515')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_517 = "WSubId_517"
.const 'Sub' WSubId_519 = "WSubId_519"
.const 'Sub' WSubId_521 = "WSubId_521"
# Body
# {
    $P4 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P4
    newclosure $P4, WSubId_517
    newclosure $P5, WSubId_519
    newclosure $P6, WSubId_521
    .tailcall __ARG_1.'_or'($P4, $P5, $P6)
# }

.end # WSubId_516


.sub '' :anon :subid('WSubId_517') :outer('WSubId_516')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_518 = "WSubId_518"
# Body
# {
    set $P4, WSubId_518
    $P3 = __ARG_2.'_many'($P4)
store_lex '__WLEX_2', $P3
    $P3 = __ARG_2.'_apply'("arrSemAction")
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

.end # WSubId_517


.sub '' :anon :subid('WSubId_518') :outer('WSubId_517')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("expr3")
# }

.end # WSubId_518


.sub '' :anon :subid('WSubId_519') :outer('WSubId_516')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_520 = "WSubId_520"
# Body
# {
    find_lex $P3, '__WLEX_1'
    __ARG_4.'_pred'($P3)
    set $P4, WSubId_520
    $P3 = __ARG_4.'_many1'($P4)
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "And"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    .tailcall $P3.'append'($P5)
# }

.end # WSubId_519


.sub '' :anon :subid('WSubId_520') :outer('WSubId_519')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("expr3")
# }

.end # WSubId_520


.sub '' :anon :subid('WSubId_521') :outer('WSubId_516')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_522 = "WSubId_522"
# Body
# {
    find_lex $P3, '__WLEX_1'
    set $I2, $P3
    iseq $I1, $I2, 0
    __ARG_6.'_pred'($I1)
    set $P4, WSubId_522
    $P3 = __ARG_6.'_many'($P4)
store_lex '__WLEX_2', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "And"
    push $P3, $P4
    find_lex $P5, '__WLEX_2'
    .tailcall $P3.'append'($P5)
# }

.end # WSubId_521


.sub '' :anon :subid('WSubId_522') :outer('WSubId_521')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("expr3")
# }

.end # WSubId_522


.sub 'optIter' :subid('WSubId_523') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_524 = "WSubId_524"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_524
    .tailcall $P3(self)
# }

.end # optIter


.sub '' :anon :subid('WSubId_524') :outer('WSubId_523')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_525 = "WSubId_525"
.const 'Sub' WSubId_527 = "WSubId_527"
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    newclosure $P2, WSubId_525
    newclosure $P3, WSubId_527
    .tailcall __ARG_1.'_or'($P2, $P3)
# }

.end # WSubId_524


.sub '' :anon :subid('WSubId_525') :outer('WSubId_524')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_526 = "WSubId_526"
# Body
# {
    newclosure $P2, WSubId_526
    .tailcall $P2(__ARG_2)
# }

.end # WSubId_525


.sub '' :anon :subid('WSubId_526') :outer('WSubId_525')
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

.end # WSubId_526


.sub '' :anon :subid('WSubId_527') :outer('WSubId_524')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_4.'_apply'("empty")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_527


.sub 'optBind' :subid('WSubId_528') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_529 = "WSubId_529"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var n: $P3
    null $P3
    newclosure $P4, WSubId_529
    .tailcall $P4(self)
# }

.end # optBind


.sub '' :anon :subid('WSubId_529') :outer('WSubId_528')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_530 = "WSubId_530"
.const 'Sub' WSubId_534 = "WSubId_534"
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    newclosure $P3, WSubId_530
    newclosure $P4, WSubId_534
    .tailcall __ARG_1.'_or'($P3, $P4)
# }

.end # WSubId_529


.sub '' :anon :subid('WSubId_530') :outer('WSubId_529')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_531 = "WSubId_531"
# Body
# {
    newclosure $P3, WSubId_531
    .tailcall $P3(__ARG_2)
# }

.end # WSubId_530


.sub '' :anon :subid('WSubId_531') :outer('WSubId_530')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_532 = "WSubId_532"
# Body
# {
# switch
    $P3 = __ARG_3.'_apply'('anything')
    set $S1, $P3
    set $S2, ":"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P4, WSubId_532
    .tailcall $P4(__ARG_3)
  __label_2: # default
    $P5 = __ARG_3.'_fail'()
    throw $P5
  __label_1: # switch end
# }

.end # WSubId_531


.sub '' :anon :subid('WSubId_532') :outer('WSubId_531')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_533 = "WSubId_533"
# Body
# {
    $P3 = __ARG_4.'_apply'("name")
store_lex '__WLEX_2', $P3
    newclosure $P3, WSubId_533
    .tailcall $P3(__ARG_4)
# }

.end # WSubId_532


.sub '' :anon :subid('WSubId_533') :outer('WSubId_532')
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

.end # WSubId_533


.sub '' :anon :subid('WSubId_534') :outer('WSubId_529')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_6.'_apply'("empty")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_534


.sub 'expr3' :subid('WSubId_535') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P4
.lex '__WLEX_3', $P3
.const 'Sub' WSubId_536 = "WSubId_536"
.const 'Sub' WSubId_538 = "WSubId_538"
.const 'Sub' WSubId_541 = "WSubId_541"
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
    newclosure $P5, WSubId_536
    newclosure $P6, WSubId_538
    set $P7, WSubId_541
    .tailcall self.'_or'($P5, $P6, $P7)
# }

.end # expr3


.sub '' :anon :subid('WSubId_536') :outer('WSubId_535')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_537 = "WSubId_537"
# Body
# {
    __ARG_1.'_applyWithArgs'("token", ":")
    $P2 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P2
    newclosure $P2, WSubId_537
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_536


.sub '' :anon :subid('WSubId_537') :outer('WSubId_536')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2["locals"]
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

.end # WSubId_537


.sub '' :anon :subid('WSubId_538') :outer('WSubId_535')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_539 = "WSubId_539"
.const 'Sub' WSubId_540 = "WSubId_540"
# Body
# {
    newclosure $P4, WSubId_539
    set $P5, WSubId_540
    $P3 = __ARG_3.'_or'($P4, $P5)
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_2'
    .tailcall __ARG_3.'_applyWithArgs'("optBind", $P3)
# }

.end # WSubId_538


.sub '' :anon :subid('WSubId_539') :outer('WSubId_538')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_3'
# Body
# {
    $P2 = __ARG_4.'_apply'("expr2")
store_lex '__WLEX_3', $P2
    find_lex $P2, '__WLEX_3'
    .tailcall __ARG_4.'_applyWithArgs'("optIter", $P2)
# }

.end # WSubId_539


.sub '' :anon :subid('WSubId_540') :outer('WSubId_538')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("semAction")
# }

.end # WSubId_540


.sub '' :anon :subid('WSubId_541') :outer('WSubId_535')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("semPred")
# }

.end # WSubId_541


.sub 'expr2' :subid('WSubId_542') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_543 = "WSubId_543"
.const 'Sub' WSubId_544 = "WSubId_544"
.const 'Sub' WSubId_545 = "WSubId_545"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_543
    newclosure $P4, WSubId_544
    set $P5, WSubId_545
    .tailcall self.'_or'($P3, $P4, $P5)
# }

.end # expr2


.sub '' :anon :subid('WSubId_543') :outer('WSubId_542')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_applyWithArgs'("token", "~")
    $P2 = __ARG_1.'_apply'("expr2")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Not"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_543


.sub '' :anon :subid('WSubId_544') :outer('WSubId_542')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "&")
    $P2 = __ARG_2.'_apply'("expr1")
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Lookahead"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_544


.sub '' :anon :subid('WSubId_545') :outer('WSubId_542')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("expr1")
# }

.end # WSubId_545


.sub 'expr1' :subid('WSubId_546') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_547 = "WSubId_547"
.const 'Sub' WSubId_548 = "WSubId_548"
.const 'Sub' WSubId_552 = "WSubId_552"
.const 'Sub' WSubId_557 = "WSubId_557"
.const 'Sub' WSubId_558 = "WSubId_558"
.const 'Sub' WSubId_559 = "WSubId_559"
.const 'Sub' WSubId_560 = "WSubId_560"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    set $P3, WSubId_547
    newclosure $P4, WSubId_548
    set $P5, WSubId_552
    newclosure $P6, WSubId_557
    newclosure $P7, WSubId_558
    newclosure $P8, WSubId_559
    newclosure $P9, WSubId_560
    .tailcall self.'_or'($P3, $P4, $P5, $P6, $P7, $P8, $P9)
# }

.end # expr1


.sub '' :anon :subid('WSubId_547') :outer('WSubId_546')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("application")
# }

.end # WSubId_547


.sub '' :anon :subid('WSubId_548') :outer('WSubId_546')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_549 = "WSubId_549"
.const 'Sub' WSubId_550 = "WSubId_550"
.const 'Sub' WSubId_551 = "WSubId_551"
# Body
# {
    set $P3, WSubId_549
    set $P4, WSubId_550
    set $P5, WSubId_551
    $P2 = __ARG_2.'_or'($P3, $P4, $P5)
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

.end # WSubId_548


.sub '' :anon :subid('WSubId_549') :outer('WSubId_548')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("keyword", "null")
# }

.end # WSubId_549


.sub '' :anon :subid('WSubId_550') :outer('WSubId_548')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_applyWithArgs'("keyword", "true")
# }

.end # WSubId_550


.sub '' :anon :subid('WSubId_551') :outer('WSubId_548')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_applyWithArgs'("keyword", "false")
# }

.end # WSubId_551


.sub '' :anon :subid('WSubId_552') :outer('WSubId_546')
        .param pmc __ARG_6
.const 'Sub' WSubId_553 = "WSubId_553"
.const 'Sub' WSubId_554 = "WSubId_554"
.const 'Sub' WSubId_555 = "WSubId_555"
.const 'Sub' WSubId_556 = "WSubId_556"
# Body
# {
    __ARG_6.'_apply'("spaces")
    set $P1, WSubId_553
    set $P2, WSubId_554
    set $P3, WSubId_555
    set $P4, WSubId_556
    .tailcall __ARG_6.'_or'($P1, $P2, $P3, $P4)
# }

.end # WSubId_552


.sub '' :anon :subid('WSubId_553') :outer('WSubId_552')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("characters")
# }

.end # WSubId_553


.sub '' :anon :subid('WSubId_554') :outer('WSubId_552')
        .param pmc __ARG_8
# Body
# {
    .tailcall __ARG_8.'_apply'("sCharacters")
# }

.end # WSubId_554


.sub '' :anon :subid('WSubId_555') :outer('WSubId_552')
        .param pmc __ARG_9
# Body
# {
    .tailcall __ARG_9.'_apply'("string")
# }

.end # WSubId_555


.sub '' :anon :subid('WSubId_556') :outer('WSubId_552')
        .param pmc __ARG_10
# Body
# {
    .tailcall __ARG_10.'_apply'("number")
# }

.end # WSubId_556


.sub '' :anon :subid('WSubId_557') :outer('WSubId_546')
        .param pmc __ARG_11
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_11.'_applyWithArgs'("token", "[")
    $P2 = __ARG_11.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_11.'_applyWithArgs'("token", "]")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Form"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_557


.sub '' :anon :subid('WSubId_558') :outer('WSubId_546')
        .param pmc __ARG_12
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_12.'_applyWithArgs'("token", "<")
    $P2 = __ARG_12.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_12.'_applyWithArgs'("token", ">")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "ConsBy"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_558


.sub '' :anon :subid('WSubId_559') :outer('WSubId_546')
        .param pmc __ARG_13
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_13.'_applyWithArgs'("token", "@<")
    $P2 = __ARG_13.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_13.'_applyWithArgs'("token", ">")
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "IdxConsBy"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_559


.sub '' :anon :subid('WSubId_560') :outer('WSubId_546')
        .param pmc __ARG_14
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_14.'_applyWithArgs'("token", "(")
    $P2 = __ARG_14.'_apply'("expr")
store_lex '__WLEX_1', $P2
    __ARG_14.'_applyWithArgs'("token", ")")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_560


.sub 'ruleName' :subid('WSubId_561') :method
.const 'Sub' WSubId_562 = "WSubId_562"
.const 'Sub' WSubId_563 = "WSubId_563"
# Body
# {
# var fromIdx: $P1
    getattribute $P2, self, 'input'
    getattribute $P1, $P2, 'idx'
    set $P2, WSubId_562
    set $P3, WSubId_563
    .tailcall self.'_or'($P2, $P3)
# }

.end # ruleName


.sub '' :anon :subid('WSubId_562') :outer('WSubId_561')
        .param pmc __ARG_1
# Body
# {
    .tailcall __ARG_1.'_apply'("name")
# }

.end # WSubId_562


.sub '' :anon :subid('WSubId_563') :outer('WSubId_561')
        .param pmc __ARG_2
# Body
# {
    __ARG_2.'_apply'("spaces")
    .tailcall __ARG_2.'_apply'("tsString")
# }

.end # WSubId_563


.sub 'rule' :subid('WSubId_564') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_565 = "WSubId_565"
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
    newclosure $P5, WSubId_565
    .tailcall $P5(self)
# }

.end # rule


.sub '' :anon :subid('WSubId_565') :outer('WSubId_564')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_566 = "WSubId_566"
.const 'Sub' WSubId_567 = "WSubId_567"
# Body
# {
    newclosure $P4, WSubId_566
    __ARG_1.'_lookahead'($P4)
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "fromIdx=self.input.idx"
    push $P4, $P5
    __ARG_1["locals"] = $P4
    find_lex $P5, '__WLEX_1'
    $P4 = __ARG_1.'_applyWithArgs'("rulePart", $P5)
store_lex '__WLEX_2', $P4
    newclosure $P5, WSubId_567
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

.end # WSubId_565


.sub '' :anon :subid('WSubId_566') :outer('WSubId_565')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("ruleName")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_566


.sub '' :anon :subid('WSubId_567') :outer('WSubId_565')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("token", ",")
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_3.'_applyWithArgs'("rulePart", $P2)
# }

.end # WSubId_567


.sub 'rulePart' :subid('WSubId_568') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_569 = "WSubId_569"
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
    newclosure $P6, WSubId_569
    .tailcall $P6(self)
# }

.end # rulePart


.sub '' :anon :subid('WSubId_569') :outer('WSubId_568')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_4'
.const 'Sub' WSubId_570 = "WSubId_570"
.const 'Sub' WSubId_571 = "WSubId_571"
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
    newclosure $P5, WSubId_570
    newclosure $P6, WSubId_571
    .tailcall __ARG_1.'_or'($P5, $P6)
# }

.end # WSubId_569


.sub '' :anon :subid('WSubId_570') :outer('WSubId_569')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_3'
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "=")
    $P3 = __ARG_2.'_apply'("expr")
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

.end # WSubId_570


.sub '' :anon :subid('WSubId_571') :outer('WSubId_569')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_3'
# Body
# {
    __ARG_3.'_apply'("empty")
    find_lex $P2, '__WLEX_3'
    .return($P2)
# }

.end # WSubId_571


.sub 'grammar' :subid('WSubId_572') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_573 = "WSubId_573"
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
    newclosure $P5, WSubId_573
    .tailcall $P5(self)
# }

.end # grammar


.sub '' :anon :subid('WSubId_573') :outer('WSubId_572')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_574 = "WSubId_574"
.const 'Sub' WSubId_575 = "WSubId_575"
# Body
# {
    __ARG_1.'_applyWithArgs'("keyword", "ometa")
    $P4 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P4
    set $P5, WSubId_574
    set $P6, WSubId_575
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

.end # WSubId_573


.sub '' :anon :subid('WSubId_574') :outer('WSubId_573')
        .param pmc __ARG_2
# Body
# {
    __ARG_2.'_applyWithArgs'("token", "<:")
    .tailcall __ARG_2.'_apply'("name")
# }

.end # WSubId_574


.sub '' :anon :subid('WSubId_575') :outer('WSubId_573')
        .param pmc __ARG_3
# Body
# {
    __ARG_3.'_apply'("empty")
    .return("OMeta")
# }

.end # WSubId_575

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMetaParser' ]
    get_class $P1, [ 'Parser' ]
    addparent $P0, $P1
.end
.namespace [ 'OMetaTranslator' ]

.sub 'App' :subid('WSubId_576') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_577 = "WSubId_577"
.const 'Sub' WSubId_581 = "WSubId_581"
.const 'Sub' WSubId_583 = "WSubId_583"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var args: $P2
    null $P2
# var rule: $P3
    null $P3
    newclosure $P4, WSubId_577
    newclosure $P5, WSubId_581
    newclosure $P6, WSubId_583
    .tailcall self.'_or'($P4, $P5, $P6)
# }

.end # App


.sub '' :anon :subid('WSubId_577') :outer('WSubId_576')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_578 = "WSubId_578"
# Body
# {
    newclosure $P2, WSubId_578
    .tailcall $P2(__ARG_1)
# }

.end # WSubId_577


.sub '' :anon :subid('WSubId_578') :outer('WSubId_577')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_579 = "WSubId_579"
# Body
# {
# switch
    $P2 = __ARG_2.'_apply'('anything')
    set $S1, $P2
    set $S2, "super"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P3, WSubId_579
    .tailcall $P3(__ARG_2)
  __label_2: # default
    $P4 = __ARG_2.'_fail'()
    throw $P4
  __label_1: # switch end
# }

.end # WSubId_578


.sub '' :anon :subid('WSubId_579') :outer('WSubId_578')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_580 = "WSubId_580"
# Body
# {
    set $P3, WSubId_580
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

.end # WSubId_579


.sub '' :anon :subid('WSubId_580') :outer('WSubId_579')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("anything")
# }

.end # WSubId_580


.sub '' :anon :subid('WSubId_581') :outer('WSubId_576')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_1'
.const 'Sub' WSubId_582 = "WSubId_582"
# Body
# {
    $P3 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_2', $P3
    set $P4, WSubId_582
    $P3 = __ARG_5.'_many1'($P4)
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

.end # WSubId_581


.sub '' :anon :subid('WSubId_582') :outer('WSubId_581')
        .param pmc __ARG_6
# Body
# {
    .tailcall __ARG_6.'_apply'("anything")
# }

.end # WSubId_582


.sub '' :anon :subid('WSubId_583') :outer('WSubId_576')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_7.'_apply'("anything")
store_lex '__WLEX_2', $P2
# predefined string
    find_lex $P2, '__WLEX_2'
    set $S1, $P2
    concat $S2, "self._apply(\"", $S1
    concat $S2, $S2, "\")"
    .return($S2)
# }

.end # WSubId_583


.sub 'Act' :subid('WSubId_584') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_585 = "WSubId_585"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var expr: $P2
    null $P2
    newclosure $P3, WSubId_585
    .tailcall $P3(self)
# }

.end # Act


.sub '' :anon :subid('WSubId_585') :outer('WSubId_584')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_585


.sub 'Pred' :subid('WSubId_586') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_587 = "WSubId_587"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var expr: $P2
    null $P2
    newclosure $P3, WSubId_587
    .tailcall $P3(self)
# }

.end # Pred


.sub '' :anon :subid('WSubId_587') :outer('WSubId_586')
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

.end # WSubId_587


.sub 'Or' :subid('WSubId_588') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_589 = "WSubId_589"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_589
    .tailcall $P3(self)
# }

.end # Or


.sub '' :anon :subid('WSubId_589') :outer('WSubId_588')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_590 = "WSubId_590"
# Body
# {
    set $P3, WSubId_590
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    concat $S2, "self._or(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_589


.sub '' :anon :subid('WSubId_590') :outer('WSubId_589')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("transFn")
# }

.end # WSubId_590


.sub 'XOr' :subid('WSubId_591') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_592 = "WSubId_592"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_592
    .tailcall $P3(self)
# }

.end # XOr


.sub '' :anon :subid('WSubId_592') :outer('WSubId_591')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_593 = "WSubId_593"
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    set $P3, WSubId_593
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
    $P3 = WSubId_785($I1)
    $P2.'unshift'($P3)
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    concat $S2, "self._xor(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_592


.sub '' :anon :subid('WSubId_593') :outer('WSubId_592')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("transFn")
# }

.end # WSubId_593


.sub 'And' :subid('WSubId_594') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_595 = "WSubId_595"
.const 'Sub' WSubId_596 = "WSubId_596"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_595
    set $P4, WSubId_596
    .tailcall self.'_or'($P3, $P4)
# }

.end # And


.sub '' :anon :subid('WSubId_595') :outer('WSubId_594')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("andFunc")
store_lex '__WLEX_1', $P2
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, $S1, "(self)"
    .return($S2)
# }

.end # WSubId_595


.sub '' :anon :subid('WSubId_596') :outer('WSubId_594')
        .param pmc __ARG_2
# Body
# {
    .return("")
# }

.end # WSubId_596


.sub 'andFunc' :subid('WSubId_597') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_598 = "WSubId_598"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var xs: $P2
    null $P2
# var y: $P3
    null $P3
    newclosure $P4, WSubId_598
    .tailcall $P4(self)
# }

.end # andFunc


.sub '' :anon :subid('WSubId_598') :outer('WSubId_597')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_599 = "WSubId_599"
# Body
# {
    set $P4, WSubId_599
    $P3 = __ARG_1.'_many'($P4)
store_lex '__WLEX_1', $P3
    $P3 = __ARG_1.'_apply'("trans")
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
    concat $S2, $S2, ";})"
    .return($S2)
# }

.end # WSubId_598


.sub '' :anon :subid('WSubId_599') :outer('WSubId_598')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_applyWithArgs'("notLast", "trans")
# }

.end # WSubId_599


.sub 'Opt' :subid('WSubId_600') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_601 = "WSubId_601"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_601
    .tailcall $P3(self)
# }

.end # Opt


.sub '' :anon :subid('WSubId_601') :outer('WSubId_600')
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

.end # WSubId_601


.sub 'Many' :subid('WSubId_602') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_603 = "WSubId_603"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_603
    .tailcall $P3(self)
# }

.end # Many


.sub '' :anon :subid('WSubId_603') :outer('WSubId_602')
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

.end # WSubId_603


.sub 'Many1' :subid('WSubId_604') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_605 = "WSubId_605"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_605
    .tailcall $P3(self)
# }

.end # Many1


.sub '' :anon :subid('WSubId_605') :outer('WSubId_604')
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

.end # WSubId_605


.sub 'Not' :subid('WSubId_606') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_607 = "WSubId_607"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_607
    .tailcall $P3(self)
# }

.end # Not


.sub '' :anon :subid('WSubId_607') :outer('WSubId_606')
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

.end # WSubId_607


.sub 'Lookahead' :subid('WSubId_608') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_609 = "WSubId_609"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_609
    .tailcall $P3(self)
# }

.end # Lookahead


.sub '' :anon :subid('WSubId_609') :outer('WSubId_608')
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

.end # WSubId_609


.sub 'Form' :subid('WSubId_610') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_611 = "WSubId_611"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_611
    .tailcall $P3(self)
# }

.end # Form


.sub '' :anon :subid('WSubId_611') :outer('WSubId_610')
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

.end # WSubId_611


.sub 'ConsBy' :subid('WSubId_612') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_613 = "WSubId_613"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_613
    .tailcall $P3(self)
# }

.end # ConsBy


.sub '' :anon :subid('WSubId_613') :outer('WSubId_612')
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

.end # WSubId_613


.sub 'IdxConsBy' :subid('WSubId_614') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_615 = "WSubId_615"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_615
    .tailcall $P3(self)
# }

.end # IdxConsBy


.sub '' :anon :subid('WSubId_615') :outer('WSubId_614')
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

.end # WSubId_615


.sub 'Set' :subid('WSubId_616') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_617 = "WSubId_617"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var n: $P2
    null $P2
# var v: $P3
    null $P3
    newclosure $P4, WSubId_617
    .tailcall $P4(self)
# }

.end # Set


.sub '' :anon :subid('WSubId_617') :outer('WSubId_616')
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

.end # WSubId_617


.sub 'JumpTable' :subid('WSubId_618') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_619 = "WSubId_619"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var cases: $P2
    null $P2
    newclosure $P3, WSubId_619
    .tailcall $P3(self)
# }

.end # JumpTable


.sub '' :anon :subid('WSubId_619') :outer('WSubId_618')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_620 = "WSubId_620"
# Body
# {
    set $P3, WSubId_620
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .tailcall __ARG_1.'jumpTableCode'($P2)
# }

.end # WSubId_619


.sub '' :anon :subid('WSubId_620') :outer('WSubId_619')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("jtCase")
# }

.end # WSubId_620


.sub 'Interleave' :subid('WSubId_621') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_622 = "WSubId_622"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_622
    .tailcall $P3(self)
# }

.end # Interleave


.sub '' :anon :subid('WSubId_622') :outer('WSubId_621')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_623 = "WSubId_623"
# Body
# {
    set $P3, WSubId_623
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, ",", $P2
    concat $S2, "self._interleave(", $S1
    concat $S2, $S2, ")"
    .return($S2)
# }

.end # WSubId_622


.sub '' :anon :subid('WSubId_623') :outer('WSubId_622')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("intPart")
# }

.end # WSubId_623


.sub 'Rule' :subid('WSubId_624') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_625 = "WSubId_625"
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
    newclosure $P5, WSubId_625
    .tailcall $P5(self)
# }

.end # Rule


.sub '' :anon :subid('WSubId_625') :outer('WSubId_624')
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

.end # WSubId_625


.sub 'Grammar' :subid('WSubId_626') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_627 = "WSubId_627"
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
    newclosure $P5, WSubId_627
    .tailcall $P5(self)
# }

.end # Grammar


.sub '' :anon :subid('WSubId_627') :outer('WSubId_626')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_628 = "WSubId_628"
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
    set $P5, WSubId_628
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

.end # WSubId_627


.sub '' :anon :subid('WSubId_628') :outer('WSubId_627')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_628


.sub 'intPart' :subid('WSubId_629') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_630 = "WSubId_630"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var mode: $P2
    null $P2
# var part: $P3
    null $P3
    newclosure $P4, WSubId_630
    .tailcall $P4(self)
# }

.end # intPart


.sub '' :anon :subid('WSubId_630') :outer('WSubId_629')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_631 = "WSubId_631"
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    newclosure $P3, WSubId_631
    __ARG_1.'_form'($P3)
    find_lex $P4, '__WLEX_1'
    $P3 = WSubId_785($P4)
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

.end # WSubId_630


.sub '' :anon :subid('WSubId_631') :outer('WSubId_630')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_2.'_apply'("transFn")
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_631


.sub 'jtCase' :subid('WSubId_632') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_633 = "WSubId_633"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var e: $P3
    null $P3
    newclosure $P4, WSubId_633
    .tailcall $P4(self)
# }

.end # jtCase


.sub '' :anon :subid('WSubId_633') :outer('WSubId_632')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_634 = "WSubId_634"
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    newclosure $P3, WSubId_634
    __ARG_1.'_form'($P3)
    root_new $P3, ['parrot';'ResizablePMCArray']
    find_lex $P6, '__WLEX_1'
    $P5 = WSubId_785($P6)
    push $P3, $P5
    find_lex $P7, '__WLEX_2'
    push $P3, $P7
    .return($P3)
# }

.end # WSubId_633


.sub '' :anon :subid('WSubId_634') :outer('WSubId_633')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P3
    $P3 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_634


.sub 'local' :subid('WSubId_635') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_636 = "WSubId_636"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var n: $P2
    null $P2
    newclosure $P3, WSubId_636
    .tailcall $P3(self)
# }

.end # local


.sub '' :anon :subid('WSubId_636') :outer('WSubId_635')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_637 = "WSubId_637"
.const 'Sub' WSubId_638 = "WSubId_638"
# Body
# {
    $P2 = __ARG_1.'_apply'("string")
store_lex '__WLEX_1', $P2
    newclosure $P2, WSubId_637
    newclosure $P3, WSubId_638
    .tailcall __ARG_1.'_or'($P2, $P3)
# }

.end # WSubId_636


.sub '' :anon :subid('WSubId_637') :outer('WSubId_636')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P3 = __ARG_2["seen"]
    find_lex $P4, '__WLEX_1'
    $P2 = $P3[$P4]
    isnull $I1, $P2
    not $I1
    __ARG_2.'_pred'($I1)
    .return("")
# }

.end # WSubId_637


.sub '' :anon :subid('WSubId_638') :outer('WSubId_636')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_3["seen"]
    find_lex $P3, '__WLEX_1'
    $P2[$P3] = 1
# predefined string
    find_lex $P2, '__WLEX_1'
    set $S1, $P2
    concat $S2, "volatile var ", $S1
    concat $S2, $S2, " ;"
    .return($S2)
# }

.end # WSubId_638


.sub 'locals' :subid('WSubId_639') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_640 = "WSubId_640"
.const 'Sub' WSubId_643 = "WSubId_643"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var vs: $P2
    null $P2
    newclosure $P3, WSubId_640
    set $P4, WSubId_643
    .tailcall self.'_or'($P3, $P4)
# }

.end # locals


.sub '' :anon :subid('WSubId_640') :outer('WSubId_639')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_641 = "WSubId_641"
# Body
# {
    root_new $P2, ['parrot';'Hash']
    __ARG_1["seen"] = $P2
    newclosure $P2, WSubId_641
    __ARG_1.'_form'($P2)
    find_lex $P2, '__WLEX_1'
# predefined join
    join $S1, "", $P2
    .return($S1)
# }

.end # WSubId_640


.sub '' :anon :subid('WSubId_641') :outer('WSubId_640')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_642 = "WSubId_642"
# Body
# {
    set $P3, WSubId_642
    $P2 = __ARG_2.'_many1'($P3)
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_641


.sub '' :anon :subid('WSubId_642') :outer('WSubId_641')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("local")
# }

.end # WSubId_642


.sub '' :anon :subid('WSubId_643') :outer('WSubId_639')
        .param pmc __ARG_4
.const 'Sub' WSubId_644 = "WSubId_644"
# Body
# {
    set $P1, WSubId_644
    __ARG_4.'_form'($P1)
    .return("")
# }

.end # WSubId_643


.sub '' :anon :subid('WSubId_644') :outer('WSubId_643')
        .param pmc __ARG_5
# Body
# {
    .return()
# }

.end # WSubId_644


.sub 'trans' :subid('WSubId_645') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_646 = "WSubId_646"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var t: $P2
    null $P2
# var ans: $P3
    null $P3
    newclosure $P4, WSubId_646
    .tailcall $P4(self)
# }

.end # trans


.sub '' :anon :subid('WSubId_646') :outer('WSubId_645')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_647 = "WSubId_647"
# Body
# {
    newclosure $P3, WSubId_647
    __ARG_1.'_form'($P3)
    find_lex $P3, '__WLEX_2'
    .return($P3)
# }

.end # WSubId_646


.sub '' :anon :subid('WSubId_647') :outer('WSubId_646')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P3
    find_lex $P4, '__WLEX_1'
    $P3 = __ARG_2.'_applyWithArgs'("apply", $P4)
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_647


.sub 'transFn' :subid('WSubId_648') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_649 = "WSubId_649"
.const 'Sub' WSubId_651 = "WSubId_651"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var ans: $P2
    null $P2
# var x: $P3
    null $P3
    newclosure $P4, WSubId_649
    newclosure $P5, WSubId_651
    .tailcall self.'_or'($P4, $P5)
# }

.end # transFn


.sub '' :anon :subid('WSubId_649') :outer('WSubId_648')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_650 = "WSubId_650"
# Body
# {
    newclosure $P2, WSubId_650
    __ARG_1.'_form'($P2)
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_649


.sub '' :anon :subid('WSubId_650') :outer('WSubId_649')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_2.'_applyWithArgs'("exactly", "And")
    $P2 = __ARG_2.'_apply'("andFunc")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_650


.sub '' :anon :subid('WSubId_651') :outer('WSubId_648')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_3.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
    find_lex $P2, '__WLEX_2'
    set $S1, $P2
    concat $S2, "(function(var self){return ", $S1
    concat $S2, $S2, ";})"
    .return($S2)
# }

.end # WSubId_651

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OMetaTranslator' ]
    get_class $P1, [ 'OMeta' ]
    addparent $P0, $P1
.end
.namespace [ 'OMetaWinxedParser' ]

.sub 'topElem' :subid('WSubId_652') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_653 = "WSubId_653"
.const 'Sub' WSubId_654 = "WSubId_654"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_653
    set $P4, WSubId_654
    .tailcall self.'_or'($P3, $P4)
# }

.end # topElem


.sub '' :anon :subid('WSubId_653') :outer('WSubId_652')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_1.'_apply'("spaces")
    $P2 = __ARG_1.'_applyWithArgs'("foreign", 'OMetaParser', 'grammar')
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_653


.sub '' :anon :subid('WSubId_654') :outer('WSubId_652')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_superApplyWithArgs'("WinxedParser", 'topElem')
# }

.end # WSubId_654

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


.sub 'trans' :subid('WSubId_655') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_656 = "WSubId_656"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var t: $P2
    null $P2
# var ans: $P3
    null $P3
    newclosure $P4, WSubId_656
    .tailcall $P4(self)
# }

.end # trans


.sub '' :anon :subid('WSubId_656') :outer('WSubId_655')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_657 = "WSubId_657"
# Body
# {
    newclosure $P3, WSubId_657
    __ARG_1.'_form'($P3)
    find_lex $P3, '__WLEX_2'
    .return($P3)
# }

.end # WSubId_656


.sub '' :anon :subid('WSubId_657') :outer('WSubId_656')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    $P3 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P3
    find_lex $P4, '__WLEX_1'
    set $S1, $P4
# predefined find_method
    find_method $P3, __ARG_2, $S1
    isnull $I1, $P3
    not $I1
    __ARG_2.'_pred'($I1)
    find_lex $P4, '__WLEX_1'
    $P3 = __ARG_2.'_applyWithArgs'("apply", $P4)
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_657


.sub 'optimize' :subid('WSubId_658') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_659 = "WSubId_659"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_659
    .tailcall $P3(self)
# }

.end # optimize


.sub '' :anon :subid('WSubId_659') :outer('WSubId_658')
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

.end # WSubId_659


.sub 'App' :subid('WSubId_660') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_661 = "WSubId_661"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var rule: $P2
    null $P2
# var args: $P3
    null $P3
    newclosure $P4, WSubId_661
    .tailcall $P4(self)
# }

.end # App


.sub '' :anon :subid('WSubId_661') :outer('WSubId_660')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_662 = "WSubId_662"
# Body
# {
    $P3 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P3
    set $P4, WSubId_662
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

.end # WSubId_661


.sub '' :anon :subid('WSubId_662') :outer('WSubId_661')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("anything")
# }

.end # WSubId_662


.sub 'Act' :subid('WSubId_663') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_664 = "WSubId_664"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var expr: $P2
    null $P2
    newclosure $P3, WSubId_664
    .tailcall $P3(self)
# }

.end # Act


.sub '' :anon :subid('WSubId_664') :outer('WSubId_663')
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

.end # WSubId_664


.sub 'Pred' :subid('WSubId_665') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_666 = "WSubId_666"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var expr: $P2
    null $P2
    newclosure $P3, WSubId_666
    .tailcall $P3(self)
# }

.end # Pred


.sub '' :anon :subid('WSubId_666') :outer('WSubId_665')
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

.end # WSubId_666


.sub 'Or' :subid('WSubId_667') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_668 = "WSubId_668"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_668
    .tailcall $P3(self)
# }

.end # Or


.sub '' :anon :subid('WSubId_668') :outer('WSubId_667')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_669 = "WSubId_669"
# Body
# {
    set $P3, WSubId_669
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Or"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_668


.sub '' :anon :subid('WSubId_669') :outer('WSubId_668')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_669


.sub 'XOr' :subid('WSubId_670') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_671 = "WSubId_671"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_671
    .tailcall $P3(self)
# }

.end # XOr


.sub '' :anon :subid('WSubId_671') :outer('WSubId_670')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_672 = "WSubId_672"
# Body
# {
    set $P3, WSubId_672
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "XOr"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_671


.sub '' :anon :subid('WSubId_672') :outer('WSubId_671')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_672


.sub 'And' :subid('WSubId_673') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_674 = "WSubId_674"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var xs: $P2
    null $P2
    newclosure $P3, WSubId_674
    .tailcall $P3(self)
# }

.end # And


.sub '' :anon :subid('WSubId_674') :outer('WSubId_673')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_675 = "WSubId_675"
# Body
# {
    set $P3, WSubId_675
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "And"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_674


.sub '' :anon :subid('WSubId_675') :outer('WSubId_674')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_675


.sub 'Opt' :subid('WSubId_676') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_677 = "WSubId_677"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_677
    .tailcall $P3(self)
# }

.end # Opt


.sub '' :anon :subid('WSubId_677') :outer('WSubId_676')
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

.end # WSubId_677


.sub 'Many' :subid('WSubId_678') :method
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

.end # Many


.sub '' :anon :subid('WSubId_679') :outer('WSubId_678')
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

.end # WSubId_679


.sub 'Many1' :subid('WSubId_680') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_681 = "WSubId_681"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_681
    .tailcall $P3(self)
# }

.end # Many1


.sub '' :anon :subid('WSubId_681') :outer('WSubId_680')
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

.end # WSubId_681


.sub 'Set' :subid('WSubId_682') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_683 = "WSubId_683"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var n: $P2
    null $P2
# var v: $P3
    null $P3
    newclosure $P4, WSubId_683
    .tailcall $P4(self)
# }

.end # Set


.sub '' :anon :subid('WSubId_683') :outer('WSubId_682')
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

.end # WSubId_683


.sub 'Not' :subid('WSubId_684') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_685 = "WSubId_685"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_685
    .tailcall $P3(self)
# }

.end # Not


.sub '' :anon :subid('WSubId_685') :outer('WSubId_684')
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

.end # WSubId_685


.sub 'Lookahead' :subid('WSubId_686') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_687 = "WSubId_687"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_687
    .tailcall $P3(self)
# }

.end # Lookahead


.sub '' :anon :subid('WSubId_687') :outer('WSubId_686')
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

.end # WSubId_687


.sub 'Form' :subid('WSubId_688') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_689 = "WSubId_689"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_689
    .tailcall $P3(self)
# }

.end # Form


.sub '' :anon :subid('WSubId_689') :outer('WSubId_688')
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

.end # WSubId_689


.sub 'ConsBy' :subid('WSubId_690') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_691 = "WSubId_691"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_691
    .tailcall $P3(self)
# }

.end # ConsBy


.sub '' :anon :subid('WSubId_691') :outer('WSubId_690')
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

.end # WSubId_691


.sub 'IdxConsBy' :subid('WSubId_692') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_693 = "WSubId_693"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var x: $P2
    null $P2
    newclosure $P3, WSubId_693
    .tailcall $P3(self)
# }

.end # IdxConsBy


.sub '' :anon :subid('WSubId_693') :outer('WSubId_692')
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

.end # WSubId_693


.sub 'JumpTable' :subid('WSubId_694') :method
.lex '__WLEX_1', $P4
.lex '__WLEX_2', $P2
.lex '__WLEX_3', $P3
.const 'Sub' WSubId_695 = "WSubId_695"
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
    newclosure $P5, WSubId_695
    .tailcall $P5(self)
# }

.end # JumpTable


.sub '' :anon :subid('WSubId_695') :outer('WSubId_694')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_696 = "WSubId_696"
# Body
# {
    newclosure $P5, WSubId_696
    $P4 = __ARG_1.'_many'($P5)
store_lex '__WLEX_1', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "JumpTable"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    .tailcall $P4.'append'($P6)
# }

.end # WSubId_695


.sub '' :anon :subid('WSubId_696') :outer('WSubId_695')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_697 = "WSubId_697"
# Body
# {
    newclosure $P3, WSubId_697
    __ARG_2.'_form'($P3)
    root_new $P3, ['parrot';'ResizablePMCArray']
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_3'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_696


.sub '' :anon :subid('WSubId_697') :outer('WSubId_696')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
# Body
# {
    $P3 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_2', $P3
    $P3 = __ARG_3.'_apply'("trans")
store_lex '__WLEX_3', $P3
    .return(0)
# }

.end # WSubId_697


.sub 'Interleave' :subid('WSubId_698') :method
.lex '__WLEX_1', $P4
.lex '__WLEX_2', $P2
.lex '__WLEX_3', $P3
.const 'Sub' WSubId_699 = "WSubId_699"
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
    newclosure $P5, WSubId_699
    .tailcall $P5(self)
# }

.end # Interleave


.sub '' :anon :subid('WSubId_699') :outer('WSubId_698')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_700 = "WSubId_700"
# Body
# {
    newclosure $P5, WSubId_700
    $P4 = __ARG_1.'_many'($P5)
store_lex '__WLEX_1', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    box $P5, "Interleave"
    push $P4, $P5
    find_lex $P6, '__WLEX_1'
    .tailcall $P4.'append'($P6)
# }

.end # WSubId_699


.sub '' :anon :subid('WSubId_700') :outer('WSubId_699')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
.const 'Sub' WSubId_701 = "WSubId_701"
# Body
# {
    newclosure $P3, WSubId_701
    __ARG_2.'_form'($P3)
    root_new $P3, ['parrot';'ResizablePMCArray']
    find_lex $P5, '__WLEX_2'
    push $P3, $P5
    find_lex $P6, '__WLEX_3'
    push $P3, $P6
    .return($P3)
# }

.end # WSubId_700


.sub '' :anon :subid('WSubId_701') :outer('WSubId_700')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
# Body
# {
    $P3 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_2', $P3
    $P3 = __ARG_3.'_apply'("trans")
store_lex '__WLEX_3', $P3
    .return(0)
# }

.end # WSubId_701


.sub 'Rule' :subid('WSubId_702') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_703 = "WSubId_703"
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
    newclosure $P5, WSubId_703
    .tailcall $P5(self)
# }

.end # Rule


.sub '' :anon :subid('WSubId_703') :outer('WSubId_702')
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

.end # WSubId_703

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullOptimization' ]
    get_class $P1, [ 'OMeta' ]
    addparent $P0, $P1
.end
.namespace [ 'AssociativeOptimization' ]

.sub 'And' :subid('WSubId_704') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_705 = "WSubId_705"
.const 'Sub' WSubId_706 = "WSubId_706"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var xs: $P3
    null $P3
    newclosure $P4, WSubId_705
    newclosure $P5, WSubId_706
    .tailcall self.'_or'($P4, $P5)
# }

.end # And


.sub '' :anon :subid('WSubId_705') :outer('WSubId_704')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    __ARG_1.'_apply'("end")
    __ARG_1.'_apply'("setHelped")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_705


.sub '' :anon :subid('WSubId_706') :outer('WSubId_704')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_2.'_applyWithArgs'("transInside", "And")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "And"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_706


.sub 'Or' :subid('WSubId_707') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_708 = "WSubId_708"
.const 'Sub' WSubId_709 = "WSubId_709"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var xs: $P3
    null $P3
    newclosure $P4, WSubId_708
    newclosure $P5, WSubId_709
    .tailcall self.'_or'($P4, $P5)
# }

.end # Or


.sub '' :anon :subid('WSubId_708') :outer('WSubId_707')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    __ARG_1.'_apply'("end")
    __ARG_1.'_apply'("setHelped")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_708


.sub '' :anon :subid('WSubId_709') :outer('WSubId_707')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_2.'_applyWithArgs'("transInside", "Or")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Or"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_709


.sub 'XOr' :subid('WSubId_710') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_711 = "WSubId_711"
.const 'Sub' WSubId_712 = "WSubId_712"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var xs: $P3
    null $P3
    newclosure $P4, WSubId_711
    newclosure $P5, WSubId_712
    .tailcall self.'_or'($P4, $P5)
# }

.end # XOr


.sub '' :anon :subid('WSubId_711') :outer('WSubId_710')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P2
    __ARG_1.'_apply'("end")
    __ARG_1.'_apply'("setHelped")
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_711


.sub '' :anon :subid('WSubId_712') :outer('WSubId_710')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
# Body
# {
    $P2 = __ARG_2.'_applyWithArgs'("transInside", "XOr")
store_lex '__WLEX_2', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "XOr"
    push $P2, $P3
    find_lex $P4, '__WLEX_2'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_712


.sub 'transInside' :subid('WSubId_713') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_714 = "WSubId_714"
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
    newclosure $P6, WSubId_714
    .tailcall $P6(self)
# }

.end # transInside


.sub '' :anon :subid('WSubId_714') :outer('WSubId_713')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_4'
.const 'Sub' WSubId_715 = "WSubId_715"
.const 'Sub' WSubId_717 = "WSubId_717"
.const 'Sub' WSubId_718 = "WSubId_718"
# Body
# {
    $P5 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P5
    newclosure $P5, WSubId_715
    newclosure $P6, WSubId_717
    set $P7, WSubId_718
    .tailcall __ARG_1.'_or'($P5, $P6, $P7)
# }

.end # WSubId_714


.sub '' :anon :subid('WSubId_715') :outer('WSubId_714')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_716 = "WSubId_716"
# Body
# {
    newclosure $P4, WSubId_716
    __ARG_2.'_form'($P4)
    find_lex $P5, '__WLEX_1'
    $P4 = __ARG_2.'_applyWithArgs'("transInside", $P5)
store_lex '__WLEX_3', $P4
    __ARG_2.'_apply'("setHelped")
    find_lex $P4, '__WLEX_2'
    find_lex $P5, '__WLEX_3'
    .tailcall $P4.'append'($P5)
# }

.end # WSubId_715


.sub '' :anon :subid('WSubId_716') :outer('WSubId_715')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
# Body
# {
    find_lex $P3, '__WLEX_1'
    __ARG_3.'_applyWithArgs'("exactly", $P3)
    find_lex $P4, '__WLEX_1'
    $P3 = __ARG_3.'_applyWithArgs'("transInside", $P4)
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_716


.sub '' :anon :subid('WSubId_717') :outer('WSubId_714')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_4'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_1'
# Body
# {
    $P4 = __ARG_4.'_apply'("trans")
store_lex '__WLEX_4', $P4
    find_lex $P5, '__WLEX_1'
    $P4 = __ARG_4.'_applyWithArgs'("transInside", $P5)
store_lex '__WLEX_2', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    find_lex $P6, '__WLEX_4'
    push $P4, $P6
    find_lex $P7, '__WLEX_2'
    .tailcall $P4.'append'($P7)
# }

.end # WSubId_717


.sub '' :anon :subid('WSubId_718') :outer('WSubId_714')
        .param pmc __ARG_5
# Body
# {
    root_new $P1, ['parrot';'ResizablePMCArray']
    .return($P1)
# }

.end # WSubId_718

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'AssociativeOptimization' ]
    get_class $P1, [ 'NullOptimization' ]
    addparent $P0, $P1
.end
.namespace [ 'SeqInliner' ]

.sub 'App' :subid('WSubId_719') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.const 'Sub' WSubId_720 = "WSubId_720"
.const 'Sub' WSubId_723 = "WSubId_723"
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
    newclosure $P6, WSubId_720
    newclosure $P7, WSubId_723
    .tailcall self.'_or'($P6, $P7)
# }

.end # App


.sub '' :anon :subid('WSubId_720') :outer('WSubId_719')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_721 = "WSubId_721"
# Body
# {
    newclosure $P3, WSubId_721
    .tailcall $P3(__ARG_1)
# }

.end # WSubId_720


.sub '' :anon :subid('WSubId_721') :outer('WSubId_720')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_722 = "WSubId_722"
# Body
# {
# switch
    $P3 = __ARG_2.'_apply'('anything')
    set $S1, $P3
    set $S2, "seq"
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
    newclosure $P4, WSubId_722
    .tailcall $P4(__ARG_2)
  __label_2: # default
    $P5 = __ARG_2.'_fail'()
    throw $P5
  __label_1: # switch end
# }

.end # WSubId_721


.sub '' :anon :subid('WSubId_722') :outer('WSubId_721')
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

.end # WSubId_722


.sub '' :anon :subid('WSubId_723') :outer('WSubId_719')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_3'
    find_lex $P2, '__WLEX_4'
.const 'Sub' WSubId_724 = "WSubId_724"
# Body
# {
    $P3 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_3', $P3
    set $P4, WSubId_724
    $P3 = __ARG_4.'_many'($P4)
store_lex '__WLEX_4', $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, "App"
    push $P3, $P4
    find_lex $P5, '__WLEX_3'
    push $P3, $P5
    find_lex $P6, '__WLEX_4'
    .tailcall $P3.'append'($P6)
# }

.end # WSubId_723


.sub '' :anon :subid('WSubId_724') :outer('WSubId_723')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("anything")
# }

.end # WSubId_724


.sub 'inlineChar' :subid('WSubId_725') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_726 = "WSubId_726"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var c: $P2
    null $P2
    newclosure $P3, WSubId_726
    .tailcall $P3(self)
# }

.end # inlineChar


.sub '' :anon :subid('WSubId_726') :outer('WSubId_725')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_727 = "WSubId_727"
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    $P2 = __ARG_1.'_applyWithArgs'("foreign", 'OMetaParser', 'eChar')
store_lex '__WLEX_1', $P2
    set $P2, WSubId_727
    __ARG_1.'_not'($P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "App"
    push $P2, $P3
    box $P3, "exactly"
    push $P2, $P3
    find_lex $P5, '__WLEX_1'
    $P4 = WSubId_785($P5)
    push $P2, $P4
    .return($P2)
# }

.end # WSubId_726


.sub '' :anon :subid('WSubId_727') :outer('WSubId_726')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("end")
# }

.end # WSubId_727


.sub 'seqString' :subid('WSubId_728') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_729 = "WSubId_729"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var s: $P2
    null $P2
# var cs: $P3
    null $P3
    newclosure $P4, WSubId_729
    .tailcall $P4(self)
# }

.end # seqString


.sub '' :anon :subid('WSubId_729') :outer('WSubId_728')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_730 = "WSubId_730"
.const 'Sub' WSubId_731 = "WSubId_731"
.const 'Sub' WSubId_734 = "WSubId_734"
# Body
# {
    newclosure $P3, WSubId_730
    __ARG_1.'_lookahead'($P3)
    newclosure $P3, WSubId_731
    newclosure $P4, WSubId_734
    .tailcall __ARG_1.'_or'($P3, $P4)
# }

.end # WSubId_729


.sub '' :anon :subid('WSubId_730') :outer('WSubId_729')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    $P2 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P2
    find_lex $P2, '__WLEX_1'
    isa $I1, $P2, "String"
    .tailcall __ARG_2.'_pred'($I1)
# }

.end # WSubId_730


.sub '' :anon :subid('WSubId_731') :outer('WSubId_729')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_732 = "WSubId_732"
# Body
# {
    newclosure $P2, WSubId_732
    __ARG_3.'_form'($P2)
    find_lex $P2, '__WLEX_2'
    .return($P2)
# }

.end # WSubId_731


.sub '' :anon :subid('WSubId_732') :outer('WSubId_731')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_733 = "WSubId_733"
# Body
# {
    __ARG_4.'_applyWithArgs'("exactly", "\"")
    set $P3, WSubId_733
    $P2 = __ARG_4.'_many'($P3)
store_lex '__WLEX_2', $P2
    .tailcall __ARG_4.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_732


.sub '' :anon :subid('WSubId_733') :outer('WSubId_732')
        .param pmc __ARG_5
# Body
# {
    .tailcall __ARG_5.'_apply'("inlineChar")
# }

.end # WSubId_733


.sub '' :anon :subid('WSubId_734') :outer('WSubId_729')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_735 = "WSubId_735"
# Body
# {
    newclosure $P2, WSubId_735
    __ARG_6.'_form'($P2)
    find_lex $P2, '__WLEX_2'
    .return($P2)
# }

.end # WSubId_734


.sub '' :anon :subid('WSubId_735') :outer('WSubId_734')
        .param pmc __ARG_7
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_736 = "WSubId_736"
# Body
# {
    __ARG_7.'_applyWithArgs'("exactly", "'")
    set $P3, WSubId_736
    $P2 = __ARG_7.'_many'($P3)
store_lex '__WLEX_2', $P2
    .tailcall __ARG_7.'_applyWithArgs'("exactly", "'")
# }

.end # WSubId_735


.sub '' :anon :subid('WSubId_736') :outer('WSubId_735')
        .param pmc __ARG_8
# Body
# {
    .tailcall __ARG_8.'_apply'("inlineChar")
# }

.end # WSubId_736

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SeqInliner' ]
    get_class $P1, [ 'NullOptimization' ]
    addparent $P0, $P1
.end
.namespace [ 'JumpTableOptimization' ]

.sub 'Or' :subid('WSubId_737') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_738 = "WSubId_738"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var cs: $P2
    null $P2
    newclosure $P3, WSubId_738
    .tailcall $P3(self)
# }

.end # Or


.sub '' :anon :subid('WSubId_738') :outer('WSubId_737')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_739 = "WSubId_739"
# Body
# {
    set $P3, WSubId_739
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "Or"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_738


.sub '' :anon :subid('WSubId_739') :outer('WSubId_738')
        .param pmc __ARG_2
.const 'Sub' WSubId_740 = "WSubId_740"
.const 'Sub' WSubId_741 = "WSubId_741"
# Body
# {
    set $P1, WSubId_740
    set $P2, WSubId_741
    .tailcall __ARG_2.'_or'($P1, $P2)
# }

.end # WSubId_739


.sub '' :anon :subid('WSubId_740') :outer('WSubId_739')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("jtChoices", "Or")
# }

.end # WSubId_740


.sub '' :anon :subid('WSubId_741') :outer('WSubId_739')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("trans")
# }

.end # WSubId_741


.sub 'XOr' :subid('WSubId_742') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_743 = "WSubId_743"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var cs: $P2
    null $P2
    newclosure $P3, WSubId_743
    .tailcall $P3(self)
# }

.end # XOr


.sub '' :anon :subid('WSubId_743') :outer('WSubId_742')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_744 = "WSubId_744"
# Body
# {
    set $P3, WSubId_744
    $P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_1', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "XOr"
    push $P2, $P3
    find_lex $P4, '__WLEX_1'
    .tailcall $P2.'append'($P4)
# }

.end # WSubId_743


.sub '' :anon :subid('WSubId_744') :outer('WSubId_743')
        .param pmc __ARG_2
.const 'Sub' WSubId_745 = "WSubId_745"
.const 'Sub' WSubId_746 = "WSubId_746"
# Body
# {
    set $P1, WSubId_745
    set $P2, WSubId_746
    .tailcall __ARG_2.'_or'($P1, $P2)
# }

.end # WSubId_744


.sub '' :anon :subid('WSubId_745') :outer('WSubId_744')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_applyWithArgs'("jtChoices", "XOr")
# }

.end # WSubId_745


.sub '' :anon :subid('WSubId_746') :outer('WSubId_744')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("trans")
# }

.end # WSubId_746


.sub 'quotedString' :subid('WSubId_747') :method
.lex '__WLEX_1', $P3
.lex '__WLEX_2', $P2
.const 'Sub' WSubId_748 = "WSubId_748"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var c: $P2
    null $P2
# var cs: $P3
    null $P3
    newclosure $P4, WSubId_748
    .tailcall $P4(self)
# }

.end # quotedString


.sub '' :anon :subid('WSubId_748') :outer('WSubId_747')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_749 = "WSubId_749"
.const 'Sub' WSubId_750 = "WSubId_750"
# Body
# {
    set $P3, WSubId_749
    __ARG_1.'_lookahead'($P3)
    newclosure $P3, WSubId_750
    __ARG_1.'_form'($P3)
    find_lex $P3, '__WLEX_1'
# predefined join
    join $S1, "", $P3
    .return($S1)
# }

.end # WSubId_748


.sub '' :anon :subid('WSubId_749') :outer('WSubId_748')
        .param pmc __ARG_2
# Body
# {
    .tailcall __ARG_2.'_apply'("string")
# }

.end # WSubId_749


.sub '' :anon :subid('WSubId_750') :outer('WSubId_748')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_751 = "WSubId_751"
# Body
# {
    newclosure $P3, WSubId_751
    .tailcall $P3(__ARG_3)
# }

.end # WSubId_750


.sub '' :anon :subid('WSubId_751') :outer('WSubId_750')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_752 = "WSubId_752"
.const 'Sub' WSubId_755 = "WSubId_755"
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
    newclosure $P4, WSubId_752
    .tailcall $P4(__ARG_4)
  __label_4: # case
    newclosure $P5, WSubId_755
    .tailcall $P5(__ARG_4)
  __label_2: # default
    $P6 = __ARG_4.'_fail'()
    throw $P6
  __label_1: # switch end
# }

.end # WSubId_751


.sub '' :anon :subid('WSubId_752') :outer('WSubId_751')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_753 = "WSubId_753"
# Body
# {
    newclosure $P4, WSubId_753
    $P3 = __ARG_5.'_many'($P4)
store_lex '__WLEX_1', $P3
    .tailcall __ARG_5.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_752


.sub '' :anon :subid('WSubId_753') :outer('WSubId_752')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_754 = "WSubId_754"
# Body
# {
    $P2 = __ARG_6.'_applyWithArgs'("foreign", 'OMetaParser', 'eChar')
store_lex '__WLEX_2', $P2
    set $P2, WSubId_754
    __ARG_6.'_not'($P2)
    find_lex $P2, '__WLEX_2'
    .return($P2)
# }

.end # WSubId_753


.sub '' :anon :subid('WSubId_754') :outer('WSubId_753')
        .param pmc __ARG_7
# Body
# {
    .tailcall __ARG_7.'_apply'("end")
# }

.end # WSubId_754


.sub '' :anon :subid('WSubId_755') :outer('WSubId_751')
        .param pmc __ARG_8
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_756 = "WSubId_756"
# Body
# {
    newclosure $P4, WSubId_756
    $P3 = __ARG_8.'_many'($P4)
store_lex '__WLEX_1', $P3
    .tailcall __ARG_8.'_applyWithArgs'("exactly", "'")
# }

.end # WSubId_755


.sub '' :anon :subid('WSubId_756') :outer('WSubId_755')
        .param pmc __ARG_9
    find_lex $P1, '__WLEX_2'
.const 'Sub' WSubId_757 = "WSubId_757"
# Body
# {
    $P2 = __ARG_9.'_applyWithArgs'("foreign", 'OMetaParser', 'eChar')
store_lex '__WLEX_2', $P2
    set $P2, WSubId_757
    __ARG_9.'_not'($P2)
    find_lex $P2, '__WLEX_2'
    .return($P2)
# }

.end # WSubId_756


.sub '' :anon :subid('WSubId_757') :outer('WSubId_756')
        .param pmc __ARG_10
# Body
# {
    .tailcall __ARG_10.'_apply'("end")
# }

.end # WSubId_757


.sub 'jtChoice' :subid('WSubId_758') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.const 'Sub' WSubId_759 = "WSubId_759"
.const 'Sub' WSubId_763 = "WSubId_763"
# Body
# {
# var fromIdx: $P1
    getattribute $P4, self, 'input'
    getattribute $P1, $P4, 'idx'
# var x: $P2
    null $P2
# var rest: $P3
    null $P3
    newclosure $P4, WSubId_759
    newclosure $P5, WSubId_763
    .tailcall self.'_or'($P4, $P5)
# }

.end # jtChoice


.sub '' :anon :subid('WSubId_759') :outer('WSubId_758')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_760 = "WSubId_760"
# Body
# {
    newclosure $P3, WSubId_760
    __ARG_1.'_form'($P3)
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

.end # WSubId_759


.sub '' :anon :subid('WSubId_760') :outer('WSubId_759')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
.const 'Sub' WSubId_761 = "WSubId_761"
.const 'Sub' WSubId_762 = "WSubId_762"
# Body
# {
    __ARG_2.'_applyWithArgs'("exactly", "And")
    newclosure $P3, WSubId_761
    __ARG_2.'_form'($P3)
    set $P4, WSubId_762
    $P3 = __ARG_2.'_many'($P4)
store_lex '__WLEX_2', $P3
    .return(0)
# }

.end # WSubId_760


.sub '' :anon :subid('WSubId_761') :outer('WSubId_760')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
# Body
# {
    __ARG_3.'_applyWithArgs'("exactly", "App")
    __ARG_3.'_applyWithArgs'("exactly", "exactly")
    $P2 = __ARG_3.'_apply'("quotedString")
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_761


.sub '' :anon :subid('WSubId_762') :outer('WSubId_760')
        .param pmc __ARG_4
# Body
# {
    .tailcall __ARG_4.'_apply'("anything")
# }

.end # WSubId_762


.sub '' :anon :subid('WSubId_763') :outer('WSubId_758')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_764 = "WSubId_764"
.const 'Sub' WSubId_785 = "WSubId_785"
# Body
# {
    newclosure $P2, WSubId_764
    __ARG_5.'_form'($P2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    find_lex $P4, '__WLEX_1'
    push $P2, $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    box $P6, "Act"
    push $P5, $P6
    find_lex $P8, '__WLEX_1'
    $P7 = WSubId_785($P8)
    push $P5, $P7
    push $P2, $P5
    .return($P2)
# }

.end # WSubId_763


.sub '' :anon :subid('WSubId_764') :outer('WSubId_763')
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

.end # WSubId_764


.sub 'jtChoices' :subid('WSubId_765') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_766 = "WSubId_766"
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
    newclosure $P5, WSubId_766
    .tailcall $P5(self)
# }

.end # jtChoices


.sub '' :anon :subid('WSubId_766') :outer('WSubId_765')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_767 = "WSubId_767"
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
    newclosure $P4, WSubId_767
    __ARG_1.'_many'($P4)
    __ARG_1.'_apply'("setHelped")
    find_lex $P4, '__WLEX_3'
    .tailcall $P4.'toTree'()
# }

.end # WSubId_766


.sub '' :anon :subid('WSubId_767') :outer('WSubId_766')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_2'
    find_lex $P2, '__WLEX_3'
# Body
# {
    $P3 = __ARG_2.'_apply'("jtChoice")
store_lex '__WLEX_2', $P3
    find_lex $P3, '__WLEX_3'
    find_lex $P4, '__WLEX_2'
    .tailcall $P3.'add'($P4)
# }

.end # WSubId_767

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'JumpTableOptimization' ]
    get_class $P1, [ 'NullOptimization' ]
    addparent $P0, $P1
.end
.namespace [ 'OMetaOptimizer' ]

.sub 'optimizeGrammar' :subid('WSubId_768') :method
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.const 'Sub' WSubId_769 = "WSubId_769"
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
    newclosure $P5, WSubId_769
    .tailcall $P5(self)
# }

.end # optimizeGrammar


.sub '' :anon :subid('WSubId_769') :outer('WSubId_768')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_770 = "WSubId_770"
# Body
# {
    newclosure $P4, WSubId_770
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

.end # WSubId_769


.sub '' :anon :subid('WSubId_770') :outer('WSubId_769')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    find_lex $P3, '__WLEX_3'
.const 'Sub' WSubId_771 = "WSubId_771"
# Body
# {
    __ARG_2.'_applyWithArgs'("exactly", "Grammar")
    $P4 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P4
    $P4 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_2', $P4
    set $P5, WSubId_771
    $P4 = __ARG_2.'_many'($P5)
store_lex '__WLEX_3', $P4
    .return(0)
# }

.end # WSubId_770


.sub '' :anon :subid('WSubId_771') :outer('WSubId_770')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("optimizeRule")
# }

.end # WSubId_771


.sub 'optimizeRule' :subid('WSubId_772') :method
.lex '__WLEX_1', $P2
.const 'Sub' WSubId_773 = "WSubId_773"
# Body
# {
# var fromIdx: $P1
    getattribute $P3, self, 'input'
    getattribute $P1, $P3, 'idx'
# var r: $P2
    null $P2
    newclosure $P3, WSubId_773
    .tailcall $P3(self)
# }

.end # optimizeRule


.sub '' :anon :subid('WSubId_773') :outer('WSubId_772')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_774 = "WSubId_774"
.const 'Sub' WSubId_775 = "WSubId_775"
.const 'Sub' WSubId_776 = "WSubId_776"
# Body
# {
    $P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P2
    newclosure $P2, WSubId_774
    set $P3, WSubId_775
    __ARG_1.'_or'($P2, $P3)
    newclosure $P2, WSubId_776
    __ARG_1.'_many'($P2)
    find_lex $P2, '__WLEX_1'
    .return($P2)
# }

.end # WSubId_773


.sub '' :anon :subid('WSubId_774') :outer('WSubId_773')
        .param pmc __ARG_2
    find_lex $P1, '__WLEX_1'
# Body
# {
    find_lex $P3, '__WLEX_1'
    $P2 = __ARG_2.'_applyWithArgs'("foreign", 'SeqInliner', 'optimize', $P3)
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_774


.sub '' :anon :subid('WSubId_775') :outer('WSubId_773')
        .param pmc __ARG_3
# Body
# {
    .tailcall __ARG_3.'_apply'("empty")
# }

.end # WSubId_775


.sub '' :anon :subid('WSubId_776') :outer('WSubId_773')
        .param pmc __ARG_4
    find_lex $P1, '__WLEX_1'
.const 'Sub' WSubId_777 = "WSubId_777"
.const 'Sub' WSubId_778 = "WSubId_778"
# Body
# {
    newclosure $P2, WSubId_777
    newclosure $P3, WSubId_778
    .tailcall __ARG_4.'_or'($P2, $P3)
# }

.end # WSubId_776


.sub '' :anon :subid('WSubId_777') :outer('WSubId_776')
        .param pmc __ARG_5
    find_lex $P1, '__WLEX_1'
# Body
# {
    find_lex $P3, '__WLEX_1'
    $P2 = __ARG_5.'_applyWithArgs'("foreign", 'AssociativeOptimization', 'optimize', $P3)
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_777


.sub '' :anon :subid('WSubId_778') :outer('WSubId_776')
        .param pmc __ARG_6
    find_lex $P1, '__WLEX_1'
# Body
# {
    find_lex $P3, '__WLEX_1'
    $P2 = __ARG_6.'_applyWithArgs'("foreign", 'JumpTableOptimization', 'optimize', $P3)
store_lex '__WLEX_1', $P2
    .return(0)
# }

.end # WSubId_778

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
.const 'Sub' WSubId_779 = 'keywords_hash'
.annotate 'line', 98
    $P1 = WSubId_779[__ARG_1]
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
.const 'Sub' WSubId_780 = '_isKeyword'
# predefined get_class
.annotate 'line', 103
    get_class $P1, 'WinxedParser'
    $P1.'add_method'('_isKeyword', WSubId_780)
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
.const 'Sub' WSubId_781 = 'jumpTableCode'
# predefined get_class
.annotate 'line', 122
    get_class $P1, 'OMetaTranslator'
    $P1.'add_method'('jumpTableCode', WSubId_781)
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
.const 'Sub' WSubId_782 = 'nullopt_init_pmc'
# predefined get_class
.annotate 'line', 136
    get_class $P1, 'NullOptimization'
    $P1.'add_vtable_override'('init_pmc', WSubId_782)
# }
.annotate 'line', 137

.end # load

# End generated code
