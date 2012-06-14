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
action :restart do
  log "  Running restart sequence"
  action_stop_hadoop
  sleep 5
  action_start_hadoop
end
