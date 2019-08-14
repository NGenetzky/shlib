#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

# https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Command-Line-Tools/Download
wget_download  \
	'https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/nRFCommandLineTools1030Linuxamd64tar.gz' \
	'nRFCommandLineTools1030Linuxamd64tar.gz'
