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
  mkdir -p /home/vagrant/.lein/profiles.clj
  echo '{:user {:plugins [[lein-exec "0.3.1"]]}}' > /home/vagrant/.lein/profiles.clj
  chown -R vagrant:vagrant /home/vagrant/.lein/
fi

type phantomjs >/dev/null 2>&1 || \
{ \
  echo >&2 "installing Phantomjs";
  cd /var/chef/cache
  if [[ ! -f phantomjs-1.9.2-linux-x86_64.tar.bz2 ]]; then
    wget --quiet https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2;
  fi
  bzip2 -d phantomjs-1.9.2-linux-x86_64.tar.bz2
  tar -xf phantomjs-1.9.2-linux-x86_64.tar
  sudo mv phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/bin/
  rm -rf phantomjs-1.9.2-linux-x86_64
  rm phantomjs-1.9.2-linux-x86_64.tar
}



type exercism >/dev/null 2>&1 || \
{ \
  echo >&2 "installing exercism.io CLI";
  cd /var/chef/cache
  VERSION=$(curl --head --silent https://github.com/exercism/cli/releases/latest | grep Location | awk '{print $2}' | sed -e 's/https:\/\/github.com\/exercism\/cli\/releases\/tag\///')
v1.3.2
  if [[ ! -f exercism-linux-amd64.tgz ]]; then
    wget --quiet https://github.com/exercism/cli/releases/download/$VERSION/exercism-linux-amd64.tgz
  fi
  tar -xzf exercism-linux-amd64.tgz
  sudo mv exercism /usr/local/bin/
}

ln -s /vagrant/exercises /home/vagrant/exercises