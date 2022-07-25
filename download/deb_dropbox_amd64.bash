#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

_FILE="dropbox_2020.03.04_amd64.deb"
_URL="https://www.dropbox.com/download?dl=packages/ubuntu/${_FILE}"
wget_download_dpkg_install "${_URL}" "${_FILE}"
