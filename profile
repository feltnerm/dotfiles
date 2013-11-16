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
for file in ~/.{aliases,exports,functions,system_conf,extras}; do
    [ -r "$file" ] && source "$file"
done


##
# PATHs
##

# Default Paths (to be overriden):
#
# bin
#   this should be first as I don't want my own derpy programs to be
#   overwriting some important library.
if [ -d "$HOME/bin" ]; then
    export PATH=$PATH:$HOME/bin
fi

# Default Paths (constants)
#
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

# python
if [ -d "$HOME/.virtualenvs" ]; then
    export WORKON_HOME=$HOME/.virtualenvs
fi
if [ -d "$HOME/.pystartup" ]; then
    export PYTHONSTARTUP=${HOME}/.pystartup
fi
if [ -d "$HOME/code" ]; then
    export PROJECT_HOME=$HOME/code
fi
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
    source /usr/local/bin/virtualenvwrapper_lazy.sh
else
    if [ -d "/usr/local/share/python" ]; then
        export VIRTUALENVWRAPPER_SCRIPT=/usr/local/share/python/virtualenvwrapper.sh
        source /usr/local/share/python/virtualenvwrapper_lazy.sh
    fi
fi

##
# Custom Environment Variables
##
# Dropbox
if [ -d "$HOME/Dropbox" ]; then
    export DROPBOX=$HOME/Dropbox
fi

# Wiki
export WIKI=$DROPBOX/vimwiki_html
export WIKI_SOURCE=$DROPBOX/vimwiki
