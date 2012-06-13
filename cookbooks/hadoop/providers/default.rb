#
# Cookbook Name:: hadoop_hbase
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

# Stop hadoop and hbase
action :stop do
  log "  Running stop sequence"
  service "hadoop" do
    action :stop
    persist false
  end

end

# Start hadoop and hbase
action :start do
  log "  Running start sequence"
  service "hadoop" do
    action :start
    persist false
  end
end

# Restart hadoop and hbase
action :restart do
  log "  Running restart sequence"
  action_stop
  sleep 5
  action_start
end

action :install do
  
  log "  Installing Hadoop..."
  cookbook_file "/tmp/hadoop-#{node[:hadoop][:version]}-bin.tar.gz" do
    source "hadoop-#{node[:hadoop][:version]}-bin.tar.gz"
    mode "0644"  
    cookbook 'hadoop_hbase'
  end
  
   bash "install_hadoop" do
    flags "-ex"
    code <<-EOH
      tar xzf /tmp/hadoop-#{node[:hadoop][:version]}-bin.tar.gz -C /home/
      ln /home/hadoop-#{node[:hadoop][:version]} #{node[:hadoop][:install_dir]} 
    EOH
    only_if do ::File.exists?("/tmp/hadoop-#{node[:hadoop][:version]}-bin.tar.gz")  end
  end
  
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
      ln /home/hbase-#{node[:hbase][:version]} /home/hbase
    EOH
    only_if do ::File.exists?("/tmp/hbase-#{node[:hbase][:version]}.tar.gz")  end
  end
end