#!/bin/bash

wget_download(){
    local url="${1?}"
    local name="${2?}"

    DL_DIR="${DL_DIR-"${HOME}/Downloads/"}"
    local path="${DL_DIR}/${name}"
    wget -O "${path}" "${url}"
}

wget_download "$@"
