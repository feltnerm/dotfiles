for i in /etc/profile.d/*.sh ; do
    if [ -r "$i" ] ; then
        source $i
    fi
done


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
    if _which gvim; then
        export VISUAL="gvim"
    else
        export VISUAL="$EDITOR"
    fi
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

if [[ "$(hostname -s)" == "saraswati" ]]; then
    export PATH=$PATH:$HOME/admin
fi

if [[ "$(hostname -s)" == "io" ]]; then
    export PYTHONPATH=~/.local/lib/python2.7/:$PYTHONPATH
    export PATH=~/.local/bin:$PATH
fi

if [[ "$(hostname -s)" == "trotsky" ]]; then

    # TERM
    export TERM="xterm"

    # BROWSER 
    if _which chromium; then
        export BROWSER="$(which chromium)"
        #export CHROMIUM_USER_FLAGS="--disk-cache-dir=/tmp"
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

# heroku
PATH="/usr/local/heroku/bin:$PATH"
# ruby
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
if [ -d "$HOME/.gem" ]; then
    export GEM_HOME=$HOME/.gem
    export PATH=$GEM_HOME/bin:$PATH
fi
if [ -d "$HOME/.rvm" ]; then
    export PATH=$HOME/.rvm/bin:$PATH
fi

if [ -d "$HOME/.gem/ruby/1.9.1/bin" ]; then
    export PATH=$PATH:$HOME/.gem/ruby/1.9.1/bin
fi

# go
if [ -d "$HOME/.go" ]; then
    export GOPATH=$HOME/.go
fi

# node
if [ -d "$HOME/node_modules" ]; then
    export PATH=$HOME/node_modules/bin:$PATH
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
