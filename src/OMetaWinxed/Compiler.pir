# Begin generated code

.namespace [ ]

.sub 'escapeStringFor' :anon :immediate

.annotate 'file', 'stage2.winxed'
.annotate 'line', 2
# Body
# {
.annotate 'line', 3
# var ret: $P1
new $P1, [ 'FixedStringArray' ], 256
# for loop
.annotate 'line', 5
# int c: $I1
null $I1
__label_2: # for condition
# predefined elements
elements $I2, $P1
ge $I1, $I2, __label_1
.annotate 'line', 6
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
$P1[$I1] = $S1
__label_0: # for iteration
set $I3, $I1
.annotate 'line', 5
inc $I1
goto __label_2
__label_1: # for end
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


.sub 'escapeChar'
.param string __ARG_1

.annotate 'line', 17
# Body
# {
.annotate 'line', 18
.const 'Sub' $P1 = 'escapeStringFor'
.annotate 'line', 19
# int charCode: $I1
# predefined ord
ord $I1, __ARG_1
.annotate 'line', 20
le $I1, 255, __label_1
# predefined chr
chr $S0, $I1
find_encoding $I0, 'utf8'
trans_encoding $S1, $S0, $I0
goto __label_0
__label_1:
$S1 = $P1[$I1]
__label_0:
.return($S1)
# }
.annotate 'line', 21

.end # escapeChar


.sub 'toProgramString'
.param string __ARG_1

.annotate 'line', 23
# Body
# {
.annotate 'line', 24
# var cs: $P1
new $P1, ['StringBuilder']
.annotate 'line', 25
# pirop push
push $P1, '"'
box $P2, __ARG_1
.annotate 'line', 26
iter $P3, $P2
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $S1, $P3
# {
.annotate 'line', 27
$P4 = 'escapeChar'($S1)
set $S1, $P4
.annotate 'line', 28
# pirop push
push $P1, $S1
# }
goto __label_0
__label_1: # endfor
.annotate 'line', 30
# pirop push
push $P1, '"'
# predefined string
set $S2, $P1
.annotate 'line', 31
.return($S2)
# }
.annotate 'line', 32

.end # toProgramString


.sub 'unescape'
.param string __ARG_1

.annotate 'line', 34
# Body
# {
.annotate 'line', 35
# predefined substr
substr $S2, __ARG_1, 0, 1
ne $S2, "\\", __label_0
# {
.annotate 'line', 36
# string c: $S1
# predefined substr
substr $S1, __ARG_1, 1, 1
set $S2, $S1
set $S3, "\\"
.annotate 'line', 37
if $S2 == $S3 goto __label_4
set $S3, "r"
if $S2 == $S3 goto __label_5
set $S3, "n"
if $S2 == $S3 goto __label_6
set $S3, "t"
if $S2 == $S3 goto __label_7
goto __label_3
# switch
__label_4: # case
.annotate 'line', 38
.return("\\")
__label_5: # case
.annotate 'line', 39
.return("\r")
__label_6: # case
.annotate 'line', 40
.return("\n")
__label_7: # case
.annotate 'line', 41
.return("\t")
__label_3: # default
.annotate 'line', 42
.return($S1)
__label_2: # switch end
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 45
.return(__ARG_1)
# }
__label_1: # endif
# }
.annotate 'line', 47

.end # unescape

.namespace [ 'JumpTable' ]

.sub 'init_pmc' :method :vtable
.param pmc __ARG_1

.annotate 'line', 55
# Body
# {
.annotate 'line', 56
root_new $P2, ['parrot';'Hash']
setattribute self, 'choices', $P2
.annotate 'line', 57
getattribute $P1, self, 'choice'
self.'add'($P1)
null $P2
.annotate 'line', 58
setattribute self, 'choice', $P2
# }
.annotate 'line', 59

.end # init_pmc


.sub 'add' :method
.param pmc __ARG_1

.annotate 'line', 61
# Body
# {
.annotate 'line', 62
# string c: $S1
$S1 = __ARG_1[0]
.annotate 'line', 63
# var t: $P1
$P1 = __ARG_1[1]
.annotate 'line', 64
getattribute $P3, self, 'choices'
$P2 = $P3[$S1]
if_null $P2, __label_0
unless $P2 goto __label_0
# {
.annotate 'line', 65
getattribute $P6, self, 'choices'
$P5 = $P6[$S1]
$P4 = $P5[0]
getattribute $P7, self, 'choiceOp'
ne $P4, $P7, __label_2
.annotate 'line', 66
getattribute $P9, self, 'choices'
$P8 = $P9[$S1]
$P8.'push'($P1)
goto __label_3
__label_2: # else
.annotate 'line', 68
getattribute $P10, self, 'choices'
root_new $P11, ['parrot';'ResizablePMCArray']
getattribute $P13, self, 'choiceOp'
$P11.'push'($P13)
getattribute $P15, self, 'choices'
$P14 = $P15[$S1]
$P11.'push'($P14)
$P11.'push'($P1)
$P10[$S1] = $P11
__label_3: # endif
# }
goto __label_1
__label_0: # else
# {
.annotate 'line', 70
getattribute $P2, self, 'choices'
$P2[$S1] = $P1
# }
__label_1: # endif
# }
.annotate 'line', 72

.end # add


.sub 'toTree' :method

.annotate 'line', 74
# Body
# {
.annotate 'line', 75
# var r: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
box $P3, 'JumpTable'
$P1.'push'($P3)
.annotate 'line', 76
getattribute $P3, self, 'choices'
iter $P4, $P3
set $P4, 0
__label_0: # for iteration
unless $P4 goto __label_1
shift $P2, $P4
.annotate 'line', 77
root_new $P5, ['parrot';'ResizablePMCArray']
# predefined string
set $S1, $P2
box $P6, $S1
$P5.'push'($P6)
getattribute $P8, self, 'choices'
$P7 = $P8[$P2]
$P5.'push'($P7)
$P1.'push'($P5)
goto __label_0
__label_1: # endfor
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

.sub 'fromTo' :subid('WSubId_1') :method

.annotate 'line', 82
.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var y: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_2'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # fromTo


.sub '' :anon :subid('WSubId_2') :outer('WSubId_1')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P2
find_lex $P1, '__WLEX_1'
__ARG_1.'_applyWithArgs'("seq", $P1)
.const 'Sub' $P4 = 'WSubId_3'
newclosure $P3, $P4
__ARG_1.'_many'($P3)
find_lex $P2, '__WLEX_2'
.tailcall __ARG_1.'_applyWithArgs'("seq", $P2)
# }

.end # WSubId_2


.sub '' :anon :subid('WSubId_3') :outer('WSubId_2')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_4'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_3


.sub '' :anon :subid('WSubId_4') :outer('WSubId_3')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P3 = 'WSubId_5'
newclosure $P2, $P3
__ARG_3.'_not'($P2)
.tailcall __ARG_3.'_apply'("char")
# }

.end # WSubId_4


.sub '' :anon :subid('WSubId_5') :outer('WSubId_4')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
# Body
# {
find_lex $P1, '__WLEX_2'
.tailcall __ARG_4.'_applyWithArgs'("seq", $P1)
# }

.end # WSubId_5


.sub 'space' :subid('WSubId_6') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_7'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_8'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_9'
newclosure $P6, $P7
.tailcall self.'_or'($P2, $P4, $P6)
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

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_11'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_12'
newclosure $P4, $P5
.tailcall self.'_or'($P2, $P4)
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

# Body
# {
.const 'Sub' $P3 = 'WSubId_13'
newclosure $P2, $P3
$P1 = $P2(__ARG_2)
.return($P1)
# }

.end # WSubId_12


.sub '' :anon :subid('WSubId_13') :outer('WSubId_12')
.param pmc __ARG_3

# Body
# {
$P1 = __ARG_3.'_apply'('anything')
set $S1, $P1
set $S2, "_"
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return("_")
__label_1: # default
getattribute $P2, __ARG_3, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_13


.sub 'nameRest' :subid('WSubId_14') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_15'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_16'
newclosure $P4, $P5
.tailcall self.'_or'($P2, $P4)
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
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var r: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_18'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # iName


.sub '' :anon :subid('WSubId_18') :outer('WSubId_17')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_applyWithArgs'("firstAndRest", "nameFirst", "nameRest")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
.return($S1)
# }

.end # WSubId_18


.sub 'isKeyword' :subid('WSubId_19') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_20'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # isKeyword


.sub '' :anon :subid('WSubId_20') :outer('WSubId_19')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
$P2 = __ARG_1.'_isKeyword'($P1)
.tailcall __ARG_1.'_pred'($P2)
# }

.end # WSubId_20


.sub 'keyword' :subid('WSubId_21') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var k: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_22'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # keyword


.sub '' :anon :subid('WSubId_22') :outer('WSubId_21')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("iName")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
__ARG_1.'_applyWithArgs'("isKeyword", $P1)
root_new $P2, ['parrot';'ResizablePMCArray']
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_22


.sub 'nameTok' :subid('WSubId_23') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var n: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_24'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # nameTok


.sub '' :anon :subid('WSubId_24') :outer('WSubId_23')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("iName")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "name"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_24


.sub 'hexDigit' :subid('WSubId_25') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var v: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_26'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # hexDigit


.sub '' :anon :subid('WSubId_26') :outer('WSubId_25')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("char")
store_lex '__WLEX_1', $P1
$P3 = __ARG_1["hexDigits"]
find_lex $P1, '__WLEX_1'
$P4 = $P1.'toLowerCase'()
$P2 = $P3.'indexOf'($P4)
store_lex '__WLEX_2', $P2
find_lex $P2, '__WLEX_2'
set $I2, $P2
isge $I1, $I2, 0
__ARG_1.'_pred'($I1)
find_lex $P2, '__WLEX_2'
.return($P2)
# }

.end # WSubId_26


.sub 'hexLit' :subid('WSubId_27') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var n: $P2
null $P2
# var d: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_28'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_30'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # hexLit


.sub '' :anon :subid('WSubId_28') :outer('WSubId_27')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_29'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_28


.sub '' :anon :subid('WSubId_29') :outer('WSubId_28')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_2.'_apply'("hexLit")
store_lex '__WLEX_1', $P1
$P2 = __ARG_2.'_apply'("hexDigit")
store_lex '__WLEX_2', $P2
find_lex $P1, '__WLEX_1'
set $N2, $P1
mul $N1, $N2, 16
find_lex $P2, '__WLEX_2'
set $I2, $N1
set $I3, $P2
add $I1, $I2, $I3
.return($I1)
# }

.end # WSubId_29


.sub '' :anon :subid('WSubId_30') :outer('WSubId_27')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_apply'("hexDigit")
# }

.end # WSubId_30


.sub 'number' :subid('WSubId_31') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P6 = 'WSubId_32'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_35'
newclosure $P7, $P8
.tailcall self.'_or'($P5, $P7)
# }

.end # number


.sub '' :anon :subid('WSubId_32') :outer('WSubId_31')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_33'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_32


.sub '' :anon :subid('WSubId_33') :outer('WSubId_32')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P2 = __ARG_2.'_apply'('anything')
set $S1, $P2
set $S2, "0"
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P5 = 'WSubId_34'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
__label_1: # default
getattribute $P6, __ARG_2, 'fail'
throw $P6
__label_0: # switch end
# }

.end # WSubId_33


.sub '' :anon :subid('WSubId_34') :outer('WSubId_33')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_3.'_applyWithArgs'("exactly", "x")
$P1 = __ARG_3.'_apply'("hexLit")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "number"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_34


.sub '' :anon :subid('WSubId_35') :outer('WSubId_31')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_36'
newclosure $P4, $P5
$P3 = $P4(__ARG_4)
.return($P3)
# }

.end # WSubId_35


.sub '' :anon :subid('WSubId_36') :outer('WSubId_35')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_37'
newclosure $P3, $P4
$P1 = __ARG_5.'_many1'($P3)
store_lex '__WLEX_2', $P1
.const 'Sub' $P4 = 'WSubId_38'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_41'
newclosure $P5, $P6
$P2 = __ARG_5.'_or'($P3, $P5)
store_lex '__WLEX_3', $P2
root_new $P5, ['parrot';'ResizablePMCArray']
box $P6, "number"
$P5.'push'($P6)
# predefined float
find_lex $P1, '__WLEX_2'
# predefined join
join $S1, "", $P1
find_lex $P2, '__WLEX_3'
# predefined join
join $S2, "", $P2
concat $S3, $S1, "."
concat $S3, $S3, $S2
set $N1, $S3
box $P6, $N1
$P5.'push'($P6)
.return($P5)
# }

.end # WSubId_36


.sub '' :anon :subid('WSubId_37') :outer('WSubId_36')
.param pmc __ARG_6

# Body
# {
.tailcall __ARG_6.'_apply'("digit")
# }

.end # WSubId_37


.sub '' :anon :subid('WSubId_38') :outer('WSubId_36')
.param pmc __ARG_7

# Body
# {
.const 'Sub' $P3 = 'WSubId_39'
newclosure $P2, $P3
$P1 = $P2(__ARG_7)
.return($P1)
# }

.end # WSubId_38


.sub '' :anon :subid('WSubId_39') :outer('WSubId_38')
.param pmc __ARG_8

# Body
# {
$P1 = __ARG_8.'_apply'('anything')
set $S1, $P1
set $S2, "."
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P3 = 'WSubId_40'
newclosure $P2, $P3
.tailcall __ARG_8.'_many1'($P2)
__label_1: # default
getattribute $P4, __ARG_8, 'fail'
throw $P4
__label_0: # switch end
# }

.end # WSubId_39


.sub '' :anon :subid('WSubId_40') :outer('WSubId_39')
.param pmc __ARG_9

# Body
# {
.tailcall __ARG_9.'_apply'("digit")
# }

.end # WSubId_40


.sub '' :anon :subid('WSubId_41') :outer('WSubId_36')
.param pmc __ARG_10

# Body
# {
.const 'Sub' $P3 = 'WSubId_42'
newclosure $P2, $P3
$P1 = $P2(__ARG_10)
.return($P1)
# }

.end # WSubId_41


.sub '' :anon :subid('WSubId_42') :outer('WSubId_41')
.param pmc __ARG_11

# Body
# {
__ARG_11.'_apply'("empty")
root_new $P1, ['parrot';'ResizablePMCArray']
.return($P1)
# }

.end # WSubId_42


.sub 'escapeChar' :subid('WSubId_43') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var c: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_44'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # escapeChar


.sub '' :anon :subid('WSubId_44') :outer('WSubId_43')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("exactly", "\\")
$P1 = __ARG_1.'_apply'("char")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "\\", $S1
.tailcall 'unescape'($S2)
# }

.end # WSubId_44


.sub 'str' :subid('WSubId_45') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var cs: $P2
null $P2
# var n: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_46'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_70'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # str


.sub '' :anon :subid('WSubId_46') :outer('WSubId_45')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_47'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_46


.sub '' :anon :subid('WSubId_47') :outer('WSubId_46')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P2 = __ARG_2.'_apply'('anything')
set $S1, $P2
set $S2, "\""
if $S1 == $S2 goto __label_2
set $S2, "\'"
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P4 = 'WSubId_48'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_57'
newclosure $P5, $P6
.tailcall __ARG_2.'_or'($P3, $P5)
__label_3: # case
.const 'Sub' $P9 = 'WSubId_64'
newclosure $P8, $P9
$P7 = $P8(__ARG_2)
.return($P7)
__label_1: # default
getattribute $P10, __ARG_2, 'fail'
throw $P10
__label_0: # switch end
# }

.end # WSubId_47


.sub '' :anon :subid('WSubId_48') :outer('WSubId_47')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_49'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_48


.sub '' :anon :subid('WSubId_49') :outer('WSubId_48')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
$P2 = __ARG_4.'_apply'('anything')
set $S1, $P2
set $S2, "\""
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P5 = 'WSubId_50'
newclosure $P4, $P5
$P3 = $P4(__ARG_4)
.return($P3)
__label_1: # default
getattribute $P6, __ARG_4, 'fail'
throw $P6
__label_0: # switch end
# }

.end # WSubId_49


.sub '' :anon :subid('WSubId_50') :outer('WSubId_49')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_5.'_applyWithArgs'("exactly", "\"")
.const 'Sub' $P3 = 'WSubId_51'
newclosure $P2, $P3
$P1 = __ARG_5.'_many'($P2)
store_lex '__WLEX_1', $P1
__ARG_5.'_applyWithArgs'("exactly", "\"")
__ARG_5.'_applyWithArgs'("exactly", "\"")
__ARG_5.'_applyWithArgs'("exactly", "\"")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "str"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
box $P3, $S1
$P2.'push'($P3)
.return($P2)
# }

.end # WSubId_50


.sub '' :anon :subid('WSubId_51') :outer('WSubId_50')
.param pmc __ARG_6

# Body
# {
.const 'Sub' $P2 = 'WSubId_52'
newclosure $P1, $P2
.const 'Sub' $P4 = 'WSubId_53'
newclosure $P3, $P4
.tailcall __ARG_6.'_or'($P1, $P3)
# }

.end # WSubId_51


.sub '' :anon :subid('WSubId_52') :outer('WSubId_51')
.param pmc __ARG_7

# Body
# {
.tailcall __ARG_7.'_apply'("escapeChar")
# }

.end # WSubId_52


.sub '' :anon :subid('WSubId_53') :outer('WSubId_51')
.param pmc __ARG_8

# Body
# {
.const 'Sub' $P3 = 'WSubId_54'
newclosure $P2, $P3
$P1 = $P2(__ARG_8)
.return($P1)
# }

.end # WSubId_53


.sub '' :anon :subid('WSubId_54') :outer('WSubId_53')
.param pmc __ARG_9

# Body
# {
.const 'Sub' $P2 = 'WSubId_55'
newclosure $P1, $P2
__ARG_9.'_not'($P1)
.tailcall __ARG_9.'_apply'("char")
# }

.end # WSubId_54


.sub '' :anon :subid('WSubId_55') :outer('WSubId_54')
.param pmc __ARG_10

# Body
# {
.const 'Sub' $P3 = 'WSubId_56'
newclosure $P2, $P3
$P1 = $P2(__ARG_10)
.return($P1)
# }

.end # WSubId_55


.sub '' :anon :subid('WSubId_56') :outer('WSubId_55')
.param pmc __ARG_11

# Body
# {
__ARG_11.'_applyWithArgs'("exactly", "\"")
__ARG_11.'_applyWithArgs'("exactly", "\"")
__ARG_11.'_applyWithArgs'("exactly", "\"")
.return("\"\"\"")
# }

.end # WSubId_56


.sub '' :anon :subid('WSubId_57') :outer('WSubId_47')
.param pmc __ARG_12

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_58'
newclosure $P3, $P4
$P2 = $P3(__ARG_12)
.return($P2)
# }

.end # WSubId_57


.sub '' :anon :subid('WSubId_58') :outer('WSubId_57')
.param pmc __ARG_13

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_59'
newclosure $P2, $P3
$P1 = __ARG_13.'_many'($P2)
store_lex '__WLEX_1', $P1
__ARG_13.'_applyWithArgs'("exactly", "\"")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "str"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
box $P3, $S1
$P2.'push'($P3)
.return($P2)
# }

.end # WSubId_58


.sub '' :anon :subid('WSubId_59') :outer('WSubId_58')
.param pmc __ARG_14

# Body
# {
.const 'Sub' $P2 = 'WSubId_60'
newclosure $P1, $P2
.const 'Sub' $P4 = 'WSubId_61'
newclosure $P3, $P4
.tailcall __ARG_14.'_or'($P1, $P3)
# }

.end # WSubId_59


.sub '' :anon :subid('WSubId_60') :outer('WSubId_59')
.param pmc __ARG_15

# Body
# {
.tailcall __ARG_15.'_apply'("escapeChar")
# }

.end # WSubId_60


.sub '' :anon :subid('WSubId_61') :outer('WSubId_59')
.param pmc __ARG_16

# Body
# {
.const 'Sub' $P3 = 'WSubId_62'
newclosure $P2, $P3
$P1 = $P2(__ARG_16)
.return($P1)
# }

.end # WSubId_61


.sub '' :anon :subid('WSubId_62') :outer('WSubId_61')
.param pmc __ARG_17

# Body
# {
.const 'Sub' $P2 = 'WSubId_63'
newclosure $P1, $P2
__ARG_17.'_not'($P1)
.tailcall __ARG_17.'_apply'("char")
# }

.end # WSubId_62


.sub '' :anon :subid('WSubId_63') :outer('WSubId_62')
.param pmc __ARG_18

# Body
# {
.tailcall __ARG_18.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_63


.sub '' :anon :subid('WSubId_64') :outer('WSubId_47')
.param pmc __ARG_19

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_65'
newclosure $P2, $P3
$P1 = __ARG_19.'_many'($P2)
store_lex '__WLEX_1', $P1
__ARG_19.'_applyWithArgs'("exactly", "\'")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "str"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
box $P3, $S1
$P2.'push'($P3)
.return($P2)
# }

.end # WSubId_64


.sub '' :anon :subid('WSubId_65') :outer('WSubId_64')
.param pmc __ARG_20

# Body
# {
.const 'Sub' $P2 = 'WSubId_66'
newclosure $P1, $P2
.const 'Sub' $P4 = 'WSubId_67'
newclosure $P3, $P4
.tailcall __ARG_20.'_or'($P1, $P3)
# }

.end # WSubId_65


.sub '' :anon :subid('WSubId_66') :outer('WSubId_65')
.param pmc __ARG_21

# Body
# {
.tailcall __ARG_21.'_apply'("escapeChar")
# }

.end # WSubId_66


.sub '' :anon :subid('WSubId_67') :outer('WSubId_65')
.param pmc __ARG_22

# Body
# {
.const 'Sub' $P3 = 'WSubId_68'
newclosure $P2, $P3
$P1 = $P2(__ARG_22)
.return($P1)
# }

.end # WSubId_67


.sub '' :anon :subid('WSubId_68') :outer('WSubId_67')
.param pmc __ARG_23

# Body
# {
.const 'Sub' $P2 = 'WSubId_69'
newclosure $P1, $P2
__ARG_23.'_not'($P1)
.tailcall __ARG_23.'_apply'("char")
# }

.end # WSubId_68


.sub '' :anon :subid('WSubId_69') :outer('WSubId_68')
.param pmc __ARG_24

# Body
# {
.tailcall __ARG_24.'_applyWithArgs'("exactly", "\'")
# }

.end # WSubId_69


.sub '' :anon :subid('WSubId_70') :outer('WSubId_45')
.param pmc __ARG_25

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_71'
newclosure $P3, $P4
$P2 = $P3(__ARG_25)
.return($P2)
# }

.end # WSubId_70


.sub '' :anon :subid('WSubId_71') :outer('WSubId_70')
.param pmc __ARG_26

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P3 = 'WSubId_72'
newclosure $P2, $P3
$P2(__ARG_26)
$P1 = __ARG_26.'_apply'("iName")
store_lex '__WLEX_2', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "str"
$P2.'push'($P3)
find_lex $P1, '__WLEX_2'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_71


.sub '' :anon :subid('WSubId_72') :outer('WSubId_71')
.param pmc __ARG_27

# Body
# {
$P1 = __ARG_27.'_apply'('anything')
set $S1, $P1
set $S2, "#"
if $S1 == $S2 goto __label_2
set $S2, "`"
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.return("#")
__label_3: # case
.return("`")
__label_1: # default
getattribute $P2, __ARG_27, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_72


.sub 'special' :subid('WSubId_73') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var s: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_74'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # special


.sub '' :anon :subid('WSubId_74') :outer('WSubId_73')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_75'
newclosure $P2, $P3
$P1 = $P2(__ARG_1)
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_74


.sub '' :anon :subid('WSubId_75') :outer('WSubId_74')
.param pmc __ARG_2

# Body
# {
$P1 = __ARG_2.'_apply'('anything')
set $S1, $P1
set $S2, "("
if $S1 == $S2 goto __label_2
set $S2, ")"
if $S1 == $S2 goto __label_3
set $S2, "{"
if $S1 == $S2 goto __label_4
set $S2, "}"
if $S1 == $S2 goto __label_5
set $S2, "["
if $S1 == $S2 goto __label_6
set $S2, "]"
if $S1 == $S2 goto __label_7
set $S2, ","
if $S1 == $S2 goto __label_8
set $S2, ";"
if $S1 == $S2 goto __label_9
set $S2, "?"
if $S1 == $S2 goto __label_10
set $S2, ":"
if $S1 == $S2 goto __label_11
set $S2, "!"
if $S1 == $S2 goto __label_12
set $S2, "="
if $S1 == $S2 goto __label_13
set $S2, ">"
if $S1 == $S2 goto __label_14
set $S2, "<"
if $S1 == $S2 goto __label_15
set $S2, "+"
if $S1 == $S2 goto __label_16
set $S2, "-"
if $S1 == $S2 goto __label_17
set $S2, "*"
if $S1 == $S2 goto __label_18
set $S2, "/"
if $S1 == $S2 goto __label_19
set $S2, "%"
if $S1 == $S2 goto __label_20
set $S2, "&"
if $S1 == $S2 goto __label_21
set $S2, "|"
if $S1 == $S2 goto __label_22
set $S2, "."
if $S1 == $S2 goto __label_23
goto __label_1
# switch
__label_2: # case
.return("(")
__label_3: # case
.return(")")
__label_4: # case
.return("{")
__label_5: # case
.return("}")
__label_6: # case
.return("[")
__label_7: # case
.return("]")
__label_8: # case
.return(",")
__label_9: # case
.return(";")
__label_10: # case
.return("?")
__label_11: # case
.return(":")
__label_12: # case
.const 'Sub' $P3 = 'WSubId_76'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_81'
newclosure $P4, $P5
.tailcall __ARG_2.'_or'($P2, $P4)
__label_13: # case
.const 'Sub' $P7 = 'WSubId_82'
newclosure $P6, $P7
.const 'Sub' $P9 = 'WSubId_87'
newclosure $P8, $P9
.tailcall __ARG_2.'_or'($P6, $P8)
__label_14: # case
.const 'Sub' $P11 = 'WSubId_88'
newclosure $P10, $P11
.const 'Sub' $P13 = 'WSubId_90'
newclosure $P12, $P13
.tailcall __ARG_2.'_or'($P10, $P12)
__label_15: # case
.const 'Sub' $P15 = 'WSubId_91'
newclosure $P14, $P15
.const 'Sub' $P17 = 'WSubId_93'
newclosure $P16, $P17
.tailcall __ARG_2.'_or'($P14, $P16)
__label_16: # case
.const 'Sub' $P19 = 'WSubId_94'
newclosure $P18, $P19
.const 'Sub' $P21 = 'WSubId_96'
newclosure $P20, $P21
.tailcall __ARG_2.'_or'($P18, $P20)
__label_17: # case
.const 'Sub' $P23 = 'WSubId_97'
newclosure $P22, $P23
.const 'Sub' $P25 = 'WSubId_99'
newclosure $P24, $P25
.tailcall __ARG_2.'_or'($P22, $P24)
__label_18: # case
.const 'Sub' $P27 = 'WSubId_100'
newclosure $P26, $P27
.const 'Sub' $P29 = 'WSubId_102'
newclosure $P28, $P29
.tailcall __ARG_2.'_or'($P26, $P28)
__label_19: # case
.const 'Sub' $P31 = 'WSubId_103'
newclosure $P30, $P31
.const 'Sub' $P33 = 'WSubId_105'
newclosure $P32, $P33
.tailcall __ARG_2.'_or'($P30, $P32)
__label_20: # case
.const 'Sub' $P35 = 'WSubId_106'
newclosure $P34, $P35
.const 'Sub' $P37 = 'WSubId_108'
newclosure $P36, $P37
.tailcall __ARG_2.'_or'($P34, $P36)
__label_21: # case
.const 'Sub' $P40 = 'WSubId_109'
newclosure $P39, $P40
$P38 = $P39(__ARG_2)
.return($P38)
__label_22: # case
.const 'Sub' $P43 = 'WSubId_113'
newclosure $P42, $P43
$P41 = $P42(__ARG_2)
.return($P41)
__label_23: # case
.return(".")
__label_1: # default
getattribute $P44, __ARG_2, 'fail'
throw $P44
__label_0: # switch end
# }

.end # WSubId_75


.sub '' :anon :subid('WSubId_76') :outer('WSubId_75')
.param pmc __ARG_3

# Body
# {
.const 'Sub' $P3 = 'WSubId_77'
newclosure $P2, $P3
$P1 = $P2(__ARG_3)
.return($P1)
# }

.end # WSubId_76


.sub '' :anon :subid('WSubId_77') :outer('WSubId_76')
.param pmc __ARG_4

# Body
# {
$P1 = __ARG_4.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P3 = 'WSubId_78'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_80'
newclosure $P4, $P5
.tailcall __ARG_4.'_or'($P2, $P4)
__label_1: # default
getattribute $P6, __ARG_4, 'fail'
throw $P6
__label_0: # switch end
# }

.end # WSubId_77


.sub '' :anon :subid('WSubId_78') :outer('WSubId_77')
.param pmc __ARG_5

# Body
# {
.const 'Sub' $P3 = 'WSubId_79'
newclosure $P2, $P3
$P1 = $P2(__ARG_5)
.return($P1)
# }

.end # WSubId_78


.sub '' :anon :subid('WSubId_79') :outer('WSubId_78')
.param pmc __ARG_6

# Body
# {
$P1 = __ARG_6.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return("!==")
__label_1: # default
getattribute $P2, __ARG_6, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_79


.sub '' :anon :subid('WSubId_80') :outer('WSubId_77')
.param pmc __ARG_7

# Body
# {
.return("!=")
# }

.end # WSubId_80


.sub '' :anon :subid('WSubId_81') :outer('WSubId_75')
.param pmc __ARG_8

# Body
# {
.return("!")
# }

.end # WSubId_81


.sub '' :anon :subid('WSubId_82') :outer('WSubId_75')
.param pmc __ARG_9

# Body
# {
.const 'Sub' $P3 = 'WSubId_83'
newclosure $P2, $P3
$P1 = $P2(__ARG_9)
.return($P1)
# }

.end # WSubId_82


.sub '' :anon :subid('WSubId_83') :outer('WSubId_82')
.param pmc __ARG_10

# Body
# {
$P1 = __ARG_10.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P3 = 'WSubId_84'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_86'
newclosure $P4, $P5
.tailcall __ARG_10.'_or'($P2, $P4)
__label_1: # default
getattribute $P6, __ARG_10, 'fail'
throw $P6
__label_0: # switch end
# }

.end # WSubId_83


.sub '' :anon :subid('WSubId_84') :outer('WSubId_83')
.param pmc __ARG_11

# Body
# {
.const 'Sub' $P3 = 'WSubId_85'
newclosure $P2, $P3
$P1 = $P2(__ARG_11)
.return($P1)
# }

.end # WSubId_84


.sub '' :anon :subid('WSubId_85') :outer('WSubId_84')
.param pmc __ARG_12

# Body
# {
$P1 = __ARG_12.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return("===")
__label_1: # default
getattribute $P2, __ARG_12, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_85


.sub '' :anon :subid('WSubId_86') :outer('WSubId_83')
.param pmc __ARG_13

# Body
# {
.return("==")
# }

.end # WSubId_86


.sub '' :anon :subid('WSubId_87') :outer('WSubId_75')
.param pmc __ARG_14

# Body
# {
.return("=")
# }

.end # WSubId_87


.sub '' :anon :subid('WSubId_88') :outer('WSubId_75')
.param pmc __ARG_15

# Body
# {
.const 'Sub' $P3 = 'WSubId_89'
newclosure $P2, $P3
$P1 = $P2(__ARG_15)
.return($P1)
# }

.end # WSubId_88


.sub '' :anon :subid('WSubId_89') :outer('WSubId_88')
.param pmc __ARG_16

# Body
# {
$P1 = __ARG_16.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return(">=")
__label_1: # default
getattribute $P2, __ARG_16, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_89


.sub '' :anon :subid('WSubId_90') :outer('WSubId_75')
.param pmc __ARG_17

# Body
# {
.return(">")
# }

.end # WSubId_90


.sub '' :anon :subid('WSubId_91') :outer('WSubId_75')
.param pmc __ARG_18

# Body
# {
.const 'Sub' $P3 = 'WSubId_92'
newclosure $P2, $P3
$P1 = $P2(__ARG_18)
.return($P1)
# }

.end # WSubId_91


.sub '' :anon :subid('WSubId_92') :outer('WSubId_91')
.param pmc __ARG_19

