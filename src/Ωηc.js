/* node.js based OMeta/Winxed -> Winxed compiler for bootstrapping */

/* compiling winxed (not javascript) */
WINXED = 1;

require.paths.push(__dirname);
load = function () { /* ignore (used in OMeta/JS) */ };

require('stage0');

var fs  = require('fs');
    sys = require('sys');

function translateCode(s) {
    var tree = OMetaWinxedParser.matchAll(s, "topLevel", undefined, function(m, i) {
	sys.debug(sys.inspect([m, i]));
	throw objectThatDelegatesTo(fail, {errorPos: i}) 
    });

    sys.puts(sys.inspect(tree, false, 100));

    return OMetaWinxedTranslator.match(tree, "trans", undefined, function(m, i) {
	sys.debug(sys.inspect([m, i]));
	sys.debug("Translation error - pless tell Peter about this!");
	throw fail;
    });
}

process.argv.forEach( function (srcfile, idx, ary) {
    if (idx < 2)
	return;
    if (srcfile.substr(-3) !== ".Ωη") {
	sys.debug("Ignoring file of unknown type `" + srcfile + "'\n");
	return;
    }

    var destfile = srcfile.substr(0, srcfile.length - 3) + '.st1.winxed';
    sys.debug(srcfile + " -> " + destfile + "\n");

    var src  = fs.readFileSync(srcfile).toString();
    var code = translateCode(src);
    fs.writeFileSync(destfile, code);
});

