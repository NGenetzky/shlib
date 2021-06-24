#!/bin/bash


# source:
# - https://askubuntu.com/a/513399
# - https://ubuntulife.wordpress.com/2009/11/13/tip-como-saber-que-paquete-de-software-esta-usando-mas-espacio/
dpkg_query_big_packages(){
  dpkg-query --show --showformat='${Package;-50}\t${Installed-Size}\n' \
  | sort -k 2 -n \
  | grep -v deinstall \
  | awk '{printf "%.3f MB \t %s\n", $2/(1024), $1}'
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    dpkg_query_big_packages "$@"
fi
