#!/bin/sh

install_user_d(){
    sudo install \
        -o "$(id -u)" -g "$(id -u)" \
        -d \
        "$@"
}

install_user_d "$@"
