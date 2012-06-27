# update slaves file with new host.
define :add_host,:restart=>false, :file=>'slaves' do
  
  file = File.open("#{node[:hadoop][:install_dir]}/conf/#{params[:file]}",'a')
  file.puts(params[:name])
  
  if params[:restart]
    log "Start new nodes"
    hadoop "Start hadoop" do
      action :start
    end
  end
  
end