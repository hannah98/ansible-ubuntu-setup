#!/bin/bash

session=$1

if [ -d /mnt/user/persist/sessions ] && [ -e /mnt/user/persist/sessions/session.pl ]; then
    if [ -z "$session" ]; then
        session="main"
    fi

    if [ "$session" == "list" ]; then
        unset session
    fi
    if [ "$session" == "dev" ]; then
        echo 'Use alias "dev" instead of "strt"'
        /mnt/user/persist/scripts/dev.sh
        exit
    fi
    perl /mnt/user/persist/sessions/session.pl "$session"

else
    tmux new-session -d -s work -n main
    tmux -2 attach-session -d -twork
fi
