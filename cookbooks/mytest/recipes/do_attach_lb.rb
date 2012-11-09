
log "  Sending remote attach request..."
lb pool_name do
  backend_id node[:rightscale][:instance_uuid]
  backend_ip node[:app][:ip]
  backend_port 8080 # <- virtual host port in apache for tilecache from input.
  service_region node[:lb][:service][:region]
  service_lb_name node[:lb][:service][:lb_name]
  service_account_id node[:lb][:service][:account_id]
  service_account_secret node[:lb][:service][:account_secret]
  action :attach_request
end
