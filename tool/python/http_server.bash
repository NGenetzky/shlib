http_server(){
  # Static:
  # local pymodule='http.server'
  # local pymodule='SimpleHTTPServer'
  # Dynamic:
  local pymodule=$(python -c 'import sys; print("http.server" if sys.version_info[:2] > (2,7) else "SimpleHTTPServer")')
  python -m "${pymodule}"
}
