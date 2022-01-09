#!/bin/bash

wget_download_install_executable(){
    local url="${1?}"
    local name="${2?}"

    BIN_DIR="${BIN_DIR-"${HOME}/.local/bin/"}"
    local path="${BIN_DIR}/${name}"
    wget -O "${path}" "${url}"
    chmod 755 "${path}"
}

wget_download_install_executable "$@"
