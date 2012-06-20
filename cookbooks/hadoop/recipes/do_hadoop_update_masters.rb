#
# Cookbook Name:: hadoop
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

rs_utils_marker :begin

log "  updating masters file for hadoop"

s=server_collection "namenode" do
  tags ["hadoop:node_type=namenode"]
  action :nothing
end
s.run_action(:load)
  

  hosts = []
  #log node[:server_collection]["namenode"].inspect
  node[:server_collection]["namenode"].to_hash.values.each do |tags|
    fqdn = RightScale::Utils::Helper.get_tag_value('server:fqdn', tags)
    log "myserver #{fqdn}"
    hosts.push(fqdn)
  end
    
  # hadoop_hosts "#{node[:hadoop][:install_dir]}/conf" do
    # hosts=hosts
    
  # end


rs_utils_marker :end
