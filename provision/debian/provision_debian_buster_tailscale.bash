#!/bin/sh

#https://www.tailscale.com/download/linux/debian-buster
#curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.gpg | sudo apt-key add -
#curl -fsSL https://pkgs.tailscale.com/stable/debian/buster.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo apt-get update && sudo apt-get install tailscale
sudo tailscale up
