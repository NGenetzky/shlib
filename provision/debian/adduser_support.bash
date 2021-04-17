#!/bin/bash

sudo_required(){
    if [ "$(id -u)" -ne 0 ]; then
        echo -e 'Script must be run as root.'
        exit 1
    fi
}

adduser_support(){
    # https://unix.stackexchange.com/questions/222427/how-to-create-custom-vagrant-box-from-libvirt-kvm-instance
    apt-get install -y openssh-server sudo

    USER_NAME='support'
    # Create non-root user and give them sudo with nopasswd.
    if ! id 'support' &>/dev/null; then
        useradd --create-home "${USER_NAME}"
    fi
    # Add sudo support for the non-root user
    echo "$USER_NAME ALL=(root) NOPASSWD:ALL" > "/etc/sudoers.d/$USER_NAME"
    chmod 0440 "/etc/sudoers.d/$USER_NAME"

    install -d -o support -g support -m 0700 '/home/support/.ssh'

    sed -i \
        -e 's|#PasswordAuthentication yes|PasswordAuthentication no|' \
        -e 's|#PermitEmptyPasswords no|PermitEmptyPasswords yes|' \
        '/etc/ssh/sshd_config'
}


sudo_required
adduser_support
