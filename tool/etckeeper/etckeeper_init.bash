#!/bin/bash
set -eu

ETCKEEPER_DEST="${ETCKEEPER_DEST-/etc}"
ETCKEEPER_REMOTE="${ETCKEEPER_REMOTE-https://github.com/NGenetzky/etckeeper-base-etc}"
ETCKEEPER_BRANCH_FROM="${ETCKEEPER_BRANCH_FROM-master}"
ETCKEEPER_GROUP="${ETCKEEPER_GROUP-adm}"

etckeeper_init(){
    if [ -e "${ETCKEEPER_DEST}/.git/" ] ; then
        echo -e 'Etckeeper is already initalized'
        return 0
    fi
    if [ ! -w "${ETCKEEPER_DEST}/" ] ; then
        echo -e 'Etckeeper can not be initalized'
        return 1
    fi

    cd "${ETCKEEPER_DEST}/"
    git init
    git remote add 'origin' "${ETCKEEPER_REMOTE}"
    git remote set-url --push 'origin' no_push
    git pull -q 'origin' "${ETCKEEPER_BRANCH_FROM}"

    HOST="$(hostname -f)"
    git checkout -b "host/${HOST}"

    cd "${ETCKEEPER_DEST}/" || return 1
    git config --add 'core.sharedRepository' 'true'
    chgrp -R "${ETCKEEPER_GROUP}" "${ETCKEEPER_DEST}/.git/"
    chmod -R g+wX "${ETCKEEPER_DEST}/.git/"

    if ! command -v etckeeper > /dev/null ; then
        echo -e 'Etckeeper is not installed, skipping initial commit'
        return 0
    fi
    etckeeper commit -d "${ETCKEEPER_DEST}" -m 'etckeeper: Initial commit'
}

etckeeper_init
