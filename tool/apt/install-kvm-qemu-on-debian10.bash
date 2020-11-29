#!/bin/bash
# https://computingforgeeks.com/how-to-install-kvm-virtualization-on-debian/
sudo apt -y install \
	qemu-kvm libvirt-daemon bridge-utils virtinst libvirt-daemon-system \
	virt-top libguestfs-tools libosinfo-bin qemu-system
#virt-manager

# For remote management via ssh:
sudo apt -y install netcat-openbsd
