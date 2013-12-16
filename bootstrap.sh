#!/bin/bash

#ocaml
type opam >/dev/null 2>&1 || \
{ \
  echo >&2 "installing Ocaml";
  sudo add-apt-repository ppa:avsm/ppa;
  sudo apt-get update;
  sudo apt-get install -y curl build-essential m4 ocaml opam;
  opam update;
  opam install utop;
  opam install ounit;
}

#clojure setup
if [[ ! -f ~/.lein/profiles.clj ]]; then
  echo '{:user {:plugins [[lein-exec "0.3.1"]]}}' >> ~/.lein/profiles.clj
fi