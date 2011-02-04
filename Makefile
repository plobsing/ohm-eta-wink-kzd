# programs used in build (edit if appropriate)
NODE          = node
CPP           = cpp
PARROT_CONFIG = parrot_config
PARROT        = parrot
WINXED        = winxed

# programs required by bootstrap makefile
export CPP
export NODE
export WINXED
export PARROT


# read parrot configuration
EXE        = $(shell $(PARROT_CONFIG) exe)
OMETAC_EXE = Ωη$(EXE)
LIBDIR     = $(shell $(PARROT_CONFIG) libdir)$(shell $(PARROT_CONFIG) versiondir)/library
BINDIR     = $(shell $(PARROT_CONFIG) bindir)
PBC2EXE    = $(BINDIR)/pbc_to_exe$(EXE)

BLIB_DIRS  = blib blib/OMetaWinxed bin

TEST_FILES = \
    t/character-classifier.Ωη \
    t/tutorial.Ωη

.PHONY: build test install bootstrap blib-dirs

build: blib/OMetaWinxed/Compiler.pbc blib/OMetaWinxed.pbc bin/$(OMETAC_EXE)

blib/OMetaWinxed/Compiler.pbc: src/OMetaWinxed/Compiler.pir blib-dirs
	$(PARROT) -o $@ $<

blib/OMetaWinxed.pbc: src/OMetaWinxed.pir blib-dirs
	$(PARROT) -o $@ $<

bin/$(OMETAC_EXE): src/ometac.winxed blib-dirs
	$(WINXED) -c src/ometac.winxed
	$(PARROT) -o src/ometac.pbc src/ometac.pir
	$(PBC2EXE) src/ometac.pbc
	cp src/ometac$(EXE) $@

blib-dirs:
	mkdir -p blib blib/OMetaWinxed bin

test:
	$(WINXED) t/harness $(TEST_FILES)

install:
	install blib/OMetaWinxed.pbc          $(LIBDIR)
	mkdir   $(LIBDIR)/OMetaWinxed
	install blib/OMetaWinxed/Compiler.pbc $(LIBDIR)/OMetaWinxed
	install bin/Ωη			      $(BINDIR)

uninstall:
	rm -rf $(LIBDIR)/OMetaWinxed.pbc
	rm -rf $(LIBDIR)/OMetaWinxed
	rm -rf $(BINDIR)/Ωη

bootstrap:
	cd bootstrap; $(MAKE) stage2.pir ometa-base.pir
	cp bootstrap/stage2.pir     src/OMetaWinxed/Compiler.pir
	cp bootstrap/ometa-base.pir src/OMetaWinxed.pir
