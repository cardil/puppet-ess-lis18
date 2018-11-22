# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include motd
class motd {

  $os = "${::operatingsystem} ${::operatingsystemrelease}"

  file { '/etc/motd':
    ensure  => file,
    mode    => '0644',
    content => epp('motd/motd.epp', {
      'id'       => md5($::macaddress),
      'os'       => $os,
      'ip'       => $::ipaddress,
      'pversion' => $::puppetversion,
      'fqdn'     => $::fqdn,
    }),
  }

}
