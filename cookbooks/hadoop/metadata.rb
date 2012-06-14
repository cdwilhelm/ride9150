maintainer       "RightScale"
maintainer_email "curt@rightscale.com"
license          "All rights reserved"
description      "Install and Configure hadoop and hbase."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"


depends 'rs_utils'

recipe 'hadoop::install_hadoop', 'Install hadoop'
recipe 'hadoop::do_configure_hadoop', 'Configure hadoop'
recipe 'hadoop::install_hbase', 'Install hbase'
#recipe 'hadoop::do_configure_hbase', 'Configure hbase'

