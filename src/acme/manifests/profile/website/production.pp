# == Class: acme::profile::website::production
#
class acme::profile::website::production {
  webserver::vhost { 'www.acme.com':
    docroot => '/var/www/www.acme.com',
  }
  file { '/var/www/www.acme.com/index.html':
    ensure  => 'file',
    content => '<h1 style="color:red">ACME</h1>',
  }
}
