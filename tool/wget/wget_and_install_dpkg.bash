#!/bin/bash

wget_download_dpkg_install(){
    local url="${1?}"
    local name="${2?}"

    DL_DIR="${DL_DIR-"${HOME}/Downloads/"}"
    local path="${DL_DIR}/${name}"
    wget -O "${path}" "${url}"
    echo -e 'May need to fix broken packages using:\nsudo apt-get install -f'
    sudo dpkg --install "${path}"
}

wget_download_dpkg_install "$@"
