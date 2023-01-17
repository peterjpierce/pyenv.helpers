#!/usr/bin/env bash

default_basedir=/opt/python

me=$(basename $0)
bindir=$(cd $(dirname $0); pwd)
url_pattern='https://www.python.org/ftp/python/x.y.z/Python-x.y.z.tgz'

usage() {
  echo "usage: $me <version> [install_dir]"
  echo "   ex: $me 3.10.7"
  echo "       $me 3.7.3 /home/kelly/py/3.7.3"
  echo "(default install_dir=$default_basedir/<version>)"
  exit 0
}

# handle args
if [[ $# -lt 1 ]] || [[ $# -gt 2 ]]; then
  usage
else
  if [[ $1 =~ [23]\.[0-9]+\.[0-9]+ ]]; then
    version=$1
    [[ -n $2 ]] && prefix=$2 || prefix=$default_basedir/$version
    if [[ -e $prefix ]]; then
      echo "cannot proceed because \"$prefix\" already exists"
      exit 1
    fi
  else
    echo "\"$1\" is not a valid version"
    exit 1
  fi
fi

# download source from python.org
tmpdir=/tmp/pybuild_$(date +%Y%m%d_%H%M%S)
source=$(echo $url_pattern | perl -pe "s/x.y.z/$version/g")
mkdir $tmpdir && cd $tmpdir
curl -LO $source
[[ $? -gt 0 ]] && echo "error downloading source" && exit 1
tar -xzf Python-$version.tgz && cd Python-$version
if [[ $? -gt 0 ]] || [[ ! -f ./configure ]]; then
  echo "error obtaining a valid set of source files"
fi

# configure
export LD_RUN_PATH=$prefix/lib
./configure \
  --enable-shared \
  --prefix=$prefix \
  | tee /$tmpdir/python-$version-configure-$(date +%Y%m%d_%H%M%S)
[[ $? -gt 0 ]] && echo "error configuring" && exit 1

# build
make
[[ $? -gt 0 ]] && echo "error building" && exit 1

# install
echo "installing to $prefix"
make install > $tmpdir/python-$version-install-$(date +%Y%m%d_%H%M%S)
[[ $? -gt 0 ]] && echo "error installing" && exit 1

# symlink and install pip
cd $prefix/bin

if [[ -f python3 ]]; then
  echo "adding symlink for $prefix/bin/python"
  ln -s python3 python
fi

if [[ -f pip3 ]]; then
  # this separate because pip not standard before 3.x
  echo "adding symlink for $prefix/bin/pip"
  ln -s pip3 pip
else
  echo "installing pip and virtualenv (and wrapper)"
  $prefix/bin/python $bindir/get-pip.py
  [[ $? -gt 0 ]] && echo "error installing pip" && exit 1
  $prefix/bin/pip install virtualenvwrapper
fi
echo "listing of $prefix/bin"
ls -l $prefix/bin
