class arthurjames::profile_foreman (
  $foreman_admin_password = 'changeme',
  $foreman_host           = $::fqdn,
  $foreman_repo           = 'stable',
  $ssl                    = false
){

  class { '::foreman':
    admin_password => $foreman_admin_password,
    apipie_task    => 'apipie:cache:index',
    # Enable users authentication (default user:admin pw:changeme)
    authentication => true,
    db_manage      => true,
    # configure foreman via apache and passenger
    foreman_url    => "https://${foreman_host}",
    passenger      => true,
    repo           => $foreman_repo,
    selinux        => false,
    ssl            => $ssl,
    # should foreman manage host provisioning as well
    unattended     => true,
    # Enclose apache configuration in <VirtualHost>...</VirtualHost>
    use_vhost      => true
  }

  class { '::foreman_proxy':
    foreman_base_url => "http://${foreman_host}",
    bmc              => false,
    dhcp             => false,
    dns              => false,
    puppetca         => true,
    puppetrun        => true,
    tftp             => false,
    trusted_hosts    => [$::fqdn]
  }

  ::foreman::plugin { 'puppetdb':
    package => 'ruby-puppetdb-foreman'
  }

}
