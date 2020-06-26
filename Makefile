DUNE_DOCDIR=$(CURDIR)/_build/default/_doc/_html
LOCAL_ALLDOCDIR=$(CURDIR)/doc
LOCAL_DOCDIR=$(CURDIR)/ocamldoc
LOCAL_USRDOCDIR=$(CURDIR)/doc/usr

.PHONY: all build clean install kind2-doc test uninstall doc

all: build

build:
	@dune build

clean:
	@dune clean

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

doc:
	make -C $(LOCAL_USRDOCDIR) all
