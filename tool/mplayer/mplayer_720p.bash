#!/bin/bash

mplayer_720p()
{
  mplayer tv:// -tv driver=v4l2:width=1280:height=720:device=/dev/video0 -fps 30 $@
  # mplayer tv:// -tv driver=v4l2:width=1280:height=720:device=/dev/video1 -fps 30 $@
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    set -x
    mplayer_720p "$@"
fi
