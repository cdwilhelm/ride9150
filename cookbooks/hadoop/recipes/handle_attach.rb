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

log "  Remote recipe executed by do_attach_request"
#get_hosts('datanode').each do |host|
  hadoop 'remote recipe for ' do
    backend_id node[:remote_recipe][:backend_id]
    backend_ip node[:remote_recipe][:backend_ip]
    #backend_port node[:remote_recipe][:backend_port].to_i
    action :attach
  end
#end

rs_utils_marker :end
