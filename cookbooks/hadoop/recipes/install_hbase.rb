  rs_utils_marker :begin
  if node[:hbase][:install] == 'true'
  log "  Installing hbase..."
  cookbook_file "/tmp/hbase-#{node[:hbase][:version]}.tar.gz" do
    source "hbase-#{node[:hbase][:version]}.tar.gz"
    mode "0644"  
    cookbook 'hadoop'
  end
  
   bash "install_hbase" do
    flags "-ex"
    code <<-EOH
      tar xzf /tmp/hbase-#{node[:hbase][:version]}.tar.gz -C /home/
      ln -s /home/hbase-#{node[:hbase][:version]} /home/hbase
    EOH
    only_if do ::File.exists?("/tmp/hbase-#{node[:hbase][:version]}.tar.gz")  end
  end
  end
  rs_utils_marker :end