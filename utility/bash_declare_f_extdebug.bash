#!/bin/bash

bash_declare_f_extdebug()
{
    # https://superuser.com/a/974066
    # https://www.tldp.org/LDP/abs/html/declareref.html

    # Turn on extended shell debugging
    shopt -s extdebug
    # Display the function’s name, line number and fully qualified source file
    declare -F "${1?'Specify name of function'}"
    # Turn off extended shell debugging
    shopt -u extdebug
}
#!/bin/bash

_main(){
    local func="${1-bash_declare_f_extdebug}"
    bash_declare_f_extdebug "${func}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    _main "$@"
fi

