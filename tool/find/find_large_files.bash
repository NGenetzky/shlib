#!/bin/bash

find_large_files(){
  local dir
  dir="${1?}"
  shift

  [ -d "${dir}" ] || return 1

  find "${dir}" -type f -size +50M -exec du -h {} \; | sort -n
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    find_large_files "$@"
fi
