# == Class arthurjames::profile_memcached
#
#
class arthurjames::profile_memcached (
  $listen_ip       = '127.0.0.1',
  $logfile         = '/var/log/memcached.log',
  $max_connections = 1024,
  $max_memory      = 64,
  $pidfile         = '/var/run/memcached.pid',
  $package_ensure  = present,
  $service_manage  = true,
  $tcp_port        = 11211,
  $udp_port        = 11211,
) {

  validate_absolute_path( $logfile )
  validate_absolute_path( $pidfile )

  validate_bool( $service_manage )

  validate_integer([
    $max_connections,
    $max_memory,
    $tcp_port,
    $udp_port,
  ])

  validate_ip_address( $listen_ip )

  class { 'memcached':
    listen_ip       => $listen_ip,
    logfile         => $logfile,
    max_connections => $max_connections,
    max_memory      => $max_memory,
    pidfile         => $pidfile,
    package_ensure  => $package_ensure,
    service_manage  => $service_manage,
    tcp_port        => $tcp_port,
    udp_port        => $udp_port,
  }
}
