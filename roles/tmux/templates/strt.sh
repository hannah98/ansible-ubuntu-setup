#!/bin/bash

session=$1
if [ -z "$session" ]; then
    session="main"
fi

if [ "$session" == "list" ]; then
    smug list
    exit 0
fi

smug start $session || smug list
