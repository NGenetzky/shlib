#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

main(){
  local args="$*"
  echo "${args} inside of ${SCRIPTDIR}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi

