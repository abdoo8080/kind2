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
	@dune build @doc
	@mkdir -p $(LOCAL_DOCDIR)
	@cp -r $(CURDIR)/src/doc/include $(CURDIR)/_build/default/_doc/_html/kind2Internal
	@cp -rf $(CURDIR)/_build/default/_doc/_html/* $(LOCAL_DOCDIR)

test:
	@dune test --no-buffer

uninstall:
	@dune uninstall

doc:
	make -C $(LOCAL_USRDOCDIR) all
