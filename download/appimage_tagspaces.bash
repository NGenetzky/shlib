#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download_install_executable  \
	'https://github.com/tagspaces/tagspaces/releases/download/v3.3.2/tagspaces-linux-x86_64-3.3.2.AppImage' \
	'tagspaces-linux-x86_64-3.3.2.AppImage'
