#!/bin/sh

set -eu

git --version
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git -y
git --version
