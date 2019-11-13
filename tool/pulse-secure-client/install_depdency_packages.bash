#!/bin/bash

wget_deb_and_dpkg_install_to(){
    local dest url temp_deb
    dest="${1?}"
    url="${2?}"
    temp_deb="$(mktemp)"

    wget -O "${temp_deb}" "${url}"
    dpkg -x "${temp_deb}" "${dest}"
    rm -f "${temp_deb}"
}

main(){
    local dest
    dest='/usr/local/pulse/extra'

    install -d "${dest}" 

    wget_deb_and_dpkg_install_to "${dest}" \
        'http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu60_60.2-3ubuntu3_amd64.deb'
    wget_deb_and_dpkg_install_to "${dest}" \
        'http://archive.ubuntu.com/ubuntu/pool/universe/w/webkitgtk/libjavascriptcoregtk-1.0-0_2.4.11-4_amd64.deb'
    wget_deb_and_dpkg_install_to "${dest}" \
        'http://archive.ubuntu.com/ubuntu/pool/universe/w/webkitgtk/libwebkitgtk-1.0-0_2.4.11-4_amd64.deb'
}

set -euo pipefail
IFS=$'\n\t'
main "${@}"
