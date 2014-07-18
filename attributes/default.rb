
# basic attrs
default['redx']['dir'] = '/opt/redx'

# git attrs
default['redx']['repository'] = 'https://github.com/rstudio/redx.git'
default['redx']['revision'] = 'HEAD'

# servers to proxy request to when theres a cache miss or upstream host is down
default['redx']['fallback_servers'] = %w(
  localhost:80
)

# value can be "on" or "off"
default['redx']['lua_code_cache'] = "on"

default['redx']['luarocks']['modules'] = %w(
  lapis
  moonscript
  inspect
)
