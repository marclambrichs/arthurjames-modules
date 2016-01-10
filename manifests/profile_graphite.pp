class arthurjames::profile_graphite (
){
  include ::carbon_relay_ng
  class { 'graphite': }
}
