# == Class: acme::role::webserver
#
class acme::role::webserver {
  include acme::profile::website::production
  include acme::profile::website::testing

  include acme::profile::base
}
