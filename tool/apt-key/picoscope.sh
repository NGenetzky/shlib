#!/bin/sh

wget -O - https://labs.picotech.com/Release.gpg.key | sudo apt-key add -
udo bash -c 'echo "deb https://labs.picotech.com/rc/picoscope7/debian/ picoscope main" >/etc/apt/sources.list.d/picoscope7.list'
sudo apt-get update
sudo apt-get install picoscope
