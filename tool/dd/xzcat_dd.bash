#!/bin/bash
# Examples:
# sudo ./xzcat_dd.bash  ~/Downloads/radxa-zero3_debian_bullseye_xfce_b6.img.xz /dev/sda
SRC="${1?}"
DEST="${2?}"
xzcat "${SRC?}" | dd of="${DEST?}"
