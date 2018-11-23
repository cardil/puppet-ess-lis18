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

exec { 'librarian-puppet install':
  command => 'librarian-puppet install --verbose && puppet module list --tree --environment vagrant | md5sum > Puppetfile.md5',
  cwd     => '/vagrant',
  path    => '/opt/puppetlabs/puppet/bin:/usr/bin',
  unless  => 'md5sum -c Puppetfile.md5',
  require => [
    File["${::settings::codedir}/environments/vagrant"],
    Package['librarian-puppet'],
    Package['git']
  ],
}
