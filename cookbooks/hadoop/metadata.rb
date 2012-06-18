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


attribute "hadoop/dns/nodename/fqdn",
  :display_name => "Hadoop NameNode Host name ",
  :description => "FQDN of the NameNode",
  :type => "string",
  :required => "required",
  :recipes => [ "hadoop::do_hadoop_config" ]

attribute "hadoop/dns/nodename/id",
  :display_name => "Hadoop NameNode Host Id ",
  :description => "FQDN of the NameNode",
  :type => "string",
  :required => "required",
  :recipes => [ "hadoop::do_hadoop_config" ]

attribute "hadoop/dns/datanode/fqdn",
  :display_name => "Hadoop DataNode Host name ",
  :description => "FQDN of the DataNode",
  :type => "string",
  :required => "optional",
  :recipes => [ "hadoop::do_hadoop_config" ]

attribute "hadoop/dns/datanode/id",
  :display_name => "Hadoop DataNode Host ID ",
  :description => "FQDN of the DataNode",
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
  :required => "required",
  :recipes => [ "hadoop::do_hbase_config" ]

attribute "hbase/dns/zookeeper/id",
  :display_name => "Hbase zookeeper hostname id",
  :description => "FQDN of the zookeeper ",
  :type => "string",
  :required => "required",
  :recipes => [ "hadoop::do_hbase_config" ]

attribute "hbase/install",
  :display_name => "Install hbase",
  :description => "Install hbase on this host.",
  :default=>"true",
  :choose=>["true", "false"],
  :type => "string",
  :required => "optional",
  :recipes => [ "hadoop::install_hbase" ]



