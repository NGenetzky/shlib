#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download_dpkg_install  \
	'https://prerelease.keybase.io/keybase_amd64.deb' \
	'keybase_amd64.deb'
