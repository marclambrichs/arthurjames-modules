# == class arthurjames::profile_logrotate
#
#
class arthurjames::profile_logrotate (
  $compress = true,
  $create   = true,
  $dataext  = true,
  $ensure   = present,
  $rules    = {},
){
  
  class { '::logrotate':
    ensure => $ensure,
    config => {
      compress => $compress,
      create   => $create,
      dateext  => $dataext,
    },
    rules  => $rules,
  }
}
