class arthurjames::profile_couchdb (
){
  include couchdb
  couchdb::instance { 'main':
    port           => '5985',
    www_auth       => true,
    admin_login    => 'admin',
    admin_password => 'admin'
  }
  couchdb::db { 'test': }
}
