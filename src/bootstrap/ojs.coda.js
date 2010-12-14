/* winxed-compiler */
WinxedParser.hexDigits = "0123456789abcdef"
WinxedParser.keywords  = { }
keywords = ["break", "case", "catch", "continue", "default", "delete", "do", "else", "finally", "for", "function", "if", "in",
            "instanceof", "new", "return", "switch", "this", "throw", "try", "typeof", "var", "void", "while", "with", "ometa"]
for (var idx = 0; idx < keywords.length; idx++)
  WinxedParser.keywords[keywords[idx]] = true
WinxedParser._isKeyword = function(k) { return this.keywords.hasOwnProperty(k) }

/* ometa-compiler */
WinxedOMetaTranslator.jumpTableCode = function(cases) {
  var buf = new StringBuffer()
  buf.nextPutAll("(function(){switch(this._apply('anything')){")
  for (var i = 0; i < cases.length; i += 1)
    buf.nextPutAll("case " + cases[i][0] + ":return " + cases[i][1] + ";")
  buf.nextPutAll("default: throw fail}}).call(this)")
  return buf.contents()
}


/* ometa-optimizer */
NullOptimization.initialize = function() { this._didSomething = false }

