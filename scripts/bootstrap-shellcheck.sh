#!/bin/sh
if ! command -v shellcheck > /dev/null ; then
    apt-get update && \
    apt-get install shellcheck
fi
