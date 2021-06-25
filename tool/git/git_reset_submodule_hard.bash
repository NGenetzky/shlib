#!/bin/bash
# reference:
# https://www.systutorials.com/how-to-reset-all-submodules-in-git/

# https://gist.github.com/nicktoumpelis/11214362
git clean -xfd
git submodule foreach --recursive git clean -xfd
git reset --hard
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive

