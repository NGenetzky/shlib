#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download  \
	'ww1.microchip.com/downloads/en/DeviceDoc/MPLABX-v5.10-linux-installer.tar' \
	'MPLABX-v5.10-linux-installer.tar'
