#!/usr/bin/env pythong
# usage: `yaml_to_python.py < file.yaml > file.json`
#
# Reference:
# https://www.commandlinefu.com/commands/view/12218/convert-yaml-to-json
# python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < file.yaml > file.json 

 import sys, yaml, json
 json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)
