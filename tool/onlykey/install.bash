#!/bin/bash
set -e

#https://docs.crp.to/command-line.html
sudo apt update && sudo apt upgrade

sudo apt install python3-pip python3-tk libusb-1.0-0-dev libudev-dev

# NOTE: You can't use 'fido2' from pip3, must use python3-fido2
#pip3 uninstall fido2
sudo apt install python3-fido2

pip3 install onlykey

if [ ! -f /etc/udev/rules.d/49-onlykey.rules ] ; then
    wget https://raw.githubusercontent.com/trustcrypto/trustcrypto.github.io/master/49-onlykey.rules
    sudo mv 49-onlykey.rules /etc/udev/rules.d/
    sudo udevadm control --reload-rules && udevadm trigger
fi

