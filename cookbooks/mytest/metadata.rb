maintainer       "YOUR_COMPANY_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures mytest"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends 'lb'
depends "web_apache"

recipe "mytest::default", "default"
recipe "mytest::do_attach_lb", "attach lb"