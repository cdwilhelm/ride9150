rs_utils_marker :begin

if node[:hbase][:install]=='true'
  log "  creating hdfs /hbase dir"
  execute "create hbase hdfs dir" do
    command "#{node[:hadoop][:install_dir]}/bin/hadoop fs -mkdir /hbase"
    action :run
  end

  log "  set /hbase permissions"
  execute "create hbase hdfs dir" do
    command "#{node[:hadoop][:install_dir]}/bin/hadoop fs -chown hbase /hbase"
    action :run
  end

  #log "  Running start sequence"
  #execute "start hbase" do
  #  command "#{node[:hbase][:install_dir]}/bin/start-hbase.sh"
  #  action :run
  #end

  hbase_register_zookeeper

  hadoop "Start hbase" do
    action :start_hbase
  end
end
rs_utils_marker :end