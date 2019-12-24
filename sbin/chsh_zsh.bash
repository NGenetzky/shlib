#!/bin/bash

main(){
    local name_user
    name_user="$(id -un)"
    if [ ! -f '/bin/zsh' ] ; then
        echo 'Where is zsh?'
        return 1
    fi
    sudo chsh -s '/bin/zsh' "${name_user}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi

