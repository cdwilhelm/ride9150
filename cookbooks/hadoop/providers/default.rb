#
# Cookbook Name:: hadoop_hbase
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

# Stop hadoop and hbase
action :stop_hadoop do
  log "  Running stop sequence"
  execute "hadoop" do
    command "#{node[:hadoop][:install_dir]}/bin/stop-all.sh"
    action :run
  end

end

# Start hadoop and hbase
action :start_hadoop do
  log "  Running start sequence"
  execute "hadoop" do
    command "#{node[:hadoop][:install_dir]}/bin/start-all.sh"
    action :run
  end
end

# Restart hadoop and hbase
action :restart_hadoop do
  log "  Running restart sequence"
  action :stop_hadoop
  sleep 5
  action :start_hadoop
end

# Stop  hbase
action :stop_hbase do
  log "  Running stop sequence"
  execute "stop hbase" do
    command "#{node[:hbase][:install_dir]}/bin/stop-hbase.sh"
    action :run
  end

end

# Start and hbase
action :start_hbase do
  log "  Running start sequence"
  execute "start hbase" do
    command "#{node[:hbase][:install_dir]}/bin/start-hbase.sh"
    action :run
  end

end


# Restart hbase
action :restart_hbase do
  log "  Running restart sequence"
  action :stop_hbase
  sleep 5
  action :start_hbase
end

action :attach do


  log "attach: ID:#{new_resource.backend_id} / IP:#{new_resource.backend_ip} "
     # :backend_name => new_resource.backend_id,
     # :backend_ip => new_resource.backend_ip,
     # :backend_port => new_resource.backend_port,

 

end # action :attach do

action :attach_request do

  

  log "Attach request for #{new_resource.backend_id} / #{new_resource.backend_ip}"

  # Run remote_recipe for each datanode 
  remote_recipe "Attach me as a slave" do
    recipe "hadoop::handle_attach"
    attributes :remote_recipe => {
      :backend_ip => new_resource.backend_ip,
      :backend_id => new_resource.backend_id,
     
    }
    recipients_tags "hadoop:node_type=namenode"
  end

end # action :attach_request do