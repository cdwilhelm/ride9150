
pool_name="/mytest"

sys_firewall "Open this appserver's ports to all loadbalancers" do
  machine_tag "loadbalancer:#{pool_name.gsub("\/","_")}=lb"
  port 8080
  enable true
  action :update
end
  


node[:lb][:service][:provider] = "lb_haproxy"
#lb_tag pool_name

log "  Sending remote attach request..."
lb pool_name.gsub("\/","_") do
  backend_id node[:rightscale][:instance_uuid]
  backend_ip node[:app][:ip]
  backend_port 8080 # <- virtual host port in apache for tilecache from input.
  # pool_name pool_name
  action :attach_request
end
