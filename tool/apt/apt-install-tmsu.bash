#!/bin/bash
set -eux
if command -v tmsu ; then
    exit 0
fi

sudo add-apt-repository ppa:tmsu/ppa && \
sudo apt-get update \
sudo apt install tmsu

