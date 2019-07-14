#!/bin/bash
SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"
echo "$(hostname):$(pwd)" > "${SCRIPTDIR}/.dir"

