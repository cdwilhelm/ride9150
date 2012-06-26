# update slaves file with new host.
define :add_host,:restart=>false, :file=>'slaves' do
  
  file = File.open("#{node[:hadoop][:install_dir]}/conf/#{params[:file]}",'a')
  file.puts(params[:name])
  
  if params[:restart]
    log "Start new nodes"
    hadoop "Start hbase" do
      action :start_hadoop
    end
  end
  
end