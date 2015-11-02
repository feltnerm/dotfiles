#!/bin/bash

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

system_conf="${HOME}/.system-confs/$(hostname -s).conf"
for file in ~/.{aliases,exports,functions}; do
    [ -r "$file" ] && source "$file"
done


##
# PATHs
##

# Default Paths:
[ -d "/usr/local/bin" ] && export PATH=/usr/local/bin:$PATH
[ -d "/usr/local/sbin" ] && export PATH=/usr/local/sbin:$PATH

if _which mvim ; then
    alias vim=mvim
fi

# Default Paths (constants)


# https://github.com/kennethreitz/autoenv
if _which brew; then
    source "$(brew --prefix autoenv)/activate.sh"
fi

# python
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
    source /usr/local/bin/virtualenvwrapper.sh
fi

# rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# z
[ -f "${HOME}/bin/z" ] && source "${HOME}/bin/z"

# k
[ -f "${HOME}/bin/k" ] && source "${HOME}/bin/k"

# git-friendly
[ -f "${HOME}/bin/git-friendly" ] && export PATH=$PATH:$HOME/bin/git-friendly

##
# Custom Environment Variables
##
# Dropbox
[ -d "$HOME/Dropbox" ] && export DROPBOX=$HOME/Dropbox

# Wiki
export WIKI=$DROPBOX/vimwiki_html WIKI_SOURCE=$DROPBOX/vimwiki

# bin
[ -d "$HOME/bin" ] && export PATH=$PATH:$HOME/bin

extra="${HOME}/.extra"
[ -r "$extra" ] && [ -f "$extra" ] && source "$extra"
