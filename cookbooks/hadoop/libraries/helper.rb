module RightScale
  module Hadoop
    module Helper
      
      def get_hosts(type) 
        hadoop_servers = Hash.new
        
        r=  server_collection "hosts" do
          tags "hadoop:node_type=datanode"
          action :nothing
        end
        
        r.run_action(:load)
        log node[:server_collection]['hosts'].inspect

        node[:server_collection]['hosts'].to_hash.values.each do |tags|
          uuid = RightScale::Utils::Helper.get_tag_value('server:uuid', tags)
          ip = RightScale::Utils::Helper.get_tag_value('server:private_ip_0', tags)
        
          #log "uuid: #{uuid} | IP: #{ip}"
          hadoop_servers[uuid] = {}
          hadoop_servers[uuid][:ip] = ip
        #  hadoop_servers[uuid][:backend_port] = port.to_i
        end
        
       # log hadoop_servers.inspect
        hadoop_servers
      end
    end
  end
end