#!/bin/bash
# vim: syntax=sh ts=4 sw=4 sts=4 sr noet

install_ha(){
    if gdbus introspect --system --dest io.hass.os --object-path /io/hass/os ; then
        return 0
    fi

    PV="1.6.0"
    ARCH="aarch64"
    wget_download_dpkg_install  \
        "https://github.com/home-assistant/os-agent/releases/download/${PV}/os-agent_${PV}_linux_${ARCH}.deb" \
        "os-agent_${PV}_linux_${ARCH}.deb"
}

# Bash Strict Mode
set -eu -o pipefail

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

set -x
install_ha

