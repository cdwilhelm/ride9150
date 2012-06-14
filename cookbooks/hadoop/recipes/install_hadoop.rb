 rs_utils_marker :begin
 log "  Installing Hadoop..."
  cookbook_file "/tmp/hadoop-#{node[:hadoop][:version]}-bin.tar.gz" do
    source "hadoop-#{node[:hadoop][:version]}-bin.tar.gz"
    mode "0644"  
    cookbook 'hadoop'
  end
  
   bash "install_hadoop" do
    flags "-ex"
    code <<-EOH
      tar xzf /tmp/hadoop-#{node[:hadoop][:version]}-bin.tar.gz -C /home/
      ln -s /home/hadoop-#{node[:hadoop][:version]} #{node[:hadoop][:install_dir]} 
    EOH
    only_if do ::File.exists?("/tmp/hadoop-#{node[:hadoop][:version]}-bin.tar.gz")  end
  end
  
 rs_utils_marker :end