# == Class: arthurjames::profile_collectd
#
# ArthurJames specific configuration of collectd.
#
# === Parameters
#
# [*graphitehost*]
#   String to define the host of the graphite server where the metrics can be written to.
#
# [*graphite_port*]
#   Integer to define the port on which the graphite server is listening.
#
# [*parameterless_plugins*]
#   Array of plugins that can be added with collectd::plugin
#   Default value: ['entropy','load','memory','processes','swap','uptime']
#
# [*plugin_cpu_reportbystate*]
#   Boolean. When set to <tt>true</tt>, the default, reports per-state metrics,
#   e.g. "system", "user" and "idle". When set to <tt>false</tt>, 
#   aggregates all non-idle states into one "active" metric.
#
# [*plugin_cpu_reportbycpu*]
#   Boolean. When set to <tt>true</tt>, the default, reports per-cpu (per-core)
#   metrics. When set to <tt>false</tt>, instead of reporting metrics for 
#   individual cpus, only a global sum of cpu states is emitted.
#
# [*plugin_cpu_valuespercentage*]
#   Boolean. This option is only considered when both <tt>plugin_cpu_reportbystate</tt>
#   and <tt>plugin_cpu_reportbycpu</tt> are set to <tt>true</tt>. In this case
#   by default, metrics will be reported as Jiffies. By setting this option to
#   <tt>true</tt>, you can request percentage values in the un-aggregated (per-
#   cpu, per-state) mode as well.
#
# [*plugin_df_fstypes*]
#   Array containing all filesystemtypes that should be monitered. 
#   Default: ['nfs', 'tmpfs', 'autofs', 'gpfs', 'proc', 'devpts']
#
# [*plugin_df_ignoreselected*]
#   Boolean. If set to <tt>true</tt> the given mountpoints will NOT be monitored.
#   Default: true
#
# [*plugin_df_mountpoints*] 
#   Array containing the mountpoints that should be monitored.
#   Default: ['/', '/var', '/var/log', '/tmp', '/usr']
#
# [*plugin_df_reportbydevice*]
#   Boolean. Report using the device name rather than the mountpoint. i.e. with <tt>false</tt>
#   the default, it will report a disk as "root", but with true, it will be "sda1".
#
# [*plugin_df_reportinodes*]
#   Boolean. Enables or disables reporting of free, reserved and used inodes. 
#   Default: false.
#
# [*plugin_df_valuesabsolute*]
#   Boolean. Enables or disables reporting of free and used diskspace in 1k blocks.
#   Default: true.
#
# [*plugin_df_valuespercentage*]
#   Boolean. Enables or disables reporting of free and used disk space in percentage.
#   Default: false.
#
# [*plugin_disk_disks*]
#   Array.
#   Default: ['/^dm/', '/[0-9]/']
#
# [*plugin_disk_ignoreselected*]
#   Boolean.
#   Default: false
#
# [*plugin_disk_interval*] 
#   Integer.
#   Default: undef
#
# [*plugin_genericjmx_connection*]
#   Boolean.
#   Default: false
#
# [*plugin_genericjmx_connection_params*]
#   Hash.
#   Default: {
#     collect         => undef,
#     service_url     => undef,
#     host            => $name,
#     user            => undef,
#     password        => undef,
#     instance_prefix => undef 
#   } 
#
# [*plugin_genericjmx_mbean*]
#   Boolean.
#   Default: false
#
# [*plugin_genericjmx_mbean_params*]
#   Hash.
#   Default: { 
#     object_name     => undef,
#     values          => [],
#     instance_prefix => undef,
#     instance_from   => undef
#   }
#
# [*plugin_interface_interfaces*]
#   Array.
#   Default: ['lo']
#
# [*plugin_interface_ignoreselected*]
#   Boolean.
#   Default: true
#
# [*plugin_java*]
#   Boolean.
#   Default: false
#
# [*plugin_network_listener_ip*]
#   IP-address the collectd monitor should listen to
#   Default: 0.0.0.0
#
# [*plugin_network_server*]
#   Hostname of the central collectd server your instance is writing to. 
#
# [*plugin_network_port*]
#   Port of the central collectd instance.
#   Default: 25826
#
# [*plugin_write_graphite_graphitehost*]
#   Hostname of graphite server your instance is writing to.
#
# [*plugin_write_graphite_graphiteport*]
#   Port of graphite server. 
#
# [*plugin_write_graphite_graphiteprefix*]
#   String, that's being prefixed to your metrics.
#   Default:  ''
#
# [*plugin_write_graphite_graphite_protocol*]
#   Protocol that's being used to write to graphite. Either <tt>tcp</tcp> or <tt>udp</tt>.
#   Default: 'tcp'
#
# [*purge*]
#   Boolean. 
#
# [*purge_config*]
#   Boolean. 
#
# [*recurse*]
#   Boolean.
#
# [*write_graphite*]
#   Boolean. If set to <tt>true</tt>, the default value, this collectd
#   instance writes directly to graphite.
#
# === Examples
#
#  include ::arthurjames::profile_collectd
#
#  If user of this profile wants to use a different plugin, then he
#  should put that in his own profile. For instance,
#
#  collectd::plugin::genericjmx::connection {
#    'java_app':
#      host        => $fqdn,
#      service_url => 'service:jmx:rmi:///jndi/rmi://localhost:3637/jmxrmi',
#      collect     => ['memory-heap', 'memory-noheap', 'garbage_collector']
#  }
#
#
# === Copyright
#
# Copyright 2016 Melange IT B.V.
#
class arthurjames::profile_collectd (
  $plugin_network_listener                = false,
  $fqdnlookup                             = false,
  $graphitehost                           = 'graphite-gold.europe.intranet',
  $graphiteport                           = 2003,
  $parameterless_plugins                  = [
    'entropy',
    'load',
    'memory',
    'processes',
    'swap',
    'uptime'
  ],
  $plugin_cpu_reportbystate                = true,
  $plugin_cpu_reportbycpu                  = false,
  $plugin_cpu_valuespercentage             = true,
  $plugin_df_fstypes                       = ['nfs', 'tmpfs', 'autofs', 'gpfs', 'lvm', 'proc', 'devpts'],
  $plugin_df_mountpoints                   = ['/', '/var', '/var/log', '/tmp', '/usr'],
  $plugin_df_ignoreselected                = true,
  $plugin_df_reportbydevice                = false,
  $plugin_df_reportinodes                  = false,
  $plugin_df_valuesabsolute                = true,
  $plugin_df_valuespercentage              = false,
  $plugin_disk_disks                       = ['/^dm/', '/[0-9]/'],
  $plugin_disk_ignoreselected              = false,
  $plugin_disk_interval                    = undef,
  $plugin_genericjmx_connection            = false,
  $plugin_genericjmx_connection_params     = {},
  $plugin_genericjmx_mbean                 = false,
  $plugin_genericjmx_mbean_params          = {},
  $plugin_java                             = false,
  $plugin_interface_interfaces             = ['lo'],
  $plugin_interface_ignoreselected         = true,
  $plugin_network_listener_ip              = '0.0.0.0',
  $plugin_network_port                     = 25826,
  $plugin_write_graphite_graphiteprefix    = undef,
  $plugin_write_graphite_graphite_protocol = 'tcp',
  $purge                                   = true,
  $purge_config                            = true,
  $recurse                                 = true,
  $version                                 = present,
  $write_graphite                          = true,
) {

  $plugin_network_server                   = $graphitehost
  $plugin_write_graphite_graphitehost      = $graphitehost
  $plugin_write_graphite_graphiteport      = $graphiteport

  # validate boolean params
  validate_bool(
    $plugin_network_listener,
    $fqdnlookup,
    $plugin_cpu_reportbystate,
    $plugin_cpu_reportbycpu,
    $plugin_cpu_valuespercentage,
    $plugin_df_ignoreselected,
    $plugin_df_reportbydevice,
    $plugin_df_reportinodes,
    $plugin_df_valuesabsolute,
    $plugin_df_valuespercentage,
    $plugin_disk_ignoreselected,
    $plugin_genericjmx_connection,
    $plugin_genericjmx_mbean,
    $plugin_java,
    $plugin_interface_ignoreselected,
    $purge,
    $purge_config,
    $recurse,
    $write_graphite
  )

  # validate integer params
  validate_integer(
    $graphiteport,
    $plugin_network_port
  )

  # validate ip addresses
  validate_ip_address($plugin_network_listener_ip)
  
  # validate string parameters
  validate_string($graphitehost)

  # validate array params
  validate_array(
    $parameterless_plugins,
    $plugin_df_fstypes,
    $plugin_df_mountpoints,
    $plugin_disk_disks,
    $plugin_interface_interfaces
  )

  # validate hash params
  validate_hash(
    $plugin_genericjmx_connection_params,
    $plugin_genericjmx_mbean_params
  )

  class { '::collectd':
    fqdnlookup   => $fqdnlookup,
    purge        => $purge,
    purge_config => $purge_config,
    recurse      => $recurse,
    version      => $version
  }

  ## Check if this is the central collectd server. It should receive data from
  ## all other collectd intances.
  if $plugin_network_listener {
    ## network plugin can send values to OR receive values from other instances.
    collectd::plugin::network::listener{ $plugin_network_listener_ip:
      port => $plugin_network_port
    }
  }

  ## Either write directly to graphite, or write to central collectd server
  if $write_graphite {
    ## plugin write_graphite stores values in carbon.
    collectd::plugin::write_graphite::carbon { $plugin_write_graphite_graphitehost:
      graphitehost   => $plugin_write_graphite_graphitehost,
      graphiteport   => $plugin_write_graphite_graphiteport,
      graphiteprefix => $plugin_write_graphite_graphiteprefix,
      protocol       => $plugin_write_graphite_graphite_protocol
    }
  } else {
    ## plugin network server provides a central collectd instance.
    collectd::plugin::network::server{ $plugin_network_server:
      port => $plugin_network_port,
    }
  }

  ## cpu plugin collects cpu usage metrics.
  class { 'collectd::plugin::cpu':
    reportbystate    => $plugin_cpu_reportbystate,
    reportbycpu      => $plugin_cpu_reportbycpu,
    valuespercentage => $plugin_cpu_valuespercentage
  }

  ## disk plugin collects information about the usage of physical disks and 
  ## logical disks (partitions).d
  class { 'collectd::plugin::disk':
    disks          => $plugin_disk_disks,
    ignoreselected => $plugin_disk_ignoreselected,
    interval       => $plugin_disk_interval
  }

  ## df plugin
  class { 'collectd::plugin::df':
    fstypes          => $plugin_df_fstypes,
    ignoreselected   => $plugin_df_ignoreselected,
    mountpoints      => $plugin_df_mountpoints,
    reportbydevice   => $plugin_df_reportbydevice,
    reportinodes     => $plugin_df_reportinodes,
    valuesabsolute   => $plugin_df_valuesabsolute,
    valuespercentage => $plugin_df_valuespercentage
  }

  ## interface plugin
  class { 'collectd::plugin::interface':
    interfaces     => $plugin_interface_interfaces,
    ignoreselected => $plugin_interface_ignoreselected
  }

  collectd::plugin { $parameterless_plugins: }

  ## and last, but not least all plugins any user would like to use

  if $plugin_java {
    class { 'collectd::plugin::java': }
  }

  if $plugin_genericjmx_mbean or $plugin_genericjmx_connection {

    file{'/etc/ld.so.conf.d/java.conf':
      ensure  => present,
      content => '/usr/lib/jvm/jre/lib/amd64/server/'
    } ~>
    exec{'ldconfig':
      path => ['/usr/bin', '/usr/sbin', '/sbin']
    }
  }

  if $plugin_genericjmx_mbean {
    create_resources( 'collectd::plugin::genericjmx::mbean', $plugin_genericjmx_mbean_params )
  }

  if $plugin_genericjmx_connection {
    create_resources( 'collectd::plugin::genericjmx::connection', $plugin_genericjmx_connection_params )
  }
}
