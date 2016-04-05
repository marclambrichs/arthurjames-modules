# == Class arthurjames::profile_graphite
#
#
class arthurjames::profile_graphite (
  $carbon_caches         = {},
  $memcached_enabled     = false,
){

  class { 'graphite_frontend':
    ls_carbonlink_hosts => $carbon_caches,
    memcached_enabled   => $memcached_enabled,
  }

  class { 'carbon':
    cc_carbon_caches => $carbon_caches
  }

}
