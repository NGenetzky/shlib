#!/bin/sh

install_tools(){
    local tools
    tools="\
        wmctrl \
    "
        # v4l-utils \

    sudo apt install "${tools}"
}

install_tools
