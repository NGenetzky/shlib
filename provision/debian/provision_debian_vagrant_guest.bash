#!/bin/bash

sudo_required(){
    if [ "$(id -u)" -ne 0 ]; then
        echo -e 'Script must be run as root.'
        exit 1
    fi
}

provision_debian_vagrant_guest(){
    # https://unix.stackexchange.com/questions/222427/how-to-create-custom-vagrant-box-from-libvirt-kvm-instance
    apt-get install -y openssh-server sudo

    USER_NAME='vagrant'
    # Create non-root user and give them sudo with nopasswd.
    if ! id 'vagrant' &>/dev/null; then
        useradd --create-home "${USER_NAME}"
    fi
    # Add sudo support for the non-root user
    echo "$USER_NAME ALL=(root) NOPASSWD:ALL" > "/etc/sudoers.d/$USER_NAME"
    chmod 0440 "/etc/sudoers.d/$USER_NAME"

    install -d -o vagrant -g vagrant -m 0700 '/home/vagrant/.ssh'
    wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' \
        -O '/tmp/authorized_keys_vagrant'
    install -o vagrant -g vagrant -m 0600 -T '/tmp/authorized_keys_vagrant' '/home/vagrant/.ssh/authorized_keys'
    rm '/tmp/authorized_keys_vagrant'

    sed \
        -e 's|#PasswordAuthentication yes|PasswordAuthentication no|' \
        -e 's|#PermitEmptyPasswords no|PermitEmptyPasswords yes|' \
        '/etc/ssh/sshd_config'
}

sudo_required
provision_debian_vagrant_guest
