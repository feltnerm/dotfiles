
_which() {
    which "$1" &>/dev/null;
}

_root() {
    [ "$EUID" = "0" ]
}

# local bin
# PATH
if [ -d "$HOME/bin" ]; then
    export PATH=$PATH:$HOME/bin
fi

# EDITOR
if _which vim; then
    export EDITOR="$(which vim)"
    export VISUAL="$EDITOR"
fi

# SHELL
if _which zsh; then
    export SHELL="$(which zsh)"
fi

export GREP_COLOR="1;33"
# PAGER
if _which less; then
    export PAGER=less

    export LESS="-F -X -R"
    export LESS_TERMCAP_mb=$'\E[01;31m'
    export LESS_TERMCAP_md=$'\E[01;31m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[01;44;33m'
    export LESS_TERMCAP_ue=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[01;32m'
fi

if [[ "$(hostname -s)" == "saraswati" ]] then
    export PATH=$PATH:$HOME/admin
fi

if [[ "$(hostname -s)" == "io" ]] then
    export PYTHONPATH=~/.local/lib/python2.7/:$PYTHONPATH
    export PATH=~/.local/bin:$PATH
fi

if [[ "$(hostname -s)" == "pioneerpete" ]] then

    # TERM
    if _which urxvtc; then
        export TERM="rxvt-unicode"
    fi

    # BROWSER 
    if _which chromium; then
        export BROWSER="$(which chromium)"
    fi
    
    # sopcast
    if _which sp-sc; then
        function sop()
        {
            sp-sc $1 3908 8908 > /dev/null &
            sleep 3;
            mplayer http://localhost:8908/tv.asf;
            killall sp-sc;
        }
    fi

fi


## DEVELOPMENT
##############

# ruby
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
if [ -d "$HOME/.gem" ]; then
    export GEM_HOME=$HOME/.gem
    export PATH=$PATH:$GEM_HOME/bin
fi
if [ -d "$HOME/.rvm" ]; then
    export PATH=$PATH:$HOME/.rvm/bin
fi

# node
if [ -d "$HOME/node_modules" ]; then
    export PATH=$PATH:$HOME/node_modules/.bin
fi

# python
if [ -d "$HOME/.virtualenvs" ]; then
    export WORKON_HOME=$HOME/.virtualenvs
fi
if [ -d "$HOME/.pystartup" ]; then
    export PYTHONSTARTUP=~/.pystartup
fi
if [ -d "$HOME/projects" ]; then
    export PROJECT_HOME=$HOME/projects
fi
if _which virtualenvwrapper_lazy.sh; then
    source $(which virtualenvwrapper_lazy.sh)
fi

source ~/.aliases
