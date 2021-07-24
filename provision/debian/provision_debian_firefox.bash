#!/bin/bash

#NOTE: Uninstall with:

rm -f /etc/apt/preferences.d/99pin-unstable /etc/apt/sources.list.d/unstable.list
apt -y update
exit 0
################################################################################

cat << EOF > /etc/apt/sources.list.d/unstable.list
deb http://deb.debian.org/debian/ unstable main contrib non-free
EOF

cat << EOF > /etc/apt/preferences.d/99pin-unstable
Package: *
Pin: release a=stable
Pin-Priority: 1001

Package: *
Pin release a=unstable
Pin-Priority: -1
EOF

apt -y update
apt install --no-install-recommends -t unstable firefox
