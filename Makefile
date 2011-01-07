# programs used in build (edit if appropriate)
NODE    = node
CPP     = cpp
PARROT_CONFIG = parrot_config
PARROT  = parrot
WINXED  = winxed
INSTALL = install

# programs required by bootstrap makefile
export CPP
export NODE
export WINXED
export PARROT


# read parrot configuration
OMETAC_EXE = Ωη$(shell $(PARROT_CONFIG) exe)
LIBDIR = $(shell $(PARROT_CONFIG) libdir)
BINDIR = $(shell $(PARROT_CONFIG) bindir)

.PHONY: build install bootstrap

build: blib/ometa-winxed-compiler.pbc blib/ometa-winxed.pbc bin/$(OMETAC_EXE)

install:
	$(INSTALL) blib/ometa-winxed.pbc          $(LIBDIR)
	$(INSTALL) blib/ometa-winxed-compiler.pbc $(LIBDIR)
	$(INSTALL) bin/$(OMETAC_EXE)              $(BINDIR)

bootstrap:
	cd bootstrap; $(MAKE) stage2.pir
	cp bootstrap/stage2.pir src/ometa-winxed-compiler.pir
	$(WINXED) -o src/ometa-winxed.pir -c bootstrap/ometa-base.winxed bootstrap/parser.winxed
