#
# Cookbook Name:: redx
# Recipe:: install
#
# Copyright 2014, rstudio, inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'redx'
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
  not_if { Dir.exist?("#{node['redx']['dir']}/lua") }
end
