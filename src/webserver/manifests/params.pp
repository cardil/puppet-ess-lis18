# Class: webserver::params
#
#
class webserver::params {
  if ! $::osfamily in ['RedHat', 'Debian'] {
    fail("webserver module - operating system is not supported: ${::operatingsystem}")
  }
  $servicename = $::osfamily ? {
    'RedHat' => 'httpd',
    'Debian' => 'apache2',
  }
  $packagename = $::osfamily ? {
    'RedHat' => 'httpd',
    'Debian' => 'apache2',
  }
  $conf_dir   = "/etc/${packagename}"
  $confd_dir = $::osfamily ? {
    'RedHat' => "${conf_dir}/conf.d",
    'Debian' => "${conf_dir}/conf-enabled",
  }
  $vhosts_dir = $::osfamily ? {
    'RedHat' => $confd_dir,
    'Debian' => "${conf_dir}/sites-enabled",
  }
}
