rs_utils_marker :begin

execute "setup ssh" do
  command "ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa"
  action :run
 
end

execute "setup ssh" do
  command "cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys"
  action :run
 
end
execute "setup ssh" do
  command "cat  'host localhost' >> ~/.ssh/config;"
  action :run
 
end
execute "setup ssh" do
  command "cat  'identityfile' >> ~/.ssh/config"
  action :run
 
end

rs_utils_marker :end