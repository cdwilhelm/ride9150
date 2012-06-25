# Add actions to @action_list array.
# Used to allow comments between entries.
def self.add_action(sym)
  @action_list ||= Array.new
  @action_list << sym unless @action_list.include?(sym)
  @action_list
end

# Attaching/Detaching options
attribute :backend_id, :kind_of => String, :default => ""
attribute :backend_ip, :kind_of => String, :default => ""


add_action :start_hadoop
add_action :stop_hadoop
add_action :restart_hadoop
add_action :start_hbase
add_action :stop_hbase 
add_action :restart_hbase
add_action :attach
add_action :attach_request

actions @action_list


