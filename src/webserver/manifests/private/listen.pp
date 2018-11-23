# == Define: webserver::private::listen
#
define webserver::private::listen (
  $ensure = 'present',
  $port = 0 + $title,
) {
  include webserver::params

  file { "${webserver::params::confd_dir}/listen-${port}.conf":
    ensure  => $ensure,
    content => epp('webserver/listen.epp', {
      'port' => $port,
    }),
    notify  => Service[$webserver::params::servicename],
    require => Package[$webserver::params::packagename],
  }
}
