#!/bin/bash

ssh_import_id_and_start_ssh(){
    _SSH_IMPORT_ID_USER='gh:ngenetzky'
    SSH_IMPORT_ID_USER="${SSH_IMPORT_ID_USER-${_SSH_IMPORT_ID_USER}}"

    if command -v sudo > /dev/null ; then
        sudo apt update && sudo apt install -y ssh-import-id ssh
        ssh-import-id gh:ngenetzky
        sudo service ssh start
    else
        apt update && apt install --yes ssh-import-id ssh
        ssh-import-id gh:ngenetzky
        service ssh start
    fi
}

set -eu
ssh_import_id_and_start_ssh
