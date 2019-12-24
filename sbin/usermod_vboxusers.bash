#!/bin/bash

usermod_vboxusers(){
    local name_user
    name_user="$(id -un)"
    sudo usermod -aG 'vboxusers' "${name_user}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    usermod_vboxusers "$@"
fi

