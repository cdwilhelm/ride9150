rs_utils_marker :begin

  log "  Running start sequence"
execute "create hbase hdfs dir" do
  command "#{node[:hbase][:install_dir]}/bin/start-hbase.sh"
  action :run
end

log "  Running start sequence"
execute "start hadoop" do
  command "#{node[:hbase][:install_dir]}/bin/start-hbase.sh"
  action :run
end



rs_utils_marker :end