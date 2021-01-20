#!/usr/bin/env sh

usage() {
  PROGNAME="${PROGNAME-$0}"
  cat <<EOF
Usage: ${PROGNAME} [-h] [-v] [-f] -p param_value arg1 [arg2...]

Script description here.

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
-f, --flag      Some flag description
-p, --param     Some param description
EOF
  exit
}

cleanup() {
  trap - INT TERM EXIT
  # TODO: script cleanup here
}

setup_colors() {
  # shellcheck disable=SC2034
  if [ -t 2 ] && [ -z "${NO_COLOR-}" ] && [ "${TERM-}" != "dumb" ]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 "${1-}"
}

die() {
  msg=$1
  code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params
  flag=0
  param=''

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    --no-color) NO_COLOR=1 ;;
    -f | --flag) flag=1 ;; # example flag
    -p | --param) # example named parameter
      param="${2-}"
      shift
      ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  # check required params and arguments
  [ -z "${param-}" ] && die "Missing required parameter: param"
  [ $# -eq 0 ] && die "Missing script arguments"

  return 0
}

main(){
  parse_params "$@"
  setup_colors

  # TODO: script logic here

  msg "${RED}Read parameters:${NOFORMAT}"
  msg "- flag: ${flag}"
  msg "- param: ${param}"
  msg "- arguments: $*"
}

# POSIX-compliant way to detect if sourced.
# https://stackoverflow.com/a/28776166/9347520
_SCRIPT_EXECUTED=0
if [ -n "$ZSH_EVAL_CONTEXT" ]; then
  case $ZSH_EVAL_CONTEXT in *:file) _SCRIPT_EXECUTED=1;; esac
elif [ -n "$BASH_VERSION" ]; then
  (return 0 2>/dev/null) && _SCRIPT_EXECUTED=1
else # All other shells: examine $0 for known shell binary filenames
  # Detects `sh` and `dash`; add additional shell filenames as needed.
  case ${0##*/} in sh|dash) _SCRIPT_EXECUTED=1;; esac
fi

if [ "${_SCRIPT_EXECUTED}" ]; then
  # Posix Strict Mode
  set -eu
  trap cleanup INT TERM EXIT

  # shellcheck disable=SC2034
  SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd -P)"

  main "$@"
fi
