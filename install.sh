#!/bin/sh

[ -d ~/bin ] || mkdir ~/bin

for i in *; do
    if [ $i = $(basename $0) -o -d $i ]; then
        continue
    else
        ln -s $(pwd)/$i ~/bin/$i && echo Created ~/bin/$i || failure=1
    fi
done

read -p "Install xpswifi? (y/N): " choice
case $choice in
    y|Y )
        ln -s xpswifi/connect-wifi.sh ~/bin/xpswifi;;

    * )
esac
