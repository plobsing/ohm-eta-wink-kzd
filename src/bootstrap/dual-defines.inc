#ifdef JS
  #define UNDEF undefined
  #define SELF  this
  #define STRLEN(x) x.length
  #define ISSTR(x)  (typeof x === 'string')
#else /* WINXED */
  #define UNDEF null
  #define SELF  self
  #define STRLEN(x) length(x)
  #define ISSTR(x)  (x instanceof 'String')
#endif
