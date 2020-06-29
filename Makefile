DUNE_DOCDIR=$(CURDIR)/_build/default/_doc/_html
DUNE_EXEDIR=$(CURDIR)/_build/default/src
GIT_DESCRIBE=$(shell git describe --always --dirty)
LOCAL_ALLDOCDIR=$(CURDIR)/doc
LOCAL_BINDIR=$(CURDIR)/bin
LOCAL_DOCDIR=$(CURDIR)/ocamldoc
LOCAL_USRDOCDIR=$(CURDIR)/doc/usr

.PHONY: all build clean doc install kind2-doc test uninstall

all: build

build:
	@sed -i "s/%%NAME%%/kind2/g" "s/%%VERSION%%/$(GIT_DESCRIBE)/g" $(CURDIR)/src/version.ml
	@dune build
	@git checkout $(CURDIR)/src/version.ml
	@mkdir -p $(LOCAL_BINDIR)
	@cp $(DUNE_EXEDIR)/kind2.exe $(LOCAL_BINDIR)/kind2

clean:
	@dune clean
	@rm -rf $(LOCAL_BINDIR) $(LOCAL_DOCDIR)

doc:
	make -C $(LOCAL_USRDOCDIR) all

install:
	@opam install .

kind2-doc:
	@dune build @doc-private
	@dune build @copy
	@mkdir -p $(LOCAL_DOCDIR)
	@cp -rf $(DUNE_DOCDIR)/* $(LOCAL_DOCDIR)

test:
	@dune test --no-buffer

uninstall:
	@opam remove .
