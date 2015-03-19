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
#
# ruby
# [ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"
# [ -d "$HOME/.gem" ] &&  export GEM_HOME=$HOME/.gem PATH=$PATH:$GEM_HOME/bin

# python
[ -d "$HOME/.virtualenvs" ] && export WORKON_HOME=$HOME/.virtualenvs
[ -d "$HOME/.pystartup" ] && export PYTHONSTARTUP=$HOME/.pystartup
[ -d "$HOME/code" ] && export PROJECT_HOME=$HOME/code
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
    source /usr/local/bin/virtualenvwrapper.sh
fi

# node + npm
export NPM_PACKAGES=$HOME/.npm-packages
[ ! -d "$NPM_PACKAGES" ] && mkdir $NPM_PACKAGES
export NODE_PATH="$PATH:$NPM_PACKAGES/lib/node_modules:/usr/local/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:%(manpath)"

# go
[ -d "$HOME/.go" ] && export GOPATH="$HOME/.go"
export PATH=$PATH:$GOPATH/bin
if _which brew; then
    export GOROOT="$(brew --prefix go)/libexec"
fi
[ ! -d "$NPM_PACKAGES" ] && mkdir $NPM_PACKAGES
export PATH="$PATH:$PATH:/usr/local/opt/go/libexec/bin"


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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export DOCKER_HOST=tcp://localhost:4243
