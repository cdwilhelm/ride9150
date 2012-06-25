# 
# Cookbook Name:: lb
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

rs_utils_marker :begin

class Chef::Recipe
  include RightScale::Hadoop::Helper
end


log "  Adding tag to answer for vhost load balancing - "
  
get_hosts('datanode').each do |host|
    
  hadoop host do
    #log "  Sending remote attach request..."

    backend_id node[:rightscale][:instance_uuid]
    backend_ip node[:hadoop][:ip]
    #backend_port node[:app][:port].to_i
    action :attach_request
  end
end


  rs_utils_marker :end
