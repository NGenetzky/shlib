#!/bin/bash

_slugify(){
    # oneohthree/quick-slugify.sh
    # https://gist.github.com/oneohthree/f528c7ae1e701ad990e6
    echo "${1}" | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr '[:upper:]' '[:lower:]'
}

dconf_dump_to_config()
{
    local _DEFAULT_DEST dest prefix0 prefix1 name f_name
    _DEFAULT_DEST="${HOME}/.config/dconf"
    dest="${1-${_DEFAULT_DEST}}"
    [ -d "${dest}" ] || (
        echo "Please create dest (${dest})"; return 1
    )

    dconf dump / > "${dest}/_.dconf"

    prefix0='/org/gnome/'
    prefix1='_org_gnome_'
    for name in $(dconf list ${prefix0}); do
        f_name="$(_slugify "${name}")"
        dconf dump "/org/gnome/${name}" \
            > "${dest}/${prefix1}${f_name}.dconf"
    done

    prefix0='/org/gnome/shell/extensions/'
    prefix1='_org_gnome_shell_extensions'
    for name in $(dconf list ${prefix0}); do
        f_name="$(_slugify "${name}")"
        dconf dump "/org/gnome/${name}" \
            > "${dest}/${prefix1}${f_name}.dconf"
    done
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    dconf_dump_to_config "$@"
fi
