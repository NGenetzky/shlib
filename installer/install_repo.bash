#!/bin/bash
BINDIR="$HOME/.local/bin"
curl -k https://storage.googleapis.com/git-repo-downloads/repo \
    > "${BINDIR}/repo"
chmod a+x "${BINDIR}/repo"
