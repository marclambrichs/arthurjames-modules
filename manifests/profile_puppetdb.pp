class arthurjames::profile_puppetdb (
  $puppetdb_version   = '2.3.8-1puppetlabs1'
){

  # Configure puppetdb and its underlying database
  class { '::puppetdb::globals':
    version => $puppetdb_version
  }
  class { '::puppetdb': }

}
