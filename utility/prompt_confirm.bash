#!/bin/bash

PROMPT_CONFIRM="${PROMPT_CONFIRM-}"

prompt_confirm() {
    case "$PROMPT_CONFIRM" in
        *n*) return 1 ;;
        *y*) return 0 ;;
    esac

    if ! [ -t 0 ] ; then
        return 0
    fi

    while true; do
        read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
        case $REPLY in
            [yY]) echo ; return 0 ;;
            [nN]) echo ; return 1 ;;
            *) printf " \033[31m %s \n\033[0m" "invalid input"
        esac
    done
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    _test(){
        set -x

        if prompt_confirm 'Do you want to forceably remove root filesystem?' ; then
            printf " \033[31m %s \n\033[0m" 'You choose poorly.'
        fi

        PROMPT_CONFIRM='y'
        if prompt_confirm 'do you want me to do a quick harmless command?' ; then
            echo 'Already done'
        fi
        return 0
    }

    _test "$@"
fi
