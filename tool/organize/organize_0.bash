#!/bin/bash
_THIS_SCRIPT="$0"
_THIS_CONFIG="${_THIS_SCRIPT%.bash}.yaml"
exec organize "$@" "${_THIS_CONFIG}"
