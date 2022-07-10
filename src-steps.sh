#!/bin/bash

curl https://sh.rustup.rs -sSf | sh ## TODO: Figure out how to get this to autosubmit the '1' option
wget https://ftp.mozilla.org/pub/firefox/releases/91.0esr/source/firefox-91.0esr.source.tar.xz
tar -xvf firefox-91.0esr.source.tar.xz
cd firefox-91.0/js/src
cp ./configure.in ./configure
chmod +x ./configure
mkdir _build
cd _build
make
make install