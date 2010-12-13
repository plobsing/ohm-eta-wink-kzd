NODE = node

OMJS_FILES = \
    ometa-js/lib.js \
    ometa-js/ometa-base.js \
    ometa-js/parser.js \
    ometa-js/bs-js-compiler.js \
    ometa-js/bs-ometa-compiler.js \
    ometa-js/bs-ometa-js-compiler.js \
    ometa-js/bs-ometa-optimizer.js \
    ometa-js/ometa-rhino.js

STAGE0_FILES = \
    winxed-compiler.js \
    ometa-compiler.js \
    ometa-winxed-compiler.js

STAGE1_FILES = \
    winxed-compiler.winxed \
    ometa-compiler.winxed \
    ometa-winxed-compiler.winxed

GEN_FILES = \
    $(STAGE0_FILES) \
    $(STAGE1_FILES) \
    ometa-js.js \
    stage0.js

.SUFFIXES: .ojs .js .Ωη .winxed

.ojs.js: ometa-js.js ojsc.js
	$(NODE) ojsc.js $<

.Ωη.winxed: stage0.js Ωηc.js
	$(NODE) Ωηc.js $<

default: $(STAGE0_FILES)

clean:
	rm -rf $(GEN_FILES)

ometa-js.js: $(OMJS_FILES)
	cat $^ > $@

stage0.js: $(STAGE0_FILES)
	cat $^ > $@

