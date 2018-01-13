#!/bin/bash

# change to correct dir when run from cron:
cd ~/.vim/bundle

for i in *; do
    pushd $i
    git pull
    popd
done
