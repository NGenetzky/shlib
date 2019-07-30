#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download_dpkg_install  \
	'https://github.com/Ulauncher/Ulauncher/releases/download/4.4.0.r1/ulauncher_4.4.0.r1_all.deb' \
	'ulauncher_4.4.0.r1_all.deb'
