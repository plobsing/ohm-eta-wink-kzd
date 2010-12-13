NODE=node

.SUFFIXES: .ojs .js

.ojs.js: ometa-js.js ojsc.js
	$(NODE) ojsc.js $<

ometa-js.js: ometa-js/lib.js ometa-js/ometa-base.js ometa-js/parser.js \
    ometa-js/bs-js-compiler.js ometa-js/bs-ometa-compiler.js \
    ometa-js/bs-ometa-js-compiler.js ometa-js/bs-ometa-optimizer.js \
    ometa-js/ometa-rhino.js
	cat $^ > $@
