#!/bin/bash
# Examples:
# mplayer tv:// -tv driver=v4l2:width=1280:height=720:device=/dev/video0 -fps 30 -frames 1 -vo png

mplayer_tv_v4l2(){
  local w="${1?}"
  local h="${2?}"
  echo "driver=v4l2:width=${w}:height=${h}:device=/dev/video0"
}

mplayer_test(){
  local name="${1?}"

  mplayer tv:// -tv "$(mplayer_tv_v4l2 1280 720)" -fps 30 \
    -frames 1 -vo "png:outdir=./${name}:prefix=1080p--"

  mplayer tv:// -tv "$(mplayer_tv_v4l2 1280 720)" -fps 30 \
    -frames 1 -vo "png:outdir=./${name}:prefix=720p_--"

  mplayer tv:// -tv "$(mplayer_tv_v4l2 704 576)" -fps 30 \
    -frames 1 -vo "png:outdir=./${name}:prefix=4CIF_704x576--"

  mplayer tv:// -tv "$(mplayer_tv_v4l2 640 480)" -fps 30 \
    -frames 1 -vo "png:outdir=./${name}:prefix=480p--"

  mplayer tv:// -tv "$(mplayer_tv_v4l2 480 360)" -fps 30 \
    -frames 1 -vo "png:outdir=./${name}:prefix=360p--"

  mplayer tv:// -tv "$(mplayer_tv_v4l2 352 288)" -fps 30 \
    -frames 1 -vo "png:outdir=./${name}:prefix=CIF_352x288--"

  mplayer tv:// -tv "$(mplayer_tv_v4l2 352 240)" -fps 30 \
    -frames 1 -vo "png:outdir=./${name}:prefix=240p--"
}

main()
{
  mplayer_test "${1?}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    set -x
    main "$@"
fi
