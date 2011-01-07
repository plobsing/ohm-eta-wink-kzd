CPP_FLAGS     = -E -P
OJS_CPP_FLAGS = -DJS
OWX_CPP_FLAGS = -DWINXED

# types of files

OMJS_LIB = \
    ometa-js/lib.js \
    ometa-js/ometa-base.js \
    ometa-js/parser.js

OMWX_LIB = \
    ometa-base.winxed \
    parser.winxed

OMJS_GRAMMARS = \
    ometa-js/bs-js-compiler.js \
    ometa-js/bs-ometa-compiler.js \
    ometa-js/bs-ometa-js-compiler.js \
    ometa-js/bs-ometa-optimizer.js 

JS_GRAMMARS = \
    winxed-compiler.js \
    ometa-compiler.js \
    ometa-winxed-compiler.js \
    ometa-optimizer.js

WX_ST1_GRAMMARS = \
    winxed-compiler.st1.winxed \
    ometa-compiler.st1.winxed \
    ometa-winxed-compiler.st1.winxed \
    ometa-optimizer.st1.winxed

WX_ST2_GRAMMARS = \
    winxed-compiler.st2.winxed \
    ometa-compiler.st2.winxed \
    ometa-winxed-compiler.st2.winxed \
    ometa-optimizer.st2.winxed

OMJS_FILES = \
    $(OMJS_LIB) \
    $(OMJS_GRAMMARS)

OMWX_ST1_FILES = \
    $(OMWX_LIB) \
    $(WX_ST1_GRAMMARS)

# stage2 separates runtime and compiler for separate use
OMWX_ST2_FILES = \
    $(WX_ST2_GRAMMARS)

STAGE0_FILES = \
    ojs.capo.js \
    $(OMJS_LIB) \
    $(JS_GRAMMARS) \
    ojs.coda.js

STAGE1_FILES = \
    Ωη.capo.winxed \
    $(OMWX_ST1_FILES) \
    Ωη.coda.winxed

STAGE2_FILES = \
    Ωη.capo.winxed \
    $(OMWX_ST2_FILES) \
    Ωη.coda.winxed

GEN_FILES = \
    $(JS_GRAMMARS) \
    $(WX_ST1_GRAMMARS) \
    $(WX_ST2_GRAMMARS) \
    ometa-js.js \
    stage0.js \
    stage1.winxed \
    stage1.pir \
    stage1.pbc \

# suffix rules

%.ojs: %.dual
	$(CPP) $(CPP_FLAGS) $(OJS_CPP_FLAGS)  $< $@

%.js: %.ojs ometa-js.js ojsc.js
	$(NODE) ojsc.js $<

%.Ωη: %.dual
	$(CPP) $(CPP_FLAGS) $(OWX_CPP_FLAGS) $< $@

%.st1.winxed: %.Ωη stage0.js Ωηc.js
	$(NODE) Ωηc.js $<

%.st2.winxed: %.Ωη stage1.pbc ometac.winxed
	$(WINXED) ometac.winxed $<

%.pir: %.winxed
	$(WINXED) -c $<

%.pbc: %.pir
	$(PARROT) -o $@ $<

# magic targets

default: stage0.js stage1.winxed

clean:
	rm -rf $(GEN_FILES)

# specialised rules

ometa-js.js: $(OMJS_FILES)
	cat $^ > $@

stage0.js: $(STAGE0_FILES)
	cat $^ > $@

stage1.winxed: $(STAGE1_FILES)
	cat $^ > $@

stage2.winxed: $(STAGE2_FILES)
	cat $^ > $@
