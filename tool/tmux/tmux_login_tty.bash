#!/bin/bash

TMUX_GROUP='user'
TMUX_OPTS=''
TMUX_SESSION='user'
TMUX_SHELL='/bin/bash'
TMUX_CMD=''

tmux_login_tty(){
    if ! tmux has-session -t "${TMUX_GROUP}" 2> /dev/null ; then
            tmux new-session -d -s "${TMUX_GROUP}" -n "${TMUX_GROUP}" ${TMUX_CMD}
    fi

    TMUX_TTY="$(tty)"
    TMUX_SESSION="$(basename ${TMUX_TTY})"

    case "${TMUX_TTY}" in
        #/dev/ttyS0) TMUX_OPTS="-r" ;;
        #/dev/tty1) TMUX_OPTS="-r" ;;
        #/dev/pts/1) TMUX_OPTS="-r" ;;
        /dev/tty*|/dev/tty*|/dev/pts/*) TMUX_OPTS="" ;;
        *) ;; # TODO: warn
    esac

    if ! tmux has-session -t "${TMUX_SESSION}" 2> /dev/null ; then
            tmux new-session -d -t "${TMUX_GROUP}" -s "${TMUX_SESSION}"
            tmux new-window -n "${TMUX_SESSION}" ${TMUX_CMD}
    fi

    exec tmux -2 attach ${TMUX_OPTS} -t "${TMUX_SESSION}"
}

if [ -z "${TMUX-}" ] ; then
    tmux_login_tty
elif [ -n "${TMUX_SHELL}" ] ; then
    exec "${TMUX_SHELL}"
fi
