#!/bin/bash
#
# Example usage:
#
# D_TOOLS="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# # shellcheck source=tools/_ngentzky_shlib.bash
# source "${D_TOOLS}/_ngentzky_shlib.bash"
# 
# Metadata
# https://github.com/NGenetzky/shlib
# https://github.com/NGenetzky/shlib/tree/5de674b48b2d7d64e1349be5617067c7c060d679
_NGENETZKY_SHLIB='https://github.com/NGenetzky/shlib'
_NGENETZKY_SHLIB_COMMIT='5de674b48b2d7d64e1349be5617067c7c060d679'
_NGENETZKY_SHLIB_SHA1SUM='da39a3ee5e6b4b0d3255bfef95601890afd80709'

_ngenetzky_shlib_main(){
    printf '{"url": "%s","commit":"%s","sha1sum":"%s"}\n' \
        "${_NGENETZKY_SHLIB}" \
        "${_NGENETZKY_SHLIB_COMMIT}" \
        "${_NGENETZKY_SHLIB_SHA1SUM}"
}

# https://github.com/NGenetzky/shlib/blob/5de674b48b2d7d64e1349be5617067c7c060d679/tool/tree/tree_json.bash
tree_json(){
  local path
  path="${1?}"
  tree -J \
    -sD \
    --timefmt "%Y-%m-%dT%H:%M:%S" \
    "${path}" \
    | jq --sort-keys --tab .
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    _ngenetzky_shlib_main "$@"
fi
