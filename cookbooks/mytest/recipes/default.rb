#
# Cookbook Name:: mytest
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node[:mytest][:port]="8080"

mytest "vhost" do
  destination "#{node[:repo][:default][:destination]}/mytest"
  port  node[:mytest][:port]
  action :setup_vhost
end

directory "#{node[:repo][:default][:destination]}/mytest" do
  recursive true
  action :create
end


template "#{node[:repo][:default][:destination]}/mytest/index.html" do
  source "healthcheck.erb"
end

