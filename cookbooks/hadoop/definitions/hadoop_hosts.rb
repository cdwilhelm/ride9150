define :hadoop_hosts, :file=>nil, :hosts => [] do
  
  file "#{node[:hadoop][:install_dir]}/conf/#{params[:file]}" do
    action :delete
  end
  
  params[:hosts].each do |host|
  
    bash "update file #{node[:hadoop][:install_dir]}/conf/#{params[:file]}" do
      flags "-ex"
      code <<-EOH
      cat #{host} >> #{node[:hadoop][:install_dir]}/conf/#{params[:file]}
      EOH
    end
 
  end
  action :restart_hadoop
end
