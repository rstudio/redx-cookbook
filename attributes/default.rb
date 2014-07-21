# basic attrs
default['redx']['dir'] = '/opt/redx'

# git attrs
default['redx']['repository'] = 'https://github.com/rstudio/redx.git'
default['redx']['revision'] = 'HEAD'

# servers to proxy request to when theres a cache miss or upstream host is down
default['redx']['fallback_servers'] = %w(
  localhost:80
)

default['redx']['luarocks']['modules'] = [
  { name: 'luasec', version: '' },
  { name: 'busted', version: '' },
  { name: 'lapis', version: '' },
  { name: 'moonscript', version: '' },
  { name: 'inspect', version: '' }
]

# nginx configs (defaults are for development environments)
default['redx']['nginx']['api_ports'] = %w( 8081 )
default['redx']['nginx']['main_ports'] = %w( 8080 )
default['redx']['nginx']['lua_code_cache'] = 'off' # "on" or "off"
default['redx']['nginx']['proxy_read_timeout'] = '300s'
default['redx']['nginx']['proxy_connect_timeout'] = '3s'
default['redx']['nginx']['buffering'] = 'off' # "on" or "off"
