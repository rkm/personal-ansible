# personal-ansible

Ansible configuration for my dev systems

## TODO

-   Compile git with PCRE support
    -   `fatal: cannot use Perl-compatible regexes when not compiled with USE_LIBPCRE`
-   Fix timezone setting
-   Separate ~/.local/bin depending on python version. for ansible stuff need
    3.6 (though check if needed with newer OSs)
-   Auto-update for versions in vars files
-   TODOs from old repos
-   Types of install
    -   Own VM -> `g_global_install: true` # g_is_offline ignored
    -   Other VM (with network) ->
        `g_global_install: false && g_is_offline: false`
    -   Other VM (no network) -> `g_global_install: false && g_is_offline: true`
