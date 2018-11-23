#!/usr/bin/env bash

set -e
set -o pipefail

puppet apply --show_diff /vagrant/scripts/setup-master.pp
puppet module list --tree --environment vagrant
