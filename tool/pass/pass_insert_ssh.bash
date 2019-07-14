#!/bin/bash

ssh_key_notes()
{
    local f_ssh_priv f_ssh_pub
    f_ssh_priv="${1?f_ssh_priv}"
    f_ssh_pub="${f_ssh_priv}.pub"

    echo "${f_ssh_priv}"

    if [ -f "${f_ssh_pub}" ]; then
        echo
        echo "${f_ssh_pub}:"
        cat "${f_ssh_pub}"
    fi

    echo
    echo 'ssh fingerprint:'
    ssh-keygen -lv -f "${f_ssh_priv}"
}

pass_insert_ssh()
{
    local name f_ssh_priv f_ssh_pub pass_prefix
    name="${1?name}"
    f_ssh_priv="${2?f_ssh_priv}"
    f_ssh_pub="${f_ssh_priv}.pub"
    pass_prefix="ssh/${name}"

    [ -f "${f_ssh_priv}" ] || return 1
    [ -f "${f_ssh_pub}" ] || return 1

    ssh_key_notes "${f_ssh_priv}"
    pass insert --multiline \
        "${pass_prefix}/key" \
        < "${f_ssh_priv}"
    ssh_key_notes "${f_ssh_priv}" \
        | pass insert --multiline "${pass_prefix}/key.md"
    return 0
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    pass_insert_ssh "$@"
fi
