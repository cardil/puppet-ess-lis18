# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include users::admins
class users::admins {
  group { 'sudo':
    ensure => 'present',
  }

  user { 'ksuszynski':
    ensure     => present,
    comment    => 'Krzysztof Suszyński',
    home       => '/home/ksuszynski',
    uid        => fqdn_rand(2000, 'ksuszynski') + 1000,
    groups     => ['sudo'],
    managehome => true,
  }
}
