#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

# License Agreement must be accepted
xdg-open 'https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb'
