#!/bin/bash

main(){
    local name_user
    name_user="$(id -un)"
    if [ ! -f '/bin/bash' ] ; then
        echo 'Where is bash?'
        return 1
    fi
    sudo chsh -s '/bin/bash' "${name_user}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi

