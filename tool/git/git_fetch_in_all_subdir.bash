#!/bin/bash

git_fetch_in_all_subdir()
{
  # https://gist.github.com/douglas/1287372
  # JamesSwift commented on Oct 28, 2017
  find . -name .git -type d | xargs -n1 -P4 -I% git --git-dir=% --work-tree=%/.. fetch --all --recurse-submodules
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    set -x
    git_fetch_in_all_subdir "$@"
fi
