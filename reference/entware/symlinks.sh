#!/bin/sh
if [[ -f /sbin/ifconfig && ! -f /opt/sbin/ifconfig ]]; then
    ln -s /sbin/ifconfig /opt/sbin/ifconfig
fi
if [[ -f /sbin/route && ! -f /opt/sbin/route ]]; then
    ln -s /sbin/route /opt/sbin/route
fi
if [[ -f /sbin/ip && ! -f /opt/sbin/ip ]]; then
    ln -s /sbin/ip /opt/sbin/ip
fi
if [[ -f /bin/netstat && ! -f /opt/bin/netstat ]]; then
    ln -s /bin/netstat /opt/bin/netstat
fi
if [[ ! -f /opt/bin/sh ]]; then
    ln -s /bin/sh /opt/bin/sh
fi
if [[ ! -f /opt/bin/ash ]]; then
    ln -s /bin/ash /opt/bin/ash
fi
# now try create symlinks - it is a std installation
if [ -f /etc/passwd ]
then
    ln -sf /etc/passwd /opt/etc/passwd
fi
if [ -f /etc/group ]
then
    ln -sf /etc/group /opt/etc/group
fi
if [ -f /etc/shells ]
then
    ln -sf /etc/shells /opt/etc/shells
fi
if [ -f /etc/shadow ]
then
    ln -sf /etc/shadow /opt/etc/shadow
fi
if [ -f /etc/gshadow ]
then
    ln -sf /etc/gshadow /opt/etc/gshadow
fi
if [ -f /etc/localtime ]
then
    ln -sf /etc/localtime /opt/etc/localtime
fi
