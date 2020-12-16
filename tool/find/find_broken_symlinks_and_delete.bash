#!/bin/bash

find_broken_symlinks(){
  local dir
  dir="${1?}"
  shift

  [ -d "${dir}" ] || return 1

  find "${dir}" -type l ! -exec test -e {} \; -print -delete
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    find_broken_symlinks "$@"
fi

