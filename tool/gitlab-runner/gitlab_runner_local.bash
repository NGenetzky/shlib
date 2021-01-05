#!/usr/bin/env bash

usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]

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
  trap - SIGINT SIGTERM ERR EXIT
  # TODO: script cleanup here
}

setup_colors() {
  # shellcheck disable=SC2034
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_env(){
    CONFIG_FILE="${CONFIG_FILE-config.toml}"
    REGISTRATION_TOKEN="${REGISTRATION_TOKEN-}"
    RUNNER_NAME="${RUNNER_NAME-}"
    CI_SERVER_URL="${CI_SERVER_URL-https://gitlab.com/}"

    RUNNER_TAG_LIST="${RUNNER_TAG_LIST-shell}"

    RUNNER_BUILDS_DIR="${RUNNER_BUILDS_DIR-builds}"
    RUNNER_CACHE_DIR="${RUNNER_CACHE_DIR-cache}"

    # RUNNER_PRE_CLONE_SCRIPT="${RUNNER_PRE_CLONE_SCRIPT-}"
    # RUNNER_PRE_BUILD_SCRIPT="${RUNNER_PRE_BUILD_SCRIPT-}"
    # RUNNER_POST_BUILD_SCRIPT="${RUNNER_POST_BUILD_SCRIPT-}"

    RUNNER_EXECUTOR="${RUNNER_EXECUTOR-shell}"
}

parse_params() {
  # default values of variables set from params
  # flag=0
  # param=''

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    --no-color) NO_COLOR=1 ;;
    -r | --reqistration-token) REGISTRATION_TOKEN="${2-}" ; shift ;;
    # -p | --param) # example named parameter
    #   param="${2-}"
    #   shift
    #   ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  # args=("$@")

  # check required params and arguments
  [[ -z "${REGISTRATION_TOKEN-}" ]] && die "Missing required parameter: REGISTRATION_TOKEN"
  # [[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"

  if [ -z "${RUNNER_NAME-}" ]; then
    RUNNER_NAME="$(hostname)-${RUNNER_EXECUTOR}"
  fi

  export \
    CONFIG_FILE \
    REGISTRATION_TOKEN \
    RUNNER_BUILDS_DIR \
    RUNNER_CACHE_DIR \
    RUNNER_EXECUTOR \
    RUNNER_NAME \
    RUNNER_POST_BUILD_SCRIPT \
    RUNNER_PRE_BUILD_SCRIPT \
    RUNNER_PRE_CLONE_SCRIPT \
    RUNNER_TAG_LIST
  return 0
}


_sha1sum_check(){
  # _sha1sum_check 'sha1sum' 'filepath'
  echo "${1}  ${2}" | sha1sum --check --quiet
}

_gitlab_runner_download(){
  dest="${1-gitlab-runner}"
  version="13.7.0"
  sha1sum='41668a8c2e5414810129cb37f5ef94c588083fd2'

  if [ -x "$dest" ]; then
    return 0
  fi
  curl -L --output "$dest" \
    "https://gitlab-runner-downloads.s3.amazonaws.com/${version}/binaries/gitlab-runner-linux-amd64"
  chmod +x "${dest}"
  _sha1sum_check "${sha1sum}" "${dest}" || die 'FAILED sha1sum_check'
}

gitlab_runner_exec(){
    # --debug                      debug mode [$DEBUG]
    # --log-format value           Choose log format (options: runner, text, json) [$LOG_FORMAT]
    # --log-level value, -l value  Log level (options: debug, info, warn, error, fatal, panic) [$LOG_LEVEL]
    # --log-format 'text'
    # ./gitlab-runner \
    gitlab-runner \
        --log-level 'debug' \
        "$@"
}

gitlab_runner_run(){
  # --access-level="not_protected"
  # --debug-trace-disabled='true'
  gitlab_runner_exec register \
      --non-interactive \
      --run-untagged="false" \
      --locked='true' \
      --name "${RUNNER_NAME}" \
      --url "${CI_SERVER_URL}"
}


main(){
  parse_env
  parse_params "$@"
  setup_colors

  # _gitlab_runner_download "./gitlab-runner"
  gitlab_runner_run
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  set -Eeuo pipefail
  trap cleanup SIGINT SIGTERM ERR EXIT

  # shellcheck disable=SC2034
  SCRIPTDIR="$(CDPATH='' cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

  main "$@"
fi
