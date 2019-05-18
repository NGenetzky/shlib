#!/bin/bash

function ssh_copy_id_from_github () {
    local ghusername authkeys
    ghusername="${1?ghusername}"

    sshdir="${HOME?}/.ssh/"
    authkeys="${sshdir?}/authorized_keys"
    prevkeys="${sshdir}/authorized_keys.backup"
    ghkeyfile="${sshdir}/authorized_keys_github.${ghusername}.keys.pub"

    [ -d ${sshdir} ] || mkdir -m 700 -p "${sshdir}"
    [ -f ${authkeys} ] || touch "${authkeys}"
    chmod 600 "${authkeys}"

    curl -s "https://github.com/$ghusername.keys" > "${ghkeyfile}"

    cp -T "${authkeys?}" "${prevkeys?}"
    cat \
        "${prevkeys}" \
        "${ghkeyfile}" \
        | uniq \
        > "${authkeys?}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    set -x
    ssh_copy_id_from_github "$@"
fi

