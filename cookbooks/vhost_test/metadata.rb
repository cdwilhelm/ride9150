maintainer       "YOUR_COMPANY_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures vhost_test"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends 'lb'
depends "web_apache"
depends "apache2"

recipe "vhost_test::default", "Installs my app, configures apache vhost file"
recipe "vhost_test::do_attach_lb", "attach the app to the lb"

# add attributes