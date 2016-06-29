# == Class arthurjames::profile_icinga2
#
#
class arthurjames::profile_icinga2 (
){

  class { 'icinga2':
    db_type         => 'pgsql',
    db_host         => 'localhost',
    db_port         => '5432',
    db_name         => 'icinga2_data',
    db_user         => 'icinga2',
    db_pass         => 'password',
    manage_database => true,
  }

}
