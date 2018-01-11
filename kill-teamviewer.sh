#!/bin/sh

EXITCODEFLURP=0

# we can't use `pgrep teamviewer |xargs kill` because we'll kill this script!

TEAMVIEWERPROCESSES=$(ps aux | grep -v grep | grep -i teamviewer \
                    | grep -v $(basename $0) | awk '{print $2}')

TVGUISLAVEPROCESSES=$(pgrep -i tvguislave)


function kill_array {
    if ! [ -z "$1" ]; then
        for i in $1; do
          echo Killing $i...
          kill -9 $i || sudo kill -9 $i
        done
    else
        EXITCODEFLURP=1;
        echo No $2 processes to kill.
    fi
}

kill_array "$TEAMVIEWERPROCESSES" "teamviewer"
kill_array "$TVGUISLAVEPROCESSES" "tvguislave"

exit $EXITCODEFLURP
