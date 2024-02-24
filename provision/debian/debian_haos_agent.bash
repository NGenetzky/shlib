#!/bin/bash

# https://wiki.seeedstudio.com/reterminal-DM-Frigate/
sudo apt-get install -yqq \
    apparmor \
    curl \
    dbus \
    jq \
    libglib2.0-bin \
    network-manager \
    systemd-journal-remote \
    udisks2 \
    wget \
    # end of apts

sudo apt --fix-broken install