# Body
# {
$P1 = __ARG_19.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return("<=")
__label_1: # default
getattribute $P2, __ARG_19, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_92


.sub '' :anon :subid('WSubId_93') :outer('WSubId_75')
.param pmc __ARG_20

# Body
# {
.return("<")
# }

.end # WSubId_93


.sub '' :anon :subid('WSubId_94') :outer('WSubId_75')
.param pmc __ARG_21

# Body
# {
.const 'Sub' $P3 = 'WSubId_95'
newclosure $P2, $P3
$P1 = $P2(__ARG_21)
.return($P1)
# }

.end # WSubId_94


.sub '' :anon :subid('WSubId_95') :outer('WSubId_94')
.param pmc __ARG_22

# Body
# {
$P1 = __ARG_22.'_apply'('anything')
set $S1, $P1
set $S2, "+"
if $S1 == $S2 goto __label_2
set $S2, "="
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.return("++")
__label_3: # case
.return("+=")
__label_1: # default
getattribute $P2, __ARG_22, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_95


.sub '' :anon :subid('WSubId_96') :outer('WSubId_75')
.param pmc __ARG_23

# Body
# {
.return("+")
# }

.end # WSubId_96


.sub '' :anon :subid('WSubId_97') :outer('WSubId_75')
.param pmc __ARG_24

# Body
# {
.const 'Sub' $P3 = 'WSubId_98'
newclosure $P2, $P3
$P1 = $P2(__ARG_24)
.return($P1)
# }

.end # WSubId_97


.sub '' :anon :subid('WSubId_98') :outer('WSubId_97')
.param pmc __ARG_25

# Body
# {
$P1 = __ARG_25.'_apply'('anything')
set $S1, $P1
set $S2, "-"
if $S1 == $S2 goto __label_2
set $S2, "="
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.return("--")
__label_3: # case
.return("-=")
__label_1: # default
getattribute $P2, __ARG_25, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_98


.sub '' :anon :subid('WSubId_99') :outer('WSubId_75')
.param pmc __ARG_26

# Body
# {
.return("-")
# }

.end # WSubId_99


.sub '' :anon :subid('WSubId_100') :outer('WSubId_75')
.param pmc __ARG_27

# Body
# {
.const 'Sub' $P3 = 'WSubId_101'
newclosure $P2, $P3
$P1 = $P2(__ARG_27)
.return($P1)
# }

.end # WSubId_100


.sub '' :anon :subid('WSubId_101') :outer('WSubId_100')
.param pmc __ARG_28

# Body
# {
$P1 = __ARG_28.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return("*=")
__label_1: # default
getattribute $P2, __ARG_28, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_101


.sub '' :anon :subid('WSubId_102') :outer('WSubId_75')
.param pmc __ARG_29

# Body
# {
.return("*")
# }

.end # WSubId_102


.sub '' :anon :subid('WSubId_103') :outer('WSubId_75')
.param pmc __ARG_30

# Body
# {
.const 'Sub' $P3 = 'WSubId_104'
newclosure $P2, $P3
$P1 = $P2(__ARG_30)
.return($P1)
# }

.end # WSubId_103


.sub '' :anon :subid('WSubId_104') :outer('WSubId_103')
.param pmc __ARG_31

# Body
# {
$P1 = __ARG_31.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return("/=")
__label_1: # default
getattribute $P2, __ARG_31, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_104


.sub '' :anon :subid('WSubId_105') :outer('WSubId_75')
.param pmc __ARG_32

# Body
# {
.return("/")
# }

.end # WSubId_105


.sub '' :anon :subid('WSubId_106') :outer('WSubId_75')
.param pmc __ARG_33

# Body
# {
.const 'Sub' $P3 = 'WSubId_107'
newclosure $P2, $P3
$P1 = $P2(__ARG_33)
.return($P1)
# }

.end # WSubId_106


.sub '' :anon :subid('WSubId_107') :outer('WSubId_106')
.param pmc __ARG_34

# Body
# {
$P1 = __ARG_34.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return("%=")
__label_1: # default
getattribute $P2, __ARG_34, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_107


.sub '' :anon :subid('WSubId_108') :outer('WSubId_75')
.param pmc __ARG_35

# Body
# {
.return("%")
# }

.end # WSubId_108


.sub '' :anon :subid('WSubId_109') :outer('WSubId_75')
.param pmc __ARG_36

# Body
# {
$P1 = __ARG_36.'_apply'('anything')
set $S1, $P1
set $S2, "&"
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P3 = 'WSubId_110'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_112'
newclosure $P4, $P5
.tailcall __ARG_36.'_or'($P2, $P4)
__label_1: # default
getattribute $P6, __ARG_36, 'fail'
throw $P6
__label_0: # switch end
# }

.end # WSubId_109


.sub '' :anon :subid('WSubId_110') :outer('WSubId_109')
.param pmc __ARG_37

# Body
# {
.const 'Sub' $P3 = 'WSubId_111'
newclosure $P2, $P3
$P1 = $P2(__ARG_37)
.return($P1)
# }

.end # WSubId_110


.sub '' :anon :subid('WSubId_111') :outer('WSubId_110')
.param pmc __ARG_38

# Body
# {
$P1 = __ARG_38.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return("&&=")
__label_1: # default
getattribute $P2, __ARG_38, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_111


.sub '' :anon :subid('WSubId_112') :outer('WSubId_109')
.param pmc __ARG_39

# Body
# {
.return("&&")
# }

.end # WSubId_112


.sub '' :anon :subid('WSubId_113') :outer('WSubId_75')
.param pmc __ARG_40

# Body
# {
$P1 = __ARG_40.'_apply'('anything')
set $S1, $P1
set $S2, "|"
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P3 = 'WSubId_114'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_116'
newclosure $P4, $P5
.tailcall __ARG_40.'_or'($P2, $P4)
__label_1: # default
getattribute $P6, __ARG_40, 'fail'
throw $P6
__label_0: # switch end
# }

.end # WSubId_113


.sub '' :anon :subid('WSubId_114') :outer('WSubId_113')
.param pmc __ARG_41

# Body
# {
.const 'Sub' $P3 = 'WSubId_115'
newclosure $P2, $P3
$P1 = $P2(__ARG_41)
.return($P1)
# }

.end # WSubId_114


.sub '' :anon :subid('WSubId_115') :outer('WSubId_114')
.param pmc __ARG_42

# Body
# {
$P1 = __ARG_42.'_apply'('anything')
set $S1, $P1
set $S2, "="
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return("||=")
__label_1: # default
getattribute $P2, __ARG_42, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_115


.sub '' :anon :subid('WSubId_116') :outer('WSubId_113')
.param pmc __ARG_43

# Body
# {
.return("||")
# }

.end # WSubId_116


.sub 'tok' :subid('WSubId_117') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P4 = 'WSubId_118'
newclosure $P3, $P4
$P2 = $P3(self)
.return($P2)
# }

.end # tok


.sub '' :anon :subid('WSubId_118') :outer('WSubId_117')
.param pmc __ARG_1

# Body
# {
__ARG_1.'_apply'("spaces")
.const 'Sub' $P2 = 'WSubId_119'
newclosure $P1, $P2
.const 'Sub' $P4 = 'WSubId_120'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_121'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_122'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_123'
newclosure $P9, $P10
.tailcall __ARG_1.'_or'($P1, $P3, $P5, $P7, $P9)
# }

.end # WSubId_118


.sub '' :anon :subid('WSubId_119') :outer('WSubId_118')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("keyword")
# }

.end # WSubId_119


.sub '' :anon :subid('WSubId_120') :outer('WSubId_118')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_apply'("nameTok")
# }

.end # WSubId_120


.sub '' :anon :subid('WSubId_121') :outer('WSubId_118')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_apply'("number")
# }

.end # WSubId_121


.sub '' :anon :subid('WSubId_122') :outer('WSubId_118')
.param pmc __ARG_5

# Body
# {
.tailcall __ARG_5.'_apply'("str")
# }

.end # WSubId_122


.sub '' :anon :subid('WSubId_123') :outer('WSubId_118')
.param pmc __ARG_6

# Body
# {
.tailcall __ARG_6.'_apply'("special")
# }

.end # WSubId_123


.sub 'toks' :subid('WSubId_124') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var ts: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_125'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # toks


.sub '' :anon :subid('WSubId_125') :outer('WSubId_124')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_126'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
__ARG_1.'_apply'("spaces")
__ARG_1.'_apply'("end")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_125


.sub '' :anon :subid('WSubId_126') :outer('WSubId_125')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("token")
# }

.end # WSubId_126


.sub 'token' :subid('WSubId_127') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var tt: $P2
null $P2
# var t: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_128'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # token


.sub '' :anon :subid('WSubId_128') :outer('WSubId_127')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("tok")
store_lex '__WLEX_2', $P2
$P3 = $P2[0]
find_lex $P1, '__WLEX_1'
iseq $I1, $P3, $P1
__ARG_1.'_pred'($I1)
$P3 = $P2[1]
.return($P3)
# }

.end # WSubId_128


.sub 'name' :subid('WSubId_129') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var t: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_130'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # name


.sub '' :anon :subid('WSubId_130') :outer('WSubId_129')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_apply'("spaces")
$P1 = __ARG_1.'_apply'("nameTok")
store_lex '__WLEX_1', $P1
$P2 = $P1[1]
.return($P2)
# }

.end # WSubId_130


.sub 'expr' :subid('WSubId_131') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
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
.const 'Sub' $P8 = 'WSubId_132'
newclosure $P7, $P8
$P6 = $P7(self)
.return($P6)
# }

.end # expr


.sub '' :anon :subid('WSubId_132') :outer('WSubId_131')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
$P4 = find_lex '__WLEX_4'
# Body
# {
$P1 = __ARG_1.'_apply'("orExpr")
store_lex '__WLEX_1', $P1
.const 'Sub' $P6 = 'WSubId_133'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_135'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_137'
newclosure $P9, $P10
.const 'Sub' $P12 = 'WSubId_139'
newclosure $P11, $P12
.const 'Sub' $P14 = 'WSubId_141'
newclosure $P13, $P14
.const 'Sub' $P16 = 'WSubId_143'
newclosure $P15, $P16
.const 'Sub' $P18 = 'WSubId_145'
newclosure $P17, $P18
.const 'Sub' $P20 = 'WSubId_147'
newclosure $P19, $P20
.const 'Sub' $P22 = 'WSubId_149'
newclosure $P21, $P22
.const 'Sub' $P24 = 'WSubId_151'
newclosure $P23, $P24
.tailcall __ARG_1.'_or'($P5, $P7, $P9, $P11, $P13, $P15, $P17, $P19, $P21, $P23)
# }

.end # WSubId_132


.sub '' :anon :subid('WSubId_133') :outer('WSubId_132')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
$P3 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P6 = 'WSubId_134'
newclosure $P5, $P6
$P4 = $P5(__ARG_2)
.return($P4)
# }

.end # WSubId_133


.sub '' :anon :subid('WSubId_134') :outer('WSubId_133')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
$P3 = find_lex '__WLEX_1'
# Body
# {
__ARG_3.'_applyWithArgs'("token", "?")
$P1 = __ARG_3.'_apply'("expr")
store_lex '__WLEX_2', $P1
__ARG_3.'_applyWithArgs'("token", ":")
$P2 = __ARG_3.'_apply'("expr")
store_lex '__WLEX_3', $P2
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "condExpr"
$P4.'push'($P5)
find_lex $P3, '__WLEX_1'
$P4.'push'($P3)
find_lex $P1, '__WLEX_2'
$P4.'push'($P1)
find_lex $P2, '__WLEX_3'
$P4.'push'($P2)
.return($P4)
# }

.end # WSubId_134


.sub '' :anon :subid('WSubId_135') :outer('WSubId_132')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_136'
newclosure $P4, $P5
$P3 = $P4(__ARG_4)
.return($P3)
# }

.end # WSubId_135


.sub '' :anon :subid('WSubId_136') :outer('WSubId_135')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_5.'_applyWithArgs'("token", "=")
$P1 = __ARG_5.'_apply'("expr")
store_lex '__WLEX_4', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "set"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_4'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_136


.sub '' :anon :subid('WSubId_137') :outer('WSubId_132')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_138'
newclosure $P4, $P5
$P3 = $P4(__ARG_6)
.return($P3)
# }

.end # WSubId_137


.sub '' :anon :subid('WSubId_138') :outer('WSubId_137')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_7.'_applyWithArgs'("token", "+=")
$P1 = __ARG_7.'_apply'("expr")
store_lex '__WLEX_4', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "mset"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
box $P4, "+"
$P3.'push'($P4)
find_lex $P1, '__WLEX_4'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_138


.sub '' :anon :subid('WSubId_139') :outer('WSubId_132')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_140'
newclosure $P4, $P5
$P3 = $P4(__ARG_8)
.return($P3)
# }

.end # WSubId_139


.sub '' :anon :subid('WSubId_140') :outer('WSubId_139')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_9.'_applyWithArgs'("token", "-=")
$P1 = __ARG_9.'_apply'("expr")
store_lex '__WLEX_4', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "mset"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
box $P4, "-"
$P3.'push'($P4)
find_lex $P1, '__WLEX_4'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_140


.sub '' :anon :subid('WSubId_141') :outer('WSubId_132')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_142'
newclosure $P4, $P5
$P3 = $P4(__ARG_10)
.return($P3)
# }

.end # WSubId_141


.sub '' :anon :subid('WSubId_142') :outer('WSubId_141')
.param pmc __ARG_11

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_11.'_applyWithArgs'("token", "*=")
$P1 = __ARG_11.'_apply'("expr")
store_lex '__WLEX_4', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "mset"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
box $P4, "*"
$P3.'push'($P4)
find_lex $P1, '__WLEX_4'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_142


.sub '' :anon :subid('WSubId_143') :outer('WSubId_132')
.param pmc __ARG_12

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_144'
newclosure $P4, $P5
$P3 = $P4(__ARG_12)
.return($P3)
# }

.end # WSubId_143


.sub '' :anon :subid('WSubId_144') :outer('WSubId_143')
.param pmc __ARG_13

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_13.'_applyWithArgs'("token", "/=")
$P1 = __ARG_13.'_apply'("expr")
store_lex '__WLEX_4', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "mset"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
box $P4, "/"
$P3.'push'($P4)
find_lex $P1, '__WLEX_4'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_144


.sub '' :anon :subid('WSubId_145') :outer('WSubId_132')
.param pmc __ARG_14

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_146'
newclosure $P4, $P5
$P3 = $P4(__ARG_14)
.return($P3)
# }

.end # WSubId_145


.sub '' :anon :subid('WSubId_146') :outer('WSubId_145')
.param pmc __ARG_15

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_15.'_applyWithArgs'("token", "%=")
$P1 = __ARG_15.'_apply'("expr")
store_lex '__WLEX_4', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "mset"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
box $P4, "%"
$P3.'push'($P4)
find_lex $P1, '__WLEX_4'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_146


.sub '' :anon :subid('WSubId_147') :outer('WSubId_132')
.param pmc __ARG_16

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_148'
newclosure $P4, $P5
$P3 = $P4(__ARG_16)
.return($P3)
# }

.end # WSubId_147


.sub '' :anon :subid('WSubId_148') :outer('WSubId_147')
.param pmc __ARG_17

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_17.'_applyWithArgs'("token", "&&=")
$P1 = __ARG_17.'_apply'("expr")
store_lex '__WLEX_4', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "mset"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
box $P4, "&&"
$P3.'push'($P4)
find_lex $P1, '__WLEX_4'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_148


.sub '' :anon :subid('WSubId_149') :outer('WSubId_132')
.param pmc __ARG_18

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_150'
newclosure $P4, $P5
$P3 = $P4(__ARG_18)
.return($P3)
# }

.end # WSubId_149


.sub '' :anon :subid('WSubId_150') :outer('WSubId_149')
.param pmc __ARG_19

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_19.'_applyWithArgs'("token", "||=")
$P1 = __ARG_19.'_apply'("expr")
store_lex '__WLEX_4', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "mset"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
box $P4, "||"
$P3.'push'($P4)
find_lex $P1, '__WLEX_4'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_150


.sub '' :anon :subid('WSubId_151') :outer('WSubId_132')
.param pmc __ARG_20

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_152'
newclosure $P3, $P4
$P2 = $P3(__ARG_20)
.return($P2)
# }

.end # WSubId_151


.sub '' :anon :subid('WSubId_152') :outer('WSubId_151')
.param pmc __ARG_21

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_21.'_apply'("empty")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_152


.sub 'orExpr' :subid('WSubId_153') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var y: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_154'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_156'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # orExpr


.sub '' :anon :subid('WSubId_154') :outer('WSubId_153')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_155'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_154


.sub '' :anon :subid('WSubId_155') :outer('WSubId_154')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_2.'_apply'("orExpr")
store_lex '__WLEX_1', $P1
__ARG_2.'_applyWithArgs'("token", "||")
$P2 = __ARG_2.'_apply'("andExpr")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "||"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_155


.sub '' :anon :subid('WSubId_156') :outer('WSubId_153')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_apply'("andExpr")
# }

.end # WSubId_156


.sub 'andExpr' :subid('WSubId_157') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var y: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_158'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_160'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # andExpr


.sub '' :anon :subid('WSubId_158') :outer('WSubId_157')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_159'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_158


.sub '' :anon :subid('WSubId_159') :outer('WSubId_158')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_2.'_apply'("andExpr")
store_lex '__WLEX_1', $P1
__ARG_2.'_applyWithArgs'("token", "&&")
$P2 = __ARG_2.'_apply'("eqExpr")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "&&"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_159


.sub '' :anon :subid('WSubId_160') :outer('WSubId_157')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_apply'("eqExpr")
# }

.end # WSubId_160


.sub 'eqExpr' :subid('WSubId_161') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var y: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_162'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_172'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # eqExpr


.sub '' :anon :subid('WSubId_162') :outer('WSubId_161')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_163'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_162


.sub '' :anon :subid('WSubId_163') :outer('WSubId_162')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_2.'_apply'("eqExpr")
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_164'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_166'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_168'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_170'
newclosure $P9, $P10
.tailcall __ARG_2.'_or'($P3, $P5, $P7, $P9)
# }

.end # WSubId_163


.sub '' :anon :subid('WSubId_164') :outer('WSubId_163')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_165'
newclosure $P4, $P5
$P3 = $P4(__ARG_3)
.return($P3)
# }

.end # WSubId_164


.sub '' :anon :subid('WSubId_165') :outer('WSubId_164')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_4.'_applyWithArgs'("token", "==")
$P1 = __ARG_4.'_apply'("relExpr")
store_lex '__WLEX_2', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "=="
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_165


.sub '' :anon :subid('WSubId_166') :outer('WSubId_163')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_167'
newclosure $P4, $P5
$P3 = $P4(__ARG_5)
.return($P3)
# }

.end # WSubId_166


.sub '' :anon :subid('WSubId_167') :outer('WSubId_166')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_6.'_applyWithArgs'("token", "!=")
$P1 = __ARG_6.'_apply'("relExpr")
store_lex '__WLEX_2', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "!="
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_167


.sub '' :anon :subid('WSubId_168') :outer('WSubId_163')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_169'
newclosure $P4, $P5
$P3 = $P4(__ARG_7)
.return($P3)
# }

.end # WSubId_168


.sub '' :anon :subid('WSubId_169') :outer('WSubId_168')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_8.'_applyWithArgs'("token", "===")
$P1 = __ARG_8.'_apply'("relExpr")
store_lex '__WLEX_2', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "==="
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_169


.sub '' :anon :subid('WSubId_170') :outer('WSubId_163')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_171'
newclosure $P4, $P5
$P3 = $P4(__ARG_9)
.return($P3)
# }

.end # WSubId_170


.sub '' :anon :subid('WSubId_171') :outer('WSubId_170')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_10.'_applyWithArgs'("token", "!==")
$P1 = __ARG_10.'_apply'("relExpr")
store_lex '__WLEX_2', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "!=="
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_171


.sub '' :anon :subid('WSubId_172') :outer('WSubId_161')
.param pmc __ARG_11

# Body
# {
.tailcall __ARG_11.'_apply'("relExpr")
# }

.end # WSubId_172


.sub 'relExpr' :subid('WSubId_173') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var y: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_174'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_186'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # relExpr


.sub '' :anon :subid('WSubId_174') :outer('WSubId_173')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_175'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_174


.sub '' :anon :subid('WSubId_175') :outer('WSubId_174')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_2.'_apply'("relExpr")
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_176'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_178'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_180'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_182'
newclosure $P9, $P10
.const 'Sub' $P12 = 'WSubId_184'
newclosure $P11, $P12
.tailcall __ARG_2.'_or'($P3, $P5, $P7, $P9, $P11)
# }

.end # WSubId_175


.sub '' :anon :subid('WSubId_176') :outer('WSubId_175')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_177'
newclosure $P4, $P5
$P3 = $P4(__ARG_3)
.return($P3)
# }

.end # WSubId_176


.sub '' :anon :subid('WSubId_177') :outer('WSubId_176')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_4.'_applyWithArgs'("token", ">")
$P1 = __ARG_4.'_apply'("addExpr")
store_lex '__WLEX_2', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, ">"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_177


.sub '' :anon :subid('WSubId_178') :outer('WSubId_175')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_179'
newclosure $P4, $P5
$P3 = $P4(__ARG_5)
.return($P3)
# }

.end # WSubId_178


.sub '' :anon :subid('WSubId_179') :outer('WSubId_178')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_6.'_applyWithArgs'("token", ">=")
$P1 = __ARG_6.'_apply'("addExpr")
store_lex '__WLEX_2', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, ">="
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_179


.sub '' :anon :subid('WSubId_180') :outer('WSubId_175')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_181'
newclosure $P4, $P5
$P3 = $P4(__ARG_7)
.return($P3)
# }

.end # WSubId_180


.sub '' :anon :subid('WSubId_181') :outer('WSubId_180')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_8.'_applyWithArgs'("token", "<")
$P1 = __ARG_8.'_apply'("addExpr")
store_lex '__WLEX_2', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "<"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_181


.sub '' :anon :subid('WSubId_182') :outer('WSubId_175')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_183'
newclosure $P4, $P5
$P3 = $P4(__ARG_9)
.return($P3)
# }

.end # WSubId_182


.sub '' :anon :subid('WSubId_183') :outer('WSubId_182')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_10.'_applyWithArgs'("token", "<=")
$P1 = __ARG_10.'_apply'("addExpr")
store_lex '__WLEX_2', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "<="
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_183


.sub '' :anon :subid('WSubId_184') :outer('WSubId_175')
.param pmc __ARG_11

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_185'
newclosure $P4, $P5
$P3 = $P4(__ARG_11)
.return($P3)
# }

.end # WSubId_184


.sub '' :anon :subid('WSubId_185') :outer('WSubId_184')
.param pmc __ARG_12

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_12.'_applyWithArgs'("token", "instanceof")
$P1 = __ARG_12.'_apply'("addExpr")
store_lex '__WLEX_2', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "instanceof"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_185


.sub '' :anon :subid('WSubId_186') :outer('WSubId_173')
.param pmc __ARG_13

# Body
# {
.tailcall __ARG_13.'_apply'("addExpr")
# }

.end # WSubId_186


.sub 'addExpr' :subid('WSubId_187') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var y: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_188'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_190'
newclosure $P6, $P7
.const 'Sub' $P9 = 'WSubId_192'
newclosure $P8, $P9
.tailcall self.'_or'($P4, $P6, $P8)
# }

.end # addExpr


.sub '' :anon :subid('WSubId_188') :outer('WSubId_187')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_189'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_188


.sub '' :anon :subid('WSubId_189') :outer('WSubId_188')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_2.'_apply'("addExpr")
store_lex '__WLEX_1', $P1
__ARG_2.'_applyWithArgs'("token", "+")
$P2 = __ARG_2.'_apply'("mulExpr")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "+"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_189


.sub '' :anon :subid('WSubId_190') :outer('WSubId_187')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_191'
newclosure $P4, $P5
$P3 = $P4(__ARG_3)
.return($P3)
# }

.end # WSubId_190


.sub '' :anon :subid('WSubId_191') :outer('WSubId_190')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_4.'_apply'("addExpr")
store_lex '__WLEX_1', $P1
__ARG_4.'_applyWithArgs'("token", "-")
$P2 = __ARG_4.'_apply'("mulExpr")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "-"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_191


.sub '' :anon :subid('WSubId_192') :outer('WSubId_187')
.param pmc __ARG_5

# Body
# {
.tailcall __ARG_5.'_apply'("mulExpr")
# }

.end # WSubId_192


.sub 'mulExpr' :subid('WSubId_193') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var y: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_194'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_196'
newclosure $P6, $P7
.const 'Sub' $P9 = 'WSubId_198'
newclosure $P8, $P9
.const 'Sub' $P11 = 'WSubId_200'
newclosure $P10, $P11
.tailcall self.'_or'($P4, $P6, $P8, $P10)
# }

.end # mulExpr


.sub '' :anon :subid('WSubId_194') :outer('WSubId_193')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_195'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_194


.sub '' :anon :subid('WSubId_195') :outer('WSubId_194')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_2.'_apply'("mulExpr")
store_lex '__WLEX_1', $P1
__ARG_2.'_applyWithArgs'("token", "*")
$P2 = __ARG_2.'_apply'("unary")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "*"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_195


.sub '' :anon :subid('WSubId_196') :outer('WSubId_193')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_197'
newclosure $P4, $P5
$P3 = $P4(__ARG_3)
.return($P3)
# }

.end # WSubId_196


.sub '' :anon :subid('WSubId_197') :outer('WSubId_196')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_4.'_apply'("mulExpr")
store_lex '__WLEX_1', $P1
__ARG_4.'_applyWithArgs'("token", "/")
$P2 = __ARG_4.'_apply'("unary")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "/"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_197


.sub '' :anon :subid('WSubId_198') :outer('WSubId_193')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_199'
newclosure $P4, $P5
$P3 = $P4(__ARG_5)
.return($P3)
# }

.end # WSubId_198


.sub '' :anon :subid('WSubId_199') :outer('WSubId_198')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_6.'_apply'("mulExpr")
store_lex '__WLEX_1', $P1
__ARG_6.'_applyWithArgs'("token", "%")
$P2 = __ARG_6.'_apply'("unary")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binop"
$P3.'push'($P4)
box $P4, "%"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_199


.sub '' :anon :subid('WSubId_200') :outer('WSubId_193')
.param pmc __ARG_7

# Body
# {
.tailcall __ARG_7.'_apply'("unary")
# }

.end # WSubId_200


.sub 'unary' :subid('WSubId_201') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var p: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_202'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_204'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_206'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_208'
newclosure $P9, $P10
.const 'Sub' $P12 = 'WSubId_210'
newclosure $P11, $P12
.const 'Sub' $P14 = 'WSubId_212'
newclosure $P13, $P14
.tailcall self.'_or'($P3, $P5, $P7, $P9, $P11, $P13)
# }

.end # unary


.sub '' :anon :subid('WSubId_202') :outer('WSubId_201')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_203'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_202


.sub '' :anon :subid('WSubId_203') :outer('WSubId_202')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_2.'_applyWithArgs'("token", "-")
$P1 = __ARG_2.'_apply'("postfix")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "unop"
$P2.'push'($P3)
box $P3, "-"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_203


.sub '' :anon :subid('WSubId_204') :outer('WSubId_201')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_205'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_204


.sub '' :anon :subid('WSubId_205') :outer('WSubId_204')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_4.'_applyWithArgs'("token", "+")
$P1 = __ARG_4.'_apply'("postfix")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "unop"
$P2.'push'($P3)
box $P3, "+"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_205


.sub '' :anon :subid('WSubId_206') :outer('WSubId_201')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_207'
newclosure $P3, $P4
$P2 = $P3(__ARG_5)
.return($P2)
# }

.end # WSubId_206


.sub '' :anon :subid('WSubId_207') :outer('WSubId_206')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_6.'_applyWithArgs'("token", "++")
$P1 = __ARG_6.'_apply'("postfix")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "preop"
$P2.'push'($P3)
box $P3, "++"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_207


.sub '' :anon :subid('WSubId_208') :outer('WSubId_201')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_209'
newclosure $P3, $P4
$P2 = $P3(__ARG_7)
.return($P2)
# }

.end # WSubId_208


.sub '' :anon :subid('WSubId_209') :outer('WSubId_208')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_8.'_applyWithArgs'("token", "--")
$P1 = __ARG_8.'_apply'("postfix")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "preop"
$P2.'push'($P3)
box $P3, "--"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_209


.sub '' :anon :subid('WSubId_210') :outer('WSubId_201')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_211'
newclosure $P3, $P4
$P2 = $P3(__ARG_9)
.return($P2)
# }

.end # WSubId_210


.sub '' :anon :subid('WSubId_211') :outer('WSubId_210')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_10.'_applyWithArgs'("token", "!")
$P1 = __ARG_10.'_apply'("unary")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "unop"
$P2.'push'($P3)
box $P3, "!"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_211


.sub '' :anon :subid('WSubId_212') :outer('WSubId_201')
.param pmc __ARG_11

# Body
# {
.tailcall __ARG_11.'_apply'("postfix")
# }

.end # WSubId_212


.sub 'postfix' :subid('WSubId_213') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var p: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_214'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # postfix


.sub '' :anon :subid('WSubId_214') :outer('WSubId_213')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("primExpr")
store_lex '__WLEX_1', $P1
.const 'Sub' $P3 = 'WSubId_215'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_217'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_219'
newclosure $P6, $P7
.tailcall __ARG_1.'_or'($P2, $P4, $P6)
# }

.end # WSubId_214


.sub '' :anon :subid('WSubId_215') :outer('WSubId_214')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_216'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_215


.sub '' :anon :subid('WSubId_216') :outer('WSubId_215')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_3.'_applyWithArgs'("token", "++")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "postop"
$P2.'push'($P3)
box $P3, "++"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_216


.sub '' :anon :subid('WSubId_217') :outer('WSubId_214')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_218'
newclosure $P3, $P4
$P2 = $P3(__ARG_4)
.return($P2)
# }

.end # WSubId_217


.sub '' :anon :subid('WSubId_218') :outer('WSubId_217')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_5.'_applyWithArgs'("token", "--")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "postop"
$P2.'push'($P3)
box $P3, "--"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_218


.sub '' :anon :subid('WSubId_219') :outer('WSubId_214')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_220'
newclosure $P3, $P4
$P2 = $P3(__ARG_6)
.return($P2)
# }

.end # WSubId_219


.sub '' :anon :subid('WSubId_220') :outer('WSubId_219')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_7.'_apply'("empty")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_220


.sub 'primExpr' :subid('WSubId_221') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.lex '__WLEX_5', $P6
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
.const 'Sub' $P8 = 'WSubId_222'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_232'
newclosure $P9, $P10
.tailcall self.'_or'($P7, $P9)
# }

.end # primExpr


.sub '' :anon :subid('WSubId_222') :outer('WSubId_221')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
$P4 = find_lex '__WLEX_4'
$P5 = find_lex '__WLEX_5'
# Body
# {
.const 'Sub' $P8 = 'WSubId_223'
newclosure $P7, $P8
$P6 = $P7(__ARG_1)
.return($P6)
# }

.end # WSubId_222


.sub '' :anon :subid('WSubId_223') :outer('WSubId_222')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
$P4 = find_lex '__WLEX_4'
$P5 = find_lex '__WLEX_5'
# Body
# {
$P1 = __ARG_2.'_apply'("primExpr")
store_lex '__WLEX_1', $P1
.const 'Sub' $P7 = 'WSubId_224'
newclosure $P6, $P7
.const 'Sub' $P9 = 'WSubId_226'
newclosure $P8, $P9
.const 'Sub' $P11 = 'WSubId_228'
newclosure $P10, $P11
.const 'Sub' $P13 = 'WSubId_230'
newclosure $P12, $P13
.tailcall __ARG_2.'_or'($P6, $P8, $P10, $P12)
# }

.end # WSubId_223


.sub '' :anon :subid('WSubId_224') :outer('WSubId_223')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_225'
newclosure $P4, $P5
$P3 = $P4(__ARG_3)
.return($P3)
# }

.end # WSubId_224


.sub '' :anon :subid('WSubId_225') :outer('WSubId_224')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_4.'_applyWithArgs'("token", "[")
$P1 = __ARG_4.'_apply'("expr")
store_lex '__WLEX_2', $P1
__ARG_4.'_applyWithArgs'("token", "]")
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "getp"
$P3.'push'($P4)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_225


