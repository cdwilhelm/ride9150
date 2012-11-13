#
# Cookbook Name:: mytest
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


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

