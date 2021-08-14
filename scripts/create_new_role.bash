#!/usr/bin/env bash

set -uo pipefail

if [ $# -ne 1 ]; then
    echo "Error: Usage $0 <role name>"
    exit 1
fi

set -ex

mkdir -p roles/"$1"/defaults
mkdir -p roles/"$1"/meta
mkdir -p roles/"$1"/tasks
mkdir -p roles/"$1"/templates

cat > roles/"$1"/tasks/main.yml <<EOF
---
- name: Check mandatory variables are defined
  assert:
    that: lookup('vars', item) or true
  with_items:
    - foo

-   debug: msg='Hello world'
EOF

echo "# $1 role" > roles/"$1"/README.md
