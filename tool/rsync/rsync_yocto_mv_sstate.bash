#!/bin/bash

rsync_yocto_mv_sstate(){
  local src dest
  src="${1?}"
  shift
  dest="${1?}"
  shift

  [ -d "${src}" ] || return 1

  # NOTE: We use trailing slash on both src and dest to keep consistent.
  # NOTE: Order of include/excludes is very very important
  # Mini rsync cheat-sheet:
  # --dry-run
  #  -a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
  # -u, --update                skip files that are newer on the receiver
  # -i, --itemize-changes       output a change-summary for all updates
  # -c, --checksum              skip based on checksum, not mod-time & size
  # --remove-source-files   sender removes synchronized files (non-dir
  # -L, --copy-links            transform symlink into referent file/dir
  # -H, --hard-links            preserve hard links
  rsync -aSuLH \
    "$@" \
    --remove-source-files \
    \
    --exclude ".*/" \
    \
    --include "*/" \
    \
    --include "sstate*.tgz" \
    --include "sstate*.tgz.siginfo" \
    \
    --exclude "*" \
    \
    "${src}/" \
    "${dest}/"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    rsync_yocto_mv_sstate "$@"
fi

