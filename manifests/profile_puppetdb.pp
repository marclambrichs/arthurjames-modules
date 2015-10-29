class arthurjames::profile_puppetdb (
  $listen_address     = '0.0.0.0',
  $manage_dbserver    = true,
  $manage_firewall    = false,
  $ssl_listen_address = '0.0.0.0',
  $puppetdb_version   = '2.3.8-1puppetlabs1'
){

  # Configure puppetdb and its underlying database
  class { '::puppetdb': }

}
