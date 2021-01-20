#!/bin/bash

ARG() {
    export "${@?}"
}

RUN() {
    "$@"
}

debian_useradd(){
    # Configuration for default non-root user.
    ARG USER_NAME='user'
    ARG USER_UID='1000'
    ARG USER_GID="$USER_UID"
    ARG USER_SHELL='/bin/bash'

    # 1. Create non-root user
    # 2. Setup directories for home user
    # 'bin' for XDG Base Directory Specification
    # https://www.freedesktop.org/software/systemd/man/file-hierarchy.html#Home%20Directory
    RUN printf "### Building image for user %s (%s:%s) ###" \
            "${USER_NAME}" \
            "${USER_UID}" \
            "${USER_GID}" && \
        groupadd --gid "${USER_GID}" \
            "${USER_NAME}" \
        && useradd --create-home --shell "${USER_SHELL}" \
            --uid "${USER_UID}" --gid "${USER_GID}" \
            "${USER_NAME}" && \
        install -d --mode 0755 --owner "${USER_UID}" --group "${USER_GID}" \
            "/home/${USER_NAME}/bin" \
            "/home/${USER_NAME}/.local/" \
            "/home/${USER_NAME}/.local/bin" \
            "/home/${USER_NAME}/.local/share" \
            /opt/Xilinx/
}

petalinux_2020_1(){
    ARG URL_SCRIPT='https://github.com/z4yx/petalinux-docker/blob/3f461257f91d4883ae99ccd9e186ad57620ee191/accept-eula.sh'
    ARG URL_PETA='http://127.0.0.1:8000/2020.1/petalinux-v2020.1-final-installer.run'

    RUN curl -o '/tmp/petalinux-installer.run' -# -SL "$URL_PETA" && \
        curl -o '/tmp/accept-eula.sh' -# -SL "$URL_SCRIPT" && \
        chmod a+rx '/tmp/petalinux-installer.run' && \
        chmod a+rx '/tmp/accept-eula.sh' && \
        cd /tmp && \
        '/tmp/accept-eula.sh' '/tmp/petalinux-installer.run' /opt/Xilinx/petalinux && \
        rm '/tmp/petalinux-installer.run' '/tmp/accept-eula.sh' && \
        rm -r /opt/Xilinx/petalinux/etc/license
}

declare -f \
    petalinux_2020_1 \
    debian_useradd
