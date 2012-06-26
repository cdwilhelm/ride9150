#
# Cookbook Name:: hadoop
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

class Chef::Recipe
  include RightScale::Hadoop::Helper
end

# Stop hadoop
action :stop do
  log "  Running stop sequence"
  execute "hadoop" do
    command "#{node[:hadoop][:install_dir]}/bin/stop-all.sh"
    action :run
  end

end

# Start hadoop
action :start do
  log "  Running start sequence"
  execute "hadoop" do
    command "#{node[:hadoop][:install_dir]}/bin/start-all.sh"
    action :run
  end
end

# Restart hadoop
action :restart do
  log "  Running restart sequence"
  action :stop
  sleep 10
  action :start
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
  log "Attach: ID:#{new_resource.backend_id} / IP:#{new_resource.backend_ip} "
  add_host new_resource.backend_ip do
    file 'slaves'
    restart true
    only_if node[:hadoop][:node][:type]=='datanode'
  end 
  
  add_host new_resource.backend_ip do
    file 'master'
    restart true
    only_if node[:hadoop][:node][:type]=='namenode'
  end 
end

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

action :detach do
  log "Detach: ID:#{new_resource.backend_id} / IP:#{new_resource.backend_ip} "
  remove_host new_resource.backend_ip do
    file 'slaves'
    restart true
    only_if node[:hadoop][:node][:type]=='datanode'
  end 
  
  remove_host new_resource.backend_ip do
    file 'master'
    restart true
    only_if node[:hadoop][:node][:type]=='namenode'
  end 
end

action :detach_request do
  log "Detach request for #{new_resource.backend_id} / #{new_resource.backend_ip}"

  # Run remote_recipe for each datanode 
  remote_recipe "Attach me as a slave" do
    recipe "hadoop::handle_detach"
    attributes :remote_recipe => {
      :backend_ip => new_resource.backend_ip,
      :backend_id => new_resource.backend_id,
    }
    recipients_tags "hadoop:node_type=namenode"
  end

end # action :attach_request do