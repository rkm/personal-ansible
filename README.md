# personal-ansible

Ansible configuration for my dev systems

## TODO

-   Compile git with PCRE support
    -   `fatal: cannot use Perl-compatible regexes when not compiled with USE_LIBPCRE`
-   gitconfig is currently duplicated in ~/.config
-   Template git sha when writing dotfiles
    -   Delete backup if only change is version
-   Fix timezone setting
-   Separate ~/.local/bin depending on python version. for ansible stuff need
    3.6 (though check if needed with newer OSs)
-   Auto-update for versions in vars files
