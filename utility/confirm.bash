#!/bin/bash
# Reference:
# https://askubuntu.com/questions/22233/always-prompt-the-user-before-executing-a-command-in-the-shell
# https://askubuntu.com/a/22257

confirm() {
    echo -n "Do you want to run '$*'? [N/y] "
    read -r -N 1 REPLY
    echo
    if test "$REPLY" = "y" -o "$REPLY" = "Y"; then
        "$@"
    else
        echo "Cancelled by user"
    fi
}

_main(){
    confirm "${@}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    _main "$@"
fi

