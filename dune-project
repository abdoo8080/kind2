(lang dune 2.5)
(name kind2)
(package
  (name kind2)
  (synopsis "")
  (description "")
  (depends (ocaml (>= 4.04)) dune menhir num yojson zmq))
(using menhir 2.1)
(generate_opam_files true)
