#!/usr/bin/env bash

set -euxo pipefail

ANSIBLE_CONFIG=/home/rkm/.config/ansible.cfg \
ANSIBLE_HOST_KEY_CHECKING=False \
    /usr/bin/ansible-playbook \
    -i "localhost," \
    site.yaml \
    "$@"
