#!/bin/sh

[ -d ~/bin ] || mkdir ~/bin

for i in *; do [ $i = $(basename $0) ] && continue || ln -s $(pwd)/$i ~/bin/$i; done
