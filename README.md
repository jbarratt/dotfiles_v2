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

## User Guide

### tmux

I'm using [Nate's Tmux Plan](http://endot.org/2014/03/20/my-tmux-configuration-refined/).

    # @ Laptop 
    $ tmux-uber # (C-q is the hotkey)

    $ ssh remotedevbox
    $ tmux-home # C-a is the hotkey
    $ skeg connect someenv # optionally set up some shared stuff for this whole next tmux
    $ tmux-main # One per project. (C-b is the hotkey.)
    $ tmux new-session myproject

At every level you can use:

* `"`: choose window
* `'`: choose session
* `hjkl`: move to a pane using vi style directions
* `s,v`: split (vertical, horizontal

### neovim

At present I can run neovim everywhere I need to, so I've just set up configs for it.
As needed I'll add support for 'vintage' vim.

Some useful features to keep in mind (I'm still memorizing them):

* `vim-speeddating`: `C-a/C-x` to increment/decrement dates & times
* `bufonly`: `:BO` closes all but this buffer 
* `vim-eunuch`: `:Remove`, `:Move`, `:Chmod`, `:Mkdir`, `:SudoWrite`, `:SudoEdit` 
* `vim-surround`: `cs(old)(new)`, i.e. to turn `"foo"` to `'foo'`, `cs"'`
* `vim-go`: `:GoDef` goes to definition, `:GoBuild/Install/Test/Run`, `:GoCoverage`, `:GoMetaLinter`, `:GoRename`, `:GoErrCheck`, `:GoPlay`


# TODO

* tmux
* auto-update on login
