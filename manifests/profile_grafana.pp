# == Class arthurjames::profile_grafana
#
#
#-;log_rotate = true
#-
#-# Max line number of single file, default is 1000000
#-;max_lines = 1000000
#-
#-# Max size shift of single file, default is 28 means 1 << 28, 256MB
#-;max_lines_shift = 28
#-
#-# Segment log daily, default is true
#-;daily_rotate = true
#-
#-# Expired days of log file(delete after max days), default is 7
#-;max_days = 7
class arthurjames::profile_grafana (
  $logmode = 'console, file'
){

  class { 'grafana':
    install_method => 'repo',
    cfg            => {
      server            => {
        protocol  => 'http',
        http_addr => '127.0.0.1',
      },
      'auth.anonymous'  => {
        enabled  => true,
        org_name => 'ArthurJames',
        org_role => 'Viewer'
      },
      'auth.basic'      => {
        enabled => true
      },
      'auth.proxy'      => {
        enabled         => false,
        header_name     => 'X-WEBAUTH-USER',
        header_property => 'username',
        auto_sign_up    => true,
      },
      event_publisher   => {
        enabled      => false,
        rabbitmq_url => '',
        exchange     => 'grafana_events',
      },
      'dashboards.json' => {
        enabled => false,
        path    => '/var/lib/grafana/dashboards',
      },
      database          => {
        'type' => 'sqlite3',
        path   => '/var/lib/grafana/grafana.db',
        name   => 'grafana',
      },
      log               => {
        mode       => $logmode,
        buffer_len => 10000,
        level      => 'Info',
      },
      'log.console'     => {
        level => '',
      },
      'log.file'        => {
        log_rotate      => true,
        max_lines       => 1000000,
        max_lines_shift => 28,
        daily_rotate    => true,
        max_days        => 7,
      },
      security          => {
        admin_user                  => 'admin',
        admin_password              => 'changeme',
        secret_key                  => 'inWSYLbKCoLko',
        login_remember_days         => 7,
        cookie_username             => 'grafana_user',
        cookie_remember_name        => 'grafana_remember',
        disable_gravatar            => false,
        data_source_proxy_whitelist => '',
      },
      users             => {
        allow_sign_up        => true,
        allow_org_create     => false,
        auto_assign_org      => true,
        auth_assign_org_role => 'Viewer'
      },

    },

  }

  apache::vhost { 'grafana.arthurjames.vagrant':
    port       => '80',
    docroot    => '/var/www',
    proxy_dest => 'http://127.0.0.1:3000',
  }
}

