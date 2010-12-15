#ifdef JS
  #define UNDEF undefined
  #define SELF  this
  #define STRLEN(x) x.length
#else /* WINXED */
  #define UNDEF null
  #define SELF  self
  #define STRLEN(x) length(x)
#endif
