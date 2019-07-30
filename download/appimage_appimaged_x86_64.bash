#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download  \
    'https://github.com/AppImage/appimaged/releases/download/continuous/appimaged-x86_64.AppImage' \
	'appimaged-x86_64.AppImage'
