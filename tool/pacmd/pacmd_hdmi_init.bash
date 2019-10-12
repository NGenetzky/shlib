#!/bin/bash

pacmd_hdmi_init(){
    local padevice
    padevice="${1-alsa_output.pci-0000_00_1f.3.hdmi-stereo-extra2}"

    pacmd set-default-sink "${padevice}"
    # pacmd set-sink-volume "${padevice}" 0x10000
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    pacmd_hdmi_init "$@"
fi

