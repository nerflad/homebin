#!/bin/sh

DRIVE_PATH=$(mount |grep google-drive-ocamlfuse |awk '{print $3}')

fn_usage () {
    echo Usage:
    echo $(basename $0) [PATH]
    echo
    echo If a Google Drive directory is mounted through google-drive-ocamlfuse,
    echo unmount it. Otherwise, mount it at PATH.
}

fn_unmount () {
    if [ -n "$DRIVE_PATH" ]; then
        if [ -n "$1" ]; then
            echo Detected Google Drive mounted at $DRIVE_PATH
            read -p "Unmount? (y/N): " choice
            case $choice in
                y|Y )
                    ;;
                * )
                    exit 0;;
            esac
        fi
        echo Unmounting $DRIVE_PATH...
        sudo umount $DRIVE_PATH
    else
        echo Could not determine path of Google Drive directory.
        echo Aborting...
        exit 1
    fi
}

fn_mount () {
    DRIVE_PATH=$1
    if [ -z "$DRIVE_PATH" ]; then
        fn_usage
        exit 1
    elif ! [ -d $DRIVE_PATH ]; then
        echo Could not mount $DRIVE_PATH: not a directory.
        exit 1
    else
        google-drive-ocamlfuse $DRIVE_PATH && echo Mounted $DRIVE_PATH
    fi
}

# main
[ -n "$DRIVE_PATH" ] && fn_unmount $1 || fn_mount $1
