# == Class arthurjames::profile_grafana
#
#
class arthurjames::profile_grafana {

  class { 'grafana':
    install_method => 'repo',
    cfg            => {
      server           => {
        http_addr => '127.0.0.1',
      },
      database         => {
        'type' => 'sqlite3',
        path   => '/var/lib/grafana',
        name   => 'grafana',
      },
      users            => {
        allow_sign_up => false,
      },
      'auth.anonymous' => {
        enabled => true
      }
    },

  }

  apache::vhost { 'grafana.arthurjames.vagrant':
    port       => '80',
    docroot    => '/var/www',
    proxy_dest => 'http://127.0.0.1:3000',
  }
}
