class arthurjames::profile_puppetdb (
  $listen_address     = '0.0.0.0',
  $manage_dbserver    = true,
  $manage_firewall    = false,
  $ssl_listen_address = '0.0.0.0',
  $puppetdb_version   = '2.3.8-1puppetlabs1'
){

  class{ '::puppetdb::globals':
    puppetdb_version   => $puppetdb_version
  }

  # Configure puppetdb and its underlying database
  class { '::puppetdb':
    listen_address     => $listen_address,
    manage_dbserver    => $manage_dbserver,
    manage_firewall    => $manage_firewall,
    ssl_listen_address => $ssl_listen_address
  }
}
