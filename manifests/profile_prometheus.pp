# == class arthurjames::profile_prometheus
#
#
class arthurjames::profile_prometheus (
  $apache_service_name = 'httpd'
){
  
  include apache

  selboolean { 'httpd_can_network_connect':
    persistent => true,
    value      => on,
  }

  Selboolean['httpd_can_network_connect'] ~> Service[$apache_service_name]
}
