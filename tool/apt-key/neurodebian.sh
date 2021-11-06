#!/bin/bash

# 14.04 "trusty"
# wget -O- http://neuro.debian.net/lists/trusty.us-tn.full | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list
# sudo apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9

# 14.04 "trusty"
# wget -O- http://neuro.debian.net/lists/trusty.us-nh.full | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list
# sudo apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9

# debian10
wget -O- http://neuro.debian.net/lists/buster.us-tn.full | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list
sudo apt-key adv --recv-keys --keyserver hkps://keyserver.ubuntu.com 0xA5D32F012649A5A9

sudo apt-get update
