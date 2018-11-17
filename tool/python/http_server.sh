#!/bin/sh

http_server(){
  # Static:
  #pymodule='http.server'
  #pymodule='SimpleHTTPServer'
  # Dynamic:
  pymodule=$(python -c 'import sys; print("http.server" if sys.version_info[:2] > (2,7) else "SimpleHTTPServer")')
  python -m "${pymodule}" "$@"
}
