#!/usr/bin/env bash

export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

#Rbenv patch to install Ruby 2.x on Ubuntu 14.04
#https://bugs.ruby-lang.org/issues/9578
#https://github.com/sstephenson/ruby-build/issues/526
if [ `lsb_release -c | awk '{print $2}'` == "trusty" ]
then
  curl -fsSL https://gist.github.com/mislav/a18b9d7f0dc5b9efc162.txt | rbenv install --patch 2.1.1 --force --verbose
else
  rbenv install $1 --force --verbose
fi
