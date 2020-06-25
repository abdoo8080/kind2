.PHONY: all build clean doc install test uninstall

all: build

build:
	@dune build

clean:
	@dune clean

doc:
	@dune build @doc
	@cp -r ./src/doc/include ./_build/default/_doc/_html/kind2Internal

install:
	@dune install

test:
	@dune test --no-buffer

uninstall:
	@dune uninstall
