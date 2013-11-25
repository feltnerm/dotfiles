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
[ -d "$HOME/bin" ] && export PATH=$PATH:$HOME/bin

# Default Paths (constants)
#
# ruby
[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"
[ -d "$HOME/.gem" ] &&  export GEM_HOME=$HOME/.gem PATH=$GEM_HOME/bin:$PATH

# go
[ -d "$HOME/.go" ] && export GOPATH=$HOME/.go

# python
[ -d "$HOME/.virtualenvs" ] && export WORKON_HOME=$HOME/.virtualenvs
[ -d "$HOME/.pystartup" ] && export PYTHONSTARTUP=${HOME}/.pystartup
[ -d "$HOME/code" ] && export PROJECT_HOME=$HOME/code
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
    source /usr/local/bin/virtualenvwrapper_lazy.sh
else
    [ -d "/usr/local/share/python" ] \
    && export VIRTUALENVWRAPPER_SCRIPT=/usr/local/share/python/virtualenvwrapper.sh \
    && source /usr/local/share/python/virtualenvwrapper_lazy.sh
fi

# node + npm
export NPM_PACKAGES=$HOME/.npm-packages
[ ! -d "$NPM_PACKAGES" ] && mkdir $NPM_PACKAGES
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH" PATH="$NPM_PACKAGES/bin/:$PATH"
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:%(manpath)"

# z
[ -f "${HOME}/bin/z" ] && source "${HOME}/bin/z"

# git-friendly
[ -f "${HOME}/bin/git-friendly" ] && export PATH=$HOME/git-friendly:$PATH

##
# Custom Environment Variables
##
# Dropbox
[ -d "$HOME/Dropbox" ] && export DROPBOX=$HOME/Dropbox

# Wiki
export WIKI=$DROPBOX/vimwiki_html WIKI_SOURCE=$DROPBOX/vimwiki

extra="${HOME}/.extra"
[ -r "$extra" ] && [ -f "$extra" ] && source "$extra"
