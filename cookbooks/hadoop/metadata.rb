maintainer       "RightScale"
maintainer_email "curt@rightscale.com"
license          "All rights reserved"
description      "Install and Configure hadoop and hbase."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"


depends 'rs_utils'
depends "rightscale"
depends "block_device"
depends "sys_firewall"

recipe 'hadoop::install_hadoop', 'Install hadoop'
recipe 'hadoop::do_hadoop_config', 'Configure hadoop'
recipe 'hadoop::do_hadoop_init', 'Creates new block device and formats the node'
recipe 'hadoop::install_hbase', 'Install hbase'
recipe 'hadoop::do_hbase_config', 'Configure hbase'
recipe 'hadoop::do_hbase_init', 'Init and start hbase'
recipe "hadoop::do_delete_volumes_and_terminate_server", "Deletes any currently attached volumes from the instance and then terminates the machine."


attribute "hadoop/terminate_safety",
  :display_name => "Terminate Safety",
  :description => "Prevents the accidental running of the db::do_teminate_server recipe. This recipe will only run if this input variable is overridden and set to \"off\".",
  :type => "string",
  :choice => ["Override the dropdown and set to \"off\" to really run this recipe"],
  :default => "Override the dropdown and set to \"off\" to really run this recipe",
  :required => "optional",
  :recipes => [ "hadoop::do_delete_volumes_and_terminate_server" ]