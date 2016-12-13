
# make sure git is installed
INSTALL="apt-get"
# TODO make work with brew as well
type apt-get >/dev/null 2>&1 || INSTALL=yum
type git >/dev/null 2>&1 || sudo $INSTALL install git -y >/dev/null 2>&1

cat > ~/.bash_profile <<'ENDL'

DOTFILES=$HOME/work/dotfiles_v2

# skip if non-interactive
[[ -z "$PS1" && -n "$LOAD_OVERRIDE" ]] && return

if [ ! -d $DOTFILES ]; then
    
    echo "Cloning dotfiles..."
    git clone --quiet https://github.com/jbarratt/dotfiles_v2.git $DOTFILES

    echo "Installing dotfiles..."
    $DOTFILES/install.sh

    # bind -f ~/.inputrc
fi

## Auto-Update plumbing TBD
#    CHECK=1440 # number of minutes in 24 hours
#    DFM_STAT=$HOME/.dfm_stat
#    #    not in tmux       no previous stat          previous stat file is too old
#    if [ -z "$TMUX" ] || [ ! -e "$DFM_STAT" ] || [ -n "`find $DFM_STAT -mmin +$CHECK`" ]; then
#        echo "Running dfm umi"
#        ~/.dotfiles/bin/dfm umi
#        touch $DFM_STAT
#    fi
#fi

. ~/.bashrc
ENDL

echo "source ~/.bash_profile"
# bash -li
