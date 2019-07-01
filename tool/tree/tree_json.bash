#!/bin/bash

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
    tree_json "$@"
fi

