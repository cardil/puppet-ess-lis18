# app-17.dc1.acme.com

user { 'ksuszynski':
  ensure  => present,
  comment => 'Krzysztof Suszyński',
  home    => '/home/ksuszynski',
  uid     => fqdn_rand(2000, 'ksuszynski') + 1000,
}

user { 'jdoe':
  ensure  => present,
  comment => 'John Doe',
  home    => '/home/jdoe',
  uid     => fqdn_rand(2000, 'jdoe') + 1000,
}
