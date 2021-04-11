#!/bin/bash

debian_install_hugo(){
    VERSION="${VERSION-latest}"
    VARIANT="${VARIANT-hugo_extended}"
    bindir='/usr/local/bin/'
    mkdir -p "${bindir}"

    apt-get update && apt-get install -y ca-certificates openssl git curl && \
        case "${VERSION}" in \
        latest) \
            VERSION=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep "tag_name" | awk '{print substr($2, 3, length($2)-4)}') ;;\
        esac && \
        wget -O "${VERSION}.tar.gz" "https://github.com/gohugoio/hugo/releases/download/v${VERSION}/${VARIANT}_${VERSION}_Linux-64bit.tar.gz" && \
        tar xf "${VERSION}.tar.gz" && \
        install -m 755 'hugo' "${bindir}/hugo"
}

sudo_required(){
    if [ "$(id -u)" -ne 0 ]; then
        echo -e 'Script must be run as root.'
        exit 1
    fi
}

_cleanup () {
    rm -rf "${_tmpdir}"
}

_tmpdir="$(mktemp -d)"
cd "${_tmpdir}"
trap _cleanup EXIT
set -e

sudo_required
debian_install_hugo
