#
# Cookbook Name:: redx
# Recipe:: default
#
# Copyright 2014, rstudio, inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'redx::install'
include_recipe 'openresty::luarocks'

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

node['redx']['luarocks']['modules'].each do |mod|
  bash "luarocks install #{mod}" do
    user 'root'
    code <<-EOH
      luarocks install #{mod}
    EOH
  end
end
