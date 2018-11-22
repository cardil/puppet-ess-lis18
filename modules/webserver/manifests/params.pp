# Class: webserver::params
#
#
class webserver::params {
  $servicename = 'httpd'
  $packagename = 'httpd'

  $conf_dir   = "/etc/${packagename}"
  $vhosts_dir = "${conf_dir}/conf.d"
}
