#!/bin/sh

echo "before"

################################################################################
# singleton - Make sure this file is only included once
#
[ -n "${__UNIQUE_VARIABLE_NAME__-}" ] && return 0
readonly __UNIQUE_VARIABLE_NAME__=1
#
################################################################################

echo "after"
