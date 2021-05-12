#!/bin/bash

cloud_init_etc_hosts_is_managed(){
  grep -q 'manage_etc_hosts' /etc/hosts
}
