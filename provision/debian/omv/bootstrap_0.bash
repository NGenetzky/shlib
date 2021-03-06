#!/bin/bash
apt-get --quiet --yes update \
    && apt-get -y install --no-install-recommends \
        apt-utils \
        dialog \
        git \
        sudo \
    && git config --system \
        user.name 'Nathan Genetzky' \
    && git config --system \
        user.email 'nathan@genetzky.us' \
    && ( \
        cd /etc/ \
        && git init \
        && git remote add origin \
            'https://github.com/NGenetzky/etckeeper-base-etc' \
        && git pull 'origin' 'master' \
    ) \
    && apt-get -y install --no-install-recommends \
        etckeeper
