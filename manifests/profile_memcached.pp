# == class arthurjames::profile_memcached
#
class arthurjames::profile_memcached (
  $listen_ip       = '127.0.0.1',
  $max_connections = 1024,
  $max_memory      = 64,
) {

  validate_integer([
    $max_connections,
    $max_memory
  ])

  validate_ip_address( $listen_ip )

  class { 'memcached':
    listen_ip       => $listen_ip,
    max_connections => $max_connections,
    max_memory      => $max_memory,
  }
}
