# personal-ansible

Ansible configuration for my dev systems

## Usage

### Bootstrap Script

Drop an ssh key pair onto a new VM, or use ssh-agent, and run:

```bash
$ curl --location --silent https://raw.githubusercontent.com/rkm/personal-ansible/main/bootstrap.bash | bash
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

-   Compile git with PCRE support
    -   `fatal: cannot use Perl-compatible regexes when not compiled with USE_LIBPCRE`
-   Fix timezone setting
-   Separate ~/.local/bin depending on python version. for ansible stuff need
    3.6 (though check if needed with newer OSs)
-   Auto-update for versions in vars files
-   TODOs from old repos
-   Verify PATH ordering and no dupes
-   pygrep hook - require `#changed` for any changed_when and failed_when
-   Fixup bootstrap script to work on all OS and add CI test
