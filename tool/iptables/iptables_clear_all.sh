#!/bin/sh
# http://wiki.loovsys.eu/index.php/Clear_all_iptable_rules_and_allow_everything

iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

