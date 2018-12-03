#!/bin/sh

apt_purse_unused_kernels(){
    # Reference:
    # http://tuxtweaks.com/2010/10/remove-old-kernels-in-ubuntu-with-one-command/
    # Source:
    # https://askubuntu.com/a/259092
    dpkg -l linux-{image,headers}-"[0-9]*" | awk '/^ii/{ print $2}' | grep -v -e `uname -r | cut -f1,2 -d"-"` | grep -e '[0-9]' | xargs sudo apt-get -y purge
}

apt_purse_unused_kernels
