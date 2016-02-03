class arthurjames::role_neo4j (
  $collectd_enabled = false,
  $neo4j_enabled   = false,
){
  validate_bool( $collectd_enabled )
  validate_bool( $neo4j_enabled )

  if $collectd_enabled {
    notify { 'collectd enabled': }
    include ::arthurjames::profile_collectd
  }
  if $neo4j_enabled {
    notify { 'neo4j enabled': }
    include ::arthurjames::profile_neo4j
  }
}
