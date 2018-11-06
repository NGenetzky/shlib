#!/bin/sh

# https://gist.github.com/douglas/1287372
# JamesSwift commented on Oct 28, 2017
# Based on git-recursive-fetch, original:
# find . -name .git -type d | xargs -n1 -P4 -I% git --git-dir=% --work-tree=%/.. fetch --all --recurse-submodules

find . -name .git -type d | xargs --verbose -n1 -I% git --git-dir=% --work-tree=%/.. status
