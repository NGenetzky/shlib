#!/bin/bash
apt install  ssh-import-id ssh
ssh-import-id gh:ngenetzky
service ssh start
