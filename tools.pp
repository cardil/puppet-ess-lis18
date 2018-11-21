$packages = [
  'vim',
  'git',
]

package { $packages:
  ensure => installed,
}

# each($packages) |$package| {
#   package { $package:
#     ensure => installed,
#   }
# }
