DUNE_DOCDIR=$(CURDIR)/_build/default/_doc/_html
DUNE_EXEDIR=$(CURDIR)/_build/default/src
LOCAL_ALLDOCDIR=$(CURDIR)/doc
LOCAL_BINDIR=$(CURDIR)/bin
LOCAL_DOCDIR=$(CURDIR)/ocamldoc
LOCAL_USRDOCDIR=$(CURDIR)/doc/usr

.PHONY: all build clean doc install kind2-doc test uninstall

all: build

build:
	@dune build
	@mkdir -p $(LOCAL_BINDIR)
	@cp $(DUNE_EXEDIR)/kind2.exe $(LOCAL_BINDIR)/kind2

clean:
	@dune clean
	@rm -rf $(LOCAL_BINDIR)
	@rm -rf $(LOCAL_DOCDIR)

doc:
	make -C $(LOCAL_USRDOCDIR) all

install:
	@dune install

kind2-doc:
	@dune build @doc-private
	@dune build @copy
	@mkdir -p $(LOCAL_DOCDIR)
	@cp -rf $(DUNE_DOCDIR)/* $(LOCAL_DOCDIR)

test:
	@dune test --no-buffer

uninstall:
	@dune uninstall
