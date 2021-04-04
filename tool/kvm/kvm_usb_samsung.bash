#!/bin/bash
set -eux
VID_PID='090c:1000'

kvm -m 512 -smp 1 \
    -drive file=/path/to/hardisk/file.img \
    -usb -usbdevice "host:${VID_PID}" \
    -boot menu=on
# -device usb-storage,drive=drive0 -drive file=/dev/sdd,if=none,id=drive0

# qemu-system-x86_64                                      \
#     -device piix3-usb-uhci                                \
#     -drive id=pendrive,file=<disk.img>,format=raw,if=none \
#     -device usb-storage,drive=pendrive                    \
#     -boot menu=on
