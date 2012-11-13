
node[:lb][:service][:provider] = "lb_haproxy"
#adsfasdf
log "  Sending remote attach request..."
lb "mytest" do
  backend_id node[:rightscale][:instance_uuid]
  backend_ip node[:app][:ip]
  backend_port 8080 # <- virtual host port in apache for tilecache from input.
  pool_name 'mytest'
  action :attach_request
end
