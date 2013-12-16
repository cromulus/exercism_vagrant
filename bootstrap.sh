#!/bin/bash

#ocaml
type opam >/dev/null 2>&1 || \
{ \
  echo >&2 "installing Ocaml";
  sudo apt-get install -y software-properties-common > /dev/null 2>&1
  sudo add-apt-repository -y ppa:avsm/ppa > /dev/null 2>&1
  sudo apt-get update > /dev/null 2>&1
  sudo apt-get install -y curl build-essential m4 ocaml opam > /dev/null 2>&1
  opam update > /dev/null 2>&1
  opam install utop > /dev/null 2>&1
  opam install ounit > /dev/null 2>&1
}

#clojure setup
if [[ ! -f /home/vagrant/.lein/profiles.clj ]]; then
  mkdir -p /
  echo '{:user {:plugins [[lein-exec "0.3.1"]]}}' > /home/vagrant/.lein/profiles.clj
  chown -R vagrant:vagrant /home/vagrant/.lein/
fi

type exercism >/dev/null 2>&1 || \
{ \
  echo >&2 "installing exercism.io CLI";
  if [[ ! -f /var/chef/cache/exercism-linux-amd64.tgz ]]; then
    wget –quiet -output-document /tmp/exercism-linux-amd64.tgz https://github.com/exercism/cli/releases/download/v1.3.2/exercism-linux-amd64.tgz;
  fi
  tar -xzf /var/chef/cache/exercism-linux-amd64.tgz;
  sudo mv /var/chef/cache/exercism /usr/local/bin/;
}