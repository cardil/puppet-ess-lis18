#!/usr/bin/env bash

curl https://raw.githubusercontent.com/coi-gov-pl/puppeter/master/setup.sh | bash
puppeter -a /vagrant/puppeter-ansers.yml | bash
