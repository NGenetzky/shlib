#!/bin/bash
set -eu

ETCKEEPER_DEST="${ETCKEEPER_DEST-/etc}"
ETCKEEPER_REMOTE="${ETCKEEPER_REMOTE-https://github.com/ngenetzky/etckeeper-base-etc.git}"
ETCKEEPER_BRANCH_FROM="${ETCKEEPER_BRANCH_FROM-master}"
ETCKEEPER_GROUP="${ETCKEEPER_GROUP-adm}"

etckeeper_init(){
    if ! command -v git > /dev/null ; then
        if command -v apt-get > /dev/null ; then
            apt-get install -y git
        fi
    fi

    cd "${ETCKEEPER_DEST}/"

    if [ ! -w "${ETCKEEPER_DEST}/" ] ; then
        echo -e 'Etckeeper can not be initalized'
        return 1
    fi

    if [ ! -e "${ETCKEEPER_DEST}/.git/" ] ; then
        git init
        git remote add 'origin' "${ETCKEEPER_REMOTE}"
        git remote set-url --push 'origin' no_push
        git pull -q 'origin' "${ETCKEEPER_BRANCH_FROM}"

        HOST="$(hostname -f)"
        git checkout -b "host/${HOST}"
    fi

    git config --add 'core.sharedRepository' 'true'
    chgrp -R "${ETCKEEPER_GROUP}" "${ETCKEEPER_DEST}/.git"
    chmod -R g+rwX "${ETCKEEPER_DEST}/.git"
    chmod -R g+s "${ETCKEEPER_DEST}/.git"

    if ! command -v etckeeper > /dev/null ; then
        if command -v apt-get > /dev/null ; then
            apt-get install -y etckeeper
        else
            echo -e 'Etckeeper is not installed, skipping initial commit'
        fi
        return 0
    fi
    etckeeper commit -d "${ETCKEEPER_DEST}" -m 'etckeeper: Initial commit'
}

etckeeper_init
