#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
GITROOT="$(readlink -f "${SCRIPTDIR}/../")"

main(){
  cd "${GITROOT}"
  find ./* \
    \( -iname '*.bash' -or -iname '*.sh' \) \
    -exec shellcheck "$@" {} +
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    main "$@"
fi
