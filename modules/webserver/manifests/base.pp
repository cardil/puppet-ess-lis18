# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include webserver::base
class webserver::base {

  include webserver::params

  package { $webserver::params::packagename:
    ensure => 'present'
  }

  file { "${webserver::params::conf_dir}/apache.properties":
    ensure  => 'file',
    content => 'puppetiezed = true',
    require => Package[$webserver::params::packagename],
  }

  service { $webserver::params::servicename:
    ensure    => 'running',
    subscribe => File["${webserver::params::conf_dir}/apache.properties"],
  }
}
