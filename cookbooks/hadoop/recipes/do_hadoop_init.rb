rs_utils_marker :begin

#class Chef::Recipe
#  include RightScale::BlockDeviceHelper
#end
#
#class Chef::Resource::BlockDevice
#  include RightScale::BlockDeviceHelper
#end
#NICKNAME = get_device_or_default(node, :device1, :nickname)
#
#include_recipe 'block_device::default'
#
#log "  Creating block device..."
#block_device NICKNAME do
#  lineage node[:db][:backup][:lineage]
#  action :create
#end

#action_start_hadoop

log "hello"

rs_utils_marker :end
