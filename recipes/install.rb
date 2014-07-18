#
# Cookbook Name:: redx
# Recipe:: install
#
# Copyright 2014, rstudio, inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

git node['redx']['dir'] do
  repository node['redx']['repository']
  revision node['redx']['revision']
  action :checkout
end

bash 'compile-lua-files-from-moonscript' do
  user 'root'
  cwd node['redx']['dir']
  code <<-EOH
    #{node['openresty']['source']['prefix']}/luajit/bin/moonc .
  EOH
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
