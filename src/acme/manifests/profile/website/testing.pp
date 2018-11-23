# == Class: acme::profile::website::testing
#
class acme::profile::website::testing {
  webserver::vhost { 'testing.acme.com':
    docroot => '/var/www/testing.acme.com',
  }
  file { '/var/www/testing.acme.com/index.html':
    ensure  => 'file',
    content => '<h1>Testing ACME</h1>',
  }
}
