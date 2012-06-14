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
