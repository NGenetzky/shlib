#!/bin/bash
set -eu

export LANG=C.UTF-8
export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none

if [ ! -f "/etc/apt/trusted.gpg.d/openmediavault-archive-keyring.asc" ]; then
    wget -O "/etc/apt/trusted.gpg.d/openmediavault-archive-keyring.asc" https://packages.openmediavault.org/public/archive.key
    apt-key add "/etc/apt/trusted.gpg.d/openmediavault-archive-keyring.asc"
fi
apt-get update
apt-get --yes --auto-remove --show-upgraded \
    --allow-downgrades --allow-change-held-packages \
    --no-install-recommends \
    --option Dpkg::Options::="--force-confdef" \
    --option DPkg::Options::="--force-confold" \
    install openmediavault-keyring openmediavault


# Populate the database.
omv-confdbadm populate


# Display the login information.
cat /etc/issue
