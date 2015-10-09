name             'gauge'
maintainer       'Ketan Padegaonkar'
maintainer_email 'ketanpadegaonkar@gmail.com'
license          'MIT'
description      'Installs/Configures gauge'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'


%w{redhat centos scientific fedora amazon oracle debian ubuntu suse opensuse}.each do |os|
  supports os
end

suggests 'chocolatey'
