#
# Cookbook Name:: db
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

# Sets a database server to be a master in a replication db setup.
# The tasks include setting up DNS, setting tags, and setting node attributes.
define :hbase_register_zookeeper do

  # Set master DNS
  # Do this first so that DNS can propagate while the recipe runs
  private_ip = node[:cloud][:private_ips][0]
  log "  Setting nodename #{node[:hbase][:dns][:zookeeper][:fqdn]} to #{private_ip}"
  sys_dns "default" do
    id node[:hbase][:dns][:zookeeper][:id]
    address private_ip
    action :set_private
  end
  

end