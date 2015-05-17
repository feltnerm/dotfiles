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
