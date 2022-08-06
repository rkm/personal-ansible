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

sudo dnf -y install ansible ansible-collection-ansible-posix

echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/dont-ask-"$USER"-for-password > /dev/null

pushd /tmp

    curl --silent --location https://api.github.com/repos/rkm/personal-ansible/tarball > personal-ansible.tgz
    ANS_TEMP_DIR="$(mktemp -d)"
    tar xzf personal-ansible.tgz --strip 1 -C "$ANS_TEMP_DIR"

    curl --silent --location https://api.github.com/repos/rkm/dotfiles/tarball > dotfiles.tgz
    DOT_TEMP_DIR="$(mktemp -d)"
    tar xzf dotfiles.tgz --strip 1 -C "$DOT_TEMP_DIR"
    cfg="$DOT_TEMP_DIR/linux/config/ansible.cfg"

    pushd "$ANS_TEMP_DIR"
        ANSIBLE_CONFIG="$cfg" ./scripts/run_local.bash
    popd

    rm -rf \
        "$ANS_TEMP_DIR" personal-ansible.tgz \
        "$DOT_TEMP_DIR" dotfiles.tgz

popd
