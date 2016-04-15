# == class arthurjames::profile_logrotate
#
#
class arthurjames::profile_logrotate {
  
  class { '::logrotate':
    ensure => present,
    config => {
      compress => true
    }
  }
}
