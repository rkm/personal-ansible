# personal-ansible

Ansible configuration for my dev systems

## Usage

### Bootstrap Script

Drop an ssh key pair onto a new VM, or use ssh-agent, and run:

```console
curl --location --silent https://raw.githubusercontent.com/rkm/personal-ansible/main/bootstrap.bash | bash
```

### Existing Install

TODO.

## Notes

-   Types of install
    -   Own VM -> `g_global_install: true` # g_is_offline ignored
    -   Other VM (with network) ->
        `g_global_install: false && g_is_offline: false`
    -   Other VM (no network) -> `g_global_install: false && g_is_offline: true`

## TODO

-   Fix timezone setting
-   Auto-update for versions in vars files
-   TODOs from old repos
-   pygrep hook - require `#changed` for any changed_when and failed_when
-   Fixup bootstrap script to work on all OS and add CI test
-   alternatives python to 39
-   version tmux and symlink to ~/bin
-   Java
-   script in ~/bin to run locally
