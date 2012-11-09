#
# Cookbook Name:: mytest
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mytest "vhost" do
  action :setup_vhost
end

directory "/home/webapps/mytest" do
  recursive true
  action :create
end

template "/home/webapps/mytest/healthcheck.html" do
  source "healthcheck.erb"
end

template "/home/webapps/app_test/ROOT/healthcheck.html" do
  source "healthcheck.erb"
end