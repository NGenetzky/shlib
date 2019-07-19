#!/bin/bash

# https://askubuntu.com/questions/112568/how-do-i-allow-a-non-default-user-to-use-serial-device-ttyusb0
# https://askubuntu.com/a/680328

file='/etc/udev/rules.d/50-tty-devices.rules'
echo "cat \"${file}\""
tee "${file}" <<EOF
KERNEL=="ttyUSB[0-9]*",MODE="0666"
KERNEL=="ttyACM[0-9]*",MODE="0666"
EOF
