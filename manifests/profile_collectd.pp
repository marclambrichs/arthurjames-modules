# == Class: arthurjames::profile_collectd
#
# ArthurJames specific configuration of collectd.
#
# === Parameters
#
# [*graphitehost*]
#   String to define the url of the graphite server where the metrics can be written to.
#
# [*graphiteport*]
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
# [*plugin_genericjmx*]
#   Boolean. Enables or disables genericjmx plugin. Reads mbeans from mbeanserver
#   using jmx.
#   Default: false.
#
# [*plugin_genericjmx_mbean_params*]
#   Hash.
#   Default: {}.
#
# [*plugin_genericjmx_connection_params*]
#   Hash.
#   Default: {}.
#
# [*plugin_interface_interfaces*]
#   Array.
#   Default: ['lo']
#
# [*plugin_interface_ignoreselected*]
#   Boolean.
#   Default: true
#
# [*plugin_network_port*]
#   Port of the central collectd instance.
#   Default: 25826
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
# === Authors
#
# Author Name <marc.lambrichs@gmail.com>
#
# === Copyright
#
# Copyright 2016 Marc Lambrichs
#
class arthurjames::profile_collectd (
  $fqdnlookup                              = false,
  $graphitehost                            = 'graphite.arthurjames.vagrant',
  $graphiteport                            = 2003,
  $parameterless_plugins                   = [
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
  $plugin_df_fstypes                       = ['nfs', 'tmpfs', 'autofs', 'gpfs', 'proc', 'devpts'],
  $plugin_df_mountpoints                   = ['/', '/var', '/var/log', '/tmp', '/usr'],
  $plugin_df_ignoreselected                = true,
  $plugin_df_reportbydevice                = false,
  $plugin_df_reportinodes                  = false,
  $plugin_df_valuesabsolute                = true,
  $plugin_df_valuespercentage              = false,
  $plugin_disk_disks                       = ['/^dm/', '/[0-9]/'],
  $plugin_disk_ignoreselected              = false,
  $plugin_disk_interval                    = undef,
  $plugin_genericjmx                       = false,
  $plugin_genericjmx_mbean_params          = {},
  $plugin_genericjmx_connection_params     = {},
  $plugin_interface_interfaces             = ['lo'],
  $plugin_interface_ignoreselected         = true,
  $plugin_network_listener                 = false,
  $plugin_network_port                     = 25826,
  $plugin_write_graphite_graphiteprefix    = '',
  $plugin_write_graphite_graphite_protocol = 'tcp',
  $purge                                   = true,
  $purge_config                            = true,
  $recurse                                 = true,
  $version                                 = latest,
  $write_graphite                          = true,
) {

  validate_bool( $plugin_genericjmx )
  if $plugin_genericjmx {
    validate_hash( $plugin_genericjmx_mbean_params )
    validate_hash( $plugin_genericjmx_connection_params )
  }

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
    collectd::plugin::network::listener{ '0.0.0.0':
      port => $plugin_network_port
    }
  }

  ## Either write directly to graphite, or write to central collectd server
  if $write_graphite {
    ## plugin write_graphite stores values in carbon.
    collectd::plugin::write_graphite::carbon { $graphitehost:
      graphitehost   => $graphitehost,
      graphiteport   => $graphiteport,
      graphiteprefix => $plugin_write_graphite_graphiteprefix,
      protocol       => $plugin_write_graphite_graphite_protocol
    }
  } else {
    ## plugin network server provides a central collectd instance.
    collectd::plugin::network::server{ $graphitehost:
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
  if $plugin_genericjmx {
    notify { 'plugin_genericjmx enabled': }
    ## map mbean attributes to types used by collectd
    create_resources( 'collectd::plugin::genericjmx::mbean', $plugin_genericjmx_mbean_params )
    ## define parameters to connect to a MBeanServer and what data to collect
    create_resources( 'collectd::plugin::genericjmx::connection', $plugin_genericjmx_connection_params )
  }
    
}