.sub '' :anon :subid('WSubId_226') :outer('WSubId_223')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_4'
$P3 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P6 = 'WSubId_227'
newclosure $P5, $P6
$P4 = $P5(__ARG_5)
.return($P4)
# }

.end # WSubId_226


.sub '' :anon :subid('WSubId_227') :outer('WSubId_226')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_4'
$P3 = find_lex '__WLEX_1'
# Body
# {
__ARG_6.'_applyWithArgs'("token", ".")
$P1 = __ARG_6.'_apply'("name")
store_lex '__WLEX_3', $P1
__ARG_6.'_applyWithArgs'("token", "(")
$P2 = __ARG_6.'_applyWithArgs'("listOf", "expr", ",")
store_lex '__WLEX_4', $P2
__ARG_6.'_applyWithArgs'("token", ")")
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "send"
$P4.'push'($P5)
find_lex $P1, '__WLEX_3'
$P4.'push'($P1)
find_lex $P3, '__WLEX_1'
$P4.'push'($P3)
find_lex $P2, '__WLEX_4'
.tailcall $P4.'append'($P2)
# }

.end # WSubId_227


.sub '' :anon :subid('WSubId_228') :outer('WSubId_223')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_5'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_229'
newclosure $P4, $P5
$P3 = $P4(__ARG_7)
.return($P3)
# }

.end # WSubId_228


.sub '' :anon :subid('WSubId_229') :outer('WSubId_228')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_5'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_8.'_applyWithArgs'("token", ".")
$P1 = __ARG_8.'_apply'("name")
store_lex '__WLEX_5', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "geta"
$P3.'push'($P4)
root_new $P5, ['parrot';'ResizablePMCArray']
box $P6, "get"
$P5.'push'($P6)
find_lex $P1, '__WLEX_5'
$P5.'push'($P1)
$P3.'push'($P5)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_229


.sub '' :anon :subid('WSubId_230') :outer('WSubId_223')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_231'
newclosure $P4, $P5
$P3 = $P4(__ARG_9)
.return($P3)
# }

.end # WSubId_230


.sub '' :anon :subid('WSubId_231') :outer('WSubId_230')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_1'
# Body
# {
__ARG_10.'_applyWithArgs'("token", "(")
$P1 = __ARG_10.'_applyWithArgs'("listOf", "expr", ",")
store_lex '__WLEX_4', $P1
__ARG_10.'_applyWithArgs'("token", ")")
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "call"
$P3.'push'($P4)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
find_lex $P1, '__WLEX_4'
.tailcall $P3.'append'($P1)
# }

.end # WSubId_231


.sub '' :anon :subid('WSubId_232') :outer('WSubId_221')
.param pmc __ARG_11

# Body
# {
.tailcall __ARG_11.'_apply'("primExprHd")
# }

.end # WSubId_232


.sub 'primExprHd' :subid('WSubId_233') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
.lex '__WLEX_5', $P6
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
.const 'Sub' $P8 = 'WSubId_234'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_236'
newclosure $P9, $P10
.const 'Sub' $P12 = 'WSubId_238'
newclosure $P11, $P12
.const 'Sub' $P14 = 'WSubId_240'
newclosure $P13, $P14
.const 'Sub' $P16 = 'WSubId_242'
newclosure $P15, $P16
.const 'Sub' $P18 = 'WSubId_243'
newclosure $P17, $P18
.const 'Sub' $P20 = 'WSubId_251'
newclosure $P19, $P20
.const 'Sub' $P22 = 'WSubId_253'
newclosure $P21, $P22
.const 'Sub' $P24 = 'WSubId_255'
newclosure $P23, $P24
.const 'Sub' $P26 = 'WSubId_256'
newclosure $P25, $P26
.tailcall self.'_or'($P7, $P9, $P11, $P13, $P15, $P17, $P19, $P21, $P23, $P25)
# }

.end # primExprHd


.sub '' :anon :subid('WSubId_234') :outer('WSubId_233')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_235'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_234


.sub '' :anon :subid('WSubId_235') :outer('WSubId_234')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_2.'_applyWithArgs'("token", "(")
$P1 = __ARG_2.'_apply'("expr")
store_lex '__WLEX_1', $P1
__ARG_2.'_applyWithArgs'("token", ")")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_235


.sub '' :anon :subid('WSubId_236') :outer('WSubId_233')
.param pmc __ARG_3

# Body
# {
.const 'Sub' $P3 = 'WSubId_237'
newclosure $P2, $P3
$P1 = $P2(__ARG_3)
.return($P1)
# }

.end # WSubId_236


.sub '' :anon :subid('WSubId_237') :outer('WSubId_236')
.param pmc __ARG_4

# Body
# {
__ARG_4.'_applyWithArgs'("token", "self")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "self"
$P1.'push'($P2)
.return($P1)
# }

.end # WSubId_237


.sub '' :anon :subid('WSubId_238') :outer('WSubId_233')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_239'
newclosure $P3, $P4
$P2 = $P3(__ARG_5)
.return($P2)
# }

.end # WSubId_238


.sub '' :anon :subid('WSubId_239') :outer('WSubId_238')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_6.'_applyWithArgs'("token", "number")
store_lex '__WLEX_2', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "number"
$P2.'push'($P3)
find_lex $P1, '__WLEX_2'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_239


.sub '' :anon :subid('WSubId_240') :outer('WSubId_233')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_241'
newclosure $P3, $P4
$P2 = $P3(__ARG_7)
.return($P2)
# }

.end # WSubId_240


.sub '' :anon :subid('WSubId_241') :outer('WSubId_240')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_8.'_applyWithArgs'("token", "str")
store_lex '__WLEX_3', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "string"
$P2.'push'($P3)
find_lex $P1, '__WLEX_3'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_241


.sub '' :anon :subid('WSubId_242') :outer('WSubId_233')
.param pmc __ARG_9

# Body
# {
.tailcall __ARG_9.'_apply'("anonFunc")
# }

.end # WSubId_242


.sub '' :anon :subid('WSubId_243') :outer('WSubId_233')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_3'
$P3 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P6 = 'WSubId_244'
newclosure $P5, $P6
$P4 = $P5(__ARG_10)
.return($P4)
# }

.end # WSubId_243


.sub '' :anon :subid('WSubId_244') :outer('WSubId_243')
.param pmc __ARG_11

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_3'
$P3 = find_lex '__WLEX_1'
# Body
# {
__ARG_11.'_applyWithArgs'("token", "new")
.const 'Sub' $P5 = 'WSubId_245'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_246'
newclosure $P6, $P7
$P1 = __ARG_11.'_or'($P4, $P6)
store_lex '__WLEX_4', $P1
__ARG_11.'_applyWithArgs'("token", "(")
.const 'Sub' $P5 = 'WSubId_248'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_249'
newclosure $P6, $P7
$P3 = __ARG_11.'_or'($P4, $P6)
store_lex '__WLEX_1', $P3
__ARG_11.'_applyWithArgs'("token", ")")
root_new $P8, ['parrot';'ResizablePMCArray']
box $P9, "new"
$P8.'push'($P9)
find_lex $P1, '__WLEX_4'
$P8.'push'($P1)
find_lex $P3, '__WLEX_1'
$P8.'push'($P3)
.return($P8)
# }

.end # WSubId_244


.sub '' :anon :subid('WSubId_245') :outer('WSubId_244')
.param pmc __ARG_12

# Body
# {
.tailcall __ARG_12.'_apply'("name")
# }

.end # WSubId_245


.sub '' :anon :subid('WSubId_246') :outer('WSubId_244')
.param pmc __ARG_13

$P1 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_247'
newclosure $P3, $P4
$P2 = $P3(__ARG_13)
.return($P2)
# }

.end # WSubId_246


.sub '' :anon :subid('WSubId_247') :outer('WSubId_246')
.param pmc __ARG_14

$P1 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_14.'_applyWithArgs'("token", "str")
store_lex '__WLEX_3', $P1
find_lex $P1, '__WLEX_3'
.tailcall 'toProgramString'($P1)
# }

.end # WSubId_247


.sub '' :anon :subid('WSubId_248') :outer('WSubId_244')
.param pmc __ARG_15

# Body
# {
.tailcall __ARG_15.'_apply'("expr")
# }

.end # WSubId_248


.sub '' :anon :subid('WSubId_249') :outer('WSubId_244')
.param pmc __ARG_16

# Body
# {
.const 'Sub' $P3 = 'WSubId_250'
newclosure $P2, $P3
$P1 = $P2(__ARG_16)
.return($P1)
# }

.end # WSubId_249


.sub '' :anon :subid('WSubId_250') :outer('WSubId_249')
.param pmc __ARG_17

# Body
# {
__ARG_17.'_apply'("empty")
null $P1
.return($P1)
# }

.end # WSubId_250


.sub '' :anon :subid('WSubId_251') :outer('WSubId_233')
.param pmc __ARG_18

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_252'
newclosure $P3, $P4
$P2 = $P3(__ARG_18)
.return($P2)
# }

.end # WSubId_251


.sub '' :anon :subid('WSubId_252') :outer('WSubId_251')
.param pmc __ARG_19

$P1 = find_lex '__WLEX_2'
# Body
# {
__ARG_19.'_applyWithArgs'("token", "new")
$P1 = __ARG_19.'_apply'("name")
store_lex '__WLEX_2', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "new"
$P2.'push'($P3)
find_lex $P1, '__WLEX_2'
$P2.'push'($P1)
null $P4
$P2.'push'($P4)
.return($P2)
# }

.end # WSubId_252


.sub '' :anon :subid('WSubId_253') :outer('WSubId_233')
.param pmc __ARG_20

$P1 = find_lex '__WLEX_5'
# Body
# {
.const 'Sub' $P4 = 'WSubId_254'
newclosure $P3, $P4
$P2 = $P3(__ARG_20)
.return($P2)
# }

.end # WSubId_253


.sub '' :anon :subid('WSubId_254') :outer('WSubId_253')
.param pmc __ARG_21

$P1 = find_lex '__WLEX_5'
# Body
# {
__ARG_21.'_applyWithArgs'("token", "[")
$P1 = __ARG_21.'_applyWithArgs'("listOf", "expr", ",")
store_lex '__WLEX_5', $P1
__ARG_21.'_applyWithArgs'("token", "]")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "arr"
$P2.'push'($P3)
find_lex $P1, '__WLEX_5'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_254


.sub '' :anon :subid('WSubId_255') :outer('WSubId_233')
.param pmc __ARG_22

# Body
# {
.tailcall __ARG_22.'_apply'("json")
# }

.end # WSubId_255


.sub '' :anon :subid('WSubId_256') :outer('WSubId_233')
.param pmc __ARG_23

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_257'
newclosure $P3, $P4
$P2 = $P3(__ARG_23)
.return($P2)
# }

.end # WSubId_256


.sub '' :anon :subid('WSubId_257') :outer('WSubId_256')
.param pmc __ARG_24

$P1 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_24.'_apply'("name")
store_lex '__WLEX_2', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "get"
$P2.'push'($P3)
find_lex $P1, '__WLEX_2'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_257


.sub 'json' :subid('WSubId_258') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var bs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_259'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # json


.sub '' :anon :subid('WSubId_259') :outer('WSubId_258')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("token", "{")
$P1 = __ARG_1.'_applyWithArgs'("listOf", "jsonBinding", ",")
store_lex '__WLEX_1', $P1
__ARG_1.'_applyWithArgs'("token", "}")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "json"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_259


.sub 'jsonBinding' :subid('WSubId_260') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var n: $P2
null $P2
# var v: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_261'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # jsonBinding


.sub '' :anon :subid('WSubId_261') :outer('WSubId_260')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("jsonPropName")
store_lex '__WLEX_1', $P1
__ARG_1.'_applyWithArgs'("token", ":")
$P2 = __ARG_1.'_apply'("expr")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "binding"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_261


.sub 'jsonPropName' :subid('WSubId_262') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_263'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_264'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_265'
newclosure $P6, $P7
.tailcall self.'_or'($P2, $P4, $P6)
# }

.end # jsonPropName


.sub '' :anon :subid('WSubId_263') :outer('WSubId_262')
.param pmc __ARG_1

# Body
# {
.tailcall __ARG_1.'_applyWithArgs'("token", "number")
# }

.end # WSubId_263


.sub '' :anon :subid('WSubId_264') :outer('WSubId_262')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_applyWithArgs'("token", "str")
# }

.end # WSubId_264


.sub '' :anon :subid('WSubId_265') :outer('WSubId_262')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_apply'("name")
# }

.end # WSubId_265


.sub 'formal' :subid('WSubId_266') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var v: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_267'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_269'
newclosure $P5, $P6
.tailcall self.'_or'($P3, $P5)
# }

.end # formal


.sub '' :anon :subid('WSubId_267') :outer('WSubId_266')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_268'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_267


.sub '' :anon :subid('WSubId_268') :outer('WSubId_267')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_2.'_apply'("var")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, " ", $P1
.return($S1)
# }

.end # WSubId_268


.sub '' :anon :subid('WSubId_269') :outer('WSubId_266')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_apply'("name")
# }

.end # WSubId_269


.sub 'anonFunc' :subid('WSubId_270') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var f: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_271'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # anonFunc


.sub '' :anon :subid('WSubId_271') :outer('WSubId_270')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("token", "function")
$P1 = __ARG_1.'_apply'("funcRest")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "anonfunc"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_271


.sub 'funcRest' :subid('WSubId_272') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var fs: $P2
null $P2
# var ss: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_273'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # funcRest


.sub '' :anon :subid('WSubId_273') :outer('WSubId_272')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
__ARG_1.'_applyWithArgs'("token", "(")
$P1 = __ARG_1.'_applyWithArgs'("listOf", "formal", ",")
store_lex '__WLEX_1', $P1
__ARG_1.'_applyWithArgs'("token", ")")
__ARG_1.'_applyWithArgs'("token", "{")
$P2 = __ARG_1.'_apply'("srcElems")
store_lex '__WLEX_2', $P2
__ARG_1.'_applyWithArgs'("token", "}")
root_new $P3, ['parrot';'ResizablePMCArray']
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_273


.sub 'sc' :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.tailcall self.'_applyWithArgs'("token", ";")
# }

.end # sc


.sub 'block' :subid('WSubId_274') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var ss: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_275'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # block


.sub '' :anon :subid('WSubId_275') :outer('WSubId_274')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("token", "{")
$P1 = __ARG_1.'_apply'("srcElems")
store_lex '__WLEX_1', $P1
__ARG_1.'_applyWithArgs'("token", "}")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_275


.sub 'var' :subid('WSubId_276') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var t: $P2
null $P2
# var n: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_277'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # var


.sub '' :anon :subid('WSubId_277') :outer('WSubId_276')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_278'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_279'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_280'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_281'
newclosure $P9, $P10
$P1 = __ARG_1.'_or'($P3, $P5, $P7, $P9)
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("name")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_277


.sub '' :anon :subid('WSubId_278') :outer('WSubId_277')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_applyWithArgs'("token", "var")
# }

.end # WSubId_278


.sub '' :anon :subid('WSubId_279') :outer('WSubId_277')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_applyWithArgs'("token", "string")
# }

.end # WSubId_279


.sub '' :anon :subid('WSubId_280') :outer('WSubId_277')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_applyWithArgs'("token", "int")
# }

.end # WSubId_280


.sub '' :anon :subid('WSubId_281') :outer('WSubId_277')
.param pmc __ARG_5

# Body
# {
.tailcall __ARG_5.'_applyWithArgs'("token", "num")
# }

.end # WSubId_281


.sub 'varInit' :subid('WSubId_282') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var v: $P2
null $P2
# var i: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_283'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # varInit


.sub '' :anon :subid('WSubId_283') :outer('WSubId_282')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("var")
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_284'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_286'
newclosure $P5, $P6
$P2 = __ARG_1.'_or'($P3, $P5)
store_lex '__WLEX_2', $P2
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "varinit"
$P4.'push'($P5)
find_lex $P1, '__WLEX_1'
$P3 = $P4.'append'($P1)
root_new $P6, ['parrot';'ResizablePMCArray']
find_lex $P2, '__WLEX_2'
$P6.'push'($P2)
.tailcall $P3.'append'($P6)
# }

.end # WSubId_283


.sub '' :anon :subid('WSubId_284') :outer('WSubId_283')
.param pmc __ARG_2

# Body
# {
.const 'Sub' $P3 = 'WSubId_285'
newclosure $P2, $P3
$P1 = $P2(__ARG_2)
.return($P1)
# }

.end # WSubId_284


.sub '' :anon :subid('WSubId_285') :outer('WSubId_284')
.param pmc __ARG_3

# Body
# {
__ARG_3.'_applyWithArgs'("token", "=")
.tailcall __ARG_3.'_apply'("expr")
# }

.end # WSubId_285


.sub '' :anon :subid('WSubId_286') :outer('WSubId_283')
.param pmc __ARG_4

# Body
# {
.const 'Sub' $P3 = 'WSubId_287'
newclosure $P2, $P3
$P1 = $P2(__ARG_4)
.return($P1)
# }

.end # WSubId_286


.sub '' :anon :subid('WSubId_287') :outer('WSubId_286')
.param pmc __ARG_5

# Body
# {
__ARG_5.'_apply'("empty")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "get"
$P1.'push'($P2)
box $P2, "null"
$P1.'push'($P2)
.return($P1)
# }

.end # WSubId_287


.sub 'varNoInit' :subid('WSubId_288') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var v: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_289'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # varNoInit


.sub '' :anon :subid('WSubId_289') :outer('WSubId_288')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("var")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "var"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_289


.sub 'stmt' :subid('WSubId_290') :method

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
.const 'Sub' $P15 = 'WSubId_291'
newclosure $P14, $P15
.const 'Sub' $P17 = 'WSubId_292'
newclosure $P16, $P17
.const 'Sub' $P19 = 'WSubId_294'
newclosure $P18, $P19
.const 'Sub' $P21 = 'WSubId_300'
newclosure $P20, $P21
.const 'Sub' $P23 = 'WSubId_302'
newclosure $P22, $P23
.const 'Sub' $P25 = 'WSubId_304'
newclosure $P24, $P25
.const 'Sub' $P27 = 'WSubId_316'
newclosure $P26, $P27
.const 'Sub' $P29 = 'WSubId_320'
newclosure $P28, $P29
.const 'Sub' $P31 = 'WSubId_327'
newclosure $P30, $P31
.const 'Sub' $P33 = 'WSubId_329'
newclosure $P32, $P33
.const 'Sub' $P35 = 'WSubId_331'
newclosure $P34, $P35
.const 'Sub' $P37 = 'WSubId_333'
newclosure $P36, $P37
.const 'Sub' $P39 = 'WSubId_335'
newclosure $P38, $P39
.const 'Sub' $P41 = 'WSubId_340'
newclosure $P40, $P41
.const 'Sub' $P43 = 'WSubId_342'
newclosure $P42, $P43
.const 'Sub' $P45 = 'WSubId_344'
newclosure $P44, $P45
.const 'Sub' $P47 = 'WSubId_346'
newclosure $P46, $P47
.const 'Sub' $P49 = 'WSubId_348'
newclosure $P48, $P49
.tailcall self.'_or'($P14, $P16, $P18, $P20, $P22, $P24, $P26, $P28, $P30, $P32, $P34, $P36, $P38, $P40, $P42, $P44, $P46, $P48)
# }

.end # stmt


.sub '' :anon :subid('WSubId_291') :outer('WSubId_290')
.param pmc __ARG_1

# Body
# {
.tailcall __ARG_1.'_apply'("block")
# }

.end # WSubId_291


.sub '' :anon :subid('WSubId_292') :outer('WSubId_290')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_293'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_292


.sub '' :anon :subid('WSubId_293') :outer('WSubId_292')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_3.'_apply'("varInit")
store_lex '__WLEX_1', $P1
__ARG_3.'_apply'("sc")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_293


.sub '' :anon :subid('WSubId_294') :outer('WSubId_290')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
$P3 = find_lex '__WLEX_4'
# Body
# {
.const 'Sub' $P6 = 'WSubId_295'
newclosure $P5, $P6
$P4 = $P5(__ARG_4)
.return($P4)
# }

.end # WSubId_294


.sub '' :anon :subid('WSubId_295') :outer('WSubId_294')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
$P3 = find_lex '__WLEX_4'
# Body
# {
__ARG_5.'_applyWithArgs'("token", "if")
__ARG_5.'_applyWithArgs'("token", "(")
$P1 = __ARG_5.'_apply'("expr")
store_lex '__WLEX_2', $P1
__ARG_5.'_applyWithArgs'("token", ")")
$P2 = __ARG_5.'_apply'("stmt")
store_lex '__WLEX_3', $P2
.const 'Sub' $P5 = 'WSubId_296'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_298'
newclosure $P6, $P7
$P3 = __ARG_5.'_or'($P4, $P6)
store_lex '__WLEX_4', $P3
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "if"
$P4.'push'($P5)
find_lex $P1, '__WLEX_2'
$P4.'push'($P1)
find_lex $P2, '__WLEX_3'
$P4.'push'($P2)
find_lex $P3, '__WLEX_4'
$P4.'push'($P3)
.return($P4)
# }

.end # WSubId_295


.sub '' :anon :subid('WSubId_296') :outer('WSubId_295')
.param pmc __ARG_6

# Body
# {
.const 'Sub' $P3 = 'WSubId_297'
newclosure $P2, $P3
$P1 = $P2(__ARG_6)
.return($P1)
# }

.end # WSubId_296


.sub '' :anon :subid('WSubId_297') :outer('WSubId_296')
.param pmc __ARG_7

# Body
# {
__ARG_7.'_applyWithArgs'("token", "else")
.tailcall __ARG_7.'_apply'("stmt")
# }

.end # WSubId_297


.sub '' :anon :subid('WSubId_298') :outer('WSubId_295')
.param pmc __ARG_8

# Body
# {
.const 'Sub' $P3 = 'WSubId_299'
newclosure $P2, $P3
$P1 = $P2(__ARG_8)
.return($P1)
# }

.end # WSubId_298


.sub '' :anon :subid('WSubId_299') :outer('WSubId_298')
.param pmc __ARG_9

# Body
# {
__ARG_9.'_apply'("empty")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "get"
$P1.'push'($P2)
box $P2, ""
$P1.'push'($P2)
.return($P1)
# }

.end # WSubId_299


.sub '' :anon :subid('WSubId_300') :outer('WSubId_290')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_5'
# Body
# {
.const 'Sub' $P5 = 'WSubId_301'
newclosure $P4, $P5
$P3 = $P4(__ARG_10)
.return($P3)
# }

.end # WSubId_300


.sub '' :anon :subid('WSubId_301') :outer('WSubId_300')
.param pmc __ARG_11

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_5'
# Body
# {
__ARG_11.'_applyWithArgs'("token", "while")
__ARG_11.'_applyWithArgs'("token", "(")
$P1 = __ARG_11.'_apply'("expr")
store_lex '__WLEX_2', $P1
__ARG_11.'_applyWithArgs'("token", ")")
$P2 = __ARG_11.'_apply'("stmt")
store_lex '__WLEX_5', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "while"
$P3.'push'($P4)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
find_lex $P2, '__WLEX_5'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_301


.sub '' :anon :subid('WSubId_302') :outer('WSubId_290')
.param pmc __ARG_12

$P1 = find_lex '__WLEX_5'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_303'
newclosure $P4, $P5
$P3 = $P4(__ARG_12)
.return($P3)
# }

.end # WSubId_302


.sub '' :anon :subid('WSubId_303') :outer('WSubId_302')
.param pmc __ARG_13

$P1 = find_lex '__WLEX_5'
$P2 = find_lex '__WLEX_2'
# Body
# {
__ARG_13.'_applyWithArgs'("token", "do")
$P1 = __ARG_13.'_apply'("stmt")
store_lex '__WLEX_5', $P1
__ARG_13.'_applyWithArgs'("token", "while")
__ARG_13.'_applyWithArgs'("token", "(")
$P2 = __ARG_13.'_apply'("expr")
store_lex '__WLEX_2', $P2
__ARG_13.'_applyWithArgs'("token", ")")
__ARG_13.'_apply'("sc")
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "doWhile"
$P3.'push'($P4)
find_lex $P1, '__WLEX_5'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_303


.sub '' :anon :subid('WSubId_304') :outer('WSubId_290')
.param pmc __ARG_14

$P1 = find_lex '__WLEX_6'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_7'
$P4 = find_lex '__WLEX_5'
# Body
# {
.const 'Sub' $P7 = 'WSubId_305'
newclosure $P6, $P7
$P5 = $P6(__ARG_14)
.return($P5)
# }

.end # WSubId_304


.sub '' :anon :subid('WSubId_305') :outer('WSubId_304')
.param pmc __ARG_15

$P1 = find_lex '__WLEX_6'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_7'
$P4 = find_lex '__WLEX_5'
# Body
# {
__ARG_15.'_applyWithArgs'("token", "for")
__ARG_15.'_applyWithArgs'("token", "(")
.const 'Sub' $P6 = 'WSubId_306'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_307'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_308'
newclosure $P9, $P10
$P1 = __ARG_15.'_or'($P5, $P7, $P9)
store_lex '__WLEX_6', $P1
__ARG_15.'_applyWithArgs'("token", ";")
.const 'Sub' $P6 = 'WSubId_310'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_311'
newclosure $P7, $P8
$P2 = __ARG_15.'_or'($P5, $P7)
store_lex '__WLEX_2', $P2
__ARG_15.'_applyWithArgs'("token", ";")
.const 'Sub' $P10 = 'WSubId_313'
newclosure $P9, $P10
.const 'Sub' $P12 = 'WSubId_314'
newclosure $P11, $P12
$P3 = __ARG_15.'_or'($P9, $P11)
store_lex '__WLEX_7', $P3
__ARG_15.'_applyWithArgs'("token", ")")
$P4 = __ARG_15.'_apply'("stmt")
store_lex '__WLEX_5', $P4
root_new $P11, ['parrot';'ResizablePMCArray']
box $P12, "for"
$P11.'push'($P12)
find_lex $P1, '__WLEX_6'
$P11.'push'($P1)
find_lex $P2, '__WLEX_2'
$P11.'push'($P2)
find_lex $P3, '__WLEX_7'
$P11.'push'($P3)
find_lex $P4, '__WLEX_5'
$P11.'push'($P4)
.return($P11)
# }

.end # WSubId_305


.sub '' :anon :subid('WSubId_306') :outer('WSubId_305')
.param pmc __ARG_16

# Body
# {
.tailcall __ARG_16.'_apply'("varInit")
# }

.end # WSubId_306


.sub '' :anon :subid('WSubId_307') :outer('WSubId_305')
.param pmc __ARG_17

# Body
# {
.tailcall __ARG_17.'_apply'("expr")
# }

.end # WSubId_307


.sub '' :anon :subid('WSubId_308') :outer('WSubId_305')
.param pmc __ARG_18

# Body
# {
.const 'Sub' $P3 = 'WSubId_309'
newclosure $P2, $P3
$P1 = $P2(__ARG_18)
.return($P1)
# }

.end # WSubId_308


.sub '' :anon :subid('WSubId_309') :outer('WSubId_308')
.param pmc __ARG_19

# Body
# {
__ARG_19.'_apply'("empty")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "get"
$P1.'push'($P2)
box $P2, "null"
$P1.'push'($P2)
.return($P1)
# }

.end # WSubId_309


.sub '' :anon :subid('WSubId_310') :outer('WSubId_305')
.param pmc __ARG_20

# Body
# {
.tailcall __ARG_20.'_apply'("expr")
# }

.end # WSubId_310


.sub '' :anon :subid('WSubId_311') :outer('WSubId_305')
.param pmc __ARG_21

# Body
# {
.const 'Sub' $P3 = 'WSubId_312'
newclosure $P2, $P3
$P1 = $P2(__ARG_21)
.return($P1)
# }

.end # WSubId_311


.sub '' :anon :subid('WSubId_312') :outer('WSubId_311')
.param pmc __ARG_22

# Body
# {
__ARG_22.'_apply'("empty")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "get"
$P1.'push'($P2)
box $P2, "true"
$P1.'push'($P2)
.return($P1)
# }

.end # WSubId_312


.sub '' :anon :subid('WSubId_313') :outer('WSubId_305')
.param pmc __ARG_23

# Body
# {
.tailcall __ARG_23.'_apply'("expr")
# }

.end # WSubId_313


.sub '' :anon :subid('WSubId_314') :outer('WSubId_305')
.param pmc __ARG_24

# Body
# {
.const 'Sub' $P3 = 'WSubId_315'
newclosure $P2, $P3
$P1 = $P2(__ARG_24)
.return($P1)
# }

.end # WSubId_314


.sub '' :anon :subid('WSubId_315') :outer('WSubId_314')
.param pmc __ARG_25

# Body
# {
__ARG_25.'_apply'("empty")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "get"
$P1.'push'($P2)
box $P2, "null"
$P1.'push'($P2)
.return($P1)
# }

.end # WSubId_315


.sub '' :anon :subid('WSubId_316') :outer('WSubId_290')
.param pmc __ARG_26

$P1 = find_lex '__WLEX_8'
$P2 = find_lex '__WLEX_9'
$P3 = find_lex '__WLEX_5'
# Body
# {
.const 'Sub' $P6 = 'WSubId_317'
newclosure $P5, $P6
$P4 = $P5(__ARG_26)
.return($P4)
# }

.end # WSubId_316


.sub '' :anon :subid('WSubId_317') :outer('WSubId_316')
.param pmc __ARG_27

$P1 = find_lex '__WLEX_8'
$P2 = find_lex '__WLEX_9'
$P3 = find_lex '__WLEX_5'
# Body
# {
__ARG_27.'_applyWithArgs'("token", "for")
__ARG_27.'_applyWithArgs'("token", "(")
.const 'Sub' $P5 = 'WSubId_318'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_319'
newclosure $P6, $P7
$P1 = __ARG_27.'_or'($P4, $P6)
store_lex '__WLEX_8', $P1
__ARG_27.'_applyWithArgs'("token", "in")
$P2 = __ARG_27.'_apply'("expr")
store_lex '__WLEX_9', $P2
__ARG_27.'_applyWithArgs'("token", ")")
$P3 = __ARG_27.'_apply'("stmt")
store_lex '__WLEX_5', $P3
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "forIn"
$P4.'push'($P5)
find_lex $P1, '__WLEX_8'
$P4.'push'($P1)
find_lex $P2, '__WLEX_9'
$P4.'push'($P2)
find_lex $P3, '__WLEX_5'
$P4.'push'($P3)
.return($P4)
# }

.end # WSubId_317


.sub '' :anon :subid('WSubId_318') :outer('WSubId_317')
.param pmc __ARG_28

# Body
# {
.tailcall __ARG_28.'_apply'("varNoInit")
# }

.end # WSubId_318


.sub '' :anon :subid('WSubId_319') :outer('WSubId_317')
.param pmc __ARG_29

# Body
# {
.tailcall __ARG_29.'_apply'("expr")
# }

.end # WSubId_319


.sub '' :anon :subid('WSubId_320') :outer('WSubId_290')
.param pmc __ARG_30

$P1 = find_lex '__WLEX_9'
$P2 = find_lex '__WLEX_10'
$P3 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P6 = 'WSubId_321'
newclosure $P5, $P6
$P4 = $P5(__ARG_30)
.return($P4)
# }

.end # WSubId_320


.sub '' :anon :subid('WSubId_321') :outer('WSubId_320')
.param pmc __ARG_31

$P1 = find_lex '__WLEX_9'
$P2 = find_lex '__WLEX_10'
$P3 = find_lex '__WLEX_2'
# Body
# {
__ARG_31.'_applyWithArgs'("token", "switch")
__ARG_31.'_applyWithArgs'("token", "(")
$P1 = __ARG_31.'_apply'("expr")
store_lex '__WLEX_9', $P1
__ARG_31.'_applyWithArgs'("token", ")")
__ARG_31.'_applyWithArgs'("token", "{")
.const 'Sub' $P5 = 'WSubId_322'
newclosure $P4, $P5
$P2 = __ARG_31.'_many'($P4)
store_lex '__WLEX_10', $P2
__ARG_31.'_applyWithArgs'("token", "}")
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "switch"
$P4.'push'($P5)
find_lex $P1, '__WLEX_9'
$P4.'push'($P1)
find_lex $P2, '__WLEX_10'
.tailcall $P4.'append'($P2)
# }

.end # WSubId_321


