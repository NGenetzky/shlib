#!/bin/bash

prompt_confirm() {
    case "$PROMPT_CONFIRM" in
        *n*) return 1 ;;
        *y*) return 0 ;;
    esac

    if ! [ -t 0 ] ; then
        return 0
    fi

    while true; do
        read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
        case $REPLY in
            [yY]) echo ; return 0 ;;
            [nN]) echo ; return 1 ;;
            *) printf " \033[31m %s \n\033[0m" "invalid input"
        esac
    done
}

apt_purse_unused_kernels_0(){
    # Reference:
    # http://tuxtweaks.com/2010/10/remove-old-kernels-in-ubuntu-with-one-command/
    # Source:
    # https://askubuntu.com/a/259092
    dpkg -l linux-{image,headers}-"[0-9]*" \
        | awk '/^ii/{ print $2}' \
        | grep -v -e "$(uname -r | cut -f1,2 -d"-")" \
        | grep -e '[0-9]'

    if prompt_confirm 'purge?' ; then
        dpkg -l linux-{image,headers}-"[0-9]*" \
            | awk '/^ii/{ print $2}' \
            | grep -v -e "$(uname -r | cut -f1,2 -d"-")" \
            | grep -e '[0-9]' \
            | xargs sudo apt-get -y purge
    fi
}

apt_purse_unused_kernels_1(){
    # https://askubuntu.com/questions/57994/root-drive-is-running-out-of-disk-space-how-can-i-free-up-space
    # https://ubuntugenius.wordpress.com/2011/01/08/ubuntu-cleanup-how-to-remove-all-unused-linux-kernel-headers-images-and-modules/
    dpkg -l 'linux-*' \
        | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'

    if prompt_confirm 'purge?' ; then
        dpkg -l 'linux-*' \
            | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' \
            | xargs sudo apt-get -y purge
    fi
}

apt_purse_unused_kernels(){
    # This implementation appears to be better.
    apt_purse_unused_kernels_1
}

apt_purse_unused_kernels
