#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download_dpkg_install  \
    'https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.02.14_amd64.deb' \
	'dropbox_2019.02.14_amd64.deb'
