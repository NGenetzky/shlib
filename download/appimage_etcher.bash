#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download_install_executable  \
	'https://github.com/balena-io/etcher/releases/download/v1.5.51/balenaEtcher-1.5.51-x64.AppImage' \
	'balenaEtcher-1.5.51-x64.AppImage'
