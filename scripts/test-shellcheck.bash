#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
GITROOT="$(readlink -f ${SCRIPTDIR}/../)"

main(){
  local args=$@
  (
    cd "${GITROOT}"
    local files="$(find * -iname '*.bash' -or -iname '*.sh')"
    shellcheck ${files}
  )
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    main "$@"
fi

