#!/usr/bin/env bash

set -e
set -o pipefail

curl https://raw.githubusercontent.com/coi-gov-pl/puppeter/master/setup.sh | bash
puppeter -a "/vagrant/${1}" | bash
