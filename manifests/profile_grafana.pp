# == Class arthurjames::profile_grafana
#
#
class arthurjames::profile_grafana {

  class { 'grafana':
    install_method => 'repo',
    cfg            => {
      server   => {
        http_addr => '127.0.0.1',
      },
      database => {
        'type'   => 'sqlite3',
        host     => '127.0.0.1:3306',
        name     => 'grafana',
        user     => 'root',
        password => '',
      },
      users    => {
        allow_sign_up => false,
      },
    },

  }

  apache::vhost { 'grafana.test.vagrant':
    port       => '80',
    docroot    => '/var/www',
    proxy_dest => 'http://127.0.0.1:3000',
  }
}
