# == class arthurjames::profile_postgresql
#
#
class arthurjames::profile_postgresql (
  $bindir                   = undef,
  $confdir                  = undef,
  $client_package_name      = undef,
  $createdb_path            = undef,
  $datadir                  = undef,
  $default_connect_settings = {},
  $default_database         = undef,
  $databases                = {},
  $encoding                 = undef,
  $group                    = undef,
  $initdb_path              = undef,
  $locale                   = undef,
  $logdir                   = undef,
  $log_line_prefix          = undef,
  $manage_pg_hba_conf       = undef,
  $manage_pg_ident_conf     = undef,
  $manage_recovery_conf     = undef,
  $manage_package_repo      = undef,
  $needs_initdb             = undef,
  $pg_hba_conf_defaults     = undef,
  $pg_hba_conf_path         = undef,
  $pg_ident_conf_path       = undef,
  $postgresql_conf_path     = undef,
  $psql_path                = undef,
  $recovery_conf_path       = undef,
  $server_package_name      = undef,
  $service_name             = undef,
  $service_provider         = undef,
  $service_status           = undef,
  $user                     = undef,
  $version                  = undef,
  $xlogdir                  = undef,
) {

  class { 'postgresql::globals':
    encoding            => $encoding,
    locale              => $locale,
    manage_package_repo => $manage_package_repo,
    version             => $version,
  }->
  class { 'postgresql::server':
  }

  create_resources( 'postgresql::server::db', $databases )
}
