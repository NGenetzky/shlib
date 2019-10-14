#!/bin/bash

SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
# shellcheck source=download/_download.bash
source "${SCRIPTDIR}/_download.bash"

# Bash Strict Mode
set -eu -o pipefail

VERSION='1.0.169'
wget_download_install_executable  \
	"https://github.com/laurent22/joplin/releases/download/v${VERSION}/Joplin-${VERSION}-x86_64.AppImage" \
	"Joplin-${VERSION}-x86_64.AppImage"
