#!/bin/sh

kermit_ttyusb()
{
    dev="/dev/ttyUSB${1}"
    baud="${2-115200}"
    kermit -l "${dev}" -b "${baud}" -c
}
