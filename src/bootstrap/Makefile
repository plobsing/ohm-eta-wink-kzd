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

JS_GRAMMARS = \
    winxed-compiler.js \
    ometa-compiler.js \
    ometa-winxed-compiler.js

WX_GRAMMARS = \
    winxed-compiler.winxed \
    ometa-compiler.winxed \
    ometa-winxed-compiler.winxed

STAGE0_FILES = \
    ojs.capo.js \
    $(JS_GRAMMARS) \
    ojs.coda.js

STAGE1_FILES = \
    Ωη.capo.winxed \
    $(WX_GRAMMARS) \
    Ωη.coda.winxed

GEN_FILES = \
    $(JS_GRAMMARS) \
    $(WX_GRAMMARS) \
    ometa-js.js \
    stage0.js

%.ojs: %.dual
	$(CPP) $(OJS_CPP_FLAGS)  $< $@

%.js: %.ojs ometa-js.js ojsc.js
	$(NODE) ojsc.js $<

%.Ωη: %.dual
	$(CPP) $(OWX_CPP_FLAGS) $< $@

%.winxed: %.Ωη stage0.js Ωηc.js
	$(NODE) Ωηc.js $<

default: $(STAGE0_FILES)

clean:
	rm -rf $(GEN_FILES)

ometa-js.js: $(OMJS_FILES)
	cat $^ > $@

stage0.js: $(STAGE0_FILES)
	cat $^ > $@

