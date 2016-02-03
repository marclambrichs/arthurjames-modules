# == Class: arthurjames::profile_neo4j
#
# ArthurJames specific configuration of collectd.
#
# === Parameters
#
#
# === Examples
#
#
# === Authors
#
# Author Name <marc.lambrichs@gmail.com>
#
# === Copyright
#
# Copyright 2016 Marc Lambrichs
#
class arthurjames::profile_neo4j (
  $distribution = 'jre'
) {
  class { 'java':
    distribution => $distribution
  }

  class { 'neo4j': }

  Class['java'] -> Class['neo4j']
}

