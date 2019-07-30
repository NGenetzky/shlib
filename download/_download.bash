#!/bin/bash

readonly DL_DIR="${HOME}/Downloads/"
readonly BIN_DIR="${HOME}/.local/bin/"

wget_download(){
    local url="${1?}"
    local name="${2?}"

    local path="${DL_DIR}/${name}"
    wget -O "${path}" "${url}"
}

wget_download_install_executable(){
    local url="${1?}"
    local name="${2?}"

    local path="${BIN_DIR}/${name}"
    wget -O "${path}" "${url}"
    chmod 755 "${path}"
}

wget_download_dpkg_install(){
    local url="${1?}"
    local name="${2?}"

    local path="${DL_DIR}/${name}"
    wget -O "${path}" "${url}"
    sudo dpkg --install "${path}"
    sudo apt-get install --fix-broken
}

