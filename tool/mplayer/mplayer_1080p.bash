#!/bin/bash

mplayer_1080p()
{
  mplayer tv:// -tv driver=v4l2:width=1920:height=1080:device=/dev/video0 $@
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    set -x
    mplayer_1080p "$@"
fi
