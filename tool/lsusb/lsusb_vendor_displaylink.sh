#!/bin/sh
# Reference:
# https://support.displaylink.com/knowledgebase/articles/683672-my-displaylink-device-does-not-work-on-ubuntu
# Use lsusb from a terminal window to check that a DisplayLink device is on the
# USB bus. All DisplayLink devices have a vendor ID of 17e9, so can be checked
# with the command: lsusb -d 17e9:

lsusb_vendor(){
    vendor="${1?}"
    product="${2-}"
    lsusb -d "${vendor}:${product}"

}

lsusb_vendor '17e9'
