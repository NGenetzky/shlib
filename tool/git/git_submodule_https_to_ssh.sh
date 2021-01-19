#!/bin/sh
#https://dhoeric.github.io/2017/https-to-ssh-in-gitmodules/
perl -i -p -e 's|https://(.*?)/|git@\1:|g' .gitmodules
