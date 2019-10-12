#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download_install_executable  \
	'https://github.com/robert7/nixnote2/releases/download/v2.1.4/NixNote2-x86_64.AppImage' \
	'NixNote2-x86_64.AppImage'
