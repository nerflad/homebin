#!/bin/sh

[ -d ~/bin ] || mkdir ~/bin

for i in *; do
    # skip this file and any directories
    if [ $i = $(basename $0) ] || [ -d $i ]; then
        continue
    else
        ln -s $(pwd)/$i ~/bin/$i 2>/dev/null && echo ✅ ~/bin/$i
    fi
done
