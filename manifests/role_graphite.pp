class arthurjames::role_graphite (
  $apache_enabled   = false,
  $collectd_enabled = false,
  $grafana_enabled  = false,
  $graphite_enabled = false,
  $relay_enabled    = false,
  $statsd_enabled   = false  
){
  validate_bool( $apache_enabled )
  validate_bool( $collectd_enabled )
  validate_bool( $grafana_enabled )
  validate_bool( $graphite_enabled )
  validate_bool( $relay_enabled )
  validate_bool( $statsd_enabled )

  if $apache_enabled {
    notify { 'apache enabled': }
    include ::arthurjames::profile_apache
  }
  if $collectd_enabled {
    notify { 'collectd enabled': }
    include ::arthurjames::profile_collectd
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
