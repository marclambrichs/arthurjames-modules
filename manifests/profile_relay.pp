#
class arthurjames::profile_relay (
  $group      = 'carbon-c-relay',
  $user       = 'carbon-c-relay',
  $relay_type = undef,
){
  case $relay_type {
    'carbon-c-relay': {
      class { 'carbon_c_relay':
        group => $group,
        user  => $user,
      }
    }
    'carbon-relay-ng': {
      include carbon_relay_ng
    }
    default: {
      fail("Relay type ${relay_type} is not implemented.")
    }
  }
}
