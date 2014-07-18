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
