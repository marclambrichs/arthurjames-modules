class arthurjames::profile_puppetdb (
  $listen_address     = '0.0.0.0',
  $manage_firewall    = false,
  $ssl_listen_address = '0.0.0.0'
){

  # Configure puppetdb and its underlying database
  class { '::puppetdb':
    listen_address     => $listen_address,
    manage_firewall    => $manage_firewall,
    ssl_listen_address => $ssl_listen_address
  }
}
