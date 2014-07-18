#
# Cookbook Name:: redx
# Recipe:: lua_resty_redis
#
# Copyright 2013, RStudio Inc
#
# All rights reserved - Do Not Redistribute

include_recipe 'git'

git node['redx']['lua_resty_redis']['dir'] do
  repository node['redx']['lua_resty_redis']['repository']
  revision node['redx']['lua_resty_redis']['revision']
  action :checkout
end
