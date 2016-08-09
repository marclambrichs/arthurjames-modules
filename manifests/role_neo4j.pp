# == Class arthurjames::role_neo4j
#
#
class arthurjames::role_neo4j (
  $neo4j_enabled   = false,
){
  validate_bool( $neo4j_enabled )

  if $neo4j_enabled {
    notify { 'neo4j enabled': }
    include ::arthurjames::profile_neo4j
  }
}
