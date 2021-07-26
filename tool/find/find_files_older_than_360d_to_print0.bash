#!/bin/bash

find_old_files_for_rsync(){
  dir="${1?}"
  shift

  [ -d "${dir}" ] || return 1

  (
    cd  "${dir}" ;
    find "${dir}" -type f -mtime +360 -print0
  )
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Bash Strict Mode
  set -eu -o pipefail

  # set -x
  find_large_files "$@"
fi
