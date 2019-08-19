#!/bin/bash
github_close_all_for_user() {
    local user
    user="${1?}"
    curl -sL "https://api.github.com/users/${user}/repos?per_page=1000" \
        | jq -r '.[]|.clone_url' \
        | xargs -L1 git clone
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    github_close_all_for_user "$@"
fi
