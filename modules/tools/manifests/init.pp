# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include tools
class tools {
  if $::osfamily == 'RedHat' {
    require epel
  }

  $packages = [
    'vim',
    'git',
    'htop',
    'iotop',
  ]

  each($packages) |$package| {
    package { $package:
      ensure => installed,
    }
  }
}
