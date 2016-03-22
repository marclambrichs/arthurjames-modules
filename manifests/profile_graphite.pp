# == Class arthurjames::profile_graphite
#
#
class arthurjames::profile_graphite (
){
  class { 'graphite_web': }
  class { 'carbon': }
}
