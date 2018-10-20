#!/bin/bash
chown_mine(){
  sudo chown "$(id -u):$(id -g)"
}
