# == Class arthurjames::role_icinga2
#
#
class arthurjames::icinga2
  $icinga2_enabled    = true,
){
  validate_bool(
    $icinga2_enabled,
  )

  if $icinga2_enabled {
    include ::arthurjames::profile_icinga2
  }
}
