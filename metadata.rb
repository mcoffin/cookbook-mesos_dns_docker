name             'mesos_dns_docker'
maintainer       'Matt Coffin'
maintainer_email 'matt.coffin@flukenetworks.com'
license          'Apache 2.0'
description      'Installs/Configures mesos-dns with docker'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'docker', '~> 1.0.21'
