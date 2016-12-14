# Dotfiles. Again.

It was late 2016. My dotfiles had drifted far from their gitish home. The IT department had informed me it was time for a new laptop. The re-dotfile-gitting was upon us.

Goals for this go-round:

* works well for multiple development environments. I'm doing more work again on remote linux machines, but still have some local macishness happening. Per machine customization and platform awareness FTW.
* Tool that can ship with the dotfiles and not have local dependencies

This time I'm giving [homemaker](https://foosoft.net/projects/homemaker/) a shot. It's written in golang, so there are compiled binaries for linux and OSX included right here in 

# How To

## Quick Bootstrap Install

Given a login to a new machine, just type:

    eval `curl https://raw.githubusercontent.com/jbarratt/dotfiles_v2/master/bin/bootstrap.sh | bash`

That's a lot of typing, so I keep it stored as an alfred snippet, so `snip boot` and it's typed.

## Manual Install

    ./install.sh
    holen source update
    nvim +PlugInstall +qall

# TODO

* tmux
* auto-update on login
