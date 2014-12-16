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
  { name: 'luasec', version: '0.4-4' },
  { name: 'lua-cjson', version: '2.1.0-1' },
  { name: 'busted', version: '1.9.0-1' },
  { name: 'lapis', version: '1.0.4-1' },
  { name: 'moonscript', version: '0.2.4-1' },
  { name: 'inspect', version: '1.2-2' }
]

# nginx configs (defaults are for development environments)
default['redx']['nginx']['lua_package_path'] = ''
default['redx']['nginx']['lua_package_cpath'] = ''
default['redx']['nginx']['api_ports'] = %w( 8081 )
default['redx']['nginx']['main_ports'] = %w( 8080 )
default['redx']['nginx']['lua_code_cache'] = 'off' # "on" or "off"
default['redx']['nginx']['proxy_read_timeout'] = '300s'
default['redx']['nginx']['proxy_connect_timeout'] = '3s'
default['redx']['nginx']['buffering'] = 'off' # "on" or "off"

# redx config file values
default['redx']['redis']['host'] = '127.0.0.1'
default['redx']['redis']['port'] = 6379
default['redx']['redis']['password'] = ''
default['redx']['redis']['timeout'] = 5000
# keepalive pool size per nginx worker
default['redx']['redis']['keepalive']['pool_size'] = 100
default['redx']['redis']['keepalive']['timeout'] = 30000
default['redx']['max_path_length'] = 1
default['redx']['stickiness'] = 0 # stickinesss disabled
default['redx']['default_score'] = 0
default['redx']['plugins'] = "{'random'}"

# default redis config
default['redis']['install_type'] = 'source'
default['redis']['config']['save'] = []
