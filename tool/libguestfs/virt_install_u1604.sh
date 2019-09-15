#!/bin/sh

virt_install_u1604()
{
	name="${1?}"
	#--dry-run --print-xml
	virt-install \
		--name "${name}" \
		--disk "path=/data/ngenetzky/${name},size=15" \
		--ram '4096' --vcpus '2' \
		--os-type 'linux' --os-variant 'ubuntu16.04' \
		--network 'bridge=virbr0' \
		--graphics 'none' \
		--console 'pty,target_type=serial' \
		--location 'http://us.archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/' \
		--extra-args 'console=ttyS0,115200n8 serial'
}

virt_install_u1604 "ubuntu-16"
