/* node.js based OMeta/JS -> JS compiler for bootstrapping */

require.paths.push(__dirname);

/* compiling javascript */
WINXED = 0;

load = function () {
    /*
     * ignore load()
     * OMeta/JS has been prepackaged as ometa-js.js
     */
};
require('ometa-js');

var fs  = require('fs');
    sys = require('sys');

translateCode = function(s) {
  var tree = BSOMetaJSParser.matchAll(s, "topLevel", undefined, function(m, i) {
      sys.debug(sys.inspect([m, i]));
      throw objectThatDelegatesTo(fail, {errorPos: i})
  });

  var translationError = function(m, i) {
    alert("Translation error - please tell Alex about this!");
    throw fail
  };

  return BSOMetaJSTranslator.match(tree, "trans", undefined, translationError)
}

process.argv.forEach( function (srcfile, idx, ary) {
    if (idx < 2)
	return;
    if (srcfile.substr(-4) !== ".ojs") {
	sys.debug("Ignoring file of unknown type `" + srcfile + "'\n");
	return;
    }

    var destfile = srcfile.substr(0, srcfile.length - 4) + '.js';
    sys.debug(srcfile + " -> " + destfile + "\n");

    var src  = fs.readFileSync(srcfile).toString();
    var code = translateCode(src);
    fs.writeFileSync(destfile, code);
});

