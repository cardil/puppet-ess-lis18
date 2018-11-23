# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include acme::sites
class acme::sites {
  webserver::vhost { 'testing.acme.com':
    docroot => '/var/www/testing.acme.com',
  }
  webserver::vhost { 'www.acme.com':
    docroot => '/var/www/www.acme.com',
  }

  file { '/var/www/testing.acme.com/index.html':
    ensure  => 'file',
    content => '<h1>Testing ACME</h1>',
  }

  file { '/var/www/www.acme.com/index.html':
    ensure  => 'file',
    content => '<h1 style="color:red">ACME</h1>',
  }
}