.sub '' :anon :subid('WSubId_322') :outer('WSubId_321')
.param pmc __ARG_32

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_10'
# Body
# {
.const 'Sub' $P4 = 'WSubId_323'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_325'
newclosure $P5, $P6
.tailcall __ARG_32.'_or'($P3, $P5)
# }

.end # WSubId_322


.sub '' :anon :subid('WSubId_323') :outer('WSubId_322')
.param pmc __ARG_33

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_10'
# Body
# {
.const 'Sub' $P5 = 'WSubId_324'
newclosure $P4, $P5
$P3 = $P4(__ARG_33)
.return($P3)
# }

.end # WSubId_323


.sub '' :anon :subid('WSubId_324') :outer('WSubId_323')
.param pmc __ARG_34

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_10'
# Body
# {
__ARG_34.'_applyWithArgs'("token", "case")
$P1 = __ARG_34.'_apply'("expr")
store_lex '__WLEX_2', $P1
__ARG_34.'_applyWithArgs'("token", ":")
$P2 = __ARG_34.'_apply'("srcElems")
store_lex '__WLEX_10', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "case"
$P3.'push'($P4)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
find_lex $P2, '__WLEX_10'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_324


.sub '' :anon :subid('WSubId_325') :outer('WSubId_322')
.param pmc __ARG_35

$P1 = find_lex '__WLEX_10'
# Body
# {
.const 'Sub' $P4 = 'WSubId_326'
newclosure $P3, $P4
$P2 = $P3(__ARG_35)
.return($P2)
# }

.end # WSubId_325


.sub '' :anon :subid('WSubId_326') :outer('WSubId_325')
.param pmc __ARG_36

$P1 = find_lex '__WLEX_10'
# Body
# {
__ARG_36.'_applyWithArgs'("token", "default")
__ARG_36.'_applyWithArgs'("token", ":")
$P1 = __ARG_36.'_apply'("srcElems")
store_lex '__WLEX_10', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "default"
$P2.'push'($P3)
find_lex $P1, '__WLEX_10'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_326


.sub '' :anon :subid('WSubId_327') :outer('WSubId_290')
.param pmc __ARG_37

# Body
# {
.const 'Sub' $P3 = 'WSubId_328'
newclosure $P2, $P3
$P1 = $P2(__ARG_37)
.return($P1)
# }

.end # WSubId_327


.sub '' :anon :subid('WSubId_328') :outer('WSubId_327')
.param pmc __ARG_38

# Body
# {
__ARG_38.'_applyWithArgs'("token", "break")
__ARG_38.'_apply'("sc")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "break"
$P1.'push'($P2)
.return($P1)
# }

.end # WSubId_328


.sub '' :anon :subid('WSubId_329') :outer('WSubId_290')
.param pmc __ARG_39

# Body
# {
.const 'Sub' $P3 = 'WSubId_330'
newclosure $P2, $P3
$P1 = $P2(__ARG_39)
.return($P1)
# }

.end # WSubId_329


.sub '' :anon :subid('WSubId_330') :outer('WSubId_329')
.param pmc __ARG_40

# Body
# {
__ARG_40.'_applyWithArgs'("token", "continue")
__ARG_40.'_apply'("sc")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "continue"
$P1.'push'($P2)
.return($P1)
# }

.end # WSubId_330


.sub '' :anon :subid('WSubId_331') :outer('WSubId_290')
.param pmc __ARG_41

$P1 = find_lex '__WLEX_9'
# Body
# {
.const 'Sub' $P4 = 'WSubId_332'
newclosure $P3, $P4
$P2 = $P3(__ARG_41)
.return($P2)
# }

.end # WSubId_331


.sub '' :anon :subid('WSubId_332') :outer('WSubId_331')
.param pmc __ARG_42

$P1 = find_lex '__WLEX_9'
# Body
# {
__ARG_42.'_applyWithArgs'("token", "throw")
$P1 = __ARG_42.'_apply'("expr")
store_lex '__WLEX_9', $P1
__ARG_42.'_apply'("sc")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "throw"
$P2.'push'($P3)
find_lex $P1, '__WLEX_9'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_332


.sub '' :anon :subid('WSubId_333') :outer('WSubId_290')
.param pmc __ARG_43

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_9'
$P3 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P6 = 'WSubId_334'
newclosure $P5, $P6
$P4 = $P5(__ARG_43)
.return($P4)
# }

.end # WSubId_333


.sub '' :anon :subid('WSubId_334') :outer('WSubId_333')
.param pmc __ARG_44

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_9'
$P3 = find_lex '__WLEX_2'
# Body
# {
__ARG_44.'_applyWithArgs'("token", "try")
$P1 = __ARG_44.'_apply'("block")
store_lex '__WLEX_3', $P1
__ARG_44.'_applyWithArgs'("token", "catch")
__ARG_44.'_applyWithArgs'("token", "(")
$P2 = __ARG_44.'_apply'("name")
store_lex '__WLEX_9', $P2
__ARG_44.'_applyWithArgs'("token", ")")
$P3 = __ARG_44.'_apply'("block")
store_lex '__WLEX_2', $P3
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "try"
$P4.'push'($P5)
find_lex $P1, '__WLEX_3'
$P4.'push'($P1)
find_lex $P2, '__WLEX_9'
$P4.'push'($P2)
find_lex $P3, '__WLEX_2'
$P4.'push'($P3)
.return($P4)
# }

.end # WSubId_334


.sub '' :anon :subid('WSubId_335') :outer('WSubId_290')
.param pmc __ARG_45

$P1 = find_lex '__WLEX_9'
# Body
# {
.const 'Sub' $P4 = 'WSubId_336'
newclosure $P3, $P4
$P2 = $P3(__ARG_45)
.return($P2)
# }

.end # WSubId_335


.sub '' :anon :subid('WSubId_336') :outer('WSubId_335')
.param pmc __ARG_46

$P1 = find_lex '__WLEX_9'
# Body
# {
__ARG_46.'_applyWithArgs'("token", "return")
.const 'Sub' $P3 = 'WSubId_337'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_338'
newclosure $P4, $P5
$P1 = __ARG_46.'_or'($P2, $P4)
store_lex '__WLEX_9', $P1
__ARG_46.'_apply'("sc")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "return"
$P2.'push'($P3)
find_lex $P1, '__WLEX_9'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_336


.sub '' :anon :subid('WSubId_337') :outer('WSubId_336')
.param pmc __ARG_47

# Body
# {
.tailcall __ARG_47.'_apply'("expr")
# }

.end # WSubId_337


.sub '' :anon :subid('WSubId_338') :outer('WSubId_336')
.param pmc __ARG_48

# Body
# {
.const 'Sub' $P3 = 'WSubId_339'
newclosure $P2, $P3
$P1 = $P2(__ARG_48)
.return($P1)
# }

.end # WSubId_338


.sub '' :anon :subid('WSubId_339') :outer('WSubId_338')
.param pmc __ARG_49

# Body
# {
__ARG_49.'_apply'("empty")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "get"
$P1.'push'($P2)
null $P3
$P1.'push'($P3)
.return($P1)
# }

.end # WSubId_339


.sub '' :anon :subid('WSubId_340') :outer('WSubId_290')
.param pmc __ARG_50

$P1 = find_lex '__WLEX_9'
# Body
# {
.const 'Sub' $P4 = 'WSubId_341'
newclosure $P3, $P4
$P2 = $P3(__ARG_50)
.return($P2)
# }

.end # WSubId_340


.sub '' :anon :subid('WSubId_341') :outer('WSubId_340')
.param pmc __ARG_51

$P1 = find_lex '__WLEX_9'
# Body
# {
$P1 = __ARG_51.'_apply'("expr")
store_lex '__WLEX_9', $P1
__ARG_51.'_apply'("sc")
find_lex $P1, '__WLEX_9'
.return($P1)
# }

.end # WSubId_341


.sub '' :anon :subid('WSubId_342') :outer('WSubId_290')
.param pmc __ARG_52

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_11'
# Body
# {
.const 'Sub' $P5 = 'WSubId_343'
newclosure $P4, $P5
$P3 = $P4(__ARG_52)
.return($P3)
# }

.end # WSubId_342


.sub '' :anon :subid('WSubId_343') :outer('WSubId_342')
.param pmc __ARG_53

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_11'
# Body
# {
__ARG_53.'_applyWithArgs'("token", "using")
$P1 = __ARG_53.'_applyWithArgs'("token", "static")
store_lex '__WLEX_3', $P1
$P2 = __ARG_53.'_apply'("name")
store_lex '__WLEX_11', $P2
__ARG_53.'_apply'("sc")
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "using"
$P3.'push'($P4)
find_lex $P2, '__WLEX_11'
$P3.'push'($P2)
find_lex $P1, '__WLEX_3'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_343


.sub '' :anon :subid('WSubId_344') :outer('WSubId_290')
.param pmc __ARG_54

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_12'
# Body
# {
.const 'Sub' $P5 = 'WSubId_345'
newclosure $P4, $P5
$P3 = $P4(__ARG_54)
.return($P3)
# }

.end # WSubId_344


.sub '' :anon :subid('WSubId_345') :outer('WSubId_344')
.param pmc __ARG_55

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_12'
# Body
# {
__ARG_55.'_applyWithArgs'("token", "using")
$P1 = __ARG_55.'_applyWithArgs'("token", "extern")
store_lex '__WLEX_3', $P1
$P2 = __ARG_55.'_applyWithArgs'("listOf", "name", ".")
store_lex '__WLEX_12', $P2
__ARG_55.'_apply'("sc")
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "using"
$P3.'push'($P4)
find_lex $P2, '__WLEX_12'
# predefined join
join $S1, ".", $P2
box $P4, $S1
$P3.'push'($P4)
find_lex $P1, '__WLEX_3'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_345


.sub '' :anon :subid('WSubId_346') :outer('WSubId_290')
.param pmc __ARG_56

$P1 = find_lex '__WLEX_12'
# Body
# {
.const 'Sub' $P4 = 'WSubId_347'
newclosure $P3, $P4
$P2 = $P3(__ARG_56)
.return($P2)
# }

.end # WSubId_346


.sub '' :anon :subid('WSubId_347') :outer('WSubId_346')
.param pmc __ARG_57

$P1 = find_lex '__WLEX_12'
# Body
# {
__ARG_57.'_applyWithArgs'("token", "using")
$P1 = __ARG_57.'_applyWithArgs'("listOf", "name", ".")
store_lex '__WLEX_12', $P1
__ARG_57.'_apply'("sc")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "using"
$P2.'push'($P3)
find_lex $P1, '__WLEX_12'
# predefined join
join $S1, ".", $P1
box $P3, $S1
$P2.'push'($P3)
null $P4
$P2.'push'($P4)
.return($P2)
# }

.end # WSubId_347


.sub '' :anon :subid('WSubId_348') :outer('WSubId_290')
.param pmc __ARG_58

# Body
# {
.const 'Sub' $P3 = 'WSubId_349'
newclosure $P2, $P3
$P1 = $P2(__ARG_58)
.return($P1)
# }

.end # WSubId_348


.sub '' :anon :subid('WSubId_349') :outer('WSubId_348')
.param pmc __ARG_59

# Body
# {
__ARG_59.'_applyWithArgs'("token", ";")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "get"
$P1.'push'($P2)
box $P2, "null"
$P1.'push'($P2)
.return($P1)
# }

.end # WSubId_349


.sub 'classRest' :subid('WSubId_350') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var es: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_351'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # classRest


.sub '' :anon :subid('WSubId_351') :outer('WSubId_350')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("token", "{")
.const 'Sub' $P3 = 'WSubId_352'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
__ARG_1.'_applyWithArgs'("token", "}")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "begin"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_351


.sub '' :anon :subid('WSubId_352') :outer('WSubId_351')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("classElem")
# }

.end # WSubId_352


.sub 'classBases' :subid('WSubId_353') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var bs: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_354'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_356'
newclosure $P5, $P6
.tailcall self.'_or'($P3, $P5)
# }

.end # classBases


.sub '' :anon :subid('WSubId_354') :outer('WSubId_353')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_355'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_354


.sub '' :anon :subid('WSubId_355') :outer('WSubId_354')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_2.'_applyWithArgs'("token", ":")
$P1 = __ARG_2.'_applyWithArgs'("listOf", "name", ",")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_355


.sub '' :anon :subid('WSubId_356') :outer('WSubId_353')
.param pmc __ARG_3

# Body
# {
.const 'Sub' $P3 = 'WSubId_357'
newclosure $P2, $P3
$P1 = $P2(__ARG_3)
.return($P1)
# }

.end # WSubId_356


.sub '' :anon :subid('WSubId_357') :outer('WSubId_356')
.param pmc __ARG_4

# Body
# {
__ARG_4.'_apply'("empty")
root_new $P1, ['parrot';'ResizablePMCArray']
.return($P1)
# }

.end # WSubId_357


.sub 'classVar' :subid('WSubId_358') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var v: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_359'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # classVar


.sub '' :anon :subid('WSubId_359') :outer('WSubId_358')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("var")
store_lex '__WLEX_1', $P1
$P2 = $P1[0]
set $S1, $P2
iseq $I1, $S1, "var"
__ARG_1.'_pred'($I1)
__ARG_1.'_apply'("sc")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "var"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_359


.sub 'classElem' :subid('WSubId_360') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_361'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_362'
newclosure $P4, $P5
.tailcall self.'_or'($P2, $P4)
# }

.end # classElem


.sub '' :anon :subid('WSubId_361') :outer('WSubId_360')
.param pmc __ARG_1

# Body
# {
.tailcall __ARG_1.'_apply'("funcDecl")
# }

.end # WSubId_361


.sub '' :anon :subid('WSubId_362') :outer('WSubId_360')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("classVar")
# }

.end # WSubId_362


.sub 'flag' :subid('WSubId_363') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P4
.lex '__WLEX_3', $P3
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
.const 'Sub' $P7 = 'WSubId_364'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # flag


.sub '' :anon :subid('WSubId_364') :outer('WSubId_363')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P1
.const 'Sub' $P5 = 'WSubId_365'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_367'
newclosure $P6, $P7
$P2 = __ARG_1.'_or'($P4, $P6)
store_lex '__WLEX_2', $P2
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "flag"
$P4.'push'($P5)
find_lex $P1, '__WLEX_1'
$P4.'push'($P1)
find_lex $P2, '__WLEX_2'
$P4.'push'($P2)
.return($P4)
# }

.end # WSubId_364


.sub '' :anon :subid('WSubId_365') :outer('WSubId_364')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_366'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_365


.sub '' :anon :subid('WSubId_366') :outer('WSubId_365')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_3'
# Body
# {
__ARG_3.'_applyWithArgs'("token", "(")
$P1 = __ARG_3.'_apply'("expr")
store_lex '__WLEX_3', $P1
__ARG_3.'_applyWithArgs'("token", ")")
find_lex $P1, '__WLEX_3'
.return($P1)
# }

.end # WSubId_366


.sub '' :anon :subid('WSubId_367') :outer('WSubId_364')
.param pmc __ARG_4

# Body
# {
.const 'Sub' $P3 = 'WSubId_368'
newclosure $P2, $P3
$P1 = $P2(__ARG_4)
.return($P1)
# }

.end # WSubId_367


.sub '' :anon :subid('WSubId_368') :outer('WSubId_367')
.param pmc __ARG_5

# Body
# {
__ARG_5.'_apply'("empty")
null $P1
.return($P1)
# }

.end # WSubId_368


.sub 'flagsList' :subid('WSubId_369') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var fs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_370'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # flagsList


.sub '' :anon :subid('WSubId_370') :outer('WSubId_369')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("token", "[")
$P1 = __ARG_1.'_applyWithArgs'("listOf", "flag", ",")
store_lex '__WLEX_1', $P1
__ARG_1.'_applyWithArgs'("token", "]")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "flaglist"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_370


.sub 'funcDecl' :subid('WSubId_371') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_372'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # funcDecl


.sub '' :anon :subid('WSubId_372') :outer('WSubId_371')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
__ARG_1.'_applyWithArgs'("token", "function")
$P1 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P1
.const 'Sub' $P5 = 'WSubId_373'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_374'
newclosure $P6, $P7
$P2 = __ARG_1.'_or'($P4, $P6)
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("funcRest")
store_lex '__WLEX_3', $P3
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "funcdecl"
$P4.'push'($P5)
find_lex $P1, '__WLEX_1'
$P4.'push'($P1)
find_lex $P2, '__WLEX_2'
$P4.'push'($P2)
find_lex $P3, '__WLEX_3'
.tailcall $P4.'append'($P3)
# }

.end # WSubId_372


.sub '' :anon :subid('WSubId_373') :outer('WSubId_372')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("flagsList")
# }

.end # WSubId_373


.sub '' :anon :subid('WSubId_374') :outer('WSubId_372')
.param pmc __ARG_3

# Body
# {
.const 'Sub' $P3 = 'WSubId_375'
newclosure $P2, $P3
$P1 = $P2(__ARG_3)
.return($P1)
# }

.end # WSubId_374


.sub '' :anon :subid('WSubId_375') :outer('WSubId_374')
.param pmc __ARG_4

# Body
# {
__ARG_4.'_apply'("empty")
null $P1
.return($P1)
# }

.end # WSubId_375


.sub 'classDecl' :subid('WSubId_376') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_377'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # classDecl


.sub '' :anon :subid('WSubId_377') :outer('WSubId_376')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
__ARG_1.'_applyWithArgs'("token", "class")
$P1 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("classBases")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("classRest")
store_lex '__WLEX_3', $P3
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "classdecl"
$P4.'push'($P5)
find_lex $P1, '__WLEX_1'
$P4.'push'($P1)
find_lex $P2, '__WLEX_2'
$P4.'push'($P2)
find_lex $P3, '__WLEX_3'
$P4.'push'($P3)
.return($P4)
# }

.end # WSubId_377


.sub 'srcElems' :subid('WSubId_378') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var ss: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_379'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # srcElems


.sub '' :anon :subid('WSubId_379') :outer('WSubId_378')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_380'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "begin"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_379


.sub '' :anon :subid('WSubId_380') :outer('WSubId_379')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("stmt")
# }

.end # WSubId_380


.sub 'topElem' :subid('WSubId_381') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_382'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_383'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_384'
newclosure $P6, $P7
.tailcall self.'_or'($P2, $P4, $P6)
# }

.end # topElem


.sub '' :anon :subid('WSubId_382') :outer('WSubId_381')
.param pmc __ARG_1

# Body
# {
.tailcall __ARG_1.'_apply'("funcDecl")
# }

.end # WSubId_382


.sub '' :anon :subid('WSubId_383') :outer('WSubId_381')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("classDecl")
# }

.end # WSubId_383


.sub '' :anon :subid('WSubId_384') :outer('WSubId_381')
.param pmc __ARG_3

# Body
# {
.const 'Sub' $P3 = 'WSubId_385'
newclosure $P2, $P3
$P1 = $P2(__ARG_3)
.return($P1)
# }

.end # WSubId_384


.sub '' :anon :subid('WSubId_385') :outer('WSubId_384')
.param pmc __ARG_4

# Body
# {
__ARG_4.'_applyWithArgs'("token", "ometa")
root_new $P1, ['parrot';'ResizablePMCArray']
box $P2, "ometa"
$P1.'push'($P2)
.return($P1)
# }

.end # WSubId_385


.sub 'topLevel' :subid('WSubId_386') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var es: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_387'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # topLevel


.sub '' :anon :subid('WSubId_387') :outer('WSubId_386')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_388'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
__ARG_1.'_apply'("spaces")
__ARG_1.'_apply'("end")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "top"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_387


.sub '' :anon :subid('WSubId_388') :outer('WSubId_387')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("topElem")
# }

.end # WSubId_388

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedParser' ]
get_class $P1, [ 'Parser' ]
addparent $P0, $P1
.end
.namespace [ 'WinxedSemActionParser' ]

.sub 'curlySemAction' :subid('WSubId_389') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P4
.lex '__WLEX_3', $P3
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
.const 'Sub' $P6 = 'WSubId_390'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_392'
newclosure $P7, $P8
.tailcall self.'_or'($P5, $P7)
# }

.end # curlySemAction


.sub '' :anon :subid('WSubId_390') :outer('WSubId_389')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_391'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_390


.sub '' :anon :subid('WSubId_391') :outer('WSubId_390')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_2.'_applyWithArgs'("token", "{")
$P1 = __ARG_2.'_apply'("expr")
store_lex '__WLEX_1', $P1
__ARG_2.'_applyWithArgs'("token", "}")
__ARG_2.'_apply'("spaces")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_391


.sub '' :anon :subid('WSubId_392') :outer('WSubId_389')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
$P3 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P6 = 'WSubId_393'
newclosure $P5, $P6
$P4 = $P5(__ARG_3)
.return($P4)
# }

.end # WSubId_392


.sub '' :anon :subid('WSubId_393') :outer('WSubId_392')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
$P3 = find_lex '__WLEX_1'
# Body
# {
__ARG_4.'_applyWithArgs'("token", "{")
.const 'Sub' $P5 = 'WSubId_394'
newclosure $P4, $P5
$P1 = __ARG_4.'_many'($P4)
store_lex '__WLEX_2', $P1
.const 'Sub' $P5 = 'WSubId_399'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_401'
newclosure $P6, $P7
$P2 = __ARG_4.'_or'($P4, $P6)
store_lex '__WLEX_3', $P2
find_lex $P1, '__WLEX_2'
find_lex $P2, '__WLEX_3'
$P1.'push'($P2)
__ARG_4.'_applyWithArgs'("token", "}")
__ARG_4.'_apply'("spaces")
root_new $P6, ['parrot';'ResizablePMCArray']
box $P7, "call"
$P6.'push'($P7)
root_new $P8, ['parrot';'ResizablePMCArray']
box $P9, "anonfunc"
$P8.'push'($P9)
root_new $P10, ['parrot';'ResizablePMCArray']
box $P11, "self"
$P10.'push'($P11)
$P8.'push'($P10)
root_new $P13, ['parrot';'ResizablePMCArray']
box $P14, "begin"
$P13.'push'($P14)
find_lex $P1, '__WLEX_2'
$P12 = $P13.'append'($P1)
$P8.'push'($P12)
$P6.'push'($P8)
root_new $P15, ['parrot';'ResizablePMCArray']
box $P16, "self"
$P15.'push'($P16)
$P6.'push'($P15)
.return($P6)
# }

.end # WSubId_393


.sub '' :anon :subid('WSubId_394') :outer('WSubId_393')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_395'
newclosure $P3, $P4
$P2 = $P3(__ARG_5)
.return($P2)
# }

.end # WSubId_394


.sub '' :anon :subid('WSubId_395') :outer('WSubId_394')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_6.'_apply'("stmt")
store_lex '__WLEX_3', $P1
.const 'Sub' $P3 = 'WSubId_396'
newclosure $P2, $P3
__ARG_6.'_lookahead'($P2)
find_lex $P1, '__WLEX_3'
.return($P1)
# }

.end # WSubId_395


.sub '' :anon :subid('WSubId_396') :outer('WSubId_395')
.param pmc __ARG_7

# Body
# {
.const 'Sub' $P2 = 'WSubId_397'
newclosure $P1, $P2
.const 'Sub' $P4 = 'WSubId_398'
newclosure $P3, $P4
.tailcall __ARG_7.'_or'($P1, $P3)
# }

.end # WSubId_396


.sub '' :anon :subid('WSubId_397') :outer('WSubId_396')
.param pmc __ARG_8

# Body
# {
.tailcall __ARG_8.'_apply'("expr")
# }

.end # WSubId_397


.sub '' :anon :subid('WSubId_398') :outer('WSubId_396')
.param pmc __ARG_9

# Body
# {
.tailcall __ARG_9.'_apply'("stmt")
# }

.end # WSubId_398


.sub '' :anon :subid('WSubId_399') :outer('WSubId_393')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_400'
newclosure $P3, $P4
$P2 = $P3(__ARG_10)
.return($P2)
# }

.end # WSubId_399


.sub '' :anon :subid('WSubId_400') :outer('WSubId_399')
.param pmc __ARG_11

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_11.'_apply'("expr")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "return"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_400


.sub '' :anon :subid('WSubId_401') :outer('WSubId_393')
.param pmc __ARG_12

# Body
# {
.tailcall __ARG_12.'_apply'("stmt")
# }

.end # WSubId_401


.sub 'semAction' :subid('WSubId_402') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var r: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_403'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_404'
newclosure $P5, $P6
.tailcall self.'_or'($P3, $P5)
# }

.end # semAction


.sub '' :anon :subid('WSubId_403') :outer('WSubId_402')
.param pmc __ARG_1

# Body
# {
.tailcall __ARG_1.'_apply'("curlySemAction")
# }

.end # WSubId_403


.sub '' :anon :subid('WSubId_404') :outer('WSubId_402')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_405'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_404


.sub '' :anon :subid('WSubId_405') :outer('WSubId_404')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_3.'_apply'("primExpr")
store_lex '__WLEX_1', $P1
__ARG_3.'_apply'("spaces")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_405

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedSemActionParser' ]
get_class $P1, [ 'WinxedParser' ]
addparent $P0, $P1
.end
.namespace [ 'WinxedTranslator' ]

.sub 'trans' :subid('WSubId_406') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var t: $P2
null $P2
# var ans: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_407'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # trans


.sub '' :anon :subid('WSubId_407') :outer('WSubId_406')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_408'
newclosure $P3, $P4
__ARG_1.'_form'($P3)
find_lex $P2, '__WLEX_2'
.return($P2)
# }

.end # WSubId_407


.sub '' :anon :subid('WSubId_408') :outer('WSubId_407')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_409'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_408


.sub '' :anon :subid('WSubId_409') :outer('WSubId_408')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
$P2 = __ARG_3.'_applyWithArgs'("apply", $P1)
store_lex '__WLEX_2', $P2
.return($P2)
# }

.end # WSubId_409


.sub 'curlyTrans' :subid('WSubId_410') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var r: $P2
null $P2
# var rs: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_411'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_415'
newclosure $P6, $P7
.const 'Sub' $P9 = 'WSubId_420'
newclosure $P8, $P9
.tailcall self.'_or'($P4, $P6, $P8)
# }

.end # curlyTrans


.sub '' :anon :subid('WSubId_411') :outer('WSubId_410')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_412'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_411


.sub '' :anon :subid('WSubId_412') :outer('WSubId_411')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_413'
newclosure $P2, $P3
__ARG_2.'_form'($P2)
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_412


.sub '' :anon :subid('WSubId_413') :outer('WSubId_412')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_414'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_413


.sub '' :anon :subid('WSubId_414') :outer('WSubId_413')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_4.'_applyWithArgs'("exactly", "begin")
$P1 = __ARG_4.'_apply'("curlyTrans")
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_414


.sub '' :anon :subid('WSubId_415') :outer('WSubId_410')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_416'
newclosure $P3, $P4
$P2 = $P3(__ARG_5)
.return($P2)
# }

.end # WSubId_415


.sub '' :anon :subid('WSubId_416') :outer('WSubId_415')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P3 = 'WSubId_417'
newclosure $P2, $P3
__ARG_6.'_form'($P2)
find_lex $P1, '__WLEX_2'
# predefined join
join $S1, "", $P1
concat $S2, "{", $S1
concat $S2, $S2, "}"
.return($S2)
# }

.end # WSubId_416


.sub '' :anon :subid('WSubId_417') :outer('WSubId_416')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_418'
newclosure $P3, $P4
$P2 = $P3(__ARG_7)
.return($P2)
# }

.end # WSubId_417


.sub '' :anon :subid('WSubId_418') :outer('WSubId_417')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_2'
# Body
# {
__ARG_8.'_applyWithArgs'("exactly", "begin")
.const 'Sub' $P3 = 'WSubId_419'
newclosure $P2, $P3
$P1 = __ARG_8.'_many'($P2)
store_lex '__WLEX_2', $P1
.return($P1)
# }

.end # WSubId_418


.sub '' :anon :subid('WSubId_419') :outer('WSubId_418')
.param pmc __ARG_9

# Body
# {
.tailcall __ARG_9.'_apply'("blockSemiTrans")
# }

.end # WSubId_419


.sub '' :anon :subid('WSubId_420') :outer('WSubId_410')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_421'
newclosure $P3, $P4
$P2 = $P3(__ARG_10)
.return($P2)
# }

.end # WSubId_420


.sub '' :anon :subid('WSubId_421') :outer('WSubId_420')
.param pmc __ARG_11

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_11.'_apply'("blockSemiTrans")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "{", $S1
concat $S2, $S2, "}"
.return($S2)
# }

.end # WSubId_421


.sub 'blockSemiTrans' :subid('WSubId_422') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var r: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_423'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # blockSemiTrans


.sub '' :anon :subid('WSubId_423') :outer('WSubId_422')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_424'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_426'
newclosure $P5, $P6
$P2 = __ARG_1.'_or'($P3, $P5)
store_lex '__WLEX_2', $P2
find_lex $P2, '__WLEX_2'
.return($P2)
# }

.end # WSubId_423


.sub '' :anon :subid('WSubId_424') :outer('WSubId_423')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_425'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_424


.sub '' :anon :subid('WSubId_425') :outer('WSubId_424')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined length
length $I3, $S1
sub $I2, $I3, 1
$P2 = $P1[$I2]
set $S2, $P2
iseq $I1, $S2, "}"
__ARG_3.'_pred'($I1)
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_425


.sub '' :anon :subid('WSubId_426') :outer('WSubId_423')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_427'
newclosure $P3, $P4
$P2 = $P3(__ARG_4)
.return($P2)
# }

.end # WSubId_426


.sub '' :anon :subid('WSubId_427') :outer('WSubId_426')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_5.'_apply'("empty")
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, $S1, ";"
.return($S2)
# }

.end # WSubId_427


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


.sub 'number' :subid('WSubId_428') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var n: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_429'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # number


.sub '' :anon :subid('WSubId_429') :outer('WSubId_428')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_429


.sub 'string' :subid('WSubId_430') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var s: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_431'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # string


.sub '' :anon :subid('WSubId_431') :outer('WSubId_430')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
.tailcall 'toProgramString'($P1)
# }

.end # WSubId_431


.sub 'arr' :subid('WSubId_432') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_433'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # arr


.sub '' :anon :subid('WSubId_433') :outer('WSubId_432')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_434'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, ",", $P1
concat $S2, "[", $S1
concat $S2, $S2, "]"
.return($S2)
# }

.end # WSubId_433


.sub '' :anon :subid('WSubId_434') :outer('WSubId_433')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_434


.sub 'unop' :subid('WSubId_435') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var op: $P2
null $P2
# var x: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_436'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # unop


.sub '' :anon :subid('WSubId_436') :outer('WSubId_435')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, "(", $S1
concat $S3, $S3, " "
concat $S3, $S3, $S2
concat $S3, $S3, ")"
.return($S3)
# }

.end # WSubId_436


.sub 'getp' :subid('WSubId_437') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var fd: $P2
null $P2
# var x: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_438'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # getp


.sub '' :anon :subid('WSubId_438') :outer('WSubId_437')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P2, '__WLEX_2'
set $S1, $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S2, $P1
concat $S3, $S1, "["
concat $S3, $S3, $S2
concat $S3, $S3, "]"
.return($S3)
# }

.end # WSubId_438


.sub 'geta' :subid('WSubId_439') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var fd: $P2
null $P2
# var x: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_440'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # geta


.sub '' :anon :subid('WSubId_440') :outer('WSubId_439')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P2, '__WLEX_2'
set $S1, $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S2, $P1
concat $S3, $S1, "."
concat $S3, $S3, $S2
.return($S3)
# }

.end # WSubId_440


.sub 'get' :subid('WSubId_441') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_442'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # get


.sub '' :anon :subid('WSubId_442') :outer('WSubId_441')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_442


.sub 'set' :subid('WSubId_443') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var lhs: $P2
null $P2
# var rhs: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_444'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # set


.sub '' :anon :subid('WSubId_444') :outer('WSubId_443')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, "(", $S1
concat $S3, $S3, "="
concat $S3, $S3, $S2
concat $S3, $S3, ")"
.return($S3)
# }

.end # WSubId_444


.sub 'mset' :subid('WSubId_445') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_446'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # mset


.sub '' :anon :subid('WSubId_446') :outer('WSubId_445')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
# predefined string
find_lex $P3, '__WLEX_3'
set $S3, $P3
concat $S4, "(", $S1
concat $S4, $S4, $S2
concat $S4, $S4, "="
concat $S4, $S4, $S3
concat $S4, $S4, ")"
.return($S4)
# }

