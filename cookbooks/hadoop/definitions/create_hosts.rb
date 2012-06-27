define :create_hosts ,:restart=>false, :hosts=>Set.new, :file=>'slaves' do
  file = File.new("#{node[:hadoop][:install_dir]}/conf/#{params[:file]}",'w')
  
 
  file.puts node[:hadoop][:dns][:namenode][:fqdn]
  
  params[:hosts].each do |h|
    log "host #{h}"
    file.puts(h)
  end
  file.close
        
  if !params[:hosts].empty? and params[:restart]
    log "Start the nodes"
    hadoop "Start hadoop" do
      action :start
    end
  end
end