#ifdef JS
  #define UNDEF undefined
  #define SELF  this
  #define STRLEN(x) x.length
  #define ISSTR(x)  (typeof x === 'string')
  #define JUMPTABLE(op, choice) (new JumpTable(op, choice))
#else /* WINXED */
  #define UNDEF null
  #define SELF  self
  #define STRLEN(x) length(x)
  #define ISSTR(x)  (x instanceof 'String')
  #define JUMPTABLE(op, choice) (new JumpTable({ 'choiceOp': op, 'choice': choice }))
#endif
