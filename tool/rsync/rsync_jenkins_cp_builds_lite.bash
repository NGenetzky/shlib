#!/bin/bash

rsync_jenkins_builds(){
  local src dest
  src="${1?}"
  shift
  dest="${1?}"
  shift

  # NOTE: We use trailing slash on both src and dest to keep consistent.
  # NOTE: Order of include/excludes is very very important
  # Mini rsync cheat-sheet:
  # --dry-run
  #  -a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
  # -u, --update                skip files that are newer on the receiver
  # -i, --itemize-changes       output a change-summary for all updates
  # -c, --checksum              skip based on checksum, not mod-time & size
  # --remove-source-files   sender removes synchronized files (non-dir
  rsync -aSu \
    "$@" \
    \
    --exclude ".*/" \
    \
    --include "*/" \
    \
    --include "config.xml" \
    --include "**builds/*/build.xml" \
    \
    --exclude "*" \
    \
    "${src}/" \
    "${dest}/"

    # --include "**builds/*/injectedEnvVars.txt" \
    # --include "**builds/*/log" \
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    rsync_jenkins_builds "$@"
fi

