# == class arthurjames::profile_openldap
#
#
class arthurjames::profile_openldap (
  $entries = {}
){

  class { 'ldap::server':
    suffix     => 'dc=arthurjames,dc=vagrant',
    rootdn     => 'cn=admin,dc=arthurjames,dc=vagrant',
    rootpw     => 'changeme',
    ssl        => true,
    ssl_cacert => '/etc/ssl/certs/ca.pem',
    ssl_cert   => '/etc/ssl/certs/ldapserver.crt',
    ssl_key    => '/etc/ssl/private/ldapserver.key',
  }

  $dn = domain2dn($::domain)

  $ldap_defaults = {
    ensure => present,
    base   => $dn,
    host   => 'localhost',
    port   => 389,
    ssl    => false,
    username => "cn=admin,${dn}",
    password => 'password'
  }

  $password = sha1digest('changeme')

  create_resources('ldap_entry',$entries,$ldap_defaults)
}
