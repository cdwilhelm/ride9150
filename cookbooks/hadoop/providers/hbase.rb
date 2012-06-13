#
# Cookbook Name:: hadoop_hbase
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

# Stop hbase
action :stop do
  log "  Running stop sequence"
  service "hbase" do
    action :stop
    persist false
  end

end

# Start  hbase
action :start do
  log "  Running start sequence"
  service "hbase" do
    action :start
    persist false
  end
end

# Restart  hbase
action :restart do
  log "  Running restart sequence"
  action_stop
  sleep 5
  action_start
end

action :install do
  
   
  log "  Installing hbase..."
  cookbook_file "/tmp/hbase-#{node[:hbase][:version]}.tar.gz" do
    source "hbase-#{node[:hbase][:version]}.tar.gz"
    mode "0644"  
    cookbook 'hadoop_hbase'
  end
  
   bash "install_hbase" do
    flags "-ex"
    code <<-EOH
      tar xzf /tmp/hbase-#{node[:hbase][:version]}.tar.gz -C /home/
      ln /home/hbase-#{node[:hbase][:version]} #{node[:hbase][:install_dir]} 
    EOH
    only_if do ::File.exists?("/tmp/hbase-#{node[:hbase][:version]}.tar.gz")  end
  end
end