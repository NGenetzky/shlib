#!/bin/bash

python_get_pip(){
    local py_ver exec_pip exec_python
    py_ver="${1-default}"
    case ${py_ver} in
    2)
        exec_pip='pip2'
        exec_python='python2'
        ;;
    3)
        exec_pip='pip3'
        exec_python='python3'
        ;;
    default)
        exec_pip='pip'
        exec_python='python'
        ;;
    *)
        echo "Invalid py_ver ($py_ver)"
        return 1
        ;;
    esac

    if command -v "{$exec_pip}" > /dev/null ; then
        return 0
    fi
    curl 'https://bootstrap.pypa.io/get-pip.py' -o '/tmp/get-pip.py'
    "${exec_python}" '/tmp/get-pip.py' --user
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    python_get_pip "$@"
fi
