##
class arthurjames::role_graphite (
  $grafana_enabled  = false,
  $graphite_enabled = false,
  $statsd_enabled   = false
){
  validate_bool(
    $grafana_enabled,
    $graphite_enabled,
    $statsd_enabled
  )

  if $grafana_enabled {
    notify { 'grafana enabled': }
    include ::arthurjames::profile_grafana
  }
  if $graphite_enabled {
    notify { 'graphite enabled': }
    include ::arthurjames::profile_graphite
  }
  if $statsd_enabled {
    notify { 'statsd enabled': }
    include ::arthurjames::profile_statsd
  }
}
