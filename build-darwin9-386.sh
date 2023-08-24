#!/bin/bash

set -e -o pipefail -x

dest=go-1.4.3-darwin9-386

cd src
./make.bash
cd ..

src=$PWD
cd ..
mkdir -p ~/opt
rm -rf $dest
rsync -a --exclude='.git/' $src ~/opt/$dest

cd ~/opt
tar c $dest | gzip -9 > /tmp/$dest.tar.gz
