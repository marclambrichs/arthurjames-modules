#
class arthurjames::profile_relay (
  $relay_type = undef
){
  case $relay_type {
    'carbon-c-relay': {
      include carbon_c_relay
    }
    'carbon-relay-ng': {
      include carbon_relay_ng
    }
    default: {
      fail("Relay type ${relay_type} is not implemented.")
    }
  }
}
