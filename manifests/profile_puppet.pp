class arthurjames::profile_puppet (
  $dns_alt_names               = [$::fqdn],
  $puppetmaster                = $::fqdn,
  $runmode                     = 'cron',
  $server                      = false,
  $server_ca                   = false,
  $server_common_modules_path  = [],
  $server_environments         = [],
  $server_foreman              = false,
  $server_foreman_url          = undef,
  $server_external_nodes       = '/etc/puppet/node.rb',
  $server_implementation       = undef,
  $server_parser               = 'future',
  $server_passenger            = false,
  $server_puppetdb_host        = undef,
  $server_reports              = 'puppetdb,foreman',
  $server_storeconfigs_backend = 'puppetdb',
  $show_diff                   = true,
  $splay                       = true
){

  # agent and master:
  class { '::puppet':
    dns_alt_names               => $dns_alt_names,
    puppetmaster                => $puppetmaster,
    runmode                     => $runmode,
    server                      => $server,
    server_ca                   => $server_ca,
    server_common_modules_path  => $server_common_modules_path,
    server_environments         => $server_environments,
    server_foreman              => $server_foreman,
    server_foreman_url          => $server_foreman_url,
    server_external_nodes       => $server_external_nodes,
    server_implementation       => $server_implementation,
    server_parser               => $server_parser,
    server_passenger            => $server_passenger,
    server_puppetdb_host        => $server_puppetdb_host,
    server_reports              => $server_reports,
    server_storeconfigs_backend => $server_storeconfigs_backend,
    show_diff                   => $show_diff,
    splay                       => $splay
  }
}
