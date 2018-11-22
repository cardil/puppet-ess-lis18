# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   webserver::vhost { 'namevar': }
define webserver::vhost(
  $docroot,
  $ensure = 'present',
  $servername = $name,
  $port = 80,
  $bind = '*',
  $custom_fragment = '',
  $create_docroot = true,
) {
  include webserver::base
  include webserver::params

  $ctx = {
    'docroot'         => $docroot,
    'servername'      => $servername,
    'port'            => $port,
    'bind'            => $bind,
    'custom_fragment' => $custom_fragment,
  }

  $ensurex = $ensure ? {
    'present' => 'file',
    default   => 'absent',
  }

  if $create_docroot {
    file { $docroot:
      ensure => 'directory',
      mode   => '0755',
    }
  }

  file { "${webserver::params::vhosts_dir}/vhost-${servername}.conf":
    ensure  => $ensurex,
    content => epp('webserver/vhost.epp', $ctx),
    notify  => Service[$webserver::params::servicename],
    require => [
      Package[$webserver::params::packagename],
      File[$docroot],
    ],
  }
}
