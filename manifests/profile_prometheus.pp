# == class arthurjames::profile_prometheus
#
#
class arthurjames::profile_prometheus (
){

  Package { ensure => 'installed' }

  $packages = [ 'golang' ]

  package { $packages: }

}
