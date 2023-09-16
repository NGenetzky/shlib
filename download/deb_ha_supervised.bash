#!/bin/bash
# vim: syntax=sh ts=4 sw=4 sts=4 sr noet

install_ha(){
    PV="1.4.3"
    # PV="1.5.0" # bug with systemd-resolved and docker-ce
    ARCH="aarch64"
    wget_download_dpkg_install  \
        "https://github.com/home-assistant/supervised-installer/releases/download/${PV}/homeassistant-supervised.deb" \
        "homeassistant-supervised_${PV}.deb"
}

# Bash Strict Mode
set -eu -o pipefail

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

set -x
install_ha

