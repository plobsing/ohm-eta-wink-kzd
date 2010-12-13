/* node.js based OMeta/Winxed -> Winxed compiler for bootstrapping */

require.paths.push(__dirname);
require('stage0');

var fs  = require('fs');
    sys = require('sys');

function translateCode(s) {
    var tree = OMetaWinxedParser.matchAll(s, "topLevel", undefined, function(m, i) {
	throw objectThatDelegatesTo(fail, {errorPos: i}) 
    });

    return OMetaWinxedTranslator.match(tree, "trans", undefined, function(m, i) {
	sys.debug("Translation error - pless tell Peter about this!");
	throw fail;
    }
}

process.argv.forEach( function (srcfile, idx, ary) {
    if (idx < 2)
	return;
    if (srcfile.substr(-4) !== ".Ωη") {
	sys.debug("Ignoring file of unknown type `" + srcfile + "'\n");
	return;
    }

    var destfile = srcfile.substr(0, srcfile.length - 4) + '.winxed';
    sys.debug(srcfile + " -> " + destfile + "\n");

    var src  = fs.readFileSync(srcfile).toString();
    var code = translateCode(src);
    fs.writeFileSync(destfile, code);
});

