#!/usr/bin/env bash

set -euxo pipefail

if ! compgen -G  ~/.ssh/id_* > /dev/null && ! ssh-add -l &> /dev/null ; then
    echo Error: Need an ssh key to continue
    exit 1
fi

sudo dnf -y upgrade
sudo dnf -y install \
    curl \
    epel-release \
    tar \
&& :

sudo dnf -y install ansible

echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/dont-ask-"$USER"-for-password > /dev/null

pushd /tmp

curl --silent --location https://api.github.com/repos/rkm/personal-ansible/tarball > personal-ansible.tgz
TEMP_DIR="$(mktemp -d)"
tar xzf personal-ansible.tgz --strip 1 -C "$TEMP_DIR"

"$TEMP_DIR"/scripts/run_local.bash

cd ..
rm -rf "$TEMP_DIR" personal-ansible.tgz

popd
