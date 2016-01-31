#
class arthurjames::profile_relay (
  $relay_type = undef
){
  case $relay_type {
    'carbon-c-relay': {
      include carbon-c-relay
    }
    'carbon-relay-ng': {
      include carbon-relay-ng
    }
    default: {
    }
  }
}
