#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download_install_executable  \
	'https://download.xnview.com/XnView_MP.glibc2.17-x86_64.AppImage' \
	'XnView_MP.glibc2.17-x86_64.AppImage'
