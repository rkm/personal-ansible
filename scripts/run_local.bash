#!/usr/bin/env bash

set -euxo pipefail

ansible-playbook \
    -i "localhost," \
    site.yaml \
    "$@"
