##
class arthurjames::role_graphite (
  $apache_enabled   = false,
  $grafana_enabled  = false,
  $graphite_enabled = false,
  $relay_enabled    = false,
  $statsd_enabled   = false
){
  validate_bool(
    $apache_enabled,
    $grafana_enabled,
    $graphite_enabled,
    $relay_enabled,
    $statsd_enabled
  )

  if $apache_enabled {
    notify { 'apache enabled': }
    include ::arthurjames::profile_apache
  }
  if $grafana_enabled {
    notify { 'grafana enabled': }
    include ::arthurjames::profile_grafana
  }
  if $graphite_enabled {
    notify { 'graphite enabled': }
    include ::arthurjames::profile_graphite
  }
  if $relay_enabled {
    notify { 'relay enabled': }
    include ::arthurjames::profile_relay
  }
  if $statsd_enabled {
    notify { 'statsd enabled': }
    include ::arthurjames::profile_statsd
  }
}
