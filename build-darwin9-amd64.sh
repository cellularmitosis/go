#!/bin/bash

set -e -o pipefail -x

dest=go-1.6.4-darwin9-amd64

cd src
GOROOT_BOOTSTRAP=$HOME/opt/go-1.4.3-darwin9-amd64 \
CGO_CFLAGS=-mmacosx-version-min=10.5 \
CGO_LDFLAGS=-mmacosx-version-min=10.5 \
./make.bash
cd ..

src=$PWD
cd ..
mkdir -p ~/opt
rm -rf $dest
rsync -a --exclude='.git/' $src ~/opt/$dest

cd ~/opt
tar c $dest | gzip -9 > /tmp/$dest.tar.gz
