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

directory "#{node[:repo][:default][:destination]}/mytest" do
  recursive true
  action :create
end

directory "#{node[:web_apache][:application_name]}/ROOT" do
  recursive true
  action :create
end

template "#{node[:repo][:default][:destination]}/mytest/healthcheck.html" do
  source "healthcheck.erb"
end

#should already be built.
template "#{node[:repo][:default][:destination]}/#{node[:web_apache][:application_name]}/ROOT/healthcheck.html" do
  source "healthcheck.erb"
end