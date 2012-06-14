rs_utils_marker :begin

execute "setup ssh" do
  command "ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa; \ 
  cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys; \
  cat  'host localhost' >> ~/.ssh/config;\
  cat  'identityfile' ~/.ssh/id_dsa"
  action :run
 
end


rs_utils_marker :end