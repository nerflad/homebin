#!/bin/sh

scrot /tmp/screen.png

xwobf -s 7 /tmp/screen.png

i3lock --insidecolor=ffffff1c --ringcolor=ffffff3e \
--linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 \
--separatorcolor=22222260 --insidevercolor=0000001c --ringwrongcolor=00000055 \
--insidewrongcolor=0000001c -i /tmp/screen.png

rm /tmp/screen.png
