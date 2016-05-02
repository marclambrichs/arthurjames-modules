# == class arthurjames::role_prometheus
#
#
class arthurjames::role_prometheus (
  $grafana_enabled    = false,
  $prometheus_enabled = false,
) {

  validate_bool(
   $grafana_enabled,
   $prometheus_enabled,
  )
  
  if $grafana_enabled {
    include ::arthurjames::profile_grafana
  }
  if $prometheus_enabled {
    include ::arthurjames::profile_prometheus
  }
}
