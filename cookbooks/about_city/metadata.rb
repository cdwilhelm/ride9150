maintainer       "YOUR_COMPANY_NAME"
maintainer_email "curt@rightscale.com"
license          "All rights reserved"
description      "Installs/Configures about_city"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "rs_utils"

recipe "about_city::my_city","Information about my city"

# Required Input #
attribute "about_city/city_name",
   :display_name => "City Name",
   :description => "The city where I currently live.",
   :required => "required",
   :recipes => ["about_city::my_city"]

# Recommended Input #
attribute "about_city/rain",
   :display_name => "Raining",
   :description => "Is it raining? Yes or No",
   :required => "recommended",
   :choice => ["yes", "no"],
   :default => "no",
   :recipes => ["about_city::my_city"]                                       
  
# Optional Input #
attribute "about_city/temperature",
   :display_name => "Temperature",
   :description => "Current temperature in the city",
   :required => "optional",
   :recipes => ["about_city::my_city"]