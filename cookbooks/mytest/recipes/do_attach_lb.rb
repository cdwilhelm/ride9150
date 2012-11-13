
pool_name="mytest"

node[:lb][:service][:provider] = "lb_haproxy"
#lb_tag pool_name

log "  Sending remote attach request..."
lb pool_name do
  backend_id node[:rightscale][:instance_uuid]
  backend_ip node[:app][:ip]
  backend_port 8080 # <- virtual host port in apache for tilecache from input.
 # pool_name pool_name
  action :attach_request
end
