#!/bin/bash
#https://github.com/Xpra-org/xpra/wiki/Download
APT_KEY='https://xpra.org/gpg.asc'
REPOFILE='https://xpra.org/repos/focal/xpra.list'

apt install ca-certificates
wget -q "${APT_KEY}" -O- | sudo apt-key add -
cd /etc/apt/sources.list.d
wget "$REPOFILE" -O '/etc/apt/sources.list.d/xpra.list'
apt -yq update
apt install --no-install-recommends xpra
