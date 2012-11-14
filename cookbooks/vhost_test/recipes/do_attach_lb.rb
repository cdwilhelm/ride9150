# This recipe attaches the app to the load balancer

# set the provider
node[:lb][:service][:provider] = "lb_haproxy"


# set the pool name.  also must be in lb/pools input
pool_name="/vhost_test"

# open the port for the load balancer
# replace / with _ for pool name in tag
sys_firewall "Open this appserver's ports to all loadbalancers" do
  machine_tag "loadbalancer:#{pool_name.gsub("\/","_")}=lb"
  port 8080
  enable true
  action :update
end
  

# run the attach request.
# this recipe calls a provider which calls the recipe on the LB server to 
# add the conf to /etc/haproxy/haproxy.cfg

log "  Sending remote attach request..."
lb pool_name.gsub("\/","_") do
  backend_id node[:rightscale][:instance_uuid]
  backend_ip node[:app][:ip]
  backend_port 8080 # <- virtual host port in apache for tilecache from input.
  # pool_name pool_name
  action :attach_request
end
