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
      #{node['openresty']['source']['prefix']}/luajit/bin/luarocks install #{mod['name']} #{mod['version']}
    EOH
  end
end

template "#{node['nginx']['dir']}/sites-available/redx.conf" do
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode 00644
  notifies :reload, 'service[nginx]'
end

link "#{node['nginx']['dir']}/sites-enabled/redx.conf" do
  to "#{node['nginx']['dir']}/sites-available/redx.conf"
end

# install redis server if we're pointing redx to localhost
include_recipe 'redis::server' if %w( 127.0.0.1 localhost ).include? node['redx']['redis']['host']
