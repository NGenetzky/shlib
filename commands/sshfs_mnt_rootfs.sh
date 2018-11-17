#!/bin/sh

sshfs_mnt_rootfs()
{
    ip=${1?'Specify the IP of the device'}
    mnt_path="/mnt/${ip?}/"

    # return success if already mounted.
    mountpoint -q "${mnt_path}" && return 0

    # Otherwise ensure the directory exists.
    [ -d "${mnt_path}" ] || sudo install -d -o "$(id -u)" -g "$(id -g)" "${mnt_path}"

    # and mount it.
    sshfs "root@${ip}:/" "${mnt_path}"
    return $?
}