.end # WSubId_446


.sub 'binop' :subid('WSubId_447') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_448'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # binop


.sub '' :anon :subid('WSubId_448') :outer('WSubId_447')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P2, '__WLEX_2'
set $S1, $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S2, $P1
# predefined string
find_lex $P3, '__WLEX_3'
set $S3, $P3
concat $S4, "(", $S1
concat $S4, $S4, " "
concat $S4, $S4, $S2
concat $S4, $S4, " "
concat $S4, $S4, $S3
concat $S4, $S4, ")"
.return($S4)
# }

.end # WSubId_448


.sub 'preop' :subid('WSubId_449') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var op: $P2
null $P2
# var x: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_450'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # preop


.sub '' :anon :subid('WSubId_450') :outer('WSubId_449')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, $S1, $S2
.return($S3)
# }

.end # WSubId_450


.sub 'postop' :subid('WSubId_451') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var op: $P2
null $P2
# var x: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_452'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # postop


.sub '' :anon :subid('WSubId_452') :outer('WSubId_451')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P2, '__WLEX_2'
set $S1, $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S2, $P1
concat $S3, $S1, $S2
.return($S3)
# }

.end # WSubId_452


.sub 'return' :subid('WSubId_453') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_454'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_456'
newclosure $P5, $P6
.tailcall self.'_or'($P3, $P5)
# }

.end # return


.sub '' :anon :subid('WSubId_454') :outer('WSubId_453')
.param pmc __ARG_1

# Body
# {
.const 'Sub' $P3 = 'WSubId_455'
newclosure $P2, $P3
$P1 = $P2(__ARG_1)
.return($P1)
# }

.end # WSubId_454


.sub '' :anon :subid('WSubId_455') :outer('WSubId_454')
.param pmc __ARG_2

# Body
# {
__ARG_2.'_apply'("null")
.return("return")
# }

.end # WSubId_455


.sub '' :anon :subid('WSubId_456') :outer('WSubId_453')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_457'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_456


.sub '' :anon :subid('WSubId_457') :outer('WSubId_456')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_4.'_apply'("trans")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "return ", $S1
.return($S2)
# }

.end # WSubId_457


.sub 'if' :subid('WSubId_458') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_459'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # if


.sub '' :anon :subid('WSubId_459') :outer('WSubId_458')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
# predefined string
find_lex $P3, '__WLEX_3'
set $S3, $P3
concat $S4, "if(", $S1
concat $S4, $S4, ")"
concat $S4, $S4, $S2
concat $S4, $S4, "else"
concat $S4, $S4, $S3
.return($S4)
# }

.end # WSubId_459


.sub 'condExpr' :subid('WSubId_460') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_461'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # condExpr


.sub '' :anon :subid('WSubId_461') :outer('WSubId_460')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
# predefined string
find_lex $P3, '__WLEX_3'
set $S3, $P3
concat $S4, "(", $S1
concat $S4, $S4, "?"
concat $S4, $S4, $S2
concat $S4, $S4, ":"
concat $S4, $S4, $S3
concat $S4, $S4, ")"
.return($S4)
# }

.end # WSubId_461


.sub 'while' :subid('WSubId_462') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var cond: $P2
null $P2
# var body: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_463'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # while


.sub '' :anon :subid('WSubId_463') :outer('WSubId_462')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, "while(", $S1
concat $S3, $S3, ")"
concat $S3, $S3, $S2
.return($S3)
# }

.end # WSubId_463


.sub 'doWhile' :subid('WSubId_464') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var body: $P2
null $P2
# var cond: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_465'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # doWhile


.sub '' :anon :subid('WSubId_465') :outer('WSubId_464')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, "do", $S1
concat $S3, $S3, "while("
concat $S3, $S3, $S2
concat $S3, $S3, ")"
.return($S3)
# }

.end # WSubId_465


.sub 'for' :subid('WSubId_466') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
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
.const 'Sub' $P8 = 'WSubId_467'
newclosure $P7, $P8
$P6 = $P7(self)
.return($P6)
# }

.end # for


.sub '' :anon :subid('WSubId_467') :outer('WSubId_466')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
$P4 = find_lex '__WLEX_4'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P3
$P4 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_4', $P4
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
# predefined string
find_lex $P3, '__WLEX_3'
set $S3, $P3
# predefined string
find_lex $P4, '__WLEX_4'
set $S4, $P4
concat $S5, "for(", $S1
concat $S5, $S5, ";"
concat $S5, $S5, $S2
concat $S5, $S5, ";"
concat $S5, $S5, $S3
concat $S5, $S5, ")"
concat $S5, $S5, $S4
.return($S5)
# }

.end # WSubId_467


.sub 'forIn' :subid('WSubId_468') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_469'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # forIn


.sub '' :anon :subid('WSubId_469') :outer('WSubId_468')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
# predefined string
find_lex $P3, '__WLEX_3'
set $S3, $P3
concat $S4, "for(", $S1
concat $S4, $S4, " in "
concat $S4, $S4, $S2
concat $S4, $S4, ")"
concat $S4, $S4, $S3
.return($S4)
# }

.end # WSubId_469


.sub 'using' :subid('WSubId_470') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var name: $P2
null $P2
# var type: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_471'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_473'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # using


.sub '' :anon :subid('WSubId_471') :outer('WSubId_470')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_472'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_471


.sub '' :anon :subid('WSubId_472') :outer('WSubId_471')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P1
__ARG_2.'_apply'("null")
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "using ", $S1
.return($S2)
# }

.end # WSubId_472


.sub '' :anon :subid('WSubId_473') :outer('WSubId_470')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_474'
newclosure $P4, $P5
$P3 = $P4(__ARG_3)
.return($P3)
# }

.end # WSubId_473


.sub '' :anon :subid('WSubId_474') :outer('WSubId_473')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P2, '__WLEX_2'
set $S1, $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S2, $P1
concat $S3, "using ", $S1
concat $S3, $S3, " "
concat $S3, $S3, $S2
.return($S3)
# }

.end # WSubId_474


.sub 'begin' :subid('WSubId_475') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_476'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # begin


.sub '' :anon :subid('WSubId_476') :outer('WSubId_475')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_477'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
concat $S2, "{", $S1
concat $S2, $S2, "}"
.return($S2)
# }

.end # WSubId_476


.sub '' :anon :subid('WSubId_477') :outer('WSubId_476')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("blockSemiTrans")
# }

.end # WSubId_477


.sub 'top' :subid('WSubId_478') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_479'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # top


.sub '' :anon :subid('WSubId_479') :outer('WSubId_478')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_480'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
.return($S1)
# }

.end # WSubId_479


.sub '' :anon :subid('WSubId_480') :outer('WSubId_479')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_480


.sub 'flag' :subid('WSubId_481') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var name: $P2
null $P2
# var arg: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_482'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_484'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # flag


.sub '' :anon :subid('WSubId_482') :outer('WSubId_481')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_483'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_482


.sub '' :anon :subid('WSubId_483') :outer('WSubId_482')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P1
__ARG_2.'_apply'("null")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_483


.sub '' :anon :subid('WSubId_484') :outer('WSubId_481')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_485'
newclosure $P4, $P5
$P3 = $P4(__ARG_3)
.return($P3)
# }

.end # WSubId_484


.sub '' :anon :subid('WSubId_485') :outer('WSubId_484')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, $S1, "("
concat $S3, $S3, $S2
concat $S3, $S3, ")"
.return($S3)
# }

.end # WSubId_485


.sub 'flaglist' :subid('WSubId_486') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var fs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_487'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # flaglist


.sub '' :anon :subid('WSubId_487') :outer('WSubId_486')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_488'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, ",", $P1
.return($S1)
# }

.end # WSubId_487


.sub '' :anon :subid('WSubId_488') :outer('WSubId_487')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_488


.sub 'anonfunc' :subid('WSubId_489') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var args: $P2
null $P2
# var body: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_490'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # anonfunc


.sub '' :anon :subid('WSubId_490') :outer('WSubId_489')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_2', $P2
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, ",", $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, "(function (", $S1
concat $S3, $S3, ")"
concat $S3, $S3, $S2
concat $S3, $S3, ")"
.return($S3)
# }

.end # WSubId_490


.sub 'funcdecl' :subid('WSubId_491') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
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
.const 'Sub' $P7 = 'WSubId_492'
newclosure $P6, $P7
.const 'Sub' $P9 = 'WSubId_494'
newclosure $P8, $P9
.tailcall self.'_or'($P6, $P8)
# }

.end # funcdecl


.sub '' :anon :subid('WSubId_492') :outer('WSubId_491')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P6 = 'WSubId_493'
newclosure $P5, $P6
$P4 = $P5(__ARG_1)
.return($P4)
# }

.end # WSubId_492


.sub '' :anon :subid('WSubId_493') :outer('WSubId_492')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P1
__ARG_2.'_apply'("null")
$P2 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_2', $P2
$P3 = __ARG_2.'_apply'("curlyTrans")
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
find_lex $P2, '__WLEX_2'
# predefined join
join $S2, ",", $P2
# predefined string
find_lex $P3, '__WLEX_3'
set $S3, $P3
concat $S4, "function ", $S1
concat $S4, $S4, "("
concat $S4, $S4, $S2
concat $S4, $S4, ")"
concat $S4, $S4, $S3
.return($S4)
# }

.end # WSubId_493


.sub '' :anon :subid('WSubId_494') :outer('WSubId_491')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_4'
$P3 = find_lex '__WLEX_2'
$P4 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P7 = 'WSubId_495'
newclosure $P6, $P7
$P5 = $P6(__ARG_3)
.return($P5)
# }

.end # WSubId_494


.sub '' :anon :subid('WSubId_495') :outer('WSubId_494')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_4'
$P3 = find_lex '__WLEX_2'
$P4 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_4.'_apply'("trans")
store_lex '__WLEX_4', $P2
$P3 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_2', $P3
$P4 = __ARG_4.'_apply'("curlyTrans")
store_lex '__WLEX_3', $P4
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_4'
set $S2, $P2
find_lex $P3, '__WLEX_2'
# predefined join
join $S3, ",", $P3
# predefined string
find_lex $P4, '__WLEX_3'
set $S4, $P4
concat $S5, "function ", $S1
concat $S5, $S5, "["
concat $S5, $S5, $S2
concat $S5, $S5, "]("
concat $S5, $S5, $S3
concat $S5, $S5, ")"
concat $S5, $S5, $S4
.return($S5)
# }

.end # WSubId_495


.sub 'classdecl' :subid('WSubId_496') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P6 = 'WSubId_497'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_500'
newclosure $P7, $P8
.tailcall self.'_or'($P5, $P7)
# }

.end # classdecl


.sub '' :anon :subid('WSubId_497') :outer('WSubId_496')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_498'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_497


.sub '' :anon :subid('WSubId_498') :outer('WSubId_497')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_499'
newclosure $P3, $P4
__ARG_2.'_form'($P3)
$P2 = __ARG_2.'_apply'("curlyTrans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, "class ", $S1
concat $S3, $S3, $S2
.return($S3)
# }

.end # WSubId_498


.sub '' :anon :subid('WSubId_499') :outer('WSubId_498')
.param pmc __ARG_3

# Body
# {
.return()
# }

.end # WSubId_499


.sub '' :anon :subid('WSubId_500') :outer('WSubId_496')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_3'
$P3 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P6 = 'WSubId_501'
newclosure $P5, $P6
$P4 = $P5(__ARG_4)
.return($P4)
# }

.end # WSubId_500


.sub '' :anon :subid('WSubId_501') :outer('WSubId_500')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_3'
$P3 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_3', $P2
$P3 = __ARG_5.'_apply'("curlyTrans")
store_lex '__WLEX_2', $P3
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
find_lex $P2, '__WLEX_3'
# predefined join
join $S2, ",", $P2
# predefined string
find_lex $P3, '__WLEX_2'
set $S3, $P3
concat $S4, "class ", $S1
concat $S4, $S4, ":"
concat $S4, $S4, $S2
concat $S4, $S4, $S3
.return($S4)
# }

.end # WSubId_501


.sub 'call' :subid('WSubId_502') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var fn: $P2
null $P2
# var args: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_503'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # call


.sub '' :anon :subid('WSubId_503') :outer('WSubId_502')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_504'
newclosure $P3, $P4
$P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
find_lex $P2, '__WLEX_2'
# predefined join
join $S2, ",", $P2
concat $S3, $S1, "("
concat $S3, $S3, $S2
concat $S3, $S3, ")"
.return($S3)
# }

.end # WSubId_503


.sub '' :anon :subid('WSubId_504') :outer('WSubId_503')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_504


.sub 'send' :subid('WSubId_505') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_506'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # send


.sub '' :anon :subid('WSubId_506') :outer('WSubId_505')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
.const 'Sub' $P5 = 'WSubId_507'
newclosure $P4, $P5
$P3 = __ARG_1.'_many'($P4)
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P2, '__WLEX_2'
set $S1, $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S2, $P1
find_lex $P3, '__WLEX_3'
# predefined join
join $S3, ",", $P3
concat $S4, $S1, "."
concat $S4, $S4, $S2
concat $S4, $S4, "("
concat $S4, $S4, $S3
concat $S4, $S4, ")"
.return($S4)
# }

.end # WSubId_506


.sub '' :anon :subid('WSubId_507') :outer('WSubId_506')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_507


.sub 'new' :subid('WSubId_508') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var cls: $P2
null $P2
# var arg: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_509'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_511'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # new


.sub '' :anon :subid('WSubId_509') :outer('WSubId_508')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_510'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_509


.sub '' :anon :subid('WSubId_510') :outer('WSubId_509')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_2.'_apply'("anything")
store_lex '__WLEX_1', $P1
__ARG_2.'_apply'("null")
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "new ", $S1
concat $S2, $S2, "()"
.return($S2)
# }

.end # WSubId_510


.sub '' :anon :subid('WSubId_511') :outer('WSubId_508')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_512'
newclosure $P4, $P5
$P3 = $P4(__ARG_3)
.return($P3)
# }

.end # WSubId_511


.sub '' :anon :subid('WSubId_512') :outer('WSubId_511')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_4.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_4.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, "new ", $S1
concat $S3, $S3, "("
concat $S3, $S3, $S2
concat $S3, $S3, ")"
.return($S3)
# }

.end # WSubId_512


.sub 'var' :subid('WSubId_513') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var type: $P2
null $P2
# var name: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_514'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # var


.sub '' :anon :subid('WSubId_514') :outer('WSubId_513')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, $S1, " "
concat $S3, $S3, $S2
.return($S3)
# }

.end # WSubId_514


.sub 'varinit' :subid('WSubId_515') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_516'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # varinit


.sub '' :anon :subid('WSubId_516') :outer('WSubId_515')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
# predefined string
find_lex $P3, '__WLEX_3'
set $S3, $P3
concat $S4, $S1, " "
concat $S4, $S4, $S2
concat $S4, $S4, " = "
concat $S4, $S4, $S3
.return($S4)
# }

.end # WSubId_516


.sub 'throw' :subid('WSubId_517') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_518'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # throw


.sub '' :anon :subid('WSubId_518') :outer('WSubId_517')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "throw ", $S1
.return($S2)
# }

.end # WSubId_518


.sub 'try' :subid('WSubId_519') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_520'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # try


.sub '' :anon :subid('WSubId_520') :outer('WSubId_519')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("curlyTrans")
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
# predefined string
find_lex $P3, '__WLEX_3'
set $S3, $P3
concat $S4, "try ", $S1
concat $S4, $S4, "catch("
concat $S4, $S4, $S2
concat $S4, $S4, ")"
concat $S4, $S4, $S3
.return($S4)
# }

.end # WSubId_520


.sub 'json' :subid('WSubId_521') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var props: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_522'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # json


.sub '' :anon :subid('WSubId_522') :outer('WSubId_521')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_523'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, ",", $P1
concat $S2, "({", $S1
concat $S2, $S2, "})"
.return($S2)
# }

.end # WSubId_522


.sub '' :anon :subid('WSubId_523') :outer('WSubId_522')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_523


.sub 'binding' :subid('WSubId_524') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var name: $P2
null $P2
# var val: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_525'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # binding


.sub '' :anon :subid('WSubId_525') :outer('WSubId_524')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
$P3 = 'toProgramString'($P1)
set $S1, $P3
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, $S1, ": "
concat $S3, $S3, $S2
.return($S3)
# }

.end # WSubId_525


.sub 'switch' :subid('WSubId_526') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var cases: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_527'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # switch


.sub '' :anon :subid('WSubId_527') :outer('WSubId_526')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_528'
newclosure $P3, $P4
$P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
find_lex $P2, '__WLEX_2'
# predefined join
join $S2, ";", $P2
concat $S3, "switch(", $S1
concat $S3, $S3, "){"
concat $S3, $S3, $S2
concat $S3, $S3, "}"
.return($S3)
# }

.end # WSubId_527


.sub '' :anon :subid('WSubId_528') :outer('WSubId_527')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_528


.sub 'case' :subid('WSubId_529') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var y: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_530'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # case


.sub '' :anon :subid('WSubId_530') :outer('WSubId_529')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, "case ", $S1
concat $S3, $S3, ": "
concat $S3, $S3, $S2
.return($S3)
# }

.end # WSubId_530


.sub 'default' :subid('WSubId_531') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var y: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_532'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # default


.sub '' :anon :subid('WSubId_532') :outer('WSubId_531')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "default: ", $S1
.return($S2)
# }

.end # WSubId_532

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'WinxedTranslator' ]
get_class $P1, [ 'OMeta' ]
addparent $P0, $P1
.end
.namespace [ 'OMetaParser' ]

.sub 'fromTo' :subid('WSubId_533') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var y: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_534'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # fromTo


.sub '' :anon :subid('WSubId_534') :outer('WSubId_533')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P2
find_lex $P1, '__WLEX_1'
__ARG_1.'_applyWithArgs'("seq", $P1)
.const 'Sub' $P4 = 'WSubId_535'
newclosure $P3, $P4
__ARG_1.'_many'($P3)
find_lex $P2, '__WLEX_2'
.tailcall __ARG_1.'_applyWithArgs'("seq", $P2)
# }

.end # WSubId_534


.sub '' :anon :subid('WSubId_535') :outer('WSubId_534')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_536'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_535


.sub '' :anon :subid('WSubId_536') :outer('WSubId_535')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P3 = 'WSubId_537'
newclosure $P2, $P3
__ARG_3.'_not'($P2)
.tailcall __ARG_3.'_apply'("char")
# }

.end # WSubId_536


.sub '' :anon :subid('WSubId_537') :outer('WSubId_536')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
# Body
# {
find_lex $P1, '__WLEX_2'
.tailcall __ARG_4.'_applyWithArgs'("seq", $P1)
# }

.end # WSubId_537


.sub 'space' :subid('WSubId_538') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_539'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_540'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_541'
newclosure $P6, $P7
.tailcall self.'_or'($P2, $P4, $P6)
# }

.end # space


.sub '' :anon :subid('WSubId_539') :outer('WSubId_538')
.param pmc __ARG_1

# Body
# {
.tailcall __ARG_1.'_superApplyWithArgs'("Parser", 'space')
# }

.end # WSubId_539


.sub '' :anon :subid('WSubId_540') :outer('WSubId_538')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_applyWithArgs'("fromTo", "//", "\n")
# }

.end # WSubId_540


.sub '' :anon :subid('WSubId_541') :outer('WSubId_538')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_applyWithArgs'("fromTo", "/*", "*/")
# }

.end # WSubId_541


.sub 'nameFirst' :subid('WSubId_542') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_543'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_545'
newclosure $P4, $P5
.tailcall self.'_or'($P2, $P4)
# }

.end # nameFirst


.sub '' :anon :subid('WSubId_543') :outer('WSubId_542')
.param pmc __ARG_1

# Body
# {
.const 'Sub' $P3 = 'WSubId_544'
newclosure $P2, $P3
$P1 = $P2(__ARG_1)
.return($P1)
# }

.end # WSubId_543


.sub '' :anon :subid('WSubId_544') :outer('WSubId_543')
.param pmc __ARG_2

# Body
# {
$P1 = __ARG_2.'_apply'('anything')
set $S1, $P1
set $S2, "_"
if $S1 == $S2 goto __label_2
set $S2, "$"
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.return("_")
__label_3: # case
.return("$")
__label_1: # default
getattribute $P2, __ARG_2, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_544


.sub '' :anon :subid('WSubId_545') :outer('WSubId_542')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_apply'("letter")
# }

.end # WSubId_545


.sub 'nameRest' :subid('WSubId_546') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_547'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_548'
newclosure $P4, $P5
.tailcall self.'_or'($P2, $P4)
# }

.end # nameRest


.sub '' :anon :subid('WSubId_547') :outer('WSubId_546')
.param pmc __ARG_1

# Body
# {
.tailcall __ARG_1.'_apply'("nameFirst")
# }

.end # WSubId_547


.sub '' :anon :subid('WSubId_548') :outer('WSubId_546')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("digit")
# }

.end # WSubId_548


.sub 'tsName' :subid('WSubId_549') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_550'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # tsName


.sub '' :anon :subid('WSubId_550') :outer('WSubId_549')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_applyWithArgs'("firstAndRest", "nameFirst", "nameRest")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
.return($S1)
# }

.end # WSubId_550


.sub 'name' :subid('WSubId_551') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P4 = 'WSubId_552'
newclosure $P3, $P4
$P2 = $P3(self)
.return($P2)
# }

.end # name


.sub '' :anon :subid('WSubId_552') :outer('WSubId_551')
.param pmc __ARG_1

# Body
# {
__ARG_1.'_apply'("spaces")
.tailcall __ARG_1.'_apply'("tsName")
# }

.end # WSubId_552


.sub 'eChar' :subid('WSubId_553') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var c: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_554'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_557'
newclosure $P5, $P6
.tailcall self.'_or'($P3, $P5)
# }

.end # eChar


.sub '' :anon :subid('WSubId_554') :outer('WSubId_553')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_555'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_554


.sub '' :anon :subid('WSubId_555') :outer('WSubId_554')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P2 = __ARG_2.'_apply'('anything')
set $S1, $P2
set $S2, "\\"
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P5 = 'WSubId_556'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
__label_1: # default
getattribute $P6, __ARG_2, 'fail'
throw $P6
__label_0: # switch end
# }

.end # WSubId_555


.sub '' :anon :subid('WSubId_556') :outer('WSubId_555')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_3.'_apply'("char")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "\\", $S1
.tailcall 'unescape'($S2)
# }

.end # WSubId_556


.sub '' :anon :subid('WSubId_557') :outer('WSubId_553')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_apply'("char")
# }

.end # WSubId_557


.sub 'tsString' :subid('WSubId_558') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_559'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # tsString


.sub '' :anon :subid('WSubId_559') :outer('WSubId_558')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("exactly", "\'")
.const 'Sub' $P3 = 'WSubId_560'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
__ARG_1.'_applyWithArgs'("exactly", "\'")
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
.return($S1)
# }

.end # WSubId_559


.sub '' :anon :subid('WSubId_560') :outer('WSubId_559')
.param pmc __ARG_2

# Body
# {
.const 'Sub' $P3 = 'WSubId_561'
newclosure $P2, $P3
$P1 = $P2(__ARG_2)
.return($P1)
# }

.end # WSubId_560


.sub '' :anon :subid('WSubId_561') :outer('WSubId_560')
.param pmc __ARG_3

# Body
# {
.const 'Sub' $P2 = 'WSubId_562'
newclosure $P1, $P2
__ARG_3.'_not'($P1)
.tailcall __ARG_3.'_apply'("eChar")
# }

.end # WSubId_561


.sub '' :anon :subid('WSubId_562') :outer('WSubId_561')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_applyWithArgs'("exactly", "\'")
# }

.end # WSubId_562


.sub 'characters' :subid('WSubId_563') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_564'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # characters


.sub '' :anon :subid('WSubId_564') :outer('WSubId_563')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("exactly", "`")
__ARG_1.'_applyWithArgs'("exactly", "`")
.const 'Sub' $P3 = 'WSubId_565'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
__ARG_1.'_applyWithArgs'("exactly", "\'")
__ARG_1.'_applyWithArgs'("exactly", "\'")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "App"
$P2.'push'($P3)
box $P3, "seq"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
$P4 = 'toProgramString'($S1)
$P2.'push'($P4)
.return($P2)
# }

.end # WSubId_564


.sub '' :anon :subid('WSubId_565') :outer('WSubId_564')
.param pmc __ARG_2

# Body
# {
.const 'Sub' $P3 = 'WSubId_566'
newclosure $P2, $P3
$P1 = $P2(__ARG_2)
.return($P1)
# }

.end # WSubId_565


.sub '' :anon :subid('WSubId_566') :outer('WSubId_565')
.param pmc __ARG_3

# Body
# {
.const 'Sub' $P2 = 'WSubId_567'
newclosure $P1, $P2
__ARG_3.'_not'($P1)
.tailcall __ARG_3.'_apply'("eChar")
# }

.end # WSubId_566


.sub '' :anon :subid('WSubId_567') :outer('WSubId_566')
.param pmc __ARG_4

# Body
# {
.const 'Sub' $P3 = 'WSubId_568'
newclosure $P2, $P3
$P1 = $P2(__ARG_4)
.return($P1)
# }

.end # WSubId_567


.sub '' :anon :subid('WSubId_568') :outer('WSubId_567')
.param pmc __ARG_5

# Body
# {
__ARG_5.'_applyWithArgs'("exactly", "\'")
.tailcall __ARG_5.'_applyWithArgs'("exactly", "\'")
# }

.end # WSubId_568


.sub 'sCharacters' :subid('WSubId_569') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_570'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # sCharacters


.sub '' :anon :subid('WSubId_570') :outer('WSubId_569')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("exactly", "\"")
.const 'Sub' $P3 = 'WSubId_571'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
__ARG_1.'_applyWithArgs'("exactly", "\"")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "App"
$P2.'push'($P3)
box $P3, "token"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
$P4 = 'toProgramString'($S1)
$P2.'push'($P4)
.return($P2)
# }

.end # WSubId_570


.sub '' :anon :subid('WSubId_571') :outer('WSubId_570')
.param pmc __ARG_2

# Body
# {
.const 'Sub' $P3 = 'WSubId_572'
newclosure $P2, $P3
$P1 = $P2(__ARG_2)
.return($P1)
# }

.end # WSubId_571


.sub '' :anon :subid('WSubId_572') :outer('WSubId_571')
.param pmc __ARG_3

# Body
# {
.const 'Sub' $P2 = 'WSubId_573'
newclosure $P1, $P2
__ARG_3.'_not'($P1)
.tailcall __ARG_3.'_apply'("eChar")
# }

.end # WSubId_572


.sub '' :anon :subid('WSubId_573') :outer('WSubId_572')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_573


.sub 'string' :subid('WSubId_574') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_575'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # string


.sub '' :anon :subid('WSubId_575') :outer('WSubId_574')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_576'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_579'
newclosure $P4, $P5
$P1 = __ARG_1.'_or'($P2, $P4)
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "App"
$P2.'push'($P3)
box $P3, "exactly"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P4 = 'toProgramString'($P1)
$P2.'push'($P4)
.return($P2)
# }

.end # WSubId_575


.sub '' :anon :subid('WSubId_576') :outer('WSubId_575')
.param pmc __ARG_2

# Body
# {
.const 'Sub' $P3 = 'WSubId_577'
newclosure $P2, $P3
$P1 = $P2(__ARG_2)
.return($P1)
# }

.end # WSubId_576


.sub '' :anon :subid('WSubId_577') :outer('WSubId_576')
.param pmc __ARG_3

# Body
# {
.const 'Sub' $P2 = 'WSubId_578'
newclosure $P1, $P2
$P1(__ARG_3)
.tailcall __ARG_3.'_apply'("tsName")
# }

.end # WSubId_577


.sub '' :anon :subid('WSubId_578') :outer('WSubId_577')
.param pmc __ARG_4

# Body
# {
$P1 = __ARG_4.'_apply'('anything')
set $S1, $P1
set $S2, "#"
if $S1 == $S2 goto __label_2
set $S2, "`"
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.return("#")
__label_3: # case
.return("`")
__label_1: # default
getattribute $P2, __ARG_4, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_578


.sub '' :anon :subid('WSubId_579') :outer('WSubId_575')
.param pmc __ARG_5

# Body
# {
.tailcall __ARG_5.'_apply'("tsString")
# }

.end # WSubId_579


.sub 'number' :subid('WSubId_580') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var sign: $P2
null $P2
# var ds: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_581'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # number


.sub '' :anon :subid('WSubId_581') :outer('WSubId_580')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_582'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_584'
newclosure $P5, $P6
$P1 = __ARG_1.'_or'($P3, $P5)
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_586'
newclosure $P3, $P4
$P2 = __ARG_1.'_many1'($P3)
store_lex '__WLEX_2', $P2
root_new $P5, ['parrot';'ResizablePMCArray']
box $P6, "App"
$P5.'push'($P6)
box $P6, "exactly"
$P5.'push'($P6)
find_lex $P1, '__WLEX_1'
find_lex $P2, '__WLEX_2'
# predefined join
join $S1, "", $P2
set $I2, $P1
set $I3, $S1
add $I1, $I2, $I3
box $P6, $I1
$P5.'push'($P6)
.return($P5)
# }

.end # WSubId_581


.sub '' :anon :subid('WSubId_582') :outer('WSubId_581')
.param pmc __ARG_2

# Body
# {
.const 'Sub' $P3 = 'WSubId_583'
newclosure $P2, $P3
$P1 = $P2(__ARG_2)
.return($P1)
# }

.end # WSubId_582


.sub '' :anon :subid('WSubId_583') :outer('WSubId_582')
.param pmc __ARG_3

# Body
# {
$P1 = __ARG_3.'_apply'('anything')
set $S1, $P1
set $S2, "-"
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.return("-")
__label_1: # default
getattribute $P2, __ARG_3, 'fail'
throw $P2
__label_0: # switch end
# }

.end # WSubId_583


.sub '' :anon :subid('WSubId_584') :outer('WSubId_581')
.param pmc __ARG_4

# Body
# {
.const 'Sub' $P3 = 'WSubId_585'
newclosure $P2, $P3
$P1 = $P2(__ARG_4)
.return($P1)
# }

.end # WSubId_584


.sub '' :anon :subid('WSubId_585') :outer('WSubId_584')
.param pmc __ARG_5

# Body
# {
__ARG_5.'_apply'("empty")
.return("")
# }

.end # WSubId_585


.sub '' :anon :subid('WSubId_586') :outer('WSubId_581')
.param pmc __ARG_6

# Body
# {
.tailcall __ARG_6.'_apply'("digit")
# }

.end # WSubId_586


.sub 'keyword' :subid('WSubId_587') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_588'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # keyword


.sub '' :anon :subid('WSubId_588') :outer('WSubId_587')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
__ARG_1.'_applyWithArgs'("token", $P1)
.const 'Sub' $P3 = 'WSubId_589'
newclosure $P2, $P3
__ARG_1.'_not'($P2)
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_588


.sub '' :anon :subid('WSubId_589') :outer('WSubId_588')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("letterOrDigit")
# }

.end # WSubId_589


.sub 'args' :subid('WSubId_590') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_591'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_594'
newclosure $P5, $P6
.tailcall self.'_or'($P3, $P5)
# }

.end # args


.sub '' :anon :subid('WSubId_591') :outer('WSubId_590')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_592'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_591


.sub '' :anon :subid('WSubId_592') :outer('WSubId_591')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P2 = __ARG_2.'_apply'('anything')
set $S1, $P2
set $S2, "("
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P5 = 'WSubId_593'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
__label_1: # default
getattribute $P6, __ARG_2, 'fail'
throw $P6
__label_0: # switch end
# }

.end # WSubId_592


.sub '' :anon :subid('WSubId_593') :outer('WSubId_592')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_3.'_applyWithArgs'("listOf", "hostExpr", ",")
store_lex '__WLEX_1', $P1
__ARG_3.'_applyWithArgs'("token", ")")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_593


.sub '' :anon :subid('WSubId_594') :outer('WSubId_590')
.param pmc __ARG_4

# Body
# {
.const 'Sub' $P3 = 'WSubId_595'
newclosure $P2, $P3
$P1 = $P2(__ARG_4)
.return($P1)
# }

.end # WSubId_594


.sub '' :anon :subid('WSubId_595') :outer('WSubId_594')
.param pmc __ARG_5

