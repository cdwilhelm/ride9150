# Setup apache PHP virtual host
# mostly out of the box from cookbook web_apache/providers/default.rb
action :setup_vhost do

  project_root = new_resource.destination
  php_port = new_resource.port

  # Disable default vhost
  apache_site "000-default" do
    enable false
  end

  # Updating apache listen ports configuration
  template "#{node[:apache][:dir]}/ports.conf" do
    cookbook "apache2"
    source "ports.conf.erb"
    variables :apache_listen_ports => [8000,8080]
  end

  # Configure apache vhost for PHP
  web_app "vhost_test" do
    template "app_server.erb"
    docroot project_root
    vhost_port php_port.to_s
    server_name "vhost_test.example.com"
    cookbook "web_apache"
  end

end