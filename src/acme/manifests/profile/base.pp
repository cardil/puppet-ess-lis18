# == Class: acme::profile::base
#
class acme::profile::base {
  include users
  include motd
  include tools
}
