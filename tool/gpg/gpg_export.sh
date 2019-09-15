#!/bin/sh

gpg_export(){
    ID="${1?}"
    EMAIL="${2?}"

    gpg -a --export \
        --output "${ID}.public_gpg.key" \
        "${EMAIL}"
    gpg -a --export-secret-keys \
        --output "${ID}.secret_gpg.key" \
        "${EMAIL}"
}

gpg_export "$@"