# Body
# {
__ARG_5.'_apply'("empty")
root_new $P1, ['parrot';'ResizablePMCArray']
.return($P1)
# }

.end # WSubId_595


.sub 'application' :subid('WSubId_596') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P6 = 'WSubId_597'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_599'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_601'
newclosure $P9, $P10
.tailcall self.'_or'($P5, $P7, $P9)
# }

.end # application


.sub '' :anon :subid('WSubId_597') :outer('WSubId_596')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_598'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_597


.sub '' :anon :subid('WSubId_598') :outer('WSubId_597')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
__ARG_2.'_applyWithArgs'("token", "^")
$P1 = __ARG_2.'_apply'("name")
store_lex '__WLEX_1', $P1
$P2 = __ARG_2.'_apply'("args")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "App"
$P3.'push'($P4)
box $P4, "super"
$P3.'push'($P4)
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "\'", $S1
concat $S2, $S2, "\'"
box $P4, $S2
$P3.'push'($P4)
find_lex $P2, '__WLEX_2'
.tailcall $P3.'append'($P2)
# }

.end # WSubId_598


.sub '' :anon :subid('WSubId_599') :outer('WSubId_596')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_1'
$P3 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P6 = 'WSubId_600'
newclosure $P5, $P6
$P4 = $P5(__ARG_3)
.return($P4)
# }

.end # WSubId_599


.sub '' :anon :subid('WSubId_600') :outer('WSubId_599')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_1'
$P3 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_4.'_apply'("name")
store_lex '__WLEX_3', $P1
__ARG_4.'_applyWithArgs'("token", ".")
$P2 = __ARG_4.'_apply'("name")
store_lex '__WLEX_1', $P2
$P3 = __ARG_4.'_apply'("args")
store_lex '__WLEX_2', $P3
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "App"
$P4.'push'($P5)
box $P5, "foreign"
$P4.'push'($P5)
# predefined string
find_lex $P1, '__WLEX_3'
set $S1, $P1
concat $S2, "\'", $S1
concat $S2, $S2, "\'"
box $P5, $S2
$P4.'push'($P5)
# predefined string
find_lex $P2, '__WLEX_1'
set $S3, $P2
concat $S4, "\'", $S3
concat $S4, $S4, "\'"
box $P5, $S4
$P4.'push'($P5)
find_lex $P3, '__WLEX_2'
.tailcall $P4.'append'($P3)
# }

.end # WSubId_600


.sub '' :anon :subid('WSubId_601') :outer('WSubId_596')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_602'
newclosure $P4, $P5
$P3 = $P4(__ARG_5)
.return($P3)
# }

.end # WSubId_601


.sub '' :anon :subid('WSubId_602') :outer('WSubId_601')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_6.'_apply'("name")
store_lex '__WLEX_1', $P1
$P2 = __ARG_6.'_apply'("args")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "App"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
.tailcall $P3.'append'($P2)
# }

.end # WSubId_602


.sub 'hostExpr' :subid('WSubId_603') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var r: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_604'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # hostExpr


.sub '' :anon :subid('WSubId_604') :outer('WSubId_603')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_applyWithArgs'("foreign", 'WinxedSemActionParser', 'expr')
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
.tailcall __ARG_1.'_applyWithArgs'("foreign", 'WinxedTranslator', 'trans', $P1)
# }

.end # WSubId_604


.sub 'curlyHostExpr' :subid('WSubId_605') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var r: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_606'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # curlyHostExpr


.sub '' :anon :subid('WSubId_606') :outer('WSubId_605')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_applyWithArgs'("foreign", 'WinxedSemActionParser', 'curlySemAction')
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
.tailcall __ARG_1.'_applyWithArgs'("foreign", 'WinxedTranslator', 'trans', $P1)
# }

.end # WSubId_606


.sub 'primHostExpr' :subid('WSubId_607') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var r: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_608'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # primHostExpr


.sub '' :anon :subid('WSubId_608') :outer('WSubId_607')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_applyWithArgs'("foreign", 'WinxedSemActionParser', 'semAction')
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
.tailcall __ARG_1.'_applyWithArgs'("foreign", 'WinxedTranslator', 'trans', $P1)
# }

.end # WSubId_608


.sub 'atomicHostExpr' :subid('WSubId_609') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_610'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_611'
newclosure $P4, $P5
.tailcall self.'_or'($P2, $P4)
# }

.end # atomicHostExpr


.sub '' :anon :subid('WSubId_610') :outer('WSubId_609')
.param pmc __ARG_1

# Body
# {
.tailcall __ARG_1.'_apply'("curlyHostExpr")
# }

.end # WSubId_610


.sub '' :anon :subid('WSubId_611') :outer('WSubId_609')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("primHostExpr")
# }

.end # WSubId_611


.sub 'semAction' :subid('WSubId_612') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_613'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_615'
newclosure $P5, $P6
.tailcall self.'_or'($P3, $P5)
# }

.end # semAction


.sub '' :anon :subid('WSubId_613') :outer('WSubId_612')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_614'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_613


.sub '' :anon :subid('WSubId_614') :outer('WSubId_613')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_2.'_apply'("curlyHostExpr")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Act"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_614


.sub '' :anon :subid('WSubId_615') :outer('WSubId_612')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_616'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_615


.sub '' :anon :subid('WSubId_616') :outer('WSubId_615')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_4.'_applyWithArgs'("token", "!")
$P1 = __ARG_4.'_apply'("atomicHostExpr")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Act"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_616


.sub 'arrSemAction' :subid('WSubId_617') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_618'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # arrSemAction


.sub '' :anon :subid('WSubId_618') :outer('WSubId_617')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("token", "->")
$P1 = __ARG_1.'_apply'("atomicHostExpr")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Act"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_618


.sub 'semPred' :subid('WSubId_619') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_620'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # semPred


.sub '' :anon :subid('WSubId_620') :outer('WSubId_619')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_1.'_applyWithArgs'("token", "?")
$P1 = __ARG_1.'_apply'("atomicHostExpr")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Pred"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_620


.sub 'expr' :subid('WSubId_621') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var xs: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_622'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_626'
newclosure $P6, $P7
.const 'Sub' $P9 = 'WSubId_630'
newclosure $P8, $P9
.tailcall self.'_or'($P4, $P6, $P8)
# }

.end # expr


.sub '' :anon :subid('WSubId_622') :outer('WSubId_621')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_623'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_622


.sub '' :anon :subid('WSubId_623') :outer('WSubId_622')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_2.'_applyWithArgs'("expr5", 1)
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_624'
newclosure $P3, $P4
$P2 = __ARG_2.'_many1'($P3)
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "Or"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
.tailcall $P3.'append'($P2)
# }

.end # WSubId_623


.sub '' :anon :subid('WSubId_624') :outer('WSubId_623')
.param pmc __ARG_3

# Body
# {
.const 'Sub' $P3 = 'WSubId_625'
newclosure $P2, $P3
$P1 = $P2(__ARG_3)
.return($P1)
# }

.end # WSubId_624


.sub '' :anon :subid('WSubId_625') :outer('WSubId_624')
.param pmc __ARG_4

# Body
# {
__ARG_4.'_applyWithArgs'("token", "|")
.tailcall __ARG_4.'_applyWithArgs'("expr5", 1)
# }

.end # WSubId_625


.sub '' :anon :subid('WSubId_626') :outer('WSubId_621')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_627'
newclosure $P4, $P5
$P3 = $P4(__ARG_5)
.return($P3)
# }

.end # WSubId_626


.sub '' :anon :subid('WSubId_627') :outer('WSubId_626')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_6.'_applyWithArgs'("expr5", 1)
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_628'
newclosure $P3, $P4
$P2 = __ARG_6.'_many1'($P3)
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "XOr"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
.tailcall $P3.'append'($P2)
# }

.end # WSubId_627


.sub '' :anon :subid('WSubId_628') :outer('WSubId_627')
.param pmc __ARG_7

# Body
# {
.const 'Sub' $P3 = 'WSubId_629'
newclosure $P2, $P3
$P1 = $P2(__ARG_7)
.return($P1)
# }

.end # WSubId_628


.sub '' :anon :subid('WSubId_629') :outer('WSubId_628')
.param pmc __ARG_8

# Body
# {
__ARG_8.'_applyWithArgs'("token", "||")
.tailcall __ARG_8.'_applyWithArgs'("expr5", 1)
# }

.end # WSubId_629


.sub '' :anon :subid('WSubId_630') :outer('WSubId_621')
.param pmc __ARG_9

# Body
# {
.tailcall __ARG_9.'_applyWithArgs'("expr5", 0)
# }

.end # WSubId_630


.sub 'expr5' :subid('WSubId_631') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_632'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # expr5


.sub '' :anon :subid('WSubId_632') :outer('WSubId_631')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
.const 'Sub' $P5 = 'WSubId_633'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_637'
newclosure $P6, $P7
.tailcall __ARG_1.'_or'($P4, $P6)
# }

.end # WSubId_632


.sub '' :anon :subid('WSubId_633') :outer('WSubId_632')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_634'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_633


.sub '' :anon :subid('WSubId_634') :outer('WSubId_633')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_3.'_apply'("interleavePart")
store_lex '__WLEX_2', $P1
.const 'Sub' $P4 = 'WSubId_635'
newclosure $P3, $P4
$P2 = __ARG_3.'_many1'($P3)
store_lex '__WLEX_3', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "Interleave"
$P3.'push'($P4)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
find_lex $P2, '__WLEX_3'
.tailcall $P3.'append'($P2)
# }

.end # WSubId_634


.sub '' :anon :subid('WSubId_635') :outer('WSubId_634')
.param pmc __ARG_4

# Body
# {
.const 'Sub' $P3 = 'WSubId_636'
newclosure $P2, $P3
$P1 = $P2(__ARG_4)
.return($P1)
# }

.end # WSubId_635


.sub '' :anon :subid('WSubId_636') :outer('WSubId_635')
.param pmc __ARG_5

# Body
# {
__ARG_5.'_applyWithArgs'("token", "&&")
.tailcall __ARG_5.'_apply'("interleavePart")
# }

.end # WSubId_636


.sub '' :anon :subid('WSubId_637') :outer('WSubId_632')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
# Body
# {
find_lex $P1, '__WLEX_1'
.tailcall __ARG_6.'_applyWithArgs'("expr4", $P1)
# }

.end # WSubId_637


.sub 'interleavePart' :subid('WSubId_638') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var part: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_639'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_641'
newclosure $P5, $P6
.tailcall self.'_or'($P3, $P5)
# }

.end # interleavePart


.sub '' :anon :subid('WSubId_639') :outer('WSubId_638')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_640'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_639


.sub '' :anon :subid('WSubId_640') :outer('WSubId_639')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_2.'_applyWithArgs'("token", "(")
$P1 = __ARG_2.'_applyWithArgs'("expr4", 1)
store_lex '__WLEX_1', $P1
__ARG_2.'_applyWithArgs'("token", ")")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "1"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_640


.sub '' :anon :subid('WSubId_641') :outer('WSubId_638')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_642'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_641


.sub '' :anon :subid('WSubId_642') :outer('WSubId_641')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_4.'_applyWithArgs'("expr4", 1)
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
.tailcall __ARG_4.'_applyWithArgs'("modedIPart", $P1)
# }

.end # WSubId_642


.sub 'modedIPart' :subid('WSubId_643') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var part: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_644'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_650'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_656'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_662'
newclosure $P9, $P10
.tailcall self.'_or'($P3, $P5, $P7, $P9)
# }

.end # modedIPart


.sub '' :anon :subid('WSubId_644') :outer('WSubId_643')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_645'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_644


.sub '' :anon :subid('WSubId_645') :outer('WSubId_644')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_646'
newclosure $P2, $P3
__ARG_2.'_form'($P2)
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "*"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_645


.sub '' :anon :subid('WSubId_646') :outer('WSubId_645')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_647'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_646


.sub '' :anon :subid('WSubId_647') :outer('WSubId_646')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_4.'_applyWithArgs'("exactly", "And")
.const 'Sub' $P3 = 'WSubId_648'
newclosure $P2, $P3
.tailcall __ARG_4.'_form'($P2)
# }

.end # WSubId_647


.sub '' :anon :subid('WSubId_648') :outer('WSubId_647')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_649'
newclosure $P3, $P4
$P2 = $P3(__ARG_5)
.return($P2)
# }

.end # WSubId_648


.sub '' :anon :subid('WSubId_649') :outer('WSubId_648')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_6.'_applyWithArgs'("exactly", "Many")
$P1 = __ARG_6.'_apply'("anything")
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_649


.sub '' :anon :subid('WSubId_650') :outer('WSubId_643')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_651'
newclosure $P3, $P4
$P2 = $P3(__ARG_7)
.return($P2)
# }

.end # WSubId_650


.sub '' :anon :subid('WSubId_651') :outer('WSubId_650')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_652'
newclosure $P2, $P3
__ARG_8.'_form'($P2)
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "+"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_651


.sub '' :anon :subid('WSubId_652') :outer('WSubId_651')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_653'
newclosure $P3, $P4
$P2 = $P3(__ARG_9)
.return($P2)
# }

.end # WSubId_652


.sub '' :anon :subid('WSubId_653') :outer('WSubId_652')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_10.'_applyWithArgs'("exactly", "And")
.const 'Sub' $P3 = 'WSubId_654'
newclosure $P2, $P3
.tailcall __ARG_10.'_form'($P2)
# }

.end # WSubId_653


.sub '' :anon :subid('WSubId_654') :outer('WSubId_653')
.param pmc __ARG_11

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_655'
newclosure $P3, $P4
$P2 = $P3(__ARG_11)
.return($P2)
# }

.end # WSubId_654


.sub '' :anon :subid('WSubId_655') :outer('WSubId_654')
.param pmc __ARG_12

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_12.'_applyWithArgs'("exactly", "Many1")
$P1 = __ARG_12.'_apply'("anything")
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_655


.sub '' :anon :subid('WSubId_656') :outer('WSubId_643')
.param pmc __ARG_13

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_657'
newclosure $P3, $P4
$P2 = $P3(__ARG_13)
.return($P2)
# }

.end # WSubId_656


.sub '' :anon :subid('WSubId_657') :outer('WSubId_656')
.param pmc __ARG_14

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_658'
newclosure $P2, $P3
__ARG_14.'_form'($P2)
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "?"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_657


.sub '' :anon :subid('WSubId_658') :outer('WSubId_657')
.param pmc __ARG_15

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_659'
newclosure $P3, $P4
$P2 = $P3(__ARG_15)
.return($P2)
# }

.end # WSubId_658


.sub '' :anon :subid('WSubId_659') :outer('WSubId_658')
.param pmc __ARG_16

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_16.'_applyWithArgs'("exactly", "And")
.const 'Sub' $P3 = 'WSubId_660'
newclosure $P2, $P3
.tailcall __ARG_16.'_form'($P2)
# }

.end # WSubId_659


.sub '' :anon :subid('WSubId_660') :outer('WSubId_659')
.param pmc __ARG_17

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_661'
newclosure $P3, $P4
$P2 = $P3(__ARG_17)
.return($P2)
# }

.end # WSubId_660


.sub '' :anon :subid('WSubId_661') :outer('WSubId_660')
.param pmc __ARG_18

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_18.'_applyWithArgs'("exactly", "Opt")
$P1 = __ARG_18.'_apply'("anything")
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_661


.sub '' :anon :subid('WSubId_662') :outer('WSubId_643')
.param pmc __ARG_19

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_663'
newclosure $P3, $P4
$P2 = $P3(__ARG_19)
.return($P2)
# }

.end # WSubId_662


.sub '' :anon :subid('WSubId_663') :outer('WSubId_662')
.param pmc __ARG_20

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_20.'_apply'("anything")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "1"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_663


.sub 'expr4' :subid('WSubId_664') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_665'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # expr4


.sub '' :anon :subid('WSubId_665') :outer('WSubId_664')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
.const 'Sub' $P5 = 'WSubId_666'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_669'
newclosure $P6, $P7
.const 'Sub' $P9 = 'WSubId_672'
newclosure $P8, $P9
.tailcall __ARG_1.'_or'($P4, $P6, $P8)
# }

.end # WSubId_665


.sub '' :anon :subid('WSubId_666') :outer('WSubId_665')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_667'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_666


.sub '' :anon :subid('WSubId_667') :outer('WSubId_666')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_668'
newclosure $P3, $P4
$P1 = __ARG_3.'_many'($P3)
store_lex '__WLEX_2', $P1
$P2 = __ARG_3.'_apply'("arrSemAction")
store_lex '__WLEX_3', $P2
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "And"
$P4.'push'($P5)
find_lex $P1, '__WLEX_2'
$P3 = $P4.'append'($P1)
root_new $P6, ['parrot';'ResizablePMCArray']
find_lex $P2, '__WLEX_3'
$P6.'push'($P2)
.tailcall $P3.'append'($P6)
# }

.end # WSubId_667


.sub '' :anon :subid('WSubId_668') :outer('WSubId_667')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_apply'("expr3")
# }

.end # WSubId_668


.sub '' :anon :subid('WSubId_669') :outer('WSubId_665')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_670'
newclosure $P4, $P5
$P3 = $P4(__ARG_5)
.return($P3)
# }

.end # WSubId_669


.sub '' :anon :subid('WSubId_670') :outer('WSubId_669')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
find_lex $P1, '__WLEX_1'
__ARG_6.'_pred'($P1)
.const 'Sub' $P4 = 'WSubId_671'
newclosure $P3, $P4
$P2 = __ARG_6.'_many1'($P3)
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "And"
$P3.'push'($P4)
find_lex $P2, '__WLEX_2'
.tailcall $P3.'append'($P2)
# }

.end # WSubId_670


.sub '' :anon :subid('WSubId_671') :outer('WSubId_670')
.param pmc __ARG_7

# Body
# {
.tailcall __ARG_7.'_apply'("expr3")
# }

.end # WSubId_671


.sub '' :anon :subid('WSubId_672') :outer('WSubId_665')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_673'
newclosure $P4, $P5
$P3 = $P4(__ARG_8)
.return($P3)
# }

.end # WSubId_672


.sub '' :anon :subid('WSubId_673') :outer('WSubId_672')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
find_lex $P1, '__WLEX_1'
set $I2, $P1
iseq $I1, $I2, 0
__ARG_9.'_pred'($I1)
.const 'Sub' $P4 = 'WSubId_674'
newclosure $P3, $P4
$P2 = __ARG_9.'_many'($P3)
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "And"
$P3.'push'($P4)
find_lex $P2, '__WLEX_2'
.tailcall $P3.'append'($P2)
# }

.end # WSubId_673


.sub '' :anon :subid('WSubId_674') :outer('WSubId_673')
.param pmc __ARG_10

# Body
# {
.tailcall __ARG_10.'_apply'("expr3")
# }

.end # WSubId_674


.sub 'optIter' :subid('WSubId_675') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_676'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # optIter


.sub '' :anon :subid('WSubId_676') :outer('WSubId_675')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
.const 'Sub' $P3 = 'WSubId_677'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_679'
newclosure $P4, $P5
.tailcall __ARG_1.'_or'($P2, $P4)
# }

.end # WSubId_676


.sub '' :anon :subid('WSubId_677') :outer('WSubId_676')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_678'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_677


.sub '' :anon :subid('WSubId_678') :outer('WSubId_677')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
$P2 = __ARG_3.'_apply'('anything')
set $S1, $P2
set $S2, "*"
if $S1 == $S2 goto __label_2
set $S2, "+"
if $S1 == $S2 goto __label_3
set $S2, "?"
if $S1 == $S2 goto __label_4
goto __label_1
# switch
__label_2: # case
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "Many"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
.return($P3)
__label_3: # case
root_new $P5, ['parrot';'ResizablePMCArray']
box $P6, "Many1"
$P5.'push'($P6)
find_lex $P1, '__WLEX_1'
$P5.'push'($P1)
.return($P5)
__label_4: # case
root_new $P7, ['parrot';'ResizablePMCArray']
box $P8, "Opt"
$P7.'push'($P8)
find_lex $P1, '__WLEX_1'
$P7.'push'($P1)
.return($P7)
__label_1: # default
getattribute $P9, __ARG_3, 'fail'
throw $P9
__label_0: # switch end
# }

.end # WSubId_678


.sub '' :anon :subid('WSubId_679') :outer('WSubId_676')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_680'
newclosure $P3, $P4
$P2 = $P3(__ARG_4)
.return($P2)
# }

.end # WSubId_679


.sub '' :anon :subid('WSubId_680') :outer('WSubId_679')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_5.'_apply'("empty")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_680


.sub 'optBind' :subid('WSubId_681') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var n: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_682'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # optBind


.sub '' :anon :subid('WSubId_682') :outer('WSubId_681')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_683'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_687'
newclosure $P5, $P6
.tailcall __ARG_1.'_or'($P3, $P5)
# }

.end # WSubId_682


.sub '' :anon :subid('WSubId_683') :outer('WSubId_682')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_684'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_683


.sub '' :anon :subid('WSubId_684') :outer('WSubId_683')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
$P3 = __ARG_3.'_apply'('anything')
set $S1, $P3
set $S2, ":"
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P6 = 'WSubId_685'
newclosure $P5, $P6
$P4 = $P5(__ARG_3)
.return($P4)
__label_1: # default
getattribute $P7, __ARG_3, 'fail'
throw $P7
__label_0: # switch end
# }

.end # WSubId_684


.sub '' :anon :subid('WSubId_685') :outer('WSubId_684')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_4.'_apply'("name")
store_lex '__WLEX_2', $P1
.const 'Sub' $P5 = 'WSubId_686'
newclosure $P4, $P5
$P3 = $P4(__ARG_4)
.return($P3)
# }

.end # WSubId_685


.sub '' :anon :subid('WSubId_686') :outer('WSubId_685')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
$P3 = __ARG_5["locals"]
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "Set"
$P3.'push'($P4)
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
find_lex $P2, '__WLEX_1'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_686


.sub '' :anon :subid('WSubId_687') :outer('WSubId_682')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_688'
newclosure $P3, $P4
$P2 = $P3(__ARG_6)
.return($P2)
# }

.end # WSubId_687


.sub '' :anon :subid('WSubId_688') :outer('WSubId_687')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_7.'_apply'("empty")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_688


.sub 'expr3' :subid('WSubId_689') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P4
.lex '__WLEX_3', $P3
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
.const 'Sub' $P6 = 'WSubId_690'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_693'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_698'
newclosure $P9, $P10
.tailcall self.'_or'($P5, $P7, $P9)
# }

.end # expr3


.sub '' :anon :subid('WSubId_690') :outer('WSubId_689')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_691'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_690


.sub '' :anon :subid('WSubId_691') :outer('WSubId_690')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_2.'_applyWithArgs'("token", ":")
$P1 = __ARG_2.'_apply'("name")
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_692'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_691


.sub '' :anon :subid('WSubId_692') :outer('WSubId_691')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
$P2 = __ARG_3["locals"]
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Set"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "App"
$P4.'push'($P5)
box $P5, "anything"
$P4.'push'($P5)
$P2.'push'($P4)
.return($P2)
# }

.end # WSubId_692


.sub '' :anon :subid('WSubId_693') :outer('WSubId_689')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_694'
newclosure $P4, $P5
$P3 = $P4(__ARG_4)
.return($P3)
# }

.end # WSubId_693


.sub '' :anon :subid('WSubId_694') :outer('WSubId_693')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_695'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_697'
newclosure $P5, $P6
$P1 = __ARG_5.'_or'($P3, $P5)
store_lex '__WLEX_2', $P1
find_lex $P1, '__WLEX_2'
.tailcall __ARG_5.'_applyWithArgs'("optBind", $P1)
# }

.end # WSubId_694


.sub '' :anon :subid('WSubId_695') :outer('WSubId_694')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_696'
newclosure $P3, $P4
$P2 = $P3(__ARG_6)
.return($P2)
# }

.end # WSubId_695


.sub '' :anon :subid('WSubId_696') :outer('WSubId_695')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_7.'_apply'("expr2")
store_lex '__WLEX_3', $P1
find_lex $P1, '__WLEX_3'
.tailcall __ARG_7.'_applyWithArgs'("optIter", $P1)
# }

.end # WSubId_696


.sub '' :anon :subid('WSubId_697') :outer('WSubId_694')
.param pmc __ARG_8

# Body
# {
.tailcall __ARG_8.'_apply'("semAction")
# }

.end # WSubId_697


.sub '' :anon :subid('WSubId_698') :outer('WSubId_689')
.param pmc __ARG_9

# Body
# {
.tailcall __ARG_9.'_apply'("semPred")
# }

.end # WSubId_698


.sub 'expr2' :subid('WSubId_699') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_700'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_702'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_704'
newclosure $P7, $P8
.tailcall self.'_or'($P3, $P5, $P7)
# }

.end # expr2


.sub '' :anon :subid('WSubId_700') :outer('WSubId_699')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_701'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_700


.sub '' :anon :subid('WSubId_701') :outer('WSubId_700')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_2.'_applyWithArgs'("token", "~")
$P1 = __ARG_2.'_apply'("expr2")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Not"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_701


.sub '' :anon :subid('WSubId_702') :outer('WSubId_699')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_703'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_702


.sub '' :anon :subid('WSubId_703') :outer('WSubId_702')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_4.'_applyWithArgs'("token", "&")
$P1 = __ARG_4.'_apply'("expr1")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Lookahead"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_703


.sub '' :anon :subid('WSubId_704') :outer('WSubId_699')
.param pmc __ARG_5

# Body
# {
.tailcall __ARG_5.'_apply'("expr1")
# }

.end # WSubId_704


.sub 'expr1' :subid('WSubId_705') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_706'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_707'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_712'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_718'
newclosure $P9, $P10
.const 'Sub' $P12 = 'WSubId_720'
newclosure $P11, $P12
.const 'Sub' $P14 = 'WSubId_722'
newclosure $P13, $P14
.const 'Sub' $P16 = 'WSubId_724'
newclosure $P15, $P16
.tailcall self.'_or'($P3, $P5, $P7, $P9, $P11, $P13, $P15)
# }

.end # expr1


.sub '' :anon :subid('WSubId_706') :outer('WSubId_705')
.param pmc __ARG_1

# Body
# {
.tailcall __ARG_1.'_apply'("application")
# }

.end # WSubId_706


.sub '' :anon :subid('WSubId_707') :outer('WSubId_705')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_708'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_707


.sub '' :anon :subid('WSubId_708') :outer('WSubId_707')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_709'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_710'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_711'
newclosure $P6, $P7
$P1 = __ARG_3.'_or'($P2, $P4, $P6)
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "App"
$P2.'push'($P3)
box $P3, "exactly"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_708


.sub '' :anon :subid('WSubId_709') :outer('WSubId_708')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_applyWithArgs'("keyword", "null")
# }

.end # WSubId_709


.sub '' :anon :subid('WSubId_710') :outer('WSubId_708')
.param pmc __ARG_5

# Body
# {
.tailcall __ARG_5.'_applyWithArgs'("keyword", "true")
# }

.end # WSubId_710


.sub '' :anon :subid('WSubId_711') :outer('WSubId_708')
.param pmc __ARG_6

# Body
# {
.tailcall __ARG_6.'_applyWithArgs'("keyword", "false")
# }

.end # WSubId_711


.sub '' :anon :subid('WSubId_712') :outer('WSubId_705')
.param pmc __ARG_7

# Body
# {
.const 'Sub' $P3 = 'WSubId_713'
newclosure $P2, $P3
$P1 = $P2(__ARG_7)
.return($P1)
# }

.end # WSubId_712


.sub '' :anon :subid('WSubId_713') :outer('WSubId_712')
.param pmc __ARG_8

# Body
# {
__ARG_8.'_apply'("spaces")
.const 'Sub' $P2 = 'WSubId_714'
newclosure $P1, $P2
.const 'Sub' $P4 = 'WSubId_715'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_716'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_717'
newclosure $P7, $P8
.tailcall __ARG_8.'_or'($P1, $P3, $P5, $P7)
# }

.end # WSubId_713


.sub '' :anon :subid('WSubId_714') :outer('WSubId_713')
.param pmc __ARG_9

# Body
# {
.tailcall __ARG_9.'_apply'("characters")
# }

.end # WSubId_714


.sub '' :anon :subid('WSubId_715') :outer('WSubId_713')
.param pmc __ARG_10

# Body
# {
.tailcall __ARG_10.'_apply'("sCharacters")
# }

.end # WSubId_715


.sub '' :anon :subid('WSubId_716') :outer('WSubId_713')
.param pmc __ARG_11

# Body
# {
.tailcall __ARG_11.'_apply'("string")
# }

.end # WSubId_716


.sub '' :anon :subid('WSubId_717') :outer('WSubId_713')
.param pmc __ARG_12

# Body
# {
.tailcall __ARG_12.'_apply'("number")
# }

.end # WSubId_717


.sub '' :anon :subid('WSubId_718') :outer('WSubId_705')
.param pmc __ARG_13

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_719'
newclosure $P3, $P4
$P2 = $P3(__ARG_13)
.return($P2)
# }

.end # WSubId_718


.sub '' :anon :subid('WSubId_719') :outer('WSubId_718')
.param pmc __ARG_14

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_14.'_applyWithArgs'("token", "[")
$P1 = __ARG_14.'_apply'("expr")
store_lex '__WLEX_1', $P1
__ARG_14.'_applyWithArgs'("token", "]")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Form"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_719


.sub '' :anon :subid('WSubId_720') :outer('WSubId_705')
.param pmc __ARG_15

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_721'
newclosure $P3, $P4
$P2 = $P3(__ARG_15)
.return($P2)
# }

.end # WSubId_720


.sub '' :anon :subid('WSubId_721') :outer('WSubId_720')
.param pmc __ARG_16

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_16.'_applyWithArgs'("token", "<")
$P1 = __ARG_16.'_apply'("expr")
store_lex '__WLEX_1', $P1
__ARG_16.'_applyWithArgs'("token", ">")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "ConsBy"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_721


.sub '' :anon :subid('WSubId_722') :outer('WSubId_705')
.param pmc __ARG_17

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_723'
newclosure $P3, $P4
$P2 = $P3(__ARG_17)
.return($P2)
# }

.end # WSubId_722


.sub '' :anon :subid('WSubId_723') :outer('WSubId_722')
.param pmc __ARG_18

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_18.'_applyWithArgs'("token", "@<")
$P1 = __ARG_18.'_apply'("expr")
store_lex '__WLEX_1', $P1
__ARG_18.'_applyWithArgs'("token", ">")
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "IdxConsBy"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_723


.sub '' :anon :subid('WSubId_724') :outer('WSubId_705')
.param pmc __ARG_19

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_725'
newclosure $P3, $P4
$P2 = $P3(__ARG_19)
.return($P2)
# }

.end # WSubId_724


.sub '' :anon :subid('WSubId_725') :outer('WSubId_724')
.param pmc __ARG_20

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_20.'_applyWithArgs'("token", "(")
$P1 = __ARG_20.'_apply'("expr")
store_lex '__WLEX_1', $P1
__ARG_20.'_applyWithArgs'("token", ")")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_725


.sub 'ruleName' :subid('WSubId_726') :method

# Body
# {
# var fromIdx: $P1
getattribute $P2, self, 'input'
getattribute $P1, $P2, 'idx'
.const 'Sub' $P3 = 'WSubId_727'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_728'
newclosure $P4, $P5
.tailcall self.'_or'($P2, $P4)
# }

.end # ruleName


.sub '' :anon :subid('WSubId_727') :outer('WSubId_726')
.param pmc __ARG_1

# Body
# {
.tailcall __ARG_1.'_apply'("name")
# }

.end # WSubId_727


.sub '' :anon :subid('WSubId_728') :outer('WSubId_726')
.param pmc __ARG_2

# Body
# {
.const 'Sub' $P3 = 'WSubId_729'
newclosure $P2, $P3
$P1 = $P2(__ARG_2)
.return($P1)
# }

.end # WSubId_728


.sub '' :anon :subid('WSubId_729') :outer('WSubId_728')
.param pmc __ARG_3

# Body
# {
__ARG_3.'_apply'("spaces")
.tailcall __ARG_3.'_apply'("tsString")
# }

.end # WSubId_729


.sub 'rule' :subid('WSubId_730') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_731'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # rule


