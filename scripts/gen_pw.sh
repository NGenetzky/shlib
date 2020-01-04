#!/bin/sh
pw=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c50) && echo "$pw"
