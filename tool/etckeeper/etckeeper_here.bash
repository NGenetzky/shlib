#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

etckeeper_here(){
    local command
    command="${1?}"
    shift
    etckeeper "${command}" \
        -d "${SCRIPTDIR}" \
        "$*"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    etckeeper_here "$@"
fi

