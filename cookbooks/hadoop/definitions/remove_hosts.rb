define :remove_slave, :restart=>false  do
  
  slaves = File.read("#{node[:hadoop][:install_dir]}/conf/slaves")
  replace = slaves.gsub(host, "")
  File.open("#{node[:hadoop][:install_dir]}/conf/slaves", "w") {|file| file.puts replace}
  
  if params[:restart]
    log "Stop Slaves"
    #action
  end
end