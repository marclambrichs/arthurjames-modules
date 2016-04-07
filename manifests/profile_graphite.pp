# == Class arthurjames::profile_graphite
#
#
class arthurjames::profile_graphite (
  ### graphite-web pkg variables
  $django_version                = present,
  $django_tagging_version        = present,
  $graphite_web_version          = present,
  $mod_wsgi_version              = present,
  $pycairo_version               = present,
  $python_memcached_version      = present,
  $pytz_version                  = present,

  ### carbon pkg variables
  $carbon_version                = present,
  $twisted_version               = present,
  $whisper_version               = present,

  ### graphite-web variables
  $apache_service_name           = 'httpd',
  $webapp_dir                    = '/etc/graphite-web',

  ### carbon-cache variables
  $carbon_cache_write_strategy   = 'sorted',
  $carbon_cache_enabled          = true,
  $carbon_caches                 = {},
  $carbon_metric_interval        = 60,
  $carbon_metric_prefix          = 'carbon',
  $carbon_local_data_dir         = '/var/lib/carbon/whisper',
  $carbon_log_dir                = '/var/log/carbon',
  $carbon_max_cache_size         = 'inf',
  $carbon_max_creates_per_minute = 50,
  $carbon_max_updates_per_second = 500,
  $carbon_pid_dir                = '/var/run',
  $carbon_storage_aggregations   = [],
  $carbon_storage_schemas        = [],
  
  ### graphite-web local_setings.py variables
  $content_dir                   = '/usr/share/graphite/webapp/content',
  $db_name                       = '/var/lib/graphite-web/graphite.db',
  $db_engine                     = undef,
  $graphite_root                 = '/usr/share/graphite',
  $db_index_file                 = '/var/lib/graphite-web/index',
  $gw_log_dir                    = '/var/log/graphite-web',
  $memcached_enabled             = true,
  $memcached_hosts               = ['127.0.0.1:11211'],
  $timezone                      = 'Europe/Amsterdam',
  $whisper_dir                   = '/var/lib/carbon/whisper',
  $vhosts                        = {},

  ### both graphite-web and carbon
  $config_dir                    = '/etc/carbon',
  $manage_packages               = true,
  $storage_dir                   = '/var/lib/carbon',
){

  class { 'graphite_frontend':
    apache_service_name         => $apache_service_name,
    gw_django_version           => $django_version,
    gw_django_tagging_version   => $django_tagging_version,
    gw_graphite_web_version     => $graphite_web_version,
    gw_mod_wsgi_version         => $mod_wsgi_version,
    gw_pycairo_version          => $pycairo_version,
    gw_python_memcached_version => $python_memcached_version,
    gw_pytz_version             => $pytz_version,
    gw_webapp_dir               => $webapp_dir,
    ls_conf_dir                 => $config_dir,
    ls_content_dir              => $content_dir,
    ls_db_engine                => $db_engine,
    ls_db_name                  => $db_name,
    ls_graphite_root            => $graphite_root,
    ls_index_file               => $db_index_file,
    ls_log_dir                  => $gw_log_dir,
    ls_memcached_hosts          => $memcached_hosts,
    ls_storage_dir              => $storage_dir,
    ls_timezone                 => $timezone,
    ls_whisper_dir              => $whisper_dir,
    manage_packages             => $manage_packages,
    memcached_enabled           => $memcached_enabled,
    vhosts                      => $vhosts,
  }

  class { 'carbon':
    cc_cache_write_strategy   => $carbon_cache_write_strategy,
    cc_carbon_caches          => $carbon_caches,
    cc_carbon_metric_interval => $carbon_metric_interval,
    cc_carbon_metric_prefix   => $carbon_metric_prefix,
    cc_local_data_dir         => $carbon_local_data_dir,
    cc_log_dir                => $carbon_log_dir,
    cc_max_cache_size         => $carbon_max_cache_size,
    cc_max_creates_per_minute => $carbon_max_creates_per_minute,
    cc_max_updates_per_second => $carbon_max_updates_per_second,
    cc_pid_dir                => $carbon_pid_dir,
    cc_storage_aggregations   => $carbon_storage_aggregations,
    cc_storage_dir            => $storage_dir,
    cc_storage_schemas        => $carbon_storage_schemas,
    gr_carbon_ver             => $carbon_version,
    gr_enable_carbon_cache    => $carbon_cache_enabled,
    gr_twisted_ver            => $twisted_version,
    gr_whisper_ver            => $whisper_version,
  }
}
