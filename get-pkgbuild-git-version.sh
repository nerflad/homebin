#!/bin/bash

fn_git_test () {
    git status >/dev/null || exit 1
}

fn_print () {
    fn_git_test
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


fn_usage () {
    echo Usage:
    echo $(basename $0) '[directory]'.
    echo 'Prints PKGBUILD-friendly git version string for [directory]'
    echo Defaults to current directory.
}


case $1 in 
    "--help"|"-h" )
        fn_usage
        exit 0;;
esac

if ! [ -z "$1" ]; then
    pushd $1 >/dev/null 2>/dev/null
    fn_print
    popd >/dev/null 2>/dev/null
else
    fn_print
fi
