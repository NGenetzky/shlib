#!/bin/bash
#
# Command 'arp' not found, but can be installed with:
#
# sudo apt install net-tools

# https://raspberrypi.stackexchange.com/users/6837/mrded
# https://raspberrypi.stackexchange.com/a/34594
# arp -na | grep -i b8:27:eb

# https://raspberrypi.stackexchange.com/users/84645/0x01
arp -n | awk '/b8:27:eb/ {print $1}'
