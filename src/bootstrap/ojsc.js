/* node.js based OMeta/JS -> JS compiler for bootstrapping */

require.paths.push(process.env['OMETAJS_PATH']);
require.paths.push('.');

load = require;
StringBuffer = require('lib').StringBuffer;
require('ometa-rhino');

var fs  = require('fs');
    sys = require('sys');

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

