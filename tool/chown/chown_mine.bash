#!/bin/bash

chown_mine(){
    local id_user id_group
    id_user="${SUDO_UID-$(id -u)}"
    id_group="${SUDO_GID-$(id -g)}"
    sudo chown "${id_user}:${id_group}" "$@"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    chown_mine "$@"
fi

