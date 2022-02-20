#!/bin/bash

grml_debootstrap(){
    # NOTE: These commands were used to prepare the partitions
    # mkfs.fat -F 32 /dev/nvme0n1p6
    # lvcreate --name lv_mew --size 200G vg_mew0

    # NOTE: these options are also usable via debian2hd
    grub='/dev/nvme0n1'
    password=genetzky
    release=bullseye
    target='/dev/mapper/vg_mew0-lv_mew'

    exec grml-debootstrap \
        --contrib \
        --defaultinterfaces \
        --efi '/dev/nvme0n1p6' \
        --grub "${grub}" \
        --hostname 'mew' \
        --non-free \
        --password "$password" \
        --release "$release" \
        --sshcopyauth \
        --target "${target}" \
        --verbose
}

grml_debootstrap "$@"

################################################################################
# NOTES
# --non-free
# --bootappend appendline-for-the-kernel
# --packages=/path/to/pkg.lst . . . 
# --nodebootstrap # Skip debootstrap, only do configuration to the target.
