rs_utils_marker :begin

include_recipe "hadoop::default"
log "Installing hadoop hadoop-env.sh to #{node[:hadoop][:install_dir]}/conf"
template "#{node[:hadoop][:install_dir]}/conf/hadoop-env.sh" do
  source "hadoop-env.sh"
#  owner "#{node[:tomcat][:app_user]}"
#  group "#{node[:tomcat][:app_user]}"
  mode "0644"
end

log "Installing hadoop core-site.xml to #{node[:hadoop][:install_dir]}/conf"
template "#{node[:hadoop][:install_dir]}/conf/core-site.xml" do
  source "core-site.xml.erb"
#  owner "#{node[:tomcat][:app_user]}"
#  group "#{node[:tomcat][:app_user]}"
  mode "0644"

end

log "Installing hadoop hdfs-site.xml to #{node[:hadoop][:install_dir]}/conf"
template "#{node[:hadoop][:install_dir]}/conf/hdfs-site.xml" do
  source "hdfs-site.xml.erb"
#  owner "#{node[:tomcat][:app_user]}"
#  group "#{node[:tomcat][:app_user]}"
  mode "0644"

end

rs_utils_marker :end
