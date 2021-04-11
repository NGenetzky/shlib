#!/bin/bash

sudo_maybe()
{
    if [ "$(id -u)" -ne 0 ]; then
        sudo "$@"
    else
        "$@"
    fi
}

sudo_required(){
    if [ "$(id -u)" -ne 0 ]; then
        echo -e 'Script must be run as root.'
        exit 1
    fi
}
