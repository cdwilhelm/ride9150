#
# Cookbook Name:: mytest
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Updating apache listen ports configuration
template "#{node[:apache][:dir]}/ports.conf" do
  cookbook "apache2"
  source "ports.conf.erb"
  variables :apache_listen_ports => "8080"
end

mytest "vhost" do
  destination "#{node[:repo][:default][:destination]}/mytest"
  port  "8080"
  action :setup_vhost
end

directory "#{node[:repo][:default][:destination]}/mytest" do
  recursive true
  action :create
end


template "#{node[:repo][:default][:destination]}/mytest/index.html" do
  source "healthcheck.erb"
end

