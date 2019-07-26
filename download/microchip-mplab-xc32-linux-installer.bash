#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download  \
	'http://ww1.microchip.com/downloads/en/DeviceDoc/xc32-v2.15-full-install-linux-installer.run' \
	'xc32-v2.15-full-install-linux-installer.run'
