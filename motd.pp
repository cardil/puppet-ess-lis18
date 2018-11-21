$id = md5($::macaddress)
$content = "Witaj,

Jesteś na ${::fqdn} zarządzanej przez Puppet ${::puppetversion}.

IP: ${::ipaddress}
OS: ${::operatingsystem} ${::operatingsystemrelease}
ID: ${id}
"

file { '/etc/motd':
  ensure  => file,
  mode    => '0644',
  content => $content,
}

notify { 'Hallo':
  loglevel => 'debug',
}
