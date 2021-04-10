#!/bin/bash
 
apt-get update

apt-get -y install --no-install-recommends \
        gawk wget git-core diffstat unzip texinfo gcc-multilib \
        build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
        xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
        pylint3 xterm

apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
