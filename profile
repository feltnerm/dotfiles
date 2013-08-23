## 
#
# profile 
#
## 

##
# Utilities
##

# Check existence of a program 
_which() {
    command -v "$1" > /dev/null 2>&1;
}

# Are we sudo?
_root() {
    [ "$EUID" = "0" ]
}

# aliases
source ~/.aliases

##
# SHELL
##
if _which zsh; then
    export SHELL="$(which zsh)"
fi

##
# PAGER
##
if _which less; then
    export PAGER=less
    export LESS="-F -X -R"
fi

##
# EDITOR
##
if _which vim; then
    export EDITOR="$(which vim)"
    if _which gvim; then
        export VISUAL="gvim"
    else
        export VISUAL="$EDITOR"
    fi
fi

##
# PATHs
##

# bin
#   this should be first as I don't want my own derpy programs to be
#   overwriting some important library.
if [ -d "$HOME/bin" ]; then
    export PATH=$PATH:$HOME/bin
fi

# ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
if [ -d "$HOME/.gem" ]; then
    export GEM_HOME=$HOME/.gem
    export PATH=$GEM_HOME/bin:$PATH
fi

# go
if [ -d "$HOME/.go" ]; then
    export GOPATH=$HOME/.go
fi

# node
if [ -d "$HOME/node_modules" ]; then
    export PATH=$HOME/node_modules/.bin:$PATH
fi

# python
if [ -d "$HOME/.virtualenvs" ]; then
    export WORKON_HOME=$HOME/.virtualenvs
fi
if [ -d "$HOME/.pystartup" ]; then
    export PYTHONSTARTUP=${HOME}/.pystartup
fi
if [ -d "$HOME/Projects" ]; then
    export PROJECT_HOME=$HOME/Projects
fi
if _which virtualenvwrapper_lazy.sh; then
    source $(which virtualenvwrapper_lazy.sh)
else
    source /usr/local/share/python/virtualenvwrapper_lazy.sh
fi

if [[ -r ${HOME}/.system-confs/$(hostname -s).conf ]]; then
    source ${HOME}/.system-confs/$(hostname -s).conf;
fi;
