#
# Cookbook Name:: mytest
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create the apache virtual host file
# 
mytest "vhost" do
  destination "#{node[:repo][:default][:destination]}/apps"
  port  "8080"
  action :setup_vhost # see setup_vhost provider
end

# install the app
# this is just a simple app
directory "#{node[:repo][:default][:destination]}/apps/vhost_test" do
  mode 777
  recursive true
  action :create
end

# install app files.  normally would be a php or other app.
# this is just a html file to show the test configuration
template "#{node[:repo][:default][:destination]}/apps/vhost_test/index.html" do
  mode 777
  source "index.erb"
end

