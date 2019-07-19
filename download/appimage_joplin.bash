#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download_install_executable  \
	'https://github.com/laurent22/joplin/releases/download/v1.0.160/Joplin-1.0.160-x86_64.AppImage' \
	'Joplin-1.0.160-x86_64.AppImage'
