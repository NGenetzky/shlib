#!/bin/sh

virt_builder_fedora27()
{
	echo "notsecure" >  './fedora-27.password.key'
	virt-builder fedora-27 \
		-v -x \
		--root-password 'file:./fedora-27.password.key' \
		--install 'vim-nox' \
		--selinux-relabel
}

virt_install_fedora27()
{
	virt-install --import \
		--name 'fedora-27' \
		--ram '2048' \
		--disk 'path=fedora-27.img,format=raw' \
		--os-variant 'fedora27'
}

virt_builder_fedora27
virt_install_fedora27
