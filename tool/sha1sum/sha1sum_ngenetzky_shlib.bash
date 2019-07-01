#!/bin/bash

D_TOOLS="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

sha1sum_ngenetzky_shlib(){
    sed \
        '/_NGENETZKY_SHLIB_SHA1SUM/d' \
        < "${D_TOOLS}/_ngentzky_shlib.bash" \
        | sha1sum
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    sha1sum_ngenetzky_shlib "$@"
fi

