rs_utils_marker :begin

include_recipe "hadoop::default"

log "Installing hbase hbase-env.sh to #{node[:hbase][:install_dir]}/conf"
template "#{node[:hbase][:install_dir]}/conf/hbase-env.sh" do
  source "hbase-env.sh.erb"
#  owner "#{node[:tomcat][:app_user]}"
#  group "#{node[:tomcat][:app_user]}"
  mode "0644"
end

log "Installing hbase hbase-site.xml to #{node[:hbase][:install_dir]}/conf"
template "#{node[:hbase][:install_dir]}/conf/hbase-site.xml" do
  source "hbase-site.xml.erb"
#  owner "#{node[:tomcat][:app_user]}"
#  group "#{node[:tomcat][:app_user]}"
  mode "0644"

end

log "Installing hbase regionservers  to #{node[:hbase][:install_dir]}/conf"
template "#{node[:hbase][:install_dir]}/conf/regionservers" do
  source "regionservers.erb"
#  owner "#{node[:tomcat][:app_user]}"
#  group "#{node[:tomcat][:app_user]}"
  mode "0644"

end

rs_utils_marker :end
