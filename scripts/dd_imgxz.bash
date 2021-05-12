#!/bin/bash
_xz_decompress_to_stdout(){
    # Usage: xz [OPTION]... [FILE]...
    # Compress or decompress FILEs in the .xz format.
    #
    #   -d, --decompress    force decompression
    #   -c, --stdout        write to standard output and don't delete input files

    # xz --decompress --stdout "$1"
    xz --decompress --stdout "$1"
}

_xz_decompress_to_stdout

dd_imgxz(){
  input_if="${1}"
  input_of="${2}"

  set -x

  # Check sanity
  [ -f "${input_if}" ] || return 1
  [ -e "${input_of}" ] || return 1

  _xz_decompress_to_stdout "${input_if}" | dd bs=1M of="${input_of}"
}

set -eu -o pipefail
dd_imgxz "$@"
