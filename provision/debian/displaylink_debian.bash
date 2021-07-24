#!/bin/bash
set -eu

if [ ! -d /usr/local/src/displaylink-debian ] ; then
	mkdir -p /usr/local/src/
	git clone https://github.com/AdnanHodzic/displaylink-debian.git /usr/local/src/displaylink-debian
fi

cd /usr/local/src/displaylink-debian
./displaylink-debian.sh "$@"
