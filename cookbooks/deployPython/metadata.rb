name             'deployPython'
maintainer       'trulyCanadian'
maintainer_email 'davegermiquet@trulycanadian.net'
license          'All rights reserved'
description      'Deploys a python with application from git repository to a docker instance'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends 'docker','~> 2.0'
depends 'ssh_known_hosts', '~> 3.1.0'
depends 'tar'
depends 'yum'

