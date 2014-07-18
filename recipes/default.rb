#
# Cookbook Name:: redx
# Recipe:: default
#
# Copyright 2014, rstudio, inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'openresty::luarocks'

node['redx']['luarocks']['modules'].each do |mod|
  bash "luarocks install #{mod}" do
    user 'root'
    code <<-EOH
      #{node['openresty']['source']['prefix']}/luajit/bin/luarocks install #{mod}
    EOH
  end
end

include_recipe 'redx::install'
