#!/bin/bash
# NOTE: Copy this script into /lib/udev/ and then add the following lines to a rule.
#
# KERNEL=="sd[a-z][0-9]", SUBSYSTEMS=="usb", ACTION=="add", RUN+="udev_mount_drive.bash"
# KERNEL=="sd[a-z][0-9]", SUBSYSTEMS=="usb", ACTION=="remove", RUN+="udev_mount_drive.bash"

do_mount() {
    # Figure out a mount point to use

    if [ -n "${ID_FS_LABEL-}" ]; then
        MOUNT_POINT="/media/${ID_FS_LABEL-}"
    else
        exit 1 # TODO
    fi
    /bin/mkdir -p "${MOUNT_POINT}"

    # Global mount options
    OPTS="rw,relatime"

    # File system type specific mount options
    if [ "${ID_FS_TYPE-}" == "vfat" ]; then
        OPTS+=",gid=100,umask=000"
    fi

    if ! /bin/mount -o ${OPTS} "${DEVNAME}" "${MOUNT_POINT}"; then
        # Error during mount process: cleanup mountpoint
        /bin/rmdir ${MOUNT_POINT}
        exit 1
    fi
}

do_unmount()
{
    if [ -n "${DEVNAME}" ] ; then
        exit 1
    fi
    /bin/umount "${DEVNAME}"

    # Delete all empty dirs in /media that aren't being used as mount points.
    for f in /media/* ; do
        if [[ -n $(/usr/bin/find "$f" -maxdepth 0 -type d -empty) ]]; then
            if ! /bin/grep -q " $f " /etc/mtab; then
                /bin/rmdir "$f"
            fi
        fi
    done
}

setup_logging(){
    # Enable debugging if no terminal allocated
    if [ -t 2 ] ; then
        return
    fi

    _prefix0="$(date +%s)_"

    logprefix="${TMPDIR-/tmp/}/${_prefix0}"
    exec > "${logprefix}stdout.log"
    exec 2> "${logprefix}stderr.log"
    env > "${logprefix}env.sh"
}

setup_logging
case "${ACTION}" in
    add) do_mount ;;
    remove) do_unmount ;;
    *) exit 1 ;;
esac
