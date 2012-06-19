#
# Cookbook Name:: hadoop
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

rs_util_marker :begin

log "  updating masters file for hadoop"
hadoop "namenode" do
  server_collection "namenode" do
    tags "hadoop:node_type=namenode"
  end
  
 @node[:server_collection]["namenode"].each do |it|
   log "myserver #{it}"
 end
 # hadoop_hosts "#{node[:hadoop][:install_dir]}/conf" do
    
    
 # end
end

rs_util_marker :end
