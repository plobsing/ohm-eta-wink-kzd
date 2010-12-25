#ifdef JS
  #define UNDEF undefined
  #define SELF  this
  #define STRLEN(x) x.length
  #define ISSTR(x)  (typeof x === 'string')
  #define JUMPTABLE(op, choice) (new JumpTable(op, choice))
  #define JOIN(x, sep) (x.join(sep))
  #define PARSEFLOAT parseFloat
#else /* WINXED */
  #define UNDEF null
  #define SELF  self
  #define STRLEN(x) length(x)
  #define ISSTR(x)  (x instanceof 'String')
  #define JUMPTABLE(op, choice) (new JumpTable({ 'choiceOp': op, 'choice': choice }))
  #define JOIN(x, sep) join(sep, x)
  #define PARSEFLOAT float
#endif