.sub '' :anon :subid('WSubId_731') :outer('WSubId_730')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_732'
newclosure $P4, $P5
__ARG_1.'_lookahead'($P4)
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "fromIdx=self.input.idx"
$P4.'push'($P5)
__ARG_1["locals"] = $P4
find_lex $P1, '__WLEX_1'
$P2 = __ARG_1.'_applyWithArgs'("rulePart", $P1)
store_lex '__WLEX_2', $P2
.const 'Sub' $P7 = 'WSubId_733'
newclosure $P6, $P7
$P3 = __ARG_1.'_many'($P6)
store_lex '__WLEX_3', $P3
root_new $P6, ['parrot';'ResizablePMCArray']
box $P7, "Rule"
$P6.'push'($P7)
find_lex $P1, '__WLEX_1'
$P6.'push'($P1)
$P8 = __ARG_1["locals"]
$P6.'push'($P8)
root_new $P10, ['parrot';'ResizablePMCArray']
box $P11, "Or"
$P10.'push'($P11)
find_lex $P2, '__WLEX_2'
$P10.'push'($P2)
find_lex $P3, '__WLEX_3'
$P9 = $P10.'append'($P3)
$P6.'push'($P9)
.return($P6)
# }

.end # WSubId_731


.sub '' :anon :subid('WSubId_732') :outer('WSubId_731')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_2.'_apply'("ruleName")
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_732


.sub '' :anon :subid('WSubId_733') :outer('WSubId_731')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_734'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_733


.sub '' :anon :subid('WSubId_734') :outer('WSubId_733')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_4.'_applyWithArgs'("token", ",")
find_lex $P1, '__WLEX_1'
.tailcall __ARG_4.'_applyWithArgs'("rulePart", $P1)
# }

.end # WSubId_734


.sub 'rulePart' :subid('WSubId_735') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
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
.const 'Sub' $P8 = 'WSubId_736'
newclosure $P7, $P8
$P6 = $P7(self)
.return($P6)
# }

.end # rulePart


.sub '' :anon :subid('WSubId_736') :outer('WSubId_735')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
$P4 = find_lex '__WLEX_4'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("ruleName")
store_lex '__WLEX_2', $P2
find_lex $P2, '__WLEX_2'
find_lex $P1, '__WLEX_1'
iseq $I1, $P2, $P1
__ARG_1.'_pred'($I1)
$P3 = __ARG_1.'_apply'("expr4")
store_lex '__WLEX_3', $P3
.const 'Sub' $P6 = 'WSubId_737'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_739'
newclosure $P7, $P8
.tailcall __ARG_1.'_or'($P5, $P7)
# }

.end # WSubId_736


.sub '' :anon :subid('WSubId_737') :outer('WSubId_736')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_738'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_737


.sub '' :anon :subid('WSubId_738') :outer('WSubId_737')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_3'
# Body
# {
__ARG_3.'_applyWithArgs'("token", "=")
$P1 = __ARG_3.'_apply'("expr")
store_lex '__WLEX_4', $P1
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "And"
$P3.'push'($P4)
find_lex $P2, '__WLEX_3'
$P3.'push'($P2)
find_lex $P1, '__WLEX_4'
$P3.'push'($P1)
.return($P3)
# }

.end # WSubId_738


.sub '' :anon :subid('WSubId_739') :outer('WSubId_736')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_740'
newclosure $P3, $P4
$P2 = $P3(__ARG_4)
.return($P2)
# }

.end # WSubId_739


.sub '' :anon :subid('WSubId_740') :outer('WSubId_739')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_3'
# Body
# {
__ARG_5.'_apply'("empty")
find_lex $P1, '__WLEX_3'
.return($P1)
# }

.end # WSubId_740


.sub 'grammar' :subid('WSubId_741') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_742'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # grammar


.sub '' :anon :subid('WSubId_742') :outer('WSubId_741')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
__ARG_1.'_applyWithArgs'("keyword", "ometa")
$P1 = __ARG_1.'_apply'("name")
store_lex '__WLEX_1', $P1
.const 'Sub' $P5 = 'WSubId_743'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_745'
newclosure $P6, $P7
$P2 = __ARG_1.'_or'($P4, $P6)
store_lex '__WLEX_2', $P2
__ARG_1.'_applyWithArgs'("token", "{")
$P3 = __ARG_1.'_applyWithArgs'("listOf", "rule", ",")
store_lex '__WLEX_3', $P3
__ARG_1.'_applyWithArgs'("token", "}")
root_new $P5, ['parrot';'ResizablePMCArray']
box $P6, "Grammar"
$P5.'push'($P6)
find_lex $P1, '__WLEX_1'
$P5.'push'($P1)
find_lex $P2, '__WLEX_2'
$P5.'push'($P2)
find_lex $P3, '__WLEX_3'
$P4 = $P5.'append'($P3)
.tailcall __ARG_1.'_applyWithArgs'("foreign", 'OMetaOptimizer', 'optimizeGrammar', $P4)
# }

.end # WSubId_742


.sub '' :anon :subid('WSubId_743') :outer('WSubId_742')
.param pmc __ARG_2

# Body
# {
.const 'Sub' $P3 = 'WSubId_744'
newclosure $P2, $P3
$P1 = $P2(__ARG_2)
.return($P1)
# }

.end # WSubId_743


.sub '' :anon :subid('WSubId_744') :outer('WSubId_743')
.param pmc __ARG_3

# Body
# {
__ARG_3.'_applyWithArgs'("token", "<:")
.tailcall __ARG_3.'_apply'("name")
# }

.end # WSubId_744


.sub '' :anon :subid('WSubId_745') :outer('WSubId_742')
.param pmc __ARG_4

# Body
# {
.const 'Sub' $P3 = 'WSubId_746'
newclosure $P2, $P3
$P1 = $P2(__ARG_4)
.return($P1)
# }

.end # WSubId_745


.sub '' :anon :subid('WSubId_746') :outer('WSubId_745')
.param pmc __ARG_5

# Body
# {
__ARG_5.'_apply'("empty")
.return("OMeta")
# }

.end # WSubId_746

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMetaParser' ]
get_class $P1, [ 'Parser' ]
addparent $P0, $P1
.end
.namespace [ 'OMetaTranslator' ]

.sub 'App' :subid('WSubId_747') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var args: $P2
null $P2
# var rule: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_748'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_752'
newclosure $P6, $P7
.const 'Sub' $P9 = 'WSubId_755'
newclosure $P8, $P9
.tailcall self.'_or'($P4, $P6, $P8)
# }

.end # App


.sub '' :anon :subid('WSubId_748') :outer('WSubId_747')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_749'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_748


.sub '' :anon :subid('WSubId_749') :outer('WSubId_748')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P2 = __ARG_2.'_apply'('anything')
set $S1, $P2
set $S2, "super"
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P5 = 'WSubId_750'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
__label_1: # default
getattribute $P6, __ARG_2, 'fail'
throw $P6
__label_0: # switch end
# }

.end # WSubId_749


.sub '' :anon :subid('WSubId_750') :outer('WSubId_749')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_751'
newclosure $P2, $P3
$P1 = __ARG_3.'_many1'($P2)
store_lex '__WLEX_1', $P1
# predefined string
$S1 = __ARG_3["sName"]
find_lex $P1, '__WLEX_1'
# predefined join
join $S2, ",", $P1
concat $S3, "self._superApplyWithArgs(\"", $S1
concat $S3, $S3, "\","
concat $S3, $S3, $S2
concat $S3, $S3, ")"
.return($S3)
# }

.end # WSubId_750


.sub '' :anon :subid('WSubId_751') :outer('WSubId_750')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_apply'("anything")
# }

.end # WSubId_751


.sub '' :anon :subid('WSubId_752') :outer('WSubId_747')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P5 = 'WSubId_753'
newclosure $P4, $P5
$P3 = $P4(__ARG_5)
.return($P3)
# }

.end # WSubId_752


.sub '' :anon :subid('WSubId_753') :outer('WSubId_752')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_6.'_apply'("anything")
store_lex '__WLEX_2', $P1
.const 'Sub' $P4 = 'WSubId_754'
newclosure $P3, $P4
$P2 = __ARG_6.'_many1'($P3)
store_lex '__WLEX_1', $P2
# predefined string
find_lex $P1, '__WLEX_2'
set $S1, $P1
find_lex $P2, '__WLEX_1'
# predefined join
join $S2, ",", $P2
concat $S3, "self._applyWithArgs(\"", $S1
concat $S3, $S3, "\","
concat $S3, $S3, $S2
concat $S3, $S3, ")"
.return($S3)
# }

.end # WSubId_753


.sub '' :anon :subid('WSubId_754') :outer('WSubId_753')
.param pmc __ARG_7

# Body
# {
.tailcall __ARG_7.'_apply'("anything")
# }

.end # WSubId_754


.sub '' :anon :subid('WSubId_755') :outer('WSubId_747')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_756'
newclosure $P3, $P4
$P2 = $P3(__ARG_8)
.return($P2)
# }

.end # WSubId_755


.sub '' :anon :subid('WSubId_756') :outer('WSubId_755')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_9.'_apply'("anything")
store_lex '__WLEX_2', $P1
# predefined string
find_lex $P1, '__WLEX_2'
set $S1, $P1
concat $S2, "self._apply(\"", $S1
concat $S2, $S2, "\")"
.return($S2)
# }

.end # WSubId_756


.sub 'Act' :subid('WSubId_757') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var expr: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_758'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Act


.sub '' :anon :subid('WSubId_758') :outer('WSubId_757')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_758


.sub 'Pred' :subid('WSubId_759') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var expr: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_760'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Pred


.sub '' :anon :subid('WSubId_760') :outer('WSubId_759')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "self._pred(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_760


.sub 'Or' :subid('WSubId_761') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_762'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Or


.sub '' :anon :subid('WSubId_762') :outer('WSubId_761')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_763'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, ",", $P1
concat $S2, "self._or(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_762


.sub '' :anon :subid('WSubId_763') :outer('WSubId_762')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("transFn")
# }

.end # WSubId_763


.sub 'XOr' :subid('WSubId_764') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_765'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # XOr


.sub '' :anon :subid('WSubId_765') :outer('WSubId_764')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_766'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
$P3 = __ARG_1["name"]
set $I3, $P3
set $I4, "."
add $I2, $I3, $I4
$P4 = __ARG_1["rName"]
set $I5, $P4
add $I1, $I2, $I5
$P2 = 'toProgramString'($I1)
$P1.'unshift'($P2)
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, ",", $P1
concat $S2, "self._xor(", $S1
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


.sub 'And' :subid('WSubId_767') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var xs: $P2
null $P2
# var y: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_768'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_771'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # And


.sub '' :anon :subid('WSubId_768') :outer('WSubId_767')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_769'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_768


.sub '' :anon :subid('WSubId_769') :outer('WSubId_768')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_770'
newclosure $P3, $P4
$P1 = __ARG_2.'_many'($P3)
store_lex '__WLEX_1', $P1
$P2 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_2', $P2
find_lex $P1, '__WLEX_1'
# predefined string
find_lex $P2, '__WLEX_2'
set $S1, $P2
concat $S2, "return ", $S1
$P1.'push'($S2)
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, ";", $P1
concat $S2, "(function(var self){", $S1
concat $S2, $S2, ";})(self)"
.return($S2)
# }

.end # WSubId_769


.sub '' :anon :subid('WSubId_770') :outer('WSubId_769')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_applyWithArgs'("notLast", "trans")
# }

.end # WSubId_770


.sub '' :anon :subid('WSubId_771') :outer('WSubId_767')
.param pmc __ARG_4

# Body
# {
.return("")
# }

.end # WSubId_771


.sub 'Opt' :subid('WSubId_772') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_773'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Opt


.sub '' :anon :subid('WSubId_773') :outer('WSubId_772')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "self._opt(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_773


.sub 'Many' :subid('WSubId_774') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_775'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Many


.sub '' :anon :subid('WSubId_775') :outer('WSubId_774')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "self._many(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_775


.sub 'Many1' :subid('WSubId_776') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_777'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Many1


.sub '' :anon :subid('WSubId_777') :outer('WSubId_776')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "self._many1(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_777


.sub 'Not' :subid('WSubId_778') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_779'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Not


.sub '' :anon :subid('WSubId_779') :outer('WSubId_778')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "self._not(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_779


.sub 'Lookahead' :subid('WSubId_780') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_781'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Lookahead


.sub '' :anon :subid('WSubId_781') :outer('WSubId_780')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "self._lookahead(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_781


.sub 'Form' :subid('WSubId_782') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_783'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Form


.sub '' :anon :subid('WSubId_783') :outer('WSubId_782')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "self._form(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_783


.sub 'ConsBy' :subid('WSubId_784') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_785'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # ConsBy


.sub '' :anon :subid('WSubId_785') :outer('WSubId_784')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "self._consumedBy(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_785


.sub 'IdxConsBy' :subid('WSubId_786') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_787'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # IdxConsBy


.sub '' :anon :subid('WSubId_787') :outer('WSubId_786')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("transFn")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "self._idxConsumedBy(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_787


.sub 'Set' :subid('WSubId_788') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var n: $P2
null $P2
# var v: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_789'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # Set


.sub '' :anon :subid('WSubId_789') :outer('WSubId_788')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
concat $S3, $S1, "="
concat $S3, $S3, $S2
.return($S3)
# }

.end # WSubId_789


.sub 'JumpTable' :subid('WSubId_790') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var cases: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_791'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # JumpTable


.sub '' :anon :subid('WSubId_791') :outer('WSubId_790')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_792'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
.tailcall __ARG_1.'jumpTableCode'($P1)
# }

.end # WSubId_791


.sub '' :anon :subid('WSubId_792') :outer('WSubId_791')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("jtCase")
# }

.end # WSubId_792


.sub 'Interleave' :subid('WSubId_793') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_794'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Interleave


.sub '' :anon :subid('WSubId_794') :outer('WSubId_793')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_795'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, ",", $P1
concat $S2, "self._interleave(", $S1
concat $S2, $S2, ")"
.return($S2)
# }

.end # WSubId_794


.sub '' :anon :subid('WSubId_795') :outer('WSubId_794')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("intPart")
# }

.end # WSubId_795


.sub 'Rule' :subid('WSubId_796') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_797'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # Rule


.sub '' :anon :subid('WSubId_797') :outer('WSubId_796')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
__ARG_1["rName"] = $P1
$P2 = __ARG_1.'_apply'("locals")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
# predefined string
find_lex $P3, '__WLEX_3'
set $S3, $P3
concat $S4, "function ", $S1
concat $S4, $S4, "(){"
concat $S4, $S4, $S2
concat $S4, $S4, "return "
concat $S4, $S4, $S3
concat $S4, $S4, ";}"
.return($S4)
# }

.end # WSubId_797


.sub 'Grammar' :subid('WSubId_798') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_799'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # Grammar


.sub '' :anon :subid('WSubId_799') :outer('WSubId_798')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P2
find_lex $P1, '__WLEX_1'
__ARG_1["name"] = $P1
find_lex $P2, '__WLEX_2'
__ARG_1["sName"] = $P2
.const 'Sub' $P5 = 'WSubId_800'
newclosure $P4, $P5
$P3 = __ARG_1.'_many'($P4)
store_lex '__WLEX_3', $P3
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
find_lex $P3, '__WLEX_3'
# predefined join
join $S3, "", $P3
concat $S4, "class ", $S1
concat $S4, $S4, " : "
concat $S4, $S4, $S2
concat $S4, $S4, " {"
concat $S4, $S4, $S3
concat $S4, $S4, "}"
.return($S4)
# }

.end # WSubId_799


.sub '' :anon :subid('WSubId_800') :outer('WSubId_799')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_800


.sub 'intPart' :subid('WSubId_801') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var mode: $P2
null $P2
# var part: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_802'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # intPart


.sub '' :anon :subid('WSubId_802') :outer('WSubId_801')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_803'
newclosure $P3, $P4
__ARG_1.'_form'($P3)
find_lex $P1, '__WLEX_1'
$P3 = 'toProgramString'($P1)
set $I2, $P3
set $I3, ","
add $I1, $I2, $I3
# predefined string
find_lex $P2, '__WLEX_2'
set $S2, $P2
set $S3, $I1
concat $S1, $S3, $S2
.return($S1)
# }

.end # WSubId_802


.sub '' :anon :subid('WSubId_803') :outer('WSubId_802')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_804'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_803


.sub '' :anon :subid('WSubId_804') :outer('WSubId_803')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_3.'_apply'("transFn")
store_lex '__WLEX_2', $P2
.return($P2)
# }

.end # WSubId_804


.sub 'jtCase' :subid('WSubId_805') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var e: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_806'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # jtCase


.sub '' :anon :subid('WSubId_806') :outer('WSubId_805')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_807'
newclosure $P3, $P4
__ARG_1.'_form'($P3)
root_new $P3, ['parrot';'ResizablePMCArray']
find_lex $P1, '__WLEX_1'
$P5 = 'toProgramString'($P1)
$P3.'push'($P5)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_806


.sub '' :anon :subid('WSubId_807') :outer('WSubId_806')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_808'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_807


.sub '' :anon :subid('WSubId_808') :outer('WSubId_807')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_3.'_apply'("trans")
store_lex '__WLEX_2', $P2
.return($P2)
# }

.end # WSubId_808


.sub 'local' :subid('WSubId_809') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var n: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_810'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # local


.sub '' :anon :subid('WSubId_810') :outer('WSubId_809')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("string")
store_lex '__WLEX_1', $P1
.const 'Sub' $P3 = 'WSubId_811'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_813'
newclosure $P4, $P5
.tailcall __ARG_1.'_or'($P2, $P4)
# }

.end # WSubId_810


.sub '' :anon :subid('WSubId_811') :outer('WSubId_810')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_812'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_811


.sub '' :anon :subid('WSubId_812') :outer('WSubId_811')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
$P3 = __ARG_3["seen"]
find_lex $P1, '__WLEX_1'
$P2 = $P3[$P1]
isnull $I1, $P2
not $I1
__ARG_3.'_pred'($I1)
.return("")
# }

.end # WSubId_812


.sub '' :anon :subid('WSubId_813') :outer('WSubId_810')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_814'
newclosure $P3, $P4
$P2 = $P3(__ARG_4)
.return($P2)
# }

.end # WSubId_813


.sub '' :anon :subid('WSubId_814') :outer('WSubId_813')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
# Body
# {
$P2 = __ARG_5["seen"]
find_lex $P1, '__WLEX_1'
$P2[$P1] = 1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "volatile var ", $S1
concat $S2, $S2, " ;"
.return($S2)
# }

.end # WSubId_814


.sub 'locals' :subid('WSubId_815') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var vs: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_816'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_820'
newclosure $P5, $P6
.tailcall self.'_or'($P3, $P5)
# }

.end # locals


.sub '' :anon :subid('WSubId_816') :outer('WSubId_815')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_817'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_816


.sub '' :anon :subid('WSubId_817') :outer('WSubId_816')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
root_new $P2, ['parrot';'Hash']
__ARG_2["seen"] = $P2
.const 'Sub' $P3 = 'WSubId_818'
newclosure $P2, $P3
__ARG_2.'_form'($P2)
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
.return($S1)
# }

.end # WSubId_817


.sub '' :anon :subid('WSubId_818') :outer('WSubId_817')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_819'
newclosure $P2, $P3
$P1 = __ARG_3.'_many1'($P2)
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_818


.sub '' :anon :subid('WSubId_819') :outer('WSubId_818')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_apply'("local")
# }

.end # WSubId_819


.sub '' :anon :subid('WSubId_820') :outer('WSubId_815')
.param pmc __ARG_5

# Body
# {
.const 'Sub' $P3 = 'WSubId_821'
newclosure $P2, $P3
$P1 = $P2(__ARG_5)
.return($P1)
# }

.end # WSubId_820


.sub '' :anon :subid('WSubId_821') :outer('WSubId_820')
.param pmc __ARG_6

# Body
# {
.const 'Sub' $P2 = 'WSubId_822'
newclosure $P1, $P2
__ARG_6.'_form'($P1)
.return("")
# }

.end # WSubId_821


.sub '' :anon :subid('WSubId_822') :outer('WSubId_821')
.param pmc __ARG_7

# Body
# {
.return()
# }

.end # WSubId_822


.sub 'trans' :subid('WSubId_823') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var t: $P2
null $P2
# var ans: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_824'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # trans


.sub '' :anon :subid('WSubId_824') :outer('WSubId_823')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_825'
newclosure $P3, $P4
__ARG_1.'_form'($P3)
find_lex $P2, '__WLEX_2'
.return($P2)
# }

.end # WSubId_824


.sub '' :anon :subid('WSubId_825') :outer('WSubId_824')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_826'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_825


.sub '' :anon :subid('WSubId_826') :outer('WSubId_825')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
$P2 = __ARG_3.'_applyWithArgs'("apply", $P1)
store_lex '__WLEX_2', $P2
.return($P2)
# }

.end # WSubId_826


.sub 'transFn' :subid('WSubId_827') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_828'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # transFn


.sub '' :anon :subid('WSubId_828') :outer('WSubId_827')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
# predefined string
find_lex $P1, '__WLEX_1'
set $S1, $P1
concat $S2, "(function(var self){return ", $S1
concat $S2, $S2, ";})"
.return($S2)
# }

.end # WSubId_828

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMetaTranslator' ]
get_class $P1, [ 'OMeta' ]
addparent $P0, $P1
.end
.namespace [ 'OMetaWinxedParser' ]

.sub 'topElem' :subid('WSubId_829') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var r: $P2
null $P2
.const 'Sub' $P4 = 'WSubId_830'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_832'
newclosure $P5, $P6
.tailcall self.'_or'($P3, $P5)
# }

.end # topElem


.sub '' :anon :subid('WSubId_830') :outer('WSubId_829')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_831'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_830


.sub '' :anon :subid('WSubId_831') :outer('WSubId_830')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_2.'_apply'("spaces")
$P1 = __ARG_2.'_applyWithArgs'("foreign", 'OMetaParser', 'grammar')
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_831


.sub '' :anon :subid('WSubId_832') :outer('WSubId_829')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_superApplyWithArgs'("WinxedParser", 'topElem')
# }

.end # WSubId_832

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


.sub 'trans' :subid('WSubId_833') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var t: $P2
null $P2
# var ans: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_834'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # trans


.sub '' :anon :subid('WSubId_834') :outer('WSubId_833')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_835'
newclosure $P3, $P4
__ARG_1.'_form'($P3)
find_lex $P2, '__WLEX_2'
.return($P2)
# }

.end # WSubId_834


.sub '' :anon :subid('WSubId_835') :outer('WSubId_834')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_836'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_835


.sub '' :anon :subid('WSubId_836') :outer('WSubId_835')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
set $S1, $P1
# predefined find_method
find_method $P3, __ARG_3, $S1
isnull $I1, $P3
not $I1
__ARG_3.'_pred'($I1)
find_lex $P1, '__WLEX_1'
$P2 = __ARG_3.'_applyWithArgs'("apply", $P1)
store_lex '__WLEX_2', $P2
.return($P2)
# }

.end # WSubId_836


.sub 'optimize' :subid('WSubId_837') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_838'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # optimize


.sub '' :anon :subid('WSubId_838') :outer('WSubId_837')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
__ARG_1.'_apply'("helped")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_838


.sub 'App' :subid('WSubId_839') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var rule: $P2
null $P2
# var args: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_840'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # App


.sub '' :anon :subid('WSubId_840') :outer('WSubId_839')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
.const 'Sub' $P4 = 'WSubId_841'
newclosure $P3, $P4
$P2 = __ARG_1.'_many'($P3)
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "App"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
.tailcall $P3.'append'($P2)
# }

.end # WSubId_840


.sub '' :anon :subid('WSubId_841') :outer('WSubId_840')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("anything")
# }

.end # WSubId_841


.sub 'Act' :subid('WSubId_842') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var expr: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_843'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Act


.sub '' :anon :subid('WSubId_843') :outer('WSubId_842')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Act"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_843


.sub 'Pred' :subid('WSubId_844') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var expr: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_845'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Pred


.sub '' :anon :subid('WSubId_845') :outer('WSubId_844')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Pred"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_845


.sub 'Or' :subid('WSubId_846') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_847'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Or


.sub '' :anon :subid('WSubId_847') :outer('WSubId_846')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_848'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Or"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_847


.sub '' :anon :subid('WSubId_848') :outer('WSubId_847')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_848


.sub 'XOr' :subid('WSubId_849') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_850'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # XOr


.sub '' :anon :subid('WSubId_850') :outer('WSubId_849')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_851'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "XOr"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_850


.sub '' :anon :subid('WSubId_851') :outer('WSubId_850')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_851


.sub 'And' :subid('WSubId_852') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var xs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_853'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # And


.sub '' :anon :subid('WSubId_853') :outer('WSubId_852')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_854'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "And"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_853


.sub '' :anon :subid('WSubId_854') :outer('WSubId_853')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("trans")
# }

.end # WSubId_854


.sub 'Opt' :subid('WSubId_855') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_856'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Opt


.sub '' :anon :subid('WSubId_856') :outer('WSubId_855')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Opt"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_856


.sub 'Many' :subid('WSubId_857') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_858'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Many


.sub '' :anon :subid('WSubId_858') :outer('WSubId_857')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Many"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_858


.sub 'Many1' :subid('WSubId_859') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_860'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Many1


.sub '' :anon :subid('WSubId_860') :outer('WSubId_859')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Many1"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_860


.sub 'Set' :subid('WSubId_861') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var n: $P2
null $P2
# var v: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_862'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # Set


.sub '' :anon :subid('WSubId_862') :outer('WSubId_861')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_2', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "Set"
$P3.'push'($P4)
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
find_lex $P2, '__WLEX_2'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_862


.sub 'Not' :subid('WSubId_863') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_864'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Not


.sub '' :anon :subid('WSubId_864') :outer('WSubId_863')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Not"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_864


.sub 'Lookahead' :subid('WSubId_865') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_866'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Lookahead


.sub '' :anon :subid('WSubId_866') :outer('WSubId_865')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Lookahead"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_866


.sub 'Form' :subid('WSubId_867') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_868'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Form


.sub '' :anon :subid('WSubId_868') :outer('WSubId_867')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Form"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_868


.sub 'ConsBy' :subid('WSubId_869') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_870'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # ConsBy


.sub '' :anon :subid('WSubId_870') :outer('WSubId_869')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "ConsBy"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_870


.sub 'IdxConsBy' :subid('WSubId_871') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var x: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_872'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # IdxConsBy


.sub '' :anon :subid('WSubId_872') :outer('WSubId_871')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "IdxConsBy"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
.return($P2)
# }

.end # WSubId_872


.sub 'JumpTable' :subid('WSubId_873') :method

.lex '__WLEX_1', $P4
.lex '__WLEX_2', $P2
.lex '__WLEX_3', $P3
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
.const 'Sub' $P7 = 'WSubId_874'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # JumpTable


.sub '' :anon :subid('WSubId_874') :outer('WSubId_873')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_875'
newclosure $P4, $P5
$P1 = __ARG_1.'_many'($P4)
store_lex '__WLEX_1', $P1
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "JumpTable"
$P4.'push'($P5)
find_lex $P1, '__WLEX_1'
.tailcall $P4.'append'($P1)
# }

.end # WSubId_874


.sub '' :anon :subid('WSubId_875') :outer('WSubId_874')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_876'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_875


.sub '' :anon :subid('WSubId_876') :outer('WSubId_875')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_877'
newclosure $P3, $P4
__ARG_3.'_form'($P3)
root_new $P3, ['parrot';'ResizablePMCArray']
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
find_lex $P2, '__WLEX_3'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_876


.sub '' :anon :subid('WSubId_877') :outer('WSubId_876')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_878'
newclosure $P4, $P5
$P3 = $P4(__ARG_4)
.return($P3)
# }

.end # WSubId_877


.sub '' :anon :subid('WSubId_878') :outer('WSubId_877')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_2', $P1
$P2 = __ARG_5.'_apply'("trans")
store_lex '__WLEX_3', $P2
.return($P2)
# }

.end # WSubId_878


.sub 'Interleave' :subid('WSubId_879') :method

.lex '__WLEX_1', $P4
.lex '__WLEX_2', $P2
.lex '__WLEX_3', $P3
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
.const 'Sub' $P7 = 'WSubId_880'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # Interleave


.sub '' :anon :subid('WSubId_880') :outer('WSubId_879')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_881'
newclosure $P4, $P5
$P1 = __ARG_1.'_many'($P4)
store_lex '__WLEX_1', $P1
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "Interleave"
$P4.'push'($P5)
find_lex $P1, '__WLEX_1'
.tailcall $P4.'append'($P1)
# }

.end # WSubId_880


.sub '' :anon :subid('WSubId_881') :outer('WSubId_880')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_882'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_881


.sub '' :anon :subid('WSubId_882') :outer('WSubId_881')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P4 = 'WSubId_883'
newclosure $P3, $P4
__ARG_3.'_form'($P3)
root_new $P3, ['parrot';'ResizablePMCArray']
find_lex $P1, '__WLEX_2'
$P3.'push'($P1)
find_lex $P2, '__WLEX_3'
$P3.'push'($P2)
.return($P3)
# }

.end # WSubId_882


.sub '' :anon :subid('WSubId_883') :outer('WSubId_882')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_884'
newclosure $P4, $P5
$P3 = $P4(__ARG_4)
.return($P3)
# }

.end # WSubId_883


.sub '' :anon :subid('WSubId_884') :outer('WSubId_883')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_2', $P1
$P2 = __ARG_5.'_apply'("trans")
store_lex '__WLEX_3', $P2
.return($P2)
# }

.end # WSubId_884


.sub 'Rule' :subid('WSubId_885') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_886'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # Rule


.sub '' :anon :subid('WSubId_886') :outer('WSubId_885')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_2', $P2
$P3 = __ARG_1.'_apply'("trans")
store_lex '__WLEX_3', $P3
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "Rule"
$P4.'push'($P5)
find_lex $P1, '__WLEX_1'
$P4.'push'($P1)
find_lex $P2, '__WLEX_2'
$P4.'push'($P2)
find_lex $P3, '__WLEX_3'
$P4.'push'($P3)
.return($P4)
# }

.end # WSubId_886

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'NullOptimization' ]
get_class $P1, [ 'OMeta' ]
addparent $P0, $P1
.end
.namespace [ 'AssociativeOptimization' ]

.sub 'And' :subid('WSubId_887') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var xs: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_888'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_890'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # And


.sub '' :anon :subid('WSubId_888') :outer('WSubId_887')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_889'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_888


.sub '' :anon :subid('WSubId_889') :outer('WSubId_888')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_1', $P1
__ARG_2.'_apply'("end")
__ARG_2.'_apply'("setHelped")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_889


.sub '' :anon :subid('WSubId_890') :outer('WSubId_887')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_891'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_890


.sub '' :anon :subid('WSubId_891') :outer('WSubId_890')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_4.'_applyWithArgs'("transInside", "And")
store_lex '__WLEX_2', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "And"
$P2.'push'($P3)
find_lex $P1, '__WLEX_2'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_891


.sub 'Or' :subid('WSubId_892') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var xs: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_893'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_895'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # Or


.sub '' :anon :subid('WSubId_893') :outer('WSubId_892')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_894'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_893


.sub '' :anon :subid('WSubId_894') :outer('WSubId_893')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_1', $P1
__ARG_2.'_apply'("end")
__ARG_2.'_apply'("setHelped")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_894


.sub '' :anon :subid('WSubId_895') :outer('WSubId_892')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_896'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_895


.sub '' :anon :subid('WSubId_896') :outer('WSubId_895')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_4.'_applyWithArgs'("transInside", "Or")
store_lex '__WLEX_2', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Or"
$P2.'push'($P3)
find_lex $P1, '__WLEX_2'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_896


.sub 'XOr' :subid('WSubId_897') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var xs: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_898'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_900'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # XOr


.sub '' :anon :subid('WSubId_898') :outer('WSubId_897')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_899'
newclosure $P3, $P4
$P2 = $P3(__ARG_1)
.return($P2)
# }

.end # WSubId_898


.sub '' :anon :subid('WSubId_899') :outer('WSubId_898')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_2.'_apply'("trans")
store_lex '__WLEX_1', $P1
__ARG_2.'_apply'("end")
__ARG_2.'_apply'("setHelped")
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_899


.sub '' :anon :subid('WSubId_900') :outer('WSubId_897')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_901'
newclosure $P3, $P4
$P2 = $P3(__ARG_3)
.return($P2)
# }

.end # WSubId_900


.sub '' :anon :subid('WSubId_901') :outer('WSubId_900')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_4.'_applyWithArgs'("transInside", "XOr")
store_lex '__WLEX_2', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "XOr"
$P2.'push'($P3)
find_lex $P1, '__WLEX_2'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_901


