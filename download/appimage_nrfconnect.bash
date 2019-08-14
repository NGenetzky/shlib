#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

# https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Connect-for-desktop/Download
wget_download_install_executable  \
	'https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-Connect-for-Desktop/3-0-0/nrfconnect300x8664.AppImage' \
	'nrfconnect300x8664.AppImage'
