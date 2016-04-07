# == Class arthurjames::role_graphite
#
#
class arthurjames::role_graphite (
  $grafana_enabled   = false,
  $graphite_enabled  = false,
  $memcached_enabled = false,
  $relay_enabled     = false,
  $statsd_enabled    = false
){
  validate_bool(
    $grafana_enabled,
    $graphite_enabled,
    $memcached_enabled,
    $relay_enabled,
    $statsd_enabled,
  )

  if $grafana_enabled {
    include ::arthurjames::profile_grafana
  }
  if $graphite_enabled {
    class { 'arthurjames::profile_graphite':
      memcached_enabled => $memcached_enabled
    }
  }
  if $memcached_enabled {
    include ::arthurjames::profile_memcached
  }
  if $relay_enabled {
    include ::arthurjames::profile_relay
  }
  if $statsd_enabled {
    include ::arthurjames::profile_statsd
  }

  Class['::arthurjames::profile_memcached'] -> Class['::arthurjames::profile_graphite']
}
