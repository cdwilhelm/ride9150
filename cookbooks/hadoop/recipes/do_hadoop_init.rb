rs_utils_marker :begin

class Chef::Recipe
  include RightScale::BlockDeviceHelper
end

class Chef::Resource::BlockDevice
  include RightScale::BlockDeviceHelper
end
NICKNAME = get_device_or_default(node, :device1, :nickname)

include_recipe 'block_device::default'

log "  Creating block device..."
block_device NICKNAME do
#  lineage node[:hadoop][:backup][:lineage]
  action :create
end


# add if namenode server, execute this.
log "  Format node"
execute "namenode formt" do
  command "#{node[:hadoop][:install_dir]}/bin/hadoop namenode -format"
  action :run
end


  
log "  Running start sequence"
execute "start hadoop" do
  command "#{node[:hadoop][:install_dir]}/bin/start-all.sh"
  action :run
end



rs_utils_marker :end
