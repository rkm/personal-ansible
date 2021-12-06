#!/usr/bin/env bash

set -euxo pipefail

/usr/bin/ansible-playbook \
    -i "localhost," \
    site.yaml \
    "$@"