.sub 'transInside' :subid('WSubId_902') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
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
.const 'Sub' $P8 = 'WSubId_903'
newclosure $P7, $P8
$P6 = $P7(self)
.return($P6)
# }

.end # transInside


.sub '' :anon :subid('WSubId_903') :outer('WSubId_902')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
$P4 = find_lex '__WLEX_4'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
.const 'Sub' $P6 = 'WSubId_904'
newclosure $P5, $P6
.const 'Sub' $P8 = 'WSubId_908'
newclosure $P7, $P8
.const 'Sub' $P10 = 'WSubId_910'
newclosure $P9, $P10
.tailcall __ARG_1.'_or'($P5, $P7, $P9)
# }

.end # WSubId_903


.sub '' :anon :subid('WSubId_904') :outer('WSubId_903')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P6 = 'WSubId_905'
newclosure $P5, $P6
$P4 = $P5(__ARG_2)
.return($P4)
# }

.end # WSubId_904


.sub '' :anon :subid('WSubId_905') :outer('WSubId_904')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_906'
newclosure $P4, $P5
__ARG_3.'_form'($P4)
find_lex $P1, '__WLEX_1'
$P3 = __ARG_3.'_applyWithArgs'("transInside", $P1)
store_lex '__WLEX_3', $P3
__ARG_3.'_apply'("setHelped")
find_lex $P2, '__WLEX_2'
find_lex $P3, '__WLEX_3'
.tailcall $P2.'append'($P3)
# }

.end # WSubId_905


.sub '' :anon :subid('WSubId_906') :outer('WSubId_905')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_907'
newclosure $P4, $P5
$P3 = $P4(__ARG_4)
.return($P3)
# }

.end # WSubId_906


.sub '' :anon :subid('WSubId_907') :outer('WSubId_906')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
find_lex $P1, '__WLEX_1'
__ARG_5.'_applyWithArgs'("exactly", $P1)
find_lex $P1, '__WLEX_1'
$P2 = __ARG_5.'_applyWithArgs'("transInside", $P1)
store_lex '__WLEX_2', $P2
.return($P2)
# }

.end # WSubId_907


.sub '' :anon :subid('WSubId_908') :outer('WSubId_903')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P6 = 'WSubId_909'
newclosure $P5, $P6
$P4 = $P5(__ARG_6)
.return($P4)
# }

.end # WSubId_908


.sub '' :anon :subid('WSubId_909') :outer('WSubId_908')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_4'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_7.'_apply'("trans")
store_lex '__WLEX_4', $P1
find_lex $P3, '__WLEX_1'
$P2 = __ARG_7.'_applyWithArgs'("transInside", $P3)
store_lex '__WLEX_2', $P2
root_new $P4, ['parrot';'ResizablePMCArray']
find_lex $P1, '__WLEX_4'
$P4.'push'($P1)
find_lex $P2, '__WLEX_2'
.tailcall $P4.'append'($P2)
# }

.end # WSubId_909


.sub '' :anon :subid('WSubId_910') :outer('WSubId_903')
.param pmc __ARG_8

# Body
# {
root_new $P1, ['parrot';'ResizablePMCArray']
.return($P1)
# }

.end # WSubId_910

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'AssociativeOptimization' ]
get_class $P1, [ 'NullOptimization' ]
addparent $P0, $P1
.end
.namespace [ 'SeqInliner' ]

.sub 'App' :subid('WSubId_911') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
.lex '__WLEX_4', $P5
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
.const 'Sub' $P7 = 'WSubId_912'
newclosure $P6, $P7
.const 'Sub' $P9 = 'WSubId_915'
newclosure $P8, $P9
.tailcall self.'_or'($P6, $P8)
# }

.end # App


.sub '' :anon :subid('WSubId_912') :outer('WSubId_911')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_913'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_912


.sub '' :anon :subid('WSubId_913') :outer('WSubId_912')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P3 = __ARG_2.'_apply'('anything')
set $S1, $P3
set $S2, "seq"
if $S1 == $S2 goto __label_2
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P6 = 'WSubId_914'
newclosure $P5, $P6
$P4 = $P5(__ARG_2)
.return($P4)
__label_1: # default
getattribute $P7, __ARG_2, 'fail'
throw $P7
__label_0: # switch end
# }

.end # WSubId_913


.sub '' :anon :subid('WSubId_914') :outer('WSubId_913')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P1
__ARG_3.'_apply'("end")
find_lex $P1, '__WLEX_1'
$P2 = __ARG_3.'_applyWithArgs'("seqString", $P1)
store_lex '__WLEX_2', $P2
__ARG_3.'_apply'("setHelped")
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "And"
$P4.'push'($P5)
find_lex $P2, '__WLEX_2'
$P3 = $P4.'append'($P2)
root_new $P6, ['parrot';'ResizablePMCArray']
root_new $P8, ['parrot';'ResizablePMCArray']
box $P9, "Act"
$P8.'push'($P9)
find_lex $P1, '__WLEX_1'
$P8.'push'($P1)
$P6.'push'($P8)
.tailcall $P3.'append'($P6)
# }

.end # WSubId_914


.sub '' :anon :subid('WSubId_915') :outer('WSubId_911')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_4'
# Body
# {
.const 'Sub' $P5 = 'WSubId_916'
newclosure $P4, $P5
$P3 = $P4(__ARG_4)
.return($P3)
# }

.end # WSubId_915


.sub '' :anon :subid('WSubId_916') :outer('WSubId_915')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_3'
$P2 = find_lex '__WLEX_4'
# Body
# {
$P1 = __ARG_5.'_apply'("anything")
store_lex '__WLEX_3', $P1
.const 'Sub' $P4 = 'WSubId_917'
newclosure $P3, $P4
$P2 = __ARG_5.'_many'($P3)
store_lex '__WLEX_4', $P2
root_new $P3, ['parrot';'ResizablePMCArray']
box $P4, "App"
$P3.'push'($P4)
find_lex $P1, '__WLEX_3'
$P3.'push'($P1)
find_lex $P2, '__WLEX_4'
.tailcall $P3.'append'($P2)
# }

.end # WSubId_916


.sub '' :anon :subid('WSubId_917') :outer('WSubId_916')
.param pmc __ARG_6

# Body
# {
.tailcall __ARG_6.'_apply'("anything")
# }

.end # WSubId_917


.sub 'inlineChar' :subid('WSubId_918') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var c: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_919'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # inlineChar


.sub '' :anon :subid('WSubId_919') :outer('WSubId_918')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_applyWithArgs'("foreign", 'OMetaParser', 'eChar')
store_lex '__WLEX_1', $P1
.const 'Sub' $P3 = 'WSubId_920'
newclosure $P2, $P3
__ARG_1.'_not'($P2)
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "App"
$P2.'push'($P3)
box $P3, "exactly"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
$P4 = 'toProgramString'($P1)
$P2.'push'($P4)
.return($P2)
# }

.end # WSubId_919


.sub '' :anon :subid('WSubId_920') :outer('WSubId_919')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("end")
# }

.end # WSubId_920


.sub 'seqString' :subid('WSubId_921') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var s: $P2
null $P2
# var cs: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_922'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # seqString


.sub '' :anon :subid('WSubId_922') :outer('WSubId_921')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_923'
newclosure $P3, $P4
__ARG_1.'_lookahead'($P3)
.const 'Sub' $P4 = 'WSubId_925'
newclosure $P3, $P4
.const 'Sub' $P6 = 'WSubId_930'
newclosure $P5, $P6
.tailcall __ARG_1.'_or'($P3, $P5)
# }

.end # WSubId_922


.sub '' :anon :subid('WSubId_923') :outer('WSubId_922')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_924'
newclosure $P3, $P4
$P2 = $P3(__ARG_2)
.return($P2)
# }

.end # WSubId_923


.sub '' :anon :subid('WSubId_924') :outer('WSubId_923')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P1
find_lex $P1, '__WLEX_1'
isa $I1, $P1, "String"
.tailcall __ARG_3.'_pred'($I1)
# }

.end # WSubId_924


.sub '' :anon :subid('WSubId_925') :outer('WSubId_922')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_926'
newclosure $P3, $P4
$P2 = $P3(__ARG_4)
.return($P2)
# }

.end # WSubId_925


.sub '' :anon :subid('WSubId_926') :outer('WSubId_925')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P3 = 'WSubId_927'
newclosure $P2, $P3
__ARG_5.'_form'($P2)
find_lex $P1, '__WLEX_2'
.return($P1)
# }

.end # WSubId_926


.sub '' :anon :subid('WSubId_927') :outer('WSubId_926')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_928'
newclosure $P3, $P4
$P2 = $P3(__ARG_6)
.return($P2)
# }

.end # WSubId_927


.sub '' :anon :subid('WSubId_928') :outer('WSubId_927')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_2'
# Body
# {
__ARG_7.'_applyWithArgs'("exactly", "\"")
.const 'Sub' $P3 = 'WSubId_929'
newclosure $P2, $P3
$P1 = __ARG_7.'_many'($P2)
store_lex '__WLEX_2', $P1
.tailcall __ARG_7.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_928


.sub '' :anon :subid('WSubId_929') :outer('WSubId_928')
.param pmc __ARG_8

# Body
# {
.tailcall __ARG_8.'_apply'("inlineChar")
# }

.end # WSubId_929


.sub '' :anon :subid('WSubId_930') :outer('WSubId_922')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_931'
newclosure $P3, $P4
$P2 = $P3(__ARG_9)
.return($P2)
# }

.end # WSubId_930


.sub '' :anon :subid('WSubId_931') :outer('WSubId_930')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P3 = 'WSubId_932'
newclosure $P2, $P3
__ARG_10.'_form'($P2)
find_lex $P1, '__WLEX_2'
.return($P1)
# }

.end # WSubId_931


.sub '' :anon :subid('WSubId_932') :outer('WSubId_931')
.param pmc __ARG_11

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_933'
newclosure $P3, $P4
$P2 = $P3(__ARG_11)
.return($P2)
# }

.end # WSubId_932


.sub '' :anon :subid('WSubId_933') :outer('WSubId_932')
.param pmc __ARG_12

$P1 = find_lex '__WLEX_2'
# Body
# {
__ARG_12.'_applyWithArgs'("exactly", "\'")
.const 'Sub' $P3 = 'WSubId_934'
newclosure $P2, $P3
$P1 = __ARG_12.'_many'($P2)
store_lex '__WLEX_2', $P1
.tailcall __ARG_12.'_applyWithArgs'("exactly", "\'")
# }

.end # WSubId_933


.sub '' :anon :subid('WSubId_934') :outer('WSubId_933')
.param pmc __ARG_13

# Body
# {
.tailcall __ARG_13.'_apply'("inlineChar")
# }

.end # WSubId_934

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'SeqInliner' ]
get_class $P1, [ 'NullOptimization' ]
addparent $P0, $P1
.end
.namespace [ 'JumpTableOptimization' ]

.sub 'Or' :subid('WSubId_935') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var cs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_936'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # Or


.sub '' :anon :subid('WSubId_936') :outer('WSubId_935')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_937'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "Or"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_936


.sub '' :anon :subid('WSubId_937') :outer('WSubId_936')
.param pmc __ARG_2

# Body
# {
.const 'Sub' $P2 = 'WSubId_938'
newclosure $P1, $P2
.const 'Sub' $P4 = 'WSubId_939'
newclosure $P3, $P4
.tailcall __ARG_2.'_or'($P1, $P3)
# }

.end # WSubId_937


.sub '' :anon :subid('WSubId_938') :outer('WSubId_937')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_applyWithArgs'("jtChoices", "Or")
# }

.end # WSubId_938


.sub '' :anon :subid('WSubId_939') :outer('WSubId_937')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_apply'("trans")
# }

.end # WSubId_939


.sub 'XOr' :subid('WSubId_940') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var cs: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_941'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # XOr


.sub '' :anon :subid('WSubId_941') :outer('WSubId_940')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_942'
newclosure $P2, $P3
$P1 = __ARG_1.'_many'($P2)
store_lex '__WLEX_1', $P1
root_new $P2, ['parrot';'ResizablePMCArray']
box $P3, "XOr"
$P2.'push'($P3)
find_lex $P1, '__WLEX_1'
.tailcall $P2.'append'($P1)
# }

.end # WSubId_941


.sub '' :anon :subid('WSubId_942') :outer('WSubId_941')
.param pmc __ARG_2

# Body
# {
.const 'Sub' $P2 = 'WSubId_943'
newclosure $P1, $P2
.const 'Sub' $P4 = 'WSubId_944'
newclosure $P3, $P4
.tailcall __ARG_2.'_or'($P1, $P3)
# }

.end # WSubId_942


.sub '' :anon :subid('WSubId_943') :outer('WSubId_942')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_applyWithArgs'("jtChoices", "XOr")
# }

.end # WSubId_943


.sub '' :anon :subid('WSubId_944') :outer('WSubId_942')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_apply'("trans")
# }

.end # WSubId_944


.sub 'quotedString' :subid('WSubId_945') :method

.lex '__WLEX_1', $P3
.lex '__WLEX_2', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var c: $P2
null $P2
# var cs: $P3
null $P3
.const 'Sub' $P6 = 'WSubId_946'
newclosure $P5, $P6
$P4 = $P5(self)
.return($P4)
# }

.end # quotedString


.sub '' :anon :subid('WSubId_946') :outer('WSubId_945')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_947'
newclosure $P3, $P4
__ARG_1.'_lookahead'($P3)
.const 'Sub' $P4 = 'WSubId_948'
newclosure $P3, $P4
__ARG_1.'_form'($P3)
find_lex $P1, '__WLEX_1'
# predefined join
join $S1, "", $P1
.return($S1)
# }

.end # WSubId_946


.sub '' :anon :subid('WSubId_947') :outer('WSubId_946')
.param pmc __ARG_2

# Body
# {
.tailcall __ARG_2.'_apply'("string")
# }

.end # WSubId_947


.sub '' :anon :subid('WSubId_948') :outer('WSubId_946')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_949'
newclosure $P4, $P5
$P3 = $P4(__ARG_3)
.return($P3)
# }

.end # WSubId_948


.sub '' :anon :subid('WSubId_949') :outer('WSubId_948')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
$P3 = __ARG_4.'_apply'('anything')
set $S1, $P3
set $S2, "\""
if $S1 == $S2 goto __label_2
set $S2, "\'"
if $S1 == $S2 goto __label_3
goto __label_1
# switch
__label_2: # case
.const 'Sub' $P6 = 'WSubId_950'
newclosure $P5, $P6
$P4 = $P5(__ARG_4)
.return($P4)
__label_3: # case
.const 'Sub' $P9 = 'WSubId_954'
newclosure $P8, $P9
$P7 = $P8(__ARG_4)
.return($P7)
__label_1: # default
getattribute $P10, __ARG_4, 'fail'
throw $P10
__label_0: # switch end
# }

.end # WSubId_949


.sub '' :anon :subid('WSubId_950') :outer('WSubId_949')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_951'
newclosure $P3, $P4
$P1 = __ARG_5.'_many'($P3)
store_lex '__WLEX_1', $P1
.tailcall __ARG_5.'_applyWithArgs'("exactly", "\"")
# }

.end # WSubId_950


.sub '' :anon :subid('WSubId_951') :outer('WSubId_950')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_952'
newclosure $P3, $P4
$P2 = $P3(__ARG_6)
.return($P2)
# }

.end # WSubId_951


.sub '' :anon :subid('WSubId_952') :outer('WSubId_951')
.param pmc __ARG_7

$P1 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_7.'_applyWithArgs'("foreign", 'OMetaParser', 'eChar')
store_lex '__WLEX_2', $P1
.const 'Sub' $P3 = 'WSubId_953'
newclosure $P2, $P3
__ARG_7.'_not'($P2)
find_lex $P1, '__WLEX_2'
.return($P1)
# }

.end # WSubId_952


.sub '' :anon :subid('WSubId_953') :outer('WSubId_952')
.param pmc __ARG_8

# Body
# {
.tailcall __ARG_8.'_apply'("end")
# }

.end # WSubId_953


.sub '' :anon :subid('WSubId_954') :outer('WSubId_949')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_955'
newclosure $P3, $P4
$P1 = __ARG_9.'_many'($P3)
store_lex '__WLEX_1', $P1
.tailcall __ARG_9.'_applyWithArgs'("exactly", "\'")
# }

.end # WSubId_954


.sub '' :anon :subid('WSubId_955') :outer('WSubId_954')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_956'
newclosure $P3, $P4
$P2 = $P3(__ARG_10)
.return($P2)
# }

.end # WSubId_955


.sub '' :anon :subid('WSubId_956') :outer('WSubId_955')
.param pmc __ARG_11

$P1 = find_lex '__WLEX_2'
# Body
# {
$P1 = __ARG_11.'_applyWithArgs'("foreign", 'OMetaParser', 'eChar')
store_lex '__WLEX_2', $P1
.const 'Sub' $P3 = 'WSubId_957'
newclosure $P2, $P3
__ARG_11.'_not'($P2)
find_lex $P1, '__WLEX_2'
.return($P1)
# }

.end # WSubId_956


.sub '' :anon :subid('WSubId_957') :outer('WSubId_956')
.param pmc __ARG_12

# Body
# {
.tailcall __ARG_12.'_apply'("end")
# }

.end # WSubId_957


.sub 'jtChoice' :subid('WSubId_958') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
# Body
# {
# var fromIdx: $P1
getattribute $P4, self, 'input'
getattribute $P1, $P4, 'idx'
# var x: $P2
null $P2
# var rest: $P3
null $P3
.const 'Sub' $P5 = 'WSubId_959'
newclosure $P4, $P5
.const 'Sub' $P7 = 'WSubId_966'
newclosure $P6, $P7
.tailcall self.'_or'($P4, $P6)
# }

.end # jtChoice


.sub '' :anon :subid('WSubId_959') :outer('WSubId_958')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_960'
newclosure $P4, $P5
$P3 = $P4(__ARG_1)
.return($P3)
# }

.end # WSubId_959


.sub '' :anon :subid('WSubId_960') :outer('WSubId_959')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P4 = 'WSubId_961'
newclosure $P3, $P4
__ARG_2.'_form'($P3)
root_new $P3, ['parrot';'ResizablePMCArray']
find_lex $P1, '__WLEX_1'
$P3.'push'($P1)
root_new $P6, ['parrot';'ResizablePMCArray']
box $P7, "And"
$P6.'push'($P7)
find_lex $P2, '__WLEX_2'
$P5 = $P6.'append'($P2)
$P3.'push'($P5)
.return($P3)
# }

.end # WSubId_960


.sub '' :anon :subid('WSubId_961') :outer('WSubId_960')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
.const 'Sub' $P5 = 'WSubId_962'
newclosure $P4, $P5
$P3 = $P4(__ARG_3)
.return($P3)
# }

.end # WSubId_961


.sub '' :anon :subid('WSubId_962') :outer('WSubId_961')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
# Body
# {
__ARG_4.'_applyWithArgs'("exactly", "And")
.const 'Sub' $P4 = 'WSubId_963'
newclosure $P3, $P4
__ARG_4.'_form'($P3)
.const 'Sub' $P4 = 'WSubId_965'
newclosure $P3, $P4
$P2 = __ARG_4.'_many'($P3)
store_lex '__WLEX_2', $P2
.return($P2)
# }

.end # WSubId_962


.sub '' :anon :subid('WSubId_963') :outer('WSubId_962')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_964'
newclosure $P3, $P4
$P2 = $P3(__ARG_5)
.return($P2)
# }

.end # WSubId_963


.sub '' :anon :subid('WSubId_964') :outer('WSubId_963')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_6.'_applyWithArgs'("exactly", "App")
__ARG_6.'_applyWithArgs'("exactly", "exactly")
$P1 = __ARG_6.'_apply'("quotedString")
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_964


.sub '' :anon :subid('WSubId_965') :outer('WSubId_962')
.param pmc __ARG_7

# Body
# {
.tailcall __ARG_7.'_apply'("anything")
# }

.end # WSubId_965


.sub '' :anon :subid('WSubId_966') :outer('WSubId_958')
.param pmc __ARG_8

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_967'
newclosure $P3, $P4
$P2 = $P3(__ARG_8)
.return($P2)
# }

.end # WSubId_966


.sub '' :anon :subid('WSubId_967') :outer('WSubId_966')
.param pmc __ARG_9

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_968'
newclosure $P2, $P3
__ARG_9.'_form'($P2)
root_new $P2, ['parrot';'ResizablePMCArray']
find_lex $P1, '__WLEX_1'
$P2.'push'($P1)
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "Act"
$P4.'push'($P5)
find_lex $P1, '__WLEX_1'
$P6 = 'toProgramString'($P1)
$P4.'push'($P6)
$P2.'push'($P4)
.return($P2)
# }

.end # WSubId_967


.sub '' :anon :subid('WSubId_968') :outer('WSubId_967')
.param pmc __ARG_10

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P4 = 'WSubId_969'
newclosure $P3, $P4
$P2 = $P3(__ARG_10)
.return($P2)
# }

.end # WSubId_968


.sub '' :anon :subid('WSubId_969') :outer('WSubId_968')
.param pmc __ARG_11

$P1 = find_lex '__WLEX_1'
# Body
# {
__ARG_11.'_applyWithArgs'("exactly", "App")
__ARG_11.'_applyWithArgs'("exactly", "exactly")
$P1 = __ARG_11.'_apply'("quotedString")
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_969


.sub 'jtChoices' :subid('WSubId_970') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_971'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # jtChoices


.sub '' :anon :subid('WSubId_971') :outer('WSubId_970')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_1.'_apply'("jtChoice")
store_lex '__WLEX_2', $P2
root_new $P4, ['parrot';'Hash']
$P4["choiceOp"] = $P1
$P4["choice"] = $P2
new $P3, [ "JumpTable" ], $P4
store_lex '__WLEX_3', $P3
.const 'Sub' $P5 = 'WSubId_972'
newclosure $P4, $P5
__ARG_1.'_many'($P4)
__ARG_1.'_apply'("setHelped")
find_lex $P3, '__WLEX_3'
.tailcall $P3.'toTree'()
# }

.end # WSubId_971


.sub '' :anon :subid('WSubId_972') :outer('WSubId_971')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_973'
newclosure $P4, $P5
$P3 = $P4(__ARG_2)
.return($P3)
# }

.end # WSubId_972


.sub '' :anon :subid('WSubId_973') :outer('WSubId_972')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_2'
$P2 = find_lex '__WLEX_3'
# Body
# {
$P1 = __ARG_3.'_apply'("jtChoice")
store_lex '__WLEX_2', $P1
find_lex $P2, '__WLEX_3'
find_lex $P1, '__WLEX_2'
.tailcall $P2.'add'($P1)
# }

.end # WSubId_973

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'JumpTableOptimization' ]
get_class $P1, [ 'NullOptimization' ]
addparent $P0, $P1
.end
.namespace [ 'OMetaOptimizer' ]

.sub 'optimizeGrammar' :subid('WSubId_974') :method

.lex '__WLEX_1', $P2
.lex '__WLEX_2', $P3
.lex '__WLEX_3', $P4
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
.const 'Sub' $P7 = 'WSubId_975'
newclosure $P6, $P7
$P5 = $P6(self)
.return($P5)
# }

.end # optimizeGrammar


.sub '' :anon :subid('WSubId_975') :outer('WSubId_974')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P5 = 'WSubId_976'
newclosure $P4, $P5
__ARG_1.'_form'($P4)
root_new $P4, ['parrot';'ResizablePMCArray']
box $P5, "Grammar"
$P4.'push'($P5)
find_lex $P1, '__WLEX_1'
$P4.'push'($P1)
find_lex $P2, '__WLEX_2'
$P4.'push'($P2)
find_lex $P3, '__WLEX_3'
.tailcall $P4.'append'($P3)
# }

.end # WSubId_975


.sub '' :anon :subid('WSubId_976') :outer('WSubId_975')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
.const 'Sub' $P6 = 'WSubId_977'
newclosure $P5, $P6
$P4 = $P5(__ARG_2)
.return($P4)
# }

.end # WSubId_976


.sub '' :anon :subid('WSubId_977') :outer('WSubId_976')
.param pmc __ARG_3

$P1 = find_lex '__WLEX_1'
$P2 = find_lex '__WLEX_2'
$P3 = find_lex '__WLEX_3'
# Body
# {
__ARG_3.'_applyWithArgs'("exactly", "Grammar")
$P1 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_1', $P1
$P2 = __ARG_3.'_apply'("anything")
store_lex '__WLEX_2', $P2
.const 'Sub' $P5 = 'WSubId_978'
newclosure $P4, $P5
$P3 = __ARG_3.'_many'($P4)
store_lex '__WLEX_3', $P3
.return($P3)
# }

.end # WSubId_977


.sub '' :anon :subid('WSubId_978') :outer('WSubId_977')
.param pmc __ARG_4

# Body
# {
.tailcall __ARG_4.'_apply'("optimizeRule")
# }

.end # WSubId_978


.sub 'optimizeRule' :subid('WSubId_979') :method

.lex '__WLEX_1', $P2
# Body
# {
# var fromIdx: $P1
getattribute $P3, self, 'input'
getattribute $P1, $P3, 'idx'
# var r: $P2
null $P2
.const 'Sub' $P5 = 'WSubId_980'
newclosure $P4, $P5
$P3 = $P4(self)
.return($P3)
# }

.end # optimizeRule


.sub '' :anon :subid('WSubId_980') :outer('WSubId_979')
.param pmc __ARG_1

$P1 = find_lex '__WLEX_1'
# Body
# {
$P1 = __ARG_1.'_apply'("anything")
store_lex '__WLEX_1', $P1
.const 'Sub' $P3 = 'WSubId_981'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_982'
newclosure $P4, $P5
__ARG_1.'_or'($P2, $P4)
.const 'Sub' $P3 = 'WSubId_983'
newclosure $P2, $P3
__ARG_1.'_many'($P2)
find_lex $P1, '__WLEX_1'
.return($P1)
# }

.end # WSubId_980


.sub '' :anon :subid('WSubId_981') :outer('WSubId_980')
.param pmc __ARG_2

$P1 = find_lex '__WLEX_1'
# Body
# {
find_lex $P1, '__WLEX_1'
$P1 = __ARG_2.'_applyWithArgs'("foreign", 'SeqInliner', 'optimize', $P1)
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_981


.sub '' :anon :subid('WSubId_982') :outer('WSubId_980')
.param pmc __ARG_3

# Body
# {
.tailcall __ARG_3.'_apply'("empty")
# }

.end # WSubId_982


.sub '' :anon :subid('WSubId_983') :outer('WSubId_980')
.param pmc __ARG_4

$P1 = find_lex '__WLEX_1'
# Body
# {
.const 'Sub' $P3 = 'WSubId_984'
newclosure $P2, $P3
.const 'Sub' $P5 = 'WSubId_985'
newclosure $P4, $P5
.tailcall __ARG_4.'_or'($P2, $P4)
# }

.end # WSubId_983


.sub '' :anon :subid('WSubId_984') :outer('WSubId_983')
.param pmc __ARG_5

$P1 = find_lex '__WLEX_1'
# Body
# {
find_lex $P1, '__WLEX_1'
$P1 = __ARG_5.'_applyWithArgs'("foreign", 'AssociativeOptimization', 'optimize', $P1)
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_984


.sub '' :anon :subid('WSubId_985') :outer('WSubId_983')
.param pmc __ARG_6

$P1 = find_lex '__WLEX_1'
# Body
# {
find_lex $P1, '__WLEX_1'
$P1 = __ARG_6.'_applyWithArgs'("foreign", 'JumpTableOptimization', 'optimize', $P1)
store_lex '__WLEX_1', $P1
.return($P1)
# }

.end # WSubId_985

.sub Winxed_class_init :anon :load :init
newclass $P0, [ 'OMetaOptimizer' ]
get_class $P1, [ 'OMeta' ]
addparent $P0, $P1
.end
.namespace [ ]

.sub 'keywords_hash' :anon :immediate

.annotate 'line', 83
# Body
# {
.annotate 'line', 84
# var keywords: $P1
root_new $P1, ['parrot';'ResizablePMCArray']
box $P3, "break"
$P1.'push'($P3)
box $P3, "case"
$P1.'push'($P3)
box $P3, "catch"
$P1.'push'($P3)
box $P3, "continue"
$P1.'push'($P3)
box $P3, "default"
$P1.'push'($P3)
box $P3, "do"
$P1.'push'($P3)
box $P3, "else"
$P1.'push'($P3)
box $P3, "for"
$P1.'push'($P3)
box $P3, "function"
$P1.'push'($P3)
box $P3, "if"
$P1.'push'($P3)
box $P3, "in"
$P1.'push'($P3)
box $P3, "instanceof"
$P1.'push'($P3)
box $P3, "new"
$P1.'push'($P3)
box $P3, "return"
$P1.'push'($P3)
box $P3, "switch"
$P1.'push'($P3)
box $P3, "self"
$P1.'push'($P3)
box $P3, "throw"
$P1.'push'($P3)
box $P3, "try"
$P1.'push'($P3)
box $P3, "var"
$P1.'push'($P3)
box $P3, "while"
$P1.'push'($P3)
box $P3, "ometa"
$P1.'push'($P3)
box $P3, "class"
$P1.'push'($P3)
box $P3, "using"
$P1.'push'($P3)
box $P3, "extern"
$P1.'push'($P3)
box $P3, "static"
$P1.'push'($P3)
box $P3, "string"
$P1.'push'($P3)
box $P3, "int"
$P1.'push'($P3)
box $P3, "num"
$P1.'push'($P3)
.annotate 'line', 88
# var hsh: $P2
root_new $P2, ['parrot';'Hash']
.annotate 'line', 89
iter $P4, $P1
set $P4, 0
__label_0: # for iteration
unless $P4 goto __label_1
shift $S1, $P4
.annotate 'line', 90
$P2[$S1] = $S1
goto __label_0
__label_1: # endfor
.annotate 'line', 92
.return($P2)
# }
.annotate 'line', 93

.end # keywords_hash


.sub '_isKeyword' :method
.param string __ARG_1

.annotate 'line', 96
# Body
# {
.annotate 'line', 97
.const 'Sub' $P1 = 'keywords_hash'
.annotate 'line', 98
$P2 = $P1[__ARG_1]
if_null $P2, __label_1
unless $P2 goto __label_1
set $I1, 1
goto __label_0
__label_1:
null $I1
__label_0:
.return($I1)
# }
.annotate 'line', 99

.end # _isKeyword


.sub 'load' :anon :load

.annotate 'line', 101
# Body
# {
.annotate 'line', 102
.const 'Sub' $P1 = '_isKeyword'
# predefined get_class
.annotate 'line', 103
get_class $P2, 'WinxedParser'
$P2.'add_method'('_isKeyword', $P1)
# }
.annotate 'line', 104

.end # load


.sub 'jumpTableCode' :method
.param pmc __ARG_1

.annotate 'line', 109
# Body
# {
.annotate 'line', 110
# var buf: $P1
new $P1, ['StringBuilder']
.annotate 'line', 111
# pirop push
push $P1, "(function(var self){switch(self._apply('anything')){"
.annotate 'line', 112
iter $P3, __ARG_1
set $P3, 0
__label_0: # for iteration
unless $P3 goto __label_1
shift $P2, $P3
# {
.annotate 'line', 113
# string s: $S1
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
goto __label_0
__label_1: # endfor
.annotate 'line', 116
# pirop push
push $P1, "default: throw self.fail;}})(self)"
# predefined string
set $S2, $P1
.annotate 'line', 117
.return($S2)
# }
.annotate 'line', 118

.end # jumpTableCode


.sub 'load' :anon :load

.annotate 'line', 120
# Body
# {
.annotate 'line', 121
.const 'Sub' $P1 = 'jumpTableCode'
# predefined get_class
.annotate 'line', 122
get_class $P2, 'OMetaTranslator'
$P2.'add_method'('jumpTableCode', $P1)
# }
.annotate 'line', 123

.end # load


.sub 'nullopt_init_pmc' :method
.param pmc __ARG_1

.annotate 'line', 128
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


.sub 'load' :anon :load

.annotate 'line', 134
# Body
# {
.annotate 'line', 135
.const 'Sub' $P1 = 'nullopt_init_pmc'
# predefined get_class
.annotate 'line', 136
get_class $P2, 'NullOptimization'
$P2.'add_vtable_override'('init_pmc', $P1)
# }
.annotate 'line', 137

.end # load

# End generated code
