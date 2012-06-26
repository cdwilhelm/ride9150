maintainer       "RightScale"
maintainer_email "curt@rightscale.com"
license          "All rights reserved"
description      "Install and Configure hadoop and hbase."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"


depends 'rs_utils'
depends "block_device"
depends "sys_firewall"
depends "sys_dns"

recipe 'hadoop::install_hadoop', 'Install hadoop'
recipe 'hadoop::do_hadoop_config', 'Configure hadoop'
recipe 'hadoop::do_hadoop_init', 'Creates new block device and formats the node'
recipe 'hadoop::do_hadoop_update_masters', 'Update masters file with all namenode hostnames.'
recipe 'hadoop::install_hbase', 'Install hbase'
recipe 'hadoop::do_hbase_config', 'Configure hbase'
recipe 'hadoop::do_hbase_init', 'Init and start hbase'
recipe "hadoop::do_delete_volumes_and_terminate_server", "Deletes any currently attached volumes from the instance and then terminates the machine."
recipe "hadoop::do_start_hadoop", "Start Hadoop"
recipe "hadoop::do_start_hbase", "Start Hbase"
recipe "hadoop::do_stop_hadoop", "Stop Hadoop"
recipe "hadoop::do_stop_hadoop", "Stop Hadoop"
recipe "hadoop::do_start_hbase", "Stop Hbase"
recipe "hadoop::do_restart_hadoop", "Restart Hadoop"
recipe "hadoop::do_restart_hbase", "Restart Hbase"
recipe "hadoop::do_attach_request", "Attach request"
recipe "hadoop::handle_attach", "Handle Attach"
recipe "hadoop::do_attach_all", "Handle Attach"

attribute "hadoop/node/type",
  :display_name => "Hadoop node type",
  :description => "Hadoop node type",
  :choice => ['namenode','datanode','tasktracker', 'jobtracker'],
  :default=>'namenode',
  :type => "string",
  :recipes => [ "hadoop::do_hadoop_init","hadoop::do_hadoop_config" ]

attribute "hadoop/dns/namenode/fqdn",
  :display_name => "Hadoop namenode hostname ",
  :description => "FQDN of the NameNode",
  :type => "string",
  :required => "required",
  :recipes => [ "hadoop::do_hadoop_init","hadoop::do_hadoop_config" ]


attribute "hadoop/dns/namenode/id",
  :display_name => "Hadoop Host Id ",
  :description => "DNS Service ID for namenode",
  :type => "string",
  :required => "optional",
  :recipes => [ "hadoop::do_hadoop_init" ]

attribute "hadoop/dfs/replication",
  :display_name => "Hadoop namenode dfs.replicaton property ",
  :description => "Hadoop namenode dfs.replicaton property",
  :type => "string",
  :required => "optional",
  :recipes => [ "hadoop::do_hadoop_config" ]
# == Backup/Restore
#
attribute "hadoop/backup/lineage",
  :display_name => "Hadoop Backup Lineage",
  :description => "The prefix that will be used to name/locate the backup of hbase. Note: For servers running on Rackspace, this value also indicates the Cloud Files container to use for storing primary backups. If a Cloud Files container with this name does not already exist, the setup process creates one.",
  :required => "required",
  :recipes => ["hadoop::do_hadoop_init"]

attribute "hadoop/terminate_safety",
  :display_name => "Terminate Safety",
  :description => "Prevents the accidental running of the db::do_teminate_server recipe. This recipe will only run if this input variable is overridden and set to \"off\".",
  :type => "string",
  :choice => ["Override the dropdown and set to \"off\" to really run this recipe"],
  :default => "Override the dropdown and set to \"off\" to really run this recipe",
  :required => "optional",
  :recipes => [ "hadoop::do_delete_volumes_and_terminate_server" ]

attribute "hbase/dns/zookeeper/fqdn",
  :display_name => "Hbase zookeeper hostname",
  :description => "FQDN of the zookeeper ",
  :type => "string",
  :required => "optional",
  :recipes => [ "hadoop::do_hbase_config","hadoop::do_hadoop_init" ]

attribute "hbase/dns/zookeeper/id",
  :display_name => "Hbase zookeeper hostname id",
  :description => "DNS Service ID of the zookeeper ",
  :type => "string",
  :required => "optional",
  :recipes => [ "hadoop::do_hbase_config" ,"hadoop::do_hadoop_init"]

attribute "hbase/slave",
  :display_name => "Hbase Slave Host",
  :description => "This is a HBase slave host.  Pick yes or no.",
  :choice=> ['yes','no'],
  :type => "string",
  :required => "optional",
  :recipes => [ "hadoop::do_hbase_init" ]

attribute "hbase/install",
  :display_name => "Install hbase",
  :description => "Install hbase on this host.",
  :default=>"true",
  :choice =>["true", "false"],
  :type => "string",
  :required => "optional",
  :recipes => [ "hadoop::install_hbase" ]



