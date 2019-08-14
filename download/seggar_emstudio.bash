#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download  \
	'https://www.segger.com/downloads/embedded-studio/EmbeddedStudio_ARM_Linux_x64' \
	'EmbeddedStudio_ARM_Linux_x64.tar.gz'
