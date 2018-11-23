file { "${::settings::codedir}/environments/vagrant":
  ensure => link,
  mode   => '0644',
  target => '/vagrant',
}

package { 'git':
  ensure => installed,
}

package { 'librarian-puppet':
  ensure   => 'installed',
  provider => 'puppet_gem',
}

file { "${::settings::confdir}/autosign.conf":
  ensure  => 'file',
  mode    => '0640',
  owner   => 'puppet',
  group   => 'puppet',
  content => '*.vagrant.home',
}

exec { 'librarian-puppet install':
  command => 'librarian-puppet install --verbose && md5sum Puppetfile.lock > /tmp/Puppetfile.lock.md5',
  cwd     => '/vagrant',
  path    => '/opt/puppetlabs/puppet/bin:/usr/bin',
  unless  => 'md5sum -c /tmp/Puppetfile.lock.md5',
  require => [
    File["${::settings::codedir}/environments/vagrant"],
    Package['librarian-puppet'],
    Package['git']
  ],
}
