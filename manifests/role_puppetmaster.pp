class arthurjames::role_puppetmaster {
  include ::arthurjames::profile_puppetdb
  include ::arthurjames::profile_puppet
  include ::arthurjames::profile_foreman

  Class['::puppet'] -> Class['::foreman_proxy']
  Class['::puppet::server::service'] -> Class['::puppetdb::server']
  Class['::foreman'] -> Class['::puppetdb::server']
}
