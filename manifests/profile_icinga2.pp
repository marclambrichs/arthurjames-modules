# == Class arthurjames::profile_icinga2
#
#
class arthurjames::profile_icinga2 (
  $db_type           = 'pgsql',
  $db_host           = 'localhost',
  $db_port           = '5432',
  $db_name           = 'icinga2',
  $db_user           = 'icinga2',
  $db_pass           = 'changeme',
  $install_mailutils = true,
  $manage_database   = true,
){

  notify { 'icinga2 enabled': }

  class { 'postgresql::server': } ->

  class { 'icinga2':
    db_type           => $db_type,
    db_host           => $db_host,
    db_port           => $db_port,
    db_name           => $db_name,
    db_user           => $db_user,
    db_pass           => $db_pass,
    install_mailutils => $install_mailutils,
    manage_database   => $manage_database,
  }

  class { 'icingaweb2':
    install_method => 'package',
    initialize     => true,
  }

  class { 'icingaweb2::mod::monitoring': }

}
