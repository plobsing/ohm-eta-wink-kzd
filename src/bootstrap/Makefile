NODE = node
CPP  = cpp

OJS_CPP_FLAGS = -E -P -DJS     -DUNDEF=undefined -DSELF=this
OWX_CPP_FLAGS = -E -P -DWINXED -DUNDEF=null      -DSELF=self

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
    ojs.capo.js \
    winxed-compiler.js \
    ometa-compiler.js \
    ometa-winxed-compiler.js \
    ojs.coda.js

STAGE1_FILES = \
    Ωη.capo.winxed \
    winxed-compiler.winxed \
    ometa-compiler.winxed \
    ometa-winxed-compiler.winxed \
    Ωη.coda.winxed

GEN_FILES = \
    $(STAGE0_FILES) \
    $(STAGE1_FILES) \
    ometa-js.js \
    stage0.js

%.ojs: %.dual
	$(CPP) $(OJS_CPP_FLAGS)  $< $@

%.Ωη: %.dual
	$(CPP) $(OWX_CPP_FLAGS) $< $@

%.js: %.ojs ometa-js.js ojsc.js
	$(NODE) ojsc.js $<

%.winxed: %.Ωη stage0.js Ωηc.js
	$(NODE) Ωηc.js $<

default: winxed-compiler.js

clean:
	rm -rf $(GEN_FILES)

ometa-js.js: $(OMJS_FILES)
	cat $^ > $@

stage0.js: $(STAGE0_FILES)
	cat $^ > $@

