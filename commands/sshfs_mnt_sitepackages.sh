#!/bin/sh

sshfs_mnt_sitepackages()
{
    local ip=${1?'Specify the IP of the device'}
    local mnt_path="/mnt/site-packages-${ip?}/"

    # return success if already mounted.
    mountpoint -q "${mnt_path}" && return 0

    # Otherwise ensure the directory exists.
    [ -d "${mnt_path}" ] || sudo install -d -o "$(id -u)" -g "$(id -g)" "${mnt_path}"

    # and mount it.
    sshfs "root@${ip}:/usr/lib/python2.7/site-packages/" "${mnt_path}"
    return $?
}

